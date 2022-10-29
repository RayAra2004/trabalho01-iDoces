# TRABALHO 01:  iDoces
Trabalho desenvolvido durante a disciplina de Banco de dados

# Sumário

### 1. COMPONENTES<br>
Integrantes do grupo<br>
Carlos Eduardo de Souza Barbosa: cesbarbosa2005@gmail.com<br>
Esther Moraes Nascimento: moraesesther25@gmail.com<br>
Raynan Araujo da Silva: raynan.araujo.ifes@gmail.com<br>
Sofia Andrade Nascimento: andradesoso10@gmail.com<br>
<br>

### 2.INTRODUÇÃO E MOTIVAÇÃO<br>
Este documento contém a especificação do projeto do banco de dados <nome do projeto> 
<br>e motivação da escolha realizada. <br>

Nossa história no ramo da doceria começou em 2006, adquirimos um food truck que intitulamos de  “iDoces”, ficamos muito conhecidos pela população da comunidade e o jornal local como os melhores doces da comunidade e com isso nossa fama foi aumentando mais e mais e consequentemente o número de clientes também, por isso nós contratamos a empresa CarnanTech, para que possamos dar conta de todos os pedidos com excelência pedimos que eles criassem uma aplicação para solucionar nosso problema. 
 

### 3.MINI-MUNDO<br>

Neste sistema temos as pessoas (podendo ser cliente ou entregador), onde iremos armazenar seu código, nome, forma de contato(celular, email), cpf e endereço(que contém CEP, logradouro, complemento, número, bairro, cidade, UF). O cliente e o entregador são uma pessoa,  possuindo código. O cliente realiza uma ou várias compras e uma compra é realizada por um ou vários clientes, que ao ser realizada armazena  um código. Esta compra refere-se a um produto, armazenando a quantidade de produtos e a data e hora que foi realizada. Sendo que uma compra possui um ou vários produtos, que têm código, nome, descrição, valor e tipo de produto e um produto é referente a várias compras. A compra também possui um meio de pagamento, que contém código, valor, tipo de pagamento, sendo que uma compra tem uma ou várias formas de pagamento e um meio de pagamento é de apenas uma compra.
Por fim, temos o entregador realizando a entrega de várias compras e uma compra é entregue por um e apenas um entregador.
 

### 4.PERGUNTAS A SEREM RESPONDIDAS E TABELA DE DADOS<br>
#### 4.1 QUAIS PERGUNTAS PODEM SER RESPONDIDAS COM O SISTEMA PROPOSTO?
    a) O sistema proposto poderá fornecer quais tipos de relatórios e informaçes? 
    b) Crie uma lista com os 5 principais relatórios que poderão ser obtidos por meio do sistema proposto!
    
> A Empresa DevCom precisa inicialmente dos seguintes relatórios:
* Relatório que mostre o nome de cada supervisor(a) e a quantidade de empregados supervisionados.
* Relatório relativo aos os supervisores e supervisionados. O resultado deve conter o nome do supervisor e nome do supervisionado além da quantidade total de horas que cada supervisionado tem alocada aos projetos existentes na empresa.
* Relatorio que mostre para cada linha obtida o nome do departamento, o valor individual de cada salario existente no  departamento e a média geral de salarios dentre todos os empregados. Os resultados devem ser apresentados ordenados por departamento.
* Relatório que mostre as informações relacionadas a todos empregados de empresa (sem excluir ninguém). As linhas resultantes devem conter informações sobre: rg, nome, salario do empregado, data de início do salario atual, nomes dos projetos que participa, quantidade de horas e localização nos referidos projetos, numero e nome dos departamentos aos quais está alocado, informações do historico de salário como inicio, fim, e valores de salarios antigos que foram inclusos na referida tabela (caso possuam informações na mesma), além de todas informações relativas aos dependentes. 
>> ##### Observações: <br> a) perceba que este relatório pode conter linhas com alguns dados repetidos (mas não todos). <br>  b) para os empregados que não possuirem alguma destas informações o valor no registro deve aparecer sem informação/nulo. 
* Relatório que obtenha a frequencia absoluta e frequencia relativa da quantidade de cpfs únicos no relatório anterior. Apresente os resultados ordenados de forma decrescente pela frequencia relativa.

 ### 5.MODELO CONCEITUAL<br>
        
![Alt text](https://github.com/RayAra2004/trabalho01-iDoces/blob/main/modelo_conceitual.png?raw=true)      
    
#### 5.1 Validação do Modelo Conceitual
    [Grupo01]: [Raynan Araujo da Silva]y

#### 5.2 Descrição dos dados 
         PESSOA: Tabela que armazena as informações relativas as pessoas.
           codigo: campo que armazena um código único relativo a cada pessoa.
           nome: campo referente ao nome da pessoa.
           forma_contato: campo multivalorado e composto que tem as formas de contato:
             celular: campo que armazena o número da pessoa.
             email: campo que armazena o email da pessoa.
           endereco: campo que armazena o endereço de uma pessoa:
             CEP:campo que armazana o CEP relativo ao endereço.
             logradouro:campo que armazana o logradouro relativo ao endereço.
             numero:campo que armazana o numero relativo ao endereço.
             bairro:campo que armazana o bairro relativo ao endereço.
             cidade:campo que armazana o cidade relativo ao endereço.
             tipo_logradouro:campo que armazana o tipo_logradouro relativo ao endereço.
             complemento:campo que armazana o complemento relativo ao endereço.
             UF:campo que armazana o UF relativo ao endereço.
         CLIENTE: Tabela que armazena informações referente ao cliente:
           codigo: campo que armazena um código único relativo a cada pessoa.
         ENTREGADOR: Tabela que armazena informações referente ao entregador:
           codigo: campo que armazena um código único relativo a cada entregador.
         ENREGADOR_COMPRA: Tabela que armazena as compras que cada entregador fará.
           codigo: campo que armazena um código único relativo a cada entrega.
         COMPRA: Tabela referente as compras realizadas:
           codigo: campo que armazena o código referente a cada compra
         Compra_produto: relacinamento da compra de um produto.
           data_hora: campo que armazena a data e a hora de cada compra.
           qtd: campo que armazena a quantidade de produtos de cada compra.
         MEIO_PAGAMENTO: Tabela que aramazena os meios de pagamentos possíveis para realizar uma compra.
           tipo_pagamento: campo multivalorado que armazena a os tipos de pagamento.
           valor: campo referente ao valor pago na compra.
           codigo: campo que armazena o código de cada meio de pagamento.
         PRODUTO: Tabela que armazena as informações de cada produto.
           codigo: campo que possui o código de cada produto.
           nome: campo que possui o código de cada produto.
           valor: campo que possui o código de cada produto.
           descricao: campo que possuia descrição de cada produto.
  <br>


### 6	MODELO LÓGICO<br>
        a) inclusão do esquema lógico do banco de dados
        b) verificação de correspondencia com o modelo conceitual 
        (não serão aceitos modelos que não estejam em conformidade)

### 7	MODELO FÍSICO<br>
        a) inclusão das instruções de criacão das estruturas em SQL/DDL 
        (criação de tabelas, alterações, etc..) 
        
       
### 8	INSERT APLICADO NAS TABELAS DO BANCO DE DADOS<br>
        a) inclusão das instruções de inserção dos dados nas tabelas criadas pelo script de modelo físico
        (Drop para exclusão de tabelas + create definição de para tabelas e estruturas de dados + insert para dados a serem inseridos)
        b) Criar um novo banco de dados para testar a restauracao 
        (em caso de falha na restauração o grupo não pontuará neste quesito)
        c) formato .SQL


### 9	TABELAS E PRINCIPAIS CONSULTAS<br>
    OBS: Usar o colab para apresentar os resultados que devem incluir as instruções SQL + resultados em forma de tabela.<br>
#### 9.1	CONSULTAS DAS TABELAS COM TODOS OS DADOS INSERIDOS (Todas) <br>

># Marco de Entrega 01: Do item 1 até o item 9.1<br>

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

># Marco de Entrega 02: Do item 9.2 até o ítem 9.10<br>

### 10 RELATÓRIOS E GRÁFICOS (Usar template disponibilizado)
[Template de relatórios](https://github.com/discipbdint/public_samples/blob/main/BD_Exemplo_Relatorios_Empresa_VA.ipynb "Template relatórios")

#### a) análises e resultados provenientes do banco de dados desenvolvido (usar modelo disponível)
#### b) link com exemplo de relatórios será disponiblizado pelo professor no AVA
#### OBS: Esta é uma atividade de grande relevância no contexto do trabalho. Mantenha o foco nos 5 principais relatórios/resultados visando obter o melhor resultado possível.

    

### 11	AJUSTES DA DOCUMENTAÇÃO, CRIAÇÃO DOS SLIDES E VÍDEO PARA APRESENTAÇAO FINAL <br>

#### a) Modelo (pecha kucha)<br>
#### b) Tempo de apresentação 6:40 

># Marco de Entrega 03: Itens 10 e 11<br>
<br>
<br>
<br> 



### 12 FORMATACAO NO GIT:<br> 
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
1. <strong>Caso existam arquivos com conteúdos sigilosos<strong>, comunicar o professor que definirá em conjunto com o grupo a melhor forma de armazenamento do arquivo.

#### Todos os grupos deverão fazer Fork deste repositório e dar permissões administrativas ao usuário do git "profmoisesomena", para acompanhamento do trabalho.

#### Os usuários criados no GIT devem possuir o nome de identificação do aluno (não serão aceitos nomes como Eu123, meuprojeto, pro456, etc). Em caso de dúvida comunicar o professor.


Link para BrModelo:<br>
http://www.sis4.com/brModelo/download.html
<br>


Link para curso de GIT<br>
![https://www.youtube.com/curso_git](https://www.youtube.com/playlist?list=PLo7sFyCeiGUdIyEmHdfbuD2eR4XPDqnN2?raw=true "Title")


