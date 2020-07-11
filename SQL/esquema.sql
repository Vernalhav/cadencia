
-- MEGA TODO: determinar ON DELETE das FKs! CTRL+F "FK_"

CREATE TABLE USUARIO(
    nome_login VARCHAR2(40) PRIMARY KEY,

    CPF VARCHAR2(14),
    CONSTRAINT UNIQUE_CPF UNIQUE(CPF),
    CONSTRAINT CK_CPF CHECK(REGEXP_LIKE(CPF, '[0-9]{3}\.[0-9]{3}\.[0-9]{3}\-[0-9]{2}'))

    nome VARCHAR2(100),
    senha VARCHAR2(40)

    cidade VARCHAR2(30) NOT NULL,
    bairro VARCHAR2(30) NOT NULL,
    rua VARCHAR2(50) NOT NULL,
    numero NUMBER(5) NOT NULL,
    complemento VARCHAR2(150)
);


CREATE TABLE CONTA(
    usuario VARCHAR2(40) PRIMARY KEY,
    CONSTRAINT FK_CONTA FOREIGN KEY usuario REFERENCES USUARIO(nome_login),

    -- TODO: checks e tamanhos
    agencia VARCHAR2() NOT NULL,
    conta_corrente VARCHAR2() NOT NULL,
    banco VARCHAR2() NOT NULL
);


CREATE TABLE CARTAO(
    usuario VARCHAR2(40),
    numero VARCHAR2(16),    -- TODO: Verificação

    CONSTRAINT FK_CONTA FOREIGN KEY usuario REFERENCES USUARIO(nome_login),
    CONSTRAINT PK_CARTAO PRIMARY KEY (usuario, numero),

    CVV NUMBER(3) NOT NULL,
    validade VARCHAR2(5) NOT NULL,      -- TODO: Verificação
    proprietario VARCHAR2(50) NOT NULL
);


CREATE TABLE DENUNCIA(
    denunciado VARCHAR2(40),
    autor VARCHAR2(40),

    
    CONSTRAINT FK_DENUNCIADO FOREIGN KEY denunciado REFERENCES USUARIO(nome_login)
    CONSTRAINT FK_AUTOR FOREIGN KEY autor REFERENCES USUARIO(nome_login)

    data TIMESTAMP,
    CONSTRAINT PK_DENUNCIA PRIMARY KEY (denunciado, autor, data)

    conteudo VARCHAR2(200) NOT NULL
);


CREATE TABLE CONVERSA(
    usuario1 VARCHAR2(40),
    usuario2 VARCHAR2(40),

    
    CONSTRAINT FK_USER1 FOREIGN KEY usuario1 REFERENCES USUARIO(nome_login),
    CONSTRAINT FK_USER2 FOREIGN KEY usuario2 REFERENCES USUARIO(nome_login),

    -- Também remove a possibilidade de usuario1 = usuario2
    CONSTRAINT CHAVE_ALFABETICA CHECK(usuario1 < usuario2),  -- TODO: comparação direta?
    CONSTRAINT PK_CONVERSA PRIMARY KEY (usuario1, usuario2),

    arquivo_conversa VARCHAR2(60) NOT NULL  -- TODO: como funciona arquivo/referencia em banco?
);


CREATE TABLE TIPO_USUARIO(
    usuario VARCHAR2(40),
    CONSTRAINT FK_USER_TYPE FOREIGN KEY usuario REFERENCES USUARIO(nome_login),

    tipo ENUM('ALUNO', 'PROFESSOR', 'PROPRIETARIO', 'LOCATARIO', 'ORGANIZADOR') NOT NULL,

    CONSTRAINT PK_USER_TYPE PRIMARY KEY (usuario, tipo)
);


CREATE TABLE ALUNO(
    usuario VARCHAR2(40),

    CONSTRAINT FK_ALUNO FOREIGN KEY usuario REFERENCES USUARIO(nome_login),
);


CREATE TABLE PROFESSOR(
    usuario VARCHAR2(40) PRIMARY KEY,
    CONSTRAINT FK_PROFESSOR FOREIGN KEY usuario REFERENCES USUARIO(nome_login),

    hora_aula NUMBER NOT NULL,
    n_aulas NUMBER(10) DEFAULT 0 NOT NULL,

    descricao VARCHAR2(300)
);


CREATE TABLE PROPRIETARIO(
    usuario VARCHAR2(40) PRIMARY KEY,
    CONSTRAINT FK_PROPRIETARIO FOREIGN KEY usuario REFERENCES USUARIO(nome_login),
    
    -- TODO: Decidir escala da avaliação e cálculo corrente
    avaliacao NUMBER(1, 1) DEFAULT 5 NOT NULL,
    CONSTRAINT AVALIACAO_VALIDA_PROP CHECK(0 <= avaliacao && avaliacao <= 5),

    n_emprestimos NUMBER(10) DEFAULT 0 NOT NULL
);


CREATE TABLE LOCATARIO(
    usuario VARCHAR2(40) PRIMARY KEY,
    CONSTRAINT FK_LOCATARIO FOREIGN KEY usuario REFERENCES USUARIO(nome_login),

    -- TODO: Decidir escala da avaliação e cálculo corrente
    avaliacao NUMBER(1, 1) DEFAULT 5 NOT NULL,
    CONSTRAINT AVALIACAO_VALIDA_LOCAT CHECK(0 <= avaliacao && avaliacao <= 5),

    n_alugueis NUMBER(10) DEFAULT 0 NOT NULL    
);


CREATE TABLE ORGANIZADOR(
    usuario VARCHAR2(40) PRIMARY KEY,
    CONSTRAINT FK_ORGANIZADOR FOREIGN KEY usuario REFERENCES USUARIO(nome_login),
);


CREATE TABLE HORA_DISP(
    professor VARCHAR2(40),
    CONSTRAINT FK_DISP_PROF FOREIGN KEY professor REFERENCES PROFESSOR(nome_login),

    -- TODO: melhorar implementação/checks
    dia_semana CHAR(1),
    hora NUMBER(2),

    CONSTRAINT PK_HORA_DISP PRIMARY KEY (professor, dia_semana, hora)
);


CREATE TABLE CLASSIFICACAO_INSTRUMENTO(
    tipo VARCHAR2(30) PRIMARY KEY,      -- EX: violao, baixo, piano, flauta...
    classificacao VARCHAR2(30)          -- EX: cordas, sopro, digital, percussão...
);

CREATE TABLE INSTRUMENTOS_TOCADOS(
    professor VARCHAR2(40),
    tipo_instrumento VARCHAR2(30),

    CONSTRAINT FK_TOCADOS_PROF FOREIGN KEY professor REFERENCES PROFESSOR(nome_login),
    CONSTRAINT FK_TOCADOS_TIPO_INST FOREIGN KEY tipo_instrumento REFERENCES CLASSIFICACAO_INSTRUMENTO(tipo),

    CONSTRAINT PK_TOCADOS PRIMARY KEY (professor, tipo_instrumento),
);


CREATE TABLE AULA(
    data_aula DATETIME,

    professor VARCHAR2(40),
    aluno VARCHAR2(40) NOT NULL,

    CONSTRAINT FK_AULA_PROF FOREIGN KEY professor REFERENCES PROFESSOR(nome_login),
    CONSTRAINT FK_AULA_ALUNO FOREIGN KEY aluno REFERENCES ALUNO(nome_login),

    CONSTRAINT PK_AULA PRIMARY KEY (professor, data_aula),

    -- TODO: Vamos implementar local da aula assim?
    local VARCHAR2(100) NOT NULL,
    duracao NUMBER(2) NOT NULL DEFAULT 1,

    valor NUMBER NOT NULL,
    CONSTRAINT VALOR_VALIDO CHECK(valor >= 0),

    tipo_instrumento VARCHAR2(30) NOT NULL,
    CONSTRAINT FK_AULA_TIPO_INST FOREIGN KEY instrumento REFERENCES CLASSIFICACAO_INSTRUMENTO(instrumento),

    forma_pagamento ENUM('GRATUITO', 'BOLETO', 'CARTAO', 'DINHEIRO')
);


CREATE TABLE INSTRUMENTO(
    nome VARCHAR2(40),

    proprietario VARCHAR2(40),      -- Atributo "usuario" do MR
    CONSTRAINT FK_INST_PROP FOREIGN KEY proprietario REFERENCES PROPRIETARIO(nome_login),

    CONSTRAINT PK_INSTRUMENTO PRIMARY KEY (nome, proprietario),

    tipo VARCHAR2(30) NOT NULL,
    
    CONSTRAINT FK_INST_TIPO FOREIGN KEY tipo REFERENCES CLASSIFICACAO_INSTRUMENTO(instrumento),

    disponivel BOOLEAN NOT NULL DEFAULT YES     -- Atributo "disponibilidade" do MR
);