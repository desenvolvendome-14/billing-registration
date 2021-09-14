# billing-registration

Serviços responsavel pelos cadastros do sistema (Empresa, banco, participante)

## Dependências

- Ruby 3.0.2
- Rails 6.1.4
- Postgres >=10.10

## Setup

1. `git clone git@github.com:desenvolvendome-14/billing-registration.git`
2. `cd billing-registration`
3. `cp .env.sample .env` (caso haja necessidade mude as variáveis)
5. `rake db:create db:migrate db:seed`
6. `rspec spec/`
6. `rails s`

## Após isso o servidor estará rodando em localhost:3000

## Desenvolvimento

- Seguir padrões de código, utilizando o rubocop.
- Verificar se a funcionalidade que desenvolveu está testada, para isso a gem simplecov.
- Verificar qualidade de código com rubycritic e rubocop.
- Temos uma action no GitHub para verificar se todos teste estão passando e se tem alguma alteração para a qualidade de código com rubocop
