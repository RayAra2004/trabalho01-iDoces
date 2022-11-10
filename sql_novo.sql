
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

INSERT INTO PESSOA(username, senha, nome, cpf, fk_endereco_codigo,fk_FORMA_CONTATO_codigo)
values 	('moraesesther', 'the12345', 'Esther Moraes', '000.000.000-00', 1, 1),
		('andradesoso', 'soso12345', 'Sofia Andrade', '111.111.111-11', 2, 2),
		('rayara9', 'ray12345', 'Raynan Araujo', '222.222.222-22', 3, 3),
		('caduchato', 'caca12345', 'Carlos Eduardo Barbosa', '333.333.333-33', 4, 4),
		('maminlinda', 'mamin12345', 'Yasmin Santana', '444.444.444-44', 5, 5),
		('david', 'dada12345', 'Davi Salles', '555.555.555-55', 6, 6),
		('emonunes', 'emo12345', 'Davi Nunes', '666.666.666-66', 7, 7),
		('ariel', 'haha12345', 'Harian Adami', '777.777.777-77',8, 8),
		('kamabate', 'kaka12345', 'Kauã Mateus Terra', '888.888.888-88',9, 9),
		('camsmila', 'caca12345', 'Camila Egydio', '999.999.999-99', 10, 10), 
		('isybelly', 'bebel12345', 'Isabelly Andrades', '101.101.101-10', 11, 11),
		('loret', 'lolo12345', 'Lorena Toraes', '121.121.121-12', 12, 12),
		('pedinho', 'pepe12345', 'Pedro Ramos', '131.131.131-13', 13, 13),
		('jpbarcellos', 'jpjp12345', 'João Pedro Barcellos', '141.141.141-14', 14, 14),
		('eduolmo', 'dudu12345', 'Eduardo Olmo', '151.151.151-15', 15, 15),
		('marilopes', 'mama12345', 'Mariana Lopes', '161.161.161-16', 16, 16),
		('brugms', 'bubu12345', 'Bruna Gomes', '171.171.171-17', 17, 17),
		('caiof', 'caca12345', 'Caio Fraga', '181.181.181-18', 18, 18),
		('moises1', 'momo12345', 'Moisés Omena', '191.191.191-19', 19, 19),
		('willevan', 'will12345', 'Wilsiman Evangelista', '202.202.202-20', 20, 20);

INSERT INTO FORMA_CONTATO(celular, email)
	values 	('98181-4344', 'moraesesther25@ifes.com'),
			('99829-6191', 'andradesoso16@ifes.com'),
			('99527-3201', 'raynan.araujo@ifes.com'),
			('99744-5347', 'cadu.barbosa@ifes.com'),
			('99651-7829', 'maminlinda@ifes.com'),
			('99662-3266', 'davisalles@ifes.com'),
			('99205-1225', 'davinunes@ifes.com'),
			('99895-0028', 'harianadami@ifes.com'),
			('98157-4947', 'kauaterra@ifes.com'),
			('99500-0028', 'camsegydio@ifes.com'),
			('99981-7077', 'isabellyandrades@ifes.com'),
			('99504-6166' , 'loretoraes@ifes.com'),
			('99890-5887', 'pedrosoares@ifes.com'),
			('99986-0303', 'barcellosjp@ifes.com'),
			('99737-6136', 'eduardolmo2ifes.com'),
			('99867-7339' , 'marilopes@ifes.com'),
			('99891-9703', 'brunarocha@ifes.com'),
			('99610-7736','caiofg@ifes.com'),
			('99752-4329', 'moises.bode@ifes.com'),
			('99657-0589', 'wilsiman@ifes.com');
			
INSERT INTO endereco(cep, logradouro, numero, fk_bairro_codigo, fk_cidade_codigo, fk_tipo_logradouro_codigo)
	values  (29162200, 'Limoeiro', 12, 1, 1, 2),
			(29162250, 'São José', 13, 7, 2, 3),
			(29162219, 'Corsanto', 22, 1, 3, 1),
			(29162222, 'Laranjeiras', 14, 2, 6, 1),
			(29162213, 'Mônica', 40, 7, 3, 4),
			(29162214, 'Angelim', 44, 1, 4, 4),
			(29162215, 'Alto da Boa Vista', 85, 4, 5, 2),
			(29162216, 'Eurico', 11, 8, 2, 3),
			(29162218, 'Costa Bela', 289, 10, 6, 4),
			(29162220, 'IFES', 35, 1, 1, 3),
			(29162298, 'FUA', 1001, 1, 1, 4),
			(29162111, 'Andrades', 75, 1, 1, 4),
			(29162900, 'Nascimentos', 90, 1, 5, 1),
			(29162400, 'Manguinhos', 115, 1, 2, 3),
			(29162500, 'Goiaba', 89, 6, 5, 3),
			(29162567, 'Mangueira', 63, 9, 6, 4),
			(29162908, 'Carambola', 25, 12, 3, 2),
			(29162123, 'Moraes', 28, 1, 3, 4),
			(29162456, 'Lado B', 846, 7, 6, 1),
			(29162109, 'Planalto', 339, 2, 2, 4);
			
INSERT INTO bairro(descricao)
	values  ('Morada'),
			('Barcelona'),
			('Jardim da Penha'),
			('Colina'),
			('São Marcos'),
			('São Lourenço'),
			('Vista do Mestre'),
			('Goiabeiras'),
			('Praia do Canto'),
			('Mangus'),
			('Alphaville'),
			('Campinho'),
			('Planalto'),
			('Jardim Bela Vista'),
			('Macafé');
		
INSERT INTO cidade(descricao)
	values	('SERRA'),
			('VILA VELHA'),
			('VITÓRIA'),
			('CARIACICA'),
			('FUNDÃO'),
			('VIANA');

INSERT INTO tipo_logradouro(descricao)
	values	('Rua'),
			('Alameda'),
			('Condomínio'),
			('Avenida');

INSERT INTO entregador(fk_pessoa_codigo, salario)
	values 	(16, 1500.00),
			(17, 2350.00),
			(18, 1000.00),
			(19, 4280.00),
			(20, 1200.00);

INSERT INTO produto(nome, valor, descricao)
	values	('Bolo de chocolate', 8.00, 'Bolo de chocolate belga, vendido em fatias'),
			('Pote da felicidade', 13.00, 'Pote da felicidade (brownie com morango, ninho com Nutella, Ouro Branco)'),
			('Cone', 10.00, 'Cone de ninho trufado'),
			('Brownie', 6.00, 'Brownie tradicional 6cmx6cm'),
			('Coxinha de morango', 7.50, 'Coxinha com massa de brigadeiro branco recheada com um morango'),
			('Bombom', 2.50, 'Bombom de chocolate meio amargo recheado com uva ou morango'),
			('Brigadeiro', 1.00, 'Brigadeiro tradicional, vendido a unidade'),
			('Palha italiana', 5.00, 'Doce realizado com brigadeiro junto a pedaços de biscoito maizena coberto por açúcar de confeiteiro'),
			('Bolo de pote', 9.00, 'Bolo gelado de ninho com nutella'),
			('Torta de limão', 15.00, 'Torta feita com massa de biscoito Maria, e raspas de limão. Vendido a fatia'),
			('Cookie', 10.00, 'Cookie de massa tradicional com gotas de chocolate'),
			('Coxinha de morango', 7.50, 'Coxinha com massa de brigadeiro branco recheada com um morango'),
			('Bento cake', 40.5, 'Bolo personalizado de 10cm, recheio de brigadeiro branco e morangos'),
			('Banoffee', 16.00, 'Torta feita de bananas, creme e uma calda de caramelo, com sua base de biscoitos. Vendido a fatia'),
			('Torta de Ninho com Nutella', 15.00, 'Torta feita com massa de leite ninho recheado de nutella. Vendido a fatia'),
			('Cucuz doce', 4.50, 'Feito a base de tapioca junto a coco fresco ralado e leite condensado'),
			('Cheesecake', 22.00, 'Casquinha de biscoito crocante e um recheio à base de cream cheese, coberto com geleia de morangos frescos.');

INSERT INTO compra_produto(qtd, fk_produto_codigo, fk_compra_codigo)
	values	(3, 1, 1),
			(10, 2, 2),
			(1, 3, 3),
			(15, 4, 4),
			(5, 5, 5),
			(4, 6, 6),
			(3, 7, 7),
			(3, 8, 8),
			(1, 9, 9),
			(2, 10, 10),
			(5, 11, 11),
			(7, 12, 12),
			(1, 13, 13),
			(1, 14, 14),
			(3, 15, 15),
			(4, 1, 16),
			(25, 2, 17),
			(28, 3, 18),
			(1, 4, 19),
			(3, 5, 20);

INSERT INTO compra(data_hora, fk_pessoa_codigo, fk_entregador_codigo)
	values	('2022-09-13 14:01:12', 2, 5),
			('2022-10-22 15:03:13', 10, 1),
			('2022-08-11 11:10:11', 1, 3),
			('2022-01-12 12:12:14', 4, 2),
			('2022-10-17 15:02:15', 3, 2),
			('2022-10-15 12:03:16', 11, 4),
			('2022-07-11 16:04:11', 3, 1),
			('2022-09-11 16:05:14', 8, 2),
			('2022-09-12 16:17:10', 6, 3),
			('2022-10-10 18:22:10', 9, 4),
			('2022-09-21 19:23:11', 5, 5),
			('2022-04-28 10:13:00', 1, 5),
			('2022-09-03 16:40:21', 15, 2),
			('2022-10-08 13:00:44', 6, 3),
			('2022-10-27 14:08:00', 14, 1),
			('2022-10-21 16:28:11', 15, 1),
			('2022-10-25 18:29:33', 7, 4),
			('2022-10-24 20:25:18', 14, 2),
			('2022-08-18 15:18:21', 12, 3),
			('2022-07-18 14:18:13', 13, 5);



INSERT INTO CLIENTE_COMPRA(fk_compra_codigo, fk_pessoa_codigo)
	values	(1, 2),
			(2, 10),
			(3, 1),
			(4, 4),
			(5, 3),
			(6, 11),
			(7, 3),
			(8, 8),
			(9, 6),
			(10, 9),
			(11, 5),
			(12, 1),
			(13, 15),
			(14, 6),
			(15, 14),
			(16, 15),
			(17, 7),
			(18, 14),
			(19, 12),
			(20, 13);

INSERT INTO PAGAMENTO(valor, fk_tipo_pagamento_codigo)
	values	(24, 1),
			(130, 5),
			(10, 2),
			(90, 3),
			(37.5, 5),
			(10, 4),
			(3, 5),
			(15, 3),
			(9, 5),
			(30, 1),
			(50, 4),
			(283.5, 2),
			(16, 2),
			(15, 3),
			(66, 4),
			(32, 2),
			(325, 1),
			(280, 2),
			(6, 2),
			(22.5, 3);

INSERT INTO COMPRA_PAGAMENTO(fk_pagamento_codigo, fk_compra_codigo)
	values	(1, 1),
			(2, 2),
			(3, 3),
			(4, 4),
			(5, 5),
			(6, 6),
			(7, 7),
			(8, 8),
			(9, 9),
			(10, 10),
			(11, 11),
			(12, 12),
			(13, 13),
			(14, 14),
			(15, 15),
			(16, 16),
			(17, 17),
			(18, 18),
			(19, 19),
			(20, 20);

INSERT INTO tipo_pagamento(descricao)
	values	('PIX'),
			('PIC PAY'),
			('DINHEIRO'),
			('CARTÃO DÉBITO'),
			('CARTÃO CRÉDITO');

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
