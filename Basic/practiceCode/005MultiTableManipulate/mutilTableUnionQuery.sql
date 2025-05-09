
##############################
########## 多表联合查询 ###########
##############################

use sqldb;

# 创建部门表
create table if not exists department2(
    dept_no varchar(20) primary key,
    name varchar(20)
);
# 创建职工表
create table if not exists employee2
(
    eid     varchar(20),
    ename   varchar(20),
    age     int,
    dept_id varchar(20)
);
# 为部门表添加数据
insert into department2 values('1001','研发部');
insert into department2 values('1002','销售部');
insert into department2 values('1003','财务部');
insert into department2 values('1004','人事部');
# 为职工表添加数据
insert into employee2 values('1','乔峰',20, '1001');
insert into employee2 values('2','段誉',21, '1001');
insert into employee2 values('3','虚竹',23, '1001');
insert into employee2 values('4','阿紫',18, '1001');
insert into employee2 values('5','扫地僧',85, '1002');
insert into employee2 values('6','李秋水',33, '1002');
insert into employee2 values('7','鸠摩智',50, '1002');
insert into employee2 values('8','天山童姥',60, '1003');
insert into employee2 values('9','慕容博',58, '1003');
insert into employee2 values('10','丁春秋',71, '1005');


############ 交叉连接查询 ############
select * from department2, employee2;

############ 内连接查询 ############
# 隐式内连接(注意如果不加where条件的话, 结果即使笛卡尔积了)
select * from department2 as d2, employee2 as e2 where e2.dept_id = d2.dept_no;
# 显示内连接(显示和隐式内连接查询结果是一样的, 建议用显示内连接查询)
select * from department2 as d2 inner join employee2 as e2 on e2.dept_id = d2.dept_no;
# 查询每个部门的员工数
select *, count(name) as dept_emp_num
from department2 as d2
         inner join employee2 as e2 on e2.dept_id = d2.dept_no
group by d2.dept_no
order by dept_emp_num desc;

############ 外连接查询 ############
### 左外连接查询
select * from department2 as d2 left outer join employee2 as e2 on d2.dept_no = e2.dept_id;
### 右外连接查询
select * from department2 as d2 right outer join employee2 as e2 on d2.dept_no = e2.dept_id;
### 满连接查询 (由于mysql不支持 full join, 就用union 来实现full join的功能了)
select * from department2 as d2 left outer join employee2 as e2 on d2.dept_no = e2.dept_id
union
select * from department2 as d2 right outer join employee2 as e2 on d2.dept_no = e2.dept_id;


############ 子查询 ############
# 单行单列子查询为单行单列
# 查询年龄最大的员工的信息, 显示信息包含员工号, 员工名字, 员工年龄
select max(age) from employee2;
select * from employee2 where age = (select max(age) from employee2);

# 多行单列
# 查询研发部和销售部的员工信息, 包含员工号, 员工名字.
select * from employee2 where employee2.dept_id in (select dept_no from department2 where name in ('研发部','销售部'));

# 多行单列
# 查询研发部30岁以下的员工信息, 包括员工号, 员工名字, 部门名字
select * from (select * from department2 where name = '研发部') as a join (select * from employee2 where age < 30) as b;

### 子查询关键字 ###
### all ###
# 查询年龄大于'1003'部门所有年龄的员工信息
select * from employee2 where age > all (select age from employee2 where dept_id in ('1003'))

# 查询不属于任何一个部门的员工信息
select * from employee2 where dept_id != all(select dept_no from department2);
select * from employee2 where dept_id not in (select dept_no from department2);

# 查询年龄大于'1003'部门任意一个员工年龄的员工信息
select * from employee2 where age > any(select age from employee2 where dept_id = '1003');

# 查询公司是否有大于60的员工, 有则输出.
select * from employee2 as e2 where exists(select * from employee2 where e2.age > 60);
select * from employee2 as e2 where age in (select age from employee2 where age > 60);

# 查询所有有部门的员工信息.
select * from employee2 as e2 where exists(select * from department2 as d2 where e2.dept_id = d2.dept_no);
select * from employee2 as e2 where e2.dept_id in(select dept_no from department2 as d2 where e2.dept_id = d2.dept_no);
select * from employee2 as e2 where e2.dept_id in(select dept_no from department2);

############ 自关联查询 ############
### 创建sanguo表
# 为 manager_id 创建外键列, 引用自己的id字段
create table if not exists sanguo
(
    id         int primary key,
    name       varchar(20),
    manager_id int,
    foreign key (manager_id) references sanguo (id)
);
# 添加sanguo表数据
insert into sanguo
values (1, '刘协', null),
       (2, '刘备', 1),
       (3, '关羽', 2),
       (4, '张飞', 2),
       (5, '曹操', 1),
       (6, '许褚', 5),
       (7, '典韦', 5),
       (8, '孙权', 1),
       (9, '周瑜', 8),
       (10, '鲁肃', 8);
# 进行关联查询
# 查询每个三国人物及他的上级信息, 如: 关羽 刘备
select * from sanguo s1 join sanguo s2 where s1.manager_id = s2.id;

select * from sanguo s1 left join sanguo s2 on s1.manager_id = s2.id;

select
    s1.name, s2.name, s3.name
from sanguo s1
left join sanguo s2 on s2.manager_id = s1.id
left join sanguo s3 on s3.manager_id = s2.id;





