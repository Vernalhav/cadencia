import cx_Oracle  
import settings

def create_connection():
    dsnStr = cx_Oracle.makedsn(settings.DATABASE_URL, settings.DATABASE_URL_PORT, settings.DATABASE_SID)

    con = cx_Oracle.connect(user=settings.USER, password=settings.PASSWORD, dsn=dsnStr)
    return con

def search(con, search_string):
    cur = con.cursor() 
    try:
        cur.execute(search_string)
        ret = [ result for result in cur  ]
        cur.close()
        return ret
    except cx_Oracle.Error as error:
        print('Error occurred:')
        print(error)
        rue.close()
        return 'ERRO'
    except:
        return 'ERRO'

    return None

def insert_instrumento(con, tipo, cla):
    cur = con.cursor()
    ret = 0

    sql_query_int = 'INSERT INTO CLASSIFICACAO_INSTRUMENTO(tipo, classificacao) VALUES (:tipo,:cla)'
    

    try:
        cur.execute(sql_query_int,[tipo,cla])
        con.commit()
        
    except cx_Oracle.Error as error:
        print('Error occurred:')
        print(error)
        ret = -1
    except:
        return -1
    cur.close()

    return ret

def insert_instrumento_tocados(con,  professor, tipo_instrumento):
    cur = con.cursor()
    ret = 0

    sql_query_int = 'INSERT INTO INSTRUMENTOS_TOCADOS (professor, tipo_instrumento) VALUES (:professor, :tipo_instrumento)'
    

    try:
        cur.execute(sql_query_int,[professor,tipo_instrumento])
        con.commit()
        
    except cx_Oracle.Error as error:
        print('Error occurred:')
        print(error)
        ret = -1

    cur.close()

    return ret

def close_connection(con):
    con.close()

if __name__ == "__main__":
    search_string = 'SELECT * FROM INSTRUMENTOS_TOCADOS'

    con = create_connection()
    ret = insert_instrumento_tocados(con,'tgamer','TUBA')
    print(ret)

    rett = search(con, search_string)
    for i in rett:
        print(i)

    close_connection(con)
