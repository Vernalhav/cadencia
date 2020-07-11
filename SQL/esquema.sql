CREATE TABLE USUARIOS(
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
    CONSTRAINT FK_CONTA FOREIGN KEY usuario REFERENCES USUARIOS(nome_login),    -- TODO: ON DELETE/UPDATE?

    -- TODO: checks e tamanhos
    agencia VARCHAR2() NOT NULL,
    conta_corrente VARCHAR2() NOT NULL,
    banco VARCHAR2() NOT NULL
);


CREATE TABLE CARTAO(
    usuario VARCHAR2(40),
    numero VARCHAR2(16),    -- TODO: Verificação

    CONSTRAINT FK_CONTA FOREIGN KEY usuario REFERENCES USUARIOS(nome_login),    -- TODO: ON DELETE/UPDATE?
    CONSTRAINT PK_CARTAO PRIMARY KEY (usuario, numero),

    CVV NUMBER(3) NOT NULL,
    validade VARCHAR2(5) NOT NULL,      -- TODO: Verificação
    proprietario VARCHAR2(50) NOT NULL
);


CREATE TABLE DENUNCIA(
    denunciado VARCHAR2(40),
    autor VARCHAR2(40),

    -- TODO: On delete...
    CONSTRAINT FK_DENUNCIADO FOREIGN KEY denunciado REFERENCES USUARIOS(nome_login)
    CONSTRAINT FK_AUTOR FOREIGN KEY autor REFERENCES USUARIOS(nome_login)

    data TIMESTAMP,
    CONSTRAINT PK_DENUNCIA PRIMARY KEY (denunciado, autor, data)

    conteudo VARCHAR2(200) NOT NULL
);


CREATE TABLE CONVERSA(
    usuario1 VARCHAR2(40),
    usuario2 VARCHAR2(40),

    -- TODO: On delete...
    CONSTRAINT FK_USER1 FOREIGN KEY usuario1 REFERENCES USUARIOS(nome_login),
    CONSTRAINT FK_USER2 FOREIGN KEY usuario2 REFERENCES USUARIOS(nome_login),

    -- Também remove a possibilidade de usuario1 = usuario2
    CONSTRAINT CHAVE_ALFABETICA CHECK(usuario1 < usuario2),  -- TODO: comparação direta?
    CONSTRAINT PK_CONVERSA PRIMARY KEY (usuario1, usuario2),

    arquivo_conversa VARCHAR2(60) NOT NULL  -- TODO: como funciona arquivo/referencia em banco?
);


CREATE TABLE TIPO_USUARIO(
    usuario VARCHAR2(40),

    -- TODO: On delete...
    CONSTRAINT FK_USER_TYPE FOREIGN KEY usuario REFERENCES USUARIOS(nome_login),

    tipo NUMBER(1) NOT NULL,
    CONSTRAINT TIPO_VALIDO CHECK(0 <= tipo and tipo <= 5)
);


CREATE TABLE ALUNO(
    usuario VARCHAR2(40),

    -- TODO: On delete...
    CONSTRAINT FK_ALUNO FOREIGN KEY usuario REFERENCES USUARIOS(nome_login),
);


CREATE TABLE PROFESSOR(
    usuario VARCHAR2(40),

    -- TODO: On delete...
    CONSTRAINT FK_PROFESSOR FOREIGN KEY usuario REFERENCES USUARIOS(nome_login),

    hora_aula NUMBER NOT NULL,
    n_aulas NUMBER(10) DEFAULT 0 NOT NULL,

    descricao VARCHAR2(300)
);


CREATE TABLE PROPRIETARIO(
    usuario VARCHAR2(40),

    -- TODO: On delete...
    CONSTRAINT FK_PROPRIETARIO FOREIGN KEY usuario REFERENCES USUARIOS(nome_login),

    -- TODO: Decidir escala da avaliação e cálculo corrente
    avaliacao NUMBER(1, 1) DEFAULT 5 NOT NULL,
    CONSTRAINT AVALIACAO_VALIDA_PROP CHECK(0 <= avaliacao && avaliacao <= 5),

    n_emprestimos NUMBER(10) DEFAULT 0 NOT NULL
);


CREATE TABLE LOCATARIO(
    usuario VARCHAR2(40),

    -- TODO: On delete...
    CONSTRAINT FK_LOCATARIO FOREIGN KEY usuario REFERENCES USUARIOS(nome_login),

    -- TODO: Decidir escala da avaliação e cálculo corrente
    avaliacao NUMBER(1, 1) DEFAULT 5 NOT NULL,
    CONSTRAINT AVALIACAO_VALIDA_LOCAT CHECK(0 <= avaliacao && avaliacao <= 5),

    n_alugueis NUMBER(10) DEFAULT 0 NOT NULL    
);


CREATE TABLE ORGANIZADOR(
    usuario VARCHAR2(40),

    -- TODO: On delete...
    CONSTRAINT FK_ORGANIZADOR FOREIGN KEY usuario REFERENCES USUARIOS(nome_login),
);