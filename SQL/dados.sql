-- MEGA TODO: determinar ON DELETE das FKs! CTRL+F "FK_"

CREATE TABLE USUARIO(
    nome_login VARCHAR2(40) PRIMARY KEY,

    CPF VARCHAR2(14),
    CONSTRAINT UNIQUE_CPF UNIQUE(CPF),
    CONSTRAINT CK_CPF CHECK(REGEXP_LIKE(CPF, '[0-9]{3}\.[0-9]{3}\.[0-9]{3}\-[0-9]{2}')),

    nome VARCHAR2(100),
    senha VARCHAR2(40),

    cidade VARCHAR2(30) NOT NULL,
    bairro VARCHAR2(30) NOT NULL,
    rua VARCHAR2(50) NOT NULL,
    numero NUMBER(5) NOT NULL,
    complemento VARCHAR2(150)
);


CREATE TABLE CONTA(
    usuario VARCHAR2(40) PRIMARY KEY,
    CONSTRAINT FK_CONTA FOREIGN KEY (usuario) REFERENCES USUARIO(nome_login) ON DELETE CASCADE,

    agencia VARCHAR2(6) NOT NULL,
    conta_corrente VARCHAR2(11) NOT NULL,
    banco VARCHAR2(50) NOT NULL
);


CREATE TABLE CARTAO(
    usuario VARCHAR2(40),
    numero VARCHAR2(16),

    CONSTRAINT FK_CARTAO FOREIGN KEY (usuario) REFERENCES USUARIO(nome_login) ON DELETE CASCADE,
    CONSTRAINT PK_CARTAO PRIMARY KEY (usuario, numero),

    CVV NUMBER(3) NOT NULL,
    validade VARCHAR2(5) NOT NULL,
    proprietario VARCHAR2(50) NOT NULL
);


CREATE TABLE DENUNCIA(
    denunciado VARCHAR2(40),
    autor VARCHAR2(40),

    
    CONSTRAINT FK_DENUNCIADO FOREIGN KEY (denunciado) REFERENCES USUARIO(nome_login) ON DELETE CASCADE,
    CONSTRAINT FK_AUTOR FOREIGN KEY (autor) REFERENCES USUARIO(nome_login) ON DELETE CASCADE,

    data TIMESTAMP,
    CONSTRAINT PK_DENUNCIA PRIMARY KEY (denunciado, autor, data),

    conteudo VARCHAR2(200) NOT NULL
);


CREATE TABLE CONVERSA(
    usuario1 VARCHAR2(40),
    usuario2 VARCHAR2(40),

    
    CONSTRAINT FK_USER1 FOREIGN KEY (usuario1) REFERENCES USUARIO(nome_login) ON DELETE CASCADE,
    CONSTRAINT FK_USER2 FOREIGN KEY (usuario2) REFERENCES USUARIO(nome_login) ON DELETE CASCADE,

    -- Também remove a possibilidade de usuario1 = usuario2
    CONSTRAINT CHAVE_ALFABETICA CHECK(usuario1 < usuario2),  -- TODO: comparação direta?
    CONSTRAINT PK_CONVERSA PRIMARY KEY (usuario1, usuario2),

    arquivo_conversa VARCHAR2(60) NOT NULL  -- TODO: como funciona arquivo/referencia em banco?
);


CREATE TABLE TIPO_USUARIO(
    usuario VARCHAR2(40),
    CONSTRAINT FK_USER_TYPE FOREIGN KEY (usuario) REFERENCES USUARIO(nome_login) ON DELETE CASCADE,
    
    tipo VARCHAR2(13) NOT NULL,
    CONSTRAINT CHECK_TIPO CHECK(tipo IN ('ALUNO', 'PROFESSOR', 'PROPRIETARIO', 'LOCATARIO', 'ORGANIZADOR')),
    CONSTRAINT PK_USER_TYPE PRIMARY KEY (usuario, tipo)
);

CREATE TABLE ALUNO(
    usuario VARCHAR2(40) PRIMARY KEY,

    CONSTRAINT FK_ALUNO FOREIGN KEY (usuario) REFERENCES USUARIO(nome_login) ON DELETE CASCADE
);


CREATE TABLE PROFESSOR(
    usuario VARCHAR2(40) PRIMARY KEY,
    CONSTRAINT FK_PROFESSOR FOREIGN KEY (usuario) REFERENCES USUARIO(nome_login) ON DELETE CASCADE,

    hora_aula NUMBER NOT NULL,
    n_aulas NUMBER(10) DEFAULT 0 NOT NULL,

    descricao VARCHAR2(300)
);


CREATE TABLE PROPRIETARIO(
    usuario VARCHAR2(40) PRIMARY KEY,
    CONSTRAINT FK_PROPRIETARIO FOREIGN KEY (usuario) REFERENCES USUARIO(nome_login) ON DELETE CASCADE,
    
    avaliacao NUMBER(2, 1) DEFAULT 5.0 NOT NULL,
    CONSTRAINT AVALIACAO_VALIDA_PROP CHECK(0.0 <= avaliacao AND avaliacao <= 5.0),

    n_emprestimos NUMBER(10) DEFAULT 0 NOT NULL
);


CREATE TABLE LOCATARIO(
    usuario VARCHAR2(40) PRIMARY KEY,
    CONSTRAINT FK_LOCATARIO FOREIGN KEY (usuario) REFERENCES USUARIO(nome_login) ON DELETE CASCADE,

    avaliacao NUMBER(2, 1) DEFAULT 5 NOT NULL,
    CONSTRAINT AVALIACAO_VALIDA_LOCAT CHECK(0 <= avaliacao AND avaliacao <= 5),

    n_alugueis NUMBER(10) DEFAULT 0 NOT NULL    
);


CREATE TABLE ORGANIZADOR(
    usuario VARCHAR2(40) PRIMARY KEY,
    CONSTRAINT FK_ORGANIZADOR FOREIGN KEY (usuario) REFERENCES USUARIO(nome_login) ON DELETE CASCADE
);


CREATE TABLE HORA_DISP(
    professor VARCHAR2(40),
    CONSTRAINT FK_DISP_PROF FOREIGN KEY (professor) REFERENCES PROFESSOR(usuario) ON DELETE CASCADE,

    dia_semana VARCHAR2(8),
    hora NUMBER(2),     -- EX: hora 15 siginifica horário disponível das 15:00 às 16:00

    CONSTRAINT CHECK_DIA_SEMANA CHECK(dia_semana IN ('DOMINGO', 'SEGUNDA', 'TERCA', 'QUARTA', 'QUINTA', 'SEXTA', 'SABADO')),
    CONSTRAINT PK_HORA_DISP PRIMARY KEY (professor, dia_semana, hora)
);


CREATE TABLE CLASSIFICACAO_INSTRUMENTO(
    tipo VARCHAR2(30) PRIMARY KEY,      -- EX: violao, baixo, piano, flauta...
    classificacao VARCHAR2(30)          -- EX: cordas, sopro, digital, percussão...
);


CREATE TABLE INSTRUMENTOS_TOCADOS(
    professor VARCHAR2(40),
    tipo_instrumento VARCHAR2(30),

    CONSTRAINT FK_TOCADOS_PROF FOREIGN KEY (professor) REFERENCES PROFESSOR(usuario) ON DELETE CASCADE,
    CONSTRAINT FK_TOCADOS_TIPO_INST FOREIGN KEY (tipo_instrumento) REFERENCES CLASSIFICACAO_INSTRUMENTO(tipo) ON DELETE CASCADE,

    CONSTRAINT PK_TOCADOS PRIMARY KEY (professor, tipo_instrumento)
);


CREATE TABLE AULA(
    data_aula DATE,

    professor VARCHAR2(40),
    aluno VARCHAR2(40) NOT NULL,

    -- Não será possível apagar um usuário que participou de alguma aula.
    CONSTRAINT FK_AULA_PROF FOREIGN KEY (professor) REFERENCES PROFESSOR(usuario),
    CONSTRAINT FK_AULA_ALUNO FOREIGN KEY (aluno) REFERENCES ALUNO(usuario),

    CONSTRAINT PK_AULA PRIMARY KEY (professor, data_aula),

    local VARCHAR2(100) NOT NULL,
    duracao NUMBER(2) DEFAULT 1 NOT NULL ,

    valor NUMBER NOT NULL,
    CONSTRAINT VALOR_VALIDO CHECK(valor >= 0),

    tipo_instrumento VARCHAR2(30) NOT NULL,
    CONSTRAINT FK_AULA_TIPO_INST FOREIGN KEY (tipo_instrumento) REFERENCES CLASSIFICACAO_INSTRUMENTO(TIPO) ON DELETE SET NULL,

    forma_pagamento VARCHAR2(10)  NOT NULL,
    CONSTRAINT CHECK_FORMA_PAGAMENTO CHECK(forma_pagamento IN ('GRATUITO', 'BOLETO', 'CARTAO', 'DINHEIRO'))
    
);

CREATE TABLE INSTRUMENTO(
    nome VARCHAR2(40),

    proprietario VARCHAR2(40),      -- Atributo "usuario" do MR
    
    disponivel CHAR(1) NOT NULL,    -- Atributo "disponibilidade" do MR
    tipo VARCHAR2(30) NOT NULL,
    
    CONSTRAINT CHECK_DISPONIVEL CHECK( disponivel IN ('Y','N')),
    CONSTRAINT FK_INST_PROP FOREIGN KEY (proprietario) REFERENCES PROPRIETARIO(usuario) ON DELETE CASCADE,

    CONSTRAINT PK_INSTRUMENTO PRIMARY KEY (nome, proprietario),
    CONSTRAINT FK_INST_TIPO FOREIGN KEY (tipo) REFERENCES CLASSIFICACAO_INSTRUMENTO(tipo) ON DELETE SET NULL

    
);


CREATE TABLE ALUGUEL(
    instrumento_nome VARCHAR2(40),
    instrumento_dono VARCHAR2(40),

    -- Um usuário que emprestou um instrumento não poderá ser deletado
    CONSTRAINT FK_ALUGUEL_INST FOREIGN KEY (instrumento_nome, instrumento_dono)
                                REFERENCES INSTRUMENTO(nome, proprietario),

    -- Um usuário que alugou um instrumento não poderá ser deletado
    locatario VARCHAR2(40) NOT NULL,
    CONSTRAINT FK_ALUGUEL_LOCAT FOREIGN KEY (locatario) REFERENCES LOCATARIO(usuario),

    data_emprestimo DATE,
    data_devolucao DATE NOT NULL,

    CONSTRAINT PK_AULGUEL PRIMARY KEY (instrumento_dono, instrumento_nome, data_emprestimo),

    avaliacao_prop NUMBER(2, 1) NOT NULL,
    avaliacao_locatario NUMBER(2, 1) NOT NULL,
    CONSTRAINT AVALIACAO_ALUGUEL_PROP CHECK(0 <= avaliacao_prop AND avaliacao_prop <= 5),
    CONSTRAINT AVALIACAO_ALUGUEL_LOCAT CHECK(0 <= avaliacao_locatario AND avaliacao_locatario <= 5),

    forma_pagamento VARCHAR(10) NULL,
    CONSTRAINT CHECK_FORMA_PAGAMENTO_ALUGUEL CHECK(forma_pagamento in ('GRATUITO', 'BOLETO', 'CARTAO', 'DINHEIRO')  )
);


CREATE TABLE LUGAR(
    nome VARCHAR2(100) PRIMARY KEY,

    cidade VARCHAR2(50) NOT NULL,
    bairro VARCHAR2(50) NOT NULL,
    rua VARCHAR2(50) NOT NULL,
    numero NUMBER NOT NULL,
    complemento VARCHAR2(100),

    CONSTRAINT LUGAR_ENDER_UNICO UNIQUE(cidade, bairro, rua, numero, complemento),

    descricao VARCHAR2(300)
);

CREATE TABLE EVENTO(
    id_evento NUMBER PRIMARY KEY,

    data DATE NOT NULL,
    lugar VARCHAR2(100) NOT NULL,

    -- Não será possível deletar um lugar que comportou um evento
    CONSTRAINT FK_EVENTO_LUGAR FOREIGN KEY (lugar) REFERENCES LUGAR(nome),

    CONSTRAINT EVENTO_UNICO UNIQUE(data, lugar),

    -- Um usuário que organizou um evento não poderá ser deletado
    organizador VARCHAR2(40) NOT NULL,
    CONSTRAINT FK_EVENTO_ORG FOREIGN KEY(organizador) REFERENCES ORGANIZADOR(usuario),

    lotacao NUMBER(4) NOT NULL,

    descricao VARCHAR2(300)
);


CREATE TABLE FOTO(
    id_evento NUMBER, 
    url VARCHAR2(2048),

    CONSTRAINT FK_FOTO_EVENTO FOREIGN KEY (id_evento) REFERENCES EVENTO(id_evento) ON DELETE CASCADE
);


CREATE TABLE TIPO_INGRESSO(
    tipo VARCHAR2(40),      -- Ex: pista, camarote, arquibancada...
    id_evento NUMBER,

    CONSTRAINT FK_TIPO_ING_EVENTO FOREIGN KEY (id_evento) REFERENCES EVENTO(id_evento) ON DELETE CASCADE,
    CONSTRAINT PK_TIPO_ING PRIMARY KEY (id_evento, tipo),

    total NUMBER(5) NOT NULL,
    preco NUMBER NOT NULL,
    qt_disponiveis NUMBER NOT NULL,

    CONSTRAINT QT_DISP_VALIDA CHECK (qt_disponiveis <= total)
);


CREATE TABLE INGRESSO(
    codigo_barras NUMBER PRIMARY KEY,

    -- Não será possível deletar um usuário que já comprou algum ingresso.
    usuario VARCHAR2(40) NOT NULL,
    CONSTRAINT FK_INGRESSO_USUARIO FOREIGN KEY (usuario) REFERENCES USUARIO(nome_login),

    -- Não será possível deletar um evento o qual já tenha ingressos vendidos.
    tipo_ingresso VARCHAR2(40) NOT NULL,
    id_evento NUMBER NOT NULL,
    CONSTRAINT FK_INGRESSO_TIPO FOREIGN KEY (id_evento, tipo_ingresso) REFERENCES TIPO_INGRESSO(id_evento, tipo),

    forma_pagamento VARCHAR2(9)  NOT NULL,
    CONSTRAINT CHECK_FORMA_PAGAMENTO_INGRESSO CHECK(forma_pagamento IN ('GRATUITO', 'BOLETO', 'CARTAO', 'DINHEIRO'))
    
);

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
INSERT INTO PROFESSOR (usuario, hora_aula, n_aulas, descricao) VALUES ('tgamer', 30.0, 1, 'Aula completa para iniciantes no assunto.');

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
