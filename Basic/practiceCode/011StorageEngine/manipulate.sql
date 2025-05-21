#############################
############ 存储引擎 ############
#############################
############ 操作 ############
#############################

use sqldb;

# 查看当前数据库支持的存储引擎
show engines;

# 查看当前的默认存储引擎
show variables like '%storage_engine%';

# 查看某个表用的什么引擎
show create table shop_info;

# 创建表, 指定存储引擎
create table stu(id int, name varchar(20)) engine = MyISAM;
show create table stu;

# 修改数据库引擎
alter table stu engine = INNODB;
show create table stu;
