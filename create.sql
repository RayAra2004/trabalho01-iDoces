drop table if exists bairro, cidade, cliente_compra, compra, compra_pagamento, compra_produto, endereco, entregador, forma_contato, pagamento, pessoa, produto, tipo_logradouro, tipo_pagamento cascade;

CREATE TABLE PRODUTO (
    codigo serial PRIMARY KEY,
    nome varchar(80),
    valor float,
    descricao varchar(250)
);

CREATE TABLE PAGAMENTO (
    codigo serial PRIMARY KEY,
    valor float,
    fk_TIPO_PAGAMENTO_codigo integer
);

CREATE TABLE PESSOA (
    codigo serial PRIMARY KEY,
    nome varchar(250),
    cpf varchar(14),
	username varchar(80),
	senha varchar(80),
	data_nascimento date,
    fk_ENDERECO_codigo integer,
	fk_FORMA_CONTATO_codigo integer
);

CREATE TABLE ENTREGADOR (
    fk_PESSOA_codigo integer,
	salario float
);

CREATE TABLE COMPRA (
    codigo serial PRIMARY KEY,
	data_hora timestamp,
    fk_ENTREGADOR_codigo integer,
    fk_PESSOA_codigo integer
);

CREATE TABLE TIPO_PAGAMENTO (
    codigo serial NOT NULL PRIMARY KEY,
    descricao varchar(80)
);

CREATE TABLE ENDERECO (
    cep bigint,
    logradouro varchar(255),
    numero integer,
    fk_BAIRRO_codigo integer,
    fk_CIDADE_codigo integer,
    fk_TIPO_LOGRADOURO_codigo integer,
    codigo serial PRIMARY KEY
);

CREATE TABLE COMPRA_PRODUTO (
    qtd integer,
    fk_PRODUTO_codigo integer,
    fk_COMPRA_codigo integer
);

CREATE TABLE BAIRRO (
    codigo serial PRIMARY KEY,
    descricao varchar(80)
);

CREATE TABLE CIDADE (
    codigo serial PRIMARY KEY,
    descricao varchar(80)
);

CREATE TABLE TIPO_LOGRADOURO (
    codigo serial PRIMARY KEY,
    descricao varchar(80)
);

CREATE TABLE FORMA_CONTATO (
    codigo serial PRIMARY KEY,
    celular varchar(20),
	email varchar(100)
);

CREATE TABLE CLIENTE_COMPRA (
    fk_COMPRA_codigo integer,
	fk_PESSOA_codigo integer
);

CREATE TABLE COMPRA_PAGAMENTO (
    fk_COMPRA_codigo integer,
	fk_PAGAMENTO_codigo integer
);

ALTER TABLE PESSOA ADD CONSTRAINT FK_PESSOA_ENDERECO
    FOREIGN KEY (fk_endereco_codigo)
    REFERENCES endereco (codigo);

ALTER TABLE PESSOA ADD CONSTRAINT FK_PESSOA_FORMA_CONTATO
    FOREIGN KEY (fk_forma_contato_codigo)
    REFERENCES forma_contato (codigo);
 
ALTER TABLE ENTREGADOR ADD CONSTRAINT FK_ENTREGADOR_PESSOA
    FOREIGN KEY (fk_pessoa_codigo)
    REFERENCES PESSOA (codigo);

ALTER TABLE PAGAMENTO ADD CONSTRAINT FK_PAGAMENTO_TIPO_PAGAMENTO
    FOREIGN KEY (fk_tipo_pagamento_codigo)
    REFERENCES tipo_pagamento (codigo);
 
ALTER TABLE COMPRA ADD CONSTRAINT FK_COMPRA_ENTREGADOR
    FOREIGN KEY (fk_entregador_codigo)
    REFERENCES PESSOA (codigo);

ALTER TABLE COMPRA ADD CONSTRAINT FK_COMPRA_PESSOA
    FOREIGN KEY (fk_pessoa_codigo)
    REFERENCES PESSOA (codigo);

ALTER TABLE endereco ADD CONSTRAINT FK_endereco_BAIRRO
    FOREIGN KEY (fk_bairro_codigo)
    REFERENCES BAIRRO (codigo);

ALTER TABLE endereco ADD CONSTRAINT FK_endereco_CIDADE
    FOREIGN KEY (fk_cidade_codigo)
    REFERENCES CIDADE (codigo);

ALTER TABLE endereco ADD CONSTRAINT FK_endereco_TIPO_LOGRADOURO
    FOREIGN KEY (fk_tipo_logradouro_codigo)
    REFERENCES TIPO_LOGRADOURO (codigo);

ALTER TABLE CLIENTE_COMPRA ADD CONSTRAINT FK_CLIENTE_COMPRA_COMPRA
    FOREIGN KEY (fk_compra_codigo)
    REFERENCES COMPRA (codigo);
 
ALTER TABLE CLIENTE_COMPRA ADD CONSTRAINT FK_CLIENTE_COMPRA_CLIENTE
    FOREIGN KEY (fk_pessoa_codigo)
    REFERENCES PESSOA (codigo);
 
ALTER TABLE compra_produto ADD CONSTRAINT FK_Compra_produto_PRODUTO
    FOREIGN KEY (fk_PRODUTO_codigo)
    REFERENCES PRODUTO (codigo);
 
ALTER TABLE compra_produto ADD CONSTRAINT FK_Compra_produto_COMPRA
    FOREIGN KEY (fk_COMPRA_codigo)
    REFERENCES COMPRA (codigo);

ALTER TABLE compra_pagamento ADD CONSTRAINT Fk_COMPRA_PAGAMENTO_COMPRA
    FOREIGN KEY (fk_compra_codigo)
    REFERENCES COMPRA (codigo);
 
ALTER TABLE compra_pagamento ADD CONSTRAINT Fk_COMPRA_PAGAMENTO_PAGAMENTO
    FOREIGN KEY (fk_pagamento_codigo)
    REFERENCES PAGAMENTO (codigo);
