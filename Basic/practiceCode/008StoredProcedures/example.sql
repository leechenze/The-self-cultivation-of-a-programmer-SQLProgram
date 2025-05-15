#############################
########## 存储过程 ##########
#############################
########## 入门案例 ##########
#############################

use sqldb;

# 创建相关表和数据
create table sp_dept (
    select * from view_dept
);
create table sp_emp (
    select * from view_emp
);
create table sp_salgrade as select * from view_salgrade;

############################################################

### 创建存储过程

# 声明存储过程的结束符
delimiter $$

create procedure proc01()
begin
    select empno, ename from sp_emp;
end $$;

delimiter ;

# 调用存储过程
call proc01();