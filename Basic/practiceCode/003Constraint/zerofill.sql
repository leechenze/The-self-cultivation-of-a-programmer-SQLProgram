
##############################
########## 零填充约束 ##########
##############################

use sqldb;

drop table if exists t_user;

create table if not exists t_user
(
    id      int zerofill,
    name    varchar(20),
    address varchar(200)
);

insert into t_user (id, name, address) values(123, 'hillary', 'Xi`an');

# 设置零填充约束
alter table t_user modify id int zerofill;
# 删除约束
alter table t_user modify id int;

show columns from t_user;

















