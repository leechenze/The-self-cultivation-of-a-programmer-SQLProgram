#############################
############ 索引 ############
#############################
########## 空间索引 ##########
#############################

use sqldb;

create table if not exists shop_info
(
    id             int primary key auto_increment not null comment 'id',
    shop_name      varchar(255)                   not null comment '商店名称',
    geometry_point geometry                       not null comment '商店坐标',
    spatial key geometry_point_index (geometry_point)
);

# 插入一条数据
insert into shop_info (shop_name, geometry_point)
values (
           '星巴克上海南京东路店',
           ST_GeomFromText('POINT(121.490317 31.241134)')
       );

# 查看数据
# ST_GeomFromText会将坐标文本转为二进制的格式, ST_AsText函数可以解析为文本.
select id, shop_name, ST_AsText(geometry_point) as point_text
from shop_info;


