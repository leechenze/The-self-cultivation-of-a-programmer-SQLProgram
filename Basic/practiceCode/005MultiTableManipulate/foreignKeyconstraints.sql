
##############################
########## 外键约束 ###########
##############################

use sqldb;

-- 创建主表部门表
create table if not exists department
(
    dept_no varchar(20) primary key,
    `name` varchar(20)
);

-- 创建员工表, 并创建外键约束
create table if not exists employee
(
    eid     varchar(20) primary key,
    ename   varchar(20),
    age     int,
    dept_id varchar(20),
    constraint emp_fk foreign key (dept_id) references department(dept_no)
);

### 创建外键约束
# 创建主表部门表1
create table if not exists department1
(
    dept_no varchar(20) primary key,
    `name`  varchar(20)
);

# 创建主表部门表1
create table if not exists employee1
(
    eid     varchar(20) primary key,
    ename   varchar(20),
    age     int,
    dept_id varchar(20)
);

# 创建外键约束
alter table employee1
    add constraint emp1_fk foreign key (dept_id) references department1 (dept_no);
# 删除外键约束
alter table employee1 drop foreign key emp1_fk;

# 创建多对多关系的表, student和course表.
# student
create table if not exists student
(
    sid int primary key auto_increment,
    name varchar(20),
    age int,
    gender varchar(5)
);
# course
create table if not exists course
(
    cid int primary key auto_increment,
    cname varchar(20)
);
# 表示多对多关系的中间表
create table if not exists score
(
    sid   int,
    cid   int,
    score double
);
# 建立多对多关系中间表的外键约束(这里就不给外键约束命名了,为了简洁把 constraint score_fk 这个命名先去掉)
# alter table score add constraint score_fk foreign key (sid) references student(sid);
alter table score add foreign key (sid) references student(sid);
alter table score add foreign key (cid) references course(cid);

# 插入数据
insert into student
values (1, 'Hamilton', 18, 'man'),
       (2, 'Hillary', 29, 'woman'),
       (3, 'Trump', 40, 'man');

insert into course
values (1, 'Mathematics'),
       (2, 'Chinese'),
       (3, 'English');

insert into score
values (1, 1, 78),
       (1, 2, 75),
       (2, 1, 80),
       (2, 3, 90),
       (3, 2, 77),
       (3, 3, 89);





