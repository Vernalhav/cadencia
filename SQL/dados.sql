 -- DADOS USUARIOS
 
INSERT INTO USUARIO (nome_login, CPF, cidade, bairro, rua, numero, complemento, nome, senha) VALUES ('marcos085', '954.748.392-78', 'Xapuri', 'Centro', 'R João Barbosa', 55, 'APTO-23', 'Marcos da Rocha', 'ma32rocha55');    
INSERT INTO USUARIO (nome_login, CPF, cidade, bairro, rua, numero, nome, senha) VALUES ('dri_zinha', '663.180.122-22', 'Porto Acre', 'Vila do Vila', 'Av Rui Coelho', 135, 'Adriana da Silva Pereira', 'dridri22');    
INSERT INTO USUARIO (nome_login, CPF, cidade, bairro, rua, numero, nome, senha) VALUES ('flavin_do_peneu', '775.968.932-28', 'Xapuri', 'Centro', 'R João Barbosa', 15, 'Flavio Augusto', 'pneu775fla');    
INSERT INTO USUARIO (nome_login, CPF, cidade, bairro, rua, numero, nome, senha) VALUES ('tgamer', '710.181.532-41', 'Santa Rosa do Purus', 'Cidade Nova', 'Rua Coronel Jose Ferreira', 500, 'Afonso Gamer', 'lolol555');    
INSERT INTO USUARIO (nome_login, CPF, cidade, bairro, rua, numero, complemento, nome, senha) VALUES ('marcelo.almeida', '462.555.332-63', 'Assis Brasil', 'Cascata', 'R Raimundo Chaar', 168, 'APTO-82', 'Marcelo Almeida', 'maalmeidaa');    
INSERT INTO USUARIO (nome_login, CPF, cidade, bairro, rua, numero, nome, senha) VALUES ('ana.sant', '992.573.372-35', 'Feijo', 'Bela Vista', 'R Joel Ferreira Souza', 80, 'Ana Santana', 'ana99ss');    
INSERT INTO USUARIO (nome_login, CPF, cidade, bairro, rua, numero, complemento, nome, senha) VALUES ('shaolin.matador', '776.347.342-84', 'Xapuri', 'Centro', 'R João Barbosa', 55, 'APTO-23', 'Marcos da Rocha', 'ma32rocha55');    
INSERT INTO USUARIO (nome_login, CPF, cidade, bairro, rua, numero, nome, senha) VALUES ('ju.pereira', '229.078.032-47', 'Mancio Lima', 'Bandeirante', 'R Camilo Galdino Ribeiro', 26, 'Juliana Pereira', 'Lima1312');

 -- DADOS CONTA

INSERT INTO CONTA (usuario, agencia, conta_corrente, banco) VALUES ('dri_zinha', '5623', '586423-8', 'SANTANDER BANESPA');
INSERT INTO CONTA (usuario, agencia, conta_corrente, banco) VALUES ('tgamer', '1623', '686423-2', 'SANTANDER BANESPA');
INSERT INTO CONTA (usuario, agencia, conta_corrente, banco) VALUES ('ana.sant', '1256', '16023-2', 'BCO ITAU S/A ');
INSERT INTO CONTA (usuario, agencia, conta_corrente, banco) VALUES ('shaolin.matador', '5623-5', '21642362-4', 'BCO DO BRASIL S/A');

 -- DADOS CARTAO
INSERT INTO CARTAO (usuario, numero, CVV, validade, proprietario) VALUES ('marcos085', '5320243172355628', 950, '04/21', 'Marcos da Rocha');
INSERT INTO CARTAO (usuario, numero, CVV, validade, proprietario) VALUES ('dri_zinha', '4929960244841321', 525, '12/21', 'Roberta Da Silva');
INSERT INTO CARTAO (usuario, numero, CVV, validade, proprietario) VALUES ('marcelo.almeida', '4556771511873677', 312, '02/21', 'Adriano Costa');
INSERT INTO CARTAO (usuario, numero, CVV, validade, proprietario) VALUES ('ju.pereira', '30394246613112', 804, '08/21', 'Juliana Pereira');

 -- DADOS DENUNCIA
INSERT INTO DENUNCIA (denunciado, autor, data, conteudo) VALUES ('shaolin.matador', 'marcos085', TO_TIMESTAMP('2019-07-02 18:14:00', 'YYYY-MM-DD HH24:MI:SS'), 'Nao apareceu para a entrega do instrumento.');
INSERT INTO DENUNCIA (denunciado, autor, data, conteudo) VALUES ('dri_zinha', 'ju.pereira', TO_TIMESTAMP('2020-01-05 14:15:21', 'YYYY-MM-DD HH24:MI:SS'), 'Aula muito ruim, nao sabe o que está falando');
INSERT INTO DENUNCIA (denunciado, autor, data, conteudo) VALUES ('flavin_do_peneu', 'ana.sant', TO_TIMESTAMP('2020-02-15 13:11:25', 'YYYY-MM-DD HH24:MI:SS'), 'Instrumento diferente da foto');

 -- DADOS CONVERSA
 -- TODO

 -- DADOS TIPO_USUARIO
INSERT INTO TIPO_USUARIO (usuario, tipo) VALUES ('dri_zinha', 'PROFESSOR');
INSERT INTO TIPO_USUARIO (usuario, tipo) VALUES ('tgamer', 'PROFESSOR');
INSERT INTO TIPO_USUARIO (usuario, tipo) VALUES ('shaolin.matador', 'PROPRIETARIO');
INSERT INTO TIPO_USUARIO (usuario, tipo) VALUES ('flavin_do_peneu', 'PROPRIETARIO');
INSERT INTO TIPO_USUARIO (usuario, tipo) VALUES ('ju.pereira', 'ALUNO');
INSERT INTO TIPO_USUARIO (usuario, tipo) VALUES ('marcos085', 'ALUNO');
INSERT INTO TIPO_USUARIO (usuario, tipo) VALUES ('marcos085', 'LOCATARIO');
INSERT INTO TIPO_USUARIO (usuario, tipo) VALUES ('ana.sant', 'LOCATARIO');
INSERT INTO TIPO_USUARIO (usuario, tipo) VALUES ('tgamer', 'ORGANIZADOR');
INSERT INTO TIPO_USUARIO (usuario, tipo) VALUES ('ju.pereira', 'ORGANIZADOR');

 -- DADOS ALUNO
INSERT INTO ALUNO (usuario) VALUES ('ju.pereira');
INSERT INTO ALUNO (usuario) VALUES ('marcos085');

 -- DADOS PROFESSOR
INSERT INTO PROFESSOR (usuario, hora_aula, n_aulas, descricao) VALUES ('dri_zinha', 20.5, 1,'Dou aula a 10 anos, paciente com iniciantes. Também dou aula para pessoas já avançadas que querem aperfeiçoar a sua técnica.');
INSERT INTO PROFESSOR (usuario, hora_aula, descricao) VALUES ('tgamer', 30.0, 1, 'Aula completa para iniciantes no assunto.');

 -- DADO PROPRIETARIO
INSERT INTO PROPRIETARIO (usuario, avaliacao, n_emprestimos) VALUES ('shaolin.matador', 2.5, 2);
INSERT INTO PROPRIETARIO (usuario, avaliacao, n_emprestimos) VALUES ('flavin_do_peneu', 3.0, 1);

 -- DADOS LOCATARIO
INSERT INTO LOCATARIO (usuario, avaliacao, n_alugueis ) VALUES ('marcos085', 4.5, 2);
INSERT INTO LOCATARIO (usuario, avaliacao, n_alugueis ) VALUES ('ana.sant', 5.0, 1);

 -- DADOS ORGANIZADOR
INSERT INTO ORGANIZADOR (usuario) VALUES ('tgamer');
INSERT INTO ORGANIZADOR (usuario) VALUES ('ju.pereira');

 -- DADOS HORA_DISP
INSERT INTO HORA_DISP (professor, dia_semana, hora) VALUES ('dri_zinha', 'SEGUNDA', 15);
INSERT INTO HORA_DISP (professor, dia_semana, hora) VALUES ('dri_zinha', 'SEGUNDA', 16);
INSERT INTO HORA_DISP (professor, dia_semana, hora) VALUES ('dri_zinha', 'SEGUNDA', 17);
INSERT INTO HORA_DISP (professor, dia_semana, hora) VALUES ('dri_zinha', 'QUARTA', 15);
INSERT INTO HORA_DISP (professor, dia_semana, hora) VALUES ('dri_zinha', 'QUARTA', 16);
INSERT INTO HORA_DISP (professor, dia_semana, hora) VALUES ('dri_zinha', 'QUARTA', 17);
INSERT INTO HORA_DISP (professor, dia_semana, hora) VALUES ('tgamer', 'QUARTA', 10);
INSERT INTO HORA_DISP (professor, dia_semana, hora) VALUES ('tgamer', 'QUARTA', 11);

 -- DADOS CLASSIFICACAO_INSTRUMENTO
INSERT INTO CLASSIFICACAO_INSTRUMENTO (tipo, classificacao) VALUES ('BAIXO','CORDA');
INSERT INTO CLASSIFICACAO_INSTRUMENTO (tipo, classificacao) VALUES ('CAVAQUINHO','CORDA');
INSERT INTO CLASSIFICACAO_INSTRUMENTO (tipo, classificacao) VALUES ('CLARINETE','MADEIRA');
INSERT INTO CLASSIFICACAO_INSTRUMENTO (tipo, classificacao) VALUES ('SAXOFONE','MADEIRA');
INSERT INTO CLASSIFICACAO_INSTRUMENTO (tipo, classificacao) VALUES ('BATERIA','PERCUSSAO');

 -- DADO INSTRUMENTOS_TOCADOS
INSERT INTO INSTRUMENTOS_TOCADOS (professor, tipo_instrumento) VALUES ('dri_zinha', 'BAIXO');
INSERT INTO INSTRUMENTOS_TOCADOS (professor, tipo_instrumento) VALUES ('dri_zinha', 'CAVAQUINHO');
INSERT INTO INSTRUMENTOS_TOCADOS (professor, tipo_instrumento) VALUES ('tgamer', 'SAXOFONE');
INSERT INTO INSTRUMENTOS_TOCADOS (professor, tipo_instrumento) VALUES ('tgamer', 'CLARINETE');
INSERT INTO INSTRUMENTOS_TOCADOS (professor, tipo_instrumento) VALUES ('tgamer', 'BATERIA');

 -- DADO AULA
INSERT INTO AULA (data_aula, professor, aluno, local, duracao, valor, tipo_instrumento, forma_pagamento) VALUES (TO_DATE('2019/06/15 14:00:00', 'YYYY-MM-DD HH24:MI:SS'),'dri_zinha', 'ju.pereira', 'Centro Da Cultural da Penha', '1', 20.5, 'BAIXO', 'DINHEIRO');
INSERT INTO AULA (data_aula, professor, aluno, local, duracao, valor, tipo_instrumento, forma_pagamento) VALUES (TO_DATE('2019/06/30 10:00:00', 'YYYY-MM-DD HH24:MI:SS'),'tgamer', 'marcos085', 'Centro Da Cultural do Games', '1', 30.0, 'CLARINETE', 'CARTAO');

 -- DADO INSTRUMENTO
INSERT INTO INSTRUMENTO (nome, proprietario, disponivel, tipo) VALUES ('Clarinete Do Matador', 'shaolin.matador', 'Y', 'CLARINETE');
INSERT INTO INSTRUMENTO (nome, proprietario, disponivel, tipo) VALUES ('Sax Do Matador', 'shaolin.matador', 'N', 'SAXOFONE');
INSERT INTO INSTRUMENTO (nome, proprietario, disponivel, tipo) VALUES ('Baixo Do flavin', 'flavin_do_peneu', 'Y', 'BAIXO');

 -- DADO ALUGUEL
INSERT INTO ALUGUEL (instrumento_nome, instrumento_dono, locatario, data_emprestimo, data_devolucao, avaliacao_prop, avaliacao_locatario, forma_pagamento) VALUES ('Clarinete Do Matador', 'shaolin.matador', 'marcos085', TO_DATE('2019/04/04 17:05:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019/04/09 17:05:00', 'YYYY-MM-DD HH24:MI:SS'), 3.0, 5.0, 'DINHEIRO');
INSERT INTO ALUGUEL (instrumento_nome, instrumento_dono, locatario, data_emprestimo, data_devolucao, avaliacao_prop, avaliacao_locatario, forma_pagamento) VALUES ('Sax Do Matador', 'shaolin.matador', 'marcos085', TO_DATE('2019/05/04 17:05:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019/05/09 17:05:00', 'YYYY-MM-DD HH24:MI:SS'), 2.0, 4.0, 'DINHEIRO');
INSERT INTO ALUGUEL (instrumento_nome, instrumento_dono, locatario, data_emprestimo, data_devolucao, avaliacao_prop, avaliacao_locatario, forma_pagamento) VALUES ('Baixo Do flavin', 'flavin_do_peneu', 'ana.sant', TO_DATE('2019/02/04 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019/02/09 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3.0, 5.0, 'DINHEIRO');
