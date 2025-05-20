#############################
############ 索引 ############
#############################
########## 单列索引 ##########
#############################

use sqldb;

############################# 普通索引 #############################
############################# 创建普通索引 #############################
# 创建索引方式一:
# 在创建表时 给name列创建索引, 名为 name_index.
create table if not exists students (
    sid int primary key,
    card_id int,
    name varchar(20),
    gender varchar(20),
    age int,
    birth date,
    phone_num varchar(20),
    score double,
    index name_index(name)
);

# 创建索引方式二:
# 直接创建
create index gender_index on students(gender);

# 创建索引方式三:
# 通过修改表结构的方式建立索引
alter table students add index age_index(age);

############################# 查看普通索引 #############################
# 查看数据库所有索引
select * from mysql.innodb_index_stats iis where iis.database_name = 'sqldb';
# 查看表中的所有索引方式一:
select * from mysql.innodb_index_stats iis where iis.database_name = 'sqldb' and iis.table_name like '%students%';
# 查看表中的所有索引方式二:
show index from students;

############################# 删除普通索引 #############################
# 删除表中的所有索引方式一:
drop index gender_index on students;
# 删除表中的所有索引方式二:
alter table students drop index age_index;



############################# 唯一索引 #############################
# 创建唯一索引方式一:
# 在创建表时 给name列创建唯一索引, 名为 name_index.
create table if not exists students1 (
    sid int primary key,
    card_id int,
    name varchar(20),
    gender varchar(20),
    age int,
    birth date,
    phone_num varchar(20),
    score double,
    unique card_id_index(card_id)
);
# 创建唯一索引方式二:
create unique index phone_num_unique_index on students1(phone_num);
# 创建唯一索引方式三:
alter table students1 add unique index phone_num_unique_index1(phone_num);
############################# 删除唯一索引 #############################
# 方式一:
drop index phone_num_unique_index on students1;
# 方式二:
alter table students1 drop index phone_num_unique_index1;













