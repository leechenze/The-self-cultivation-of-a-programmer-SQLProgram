#############################
############ 事务 ############
#############################
############ 锁操作 ############
#############################

use sqldb;

############################# 错误日志 #############################
# 查看错误日志位置:
show variables like '%log_error%';

############################# binlog日志 #############################
# 查看MySql是否开启Binlog日志
show variables like 'log_bin';
# 查看MySql的Binlog日志的格式
show variables like 'binlog_format';
# 查看所有binlog日志
show binlog events;
# 查看最新binlog日志
show master status;
# 查询指定的binlog日志
show binlog events in 'binlog.000127';

# update操作后查看日志;
# update tb_user set name = 'Nixon' where id = 1;

# 从指定位置开始显示binlog日志
show binlog events in 'binlog.000127' from 400080922 limit 10;
# 清空binlog日志
reset master;
# 再次查看所有日志
show binlog events;

############################# 查询日志 #############################
# 查看MySql是否开启了查询日志
show variables like '%general_log%';
# 开启查询日志
set global general_log = 1;
# select操作后查看查询日志;
# select * from tb_book;
show variables like '%log_error%';

############################# 慢查询日志 #############################
# 查看MySql是否开启了慢查询日志
show variables like '%slow_query_log%';
# 开启慢日志查询
set global slow_query_log = 1;
# 查看慢查询的超时时间
show variables like '%long_query_time%';
# 指定慢查询超时时间
set session long_query_time = 5;
# 测试慢查询日志
select sleep(10);
select sleep(6);



