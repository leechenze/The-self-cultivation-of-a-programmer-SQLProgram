#############################
########## 存储过程 ##########
#############################
########## 入门案例 ##########
#############################

use sqldb;

############################## 局部变量 ##############################
delimiter $$
create procedure proc02()
begin
    # 声明变量
    declare varname01 varchar(20) default 'aaa';
    # 变量赋值
    set varname01 = 'lian';
    # 输出变量
    select varname01;
end $$

delimiter $$
create procedure proc03()
begin
    # 声明变量
    declare varname01 varchar(20) default 'aaa';
    # 变量赋值
    select ename into varname01 from sp_emp where empno = 1001;
    # 输出变量
    select varname01;
end $$

# 调用过程
call proc02();
call proc03();

############################## 用户变量 ##############################

delimiter $$
create procedure proc04()
begin
    set @varname01 = 'douglas';
    select @varname01;
end $$
delimiter ;
call proc04();
select @varname01;

############################## 全局变量 ##############################

# 查看所有全局变量
show global variables;
# 查看某一个全局变量
select @@global.port;
select @@global.auto_increment_increment;
# 修改全局变量(原始值:262144)
select @@global.sort_buffer_size;
set global sort_buffer_size = 40000;
set @@global.sort_buffer_size = 80000;

############################## 会话变量 ##############################

# 查看所有会话变量
show global variables;
# 查看某一个会话变量
select @@session.port;
select @@session.auto_increment_increment;
# 修改会话变量(原始值:262144)
select @@session.sort_buffer_size;
set session sort_buffer_size = 40000;
set @@session.sort_buffer_size = 80000;








