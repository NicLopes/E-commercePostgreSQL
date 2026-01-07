--Quandidade de clientes únicos
select count(distinct customer_unique_id) as "total_distintos_clientes"
from "Customers";


--Distribuição de clientes por cidade
select customer_city as "cidade" , count(customer_unique_id) as "Qtd Cliente"
from "Customers"
group by customer_city;


--Cidades com maior volume de pedidos
select c.customer_city as "cidade", count(distinct i.order_id) as "qtd_pedidos" 
from "Itens" i 
inner join "Order" o    
on i.order_id = o.order_id
inner join "Customers" c
on o.customer_id = c.customer_id
group by c.customer_city;


--Ticket médio por pedido.
select round(avg(total_pedido)::numeric, 2) as "ticket_medio"
from (select order_id, sum(payment_value) as "total_pedido"
from "Payments"
group by order_id
)total;


--Faturamento total da empresa.
select round(sum(payment_value):: numeric,2) as "faturamento_total" 
from "Payments";


--Quantidade de pedidos por tipo de pagamento.
select p.payment_type as "Tipos_Pagamento", count(distinct(o.order_id)) as "Qtd"
from "Order" o 
inner join "Payments" p
on o.order_id = p.order_id
group by p.payment_type 
order by "Qtd" desc;


--Parcelamento médio por tipo de pagamento.
select payment_type as "tipo_parcela" , round(avg(payment_installments)::numeric ,2) as "plc_medio"
from "Payments"
where payment_type = 'credit_card'
group by payment_type;

--Quatidade de pedidos pagos com cartão

select sum(pagos_cartao) as total_pagos_cartao
from (
    select count(payment_type) as pagos_cartao
    from "Payments"
    where payment_type like '%card'
    group by payment_type
) t;


--Categorias com maior faturamento
select pdt.product_category_name as "categorias", round(sum(pay.payment_value)::numeric ,2)  as "faturamento"
from "Products" pdt  
inner join "Itens" ite 
on pdt.product_id = ite.product_id
inner join "Payments" pay 
on pay.order_id = ite.order_id
group by pdt.product_category_name;


--Produtos mais vendidos (quantidade)
select p.product_category_name as "categoria_produto", count(i.product_id) as "qtd_produto" 
from "Products" p
inner join "Itens" i
on p.product_id = i.product_id
where p.product_category_name is not null
group by p.product_category_name 
order by p.product_category_name desc;


--Frete médio por faixa de peso dos produtos 
select
    case  
        when p.product_weight_g <= 500 then 'até 500g'
        when p.product_weight_g <= 1000 then '500g - 1kg'
        when p.product_weight_g <= 5000 then '1kg - 5kg'
        else 'Acima de 5kg'
    end as faixa_peso,
    round(avg(i.freight_value)::numeric, 2) as frete_medio
from "Itens" i
join "Products" p 
    on i.product_id = p.product_id
group by faixa_peso
order by frete_medio desc;


--Quais categorias de produtos apresentam o maior frete médio por item vendido?
select p.product_category_name as "categoria", round(avg(i.freight_value):: numeric,2) as "frete_medio"
from "Products" p
inner join "Itens" i
on p.product_id = i.product_id
group by categoria
order by frete_medio desc;
