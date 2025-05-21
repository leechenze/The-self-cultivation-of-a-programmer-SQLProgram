#############################
############ 事务 ############
#############################
############ 锁操作 ############
#############################

use sqldb;
############################# MyISAM的表读写锁 #############################
# 创建tb_book表和数据
create table if not exists tb_book
(
    id           int auto_increment,
    name         varchar(50) default null,
    publish_time date        default null,
    status       char(1)     default null,
    primary key (id)
) engine = myisam default charset=utf8;

insert into tb_book values (null, 'Java编程思想', '2002-08-01', '1'),
                           (null, 'Solr编程思想', '2002-08-08', '0');

# 创建tb_user表和数据
create table if not exists tb_user
(
    id   int auto_increment,
    name varchar(20) default null,
    primary key (id)
) engine = myisam default charset = utf8;

insert into tb_user values (null, 'Hamilton'),(null, 'Hillary');

# 给 tb_book 加读锁
lock tables tb_book read;
# 给 tb_book 加写锁
lock tables tb_book  write;
# 释放锁
unlock tables;

# 读取其他表的操作
select * from tb_user;
# 更新其他表的操作
update tb_user set name = 'Nixon' where id = 1;
update tb_book set name = 'Golang编程' where id = 1;


############################# InnoDB的行读写锁 #############################
# 创建表和数据.
create table if not exists test_innodb_lock
(
    id   int,
    name varchar(20),
    sex  varchar(1)
) engine = innodb;

insert into test_innodb_lock values (1, '100', '1' ),
                                    (3, '3', '1' ),
                                    (4, '400', '0' ),
                                    (5, '500', '1' ),
                                    (6, '600', '0' ),
                                    (7, '700', '0' ),
                                    (8, '800', '1' ),
                                    (9, '900', '1' ),
                                    (1, '200', '0' );

create index idx_test_innodb_lock_id on test_innodb_lock(id);
create index idx_test_innodb_lock_name on test_innodb_lock(name);

# 给id为1的加行锁共享锁
# set autocommit = 0;

# 这里不做行锁操作了, 具体行锁机制详见Markdown文档.


