
##############################
########## 正则表达式 ##########
##############################

use sqldb;

-- ^: 在字符串开始处进行匹配(头匹配)
select 'abc' regexp '^a';
-- ^: 匹配商品名称以 wa 开头的数据
select * from product where pname regexp '^wa';
-- $: 匹配商品名称以 water 结尾的数据
select * from product where pname regexp 'water$';

-- .: 匹配任意单个字符
select 'abc' regexp '.b';
select 'abc' regexp '.c';
select 'abc' regexp 'a.';
select 'abc' regexp 'a..';
select 'abc' regexp 'c.';

-- []: 匹配括号内的任意单个字符
select 'abc' regexp '[xyz]';
select 'abc' regexp '[xyza]';

-- [^]: 匹配括号内的非任意单个字符, 注意^只有在[]内才是取反的意思,在[]外表示开始头匹配.
-- 这个结果是真(1)是因为 [^ab] 的含义是除了a和b之外的所有字母, 所以 select 'abc' 中还有个c是成立的.
select 'abc' regexp '[^ab]';

-- a*: 匹配0个或多个a,包含空字符串, 可以作为占位符使用, 有没有指定字符都可以匹配到数据
select 'stab' regexp '.ta*b';
select 'stb' regexp '.ta*b';
select 'stb' regexp 'a*';

-- a+: 匹配1个或多个a, 不包含空字符串
select 'stab' regexp '.ta+b';
select 'stb' regexp '.ta+b';

-- a?: 匹配0个或者1个a
select 'stab' regexp '.ta?b';
select 'stb' regexp '.ta?b';
select 'staab' regexp '.ta?b';

-- a1|a2: 匹配a1或者a2
select 'a' regexp 'a|b';
select 'b' regexp 'a|b';
-- ^在这里表示是的是头匹配
select 'b' regexp '^(a|b)';
select 'c' regexp '^(a|b)';

-- a{m} 匹配m个a
select 'auuuuc' regexp 'au{4}c';
select 'auuuuc' regexp 'au{3}c';
-- a{m,} 匹配m个到无限个a
select 'auuuuc' regexp 'au{3,}c';
select 'auuuuc' regexp 'au{5,}c';
-- a{m,n} 匹配m个到n个a
select 'auuuuc' regexp 'au{3,5}c';
select 'auuuuc' regexp 'au{4,5}c';
select 'auuuuc' regexp 'au{5,10}c';

-- (abc): ()表示序列匹配, 不用括号时是单个字符匹配, 加上括号表示一组一个整体匹配.
select 'xabcy' regexp 'x(abc)y';
select 'xabcy' regexp 'x(abc){1,2}y';
select 'xabcy' regexp 'x(abc){3}y';


















