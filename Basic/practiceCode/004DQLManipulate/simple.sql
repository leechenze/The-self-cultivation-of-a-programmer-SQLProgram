
##############################
########## 简单查询 ###########
##############################

create database if not exists sqldb;

use sqldb;

create table if not exists product
(
    pid         int primary key auto_increment,
    pname       varchar(128) not null,
    price       double,
    category_id varchar(64)
);

# 添加数据
# c001 ==> 家电
# c002 ==> 服装
# c003 ==> 护肤品
# c004 ==> 食品
insert into product
values (null, 'washing machine', 5000, 'c001'),
       (null, 'refrigerator refrigerator', 3000, 'c001'),
       (null, 'air conditioner', 5000, 'c001'),
       (null, 'rice cooker', 2000, 'c001'),

       (null, 'shirt', 300, 'c002'),
       (null, 'trousers', 800, 'c002'),
       (null, 'jacket', 255, 'c002'),
       (null, 'casual pants', 345, 'c002'),
       (null, 'sweatshirt', 200, 'c002'),
       (null, 'sport pants', 188, 'c002'),

       (null, 'face cream', 188, 'c003'),
       (null, 'essence water', 188, 'c003'),
       (null, 'perfume', 188, 'c003'),
       (null, 'foundation liquid', 188, 'c003'),
       (null, 'fairy water', 188, 'c003'),

       (null, 'instant noodles', 20, 'c004'),
       (null, 'kelp', 18, 'c004'),
       (null, 'nuts', 23, 'c004');

# 查询所有商品
select * from product;
# 查询指定列
select pid,pname,price from product;
# 表别名
select * from product as p;
# 列别名
select pname as name from product;
# 去掉重复值
select distinct price from product;
# 运算查询
# 询结果是表达式,将所有商品的价格+10元进行显示
select pname, price + 10 as new_price from product;

