
##############################
########## 默认约束 ###########
##############################

use sqldb;
drop table if exists t_user;

### 方式一: 创建表时指定默认值 ###
create table t_user
(
    id      int,
    name    varchar(20),
    address varchar(200) default 'BeiJing'
);

insert into t_user (id, name, address) values (1001, 'abraham', 'Xi`an');
insert into t_user (id, name) values (1002, 'douglas');

show columns from t_user;

### 方式一: 创建表之后通过修改表指定默认约束 ###

drop table if exists t_user;

create table t_user
(
    id      int,
    name    varchar(20),
    address varchar(200)
);

# 创建默认约束
alter table t_user modify address varchar(200) default 'NanJing';

show columns from t_user;

insert into t_user (id, name) values (1001, 'hillary');

#删除默认约束
alter table t_user modify address varchar(200) default null;
insert into t_user (id,name) values(1002, 'clinton');









