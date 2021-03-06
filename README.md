# ESPERTO-FIT-FILIAIS

O Esperto Fit ilustra uma aplicação web utilizando Ruby on Rails, onde faz a gestão de uma rede de academias. A parte de Filiais no caso, cuida da gestão de filiais, planos, matrículas, produtos, alunos banidos e agenda de cada academia.

## Começando:

Para executar esse projeto, será necessário instalar os seguintes programas:
  * ruby 2.7.1
  * rails 6.0.3.4
  * yarn 1.22.4

## Desenvolvimento:

Para iniciar o desenvolvimento, é necessário clonar o projeto GitHub em algum diretório:
  * git@github.com:TreinaDev/esperto-fit-filiais.git

## Construção:

Para construir o projeto você deve executar o seguinte comando no diretório escolhido:
  * bin/setup


## Features:

O projeto segue uma linha onde filiais se cadastram no sistema e passam a cuidar da gestão de sua filial.
  * O administrador do sistema, pode fazer a gestão geral de: planos, filiais, matrículas, produtos, alunos banidos e agenda de cada filial;
  * Cada usuário deve ter um perfil cadastrado;
  * Apenas o administrador do sistema pode cadastrar novos administradores ou usuários;
  * Cada filial possui pelo menos um usuário regular, onde ele pode fazer o gerenciamento de sua própria filial;
  * As filiais podem escolher planos gerais e produtos para associá-los a sua filial, alterando o preço que será passado aos seus alunos;
  * Usuários regulares do sistema podem banir alunos enviando uma justificativa;
  * Os horários de funcionamento de cada filial pode ser alterado por seus usuários.

## Testes:

Para executar os testes, será necessário instalar as seguintes gems:
  * gem 'capybara'
  * gem 'rspec-rails', '~> 4.0.1'
  * gem 'shoulda-matchers', '~> 4.0'
Para executar os restes, utilize o comando:
  * rspec

## Gems:

Algumas gems foram incluídas no projeto:
  * gem 'cpf_cnpj'
  * gem 'devise'
  * gem 'factory_bot_rails'
  * gem 'faraday'
  * gem 'pry-byebug'
  * gem 'rubocop-rails'
  * gem 'simplecov'
  

## API

### Consulta de filiais

#### GET /api/v1/subsidiaries

**HTTP status:** 200

```json
[
  {
    "id": 3,
    "name": "Lorem1",
    "address": "R. Lorem Ipsum, XXX, Lorem, Ipsum",
    "created_at": "2020-10-13T20:28:59.920Z",
    "updated_at": "2020-10-13T20:28:59.920Z",
    "cnpj": "58.520.759/8766-09",
    "token": "X2VBDD"
  },
  {
    "id": 4,
    "name": "Lorem10",
    "address": "R. Lorem Ipsum, XXX, Lorem, Ipsum",
    "created_at": "2020-10-14T19:47:08.649Z",
    "updated_at": "2020-10-14T19:47:08.649Z",
    "cnpj": "02.124.357/9633-63",
    "token": "PUXCOX"
  }
]
```

#### GET /api/v1/subsidiaries/:id

**HTTP status:** 200

```json
{
  "id": 3,
  "name": "Lorem1",
  "address": "R. Lorem Ipsum, XXX, Lorem, Ipsum",
  "cnpj": "58.520.759/8766-09",
  "token": "X2VBDD",
  "subsidiary_plans": [
    {
      "name": "Plano1",
      "price": "9.99",
      "permanency": "12 months"
    }
  ]
}
```


**HTTP status:** 404 - Não encontrado

```json
Filial não encontrada
```

### Criação de matrícula

#### POST /api/v1/enrollments

#### Parâmetros (todos obrigatórios):

```json
{
  "enrollment": { 
    "customer_name": "Lorem",
    "customer_cpf": "924.737.808-70",
    "subsidiary_plan_id": 1,
    "email": "user@mail.com",
    "price": 99.90 
  }
}
```

**HTTP status:** 201

```json
{
  "id": 1,
  "token": "4G4INJ",
  "customer_name": "Lorem",
  "customer_cpf": "924.737.808-70",
  "email": "user@mail.com",
  "price": "99.9",
  "status": "active",
  "valid_thru": "2021-10-10",
  "subsidiary_plan_id": 1,
  "created_at": "2020-10-10T19:33:24.907Z",
  "updated_at": "2020-10-10T19:33:24.907Z"
}
```

**HTTP status:** 412 - Parâmetro inválido

```json
Parâmetros inválidos
```

**HTTP status:** 422 - Parâmetros com valores inválidos

```json
[
  "Plano é obrigatório(a)",
  "Preço deve ser maior que 0",
  "Nome do cliente não pode ficar em branco",
  "Email não é válido",
  "CPF do cliente não é válido"
]
```
### Consulta de CPF banido

#### GET /api/v1/banned_customer/:cpf

**HTTP status:** 200 (CPF banido)

**HTTP status:** 404 (CPF não encontrado na lista de banidos)

**HTTP status:** 422 (CPF inválido)

```json
{
  "message": "CPF inválido"
}
```
