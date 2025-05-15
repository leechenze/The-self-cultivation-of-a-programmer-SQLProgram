##########################
########## 视图 ##########
##########################


# 创建相关表和数据
create table if not exists view_dept (
    deptno int primary key,
    dname varchar(20),
    ioc varchar(20)
);

insert into view_dept values (10, '教研部', '北京'),(20, '学工部', '上海'),(30, '销售部', '西安'),(40, '财务部', '重庆');

create table if not exists view_emp
(
    empno int primary key,
    ename  varchar(20),
    job    varchar(20),
    mgr int,
    hiredate date,
    sal double,
    comm int,
    deptno int
);

insert into view_emp values (1001,'甘宁', '文员', 1013, '2000-12-17', 8000, null, 20),
                            (1002,'戴维斯', '销售员', 1006, '2001-2-20', 16000, 3000, 30),
                            (1003,'殷天正', '销售员', 1006, '2001-2-22', 12500, 5000, 30),
                            (1004,'刘备', '经理', 1009, '2001-4-02', 29750, null, 30),
                            (1005,'谢逊', '销售员', 1006, '2001-9-28', 12500, 14000, 30),
                            (1006,'关羽', '经理', 1009, '2001-5-1', 28500, null, 30),
                            (1007,'张飞', '经理', 1009, '2001-9-1', 24500, null, 10),
                            (1008,'诸葛亮', '分析师', 1004, '2007-4-19', 30000, null, 20),
                            (1009,'阿牛', '董事长', null, '2001-11-17', 50000, null, 10),
                            (1010,'韦一笑', '销售员', 1006, '2001-9-8', 15000, 0, 30),
                            (1011,'周泰', '文员', 1008, '2007-5-23', 11000, null, 20),
                            (1012,'成蒲', '文员', 1006, '2001-12-3', 9500, null, 30),
                            (1013,'庞统', '分析师', 1004, '2001-12-3', 30000, null, 20),
                            (1014,'黄盖', '文员', 1007, '2002-1-23', 12000, null, 10);

create table if not exists view_salgrade
(
    grade int primary key auto_increment,
    losal int,
    hisal int
);

insert into view_salgrade (losal, hisal) values (7000, 12000),
    (12010, 14000),
    (14010, 20000),
    (20010, 30000),
    (30010, 99990);

# 根据创建的 view_dept,view_emp,view_salgrade 三张表创建视图
create or replace view view_emp_view as (
       select ename, job from view_emp
    );

# 查看所有的表包括视图
show full tables;

# 查询视图
select * from view_emp_view;

# 修改视图
alter view view_emp_view as (
    select
        a.deptno,
        a.dname,
        a.loc,
        b.ename,
        b.sal
    from view_dept a
    join view_emp b on a.deptno = b.deptno
 );

select * from view_emp_view;

# 更新视图

update view_emp_view set ename = '周瑜' where ename = '谢逊';
# 插入视图是不被允许的,因为视图中有join连表操作
# insert into view_emp_view values (1015,'奉孝', '分析师', 1007, '2001-3-20', 32000, null, 20);

# 重命名视图
rename table view_emp_view to view_emp_view01;
# 删除视图
drop view if exists view_emp_view01;






















