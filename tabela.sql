create table Customers (
    customer_id text primary key,
    customer_unique_id text not null,
    customer_city text,
    customer_state char(2)
);

create table Orders (
    order_id text primary key,
    customer_id text not null,
    order_status text,

    constraint fk_orders_customers
        foreign key (customer_id)
        references customers(customer_id)
);

create table Products (
    product_id text primary key,
    product_category_name text,
    product_weight_g integer,
    product_length_cm integer,
    product_height_cm integer,
    product_width_cm integer
);

create table Items (
    order_id text not null,
    order_item_id integer not null,
    product_id text not null,
    price numeric(10,2),
    freight_value numeric(10,2),

    constraint pk_order_items primary key (order_id, order_item_id),

    constraint fk_order_items_orders
        foreign key (order_id)
        references orders(order_id),

    constraint fk_order_items_products
        foreign key (product_id)
        references products(product_id)
);

create table Payments (
    order_id text not null,
    payment_sequential integer not null,
    payment_type text,
    payment_installments integer,
    payment_value numeric(10,2),

    constraint pk_payments primary key (order_id, payment_sequential),

    constraint fk_payments_orders
        foreign key (order_id)
        references orders(order_id)
);

