-- 05) Dado uma classificação de um instrmento, listar o(s) proprietário(s) com maior média de avaliação
-- dessa classificação. (Ex: o proprietário com o maior média de avaliações de instrumentos de cordas)

INSERT INTO INSTRUMENTO VALUES ('Ocarina Do Tempo', 'mister_toby', 'Y', 'OCARINA');
INSERT INTO INSTRUMENTO VALUES ('Flauta de Domar Cobras', 'mister_toby', 'Y', 'FLAUTA TRANSVERSAL');
INSERT INTO INSTRUMENTO VALUES ('Epic Sax', 'mister_toby', 'Y', 'SAXOFONE');
INSERT INTO INSTRUMENTO VALUES ('Clarinete do Lula Molusco', 'mister_toby', 'Y', 'CLARINETE');

INSERT INTO ALUGUEL VALUES ('Ocarina Do Tempo', 'mister_toby', 'ana.sant', TO_DATE('2019/03/04 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019/03/09 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 5.0, 5.0, 'DINHEIRO');
INSERT INTO ALUGUEL VALUES ('Flauta de Domar Cobras', 'mister_toby', 'ana.sant', TO_DATE('2019/03/04 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019/03/09 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 5.0, 5.0, 'DINHEIRO');
INSERT INTO ALUGUEL VALUES ('Epic Sax', 'mister_toby', 'ana.sant', TO_DATE('2019/03/04 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019/03/09 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1.0, 1.0, 'DINHEIRO');
INSERT INTO ALUGUEL VALUES ('Clarinete do Lula Molusco', 'mister_toby', 'ana.sant', TO_DATE('2019/03/04 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019/03/09 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 5.0, 5.0, 'DINHEIRO');
INSERT INTO ALUGUEL VALUES ('Sintetizador roubado do Daft Punk', 'mister_toby', 'ana.sant', TO_DATE('2019/03/04 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019/03/09 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0, 0, 'DINHEIRO');


SELECT NOME_PROP, MEDIA_CLASSIFICACAO, N_ALUGUEIS FROM PROPRIETARIO P
    JOIN (SELECT A.instrumento_dono AS NOME_PROP, AVG(A.avaliacao_prop) AS MEDIA_CLASSIFICACAO, COUNT(*) AS N_ALUGUEIS,
            MAX(AVG(A.avaliacao_prop)) OVER () AS MAX_MEDIA
            FROM ALUGUEL A
        JOIN INSTRUMENTO I ON A.instrumento_nome = I.nome AND A.instrumento_dono = I.proprietario
        JOIN CLASSIFICACAO_INSTRUMENTO CI ON I.tipo = CI.tipo AND CI.classificacao = 'SOPRO'
        GROUP BY A.instrumento_dono
    ) ON P.usuario = NOME_PROP
    WHERE MEDIA_CLASSIFICACAO = MAX_MEDIA;


-- 06) Selecionar para cada usuário, nome, e caso já tenha feito alguma aula mostra a aula feita e ordenar por preço de aula,
-- além de mostrar a forma de pagamento da aula e nome do professor, e caso seja por cartão, mostrar o numero do cartao.
INSERT INTO AULA VALUES (TO_DATE('2020/06/30 10:00:00', 'YYYY-MM-DD HH24:MI:SS'),'mister_toby', 'marcos085', 'Centro Da Cultural do Games', 1, 50.0, 'TECLADO', 'DINHEIRO');
INSERT INTO AULA VALUES (TO_DATE('2020/07/30 10:00:00', 'YYYY-MM-DD HH24:MI:SS'),'dri_zinha', 'mister_toby', 'Centro Da Cultural do Games', 3, 61.50, 'CAVAQUINHO', 'BOLETO');

SELECT U.nome_login, A.data_aula, P.nome as PROFESSOR, A.valor, A.forma_pagamento, C.numero FROM USUARIO U
    LEFT JOIN AULA A ON A.aluno = U.nome_login
    LEFT JOIN USUARIO P ON A.professor = P.nome_login
    LEFT JOIN CARTAO C ON C.usuario = U.nome_login AND A.forma_pagamento = 'CARTAO'
    ORDER BY U.nome, A.valor DESC;
    