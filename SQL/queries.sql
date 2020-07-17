
-- 01) Listar todos os professores que ensinam todos os instrumentos de uma categoria
SELECT PROFESSOR, COUNT(*) FROM INSTRUMENTOS_TOCADOS 
    JOIN ( SELECT TIPO FROM CLASSIFICACAO_INSTRUMENTO WHERE CLASSIFICACAO = 'DIGITAL') TIPO_INST_CLAS 
    ON TIPO_INST_CLAS.TIPO = INSTRUMENTOS_TOCADOS.TIPO_INSTRUMENTO
    GROUP BY PROFESSOR
    HAVING COUNT(*) = (SELECT COUNT(*) FROM CLASSIFICACAO_INSTRUMENTO WHERE CLASSIFICACAO = 'DIGITAL');


-- 02) Selecionar todos os usuários que foram a todos os eventos aos quais 'ana.sant' comprou ingressos
SELECT DISTINCT INGRESSO_NUM.USUARIO FROM (SELECT DISTINCT INGRESSO.USUARIO, INGRESSO.ID_EVENTO FROM INGRESSO) INGRESSO_NUM 
    JOIN(SELECT DISTINCT INGRESSO.ID_EVENTO FROM INGRESSO WHERE USUARIO = 'ana.sant') INGRESSO_DIV
    ON INGRESSO_NUM.ID_EVENTO = INGRESSO_DIV.ID_EVENTO
    WHERE INGRESSO_NUM.USUARIO != 'ana.sant'
    GROUP BY INGRESSO_NUM.USUARIO
    HAVING COUNT(*) = (SELECT DISTINCT COUNT(*) FROM INGRESSO WHERE USUARIO = 'ana.sant');


-- 03) Buscar os usuários que são professores ou proprietários que nunca foram denunciados.
SELECT USUARIO_NAO_DEN.USUARIO AS USUARIO FROM ((SELECT NOME_LOGIN AS USUARIO FROM USUARIO)
    MINUS (SELECT DENUNCIADO AS USUARIO FROM DENUNCIA)) USUARIO_NAO_DEN
    JOIN ((SELECT USUARIO AS USUARIO FROM PROFESSOR)
    UNION (SELECT USUARIO AS USUARIO FROM PROPRIETARIO)) PROF_OU_PROP ON USUARIO_NAO_DEN.USUARIO = PROF_OU_PROP.USUARIO;


-- 04) Listar todos os eventos em ordem decrescente de lucro por venda de ingressos
SELECT e.id_evento, e.lugar, e.data, SUM(ti.preco) AS "FATURAMENTO" FROM evento e
        JOIN tipo_ingresso ti ON e.id_evento = ti.id_evento
        JOIN ingresso i ON ti.tipo = i.tipo_ingresso AND ti.id_evento = i.id_evento
    GROUP BY e.id_evento, e.lugar, e.data
    ORDER BY SUM(ti.preco) DESC;


-- 05) Dado uma classificação de um instrmento, listar o(s) proprietário(s) com maior média de avaliação
-- dessa classificação. (Ex: o proprietário com o maior média de avaliações de instrumentos de cordas)
SELECT NOME_PROP, MEDIA_CLASSIFICACAO, N_ALUGUEIS FROM PROPRIETARIO P
    JOIN (SELECT A.instrumento_dono AS NOME_PROP, AVG(A.avaliacao_prop) AS MEDIA_CLASSIFICACAO, COUNT(*) AS N_ALUGUEIS,
            MAX(AVG(A.avaliacao_prop)) OVER () AS MAX_MEDIA
            FROM ALUGUEL A
        JOIN INSTRUMENTO I ON A.instrumento_nome = I.nome AND A.instrumento_dono = I.proprietario
        JOIN CLASSIFICACAO_INSTRUMENTO CI ON I.tipo = CI.tipo AND CI.classificacao = 'SOPRO'
        GROUP BY A.instrumento_dono
    ) ON P.usuario = NOME_PROP
    WHERE MEDIA_CLASSIFICACAO = MAX_MEDIA;


-- 06) Selecionar para cada usuário, nomedelogin, e caso já tenha feito alguma aula mostra a aula feita e ordenar por preço de aula,
-- além de mostrar a forma de pagamento da aula, e caso seja por cartão, mostrar o numero do cartao.
SELECT U.nome_login, A.data_aula, P.nome as PROFESSOR, A.valor, A.forma_pagamento, C.numero FROM USUARIO U
    LEFT JOIN AULA A ON A.aluno = U.nome_login
    LEFT JOIN USUARIO P ON A.professor = P.nome_login
    LEFT JOIN CARTAO C ON C.usuario = U.nome_login AND A.forma_pagamento = 'CARTAO'
    ORDER BY U.nome, A.valor DESC;


-- 07) Selecionar, dado um organizador, a soma de valor em dinheiro de todos os ingressos que ele vendeu, separado pela forma de
-- pagamento e pelo evento. Deve ser mostrado a forma de pagamento e o nome do evento que pertence o valor, ordenado pelo nome do evento
-- e sub ordenado pela forma de pagamento.
SELECT EVENTO.ID_EVENTO, FORMA_PAGAMENTO, SUM(PRECO) AS VALOR FROM EVENTO 
    JOIN TIPO_INGRESSO ON EVENTO.ID_EVENTO = TIPO_INGRESSO.ID_EVENTO
    JOIN INGRESSO ON INGRESSO.ID_EVENTO = TIPO_INGRESSO.ID_EVENTO AND INGRESSO.TIPO_INGRESSO = TIPO_INGRESSO.TIPO
    WHERE ORGANIZADOR = 'tgamer'
    GROUP BY EVENTO.ID_EVENTO, FORMA_PAGAMENTO;
    

-- 08) Listar os alunos que já tiveram aula com um professor com 5 ou mais denuncias
SELECT DISTINCT * FROM ALUNO JOIN AULA ON ALUNO.USUARIO = AULA.ALUNO 
    WHERE AULA.PROFESSOR IN (
        SELECT DENUNCIADO AS Professor FROM DENUNCIA
            GROUP BY DENUNCIADO
            HAVING COUNT(DENUNCIADO) >= 5);
        

-- 09) Listar o CPF, nome de login e avaliação dos usuários que estão envolvidos em um aluguel ativo no momento, isto é, data_emprestimo < data atual < data_devolução.
SELECT DISTINCT NOME_LOGIN, CPF, NOME FROM USUARIO
    JOIN ALUGUEL ON USUARIO.NOME_LOGIN = ALUGUEL.LOCATARIO OR USUARIO.NOME_LOGIN = ALUGUEL.INSTRUMENTO_DONO
    WHERE ALUGUEL.DATA_EMPRESTIMO < SYSDATE AND SYSDATE < DATA_DEVOLUCAO; 


-- 10) Buscar os eventos que venderam menos ingressos que a média dos ingressos vendidos dos eventos que ocorreram no mesmo lugar.
SELECT e.id_evento, e.data, e.lugar, i.NUMERO_INGRESSOS FROM evento e
    JOIN
        (SELECT ing.id_evento, COUNT(*) AS NUMERO_INGRESSOS FROM ingresso ing
            GROUP BY ing.id_evento) i ON e.id_evento = i.id_evento
    JOIN
        (SELECT LUGAR, (COUNT(*)/COUNT(DISTINCT E2.ID_EVENTO)) AS NUMERO_MEDIO_INGRESSOS FROM EVENTO E2
                JOIN INGRESSO ON E2.ID_EVENTO = INGRESSO.ID_EVENTO
            GROUP BY LUGAR) lmi ON e.lugar = lmi.lugar
    WHERE i.NUMERO_INGRESSOS < lmi.NUMERO_MEDIO_INGRESSOS;