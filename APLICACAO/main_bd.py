import banco as bd
from math import ceil

'''
Esta funcao realiza o processo de inserir um novo tipo de instrumento
@PARAMETROS
    con - o objeto de conexao com o banco
'''
def inserir_tipo_instrumento(connection):

    ## Lendo o novo tipo de instrumento
    tipo = ""
    tipo_valido = False

    while(not tipo_valido):

        print("Insira o nome do novo tipo de instrumento, seu tamanho maximo eh 30:")
        tipo = str(input())
        len_tipo = len(tipo)
        #tamanho maximo de um tipo de instrumento eh 30
        if(len_tipo > 0 and len_tipo <= 30 ):
            tipo_valido = True
        else:
            print("Insira um nome de tipo valido")

    ## Lendo a classificacao do novo tipo
    classificacao = ""
    classificacao_valido = False

    while(not classificacao_valido):

        print("Insira a classificacao do novo instrumento, seu tamanho maximo eh 30:")
        classificacao = str(input())
        len_classificacao = len(classificacao)
        #tamanho maximo de uma classificacao eh 30
        if(len_classificacao > 0 and len_classificacao <= 30 ):
            classificacao_valido = True
        else:
            print("Insira uma classificacao valida")
    
    ## Chamando a funcao de banco.py, que insere no banco de dados
    ret = str(bd.insert_instrumento(connection, tipo, classificacao))
    
    ## informando se a insercao foi bem sucedida ou nao, e se nao, informando o porque
    if ret == "0":
        print("Novo instrumento Inserido com Sucesso.")
        print("Aperte <Enter> para continuar...")
        input()
    elif ret[11:17] == "unique": 
        print("Tipo de Instrumento que tentou inserir ja existe no banco de dados.")
        print("Aperte <Enter> para continuar...")
        input()
    else:
        print("Erro Interno do Banco, tente mais tarde.")
        print("Aperte <Enter> para continuar...")
        input()

'''
Esta funcao realiza o processo de mostrar todos os professores cadastrados ao usuario
@PARAMETROS
    con - o objeto de conexao com o banco
'''
def listar_professores(connection):
    # Chamando a funcao de banco.py que realiza a consulta ao banco
    lista_professores = bd.buscar_professores(connection)
    # tratando os erros e excessoes
    if lista_professores == 'ERRO':
        print("Erro ao buscar os professores, tente mais tarde")
        print("Aperte <Enter> para continuar...")
        input()
        return -1
    
    if len(lista_professores) == 0:
        print("Nenhum professor cadastrado")
        print("Aperte <Enter> para continuar...")
        input()
        return 0
    
    ## Para melhor visualizacao, os professores sao mostrados de 5 em 5, formando uma pagina, e o usuario podendo navegar pelas paginas
    ## esta logica eh implementada abaixo
    pagina = 0
    tamanho_pagina = 5
    numero_paginas = ceil(len(lista_professores)/tamanho_pagina)

    while(True):
        print("")
        print("Tabela de todos os Professores")
        print("Professores de " + str(pagina*tamanho_pagina+1) + " a " + str((pagina+1)*tamanho_pagina) + ", pagina " + str(pagina+1) + ".")
        print("")
        print('{} | {}'.format( "NOME_DE_LOGIN".ljust(20), "NOME".ljust(20)))
        print("-----------------------------------------------")
        for i in range(tamanho_pagina):
            if pagina*tamanho_pagina + i < len(lista_professores):
                professor = lista_professores[ pagina*tamanho_pagina + i]
                nome_login = str(professor[0])
                nome = str(professor[1])
                print('{} | {}'.format( nome_login.ljust(20), nome.ljust(20)))
        print("-----------------------------------------------")
        opcao = 0
        while(True):
            print("OPCOES:")
            # se nao eh a primeira pagina
            if pagina > 0:
                print("1 - Pagina Anterior")
            # se nao eh a ultima pagina
            if pagina < numero_paginas - 1:
                print("2 - Proxima Pagina")

            print("3 - Parar de Listar")
            print("Insira o numero da opcao desejada.")

            try:
                opcao = int(input())
            except:
                opcao = 0

            if (pagina > 0 and opcao == 1) or (pagina < numero_paginas-1 and opcao == 2) or opcao == 3:
                break

        if opcao == 1:
            pagina = pagina - 1
        elif opcao == 2:
            pagina = pagina + 1
        elif opcao == 3:
            break
    
    return 0

'''
Esta funcao realiza o processo de mostrar todos os professores que tocam todos os intrumentos de uam determinada classificacao ao usuario
@PARAMETROS
    con - o objeto de conexao com o banco
'''
def listar_consulta_1(connection):

    # lendo a classificacao ao qual queremos saber os professores que tocam todos os intrumentos dela.
    classificacao = ""
    classificacao_valido = False

    while(not classificacao_valido):

        print("Insira a classificacao ao qual quer listar os professores que tocam todos os tipos de instrumento dela:")
        classificacao = str(input())
        len_classificacao = len(classificacao)

        if(len_classificacao > 0 and len_classificacao <= 30 ):
            classificacao_valido = True
        else:
            print("Insira uma classificacao valida")
    
    # Chamando a funcao de banco.py que realiza a consulta ao banco
    lista_professores = bd.buscar_consulta_1(connection, classificacao)

    # tratando os erros e excessoes
    if lista_professores == 'ERRO':
        print("Erro ao realizar a busca, tente mais tarde")
        print("Aperte <Enter> para continuar...")
        input()
        return -1

    elif lista_professores == 'CLASSIFICACAO NAO EXISTE':
        print("Classificacao nao existe, adicione um Tipo de Instrumento que tenha a classificacao para ela passar a existir.")
        print("Aperte <Enter> para continuar...")
        input()
        return 0

    if len(lista_professores) == 0:
        print("Nao ha nenhum professor que toque todos os instrumentos desta categoria")
        print("Aperte <Enter> para continuar...")
        input()
        return 0

    print("Numero de Instrumentos nesta categoria: " + str(lista_professores[0][1]) )

    ## Para melhor visualizacao, os professores sao mostrados de 5 em 5, formando uma pagina, e o usuario podendo navegar pelas paginas,
    ## esta logica eh implementada abaixo
    pagina = 0
    tamanho_pagina = 5
    numero_paginas = ceil(len(lista_professores)/tamanho_pagina)

    while(True):
        print("")
        print("Tabela de Professores que tocam todos os intrumentos da categoria " + classificacao + ".")
        print("Professores de " + str(pagina*tamanho_pagina+1) + " a " + str((pagina+1)*tamanho_pagina) + ", pagina " + str(pagina+1) + ".")
        print("")
        print('{}'.format( "NOME_DE_LOGIN".ljust(20)))
        print("-----------------------------------------------")
        for i in range(tamanho_pagina):
            if pagina*tamanho_pagina + i < len(lista_professores):
                professor = lista_professores[ pagina*tamanho_pagina + i]
                nome_login = str(professor[0])
                print('{}'.format( nome_login.ljust(20)))
        print("-----------------------------------------------")
        opcao = 0
        while(True):
            print("OPCOES:")
            if pagina > 0:
                print("1 - Pagina Anterior")
            if pagina < numero_paginas - 1:
                print("2 - Proxima Pagina")

            print("3 - Parar de Listar")
            print("Insira o numero da opcao desejada.")

            try:
                opcao = int(input())
            except:
                opcao = 0

            if (pagina > 0 and opcao == 1) or (pagina < numero_paginas-1 and opcao == 2) or opcao == 3:
                break

        if opcao == 1:
            pagina = pagina - 1
        elif opcao == 2:
            pagina = pagina + 1
        elif opcao == 3:
            break
    
    return 0

'''
Esta funcao realiza o processo de inserir um novo instrumento tocado por um professor
@PARAMETROS
    con - o objeto de conexao com o banco
'''
def inserir_instrumento_tocado_por_professor(connection):
    
    # Vendo se o usuario deseja listar os professores, ja que eh uma informcacao necessaria nesta insercao
    # Se sim, chama a funcao listar_professores(), definida acima
    print("deseja listar os professores cadastrados? Insira \"Sim\" ou \"Nao\"")
    while(True):

        listar = str(input())

        if listar == "Sim":
            ret = listar_professores(connection)
            if ret == -1:
                return

            break
        elif listar == "Nao":
            break
        else:
            print("Insira \"Sim\" ou \"Nao\"")
        
    ## Lendo o nome de login do professor
    professor = ""
    professor_valido = False

    while(not professor_valido):

        print("Insira o nome de login do professor que quer adicionar um novo tipo de instrumento tocado:")
        professor = str(input())
        len_professor = len(professor)
        ## O tamanho maximo de um nome de login eh 50
        if(len_professor > 0 and len_professor <= 50 ):
            professor_valido = True
        else:
            print("Insira um nome de login valido. O tamanho maximo de um nome de login eh 50 caracteres")

    ## Lendo o tipo que o professor toca
    tipo = ""
    tipo_valido = False

    while(not tipo_valido):

        print("Insira o tipo de instrumento tocado, seu tamanho maximo eh 30:")
        tipo = str(input())
        len_tipo = len(tipo)
        ## O tamanho maximo de um tipo eh 30
        if(len_tipo > 0 and len_tipo <= 30 ):
            tipo_valido = True
        else:
            print("Insira um tipo valido")

    ## Chamando a funcao de banco.py, que insere no banco de dados
    ret = str(bd.insert_instrumento_tocados(connection,  professor, tipo))

    ## informando se a insercao foi bem sucedida ou nao, e se nao, informando o porque
    if ret == "0":
        print("Adicionado o instrumento tocado pelo professor com sucesso.")
        print("Aperte <Enter> para continuar...")
        input()
    elif ret[11:17] == "unique":  
        print("Ja foi cadastrado que este professor toca o tipo de instrumento informado.")
        print("Aperte <Enter> para continuar...")
        input()
    elif ret[11:20] == "integrity":
        print("Professor ou Tipo Inexistentes no banco de dados.")
        print("Aperte <Enter> para continuar...")
        input()
    else:
        print("Erro Interno do Banco, tente mais tarde.")
        print("Aperte <Enter> para continuar...")
        input()
        
#Funcao principal da aplicacao cadencia
def main():

    connection = bd.create_connection()

    print("BOAS VINDAS, esse eh o cadencia")
    ## Loop principal
    while(True):
        ## Printando o menu e lendo a opcao desejada
        opcao_valida = False
        opcao = 0
        print("Opcoes Para acesso ao banco:")
        print("     1 - Inserir Tipo de Instrumento.")
        print("     2 - Inserir um novo Instrumento que um Professor Toca.")
        print("     3 - Listar Professores.")
        print("     4 - Lista os professores que tocam todos os tipos de instrumento de uma determinada classificacao")
        print("     5 - Sair")
        print("Insira o numero da opcao desejada.")
        while(not opcao_valida):
            
            try:
                opcao = int(input())

            except:
                opcao = 0
            
            if opcao >= 1 and opcao <= 5:
                opcao_valida = True
            else:
                print("Insira uma opcao valida")
        
        if opcao == 1:
            inserir_tipo_instrumento(connection)

        elif opcao == 2:
            inserir_instrumento_tocado_por_professor(connection)
        elif opcao == 3:
            listar_professores(connection)
        elif opcao == 4:
            listar_consulta_1(connection)
        elif opcao == 5:
            break

    bd.close_connection(connection)

if __name__ == "__main__":
    
    main()
