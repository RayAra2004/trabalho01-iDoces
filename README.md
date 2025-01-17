# TRABALHO 01: iDoces
Trabalho desenvolvido durante a disciplina de Banco de dados

## Sumário

### 1. COMPONENTES<br>

Integrantes do Grupo:<br>
Carlos Eduardo Souza Barbosa: cesbarbosa2005@gmail.com<br>
Esther Moraes Nascimento: moraesesther25@gmail.com<br>
Raynan Araujo da Silva: raynan.araujo.ifes@gmail.com<br>
Sofia Andrade Nascimento: andradesoso16@gmail.com<br>

### 2. INTRODUÇÃO E MOTIVAÇÃO<br>

> Nossa história começou em 2006, onde as sócias Esther e Sofia adquiriram um food truck que intitularam de “docEriaS”, ficaram muito conhecidas pela população da comunidade e o jornal local como os melhores doces da comunidade, com isso nossa fama foi aumentando cada vez mais e consequentemente o número de clientes também, por isso contrataram a empresa CarnanTech, pertencente aos, futuramente, sócios Carlos Eduardo e Raynan, para que pudessem dar conta de todos os pedidos com excelência pedimos que criassem uma aplicação para solucionar nosso problema. A partir desse momento, unificamos as duas pequenas empresas e nos tornamos um grande delivery de guloseimas, que foi nomeado de “iDoce”.

### 3. MINI-MUNDO<br>

> Neste sistema temos as pessoas (podendo ser cliente ou entregador), onde iremos armazenar seu username, senha, nome, forma de contato (celular, email), cpf, data de nascimento e endereço (que contém CEP, logradouro, tipo de logradouro, número, bairro e cidade). O entregador é uma pessoa, sendo que entregador possui salário. A pessoa realiza uma ou várias compras e uma compra é realizada por uma ou várias pessoas, que ao ser realizada armazena um código e a data e hora da mesma. Esta compra refere-se a um produto, armazenando a quantidade de produtos. Sendo que uma compra possui um ou vários produtos, que têm código, nome, descrição, valor e um produto é referente a várias compras. A compra também possui um pagamento, que contém código, valor e tipo de pagamento, sendo que uma compra tem uma ou várias formas de pagamento e um pagamento é de várias compras. 
Por fim, temos o entregador realizando a entrega de várias compras e uma compra é entregue por apenas um entregador.

### 4. PERGUNTAS A SEREM RESPONDIDAS E TABELA DE DADOS<br>
#### 4.1 QUAIS PERGUNTAS PODEM SER RESPONDIDAS COM O SISTEMA PROPOSTO?
    
> A Empresa iDoces precisa inicialmente dos seguintes relatórios:
* Relatório que mostre o nome do entregador que fez mais entregas e a quantidade de entregas feitas em ordem descrecente.

* Relatório relativo a cidade e pedidos. O resultado deve conter o nome da cidade e a quantidade de pedidos feitos em ordem descrecente.

* Relatório referente a produto e compra. O resultado deve conter o nome do produto mais cobiçado, ou seja, o mais comprado e a quantidade de compras feitas em ordem descrecente.

* Relatório sobre o valor total de vendas em um determinado período de tempo. O resultado deve conter as datas(referente ao período) e o valor total de vendas.

* Relatório sobre o meio de pagamento. O resultado deve conter o nome do meio de pagamento mais utilizado e quantidade de vezes utilizada em ordem descrecente.

 ### 5. MODELO CONCEITUAL<br>
        
![Alt text](https://github.com/RayAra2004/trabalho01-iDoces/blob/main/modelo_conceitual.png?raw=true)      
    
#### 5.1 Validação do Modelo Conceitual
    [Grupo01]: [Camila Egydio, Davi Nunes, Isabelly Andrades e Yasmin Santana]
    [Grupo02]: [Davi Salles, Lorena Toraes e Wilsiman Evangelista]

#### 5.2 Descrição dos dados 
         PESSOA: Tabela que armazena as informações relativas as pessoas.
           codigo: campo que armazena um código único relativo a cada pessoa.
           username: campo que armazena a identificação da pessoa.
           senha: campo que armazena a autenticação do username.
           nome: campo referente ao nome da pessoa.
           cpf: campo referente ao CPF da pessoa.
	       data_nascimento: campo referente a data de nascimento da pessoa.
           forma_contato: campo multivalorado e composto que tem as formas de contato:
             celular: campo que armazena o número da pessoa.
             email: campo que armazena o email da pessoa.
           endereco: campo que armazena o endereço de uma pessoa:
             cep: campo que armazana o CEP relativo ao endereço.
             logradouro: campo que armazana o logradouro relativo ao endereço.
             numero: campo que armazana o numero relativo ao endereço.
             bairro: campo que armazana o bairro relativo ao endereço.
             cidade: campo que armazana o cidade relativo ao endereço.
             tipo_logradouro: campo que armazana o tipo_logradouro relativo ao endereço.
         ENTREGADOR: Tabela que armazena informações referente ao entregador:
           salario: campo que armazena o valor recebido referente ao trabalho do entregador.
         COMPRA: Tabela referente as compras realizadas:
           codigo: campo que armazena o código referente a cada compra
         Compra_produto: relacionamento da compra de um produto.
           data_hora: campo que armazena a data e a hora de cada compra.
           qtd: campo que armazena a quantidade de produtos de cada compra.
         PAGAMENTO: Tabela que aramazena os meios de pagamentos possíveis para realizar uma compra.
           tipo_pagamento: campo multivalorado que armazena a os tipos de pagamento.
           valor: campo referente ao valor pago na compra.
           codigo: campo que armazena o código de cada pagamento.
         PRODUTO: Tabela que armazena as informações de cada produto.
           codigo: campo que possui o código de cada produto.
           nome: campo que possui o código de cada produto.
           valor: campo que possui o código de cada produto.
           descricao: campo que possuia descrição de cada produto.
  <br>

### 6. MODELO LÓGICO<br>
![Alt text](https://github.com/RayAra2004/trabalho01-iDoces/blob/main/modelo_logico.png?raw=true)

### 7.	MODELO FÍSICO<br>

	--drop table if exists bairro, cidade, cliente_compra, compra, compra_pagamento, compra_produto, endereco, entregador, forma_contato, pagamento, pessoa, produto, tipo_logradouro, tipo_pagamento cascade;

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

### 8.	INSERT APLICADO NAS TABELAS DO BANCO DE DADOS<br>

	INSERT INTO PESSOA(username, senha, nome, cpf, data_nascimento, fk_endereco_codigo, fk_FORMA_CONTATO_codigo)
		values 		('moraesesther', 'the12345', 'Esther Moraes', '000.000.000-00', '2000-04-25', 1, 1),
				('andradesoso', 'soso12345', 'Sofia Andrade', '111.111.111-11', '2000-01-28', 2, 2),
				('rayara9', 'ray12345', 'Raynan Araujo', '222.222.222-22', '2004-07-09', 3, 3),
				('caduchato', 'caca12345', 'Carlos Eduardo Barbosa', '333.333.333-33', '1998-05-02', 4, 4),
				('maminlinda', 'mamin12345', 'Yasmin Santana', '444.444.444-44', '2000-03-08', 5, 5),
				('david', 'dada12345', 'Davi Salles', '555.555.555-55', '1995-03-18', 6, 6),
				('emonunes', 'emo12345', 'Davi Nunes', '666.666.666-66', '1998-07-27',7, 7),
				('ariel', 'haha12345', 'Harian Adami', '777.777.777-77', '1995-03-19',8, 8),
				('kamabate', 'kaka12345', 'Kauã Mateus Terra', '888.888.888-88', '2003-12-27', 9, 9),
				('camsmila', 'caca12345', 'Camila Egydio', '999.999.999-99', '2001-04-14', 10, 10), 
				('isybelly', 'bebel12345', 'Isabelly Andrades', '101.101.101-10', '2001-03-08', 11, 11),
				('loret', 'lolo12345', 'Lorena Toraes', '121.121.121-12', '2004-08-24', 12, 12),
				('pedinho', 'pepe12345', 'Pedro Ramos', '131.131.131-13', '1996-09-02', 13, 13),
				('jpbarcellos', 'jpjp12345', 'João Pedro Barcellos', '141.141.141-14', '1991-11-15', 14, 14),
				('eduolmo', 'dudu12345', 'Eduardo Olmo', '151.151.151-15', '1955-10-21', 15, 15),
				('marilopes', 'mama12345', 'Mariana Lopes', '161.161.161-16', '2004-04-21', 16, 16),
				('brugms', 'bubu12345', 'Bruna Gomes', '171.171.171-17', '1990-06-12', 17, 17),
				('caiof', 'caca12345', 'Caio Fraga', '181.181.181-18', '2002-12-02', 18, 18),
				('moises1', 'momo12345', 'Moisés Omena', '191.191.191-19', '1999-01-13', 19, 19),
				('willevan', 'will12345', 'Wilsiman Evangelista', '202.202.202-20', '1993-09-03', 20, 20),
				('lyss', 'lyly12345', 'Lyssander Thundermen', '212.212.212-21', '1986-03-08', 2, 21),
				('angel', 'gege12345', 'Angelica Silveira', '232.232.232-23', '1981-02-26', 1, 22),
				('pie', 'baba12345', 'Bárbara Pissarra', '242.242.242-24', '1997-12-17', 2, 23),
				('tininha', 'vava12345', 'Valentina Costa', '252.252.252-25', '1985-02-27', 1, 24);

	INSERT INTO FORMA_CONTATO(celular, email)
		values 		('98181-4344', 'moraesesther25@ifes.com'),
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
				('99657-0589', 'wilsiman@ifes.com'),
				('98838-8919', 'lyssthunder@ifes.com'),
				('99291-0382', 'angelsilveira@ifes.com'),
				('99735-8233', 'barbarapissarra@ifes.com'),
				('99856-8854', 'valencosta@ifes.com');

	INSERT INTO endereco(cep, logradouro, numero, fk_bairro_codigo, fk_cidade_codigo, fk_tipo_logradouro_codigo)
		values  	(29162200, 'Limoeiro', 12, 1, 1, 2),
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
		values  	('Morada'),
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
				('Macafé'),
				('Cobilândia'),
				('Porto de Santana'),
				('Rio Marinho');

	INSERT INTO cidade(descricao)
		values		('SERRA'),
				('VILA VELHA'),
				('VITÓRIA'),
				('CARIACICA'),
				('FUNDÃO'),
				('VIANA');

	INSERT INTO tipo_logradouro(descricao)
		values		('Rua'),
				('Alameda'),
				('Condomínio'),
				('Avenida');

	INSERT INTO entregador(fk_pessoa_codigo, salario)
		values 		(16, 1500.00),
				(17, 2350.00),
				(18, 1000.00),
				(19, 4280.00),
				(20, 1200.00);

	INSERT INTO produto(nome, valor, descricao)
		values		('Bolo de chocolate', 8.00, 'Bolo de chocolate belga, vendido em fatias'),
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
				('Cheesecake', 22.00, 'Casquinha de biscoito crocante e um recheio à base de cream cheese, coberto com geleia de morangos frescos.'),
				('Bolo de Red Velvet', 12.00, 'Bolo de textura muito leve e macia, levemente amanteigado e com um discreto sabor a chocolate, vendido em fatias'),
				('Cocada', 3.00, 'Doce à base de coco');

	INSERT INTO compra_produto(qtd, fk_produto_codigo, fk_compra_codigo)
		values		(3, 1, 1),
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
		values		('2022-11-10 14:01:12', 2, 20),
				('2022-10-22 15:03:13', 10, 16),
				('2022-08-11 11:10:11', 1, 18),
				('2022-01-12 12:12:14', 4, 17),
				('2022-10-17 15:02:15', 3, 17),
				('2022-11-08 12:03:16', 11, 19),
				('2022-07-11 16:04:11', 3, 16),
				('2022-09-11 16:05:14', 8, 17),
				('2022-11-11 16:17:10', 6, 18),
				('2022-10-10 18:22:10', 9, 19),
				('2022-09-21 19:23:11', 5, 20),
				('2022-11-07 10:13:00', 1, 20),
				('2022-09-03 16:40:21', 15, 17),
				('2022-10-08 13:00:44', 6, 18),
				('2022-10-27 14:08:00', 14, 16),
				('2022-11-10 16:28:11', 15, 16),
				('2022-10-25 18:29:33', 7, 19),
				('2022-10-24 20:25:18', 14, 17),
				('2022-11-09 15:18:21', 12, 18),
				('2022-11-09 14:18:13', 13, 20);

	INSERT INTO CLIENTE_COMPRA(fk_compra_codigo, fk_pessoa_codigo)
		values		(1, 2),
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
		values		(24, 1),
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
		values		(1, 1),
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
		values		('PIX'),
				('PIC PAY'),
				('DINHEIRO'),
				('CARTÃO DÉBITO'),
				('CARTÃO CRÉDITO'),
				('CHEQUE');
   
         

### 9.	TABELAS E PRINCIPAIS CONSULTAS<br>
#### 9.1	CONSULTAS DAS TABELAS COM TODOS OS DADOS INSERIDOS (Todas) <br> 
[Colab - iDoces](https://colab.research.google.com/drive/1oZk6KvPkMWBv3hGdXr2CigjIyJSSYesY?usp=sharing)
># MARCO DA ENTREGA 01: DO ITEM 1 AO ITEM 9.1<br>
<br>

#### 9.2	CONSULTAS DAS TABELAS COM FILTROS WHERE (Mínimo 4)<br>
	1- Objetivo: Visualizar os produtos através do seu valor, dentro de uma faixa de preço específica (Entre 7 e 20 no exemplo).
	2- Objetivo: Visualizar os entregadores através do seu salário, sendo ele superior ou inferior a algum valor específico (Valor de 2000 reais no exemplo).
	3- Objetivo: Visualizar os produtos de acordo com a menor venda dele em relação à uma quantidade específica de vendas (5 vendas no exemplo).
	4- Objetivo: Visualizar as cidades de acordo com a menor quantidade de pedidos daquela região, em relação à uma quantidade específica (10 pedidos no exemplo).
	

#### 9.3	CONSULTAS QUE USAM OPERADORES LÓGICOS, ARITMÉTICOS E TABELAS OU CAMPOS RENOMEADOS (Mínimo 11)
	1- Objetivo: Calcular e visualizar o bônus em conjunto ao salário do entregador de acordo com seu desempenho, sendo o bônus consequência de entregadores que possuem o número de entregas superior a 3.
	2- Objetivo: Calcular e visualizar um desconto de x% para produtos com o valor > x, no exemplo 70% quando o produto for maior que 20 reais.
 	3- Objetivo: Calcular e visualizar o desconto em conjunto ao valor dos produtos de acordo com sua demanda, sendo o desconto consequência de produtos menos procurados, que possuem a quantidade de vezes comprados de 7.
 	4- Objetivo: Visualizar os clientes que mais compram (os que compram mais de 2 vezes), considerando-os como "fiéis".
 	5- Objetivo: Visualizar as pessoas que moram na mesma cidade e no mesmo tipo de logradouro para uma facilitação das entregas.
	6- Objetivo: Visualizar produtos que possuem a mesma quantidade e forma de pagamento.
	7- Objetivo: Cidades com a quantidade de compras maior que 3.
	8- Objetivo: Visualizar as compras com uma data maior que 20.
 	9- Objetivo: Renomear e visualizar fk_cod_pessoa para cod entregador, a partir do momento que ele é identificado como entregador, pois proporciona melhor entendimento da tabela, ficando claro as pessoas que são clientes e entregadores.
	10- Objetivo: Renomear e visualizar qtd para quantidade, pois proporciona melhor entendimento da tabela, ficando claro que se refere a quantidade.
	11- Objetivo: Renomear e visualizar descrição para tipo de pagamento, pois proporciona melhor entendimento da tabela.


#### 9.4	CONSULTAS QUE USAM OPERADORES LIKE E DATAS (Mínimo 12) <br>
	1- Objetivo: Mostrar uma tabela com todas as pessoas que começam com a letra "M".
	2- Objetivo: Mostrar uma tabela com todos os bairros que começam com a letra "B".
	3- Objetivo: Mostrar uma tabela com todas as cidades que começam com a letra "C".
	4- Objetivo: Mostrar uma tabela com todos os logradouros que começam com a letra "L".
	5- Objetivo: Mostrar uma tabela com todos os entregadores que começam com a letra "M".
	6- Objetivo: Mostrar uma tabela com todos os produtos que começam com a letra "P".
	7- Objetivo: Mostrar uma tabela com a quantidade de entregas dos entregadores em um determinado mês.
	8- Objetivo: Mostrar uma tabela com as idades dos nossos entregadores.
	9- Objetivo: Mostrar uma tabela referente a promoção e cliente(que toda vez que o cliente faz aniversário ele ganha uma promoção) sendo assim o principal objetivo deste relatório é mostrar quantas promoções já foram feitas.
	10- Objetivo: Mostrar uma tabela com o relatório de vendas no horário de pico.
	11- Objetivo: Mostrar uma tabela com o relatório de vendas do último mês.
	12- Objetivo: Mostrar uma tabela com relatório mensal das vendas da loja.


#### 9.5	INSTRUÇÕES APLICANDO ATUALIZAÇÃO E EXCLUSÃO DE DADOS (Mínimo 6) <br>
	1- Objetivo: Visualizar e atualizar o tipo de logradouro do IFES, de condomínio para avenida.
	2- Objetivo: Visualizar e atualizar o tipo de logradouro do FUA, de avenida para condomínio.
	3- Objetivo: Visualizar e atualizar a cidade EURICO de Vila Velha para Vitória.
	4- Objetivo: Visualizar e excluir o produto que se repete.
	5- Objetivo: Visualizar e excluir o produto que não foi vendido nenhuma vez.
	6- Objetivo: Visualizar e excluir um bairro, pois ficou fora da nova zona de entrega.


#### 9.6	CONSULTAS COM INNER JOIN E ORDER BY (Mínimo 6) <br>
	1- Objetivo: Visualizar um relatório com todas as informações necessárias para a compra dos clientes.
	2- Objetivo: Visualizar um relatório com todas as informações necessárias para a entrega das compras dos clientes.
	3- Objetivo: Visualizar um relatório com que mostre as zonas que possuem mais clientes.
	4- Objetivo: Visualizar um relatório que apresenta uma tabela com os horários de “pico”, onde a quantidade de vendas é maior.
	5- Objetivo: Visualizar um relatório que apresenta uma tabela com os meios de pagamento mais utilizados.
	6- Objetivo: Visualizar um relatório que apresenta uma tabela com os produtos mais comprados.
	7- Objetivo: Visualizar um relatório que apresenta uma tabela com os entregadores e suas informações, como nome, o cpf, e salário Ordenando-os em ordem crescente. 


#### 9.7	CONSULTAS COM GROUP BY E FUNÇÕES DE AGRUPAMENTO (Mínimo 6)<br>
	1- Objetivo: Relatório que apresenta uma tabela onde mostra o nome do entregador que fez mais entregas e a quantidade de entregas em ordem decrescente.
	2- Objetivo: Relatório que apresenta uma tabela onde mostra o nome da cidade e quantidade de pedidos feitos em ordem decrescente.
	3- Objetivo: Relatório que apresenta uma tabela onde deve constar o nome do produto mais comprado e quantidade de compras feitas em ordem decrescente.
	4- Objetivo: Relatório que apresenta uma tabela mostrando o valor total de vendas em um determinado período de tempo, onde mostra também a data(referente ao período) e o valor total das vendas.
	5- Objetivo: Relatório que apresenta uma tabela mostrando a média das idades para ver qual público a loja está mais atingindo.
	6- Objetivo: Relatório que apresente as pessoas que pagaram com dinheiro e com isso tem desconto de 5%.


#### 9.8	CONSULTAS COM LEFT, RIGHT E FULL JOIN (Mínimo 4)<br>
	1- Objetivo: Relacionamento entre tabelas produto e compra produto.
	2- Objetivo: Relacionamento entre as tabelas pagamento e tipo de pagamento.
	3- Objetivo: Relacionamento entre as tabelas endereço e tabela bairro
	4- Objetivo: Relacionamento entre forma de pagamento e tipo de pagamento.


#### 9.9	CONSULTAS COM SELF JOIN E VIEW (Mínimo 6)<br>
	1- Objetivo: Relatório onde mostra uma view com o salário dos entregadores.
	2- Objetivo: Relatório onde mostra uma view com o tipo de pagamento mais utilizado.
	3- Objetivo: Relatório onde mostra uma view com bairro ou cidade com mais vendas.
	4- Objetivo: Relatório onde mostra uma view com os clientes que fazem aniversário neste mês.
	5- Objetivo: Relatório onde mostra uma view dos produtos ou do produto com poucas vendas.
	6- Objetivo: Relatório onde mostra uma view com a cidade com mais clientes.


#### 9.10	SUBCONSULTAS (Mínimo 4) <br>
	1- Objetivo: Relatório onde mostra os pedidos que foram pagos com o cartão de crédito.
	2- Objetivo: Relatório onde mostra as compras que foram realizadas dentro do dia 11.
	3- Objetivo: Relatório onde mostra a quantidade de condomínios que foram cadastrados.
	4- Objetivo: Relatório onde mostra os entregadores dentro de pessoas com salário menor que 2000.


># MARCO DA ENTREGA 02: DO ITEM 9.2 AO ITEM 9.10<br>
<br>

### 10. RELATÓRIOS E GRÁFICOS (Usar template disponibilizado)
[Template de relatórios](https://github.com/discipbdint/public_samples/blob/main/BD_Exemplo_Relatorios_Empresa_VA.ipynb "Template relatórios")

#### a) análises e resultados provenientes do banco de dados desenvolvido (usar modelo disponível)
#### b) link com exemplo de relatórios será disponiblizado pelo professor no AVA
#### OBS: Esta é uma atividade de grande relevância no contexto do trabalho. Mantenha o foco nos 5 principais relatórios/resultados visando obter o melhor resultado possível.

### 11.	AJUSTES DA DOCUMENTAÇÃO, CRIAÇÃO DOS SLIDES E VÍDEO PARA APRESENTAÇAO FINAL <br>

#### a) Modelo (pecha kucha)<br>
#### b) Tempo de apresentação 6:40 

># MARCO DA ENTREGA 03: DO ITEM 10 AO ITEM 11<br>
<br>

### FORMATACAO NO GIT:<br> 
https://help.github.com/articles/basic-writing-and-formatting-syntax/
<comentario no git>
    
##### About Formatting
    https://help.github.com/articles/about-writing-and-formatting-on-github/
    
##### Basic Formatting in Git
    https://help.github.com/articles/basic-writing-and-formatting-syntax/#referencing-issues-and-pull-requests
        
##### Working with advanced formatting
    https://help.github.com/articles/working-with-advanced-formatting/
    
#### Mastering Markdown
    https://guides.github.com/features/mastering-markdown/
    
### OBSERVAÇÕES IMPORTANTES

#### Todos os arquivos que fazem parte do projeto (Imagens, pdfs, arquivos fonte, etc..), devem estar presentes no GIT. Os arquivos do projeto vigente não devem ser armazenados em quaisquer outras plataformas.
    Caso existam arquivos com conteúdos sigilosos, comunicar o professor que definirá em conjunto com o grupo a melhor forma de armazenamento do arquivo.

#### Todos os grupos deverão fazer Fork deste repositório e dar permissões administrativas ao usuário do git "profmoisesomena", para acompanhamento do trabalho.

#### Os usuários criados no GIT devem possuir o nome de identificação do aluno (não serão aceitos nomes como Eu123, meuprojeto, pro456, etc). Em caso de dúvida comunicar o professor.

#### Link para BrModelo:
    http://www.sis4.com/brModelo/download.html

#### Link para curso de GIT:
    https://www.youtube.com/curso_git
