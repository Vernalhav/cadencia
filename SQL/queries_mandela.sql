-- 08) (Mandela) Listar os alunos que já tiveram aula com um professor com 5 ou mais denuncias
    -- Aninhada não-correlacionada
    
INSERT INTO AULA (data_aula, professor, aluno, local, duracao, valor, tipo_instrumento, forma_pagamento) VALUES (TO_DATE('2019/10/16 14:00:00', 'YYYY-MM-DD HH24:MI:SS'),'dri_zinha', 'ana.sant', 'Centro Cultural da Penha', 1, 20.5, 'BAIXO', 'DINHEIRO');
INSERT INTO AULA (data_aula, professor, aluno, local, duracao, valor, tipo_instrumento, forma_pagamento) VALUES (TO_DATE('2019/06/17 14:00:00', 'YYYY-MM-DD HH24:MI:SS'),'dri_zinha', 'marcos085', 'Centro Cultural da Penha', 1, 20.5, 'BAIXO', 'DINHEIRO');
INSERT INTO AULA (data_aula, professor, aluno, local, duracao, valor, tipo_instrumento, forma_pagamento) VALUES (TO_DATE('2019/06/18 14:00:00', 'YYYY-MM-DD HH24:MI:SS'),'tgamer', 'marcos085', 'Centro Cultural da Penha', 1, 20.5, 'CLARINETE', 'DINHEIRO');
INSERT INTO DENUNCIA (denunciado, autor, data, conteudo) VALUES ('dri_zinha', 'flavin_do_peneu', TO_TIMESTAMP('2020-01-05 14:15:21', 'YYYY-MM-DD HH24:MI:SS'), 'Aula muito ruim, nao sabe o que está falando');
INSERT INTO DENUNCIA (denunciado, autor, data, conteudo) VALUES ('dri_zinha', 'ana.sant', TO_TIMESTAMP('2020-01-05 14:15:21', 'YYYY-MM-DD HH24:MI:SS'), 'Aula muito ruim, nao sabe o que está falando');
INSERT INTO DENUNCIA (denunciado, autor, data, conteudo) VALUES ('dri_zinha', 'marcos085', TO_TIMESTAMP('2020-01-05 14:15:21', 'YYYY-MM-DD HH24:MI:SS'), 'Aula muito ruim, nao sabe o que está falando');
INSERT INTO DENUNCIA (denunciado, autor, data, conteudo) VALUES ('dri_zinha', 'mister_toby', TO_TIMESTAMP('2020-01-05 14:15:21', 'YYYY-MM-DD HH24:MI:SS'), 'Aula muito ruim, nao sabe o que está falando');
INSERT INTO DENUNCIA (denunciado, autor, data, conteudo) VALUES ('dri_zinha', 'tgamer', TO_TIMESTAMP('2020-01-05 14:15:21', 'YYYY-MM-DD HH24:MI:SS'), 'Aula muito ruim, nao sabe o que está falando');
INSERT INTO DENUNCIA (denunciado, autor, data, conteudo) VALUES ('tgamer', 'ju.pereira', TO_TIMESTAMP('2020-03-15 13:11:25', 'YYYY-MM-DD HH24:MI:SS'), 'Aula muito ruim');
INSERT INTO DENUNCIA (denunciado, autor, data, conteudo) VALUES ('tgamer', 'marcos085', TO_TIMESTAMP('2020-03-16 13:11:25', 'YYYY-MM-DD HH24:MI:SS'), 'Aula muito ruim');
INSERT INTO DENUNCIA (denunciado, autor, data, conteudo) VALUES ('tgamer', 'flavin_do_peneu', TO_TIMESTAMP('2020-04-15 13:11:25', 'YYYY-MM-DD HH24:MI:SS'), 'Aula muito ruim');
INSERT INTO DENUNCIA (denunciado, autor, data, conteudo) VALUES ('tgamer', 'mister_toby', TO_TIMESTAMP('2020-02-15 13:11:25', 'YYYY-MM-DD HH24:MI:SS'), 'Aula muito ruim');
INSERT INTO DENUNCIA (denunciado, autor, data, conteudo) VALUES ('tgamer', 'dri_zinha', TO_TIMESTAMP('2020-02-15 13:11:25', 'YYYY-MM-DD HH24:MI:SS'), 'Aula muito ruim');

SELECT DISTINCT * FROM ALUNO JOIN AULA ON ALUNO.USUARIO = AULA.ALUNO 
    WHERE AULA.PROFESSOR IN (
        SELECT DENUNCIADO AS Professor FROM DENUNCIA
            GROUP BY DENUNCIADO
            HAVING COUNT(DENUNCIADO) >= 5)
;

-- 02) (Mandela) Selecionar todos os usuários que foram a todos os eventos aos quais você comprou ingressos
    -- "DIVIDE"/JOIN
    
INSERT INTO LUGAR (nome, cidade, bairro, rua, numero, descricao) VALUES ('Flat do BCC', 'São Carlos', 'Lutfalla', 'R. Jacinto Favoreto', 301, 'Local bom para conversar e ouvir uma boa musica, e trocar ideia com o Global');
INSERT INTO LUGAR (nome, cidade, bairro, rua, numero, descricao) VALUES ('Biblioteca', 'São Carlos', 'Lutfalla', 'R. Dentro da facul', 123, 'Local bom para conversar e ouvir uma boa musica, e as vezes estudar');
INSERT INTO LUGAR (nome, cidade, bairro, rua, numero, descricao) VALUES ('Palquinho', 'São Carlos', 'Lutfalla', 'R. Dentro da USP', 69, 'Local bom para conversar e ouvir uma boa musica, e tomar bastante sol');
INSERT INTO LUGAR (nome, cidade, bairro, rua, numero, descricao) VALUES ('Bandejao', 'São Carlos', 'Lutfalla', 'R. Mei da USP', 321, 'Local bom para conversar e ouvir uma boa musica, e comer uma comida de procedência duvidosa');
INSERT INTO EVENTO (id_evento, data, lugar, organizador, lotacao, descricao) VALUES (3, TO_DATE('2020/11/27 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Flat do BCC', 'tgamer', 10, 'Venha jogar enquanto escuta uma boa musica.');
INSERT INTO EVENTO (id_evento, data, lugar, organizador, lotacao, descricao) VALUES (4, TO_DATE('2019/06/25 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Biblioteca', 'tgamer', 10, 'Venha estudar enquanto escuta uma boa musica.');
INSERT INTO EVENTO (id_evento, data, lugar, organizador, lotacao, descricao) VALUES (5, TO_DATE('2019/03/12 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Palquinho', 'tgamer', 10, 'Venha fazer nada enquanto escuta uma boa musica.');
INSERT INTO EVENTO (id_evento, data, lugar, organizador, lotacao, descricao) VALUES (6, TO_DATE('2020/03/10 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Bandejao', 'tgamer', 10, 'Venha comer enquanto escuta uma boa musica.');
INSERT INTO TIPO_INGRESSO (tipo, id_evento, total, preco, qt_disponiveis) VALUES ('PISTA', 3, 20, 50, 19);
INSERT INTO TIPO_INGRESSO (tipo, id_evento, total, preco, qt_disponiveis) VALUES ('PISTA', 4, 20, 50, 19);
INSERT INTO TIPO_INGRESSO (tipo, id_evento, total, preco, qt_disponiveis) VALUES ('PISTA', 5, 20, 50, 19);
INSERT INTO TIPO_INGRESSO (tipo, id_evento, total, preco, qt_disponiveis) VALUES ('PISTA', 6, 20, 50, 19);
INSERT INTO INGRESSO (codigo_barras, usuario, tipo_ingresso, id_evento, forma_pagamento) VALUES (568462789562, 'marcelo.almeida', 'PISTA', 2, 'BOLETO');
INSERT INTO INGRESSO (codigo_barras, usuario, tipo_ingresso, id_evento, forma_pagamento) VALUES (568462789563, 'marcelo.almeida', 'PISTA', 3, 'BOLETO');
INSERT INTO INGRESSO (codigo_barras, usuario, tipo_ingresso, id_evento, forma_pagamento) VALUES (568462789564, 'marcelo.almeida', 'PISTA', 4, 'BOLETO');
INSERT INTO INGRESSO (codigo_barras, usuario, tipo_ingresso, id_evento, forma_pagamento) VALUES (568462789565, 'marcelo.almeida', 'PISTA', 5, 'BOLETO');
INSERT INTO INGRESSO (codigo_barras, usuario, tipo_ingresso, id_evento, forma_pagamento) VALUES (568462789566, 'marcelo.almeida', 'PISTA', 6, 'BOLETO');
INSERT INTO INGRESSO (codigo_barras, usuario, tipo_ingresso, id_evento, forma_pagamento) VALUES (568462789567, 'tgamer', 'PISTA', 4, 'BOLETO');
INSERT INTO INGRESSO (codigo_barras, usuario, tipo_ingresso, id_evento, forma_pagamento) VALUES (568462789568, 'flavin_do_peneu', 'PISTA', 2, 'BOLETO');
INSERT INTO INGRESSO (codigo_barras, usuario, tipo_ingresso, id_evento, forma_pagamento) VALUES (568462789569, 'dri_zinha', 'PISTA', 3, 'BOLETO');
INSERT INTO INGRESSO (codigo_barras, usuario, tipo_ingresso, id_evento, forma_pagamento) VALUES (568462789572, 'dri_zinha', 'PISTA', 2, 'BOLETO');
INSERT INTO INGRESSO (codigo_barras, usuario, tipo_ingresso, id_evento, forma_pagamento) VALUES (568462789570, 'shaolin.matador', 'PISTA', 3, 'BOLETO');
INSERT INTO INGRESSO (codigo_barras, usuario, tipo_ingresso, id_evento, forma_pagamento) VALUES (568462789571, 'ana.sant', 'PISTA', 3, 'BOLETO');

SELECT DISTINCT INGRESSO_NUM.USUARIO FROM (SELECT DISTINCT INGRESSO.USUARIO, INGRESSO.ID_EVENTO FROM INGRESSO) INGRESSO_NUM 
    JOIN(SELECT DISTINCT INGRESSO.ID_EVENTO FROM INGRESSO WHERE USUARIO = 'ana.sant') INGRESSO_DIV
    ON INGRESSO_NUM.ID_EVENTO = INGRESSO_DIV.ID_EVENTO
    WHERE INGRESSO_NUM.USUARIO != 'ana.sant'
    GROUP BY INGRESSO_NUM.USUARIO
    HAVING COUNT(*) = (SELECT DISTINCT COUNT(*) FROM INGRESSO WHERE USUARIO = 'ana.sant')
;