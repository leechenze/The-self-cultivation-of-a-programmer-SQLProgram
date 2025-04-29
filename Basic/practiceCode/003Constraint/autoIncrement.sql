

##############################
######### 自增长主键 ##########
##############################

use sqldb;

create table emp4
(
    id   int primary key auto_increment,
    name varchar(20)
);

insert into emp4
values (NULL, 'douglas');

insert into emp4 (name)
values ('hilary');

drop table emp4;

######### 指定自增长的初始值(创建时指定) ##########
create table emp4
(
    id   int primary key auto_increment,
    name varchar(20)
) auto_increment = 100;

insert into emp4
values (null, 'douglas');

######### 指定自增长的初始值(修改原有表) ##########
alter table emp4
    auto_increment = 200;

insert into emp4
values (null, 'hilary');


