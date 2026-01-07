# E-commercePostgreSQL
📌 Visão Geral

Este projeto tem como objetivo realizar uma análise exploratória de dados (EDA) de um e-commerce fictício, utilizando PostgreSQL como banco de dados relacional.
As análises foram desenvolvidas com foco em clientes, pedidos, faturamento, formas de pagamento e custos logísticos, simulando cenários reais enfrentados por times de dados.

O banco foi estruturado e consultado utilizando Supabase (PostgreSQL), com queries voltadas para insights de negócio.

## 🛠️ Tecnologias Utilizadas ##

PostgreSQL

Supabase

SQL

GitHub

## 🗂️ Estrutura do Banco de Dados ##

O modelo relacional foi projetado para refletir um cenário real de e-commerce.

Tabelas

customers: dados demográficos dos clientes

orders: informações dos pedidos

items: itens vendidos por pedido

payments: dados de pagamento dos pedidos

products: características físicas e categoria dos produtos

Relacionamentos

Um cliente pode ter vários pedidos

Um pedido pode conter vários itens

Um pedido pode ter mais de um pagamento

Um produto pode aparecer em vários pedidos

### 🔍 Perguntas de Negócio Respondidas ###

As análises foram organizadas para responder perguntas comuns em ambientes de e-commerce:

### 📈 Clientes & Pedidos ###

Quantos clientes únicos existem?

Como os clientes estão distribuídos por cidade?

Quais cidades concentram o maior volume de pedidos?

Qual é o ticket médio por pedido?

### 💰 Receita & Pagamentos ###

Qual é o faturamento total da empresa?

Qual a distribuição de pedidos por tipo de pagamento?

Quantos pedidos foram pagos com cartão?

Qual o parcelamento médio em pagamentos com cartão de crédito?

### 🛒 Produtos ###

Quais categorias geram mais faturamento?

Quais categorias possuem maior volume de vendas?

### 🚚 Logística ###

Qual é o frete médio por faixa de peso dos produtos?

Quais categorias apresentam maior custo médio de frete por item vendido?

#📊 Insights Gerados #

Alguns exemplos de insights obtidos a partir das análises:

O ticket médio por pedido indica o padrão de consumo dos clientes.

Categorias com produtos mais pesados apresentam aumento significativo no custo de frete.

O cartão de crédito é o meio de pagamento dominante, com alto índice de parcelamento.

Determinadas categorias geram alto faturamento, mas também possuem custos logísticos elevados.
## Estrutura
```
projeto-sql-vendas/
│
├── dataset/
│ └── olist_customers_dataset.csv
│ └── olist_order_items_dataset.csv
│ └── olist_order_payments_dataset.csv
│ └── olist_orders_dataset.csv
│ └── olist_products_dataset.csv
│
│
├── sql/
│ ├── tabela.sql
│ └── perguntas_querys.sql
│
├── README.md
```
