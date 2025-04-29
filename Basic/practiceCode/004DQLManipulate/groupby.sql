
##############################
########## 分组查询 ###########
##############################

use sqldb;

# 统计各个分类商品的个数
select category_id, count(*) from product group by category_id;

# 统计各个分类商品的个数, 且只显示个数大于4的数据
select category_id, count(pid) as total from product group by category_id having total > 4;

### limit
# 查询product的前五条数据
select * from product limit 5;

# 查询product的前十条数据, 从第四条开始
select * from product limit 4,10;

### insert into select
create table if not exists product1
(
    pname varchar(256),
    price double
);

insert into product1 select pname, price from product;


