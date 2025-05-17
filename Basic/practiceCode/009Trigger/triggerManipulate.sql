#############################
########### 触发器 ###########
#############################
########### 触发器操作 ########
#############################

use sqldb;

# 数据准备
create table user_logs (
    id int primary key auto_increment,
    time timestamp,
    log_text varchar(255)
);

truncate table user;
truncate table user_logs;

############################# 触发器初探 #############################
# 需求: user表发生变动时, user_logs表自动记录该变动
# 定义触发器,方式一
create trigger trigger01 after insert
    on user for each row
    insert into user_logs values(null, now(), '添加用户操作');
# 定义触发器,方式二
delimiter $$
create trigger trigger02 after update
    on user for each row
    begin
        insert into user_logs values(null, now(), '修改用户操作');
    end $$
delimiter ;

# 给user表添加数据
insert into user values(1,'Nixon', '123456');
insert into user values(2,'Obama', '123456'),(3,'Trump', '123456'),(4,'Putin', '123456');
# 给user表修改数据
update user set password = '8888' where uid = 1;


############################# OLD 和 NEW #############################
drop trigger trigger04;
# insert类型触发器
create trigger trigger03 after insert
    on user for each row
    insert into user_logs values(null, now(), concat('添加用户操作, 信息: ', NEW.uid, '-', NEW.username, '-', NEW.password));

# update类型触发器
delimiter $$
create trigger trigger04 after update
    on user for each row
    begin
        insert into user_logs values(null, now(), concat('修改用户操作, 修改之前的信息: ', OLD.uid, '-', OLD.username, '-', OLD.password));
        insert into user_logs values(null, now(), concat('修改用户操作, 修改之后的信息: ', NEW.uid, '-', NEW.username, '-', NEW.password));
    end $$
delimiter ;

# delete类型触发器
create trigger trigger05 after delete
    on user for each row
    insert into user_logs values(null, now(), concat('删除用户操作, 删除的信息为: ', OLD.uid, '-', OLD.username, '-', OLD.password));

# 操作user表的数据
insert into user values(1,'Nixon', '123456');
update user set password = '111' where uid = 1;
delete from user where uid = 1;

# 查看触发器
show triggers;
# 删除触发器
drop trigger if exists trigger03;


