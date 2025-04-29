






##############################
########## 单列主键 ###########
##############################
# 方式一:
# create table emp1
# (
#     eid    int primary key,
#     name   varchar(20),
#     deptId int,
#     salary double
# );

# 方式二:
# create table emp1
# (
#     eid    int,
#     name   varchar(20),
#     deptId int,
#     salary double,
#     constraint pk1 primary key (eid)
#     ##### constraint pk1 可以省略掉 #####
# );

## 验证主键是否添加成功
# insert into emp1 (eid, name, deptId, salary)
# values (11, 'asdf', 10, 20);
## 已经加过eid主键列为11的数据了,再次加入相同的主键列eid为11时就会报错;
# insert into emp1 values(11, 'fjjfjf', 20, 22);








##############################
###### 多列主键/复合主键 #######
##############################

create table emp2
(
    name   varchar(20),
    deptId int,
    salary double,
    constraint pk2 primary key (name, deptId)
);


##############################
###### 修改表结构/添加主键 ######
##############################
create table emp3
(
    eid    int,
    name   varchar(20),
    deptId int,
    salary double
);
alter table emp3
    add primary key (eid);
alter table emp3
    add primary key (eid, deptId);

##############################
###### 修改表结构/删除主键 ######
##############################
alter table emp3 drop primary key;

show columns from emp3;
# 等价于
describe emp3;
# 简写为
# desc emp3;

# 修改表name字段允许为null
alter table emp3 modify name varchar(20) null;





