import cx_Oracle  
import settings

'''
Esta funcao cria uma conexao com o banco de dados Oracle remoto, as informacoes sobre banco, como usuario e url, estao definidas em settings
@RETORNO
    con - um objeto de conexao com o banco
'''
def create_connection():
    dsnStr = cx_Oracle.makedsn(settings.DATABASE_URL, settings.DATABASE_URL_PORT, settings.DATABASE_SID)

    con = cx_Oracle.connect(user=settings.USER, password=settings.PASSWORD, dsn=dsnStr)
    return con

'''
Esta funcao faz uma busca qualquer no banco de dados
@PARAMETROS
    con - o objeto de conexao com o banco
    search_string - comando sql da busca no formato de string
    parameters - array de parametros para preencher a string do comando sql
@RETORNO
    Em caso de sucesso na busca, retornara o resultado da busca no formato de uma lista de tuplas,
    Em caso de falha na busca, retornara 'ERRO' 
'''
def search(con, search_string, parameters=[]):
    cur = con.cursor() 
    try:
        cur.execute(search_string,parameters)
        ret = [ result for result in cur  ]
        cur.close()
        return ret
 
    except cx_Oracle.Error as error:
        cur.close()
        return 'ERRO'
 
    except:
        return 'ERRO'

    return None

'''
Esta funcao faz a insercao de um novo tipo de instrumento no banco de dados
@PARAMETROS
    con - o objeto de conexao com o banco
    tipo - novo tipo de instrumento que se vai adicionar
    cla - classificacao do novo instrumento
@RETORNO
    Em caso de sucesso na insercao, retornara 0
    Em caso de falha na busca, se a falha ocasionada ser um erro do cx_Oracle, retornara 
    um objeto de erro do tipo cx_Oracle.Error, pode-se transforma-lo em string para ver a mensagem de erro
    Em caso de falha na busca ocasionada por um erro de outra natureza, retornara -1
'''
def insert_instrumento(con, tipo, cla):
    cur = con.cursor()
    ret = 0

    sql_query_int = 'INSERT INTO CLASSIFICACAO_INSTRUMENTO(tipo, classificacao) VALUES (:tipo,:cla)'

    try:
        cur.execute(sql_query_int,[tipo,cla])
        con.commit()
        
    except cx_Oracle.Error as error:
        ret = error
   
    except:
        return -1

    cur.close()
    return ret

'''
Esta funcao faz a insercao de um novo instrumento tocado por um professor
@PARAMETROS
    con - o objeto de conexao com o banco
    professor - professor ao qual quer adicionar um novo instrumento tocado
    tipo_instrumento - tipo de instrumento que o professor quer cadastrar que toca
@RETORNO
    Em caso de sucesso na insercao, retornara 0
    Em caso de falha na busca, se a falha ocasionada ser um erro do cx_Oracle, retornara 
    um objeto de erro do tipo cx_Oracle.Error, pode-se transforma-lo em string para ver a mensagem de erro
    Em caso de falha na busca ocasionada por um erro de outra natureza, retornara -1
'''
def insert_instrumento_tocados(con,  professor, tipo_instrumento):
    cur = con.cursor()
    ret = 0

    sql_query_int = 'INSERT INTO INSTRUMENTOS_TOCADOS (professor, tipo_instrumento) VALUES (:professor, :tipo_instrumento)'
    
    try:
        cur.execute(sql_query_int,[professor,tipo_instrumento])
        con.commit()
        
    except cx_Oracle.Error as error:
        ret = error

    cur.close()

    return ret

'''
Esta funcao busca o nome de login e o nome de todos os professores
@PARAMETROS
    con - o objeto de conexao com o banco
@RETORNO
    Em caso de sucesso na busca, retornara o resultado da busca no formato de uma lista de tuplas,
    Em caso de falha na busca, retornara 'ERRO' 
'''
def buscar_professores(con):
    sql_query = 'SELECT U.nome_login, U.nome FROM USUARIO U JOIN PROFESSOR P ON P.usuario = U.nome_login'
    return search(con, sql_query)

'''
Esta funcao busca os professores que tocam todos os intrumentos de uam determinada classificacao de instrumentos.
@PARAMETROS
    con - o objeto de conexao com o banco
    classificacao - classificacao ao qual queremos saber os professores que tocam todos os intrumentos dela.
@RETORNO
    Em caso de sucesso na busca, retornara o resultado da busca no formato de uma lista de tuplas,
    Em caso de falha na busca, retornara 'ERRO' 
'''
def buscar_consulta_1(con,classificacao):
    #pesquisando no banco se o evento existe
    sql_query = 'SELECT * FROM CLASSIFICACAO_INSTRUMENTO WHERE CLASSIFICACAO = :classificacao'
    ret = search(con,sql_query,[classificacao])

    if len(ret) == 0:
        return 'CLASSIFICACAO NAO EXISTE'

    sql_query = '''SELECT PROFESSOR, COUNT(*) FROM INSTRUMENTOS_TOCADOS 
    JOIN ( SELECT TIPO FROM CLASSIFICACAO_INSTRUMENTO WHERE CLASSIFICACAO = :classificacao) TIPO_INST_CLAS 
    ON TIPO_INST_CLAS.TIPO = INSTRUMENTOS_TOCADOS.TIPO_INSTRUMENTO
    GROUP BY PROFESSOR
    HAVING COUNT(*) = (SELECT COUNT(*) FROM CLASSIFICACAO_INSTRUMENTO WHERE CLASSIFICACAO = :classificacao)
    '''
    return search(con,sql_query,[classificacao,classificacao])

'''
Esta funcao fecha uma conexao com o banco de dados
@PARAMETROS
    con - o objeto de conexao com o banco
'''
def close_connection(con):
    con.close()



if __name__ == "__main__":

    con = create_connection()
    insert_instrumento_tocados(con,'tgamer','TUBA')

    search_string = "SELECT * FROM CLASSIFICACAO_INSTRUMENTO WHERE CLASSIFICACAO = 'DIGITAL'"
    
    rett = search(con,search_string)
    for i in rett:
        print(i)

    rett = buscar_consulta_1(con,"SOPRO2")
    print(rett)

    close_connection(con)