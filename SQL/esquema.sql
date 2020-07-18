drop table USUARIO cascade constraints;
drop table CONTA cascade constraints;
drop table CARTAO cascade constraints;
drop table DENUNCIA cascade constraints;
drop table CONVERSA cascade constraints;
drop table TIPO_USUARIO cascade constraints;
drop table ALUNO cascade constraints;
drop table PROFESSOR cascade constraints;
drop table PROPRIETARIO cascade constraints;
drop table LOCATARIO cascade constraints;
drop table ORGANIZADOR cascade constraints;
drop table HORA_DISP cascade constraints;
drop table CLASSIFICACAO_INSTRUMENTO cascade constraints;
drop table INSTRUMENTOS_TOCADOS cascade constraints;
drop table AULA cascade constraints;
drop table INSTRUMENTO cascade constraints;
drop table ALUGUEL cascade constraints;
drop table LUGAR cascade constraints;
drop table EVENTO cascade constraints;
drop table FOTO cascade constraints;
drop table TIPO_INGRESSO cascade constraints;
drop table INGRESSO cascade constraints;

CREATE TABLE USUARIO(
    nome_login VARCHAR2(40) PRIMARY KEY,

    CPF VARCHAR2(14),
    CONSTRAINT UNIQUE_CPF UNIQUE(CPF),
    CONSTRAINT CK_CPF CHECK(REGEXP_LIKE(CPF, '[0-9]{3}\.[0-9]{3}\.[0-9]{3}\-[0-9]{2}')),

    nome VARCHAR2(100) NOT NULL,
    senha VARCHAR2(40) NOT NULL,

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
    CONSTRAINT CHAVE_ALFABETICA CHECK(usuario1 < usuario2),
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

    n_alugueis NUMBER(10) DEFAULT 1 NOT NULL    
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
    CONSTRAINT FK_AULA_ALUNO FOREIGN KEY (aluno) REFERENCES ALUNO(usuario),

    CONSTRAINT PK_AULA PRIMARY KEY (professor, data_aula),

    tipo_instrumento VARCHAR2(30) NOT NULL,
    CONSTRAINT FK_AULA_INST_TOCADOS FOREIGN KEY (professor, tipo_instrumento) REFERENCES INSTRUMENTOS_TOCADOS(professor, tipo_instrumento),

    local VARCHAR2(100) NOT NULL,
    duracao NUMBER(2) DEFAULT 1 NOT NULL,

    valor NUMBER NOT NULL,
    CONSTRAINT VALOR_VALIDO CHECK(valor >= 0),


    forma_pagamento VARCHAR2(10)  NOT NULL,
    CONSTRAINT CHECK_FORMA_PAGAMENTO CHECK(forma_pagamento IN ('GRATUITO', 'BOLETO', 'CARTAO', 'DINHEIRO'))
    
);

CREATE TABLE INSTRUMENTO(
    nome VARCHAR2(40),

    proprietario VARCHAR2(40),      -- Atributo "usuario" do MR
    
    disponivel CHAR(1) DEFAULT 'Y' NOT NULL,    -- Atributo "disponibilidade" do MR
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

    avaliacao_prop NUMBER(2, 1) NOT NULL,       -- Avalia��o do locat�rio para o propriet�rio
    avaliacao_locatario NUMBER(2, 1) NOT NULL,  -- Avalia��o do propriet�rio para o locat�rio
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



