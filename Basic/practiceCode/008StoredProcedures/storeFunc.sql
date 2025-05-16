#############################
########## 存储过程 ##########
#############################
############ 存储函数 ########
#############################

use sqldb;

# MySql需要设置对函数权限信任.
set global log_bin_trust_function_creators = true;

############################# 无参存储函数 #############################
# 返回值员工表的总条数.
drop function if exists func01;
delimiter $$
create function func01() returns int
begin
    declare totalNum int default 0;
    select count(*) into totalNum from sp_emp;
    return totalNum;
end $$
delimiter ;

# 调用存储函数
select func01();

############################# 有参存储函数 #############################
# 传入一个员工编号, 返回员工的名字
drop function if exists func02;
delimiter $$
create function func02(empno int) returns varchar(50)
begin
    declare retEname varchar(50);
    select ename into retEname from sp_emp as t where t.empno = empno;
    return retEname;
end $$
delimiter ;

# 调用存储函数
select func02(1001);



