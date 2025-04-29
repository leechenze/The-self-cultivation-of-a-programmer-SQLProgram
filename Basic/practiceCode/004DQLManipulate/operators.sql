
##############################
########## 运算符 ############
##############################

use sqldb;

### 算数运算符
select 6 + 2;
select 6 - 2;
select 6 * 2;
select 6 div 2;
select 6 mod 2;
select 6 mod 4;
# 将所有的商品价格加10元
select pname, price + 10 as new_price from product;
# 将所有的商品价格上调10%;
select pname, price * 1.1 as new_price from product;

### 比较运算符和逻辑运算符
# 查询价格不是800的所有商品
select * from product where price != 800;
select * from product where price <> 800;
select * from product where not (price = 800);
# 查询价格在200到1000区间的商品
select * from product where price between 200 and 1000;
select * from product where price >= 200 and price <= 1000;
# 查询价格为200或800的商品
select * from product where price in (200,800);
select * from product where price = 200 or price = 800;

# 使用least求最小值
select least(10,20,30,40);
# 使用least求最大值
select greatest(10,20,30,40);


### 位运算符


##############################
########## 排序查询 ###########
##############################

# 使用价格排序(降序)
select * from product order by price desc;
# 在价格排序的基础上,以分类排序(降序)
select * from product order by price desc, category_id desc;





































