
##############################
########## 数学函数 ###########
##############################

use sqldb;

# 取绝对值
select abs(-10);

# 向上取整
select ceil(1.1);

# 向下取整
select floor(1.1);

# 取列表中最大值
select greatest(1, 2, 3);
# 取列表中最小值
select least(1, 2, 3);

# 取模
select mod(5,2);

# 圆周率
select pi();

# 取次方
select pow(2,3);

# 随机数
select rand() * 100;

# 小数进行四舍五入
select round(3.14);
select round(3.149, 2);

# 截掉固定位的小数
select truncate(3.149, 2);