#############################
############ 优化 ############
#############################

use sqldb;

############################# 查看sql执行频率 #############################
# 查看当前会话Sql执行类型的统计信息
show session status like 'Com_______';
# 查看全局会话(自从上次MySql服务器启动至今)Sql执行类型的统计信息
show global status like 'Com_______';
# 针对InnoDB引擎的统计信息
show session status like 'Innodb_rows_%';


############################# 定位低效率执行的Sql #############################
# 查看慢日志配置信息
show variables like '%slow_query_log%';
# 开启慢日志查询
set global slow_query_log = 1;
# 查看慢日志记录SQL的最低阈值时间
show variables like '%long_query_time%';
# 修改慢日志记录SQL的最低阈值时间
set global long_query_time = 5;

### 动态查看当前正在执行的sql的效率
show full processlist;

############################# 分析执行计划 #############################

############################# profile分析Sql #############################

# 查看MySql是否支持profile
select @@have_profiling;
# 设置开启profile;
set profiling = 1;
# 执行查询sql;
show tables;
select count(*) from emp3;
select * from emp3 where eid > 2;

# 查看执行的各个语句耗时
show profiles;
# 根据查询ID查看具体某条语句的执行情况;
show profile all for query 179;

############################# trace优化器 #############################

# 设置trace可使用的内存大小, 即文件格式为josn
set optimizer_trace = "enabled=on", end_markers_in_json = on;
set optimizer_trace_max_mem_size = 1000000;
# 执行sql: 查询研发部30岁以下的员工信息, 包括员工号, 员工名字, 部门名字
select * from (select * from department2 where name = '研发部') as a join (select * from employee2 where age < 30) as b;
# 通过查看information_schema库下的optimizer_trace表获取sql的执行情况;
select * from information_schema.optimizer_trace `\G`;
select * from information_schema.optimizer_trace;


############################# 索引优化 #############################
# 创建表和准备数据
create table `tb_seller`
(
    `sellerid`   varchar(100),
    `name`       varchar(100),
    `nickname`   varchar(50),
    `password`   varchar(60),
    `status`     varchar(1),
    `address`    varchar(100),
    `createtime` datetime,
    primary key (`sellerid`)
);
# 添加数据
insert into `tb_seller` (`sellerid`, `name`, `nickname`, `password`, `status`, `address`, `createtime`) values('alibaba','阿里巴巴','阿里小店','e10adc3949ba59abbe56e057f20f883e','1','北京市','2088-01-01 12:00:00');
insert into `tb_seller` (`sellerid`, `name`, `nickname`, `password`, `status`, `address`, `createtime`) values('baidu','百度科技有限公司','百度小店','e10adc3949ba59abbe56e057f20f883e','1','北京市','2088-01-01 12:00:00');
insert into `tb_seller` (`sellerid`, `name`, `nickname`, `password`, `status`, `address`, `createtime`) values('huawei','华为科技有限公司','华为小店','e10adc3949ba59abbe56e057f20f883e','0','北京市','2088-01-01 12:00:00');
insert into `tb_seller` (`sellerid`, `name`, `nickname`, `password`, `status`, `address`, `createtime`) values('itcast','传智播客教育科技有限公司','传智播客','e10adc3949ba59abbe56e057f20f883e','1','北京市','2088-01-01 12:00:00');
insert into `tb_seller` (`sellerid`, `name`, `nickname`, `password`, `status`, `address`, `createtime`) values('itheima','黑马程序员','黑马程序员','e10adc3949ba59abbe56e057f20f883e','0','北京市','2088-01-01 12:00:00');
insert into `tb_seller` (`sellerid`, `name`, `nickname`, `password`, `status`, `address`, `createtime`) values('luoji','罗技科技有限公司','罗技小店','e10adc3949ba59abbe56e057f20f883e','1','北京市','2088-01-01 12:00:00');
insert into `tb_seller` (`sellerid`, `name`, `nickname`, `password`, `status`, `address`, `createtime`) values('oppo','OPPO科技有限公司','OPPO官方旗舰店','e10adc3949ba59abbe56e057f20f883e','0','北京市','2088-01-01 12:00:00');
insert into `tb_seller` (`sellerid`, `name`, `nickname`, `password`, `status`, `address`, `createtime`) values('ourpalm','掌趣科技股份有限公司','掌趣小店','e10adc3949ba59abbe56e057f20f883e','1','北京市','2088-01-01 12:00:00');
insert into `tb_seller` (`sellerid`, `name`, `nickname`, `password`, `status`, `address`, `createtime`) values('qiandu','千度科技','千度小店','e10adc3949ba59abbe56e057f20f883e','2','北京市','2088-01-01 12:00:00');
insert into `tb_seller` (`sellerid`, `name`, `nickname`, `password`, `status`, `address`, `createtime`) values('sina','新浪科技有限公司','新浪官方旗舰店','e10adc3949ba59abbe56e057f20f883e','1','北京市','2088-01-01 12:00:00');
insert into `tb_seller` (`sellerid`, `name`, `nickname`, `password`, `status`, `address`, `createtime`) values('xiaomi','小米科技','小米官方旗舰店','e10adc3949ba59abbe56e057f20f883e','1','西安市','2088-01-01 12:00:00');
insert into `tb_seller` (`sellerid`, `name`, `nickname`, `password`, `status`, `address`, `createtime`) values('yijia','宜家家居','宜家家居旗舰店','e10adc3949ba59abbe56e057f20f883e','1','北京市','2088-01-01 12:00:00');
insert into `tb_seller` (`sellerid`, `name`, `nickname`, `password`, `status`, `address`, `createtime`) values('xiaomi1','小米科技','小米官方旗舰店','e10adc3949ba59abbe56e057f20f883e','1','北京市','2088-01-01 12:00:00');
# 创建组合索引
create index idx_seller_name_sta_addr on tb_seller(name,status,address);
############################# 全值匹配
explain select * from tb_seller where name = '小米科技' and status = '1' and address = '北京市';
explain select * from tb_seller where name = '小米科技' and address = '北京市' and status = '1';

############################# 最左前缀法则
# 如果索引了多列，要遵守最左前缀法则。指的是查询从索引的最左前列开始，并且不跳过索引中的列。
explain select * from tb_seller where name = '小米科技'; # 403
explain select * from tb_seller where name = '小米科技' and status = '1'; # 410
explain select * from tb_seller where  status = '1' and name = '小米科技'; # 410
# 违法最左前缀法则, 索引失效：
explain select * from tb_seller where status = '1'; # nulll
# 如果符合最左法则, 但是出现跳跃某一列, 只有最左列索引生效:
explain select * from tb_seller where name = '小米科技'  and address = '北京市'; # 403

############################# 其他匹配原则
### 范围查询右边的列，不能使用索引 。
explain select * from tb_seller where name = '小米科技' and status > '1' and address = '北京市';

### 不要在索引列上进行运算操作, 索引将失效。
explain select * from tb_seller where substring(name, 3, 2) = '科技';

### 查询类型不匹配时, 索引将失效.
# 字符串不加单引号, 造成索引失效, 因为不加单引号时类型就是数值类型了, 从而导致索引失效.
explain select * from tb_seller where name = '小米科技' and status = 1;

### 尽量使用覆盖索引, 避免select *
# 需要从原表及磁盘上读取数据
explain select * from tb_seller where name='小米科技'  and address='北京市';  # 效率低
# 从索引树中就可以查询到所有数据
explain select name from tb_seller where name='小米科技'  and address='北京市';  # 效率高
explain select name,status,address from tb_seller where name='小米科技'  and address='北京市';  # 效率高
# 如果查询列，超出索引列，也会降低性能。
explain select name,status,address,password from tb_seller where name='小米科技'  and address='北京市';  # 效率低

### 用or分割开的条件， 那么即使有涉及的索引都不会被用到。
explain select * from tb_seller where name='黑马程序员' or createtime = '2088-01-01 12:00:00';
explain select * from tb_seller where name='黑马程序员' or address = '西安市';
explain select * from tb_seller where name='黑马程序员' or status = '1';

### 以%开头的Like模糊查询，索引失效。
explain select * from tb_seller where name like '科技%'; # 用索引
explain select * from tb_seller where name like '%科技'; # 不用索引
explain select * from tb_seller where name like '%科技%';# 不用索引
# 弥补不足, 不用*, 使用索引列,即使用覆盖索引时, 即使以%开头的Like模糊查询, 索引也会生效.
explain select name from tb_seller where name like '%科技%';

### 如果MySQL评估使用索引比全表更慢，则不使用索引。
# 这种情况是由数据本身的特点来决定的, 北京市有很多, 即使address有索引, 在sql看来, 一个个查找这么多北京市, 还不如把整个表扫描一遍来的快.
# 别完了, 一般情况下, 有多个重复数据的字段是不建议使用索引的, 就是这个原因.
create index index_address on tb_seller(address);
explain select * from tb_seller where address = '北京市'; # 没有使用索引
explain select * from tb_seller where address = '西安市'; # 没有使用索引

### is  NULL, is NOT NULL  有时有效, 有时索引失效。
# 如果nickname这个单列索引的null很少时, is NULL 就会有效, is not NULL 就会无效;
# 相反, 如果nickname这个单列索引的null很多时, is NULL 就会无效, is not NULL 就会有效;
create index index_nickname on tb_seller(nickname);
explain select * from tb_seller where nickname is NULL;  # 索引有效
explain select * from tb_seller where nickname is not NULL; # 索引无效

### 普通索引时: in 走索引, not in 不走索引.
### 主键索引时: in 走索引, not in 也走索引.
# 普通索引
explain select * from tb_seller where nickname in ('阿里小店', '百度小店'); # 索引生效
explain select * from tb_seller where nickname not in ('阿里小店', '百度小店'); # 索引无效
# 主键索引
explain select * from tb_seller where tb_seller.sellerid in ('alibaba', 'baidu'); # 索引生效
explain select * from tb_seller where tb_seller.sellerid not in ('alibaba', 'baidu'); # 索引生效

### 单列索引和复合索引, 尽量使用复合索引.

############################# SQL优化 #############################
############################# 大批量插入数据优化
### 主键顺序插入
# 创建数据
create table `tb_user1`
(
    `id`          int(11)     not null auto_increment,
    `username`    varchar(45) not null,
    `password`    varchar(96) not null,
    `name`        varchar(45) not null,
    `birthday`    datetime    default null,
    `sex`         char(1)     default null,
    `email`       varchar(45) default null,
    `phone`       varchar(45) default null,
    `qq`          varchar(32) default null,
    `status`      varchar(32) not null comment '用户状态',
    `create_time` datetime    not null,
    `update_time` datetime    default null,
    primary key (`id`),
    unique key `unique_user_username` (`username`)
);
# 1、首先，检查一个全局系统变量 'local_infile' 的状态， 如果得到如下显示 Value=OFF，则说明这是不可用的
show global variables like 'local_infile';
# 2、修改local_infile值为on，开启local_infile
set global local_infile = 1;
# 3、加载数据
/*
脚本文件介绍 :
    sql1.log  ----> 主键有序
    sql2.log  ----> 主键无序
*/
# 有序文件加载: 20秒左右
load data local infile '/Users/lee/MySkills/The-self-cultivation-of-a-programmer-SQLProgram/Basic/resources/sql1.log' into table tb_user1 fields terminated by ',' lines terminated by '\n';
# 清空表数据
truncate table tb_user;
# 无序文件加载: 80秒左右
load data local infile '/Users/lee/MySkills/The-self-cultivation-of-a-programmer-SQLProgram/Basic/resources/sql2.log' into table tb_user1 fields terminated by ',' lines terminated by '\n';
# 结论: 无序文件加载比有序文件加载的耗时大概4倍, 所以在倒入外部文件时, 尽量保证文件中的主键有序, 以提高导入效率.

### 关闭唯一性校验
# 设置关闭唯一性校验
SET UNIQUE_CHECKS = 0;
# 清空表数据
truncate table tb_user;
# 导入数据
load data local infile '/Users/lee/MySkills/The-self-cultivation-of-a-programmer-SQLProgram/Basic/resources/sql1.log' into table tb_user1 fields terminated by ',' lines terminated by '\n';
# 导入成功后再打开唯一性校验.
SET UNIQUE_CHECKS = 1;

############################# insert优化
# 详见 SummaryOfNotes.md 文档中的记录

############################# orderby优化
# 数据准备
CREATE TABLE `emp`
(
    `id`     int(11)      NOT NULL AUTO_INCREMENT,
    `name`   varchar(100) NOT NULL,
    `age`    int(3)       NOT NULL,
    `salary` int(11) DEFAULT NULL,
    PRIMARY KEY (`id`)
);
insert into `emp` (`id`, `name`, `age`, `salary`) values('1','Tom','25','2300');
insert into `emp` (`id`, `name`, `age`, `salary`) values('2','Jerry','30','3500');
insert into `emp` (`id`, `name`, `age`, `salary`) values('3','Luci','25','2800');
insert into `emp` (`id`, `name`, `age`, `salary`) values('4','Jay','36','3500');
insert into `emp` (`id`, `name`, `age`, `salary`) values('5','Tom2','21','2200');
insert into `emp` (`id`, `name`, `age`, `salary`) values('6','Jerry2','31','3300');
insert into `emp` (`id`, `name`, `age`, `salary`) values('7','Luci2','26','2700');
insert into `emp` (`id`, `name`, `age`, `salary`) values('8','Jay2','33','3500');
insert into `emp` (`id`, `name`, `age`, `salary`) values('9','Tom3','23','2400');
insert into `emp` (`id`, `name`, `age`, `salary`) values('10','Jerry3','32','3100');
insert into `emp` (`id`, `name`, `age`, `salary`) values('11','Luci3','26','2900');
insert into `emp` (`id`, `name`, `age`, `salary`) values('12','Jay3','37','4500');
# 创建复合索引
create index idx_emp_age_salary on emp(age,salary);

# 排序验证
explain select * from emp order by age; # Using filesort 文件排序
explain select * from emp order by age,salary; # Using filesort 文件排序
explain select id from emp order by age,salary; # Using index 索引排序
explain select id,age from emp order by age,salary; # Using index  索引排序
explain select id,age,salary,name from emp order by age,salary; # Using filesort 文件排序
# 尽量保证排序字段的排序方式一致.
explain select id,age,salary from emp order by age asc,salary desc; # Using index; Using filesort. 索引排序; 文件排序
# 尽量保证排序字段的顺序和复合索引字段的前后顺序一致
explain select id,age,salary from emp order by age,salary; # Using index  索引排序

# 通过适当提高 sort_buffer_size 和 max_length_for_sort_data 的系统变量, 来增大排序区的大小, 提高排序的效率.
# 通过调大这两个系统值, filesort(文件排序)的排序方式就会有限使用一次扫描算法, 可以更快一点.
show variables like 'max_length_for_sort_data';
show variables like 'sort_buffer_size';

############################# 子查询优化
# 详见 SummaryOfNotes.md 文档中的记录

############################# limit优化
# 详见 SummaryOfNotes.md 文档中的记录







