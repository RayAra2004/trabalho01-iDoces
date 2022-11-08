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

> Neste sistema temos as pessoas (podendo ser cliente ou entregador), onde iremos armazenar seu username, senha, nome, forma de contato (celular, email), cpf e endereço (que contém CEP, logradouro, tipo de logradouro, número, bairro e cidade). O entregador é uma pessoa, sendo que entregador possui salário. A pessoa realiza uma ou várias compras e uma compra é realizada por uma ou várias pessoas, que ao ser realizada armazena um código e a data e hora da mesma. Esta compra refere-se a um produto, armazenando a quantidade de produtos. Sendo que uma compra possui um ou vários produtos, que têm código, nome, descrição, valor e um produto é referente a várias compras. A compra também possui um pagamento, que contém código, valor e tipo de pagamento, sendo que uma compra tem uma ou várias formas de pagamento e um pagamento é de várias compras.
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
        
![Alt text](https://github.com/RayAra2004/trabalho01-iDoces/blob/main/modelo_conceitual_1.png?raw=true)      
    
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
         ENREGADOR_COMPRA: Tabela que armazena as compras que cada entregador fará.
           codigo: campo que armazena um código único relativo a cada entrega.
         COMPRA: Tabela referente as compras realizadas:
           codigo: campo que armazena o código referente a cada compra
         Compra_produto: relacinamento da compra de um produto.
           data_hora: campo que armazena a data e a hora de cada compra.
           qtd: campo que armazena a quantidade de produtos de cada compra.
         PAGAMENTO: Tabela que aramazena os meios de pagamentos possíveis para realizar uma compra.
           tipo_pagamento: campo multivalorado que armazena a os tipos de pagamento.
           valor: campo referente ao valor pago na compra.
           codigo: campo que armazena o código de cada meio de pagamento.
         PRODUTO: Tabela que armazena as informações de cada produto.
           codigo: campo que possui o código de cada produto.
           nome: campo que possui o código de cada produto.
           valor: campo que possui o código de cada produto.
           descricao: campo que possuia descrição de cada produto.
  <br>

### 6. MODELO LÓGICO<br>
![Alt text](https://github.com/RayAra2004/trabalho01-iDoces/blob/main/modelo_logico_2.png?raw=true)

### 7.	MODELO FÍSICO<br>
    
    CREATE TABLE CLIENTE (
        codigo serial PRIMARY KEY,
        FK_PESSOA_codigo integer
    );

    CREATE TABLE PRODUTO (
        codigo serial PRIMARY KEY,
        nome varchar(80),
        valor float,
        descricao varchar(250)
    );

    CREATE TABLE MEIO_PAGAMENTO (
        codigo serial PRIMARY KEY,
        valor float,
        FK_tipo_pagamento_tipo_pagamento_PK integer,
        FK_COMPRA_codigo integer
    );

    CREATE TABLE PESSOA (
        codigo serial PRIMARY KEY,
        nome varchar(250),
        telefone varchar(20),
        cpf varchar(14),
        FK_endereco_endereco_PK integer
    );

    CREATE TABLE ENTREGADOR (
        codigo serial PRIMARY KEY,
        FK_PESSOA_codigo integer
    );

    CREATE TABLE COMPRA (
        codigo serial PRIMARY KEY,
        FK_ENTREGADOR_codigo integer,
        FK_CLIENTE_codigo integer
    );

    CREATE TABLE tipo_pagamento (
        tipo_pagamento_PK serial NOT NULL PRIMARY KEY,
        descricao varchar(80)
    );

    CREATE TABLE endereco (
        cep bigint,
        logradouro varchar(255),
        numero integer,
        bairro integer,
        cidade integer,
        tipo_logradouro integer,
        endereco_PK serial PRIMARY KEY
    );

    CREATE TABLE Realiza (
        fk_COMPRA_codigo integer,
        fk_CLIENTE_codigo integer
    );

    CREATE TABLE Compra_produto (
        qtd integer,
        data_hora timestamp,
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

    ALTER TABLE PESSOA ADD CONSTRAINT FK_PESSOA_ENDERECO
        FOREIGN KEY (FK_endereco_endereco_PK)
        REFERENCES endereco (endereco_PK);
    
    ALTER TABLE ENTREGADOR ADD CONSTRAINT FK_ENTREGADOR_PESSOA
        FOREIGN KEY (FK_PESSOA_codigo)
        REFERENCES PESSOA (codigo);

    ALTER TABLE CLIENTE ADD CONSTRAINT FK_CLIENTE_PESSOA
        FOREIGN KEY (fk_pessoa_codigo)
        REFERENCES PESSOA (codigo);

    ALTER TABLE MEIO_PAGAMENTO ADD CONSTRAINT FK_MEIO_PAGAMENTO_TIPO_PAGAMENTO
        FOREIGN KEY (FK_tipo_pagamento_tipo_pagamento_PK)
        REFERENCES tipo_pagamento (tipo_pagamento_PK);
    
    ALTER TABLE MEIO_PAGAMENTO ADD CONSTRAINT FK_MEIO_PAGAMENTO_COMPRA
        FOREIGN KEY (FK_COMPRA_codigo)
        REFERENCES COMPRA (codigo);
    
    ALTER TABLE COMPRA ADD CONSTRAINT FK_COMPRA_ENTREGADOR
        FOREIGN KEY (FK_ENTREGADOR_codigo)
        REFERENCES ENTREGADOR (codigo);

    ALTER TABLE COMPRA ADD CONSTRAINT FK_COMPRA_CLIENTE
        FOREIGN KEY (FK_CLIENTE_codigo)
        REFERENCES CLIENTE (codigo);

    ALTER TABLE endereco ADD CONSTRAINT FK_endereco_BAIRRO
        FOREIGN KEY (bairro)
        REFERENCES BAIRRO (codigo);

    ALTER TABLE endereco ADD CONSTRAINT FK_endereco_CIDADE
        FOREIGN KEY (cidade)
        REFERENCES CIDADE (codigo);

    ALTER TABLE endereco ADD CONSTRAINT FK_endereco_TIPO_LOGRADOURO
        FOREIGN KEY (tipo_logradouro)
        REFERENCES TIPO_LOGRADOURO (codigo);

    ALTER TABLE Realiza ADD CONSTRAINT FK_Realiza_COMPRA
        FOREIGN KEY (fk_COMPRA_codigo)
        REFERENCES COMPRA (codigo);
    
    ALTER TABLE Realiza ADD CONSTRAINT FK_Realiza_CLIENTE
        FOREIGN KEY (fk_CLIENTE_codigo)
        REFERENCES CLIENTE (codigo);
    
    ALTER TABLE Compra_produto ADD CONSTRAINT FK_Compra_produto_PRODUTO
        FOREIGN KEY (fk_PRODUTO_codigo)
        REFERENCES PRODUTO (codigo);
    
    ALTER TABLE Compra_produto ADD CONSTRAINT FK_Compra_produto_COMPRA
        FOREIGN KEY (fk_COMPRA_codigo)
        REFERENCES COMPRA (codigo);

### 8.	INSERT APLICADO NAS TABELAS DO BANCO DE DADOS<br>

    INSERT INTO pessoa(nome, telefone, cpf, fk_endereco_endereco_pk)
      values  ('Esther Moraes', '27998877665', '000.000.000-00', 1),
              ('Sofia Andrade', '27998877664', '111.111.111-11', 2),
              ('Raynan Araujo', '27998877663', '222.222.222-22', 3),
              ('Carlos Eduardo Barbosa', '27998877662', '333.333.333-33', 4),
              ('Yasmin Santana', '27998877661', '444.444.444-44', 5),
              ('Davi Salles', '27998877660', '555.555.555-55', 6),
              ('Davi Nunes', '27998877690', '666.666.666-66', 7),
              ('Harian Adami', '27998877678', '777.777.777-77',8),
              ('Kauã Mateus Terra', '27998877654', '888.888.888-88',9),
              ('Camila Egydio', '27998877610', '999.999.999-99', 10), 
              ('Isabelly Andrades', '27998877624', '101.101.101-10', 11),
              ('Lorena Toraes', '27998877685', '121.121.121-12', 12),
              ('Pedro Ramos', '27998877652', '131.131.131-13', 13),
              ('João Pedro Barcellos', '27998877613', '141.141.141-14', 14),
              ('Eduardo Olmo', '27998877622', '151.151.151-15', 15),
              ('Mariana Lopes', '27998877640', '161.161.161-16', 16),
              ('Bruna Gomes', '27998877123', '171.171.171-17', 17),
              ('Caio Fraga', '27998877456', '181.181.181-18', 18),
              ('Moisés Omena', '27998877789', '191.191.191-19', 19),
              ('Wilsiman Evangelista', '27998877611', '202.202.202-20', 20);

    INSERT INTO endereco(cep, logradouro, numero, bairro, cidade, tipo_logradouro)
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
      values  ('SERRA'),
              ('VILA VELHA'),
              ('VITÓRIA'),
              ('CARIACICA'),
              ('FUNDÃO'),
              ('VIANA');

    INSERT INTO tipo_logradouro(descricao)
    values ('Rua'),
           ('Alameda'),
           ('Condomínio'),
           ('Avenida');

    INSERT INTO cliente(fk_pessoa_codigo)
      values  (1),
              (2),
              (3),
              (4),
              (5),
              (6),
              (7),
              (8),
              (9),
              (10),
              (11),
              (12),
              (13),
              (14),
              (15);

    INSERT INTO entregador(fk_pessoa_codigo)
      values  (16),
              (17),
              (18),
              (19),
              (20);

    INSERT INTO produto(nome, valor, descricao)
      values  ('Bolo de chocolate', 8.00, 'Bolo de chocolate belga, vendido em fatias'),
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
              ('Bento cake', 40.5, 'Bolo personalizado de 10cm, recheio de brigadeiro branco e morangos'),
              ('Banoffee', 16.00, 'Torta feita de bananas, creme e uma calda de caramelo, com sua base de biscoitos. Vendido a fatia'),
              ('Torta de Ninho com Nutella', 15.00, 'Torta feita com massa de leite ninho recheado de nutella. Vendido a fatia'),
              ('Cheesecake', 22.00, 'Casquinha de biscoito crocante e um recheio à base de cream cheese, coberto com geleia de morangos frescos.');

    INSERT INTO compra_produto(qtd, data_hora, fk_produto_codigo, fk_compra_codigo)
      values  (3, '2022-09-13 14:01:12', 1, 1),
              (10, '2022-10-22 15:03:13', 2, 2),
              (1, '2022-08-11 11:10:11', 3, 3),
              (15, '2022-01-12 12:12:14', 4, 4),
              (5, '2022-10-17 15:02:15', 5, 5),
              (4, '2022-10-15 12:03:16', 6, 6),
              (3, '2022-07-11 16:04:11', 7, 7),
              (3, '2022-09-11 16:05:14', 8, 8),
              (1, '2022-09-12 16:17:10', 9, 9),
              (2, '2022-10-10 18:22:10', 10, 10),
              (5, '2022-09-21 19:23:11', 11, 11),
              (7, '2022-04-28 10:13:00', 12, 12),
              (1, '2022-09-03 16:40:21', 13, 13),
              (1, '2022-10-08 13:00:44', 14, 14),
              (3, '2022-10-27 14:08:00', 15, 15),
              (4, '2022-10-21 16:28:11', 1, 16),
              (25, '2022-10-25 18:29:33', 2, 17),
              (28, '2022-10-24 20:25:18', 3, 18),
              (1, '2022-08-18 15:18:21', 4, 19),
              (3, '2022-07-18 14:18:13', 5, 20);

    INSERT INTO compra(fk_cliente_codigo, fk_entregador_codigo)
      values  (2, 5),
              (10, 1),
              (1, 3),
              (4, 2),
              (3, 2),
              (11, 4),
              (3, 1),
              (8, 2),
              (6, 3),
              (9, 4),
              (5, 5),
              (1, 5),
              (15, 2),
              (6, 3),
              (14, 1),
              (15, 1),
              (7, 4),
              (14, 2),
              (12, 3),
              (13, 5);

    INSERT INTO realiza(fk_compra_codigo, fk_cliente_codigo)
      values  (1, 2),
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

    INSERT INTO meio_pagamento(valor, fk_tipo_pagamento_tipo_pagamento_pk, fk_compra_codigo)
      values  (24, 1, 1),
              (130, 5, 2),
              (10, 2, 3),
              (90, 3, 4),
              (37.5, 5, 5),
              (10, 4, 6),
              (3, 5, 7),
              (15, 3, 8),
              (9, 5, 9),
              (30, 1, 10),
              (50, 4, 11),
              (283.5, 2, 12),
              (16, 2, 13),
              (15, 3, 14),
              (66, 4, 15),
              (32, 2, 16),
              (325, 1, 17),
              (280, 2, 18),
              (6, 2, 19),
              (22.5, 3, 20);

    INSERT INTO tipo_pagamento(descricao)
      values  ('PIX'),
              ('PIC PAY'),
              ('DINHEIRO'),
              ('CARTÃO DÉBITO'),
              ('CARTÃO CRÉDITO');

### 9.	TABELAS E PRINCIPAIS CONSULTAS<br>
#### 9.1	CONSULTAS DAS TABELAS COM TODOS OS DADOS INSERIDOS (Todas) <br> 
[Colab - iDoces](https://colab.research.google.com/drive/1oZk6KvPkMWBv3hGdXr2CigjIyJSSYesY?usp=sharing)
># MARCO DA ENTREGA 01: DO ITEM 1 AO ITEM 9.1<br>
<br>

#### 9.2	CONSULTAS DAS TABELAS COM FILTROS WHERE (Mínimo 4)<br>
#### 9.3	CONSULTAS QUE USAM OPERADORES LÓGICOS, ARITMÉTICOS E TABELAS OU CAMPOS RENOMEADOS (Mínimo 11)
    a) Criar 5 consultas que envolvam os operadores lógicos AND, OR e Not
    b) Criar no mínimo 3 consultas com operadores aritméticos 
    c) Criar no mínimo 3 consultas com operação de renomear nomes de campos ou tabelas

#### 9.4	CONSULTAS QUE USAM OPERADORES LIKE E DATAS (Mínimo 12) <br>
    a) Criar outras 5 consultas que envolvam like ou ilike
    b) Criar uma consulta para cada tipo de função data apresentada.

#### 9.5	INSTRUÇÕES APLICANDO ATUALIZAÇÃO E EXCLUSÃO DE DADOS (Mínimo 6)<br>
    a) Criar minimo 3 de exclusão
    b) Criar minimo 3 de atualização

#### 9.6	CONSULTAS COM INNER JOIN E ORDER BY (Mínimo 6)<br>
    a) Uma junção que envolva todas as tabelas possuindo no mínimo 2 registros no resultado
    b) Outras junções que o grupo considere como sendo as de principal importância para o trabalho

#### 9.7	CONSULTAS COM GROUP BY E FUNÇÕES DE AGRUPAMENTO (Mínimo 6)<br>
    a) Criar minimo 2 envolvendo algum tipo de junção

#### 9.8	CONSULTAS COM LEFT, RIGHT E FULL JOIN (Mínimo 4)<br>
    a) Criar minimo 1 de cada tipo

#### 9.9	CONSULTAS COM SELF JOIN E VIEW (Mínimo 6)<br>
        a) Uma junção que envolva Self Join (caso não ocorra na base justificar e substituir por uma view)
        b) Outras junções com views que o grupo considere como sendo de relevante importância para o trabalho

#### 9.10	SUBCONSULTAS (Mínimo 4)<br>
     a) Criar minimo 1 envolvendo GROUP BY
     b) Criar minimo 1 envolvendo algum tipo de junção

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
