
##############################
########## 控制流函数 ##########
##############################

use sqldb;

# if逻辑判断语句
select if(2>1, '成立','不成立');
# ifnull
select ifnull(5,0);
select ifnull(null,0);
# isnull
select isnull(5);
select isnull(null);
# nullif(比较两个字符串,如果字符串第一个值和第二个值相同返回null,否则返回第一个值)
select nullif(10,10);
select nullif(20,10);

# case when语句
# 用法一
select
    case 4
        when 1 then 'Douglas'
        when 2 then 'Abraham'
        when 3 then 'Nixon'
        when 4 then 'Bush'
        when 5 then 'Washington'
        else 'null'
    end as name;
# 用法二
select
    case
        when 2>1 then '成立' else '不成立'
        end as result;



