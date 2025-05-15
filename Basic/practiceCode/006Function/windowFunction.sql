##############################
########## 窗口函数 ##########
##############################

use sqldb;

# 创建数据
create table if not exists employee4 (
    dname varchar(20),
    eid varchar(20),
    ename varchar(20),
    hiredate date,
    salary double
);

insert into employee4 values ('研发部', '1001', '刘备', '2021-11-01', 3000);
insert into employee4 values ('研发部', '1002', '关羽', '2021-11-02', 5000);
insert into employee4 values ('研发部', '1003', '张飞', '2021-11-03', 7000);
insert into employee4 values ('研发部', '1004', '赵云', '2021-11-04', 7000);
insert into employee4 values ('研发部', '1005', '马超', '2021-11-05', 4000);
insert into employee4 values ('研发部', '1006', '黄总', '2021-11-06', 4000);

insert into employee4 values ('销售部', '1007', '曹操', '2021-11-01', 2000);
insert into employee4 values ('销售部', '1008', '许褚', '2021-11-02', 3000);
insert into employee4 values ('销售部', '1009', '典韦', '2021-11-03', 5000);
insert into employee4 values ('销售部', '1010', '张辽', '2021-11-04', 6000);
insert into employee4 values ('销售部', '1011', '虚晃', '2021-11-05', 9000);
insert into employee4 values ('销售部', '1012', '曹红', '2021-11-06', 6000);

#####################################################################
############################## 序号函数 ##############################
#####################################################################

# 对每个部门的员工按照薪资排序,并给出排名
select
    dname,
    ename,
    salary,
    row_number() over (partition by dname order by salary desc) as 'row_number',
    rank() over (partition by dname order by salary desc) as 'rank',
    dense_rank() over (partition by dname order by salary desc) as 'dense_rank'
from employee4;

# 获取每个部门薪资排在前三名的员工
# 这里嵌套一个子查询是因为 row_number 无法获取的原因,因为执行顺序是先 from 然后 where 最后才执行select.
select * from (
      select
          dname,
          ename,
          salary,
          row_number() over (partition by dname order by salary desc) as 'row_number'
      from employee4
      ) t
where t.row_number <= 3;

#######################################################################
############################## 开窗聚合函数 #############################
#######################################################################

select
    dname,
    ename,
    hiredate,
    salary,
    sum(salary) over (partition by dname order by hiredate) as 'sum1'
from employee4;
# 控制累加的范围
# (rows between unbounded preceding and current row)
# 解读: 从 unbounded preceding 开始到 当前行截止. 这也是默认的参数, 即不写这个值默认会走这个逻辑
select
    dname,
    ename,
    hiredate,
    salary,
    sum(salary) over (partition by dname order by hiredate rows between unbounded preceding and current row) as sum1
from employee4;
# 从当前行之前的三行开始累加到当前行截止.
select
    dname,
    ename,
    hiredate,
    salary,
    sum(salary) over (partition by dname order by hiredate rows between 3 preceding and current row) as sum1
from employee4;
# 从当前行之前的三行开始累加到当前行之后的一行, 如果向前不够三行时会有几行的数据就加几行, 向后没有时同理.
select
    dname,
    ename,
    hiredate,
    salary,
    sum(salary) over (partition by dname order by hiredate rows between 3 preceding and 1 following) as sum1
from employee4;
# 从当前行开始累加到最后一行.
select
    dname,
    ename,
    hiredate,
    salary,
    sum(salary) over (partition by dname order by hiredate rows between current row and unbounded following) as sum1
from employee4;
# 求 根据部门分组的 入职日期排序的 窗口规则为从第一行到当前行的 薪资平均值
select
    dname,
    ename,
    hiredate,
    salary,
    avg(salary) over (partition by dname order by hiredate rows between unbounded preceding and current row) as avg1
from employee4;
# 求 根据部门分组的 入职日期排序的 窗口规则为从第一行到最后一行的 薪资平均值
select
    dname,
    ename,
    hiredate,
    salary,
    avg(salary) over (partition by dname order by hiredate rows between unbounded preceding and unbounded following) as avg1
from employee4;

# 求 根据部门分组的 入职日期排序的 窗口规则为从第一行到最后一行的 薪资最大值
select
    dname,
    ename,
    hiredate,
    salary,
    max(salary) over (partition by dname order by hiredate rows between unbounded preceding and unbounded following) as max1
from employee4;
# 求 根据部门分组的 入职日期排序的 窗口规则为从第一行到当前行的 薪资最大值(这个也是默认值)
select
    dname,
    ename,
    hiredate,
    salary,
    max(salary) over (partition by dname order by hiredate rows between unbounded preceding and current row) as max1
from employee4;


#####################################################################
############################## 分布函数 ##############################
#####################################################################

# 查询小于等于当前薪资的比例
# (刘备的三千 输入为 0.25 解释: 小于等于3000的有三条, 这三条除总行数, 3 / 12 = 1 / 4 = 0.25)
select dname,
       ename,
       salary,
       cume_dist() over (order by salary) as rn1,
       cume_dist() over (partition by dname order by salary) as rn2
from employee4;

select dname,
       ename,
       salary,
       rank() over (partition by dname order by salary desc) as rn1,
       percent_rank() over (partition by dname order by salary desc) as rn2
from employee4;

#####################################################################
############################## 前后函数 ##############################
#####################################################################

select dname,
       ename,
       hiredate,
       lag(hiredate, 1, '2000-01-01') over (partition by dname order by hiredate) as rn1,
       lag(hiredate, 2) over (partition by dname order by hiredate) as rn2
from employee4;

select dname,
       ename,
       hiredate,
       lead(hiredate, 1, '2000-01-01') over (partition by dname order by hiredate) as rn1,
       lead(hiredate, 2) over (partition by dname order by hiredate) as rn2
from employee4;

#####################################################################
############################## 头尾函数 ##############################
#####################################################################

# 按照日期排序查询第一个入职和最后一个入职员工的薪资
select dname,
       ename,
       hiredate,
       salary,
       first_value(salary) over (partition by dname order by hiredate) as rn1,
       last_value(salary) over (partition by dname order by hiredate) as rn2
from employee4;

#####################################################################
############################## 头尾函数 ##############################
#####################################################################

# 截止到当前行薪资, 显示每个员工的薪资中排名第二或者第三的薪资
select dname,
       ename,
       hiredate,
       salary,
       nth_value(salary,2) over (partition by dname order by hiredate) as nv1,
       nth_value(salary,3) over (partition by dname order by hiredate) as nv2
from employee4;

# 将每个部门员工按照入职日期分成3组
select dname,
       ename,
       hiredate,
       salary,
       ntile(3) over (partition by dname order by hiredate) as n1
from employee4;





