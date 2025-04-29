
##############################
########## 聚合查询 ###########
##############################

use sqldb;

# 查询商品的总条数
select count(*) from product;
# 查询价格大于200的商品的总条数
select count(price) from product where price >= 200;
# 查询分类为c001的所有商品的价格总和
select sum(price) from product where category_id = 'c001';
# 查询最贵的商品的价格
select pname, max(price) from product;
# 查询最便宜的商品的价格
select pname, min(price) from product;
# 查询最便宜的商品和最贵的商品的价格
select pname, min(price), max(price) from product;
# 查询分类为c002的商品的平均价格
select avg(price) as average from product where category_id in ('c002');























