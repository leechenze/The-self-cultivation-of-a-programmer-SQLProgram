#############################
############ 事务 ############
#############################
############ 操作 ############
#############################

use sqldb;

# 创建账户表
create table account
(
    id    int primary key auto_increment comment 'ID',
    name  varchar(20) comment '名字',
    money double comment '金额'
);

# 插入数据
insert into account values (null, 'Hamilton', 1000),(null, 'Hillary', 1000);


# 修改提交方式, 关闭自动提交
set autocommit = 0;
select @@autocommit;

# 模拟账户转账
# 开启事务
start transaction;
update account set money = money - 200 where name = 'Hamilton';
update account set money = money + 200 where name = 'Hillary';
# 提交事务
commit;
# 回滚事务
rollback;

select * from account;


############################# 事务隔离级别 #############################
# 查看隔离级别
show variables like '%isolation%';
### 设置隔离级别
# 设置为 read uncommitted
# set session transaction isolation level read uncommitted;
# 设置为 read committed
# set session transaction isolation level read committed;
# 设置为 repeatable read
# set session transaction isolation level repeatable read;
# 设置为 serializable
# set session transaction isolation level repeatable read;





