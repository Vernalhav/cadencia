# Cadencia
O programa se consiste em em uma aplicação básica para acesso ao banco de dados.

## Instalação
Para instalar o programa será preciso primeiramente instalar uma lib, após isso deve se baixar uma lib da Oracle e só então execultar o código propriamente dito.

### Bibliotecas
Será necessário a instalação da libaio1, para instalá-la basta execultar o comando:
```
sudo apt install libaio1
```

### Bibliotecas Oracle
Para instalar tal biblioteca basta baixar o arquivo instantclient-basic-linux.x64-19.6.0.0.0dbru.zip diretamente do site da Oracle, após isso deve ser extraído. Para que seja possível localizar as bibliotecas no arquivo extraido deve-se execultar o seguinte comando:
```
export LD_LIBRARY_PATH=./instantclient_19_6:$LD_LIBRARY_PATH
```
Com isso temos salvo este diretório como local para bibliotecas.

### Biblioteca cx_Oracle
Precisamos por fim de uma biblioteca da Oracle para poder acessar o banco, para isso basta instlar pelo pip install:
```
pip install -r cx_Oracle
```
Caso esteja no diretório contendo os arquivos do git, pode também utilizar o comando:
```
pip install -r requirements.txt
```
Dessa forma ele irá pegar automaticamente o nome cx_Oracle do arquivo.

## Iniciando a aplicação
Após realizar o procedimento para instalação deve se criar um arquivo config.py com as credenciais do banco para poder acessá-lo. O arquivo deve ser do seguinte formato:
```
USER = ""                         # Nome de usuário do banco Oracle
PASSWORD = ""                     # Senha do usuário
DATABASE_URL = "grad.icmc.usp.br" # URL do banco
DATABASE_URL_PORT = "15215"       # Porta do banco
DATABASE_SID = "orcl"             # Service ID do banco
```
Deve-se adicionar as credenciais em USER e PASSWORD.
### Executado o programa
Para execultar o programa basta execultar o arquivo main_bd.py, com o python:
```
python main_bd.py
```

## Usando o programa
O programa irá iniciar mostrando um menu para navegar no banco, deve se selecionar a opção desejada para utilizar o programa.
```
     1 - Inserir Tipo de Instrumento.
     2 - Inserir um novo Instrumento que um Professor Toca.
     3 - Listar Professores.
     4 - Lista os professores que tocam todos os tipos de instrumento de uma determinada classificacao
     5 - Sair
```
### Opção 1
```
Insira o nome do novo tipo de instrumento, seu tamanho maximo eh 30:
```
Deve inserir um nome de um novo tipo de instrumento, caso ele tenha tamanho maior que 30 será pedido um novo nome.
```
Insira a classificacao do novo instrumento, seu tamanho maximo eh 30:
```
Deve inserir uma classificao para o instrumento inserido, caso ela tenha um tamanho maior que 30 será pedido uma nova classificação.

### Opção 2
```
deseja listar os professores cadastrados? Insira "Sim" ou "Nao"
```
Deve informar se quer ou não lista os professores, caso digite uma opção inválida será perguntado novamente se quer ou não listar os professores.

```
Insira o nome de login do professor que quer adicionar um novo tipo de instrumento tocado:
```
Deve inserir um nome válido de login de algum professor do banco que deseja cadastrar o novo instrumento, caso o nome não seja de um professor, não será inserido no banco.
```
Insira o tipo de instrumento tocado, seu tamanho maximo eh 30:
```
Deve inserir um tipo válido caso  contrário terá uma falha ao inserir no banco.

### Opção 3
Lista os professores cadastrados no banco de dados.

### Opção 4
Lista os professores que tocam todos os tipos de instrumento de uma determinada classificacao.

### Opcão 5 encerra o programa.
