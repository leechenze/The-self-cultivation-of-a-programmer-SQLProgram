
##############################
########## 非空约束 ###########
##############################

########## 方式一: 创建时指定 ###########
# use sqldb;
#
# create table t_user
# (
#     id      int,
#     name    varchar(20) not null,
#     address varchar(20) not null
# );
#
# # insert into t_user0 (id) values (1001);
# insert into t_user value (1001, 'empty', 'empty');
#
# drop table t_user;

########## 方式二: 创建表之后修改为非空约束 ###########
# create table if not exists t_user
# (
#     id      int,
#     name    varchar(20),
#     address varchar(20)
# );
#
# alter table t_user modify name varchar(20) not null;
# alter table t_user modify address varchar(20) not null;
#
# # drop table if exists t_user;
#
# desc t_user;




































