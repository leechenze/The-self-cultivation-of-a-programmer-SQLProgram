
##############################
########## 字符串函数 ##########
##############################

use sqldb;

# 获取字符串个数
select char_length('hello');
select char_length('你好');
select character_length('hello');
select character_length('你好');
# 获取字节长度
select length('hello');
select length('你好');

# 字符串合并
select concat('hello ','world!');
select concat('h','e','l','l','o');
# 合并且添加分隔符
select concat_ws('-', 'hello','world');

# 返回字符串在列表中的位置
select field('bbb', 'aaa','bbb','ccc');
select field('ccc', 'aaa','bbb','ccc');

# 去除字符串左边空格
select ltrim('    aaa');
# 去除字符串右边空格
select rtrim('aaa    ');
# 去除左右空格
select trim('   aaa   ');

# 字符串截取
# 从第二个字符开始截取,截取三位
select mid('hello,world', 2, 3);

# 获取字符串在字符串中的位置
select position('ow' in 'hellow, world!');

# 字符串替换
select replace('hello, world!', 'world', 'douglas');

# 字符串反转
select reverse('hello');

# 返回字符串的后几位字符
select right('hello', 3);

# 字符串比较
select strcmp('hello', 'world');
select strcmp('hello', 'hello');
select strcmp('world', 'hello');

# 字符串截取
select substr('hello', 2, 3);
select substring('hello', 2, 3);

# 大写转换小写
select lcase('HELLO, WORLD!');
select lower('HELLO, WORLD!');
# 小写转换大写
select ucase('hello, world!');
select upper('hello, world!');












