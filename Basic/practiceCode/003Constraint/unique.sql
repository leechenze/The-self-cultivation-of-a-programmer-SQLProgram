

##############################
########## 唯一约束 ###########
##############################

### 方式一: 创建表之后通过修改表指定 ###

use sqldb;

drop table if exists t_user;

create table if not exists t_user
(
    id        int,
    name      varchar(20),
    phone_num int
);

# 创建唯一约束
alter table t_user add constraint unique_0 unique(phone_num);

desc t_user;

insert into t_user (id, name, phone_num) values (1001, 'douglas', 186);
insert into t_user (id, name, phone_num) values (1002, 'linclon', 186);

# 删除唯一约束
alter table t_user drop index unique_0;


### 方式二: 在创建表时指定唯一约束 ###

drop table if exists t_user;

create table if not exists t_user
(
    id        int,
    name      varchar(20),
    phone_num int unique
);

desc t_user;

# 删除唯一约束
# alter table t_user drop index phone_num;









