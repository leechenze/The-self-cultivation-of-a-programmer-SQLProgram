#############################
########## 存储过程 ##########
#############################
############ 游标 ############
#############################

use sqldb;

############################# 操作游标 #############################
drop procedure proce14;
# 需求: 输入一个部门名, 查询该部门员工的编号,名字,薪资. 将查询的结果集添加游标
delimiter $$
create procedure proce14(in dname varchar(50))
begin
    
    # 定义局部变量
    declare varEmpno int;
    declare varEname varchar(20);
    declare varSal double;

    # 声明游标
    declare cusCursor cursor for
    select a.empno, a.ename, a.sal from sp_emp as a
        join sp_dept b on a.deptno = b.deptno
                            and b.dname = dname;
    
    # 打开游标
    open cusCursor;
    
    # 通过游标获取值
    labelA: loop
        fetch cusCursor into varEmpno,varEname,varSal;
        select varEmpno, varEname, varSal;
    end loop labelA;
    
    # 关闭游标
    close cusCursor;
    select '关闭游标';
    
end $$
delimiter ;

call proce14('销售部');

############################# 异常处理(handler句柄) #############################;
drop procedure proce15;
# 需求: 输入一个部门名, 查询该部门员工的编号,名字,薪资. 将查询的结果集添加游标
delimiter $$
create procedure proce15(in dname varchar(50))
begin
    
    # 定义局部变量
    declare varEmpno int;
    declare varEname varchar(20);
    declare varSal double;
    
    # 定义一个标记值
    declare flag int default 1;
    
    # 声明游标
    declare cusCursor cursor for
        select a.empno, a.ename, a.sal from sp_emp as a
                                                join sp_dept b on a.deptno = b.deptno
            and b.dname = dname;
    
    # 声明句柄
    /************************************
     * 异常处理完后,指定程序如何进行
     * continue: 继续执行剩余代码
     * exit: 直接终止程序
     ************************************
     * 触发条件
     * 条件码: 1329等
     * 条件名: SQLWARNING, NOT FOUND, SQLEXCEPTION
     ************************************
     * 异常触发后要执行什么内容?
     * 默认设置flag值为1
     * 当设置flag值为0时就不在执行后续
     ************************************
     */
    # declare continue handler for not found
    declare continue handler for 1329 set flag = 0;
    
    # 打开游标
    open cusCursor;
    
    # 通过游标获取值
    labelA: loop
        fetch cusCursor into varEmpno,varEname,varSal;
        
        # 如果flag的值为1时执行, flag值为0时不执行
        if flag = 1 then
            select varEmpno, varEname, varSal;
        else
            leave labelA;
        end if;
    end loop labelA;
    
    # 关闭游标
    close cusCursor;
    select '关闭游标';

end $$
delimiter ;

call proce15('销售部');
