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

# TODO

