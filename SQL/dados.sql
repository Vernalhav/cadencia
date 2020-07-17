 -- DADOS USUARIOS
INSERT INTO USUARIO (nome_login, CPF, cidade, bairro, rua, numero, complemento, nome, senha) VALUES ('marcos085', '954.748.392-78', 'Xapuri', 'Centro', 'R João Barbosa', 55, 'APTO-23', 'Marcos da Rocha', 'ma32rocha55');    
INSERT INTO USUARIO (nome_login, CPF, cidade, bairro, rua, numero, nome, senha) VALUES ('dri_zinha', '663.180.122-22', 'Porto Acre', 'Vila do Vila', 'Av Rui Coelho', 135, 'Adriana da Silva Pereira', 'dridri22');    
INSERT INTO USUARIO (nome_login, CPF, cidade, bairro, rua, numero, nome, senha) VALUES ('flavin_do_peneu', '775.968.932-28', 'Xapuri', 'Centro', 'R João Barbosa', 15, 'Flavio Augusto', 'pneu775fla');    
INSERT INTO USUARIO (nome_login, CPF, cidade, bairro, rua, numero, nome, senha) VALUES ('tgamer', '710.181.532-41', 'Santa Rosa do Purus', 'Cidade Nova', 'Rua Coronel Jose Ferreira', 500, 'Afonso Gamer', 'lolol555');    
INSERT INTO USUARIO (nome_login, CPF, cidade, bairro, rua, numero, complemento, nome, senha) VALUES ('marcelo.almeida', '462.555.332-63', 'Assis Brasil', 'Cascata', 'R Raimundo Chaar', 168, 'APTO-82', 'Marcelo Almeida', 'maalmeidaa');    
INSERT INTO USUARIO (nome_login, CPF, cidade, bairro, rua, numero, nome, senha) VALUES ('ana.sant', '992.573.372-35', 'Feijo', 'Bela Vista', 'R Joel Ferreira Souza', 80, 'Ana Santana', 'ana99ss');    
INSERT INTO USUARIO (nome_login, CPF, cidade, bairro, rua, numero, complemento, nome, senha) VALUES ('shaolin.matador', '776.347.342-84', 'Xapuri', 'Centro', 'R João Barbosa', 55, 'APTO-23', 'Marcos da Rocha', 'ma32rocha55');    
INSERT INTO USUARIO (nome_login, CPF, cidade, bairro, rua, numero, nome, senha) VALUES ('ju.pereira', '229.078.032-47', 'Mancio Lima', 'Bandeirante', 'R Camilo Galdino Ribeiro', 26, 'Juliana Pereira', 'Lima1312');
INSERT INTO USUARIO (nome_login, cidade, bairro, rua, numero, nome, senha) VALUES ('mister_toby', 'Coalinga', 'Faith Christian', 'R Do Assim que Eu Gosto', 26, 'Vinicius Calado', 'ritobufaadcpls');

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

 -- DADOS CONVERSA
INSERT INTO CONVERSA (usuario1, usuario2, arquivo_conversa) VALUES ('tgamer', 'dri_zinha', './conversas/tgamer-dri_zinha.txt');
INSERT INTO CONVERSA (usuario1, usuario2, arquivo_conversa) VALUES ('tgamer', 'flavin_do_peneu', './conversas/tgamer-flavin_do_peneu.txt');
INSERT INTO CONVERSA (usuario1, usuario2, arquivo_conversa) VALUES ('tgamer', 'ana.sant', './conversas/tgamer-ana.sant.txt');
INSERT INTO CONVERSA (usuario1, usuario2, arquivo_conversa) VALUES ('tgamer', 'marcos085', './conversas/tgamer-marcos085.txt');
INSERT INTO CONVERSA (usuario1, usuario2, arquivo_conversa) VALUES ('tgamer', 'mister_toby', './conversas/tgamer-mister_toby.txt');
INSERT INTO CONVERSA (usuario1, usuario2, arquivo_conversa) VALUES ('dri_zinha', 'marcos085', './conversas/dri_zinha-marcos085.txt');
INSERT INTO CONVERSA (usuario1, usuario2, arquivo_conversa) VALUES ('dri_zinha', 'ana.sant', './conversas/dri_zinha-ana.sant.txt');
INSERT INTO CONVERSA (usuario1, usuario2, arquivo_conversa) VALUES ('dri_zinha', 'flavin_do_peneu', './conversas/dri_zinha-flavin_do_peneu.txt');
INSERT INTO CONVERSA (usuario1, usuario2, arquivo_conversa) VALUES ('dri_zinha', 'ju.pereira', './conversas/dri_zinha-ju.pereira.txt');
INSERT INTO CONVERSA (usuario1, usuario2, arquivo_conversa) VALUES ('flavin_do_peneu', 'ju.pereira', './conversas/flavin_do_peneu-ju.pereira.txt');
INSERT INTO CONVERSA (usuario1, usuario2, arquivo_conversa) VALUES ('flavin_do_peneu', 'marcos085', './conversas/flavin_do_peneu-marcos085.txt');
INSERT INTO CONVERSA (usuario1, usuario2, arquivo_conversa) VALUES ('flavin_do_peneu', 'mister_toby', './conversas/flavin_do_peneu-mister_toby.txt');
INSERT INTO CONVERSA (usuario1, usuario2, arquivo_conversa) VALUES ('flavin_do_peneu', 'ana.sant', './conversas/flavin_do_peneu-ana.sant.txt');

 -- DADOS TIPO_USUARIO
INSERT INTO TIPO_USUARIO (usuario, tipo) VALUES ('dri_zinha', 'PROFESSOR');
INSERT INTO TIPO_USUARIO (usuario, tipo) VALUES ('tgamer', 'PROFESSOR');
INSERT INTO TIPO_USUARIO (usuario, tipo) VALUES ('mister_toby', 'PROFESSOR');   
INSERT INTO TIPO_USUARIO (usuario, tipo) VALUES ('shaolin.matador', 'PROPRIETARIO');
INSERT INTO TIPO_USUARIO (usuario, tipo) VALUES ('flavin_do_peneu', 'PROPRIETARIO');
INSERT INTO TIPO_USUARIO (usuario, tipo) VALUES ('mister_toby', 'PROPRIETARIO');
INSERT INTO TIPO_USUARIO (usuario, tipo) VALUES ('ju.pereira', 'ALUNO');
INSERT INTO TIPO_USUARIO (usuario, tipo) VALUES ('marcos085', 'ALUNO');
INSERT INTO TIPO_USUARIO (usuario, tipo) VALUES ('mister_toby', 'ALUNO');       
INSERT INTO TIPO_USUARIO (usuario, tipo) VALUES ('marcos085', 'LOCATARIO');
INSERT INTO TIPO_USUARIO (usuario, tipo) VALUES ('ana.sant', 'LOCATARIO');
INSERT INTO TIPO_USUARIO (usuario, tipo) VALUES ('mister_toby', 'LOCATARIO');          
INSERT INTO TIPO_USUARIO (usuario, tipo) VALUES ('tgamer', 'ORGANIZADOR');
INSERT INTO TIPO_USUARIO (usuario, tipo) VALUES ('ju.pereira', 'ORGANIZADOR');

 -- DADOS ALUNO
INSERT INTO ALUNO (usuario) VALUES ('ju.pereira');
INSERT INTO ALUNO (usuario) VALUES ('marcos085');
INSERT INTO ALUNO (usuario) VALUES ('mister_toby');

 -- DADOS PROFESSOR
INSERT INTO PROFESSOR (usuario, hora_aula, n_aulas, descricao) VALUES ('dri_zinha', 20.5, 1,'Dou aula a 10 anos, paciente com iniciantes. Também dou aula para pessoas já avançadas que querem aperfeiçoar a sua técnica.');
INSERT INTO PROFESSOR (usuario, hora_aula, n_aulas, descricao) VALUES ('tgamer', 30.0, 3, 'Aula completa para iniciantes no assunto.');
INSERT INTO PROFESSOR (usuario, hora_aula, descricao) VALUES ('mister_toby', 50.0, 'Sou virtuoso no teclado. Não dou aula para iniciantes.');

 -- DADO PROPRIETARIO
INSERT INTO PROPRIETARIO (usuario, avaliacao, n_emprestimos) VALUES ('shaolin.matador', 2.5, 2);
INSERT INTO PROPRIETARIO (usuario, avaliacao, n_emprestimos) VALUES ('flavin_do_peneu', 3.0, 1);
INSERT INTO PROPRIETARIO (usuario) VALUES ('mister_toby');

 -- DADOS LOCATARIO
INSERT INTO LOCATARIO (usuario, avaliacao, n_alugueis) VALUES ('marcos085', 4.5, 2);
INSERT INTO LOCATARIO (usuario, avaliacao, n_alugueis) VALUES ('ana.sant', 5.0, 1);
INSERT INTO LOCATARIO (usuario, avaliacao) VALUES ('mister_toby', 5.0);

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
INSERT INTO HORA_DISP (professor, dia_semana, hora) VALUES ('tgamer', 'QUARTA', 14);
INSERT INTO HORA_DISP (professor, dia_semana, hora) VALUES ('mister_toby', 'SABADO', 8);
INSERT INTO HORA_DISP (professor, dia_semana, hora) VALUES ('mister_toby', 'SABADO', 9);
INSERT INTO HORA_DISP (professor, dia_semana, hora) VALUES ('mister_toby', 'SABADO', 10);
INSERT INTO HORA_DISP (professor, dia_semana, hora) VALUES ('mister_toby', 'SABADO', 11);
INSERT INTO HORA_DISP (professor, dia_semana, hora) VALUES ('mister_toby', 'DOMINGO', 8);
INSERT INTO HORA_DISP (professor, dia_semana, hora) VALUES ('mister_toby', 'DOMINGO', 9);
INSERT INTO HORA_DISP (professor, dia_semana, hora) VALUES ('mister_toby', 'DOMINGO', 10);
INSERT INTO HORA_DISP (professor, dia_semana, hora) VALUES ('mister_toby', 'DOMINGO', 11);
INSERT INTO HORA_DISP (professor, dia_semana, hora) VALUES ('mister_toby', 'SEGUNDA', 8);
INSERT INTO HORA_DISP (professor, dia_semana, hora) VALUES ('mister_toby', 'SEGUNDA', 9);
INSERT INTO HORA_DISP (professor, dia_semana, hora) VALUES ('mister_toby', 'SEGUNDA', 10);
INSERT INTO HORA_DISP (professor, dia_semana, hora) VALUES ('mister_toby', 'SEGUNDA', 11);
INSERT INTO HORA_DISP (professor, dia_semana, hora) VALUES ('mister_toby', 'TERCA', 8);
INSERT INTO HORA_DISP (professor, dia_semana, hora) VALUES ('mister_toby', 'TERCA', 9);
INSERT INTO HORA_DISP (professor, dia_semana, hora) VALUES ('mister_toby', 'TERCA', 10);
INSERT INTO HORA_DISP (professor, dia_semana, hora) VALUES ('mister_toby', 'TERCA', 11);
INSERT INTO HORA_DISP (professor, dia_semana, hora) VALUES ('mister_toby', 'QUARTA', 8);
INSERT INTO HORA_DISP (professor, dia_semana, hora) VALUES ('mister_toby', 'QUARTA', 9);
INSERT INTO HORA_DISP (professor, dia_semana, hora) VALUES ('mister_toby', 'QUARTA', 10);
INSERT INTO HORA_DISP (professor, dia_semana, hora) VALUES ('mister_toby', 'QUARTA', 11);
INSERT INTO HORA_DISP (professor, dia_semana, hora) VALUES ('mister_toby', 'QUINTA', 8);
INSERT INTO HORA_DISP (professor, dia_semana, hora) VALUES ('mister_toby', 'QUINTA', 9);
INSERT INTO HORA_DISP (professor, dia_semana, hora) VALUES ('mister_toby', 'QUINTA', 10);
INSERT INTO HORA_DISP (professor, dia_semana, hora) VALUES ('mister_toby', 'SEXTA', 8);
INSERT INTO HORA_DISP (professor, dia_semana, hora) VALUES ('mister_toby', 'SEXTA', 9);
INSERT INTO HORA_DISP (professor, dia_semana, hora) VALUES ('mister_toby', 'SEXTA', 10);

 -- DADOS CLASSIFICACAO_INSTRUMENTO
INSERT INTO CLASSIFICACAO_INSTRUMENTO (tipo, classificacao) VALUES ('BAIXO','CORDAS');
INSERT INTO CLASSIFICACAO_INSTRUMENTO (tipo, classificacao) VALUES ('CAVAQUINHO','CORDAS');
INSERT INTO CLASSIFICACAO_INSTRUMENTO (tipo, classificacao) VALUES ('CLARINETE','SOPRO');
INSERT INTO CLASSIFICACAO_INSTRUMENTO (tipo, classificacao) VALUES ('SAXOFONE','SOPRO');
INSERT INTO CLASSIFICACAO_INSTRUMENTO (tipo, classificacao) VALUES ('GAITA','SOPRO');
INSERT INTO CLASSIFICACAO_INSTRUMENTO (tipo, classificacao) VALUES ('GAITA DE FOLE','SOPRO');
INSERT INTO CLASSIFICACAO_INSTRUMENTO (tipo, classificacao) VALUES ('ACORDEON','SOPRO');
INSERT INTO CLASSIFICACAO_INSTRUMENTO (tipo, classificacao) VALUES ('BATERIA','PERCUSSAO');
INSERT INTO CLASSIFICACAO_INSTRUMENTO (tipo, classificacao) VALUES ('VIOLAO','CORDAS');
INSERT INTO CLASSIFICACAO_INSTRUMENTO (tipo, classificacao) VALUES ('VIOLA','CORDAS');
INSERT INTO CLASSIFICACAO_INSTRUMENTO (tipo, classificacao) VALUES ('VIOLINO','CORDAS');
INSERT INTO CLASSIFICACAO_INSTRUMENTO (tipo, classificacao) VALUES ('CANTO','SOPRO');
INSERT INTO CLASSIFICACAO_INSTRUMENTO (tipo, classificacao) VALUES ('OCARINA','SOPRO');
INSERT INTO CLASSIFICACAO_INSTRUMENTO (tipo, classificacao) VALUES ('FLAUTA TRANSVERSAL','SOPRO');
INSERT INTO CLASSIFICACAO_INSTRUMENTO (tipo, classificacao) VALUES ('PIANO','CORDAS');
INSERT INTO CLASSIFICACAO_INSTRUMENTO (tipo, classificacao) VALUES ('TECLADO','DIGITAL');
INSERT INTO CLASSIFICACAO_INSTRUMENTO (tipo, classificacao) VALUES ('HARPA','CORDAS');
INSERT INTO CLASSIFICACAO_INSTRUMENTO (tipo, classificacao) VALUES ('TROMPETE','SOPRO');
INSERT INTO CLASSIFICACAO_INSTRUMENTO (tipo, classificacao) VALUES ('UKULELE','CORDAS');
INSERT INTO CLASSIFICACAO_INSTRUMENTO (tipo, classificacao) VALUES ('CAJON','PERCUSSAO');
INSERT INTO CLASSIFICACAO_INSTRUMENTO (tipo, classificacao) VALUES ('KAZOO','SOPRO');
INSERT INTO CLASSIFICACAO_INSTRUMENTO (tipo, classificacao) VALUES ('HURDY GURDY','CORDAS');
INSERT INTO CLASSIFICACAO_INSTRUMENTO (tipo, classificacao) VALUES ('CONTRABAIXO','CORDAS');
INSERT INTO CLASSIFICACAO_INSTRUMENTO (tipo, classificacao) VALUES ('SINTETIZADOR','DIGITAL');

 -- DADO INSTRUMENTOS_TOCADOS
INSERT INTO INSTRUMENTOS_TOCADOS (professor, tipo_instrumento) VALUES ('dri_zinha', 'BAIXO');
INSERT INTO INSTRUMENTOS_TOCADOS (professor, tipo_instrumento) VALUES ('dri_zinha', 'CAVAQUINHO');
INSERT INTO INSTRUMENTOS_TOCADOS (professor, tipo_instrumento) VALUES ('tgamer', 'SAXOFONE');
INSERT INTO INSTRUMENTOS_TOCADOS (professor, tipo_instrumento) VALUES ('tgamer', 'CLARINETE');
INSERT INTO INSTRUMENTOS_TOCADOS (professor, tipo_instrumento) VALUES ('tgamer', 'BATERIA');
INSERT INTO INSTRUMENTOS_TOCADOS (professor, tipo_instrumento) VALUES ('mister_toby', 'PIANO');
INSERT INTO INSTRUMENTOS_TOCADOS (professor, tipo_instrumento) VALUES ('mister_toby', 'TECLADO');
INSERT INTO INSTRUMENTOS_TOCADOS (professor, tipo_instrumento) VALUES ('mister_toby', 'SINTETIZADOR');

 -- DADO AULA
INSERT INTO AULA (data_aula, professor, aluno, local, duracao, valor, tipo_instrumento, forma_pagamento) VALUES (TO_DATE('2019/06/15 14:00:00', 'YYYY-MM-DD HH24:MI:SS'),'dri_zinha', 'ju.pereira', 'Centro Cultural da Penha', 1, 20.5, 'BAIXO', 'DINHEIRO');
INSERT INTO AULA (data_aula, professor, aluno, local, duracao, valor, tipo_instrumento, forma_pagamento) VALUES (TO_DATE('2019/06/23 10:00:00', 'YYYY-MM-DD HH24:MI:SS'),'tgamer', 'marcos085', 'Centro Da Cultural do Games', 1, 30.0, 'CLARINETE', 'CARTAO');
INSERT INTO AULA (data_aula, professor, aluno, local, duracao, valor, tipo_instrumento, forma_pagamento) VALUES (TO_DATE('2019/06/30 10:00:00', 'YYYY-MM-DD HH24:MI:SS'),'tgamer', 'marcos085', 'Centro Da Cultural do Games', 1, 30.0, 'CLARINETE', 'CARTAO');
INSERT INTO AULA (data_aula, professor, aluno, local, duracao, valor, tipo_instrumento, forma_pagamento) VALUES (TO_DATE('2020/06/30 10:00:00', 'YYYY-MM-DD HH24:MI:SS'),'tgamer', 'mister_toby', 'Centro Da Cultural do Games', 1, 30.0, 'CLARINETE', 'CARTAO');
INSERT INTO AULA VALUES (TO_DATE('2020/06/30 10:00:00', 'YYYY-MM-DD HH24:MI:SS'),'mister_toby', 'marcos085', 'Centro Da Cultural do Games', 1, 50.0, 'TECLADO', 'DINHEIRO');
INSERT INTO AULA VALUES (TO_DATE('2020/07/30 10:00:00', 'YYYY-MM-DD HH24:MI:SS'),'dri_zinha', 'mister_toby', 'Centro Da Cultural do Games', 3, 61.50, 'CAVAQUINHO', 'BOLETO');
INSERT INTO AULA (data_aula, professor, aluno, local, duracao, valor, tipo_instrumento, forma_pagamento) VALUES (TO_DATE('2019/10/16 14:00:00', 'YYYY-MM-DD HH24:MI:SS'),'dri_zinha', 'ana.sant', 'Centro Cultural da Penha', 1, 20.5, 'BAIXO', 'DINHEIRO');
INSERT INTO AULA (data_aula, professor, aluno, local, duracao, valor, tipo_instrumento, forma_pagamento) VALUES (TO_DATE('2019/06/17 14:00:00', 'YYYY-MM-DD HH24:MI:SS'),'dri_zinha', 'marcos085', 'Centro Cultural da Penha', 1, 20.5, 'BAIXO', 'DINHEIRO');
INSERT INTO AULA (data_aula, professor, aluno, local, duracao, valor, tipo_instrumento, forma_pagamento) VALUES (TO_DATE('2019/06/18 14:00:00', 'YYYY-MM-DD HH24:MI:SS'),'tgamer', 'marcos085', 'Centro Cultural da Penha', 1, 20.5, 'CLARINETE', 'DINHEIRO');

 -- DADO INSTRUMENTO
INSERT INTO INSTRUMENTO (nome, proprietario, disponivel, tipo) VALUES ('Clarinete Do Matador', 'shaolin.matador', 'Y', 'CLARINETE');
INSERT INTO INSTRUMENTO (nome, proprietario, disponivel, tipo) VALUES ('Sax Do Matador', 'shaolin.matador', 'N', 'SAXOFONE');
INSERT INTO INSTRUMENTO (nome, proprietario, disponivel, tipo) VALUES ('Baixo Do flavin', 'flavin_do_peneu', 'Y', 'BAIXO');
INSERT INTO INSTRUMENTO (nome, proprietario, disponivel, tipo) VALUES ('Piano Steinway D-274 Ouro-II', 'mister_toby','Y', 'PIANO');
INSERT INTO INSTRUMENTO (nome, proprietario, disponivel, tipo) VALUES ('Sintetizador roubado do Daft Punk', 'mister_toby', 'Y', 'SINTETIZADOR');
INSERT INTO INSTRUMENTO VALUES ('Ocarina Do Tempo', 'mister_toby', 'Y', 'OCARINA');
INSERT INTO INSTRUMENTO VALUES ('Flauta de Domar Cobras', 'mister_toby', 'Y', 'FLAUTA TRANSVERSAL');
INSERT INTO INSTRUMENTO VALUES ('Epic Sax', 'mister_toby', 'Y', 'SAXOFONE');
INSERT INTO INSTRUMENTO VALUES ('Clarinete do Lula Molusco', 'mister_toby', 'Y', 'CLARINETE');

 -- DADO ALUGUEL
INSERT INTO ALUGUEL (instrumento_nome, instrumento_dono, locatario, data_emprestimo, data_devolucao, avaliacao_prop, avaliacao_locatario, forma_pagamento) VALUES ('Clarinete Do Matador', 'shaolin.matador', 'marcos085', TO_DATE('2019/04/04 17:05:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019/04/09 17:05:00', 'YYYY-MM-DD HH24:MI:SS'), 3.0, 5.0, 'DINHEIRO');
INSERT INTO ALUGUEL (instrumento_nome, instrumento_dono, locatario, data_emprestimo, data_devolucao, avaliacao_prop, avaliacao_locatario, forma_pagamento) VALUES ('Sax Do Matador', 'shaolin.matador', 'marcos085', TO_DATE('2019/05/04 17:05:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019/05/09 17:05:00', 'YYYY-MM-DD HH24:MI:SS'), 2.0, 4.0, 'DINHEIRO');
INSERT INTO ALUGUEL (instrumento_nome, instrumento_dono, locatario, data_emprestimo, data_devolucao, avaliacao_prop, avaliacao_locatario, forma_pagamento) VALUES ('Baixo Do flavin', 'flavin_do_peneu', 'ana.sant', TO_DATE('2019/02/04 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019/02/09 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3.0, 5.0, 'DINHEIRO');
INSERT INTO ALUGUEL (instrumento_nome, instrumento_dono, locatario, data_emprestimo, data_devolucao, avaliacao_prop, avaliacao_locatario, forma_pagamento) VALUES ('Baixo Do flavin', 'flavin_do_peneu', 'mister_toby', TO_DATE('2019/03/04 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019/03/09 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3.0, 5.0, 'DINHEIRO');
INSERT INTO ALUGUEL VALUES ('Ocarina Do Tempo', 'mister_toby', 'ana.sant', TO_DATE('2019/03/04 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019/03/09 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 5.0, 5.0, 'DINHEIRO');
INSERT INTO ALUGUEL VALUES ('Flauta de Domar Cobras', 'mister_toby', 'ana.sant', TO_DATE('2019/03/04 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019/03/09 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 5.0, 5.0, 'DINHEIRO');
INSERT INTO ALUGUEL VALUES ('Epic Sax', 'mister_toby', 'ana.sant', TO_DATE('2019/03/04 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019/03/09 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1.0, 1.0, 'DINHEIRO');
INSERT INTO ALUGUEL VALUES ('Clarinete do Lula Molusco', 'mister_toby', 'ana.sant', TO_DATE('2019/03/04 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019/03/09 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 5.0, 5.0, 'DINHEIRO');
INSERT INTO ALUGUEL VALUES ('Sintetizador roubado do Daft Punk', 'mister_toby', 'ana.sant', TO_DATE('2019/03/04 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019/03/09 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0, 0, 'DINHEIRO');

 -- DADO LUGAR
INSERT INTO LUGAR (nome, cidade, bairro, rua, numero, descricao) VALUES ('Club Do Shaolin', 'Xapuri', 'Centro', 'R. Vinte e Quatro de Janeiro', 80, 'Local bom para conversar e ouvir uma boa musica, onde surgiu o mestre Shaolin');
INSERT INTO LUGAR (nome, cidade, bairro, rua, numero, descricao) VALUES ('Club Gamer Musical', 'Santa Rosa do Purus', 'Cidade Nova', 'Rua Coronel Jose Ferreira', 10, 'Local bom ouvir musica e jogar');
INSERT INTO LUGAR (nome, cidade, bairro, rua, numero, descricao) VALUES ('Flat do BCC', 'São Carlos', 'Lutfalla', 'R. Jacinto Favoreto', 301, 'Local bom para conversar e ouvir uma boa musica, e trocar ideia com o Global');
INSERT INTO LUGAR (nome, cidade, bairro, rua, numero, descricao) VALUES ('Biblioteca', 'São Carlos', 'Lutfalla', 'R. Dentro da facul', 123, 'Local bom para conversar e ouvir uma boa musica, e as vezes estudar');
INSERT INTO LUGAR (nome, cidade, bairro, rua, numero, descricao) VALUES ('Palquinho', 'São Carlos', 'Lutfalla', 'R. Dentro da USP', 69, 'Local bom para conversar e ouvir uma boa musica, e tomar bastante sol');
INSERT INTO LUGAR (nome, cidade, bairro, rua, numero, descricao) VALUES ('Bandejao', 'São Carlos', 'Lutfalla', 'R. Mei da USP', 321, 'Local bom para conversar e ouvir uma boa musica, e comer uma comida de procedência duvidosa');

 -- DADO EVENTO
INSERT INTO EVENTO (id_evento, data, lugar, organizador, lotacao, descricao) VALUES (1, TO_DATE('2021/02/15 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Club Do Shaolin', 'ju.pereira', 20, 'Venha curtir uma boa musica.');
INSERT INTO EVENTO (id_evento, data, lugar, organizador, lotacao, descricao) VALUES (2, TO_DATE('2021/03/12 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Club Gamer Musical', 'tgamer', 10, 'Venha jogar enquanto escuta uma boa musica.');
INSERT INTO EVENTO (id_evento, data, lugar, organizador, lotacao, descricao) VALUES (3, TO_DATE('2020/11/27 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Flat do BCC', 'tgamer', 10, 'Venha jogar enquanto escuta uma boa musica.');
INSERT INTO EVENTO (id_evento, data, lugar, organizador, lotacao, descricao) VALUES (4, TO_DATE('2019/06/25 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Biblioteca', 'tgamer', 10, 'Venha estudar enquanto escuta uma boa musica.');
INSERT INTO EVENTO (id_evento, data, lugar, organizador, lotacao, descricao) VALUES (5, TO_DATE('2019/03/12 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Palquinho', 'tgamer', 10, 'Venha fazer nada enquanto escuta uma boa musica.');
INSERT INTO EVENTO (id_evento, data, lugar, organizador, lotacao, descricao) VALUES (6, TO_DATE('2020/03/10 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Bandejao', 'tgamer', 10, 'Venha comer enquanto escuta uma boa musica.');

 -- DADO FOTO
INSERT INTO FOTO (id_evento, url) VALUES (1,'https://asset4.zankyou.com/images/wervice-card-big/d33/b90e/1050/800/w/577343/-/1495543847.jpg');
INSERT INTO FOTO (id_evento, url) VALUES (1,'https://media.discordapp.net/attachments/572967144774434849/733757856721141971/unknown.png');
INSERT INTO FOTO (id_evento, url) VALUES (1,'https://media.discordapp.net/attachments/572967144774434849/733757774407925821/375353_112068815577282_1836614541_n.png');
INSERT INTO FOTO (id_evento, url) VALUES (2,'https://s3-sa-east-1.amazonaws.com/images-clients.agendaopen.com/f2661271bb7942956ef042329a8ce9c7_3.jpg');
INSERT INTO FOTO (id_evento, url) VALUES (2,'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSgpWZo1SOrK0vCpah2NhCobtMOj10Uv5WQfQ&usqp=CAU');
INSERT INTO FOTO (id_evento, url) VALUES (2,'https://r-cf.bstatic.com/images/hotel/max1024x768/233/233370592.jpg');
INSERT INTO FOTO (id_evento, url) VALUES (3,'https://www.casadeeventos.com.br/assets/images/casadeventos-15anos-mickaela2018-19-1280x821.jpg');
INSERT INTO FOTO (id_evento, url) VALUES (3,'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRGr0UK-L62Zf4oVvsb4yVyWTYtzfhKFZtTbA&usqp=CAU');
INSERT INTO FOTO (id_evento, url) VALUES (3,'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRP8jNoy1MnPTSpq4yFQBt6JHGiWbYHRZvxxQ&usqp=CAU');
INSERT INTO FOTO (id_evento, url) VALUES (4,'https://cdn0.casamentos.com.br/emp/fotos/4/6/3/6/1619516-607394042725918-967051010222401364-n_13_164636.jpg');
INSERT INTO FOTO (id_evento, url) VALUES (4,'https://d1e676vce0x2at.cloudfront.net/uploads/post/image/8624/main_204736_itatiaia-tulio-barros.jpg');
INSERT INTO FOTO (id_evento, url) VALUES (4,'https://orlanoticias.com.br/wp-content/uploads/2020/01/WhatsApp-Image-2020-01-14-at-10.49.24-360x240.jpeg');
INSERT INTO FOTO (id_evento, url) VALUES (5,'https://www.ouroeste.sp.gov.br/storage/conteudo/grande_3c531b3192f53913fb9c2926ff67368610371391-788564854520748-1173579690466998270-n.jpg');
INSERT INTO FOTO (id_evento, url) VALUES (5,'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTokRTqUee7_sjMKcVCKtoHZKPNKmFE5ORBCw&usqp=CAU');
INSERT INTO FOTO (id_evento, url) VALUES (5,'https://static.portaldacidade.com/unsafe/1150x767/https://s3.amazonaws.com/cruzeirodooeste.portaldacidade.com/img/news/2019-08/evento-na-praca-coroa-o-dia-do-pioneiro-em-cruzeiro-do-oeste-5d48a2c587edd.jpeg');
INSERT INTO FOTO (id_evento, url) VALUES (6,'https://mczalt.files.wordpress.com/2017/04/pessoas-dancando-na-balada-shutter.jpg?w=736');
INSERT INTO FOTO (id_evento, url) VALUES (6,'https://blogjatefalei.files.wordpress.com/2014/11/na-balada.png');
INSERT INTO FOTO (id_evento, url) VALUES (6,'https://projetosespeciais.com/wp-content/uploads/2018/03/Balada.jpg');
 
 -- DADO TIPO_INGRESSO
INSERT INTO TIPO_INGRESSO (tipo, id_evento, total, preco, qt_disponiveis) VALUES ('PISTA', 1, 20, 50, 19);
INSERT INTO TIPO_INGRESSO (tipo, id_evento, total, preco, qt_disponiveis) VALUES ('PISTA', 2, 5, 10, 4);
INSERT INTO TIPO_INGRESSO (tipo, id_evento, total, preco, qt_disponiveis) VALUES ('AMIGO', 2, 5, 5, 0);
INSERT INTO TIPO_INGRESSO (tipo, id_evento, total, preco, qt_disponiveis) VALUES ('PISTA', 3, 20, 50, 19);
INSERT INTO TIPO_INGRESSO (tipo, id_evento, total, preco, qt_disponiveis) VALUES ('PISTA', 4, 20, 50, 19);
INSERT INTO TIPO_INGRESSO (tipo, id_evento, total, preco, qt_disponiveis) VALUES ('PISTA', 5, 20, 50, 19);
INSERT INTO TIPO_INGRESSO (tipo, id_evento, total, preco, qt_disponiveis) VALUES ('PISTA', 6, 20, 50, 19);

 -- DADO INGRESSO
INSERT INTO INGRESSO (codigo_barras, usuario, tipo_ingresso, id_evento, forma_pagamento) VALUES (568462789561, 'marcelo.almeida', 'PISTA', 1, 'BOLETO');
INSERT INTO INGRESSO (codigo_barras, usuario, tipo_ingresso, id_evento, forma_pagamento) VALUES (688462789562, 'ana.sant', 'PISTA', 2, 'BOLETO');
INSERT INTO INGRESSO (codigo_barras, usuario, tipo_ingresso, id_evento, forma_pagamento) VALUES (138462789562, 'mister_toby', 'AMIGO', 2, 'DINHEIRO');
INSERT INTO INGRESSO (codigo_barras, usuario, tipo_ingresso, id_evento, forma_pagamento) VALUES (148462789562, 'mister_toby', 'AMIGO', 2, 'DINHEIRO');
INSERT INTO INGRESSO (codigo_barras, usuario, tipo_ingresso, id_evento, forma_pagamento) VALUES (128462789562, 'mister_toby', 'AMIGO', 2, 'DINHEIRO');
INSERT INTO INGRESSO (codigo_barras, usuario, tipo_ingresso, id_evento, forma_pagamento) VALUES (158462789562, 'mister_toby', 'AMIGO', 2, 'DINHEIRO');
INSERT INTO INGRESSO (codigo_barras, usuario, tipo_ingresso, id_evento, forma_pagamento) VALUES (147462789562, 'mister_toby', 'AMIGO', 2, 'DINHEIRO');
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
