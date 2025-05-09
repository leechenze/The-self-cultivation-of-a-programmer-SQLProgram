
##############################
########## 聚合函数 ###########
##############################


use sqldb;

create table if not exists employee3
(
    emp_id     int primary key auto_increment comment '编号',
    emp_name   char(20)       not null default '' comment '姓名',
    salary     decimal(10, 2) not null default 0 comment '工资',
    department char(20)       not null default '' comment '部门'
);

insert into employee3(emp_name, salary, department)
values ('trump', 5000, '财务部'),
       ('obama', 5800, '财务部'),
       ('hamilton', 6200, '财务部'),
       ('clinton', 5700, '人事部'),
       ('hillary', 6700, '人事部'),
       ('nixon', 5200, '人事部'),
       ('stalin', 7500, '销售部'),
       ('putin', 7200, '销售部'),
       ('macron', 5800, '销售部');

# 将所有员工名字合成一行
select group_concat(emp_name) from employee3;
select group_concat(emp_name separator ' - ') from employee3;

# 指定分组进行分隔
select department, group_concat(emp_name separator ' - ') from employee3 group by department;


# 指定分组和排序方式进行分隔
select department, group_concat(emp_name order by salary separator ' - ') from employee3 group by department;






