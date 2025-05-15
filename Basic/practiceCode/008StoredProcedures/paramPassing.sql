#############################
########## 存储过程 ##########
#############################
########## 参数传递 ##########
#############################

use sqldb;

############################## in 关键字 ##############################

# 封装有参数的存储过程, 传入员工编号, 查找员工信息
delimiter $$;
create procedure proce01(in param_empno int)
begin
    select * from sp_emp where empno = param_empno;
end $$;
delimiter ;

call proce01(1001);

# 封装通过传入部门和薪资, 查询指定部门, 并且薪资大于指定值的员工信息
delimiter $$
create procedure proce02(in param_deptno int, in param_salary double)
begin
    select *
    from sp_emp
        join sp_dept on sp_emp.deptno = sp_dept.deptno
            and sp_emp.sal >= param_salary
            and sp_emp.deptno = param_deptno;
end $$
delimiter ;

call proce02(10, 10000);

############################## out 关键字 ##############################

# 传入员工编号, 返回员工名字
delimiter $$
create procedure proce03(in param_empno int, out out_ename varchar(20), out out_sal double)
begin
    select ename, sal into out_ename, out_sal from sp_emp where param_empno = sp_emp.empno;
end $$
delimiter ;

call proce03(1006, @e_name, @e_sal);

select @e_name;
select @e_sal;

############################## inout 关键字 ##############################

# 传入一个数字, 返回这个数值的十倍
delimiter $$
create procedure proce04(inout num int)
begin
    set num = num * 10;
end $$
delimiter ;

set @num = 2;

call proce04(@num);

select @num;

# 传入一个员工名, 将员工名字拼接部门号, 传入薪资, 求出年薪.
delimiter $$
create procedure proce05(inout inout_ename varchar(20), inout inout_sal double)
begin
    select concat_ws('-', t1.deptno, ename), sal*12 into inout_ename, inout_sal from sp_emp t1 where t1.ename = inout_ename;
end $$
delimiter ;

set @ename = '关羽';
set @sal = 3000;

call proce05(@ename, @sal);

select @ename, @sal;
