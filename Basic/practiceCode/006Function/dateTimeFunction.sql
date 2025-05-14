
##############################
########## 日期函数 ##########
##############################

use sqldb;

# 获取当前时间戳
select unix_timestamp();
# 将一个日期字符串转为毫秒值
select unix_timestamp('2021-12-21 08:00:00');
# 将时间戳毫秒值转为指定格式的日期
select from_unixtime('1640044800', '%Y-%m-%d %H:%i:%s');
# 获取当前年月日
select curdate();
select current_date();
# 获取当前十分秒
select curtime();
select current_time();
# 获取日期和时间(年月日和十分秒)
select current_timestamp();
# 从日期字符串中获取年月日
select date('2025-05-14 08:00:00');
# 获取两个字符串日期之间的差值
select datediff('2025-5-14', '2025-3-16');
# 获取两个字符串时间之间的差值
select timediff('12:00:00', current_time());
# 时期格式化
select date_format('2025-5-14 1:1:1', '%Y-%m-%d %H:%i:%s');
# 将字符串转换日期
select str_to_date('2025-5-14 1:1:1', '%Y-%m-%d %H:%i:%s');
select str_to_date('August 10 2024', '%M %d %Y');
# 将日期进行减法运算(将当前日期向前减两天)
select date_sub('2021-10-01', interval 2 day);
# (将当前日期向前减两月)
select date_sub('2021-10-01', interval 2 month);
select subdate('2021-10-01', interval 2 month);
# 将日期进行加法运算(将当前日期向前加两天)
select date_add('2021-10-01', interval 2 day);
# (将当前日期向前加两月)
select date_add('2021-10-01', interval 2 month);
select adddate('2021-10-01', interval 2 month);
# 从日期中获取(年月日)
select extract(year from '2025-5-14 9:8:1');
select extract(month from '2025-5-14 9:8:1');
select extract(day from '2025-5-14 9:8:1');
select extract(hour from '2025-5-14 9:8:1');
select extract(minute from '2025-5-14 9:8:1');
select extract(second from '2025-5-14 9:8:34');
# 获取给定日期的所在月的最后一天
select last_day('2021-08-24');
# 获取指定年份和天数的日期
select makedate('2021', 1);
select makedate('2021', 30);
select makedate('2021', 53);
# 根据给定日期获取年月季日十分秒
select year('2025-5-14 9:8:34');
select month('2025-5-14 9:8:34');
select quarter('2025-5-14 9:8:34');
select day('2025-5-14 9:8:34');
select hour('2025-5-14 9:8:34');
select minute('2025-5-14 9:8:34');
select second('2025-5-14 9:8:34');
# 获取月份名字
select monthname('2025-5-14 9:8:34');
# 获取本周星期几
select dayname('2025-5-14 9:8:34');
# 获取当前天是本月的第几天
select dayofmonth('2025-5-14 9:8:34');
# 获取当前天是本周的第几天(注意: 1是星期日,2是星期一,依此类推)
select dayofweek('2025-5-14 9:8:34');
# 获取当前天是今年的第几天
select dayofyear('2025-5-14 9:8:34');

# 获取当前日期是本年的第几周(范围是0-52区间)
select week('2025-5-14 9:8:34');
# 获取当前天是本周的第几天(注意: 0是星期一,1是星期二,依此类推)
select weekday('2025-5-14 9:8:34');
# 获取本年的第几周
select weekofyear('2025-5-14 9:8:34');
# 获取当前年和当前年的第几周
select yearweek('2025-5-14 9:8:34');
# 获取当前日期时间
select now();














