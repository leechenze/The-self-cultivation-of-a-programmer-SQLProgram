博学之, 审问之, 慎思之, 明辨之, 笃行之;
零、壹、贰、叁、肆、伍、陆、柒、捌、玖、拾;
视频地址(https://www.bilibili.com/video/BV1iF411z7Pu/)


零.SQL语言初识

    SQL全称： Structured Query Language，是结构化查询语言，用于访问和处理数据库的标准的计算机语言。
    SQL语言1974年由Boyce和Chamberlin提出，并首先在IBM公司研制的关系数据库系统SystemR上实现。

    美国国家标准局(ANSI)开始着手制定SQL标准，并在1986年10月公布了最早的SQL标准，扩展的标准版本是1989年发表的SQL-89，
    之后还有1992年制定的版本SQL-92和1999年ISO发布的版本SQL-99。

    SQL标准几经修改和完善，其功能更加强大，但目前很多数据库系统只支持SQL-99的部分特征，而大部分数据库系统都能支持1992年制定的SQL-92。

    SQL特点:
        具有综合统一性，不同数据库的支持的SQL稍有不同
        非过程化语言
        语言简捷，用户容易接受
        以一种语法结构提供两种使用方式

    Sql语言的组成
        数据定义语言-DDL
        数据操纵语言-DML
        数据控制语言-DCL
        数据查询语言-DQL

    语法注释
        --      单行注释
        #       单行注释
        /** */  多行注释
    
    数据库管理系统分类
        关系型数据库（RDBMS）
            1、MySQL数据库 （最流行中型数据库）
            2、Oracle数据库 （老大，最挣钱的数据库）
            3、SQL server数据库 （Windows上最好的数据库）
            4、PostgreSQL（功能最强大的开源数据库）
            5、SQLite（最流行的嵌入式数据库）

        非关系型数据库(NoSQL)
            1、Redis（最好的缓存数据库）
            2、MongoDB（最好的文档型数据库）
            3、Elasticsearch（最好的搜索服务）
            4、Cassandra（最好的列式数据库）
            5、HBase（优秀的分布式、列式数据库）


    SQL和数据库管理系统的关系
        SQL是一种用于操作数据库的语言，SQL适用于所有关系型数据库。
        MySQL、Oracle、SQLServer是一个数据库软件，这些数据库软件支持标准SQL，也就是通过SQL可以使用这些软件.
        不过每一个数据库系统会在标准SQL的基础上扩展自己的SQL语法。
        大部分的NoSQL数据库有自己的操作语言，对Sql并不支持

    MySql简介
        MySQL数据库管理系统由瑞典的DataKonsultAB公司研发，该公司被Sun公司收购，现在Sun公司又被Oracle公司收购，因此MySQL目前属于 Oracle 旗下产品。
        MySQL所使用的 SQL 语言是用于访问数据库的最常用标准化语言。
        MySQL 软件采用了双授权政策，分为社区版和商业版，由于其体积小、速度快、总体拥有成本低，一般中小型网站的开发都选择 MySQL 作为网站数据库。

    MySql特点
        ①MySQL数据库是用C和C++语言编写的，以保证源码的可移植性
        ②支持多个操作系统例如：Windows、Linux、Mac OS等等
        ③支持多线程，可以充分的利用CPU资源
        ④为多种编程语言提供API，包括C语言，Java，PHP。Python语言等
        ⑤MySQL优化了SQL算法，有效的提高了查询速度
        ⑥MySQL开放源代码且无版权制约，自主性强、使用成本低。
        ⑧MySQL历史悠久、社区及用户非常活跃，遇到问题，可以很快获取到帮助。

    MySql版本
        针对不同的用户，MySQL分为两种不同的版本：
            MySQL Community Server
                社区版本，免费，但是Mysql不提供官方技术支持。
            MySQL Enterprise Edition
                商业版，该版本是收费版本，可以试用30天，官方提供技术支持
            MySQL Cluster 
                集群版，开源免费，可将几个MySQL Server封装成一个Server。
            MySQL Cluster CGE 
                高级集群版，需付费。
            MySQL Workbench（GUI TOOL）
                一款专为MySQL设计的ER/数据库建模工具。
                MySQL Workbench又分为两个版本，分别是社区版（MySQL Workbench OSS）、商用版（MySQL Workbench SE）。
        MySQL的命名机制使用由3个数字和一个后缀组成的版本号。例如，像mysql-8.0.26的版本号这样解释：、
            第1个数字(8)是主版本号，描述了文件格式。所有版本5的发行都有相同的文件格式。
            第2个数字(0)是发行级别。主版本号和发行级别组合到一起便构成了发行序列号。
            第3个数字(26)是在此发行系列的版本号，随每个新分发版递增。




壹.数据库基本操作DDL(001DDLManipulate)

    DDL(Data Definition Language)数据库定义语言
        1.对数据库的常用操作
        2.对表结构的常用操作
        3.修改表结构
    数据库操作(databaseManipulate.sql)
        查看所有的数据库
            show databases;
        创建数据库
            create database [if not exists] mydb1 [charset=utf8]
        切换数据库
            use mydb1
        删除数据库
            drop databases [if exists] mydb1;
        修改数据库编码
            alter database mydb1 character set utf8;
    表操作(tableManipuldate.sql)
        查看所有的表
            show tables;
        查看某个表的创建语句
            show create table mytb1
        查看表结构
            desc mytb1
        删除表
            drop table mytb1
        修改表
            添加列
                alter table mytb1 add myfield1 varchar(20);
            修改列
                alter table mytb1 change oldfield1 newfield1 varchar(20);
            删除列
                alter table mytb1 drop myfield1;
            修改表名
                rename table oldtb1 to newtb1;
        SQL的三大类型
            数值类型
                整数型
                    tinyint
                    smallint
                    mediumint
                    int(integer)
                    bigint
                浮点数型
                    float
                    double
                    decimal(m,d)
                        decimal(5,2) => 123.45
            字符串类型
                char            定长字符串
                varchar         变长字符串
                tinyblob
                tinytext
                blob
                text
                mediumblob
                mediumtext
                longblob
                longtext
            日期时间类型
                date
                time
                year
                datetime
                timestamp




贰.数据库基本操作DML(002DMLManipulation)
    
    DML(Data Manipulation Language)数据操作语言
        insert
        delete
        update

    增删改操作(cudManipulate.sql)
        insert
        delete/truncate
        update



叁.约束(003Constraint)

    约束英文: constraint
    约束就是对表中数据的限制条件
    约束分类:
        主键约束(primary key [PK])
            简称PK,约束该列的值唯一且不能为空
        自增长约束(auto_increment)
            一般和主键约束配合在一起用,约束该列的值自增长
        非空约束(not null)
            约束该列不能为空
        唯一性约束(unique)
            约束该列的值不能重复,必须唯一
        默认约束(default)
            当没有规定约束时,列默认选择的约束项
        零填充约束(zerofill)
            约束整型字段为空时默认填充零为值
        外键约束(foregin key [FK])
            在多表操作时会用到的约束

    1.主键约束(primaryKey.sql)
        添加单列主键
        添加多列联合主键(复合主键)
        删除主键
        修改表结构/添加主键
        修改表结构/删除主键

    2.自增长约束(autoIncrement.sql)
    3.非空约束(notNull.sql)
    4.唯一约束(unique.sql)
    5.默认约束(default.sql)
        默认约束就是指定一个默认值
    6.零填充约束(zerofill.sql)
        零填充约束默认类型为 int(10), 而int的默认长度是 int(11)
        零填充约束主要是针对数值类型的约束, 即当字段的值的长度小于定义的长度时,会在该值的前面补上相应的0.
        当使用zerofill时, 默认会自动加 unsigned (无符号)属性



肆.数据库基本操作DQL(004DQLManipulate)

    DQL(Data Query Language)数据查询语言
    通俗易懂的说法具体指的就是select语句的查询
    包括很多where的条件以及group by, having, order by, limit这些查询等....
    
    0.首先数据准备(simple.sql)
        product表创建和数据创建, 详见simple.sql
    1.简单查询(simple.sql)
        查询所有商品
        查询指定列
        表别名
        列别名
        去掉重复值
        运算查询
            即查询结果是表达式,将所有商品的价格+10元进行显示

    2.运算符(operators.sql)
        算数运算符
            +, -, *, /或DIV, %或MOD
        比较运算符
            =
            < 和 <=
            > 和 >=
            <=>
                安全的等于, 两个操作码均为NULL时, 其所得值为1, 而当一个操作码为NULL时, 其所得值为0
            <> 或 !=
            is null 或 isnull
                在sql中, null和任何值都不相等,包括null本身, 所以判断null值只能通过这两个关键字
            is not null
            least
                当有两个或多个值时,返回最小值
            greatest
                当有两个或多个值时,返回最大值
            between and
                语法为: between *** and ***
            in
            not in
            like
                通配符匹配
            regexp
                正则表达式匹配
        逻辑运算符
            not 或 !
                逻辑非
            and 或 &&
                逻辑与
            or 或 ||
                逻辑或
            xor
                逻辑异或
                两个值, 不同时为真, 相同时为假
        位运算符
            这里做个了解, 实际应用场景很少, 他是涉及对二进制位的一个操作, 只需要知道sql支持二进制运算即可.
            |
                按位或
            &
                按位与
            ^
                按位异或
            <<
                按位左移
            >>
                按位右移
            ~
                按位取反, 反转所有比特
    
    3.排序查询(operators.sql)
        order by
            如果不指定排序方式默认为asc, 即升序排序
            可以支持单个字段,多个字段, 表达式, 函数, 别名
            order by语句在查询语句的最后面, limit除外.
        asc
            升序排序
        desc
            降序排序
    
    4.聚合查询(aggregation.sql)
        之前的查询都是横向查询,他们都是根据条件一行一行的进行判断和过滤, 而使用聚合函数查询是纵向查询,
        他是对一列的值进行计算, 然后返回一个单一的值, 并且聚合函数会忽略null值.
        
        最常用的聚合函数
            count()
                统计列不为null的行数
            sum()
                计算指定列的数值和, 如果指定列的类型不是数值类型, 那么计算结果为0
            max()
                计算指定列的最大值, 如果指定列是字符串类型, 那么使用字符串的规则(阿斯克码)排序运算
            min()
                计算指定列的最小值, 如果指定列是字符串类型, 那么使用字符串的规则(阿斯克码)排序运算
            avg()
                计算指定列的平均值, 如果指定列类型不是数值类型, 那么计算结果为0.
            
        聚合查询对null值的处理
            所有的聚合函数对null值都不做统计, 比如avg求均值的函数, 会将总数除以条数, 但是如果该值为null时, 就不会被avg统计为一条

    5.分组查询(groupby.sql)
        group by
            顾名思义 group by 语句就是对查询信息结果进行分类的
        having
            having用于筛选分组数据的, 和where的作用类似, 但是分组条件不能用where筛选
            where子句是对from子句总指定的操作所过滤的结果行
            group by子句是对where的结果进行分组
            having子句用来对分组之后的结果进行过滤筛选.
        limit
            分页查询
        insert into select
            语法: 
                insert into table1 (field1, field2) select (val1, val2) from table2
                或在列都相同的情况下可以简写为
                insert into table1 select * from table2
            作用就是将 table2 的 select 的结果插入到 table1 的表中.
            
    6.正则表达式(regexp.sql)
        -- ^: 在字符串开始处进行匹配(头匹配)
        -- ^: 匹配商品名称以 wa 开头的数据
        -- $: 匹配商品名称以 water 结尾的数据
        -- .: 匹配任意单个字符
        -- []: 匹配括号内的任意单个字符
        -- [^]: 匹配括号内的非任意单个字符, 注意^只有在[]内才是取反的意思,在[]外表示开始头匹配.
        -- 这个结果是真(1)是因为 [^ab] 的含义是除了a和b之外的所有字母, 所以 select 'abc' 中还有个c是成立的.
        -- a*: 匹配0个或多个a,包含空字符串, 可以作为占位符使用, 有没有指定字符都可以匹配到数据
        -- a+: 匹配1个或多个a, 不包含空字符串
        -- a?: 匹配0个或者1个a
        -- a1|a2: 匹配a1或者a2
        -- ^在这里表示是的是头匹配
        -- a{m} 匹配m个a
        -- a{m,} 匹配m个到无限个a
        -- a{m,n} 匹配m个到n个a
        -- (abc): ()表示序列匹配, 不用括号时是单个字符匹配, 加上括号表示一组一个整体匹配.






伍.多表操作(005MultiTableManipulate)

    0.多表概念
        Sql多表之间的关系可以概括为:
            一对一, 一对多/多对一, 多对多
    
    1.外键约束(foreignKeyconstraints.sql)
        
        主表的数据被从表依赖时, 不能删除, 否则可以删除, 从表的数据删除不受影响
        
        在多对多的关系中, A表的一行对于B表的多行, B表的一行也会对应A表的多行, 这时就要新增一个中间表, 来建立A表和B表的多对多关系
        
    2.多表联合查询(mutilTableUnionQuery.sql)
        交叉连接查询
            会产生笛卡尔积, 做个了解, 这种查询会产生很多冗余的数据
            语法: select * from A,B
            交叉连接查询返回被连接的两个表的所有数据行的笛卡尔积
            笛卡尔是一个法国十六世纪的数学家和哲学家, 他提出过哲学命题<我思故我在>
            笛卡尔积:
                如果有两个集合：
                    A = {1, 2}
                    B = {a, b, c}
                则它们的笛卡尔积是：
                    A × B = {
                        (1, a), (1, b), (1, c),
                        (2, a), (2, b), (2, c)
                    }
            所以笛卡尔积可以通俗易懂的解释为:
            A表有m行数据,B表有n行数据,A和B表的交叉连接查询则返回 m*n 条数据
        内连接查询
            关键字 inner join, inner可以省略不写
            语法:
                隐私内连接(SQL92标准): select * from A, B where ...(query conditions)
                显示内连接(SQL99标准): select * from A inner join B on ...(query conditions)
        外连接查询
            关键字 outer join, outer可以省略不写
            左外连接:
                left outer join
                语法: select * from A left outer join B on ...(query conditions)
            右外连接:
                right outer join
                语法: select * from A right outer join B on ...(query conditions)
            满外连接:
                oracle中对满外连接是支持的, 但是在mysql中, 对满外连接的支持很不好. 但也可以使用union来达到满外连接的目的
                full outer join
                语法: select * from A full outer join B on ...(query conditions)
        子查询
            所谓子查询就是 select 嵌套查询
            子查询可以返回的数据类型一般分为四种:
                单行单列
                单行多列
                多行单列
                多行多列
            子查询关键字
                all
                    满足所有条件
                    语法:
                        select * from employee2 where age > all(50,60);
                        等价于:
                        select * from employee2 where age > 50 and age > 60;
                any
                    满足任何一个条件
                    语法:
                        select * from employee2 where age > any(50,60);
                        等价于:
                        select * from employee2 where age > 50 or age > 60;
                some
                    满足某一个条件, some和any是一回事, 可以理解为any的别名, 因为some用的比较少一点, 常用的就是any.
                in
                    包含其中任何一个条件
                    语法:
                        select * from employee2 where age in (50,60);
                        等价于:
                        select * from employee2 where age = 50 or age = 60;
                exists
                    判断查询是否有结果, 有为true, 无结果为false
                    exists关键字比in关键字查询效率要高, 因此在大数据量查询时, 推荐使用exists.
                    语法:
                        select * from employee2 as e2 where exists(select * from employee2 where e2.age > 60);
                        结果等价于:
                        select * from employee2 as e2 where age in (select age from employee2 where age > 60);
        表自关联
            将一张表当成多张表来用, 即这个表自己和自己关联
            语法:
                select * from sanguo s1 join sanguo s2 where s1.manager_id = s2.id;





陆.函数(006Function)
    
    函数分类:
        聚合函数
        数学函数
        字符串函数
        日期函数
        控制流函数
        窗口函数(只有mysql8.0以上支持窗口函数)


    聚合函数(aggregationFunction.sql)
        count()
            统计列不为null的行数
        sum()
            计算指定列的数值和, 如果指定列的类型不是数值类型, 那么计算结果为0
        max()
            计算指定列的最大值, 如果指定列是字符串类型, 那么使用字符串的规则(阿斯克码)排序运算
        min()
            计算指定列的最小值, 如果指定列是字符串类型, 那么使用字符串的规则(阿斯克码)排序运算
        avg()
            计算指定列的平均值, 如果指定列类型不是数值类型, 那么计算结果为0.
        group_concat()
            对行进行字符串拼接, 输出为字符串.

    数学函数(mathFunction.sql)
        abs(x)
            返回x的绝对值
        ceil(x)
            返回大于或等于x的最小整数
        floor(x)
            返回小于或等于x的最大整数
        greatest(expr1, expr2, expr3, ...)
            返回列表中的最大值
        least(expr1, expr2, expr3)
            返回列表中的最小值
        max(expression)
            返回expression的最大值
        min(expression)
            返回expression的最小值
        mod(x,y)
            返回x除以y之后的余数
        pi()
            返回圆周率
        pow(x,y)
            返回x的y次方
        rand()
            返回0到1的随机数
        round(x)
            返回离x最近的整数
        round(x,y)
            返回离x最近的整数,并返回指定位数的小树(y)
        truncate(x,y)
            返回数值x保留到小数点后y位的值, 与round的区别就是不会进行四舍五入, 只保留指定位的小数后其余数直接截掉
        
    字符串函数(strFunction.sql)
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

    日期函数(dateFunction.sql)
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

    控制流函数(controlFlowFunction.sql)
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

    窗口函数(windowFunction.sql)
        窗口函数又被称为开窗函数, 是mysql8.0之后新增的
        语法:
            window_function (expr) over (
                partition by ...
                order by ...
                frame_clause
            )
            解读:
                window function是窗口函数的名称, expr是参数, 有些函数不需要参数, over子句包含三个选项:
                1.分区(partition by)
                    partition by选项用于将数据行拆分成多个分区(组),作用类似于group by.
                2.排序(order by)
                    order by选项用于指定分区内的排序.
                3.窗口大小(frame_clause)
                    frame_clause选项用于在当前分区内指定一个计算窗口,也就是一个与当前行相关的数据子集
                    窗口大小参数默认的值是:
                        rows between unbounded preceding and current row
                    关键字:
                        rows 声明窗口大小的必要关键字
                        unbounded 无边界行, 通常用来表示第一行和最后一行
                        current row 当前行
                        x preceding 表示前x行,可搭配unbounded关键字使用, unbounded preceding 表示第一行
                        x following 表示后x行,可搭配unbounded关键字使用, unbounded following 表示最后行
        窗口函数分类:
            序号函数
                row_number()
                rank()
                dense_rank()
            窗口聚合函数
                sum,avg,min,max
            分布函数
                cume_dist()
                    解释: 分组内小于等于当前rank值的行数/分组内总行数
                    应用场景: 查询小于等于当前薪资的比例
                percent_rank()
                    解释: 每行按照公示(rank-1)/(rows-1)进行计算. 其中, rank为rank()函数产生的序号, rows为当前窗口的记录总行数
                    应用场景: 很少用
            前后函数
                lag/lead
                    解释: 返回位于当前行的前n行(lag(expr,n,默认值))或后n行(lead(expr,n,默认值))的expr的值
                    应用场景: 查询前一名同学的成绩和当前同学成绩的差值
            头尾函数
                first_value(expr)/last_value(expr)
                    解释: 返回第一个(first_value(expr))和最后一个(last_value(expr))的值
                    应用场景: 截止到当前行, 按照日期排序查询第一个入职和最后一个入职员工的薪资
            其他函数
                nth_value(expr,n)
                    解释: 返回窗口中第n个expr的值, expr可以是表达式, 也可以是别名
                    应用场景: 截止到当前行薪资, 显示每个员工的薪资中排名第二或者第三的薪资
                ntile(n)
                    解释: 将分区中有序数据分为n个等级, 记录等级数
                    应用场景: 将每个部门员工按照入职日期分成3组



柒.视图(007View)

    视图介绍:
        视图是一个虚拟表, 非真实表, 其本质是根据sql语句获取动态的数据集, 并为其命名, 用户使用时只需使用视图名称即可获取结果集, 并可以将其当作表来使用
        数据库中只存放了视图的定义, 并没有存放视图中的数据. 这些数据存放在原来的表中.
        使用视图查询数据时, 数据库系统会从原来的表中取出对应的数据, 因此, 视图中的数据是依赖于原来的表中的数据的. 一旦表中的数据发生改变, 显示在视图中的数据也会发生改变.
    视图作用:
        简化代码, 可以把重复使用的查询封装成视图重复使用, 同时可以使复杂的查询易于理解和使用.
        安全原因, 如果一张表中的很多涉密数据, 很多信息不希望让所有人看到, 此时可以使用视图, 可以只显示开放的数据, 如:姓名, 性别等.
        
    视图操作(viewManipulate.sql)
        创建视图
            create or replace view view_emp_view as ( ...视图sql )
        修改视图
            alter view view_emp_view as ( ...视图sql )
        更新视图
            update view_emp_view set ename = '周瑜' where ename = '谢逊';
            注意: 当视图中存在以下结构时,那么该视图是不可被更新的.
                聚合函数
                distinct
                group by
                having
                union 或 union all
                包含子查询的
                有连表操作的 join
                该视图自己指定生成的列(这种情况都没有要更新的基础表,所以不能更新了)
                    比如: select '李安' as name;
            所以视图中虽然可以更新数据, 但是一般这么操作是被禁止的, 视图的作用就是作为一张虚拟表查询用的.
            更新视图是有很大的安全隐患和风险的.
        删除视图
            drop view if exists [viewName]
        重命名视图
            rename table [oldName] to [newName]





捌.存储过程(008StoredProcedures)

    存储过程介绍
        mysql从5.0版本开始支持存储过程
        简单说存储过程就是一组sql集, 功能强大, 可以实现一些比较复杂的逻辑功能, 类似于编程语言中的方法的概念.
        存储过程就是数据库sql语言层面的代码封装与复用.
    特性
        有输入输出参数, 可以声明变量, 有if/else,case,while等控制语句, 通过编写存储过程, 可以实现复杂的逻辑功能.
        函数的普遍特性: 模块化, 封装, 代码复用.
        速度快, 只有首次执行需经过编译和优化步骤, 后续被调用可以直接执行.

    入门案例(example.sql)
        定义存储过程的结束符 一般推荐使用 $$ 或 \\
    
    变量定义(variable.sql)
        局部变量
            声明方式: 通过 declare 关键字声明
            解释: 仅在begin和end之间声明的作用域有效
            语法一:
                delimiter $$
                create procedure proc02()
                begin
                    # 声明变量
                    declare varname01 varchar(20) default 'aaa';
                    # 变量赋值
                    set varname01 = 'lian';
                    # 输出变量
                    select varname01;
                end $$
            语法二:
                delimiter $$
                create procedure proc03()
                begin
                    # 声明变量
                    declare varname01 varchar(20) default 'aaa';
                    # 变量赋值
                    select ename into varname01 from sp_emp where empno = 1001;
                    # 输出变量
                    select varname01;
                end $$

        用户变量
            声明方式: @varname
            特点: 不需要声明,使用即声明
            解释: 当前会话有效
            语法: 

                delimiter $$
                create procedure proc04()
                begin
                    set @varname01 = 'douglas';
                    select @varname01;
                end $$
                delimiter ;
                call proc04();
                select @varname01;

        系统变量
            系统变量即mysql提前定义好的, 不能自己编写定义
            系统变量又分为全局变量和会话变量
            会话变量会在每次建立一个新的连接的时候,由mysql初始化,mysql会将当前所有全局变量的值拷贝一份作为会话变量
            全局变量的修改会影响到整个服务器, 但是会话变量的修改只会影响到当前会话(即当前客户端,比如:navicat和mysql的连接)
            有些系统变量可以通过set语句进行修改, 有些系统变量就是只读的不可修改.
            全局变量声明方式: @@global.varname
            会话变量声明方式: @@session.varname
            全局变量和会话变量的使用方式都是一样的.
        
    参数传递(paramPassing.sql)    
        in
            解释: 用于参数声明
        out
            解释: 用于返回值声明
        inout
            解释: 用于从外部传入的参数经过修改后还可以返回的变量, 既可以用于参数声明传入变量值, 也可以修改变量值.
    
    流程控制语句(controlStatement.sql)
        
        分支语句
            if
            case
        循环语句
            循环分类
                while
                repeat
                loop
            循环控制
                leave类似于break, 跳出, 结束当前所在的循环
                iterate类似于continue, 继续, 结束本次循环, 继续下一次

    游标(cursor.sql)
        游标(Cursor)也被称作光标
        是用来存储查询结果集的数据类型, 在存储过程和函数中可以使用游标对结果集进行循环处理.
        光标的使用包括 光标声明, open, fetch 和 close.
        特别声明:
            在语法中, 变量声明, 游标声明, handler声明, 循环体是必须按照先后顺序书写的, 否则创建存储过程出错.
        
        游标使用语法:
            # 定义局部变量
            declare varEmpno int;
            declare varEname varchar(20);
            declare varSal double;
            
            # 声明游标
            declare cusCursor cursor for
            select a.empno, a.ename, a.sal from sp_emp as a
                join sp_dept b on a.deptno = b.deptno
                                    and b.dname = dname;
            
            # 打开游标
            open cusCursor;
            
            # 通过游标获取值
            labelA: loop
                fetch cusCursor into varEmpno,varEname,varSal;
                select varEmpno, varEname, varSal;
            end loop labelA;
            
            # 关闭游标
            close cusCursor;
        
        异常处理-句柄处理Handler
            
    存储函数(storeFunc.sql)
        存储函数必须有返回值.
        MySql需要设置对函数权限信任.
        set global log_bin_trust_function_creators = true;






玖.触发器(009Trigger)
    
    概述:
        触发器是一种特殊的存储过程, 区别是触发器无需调用, 当对数据库表中的数据执行DML操作时自动触发这个SQL片段的执行, 无需手动调用
        在MySql中, 只有执行insert,delete,update操作时才能自动触发这个Sql片段的执行
        触发器的特性可以协助应用在数据库端确保数据的完整性, 日志记录, 数据校验等操作.
        使用别名OLD和NEW来引用触发器中发生变化的记录内容, 这与其他的数据库是相似的, 现在触发器还只支持行级触发, 不支持语句级触发.
        NEW/OLD:
            insert型触发器:
                new表示将要或已新增的数据
            update型触发器:
                old表示修改之前的数据,new表示将要或已经修改后的数据.
            delete型触发器:
                old表示将要或者已经删除的数据
        
    特性:        
        什么条件会触发: I, D, U        
        在什么条件触发: 在增删改前或后        
        触发频率: 针对每一行执行         
        触发器定义在表上, 附着在表上
    语法:
        create trigger trigger01 after insert
            on user for each row
            insert into user_logs values(null, now(), '添加用户操作');
        
        show triggers

        drop trigger if exists trigger03;
        
    操作(triggerManipulate.sql)
    
    注意事项:
        1.MySql触发器不能对本表进行IDU操作, 以免递归循环触发
        2.尽量少使用触发器, 假设触发器触发每次执行1s, insert table 500条数据, 那么就需要触发500此触发器, 光是触发器执行的时间就能花费500s
            而insert 500条数据一共是1s, 那么这个insert的效率就非常低了.
        3.触发器是针对每一行的, 对增删改非常频繁的表上切记不要使用触发器, 因为它非常消耗资源.
    
    总结: 触发器了解一下即可, 实际场景用处不大, 触发器的功能完全可以通过后端代码进行实现.





拾.索引(010Index)

    简介
            索引就是通过某种算法, 构建出一个数据模型, 用于快速找出在某个列中有一特定值的行, 不使用索引, MySql必须从第一条记录开始读完整的表, 
        直到找出相关的行, 表越大, 查询数据就越耗时, 如果表中查询的列有一个索引,MySql能够快速到达一个位置取搜索数据文件, 而不必查看所有数据, 那么将会节省很大一部分时间.
            索引就是一本书的目录, 比如要查找student这个单词, 可以先找到s开头的页然后向后查找, 这个就类似与索引.
    
    索引应用条件:
        索引在 where, join, order by, group by, select的覆盖列(覆盖索引)), 子查询, limit查询则列条件下才会触发索引应用.
        覆盖索引解释:
            SELECT email FROM users WHERE id = 100;
            如果你有 (id, email) 的联合索引, 这个查询可以只使用索引, 不访问表(称为覆盖索引, Using index in EXPLAIN).
    
    索引使用原则:
        1.更新频繁的列不应该设置索引, 因为索引是标记数据的, 数据变更, 索引也要更新, 索引本身的维护也很消耗资源.
        2.数据量小的表不要使用索引, 因为有可能索引维护的时间都大于查询的时间, 好比: 一本就三页的书, 还需要目录吗?
        3.重复数据多的列不能设置索引, 比如性别列, 就不要设置索引了, 一般来说, 重复的数据超过15%时就不应建索引了.
        4.首先考虑对 where 和 order by 和 group by 涉及的列上建立索引
        
    索引分类
        按照实现分类
            Hash索引
            B+Tree索引
            Spatial索引
        按照功能分类
            单列索引
                普通索引(NORMAL)
                唯一索引(UNIQUE)
                主键索引(PRIMARY)
            组合索引
            全文索引
            空间索引
    
    单列索引(singleColumnIndex.sql)
        顾名思义就是对于某一列建立索引, 一个索引只包含单个列, 但一个表中可以有多个单列索引
        普通索引:
            MySql中基本索引类型, 没有什么限制, 允许在定义索引的列中插入重复值和空值, 纯粹为了查询数据更快一点.
        唯一索引:
            唯一索引列的值必须唯一, 但允许有空值. 如果是组合索引(联合索引), 则列值的组合必须唯一.
        主键索引:
            每张表一般都会有自己的主键, 当我们在创建表时, MySql会自动在主键列上建立一个索引, 这就是主键索引.
            主键索引具有唯一性并且不允许为NULL, 所以他是一种特殊的唯一索引.
    
    组合索引(compositeIndex.sql)
        组合索引也称为联合索引或复合索引, 指的是我们在建立索引的时候使用多个字段
        例如同时使用身份证和手机号建立索引, 同样的可以建立为普通索引或者唯一索引.
        复合索引使用复合最左原则:
            复合索引在 MySQL 中遵循 [最左前缀原则( leftmost prefix rule)]
            即索引只有在查询中包含从最左开始连续的列时才能被有效使用.
            所以联合索引在创建时一定要根据需求注意先后顺序:
                create index phone_num_name_index on students(phone_num, name)
            复合索引应用情况:
                1.select * from students where name = '张三';
                    不会应用phone_num_name_index索引
                    因为复合索引遵循复合最左原则, 第一个索引是phone_num, 第二个才是name, 所以不会应用该索引.
                2.select * from students where phone_num = 18611120990;
                    会应用phone_num_name_index索引
                    根据复合索引遵循复合最左原则, 这个情况是会应用到该索引的.
                3.select * from students where phone_num = 18611120990 and name = '张三';
                    会应用phone_num_name_index索引
                    这个情况和索引的顺序都是一致的, 所以一定会被应用该索引.
                4.select * from students where name = '张三' and phone_num = 18611120990;
                    会应用phone_num_name_index索引
                    注意先后顺序说的是创建索引时指定列的先后顺序, 而不是查询时查询条件的先后顺序,
                    在索引列的查询情况都满足下(即phone_num和name两个查询都有),
                    这时mysql的查询优化器会自动调整条件顺序, 查询条件顺序不同但是都存在并参与过滤,
                    所以还是会命中索引, 所以可以理解为在该复合索引看来: 这个第四种情况和第三种情况是等价的.
        复合索引的查询条件注意:
            组合索引在查询条件为 and 时才会生效, 如果是 or 条件时, 会拆分条件, 导致破坏索引的连续性,
            如果必要 or 的情况时, 可以考虑用 UNION ALL 拆开写, 提高可索引性.

    全文索引(fulltext.sql)
        全文索引的关键字是fulltext, 做个了解, 应用场景并不多.
        全文索引主要用来查找文本中的关键字, 而不是直接与索引中的值做比较, 它更像是一个搜索引擎, 基于相似度的查询, 而不是简单的where语句的参数匹配.
        全文索引有点类似于 like + % 的查询, 但是当数据量大的时候, 使用全文索引的执行效率比like要高很多, 但是弊端就是全文索引会存在匹配精度问题
        全文索引的MySql版本, 数据类型, 存储引擎的支持情况:
            MySql的5.6之前版本, 只有MyISAM存储引擎支持全文检索.
            MySql的5.6之前版本, MyISAM和InnoDB存储引擎均支持全文检索.
            只有字段的数据类型为char, carchar, text 及其系列才可以建立全文索引.
            在数据量较大的时候, 先将数据放入一个没有全局索引的表中, 然后再用create index创建fulltext索引, 要比先为一张表建立fulltext然后再将数据写入的速度快的多.
            测试或使用全文索引时, 要先看一下自己的MySql版本, 存储引擎和数据类型是否支持全文索引.
        全文索引有两个变量, 最小搜索长度和最大搜索长度, 对于长度小于最小搜索长度和大于最大搜索长度的词语, 都不会被索引.
        通俗的说就是要对一个词语使用全文索引搜索, 那么这个词语的长度必须在两个变量的区间内. 这两个默认值可以使用 show variables like '%ft%'; 进行查看.
        这两个值分别是: 
            在MyISAM存储引擎下:
                ft_min_word_len 和 ft_max_word_len
            在InnoDB存储引擎下:
                innodb_ft_min_token_size 和 innodb_ft_max_token_size
        
    空间索引(spatialIndex.sql)
        MySql在5.7之后的版本支持了空间索引, 而且支持OpenGIS几何数据模型
        空间索引是对空间数据类型的字段建立的索引, MySql中的空间数据类型有4种, 分别是 GEOMETRY, POINT, LINESTRING, POLYGON.
        MySql使用SPATIAL关键字进行扩展, 使得能够用于创建正规索引类型的语法创建索引空间
        创建空间索引的列, 必须将其生命为 NOT NULL.
        空间索引一般在GIS地理信息相关系统用的比较多, 了解即可.
    
        支持的数据类型:
            Geometry(空间数据)
            Point(点的坐标值)
            LineString(数组类型的多个坐标值)
            Polygon(多位数组的多个坐标值)
        
    内部原理(internalPrinciples.sql)
        一般来说，索引本身也很大，不可能全部存储在内存中，因此索引往往以索引文件的形式存储的磁盘上。
        这样的话，索引查找过程中就要产生磁盘I/O消耗，相对于内存存取，I/O存取的消耗要高几个数量级，所以评价一个数据结构作为索引的优劣最重要的指标就是在查找过程中磁盘I/O操作次数的渐进复杂度。
        换句话说，索引的结构组织要尽量减少查找过程中磁盘I/O的存取次数。
        
        索引相关算法
            Hash
                优点: 通过字段的值计算的hash值, 定位数据非常快
                缺点: 不能进行范围查找, 因为散列表中的值是无序的, 无法进行大小的比较.
            二叉树
                特性: 分为左子树, 右子树和根节点, 左子树比根节点值要小, 右子树比根节点值要大
                缺点: 有可能产生不平衡, 类似于链表的结构.
            平衡二叉树
                特点: 
                    a.它的左子树和右子树都是平衡二叉树
                    b.左子树比中间小，右子树比中间值
                    c.左子树和右子树的深度之差的绝对值不超过1
                缺点:
                    a.插入操作需要回旋
                    b.支持范围查询，但回旋查询效率较低，比如要查找大于8的，会回旋到父节点7、10。
                    c.如果存放几百条数据的情况下，树高度越高，查询效率会越慢
            BTree树
                目前大部分数据库系统及文件系统都采用B-Tree或其变种B+Tree作为索引结构, Btree结构可以有效的解决之前的相关算法遇到的问题.
                
                MyISAM引擎使用B+Tree
                    叶节点的data域存放的是数据记录的地址。
                InnoDB引擎使用B+Tree
                    InnoDB的叶节点的data域存放的是数据，相比MyISAM效率要高一些，但是比较占硬盘内存大小。









拾壹.存储引擎(011StorageEngine)

    概述:
        数据库存储引擎是数据库底层软件组织，数据库管理系统（DBMS）使用数据引擎进行创建、查询、更新和删除数据。
        不同的存储引擎提供不同的存储机制、索引技巧、锁定水平等功能。现在许多不同的数据库管理系统都支持多种不同的数据引擎。MySQL的核心就是存储引擎。
        用户可以根据不同的需求为数据表选择不同的存储引擎
        
        可以使用 SHOW ENGINES 命令 可以查看Mysql的所有执行引擎我们 可以到 默认的执行引擎是innoDB 支持事务，行级锁定和外键。
    
    引擎分类:
        MyISAM：Mysql 5.5之前的默认数据库引擎，最为常用。拥有较高的插入，查询速度，但不支持事务

        InnoDB：事务型速记的首选引擎，支持ACID事务，支持行级锁定，MySQL5.5成为默认数据库引擎
        
        Memory： 所有数据置于内存的存储引擎，拥有极高的插入，更新和查询效率。但是会占用和数据量成正比的内存空间。并且其内容会在MYSQL重新启动是会丢失。
        
        Archive ：非常适合存储大量的独立的，作为历史记录的数据。因为它们不经常被读取。Archive 拥有高效的插入速度，但其对查询的支持相对较差
        
        Federated ：将不同的 MySQL 服务器联合起来，逻辑上组成一个完整的数据库。非常适合分布式应用
        
        CSV ：逻辑上由逗号分割数据的存储引擎。它会在数据库子目录里为每个数据表创建一个 .csv 文件。这是一种普通文本文件，每个数据行占用一个文本行。CSV 存储引擎不支持索引。

        BlackHole： 黑洞引擎，写入的任何数据都会消失，一般用于记录 binlog 做复制的中继
        
        ERFORMANCE_SCHEMA存储引擎该引擎主要用于收集数据库服务器性能参数。
        
        Mrg_Myisam Merge存储引擎，是一组MyIsam的组合，也就是说，他将MyIsam引擎的多个表聚合起来，但是他的内部没有数据，真正的数据依然是MyIsam引擎的表中，但是可以直接进行查询、删除更新等操作。

    操作(manipulate.sql)








拾贰.事务(012Transaction)

    概述:
        1.在MySQL中的事务（Transaction）是由存储引擎实现的，在MySQL中，只有InnoDB存储引擎才支持事务。
        2.事务处理可以用来维护数据库的完整性，保证成批的 SQL 语句要么全部执行，要么全部不执行。
        3.事务用来管理 DDL、DML、DCL 操作，比如 insert,update,delete 语句，默认是自动提交的。
        特性:
            原子性, 一致性, 隔离性, 持久性.
        
    操作(manipulate.sql)
        0、设置事务的提交方式为手动提交, 即关闭自动提交
            set autocommit = 0;
            select @@autocommit;
        1、开启事务：Start Transaction
            任何一条DML语句(insert、update、delete)执行，标志事务的开启
            命令：BEGIN 或 START TRANSACTION
        2、提交事务：Commit Transaction
            成功的结束，将所有的DML语句操作历史记录和底层硬盘数据来一次同步
            命令：COMMIT
        3、回滚事务：Rollback Transaction
            失败的结束，将所有的DML语句操作历史记录全部清空
            命令：ROLLBACK
        
        ### 模拟账户转账
        # 开启事务
        start transaction;
        update account set money = money - 200 where name = 'Hamilton';
        update account set money = money + 200 where name = 'Hillary';
        # 提交事务
        commit;
        # 回滚事务
        rollback;
        # 查看
        select * from account;
        
        当开启事务后, 执行update语句, 如果commit, 那么mysql的内存中的操作就会直接提交,数据变更落入硬盘.
        当开启事务后, 执行update语句, 如果rollback, 那么mysql的内存中的操作就会回滚,放弃数据落盘.
        注意:
            select * from account 查看的是内存中的实时数据变化.
            实际上开启事务后, 当更新语句执行但未提交时, 但是GUI点击表取查看是不会发生变化的
            但是select查是会发生变化的, 之后commit提交操作之后才会在GUI表中发生变更.
            开始事务之后, 执行完语句要么就会成功, 要么就回滚, 只会有一种结果. 没有提交了之后再回滚的这种操作.

        事务的隔离级别:
            lsolate, 顾名思义就是将一个事务将另一个事物隔离开, 避免一个正在操作的事务被另外一个事务修改或删除.
            级别:
                读未提交(Read uncommitted)
                    A事务 可以读取 B事务 未提交的数据，最低级别，任何情况都无法保证,会造成脏读。
                    正常是任何未提交或未回滚的正在begin进行中的事务都不能被读取, 只能读取已提交后落入磁盘的数据.
                读已提交(Read committed)
                    A事务 要等 B事务 提交后才能读取数据，可避免脏读的发生，但会造成不可重复读.
                    不可重复读的意思是: A事务 在未提交或未回滚的还在begin的进行中状态时也能读取 B事务提交之后的数据
                    导致了 A事务 在未提交的同一个事务内, 两次查相同的表的数据, 出现了不同的结果, 这是由于B事务变更了这个表并提交了.
                    正常是 A事务 在同一个没有提交的事务期间读取到的数据应该是一致的, 并且应该是 B事务 已经提交之后落入磁盘的数据.
                可重复读(Repeatable read)[mysql默认的隔离级别]
                    就是在开始读取数据（事务开启）时，不再允许修改操作，可避免脏读、不可重复读的发生，但是会造成幻读。
                    幻读的意思是: A事务在同一个没有提交的事务期间, 即使 B事务 修改了并提交了相同表的数据, A事务也无法查到 B事务操作相同表提交之后的结果.
                串行化/序列化(Serializable)
                    是最高的事务隔离级别，在该级别下，事务串行化顺序执行，可以避免脏读、不可重复读与幻读。但是这种事务隔离级别效率低下，比较耗数据库性能，一般不使用。
                    即在一个事务没有提交之前, 其他任何事务的更新操作都不可进行.
        
            解释:
                A事务在同一个没有提交的事务期间, 读取到B事务未能提交的更改是不正常的, 是脏读.
                A事务在同一个没有提交的事务期间, 读取到B事务已提交的更改是不正常的, 是重复读.
                A事务在同一个没有提交的事务期间, 未读取到B事务已提交的更改也是不正常的, 是幻读. 只有提交事务后重新开启新事务, 才能查到B事务提交的数据.
            
    锁机制:
        锁是计算机协调多个进程或线程并发访问同一资源的机制（避免争抢）。
        在数据库中，除传统的计算资源（如 CPU、RAM、I/O 等）的争用以外，数据也是一种供许多用户共享的资源。如何保证数据并发访问的一致性、有效性是所有数据库必须解决的一个问题
        锁冲突也是影响数据库并发访问性能的一个重要因素。从这个角度来说，锁对数据库而言显得尤其重要，也更加复杂。
        
    锁分类:
        从对数据操作的粒度分:
            a.表锁：操作时，会锁定整个表。
                开销小, 加锁快; 不会出现死锁; 锁定粒度最大, 发生锁冲突的概率最高, 并发度也最低.
            b.行锁：操作时，会锁定当前操作行。
                行锁只有InnoDB引擎才支持
                开销大, 加锁慢; 会出现死锁; 锁定粒度最小, 发生锁冲突的概率最低, 并发度也最高.
        从对数据操作的类型分：
            a.读锁（共享锁）：针对同一份数据，多个读操作可以同时进行而不会互相影响。
            b.写锁（排它锁）：当前操作没有完成之前，它会阻断其他写锁和读锁。

    锁操作(lockManipulate.sql):
        MyISAM的表读写锁:
            MyISAM 存储引擎只支持表锁.
            MyISAM 在执行查询语句（SELECT）前，会自动给涉及的所有表加读锁，在执行更新操作（UPDATE、DELETE、INSERT 等）前，会自动给涉及的表加写锁.
            这个过程并不需要用户干预，因此，用户一般不需要直接用 LOCK TABLE 命令给 MyISAM 表显式加锁。

            1.读锁（READ LOCK）行为:
                多个线程/会话 可以同时对同一个表加读锁。
                所有加读锁的线程都可以并发读取这张表。
                读锁期间，任何写操作（INSERT、UPDATE、DELETE）都会被阻塞，直到所有读锁释放。
            2.写锁（WRITE LOCK）行为:
                写锁是互斥锁, 一旦有写锁加在表上, 其他线程/会话 无法加任何锁(包括读锁), 也无法进行读取或写入。
        
        InnoDB的行读写锁:
            InnoDB的表锁和MyISAM的表锁特性一致.
            InnoDB和MyISAM的最大的两点不同:
                1.对事务的支持
                2.对行锁的支持

            1.共享锁（S）(读锁):
                又称为读锁，简称S锁，共享锁就是多个事务对于同一数据可以共享一把锁，都能访问到数据，但是只能读不能修改。
            2.排他锁（X）(写锁):
                又称为写锁，简称X锁，排他锁就是不能与其他锁并存，如一个事务获取了一个数据行的排他锁，其他事务就不能再获取该行的其他锁，包括共享锁和排他锁，但是获取排他锁的事务是可以对数据就行读取和修改。

            语法(几乎不用书写声明, InnoDB行锁机制会自动加锁):
                共享锁（S）:
                    SELECT * FROM table_name WHERE ... LOCK IN SHARE MODE
                排他锁（X) :
                    SELECT * FROM table_name WHERE ... FOR UPDATE

            对于UPDATE、DELETE和INSERT语句，InnoDB会自动给涉及数据集加排他锁（X).
            对于普通SELECT语句，InnoDB不会加任何锁；









拾叁.日志(013Logs)
    
    概述:
        在任何一种数据库中，都会有各种各样的日志，记录着数据库工作的方方面面，
        以帮助数据库管理员追踪数据库曾经发生过的各种事件。MySQL 也不例外。
    日志分类:
        错误日志
        二进制日志(binlog)
        查询日志
        慢查询日志
        
    日志操作(logManipulate.sql)
        错误日志:
            错误日志是 MySQL 中最重要的日志之一，它记录了当 mysqld 启动和停止时，以及服务器在运行过程中发生任何严重错误时的相关信息。当数据库出现任何故障导致无法正常使用时，可以首先查看此日志。
        二进制日志/binlog日志
            二进制日志（BINLOG）记录了所有的 DDL（数据定义语言）语句和 DML（数据操纵语言）语句，但是不包括数据查询语句。此日志对于灾难时的数据恢复起着极其重要的作用, MySQL的主从复制, 就是通过该binlog实现的。
            二进制日志，MySQl8.0默认已经开启，低版本的MySQL的需要通过配置文件开启，并配置MySQL日志的格式。
            Windows系统：my.ini, Linux系统:my.cnf
            binlog日志格式:
                STATEMENT
                    该日志格式在日志文件中记录的都是SQL语句（statement），每一条对数据进行修改的SQL都会记录在日志文件中，通过Mysql提供的mysqlbinlog工具，可以清晰的查看到每条语句的文本。主从复制的时候，从库（slave）会将日志解析为原文本，并在从库重新执行一次。
                ROW
                    该日志格式在日志文件中记录的是每一行的数据变更，而不是记录SQL语句。比如，执行SQL语句 ： update tb_book set status='1' , 如果是STATEMENT 日志格式，在日志中会记录一行SQL文件； 如果是ROW，由于是对全表进行更新，也就是每一行记录都会发生变更，ROW 格式的日志中会记录每一行的数据变更。
                MIXED
                    混合了STATEMENT 和 ROW两种格式。
        查询日志
            查询日志中记录了客户端的所有操作语句, 而二进制日志不包含查询数据的SQL语句.
            默认情况下, 查询日志是未开启的. 如果需要开启查询日志, 可以设置以下配置 ：
                该选项用来开启查询日志, 可选值: 0 或者 1; 0代表关闭, 1代表开启.
                    set global general_log = 1;
                    general_log = 1;
                设置日志的文件名, 如果没有指定, 默认的文件名为 host_name.log
                    set global general_log_file = file_name
                    general_log_file = file_name
        慢查询日志
            慢查询日志记录了所有执行时间超过参数 long_query_time 设置值, 并且扫描记录数不小于 min_examined_row_limit 的所有的SQL语句的日志.
            long_query_time 默认为 10 秒, 最小为 0, 精度可以到微秒.
            以下配置(详见: logManipulate)
                该参数用来控制慢查询日志是否开启, 可取值: 1 和 0, 1 代表开启, 0 代表关闭
                    set golbal slow_query_log = 1
                    slow_query_log = 1
                该参数用来指定慢查询日志的文件名
                    set golbal slow_query_log_file = slow_query.log
                    slow_query_log_file = slow_query.log
                该选项用来配置查询的时间限制， 超过这个时间将认为值慢查询， 将需要进行日志记录， 默认10s
                    set global long_query_time = 10
                    long_query_time = 10










拾肆.优化(014Optimization)

    概念:
        在应用的的开发过程中，由于初期数据量小，开发人员写 SQL 语句时更重视功能上的实现，但是当应用系统正式上线后，随着生产数据量的急剧增长. 
        很多 SQL 语句开始逐渐显露出性能问题，对生产的影响也越来越大，此时这些有问题的 SQL 语句就成为整个系统性能的瓶颈，因此我们必须要对它们进行优化.
        MySQL的优化方式有很多，大致我们可以从以下几点来优化MySQL:
            从设计上优化
            从查询上优化
            从索引上优化
            从存储上优化
    
    优化操作(optimizationManipulate.sql)
        查看sql执行频率
            MySQL 客户端连接成功后，通过 show [session|global] status 命令可以查看服务器状态信息。通过查看状态信息可以查看对当前数据库的主要操作类型。
        定位低效率执行的Sql
            方式一(静态查历史记录):
                通过慢查询日志定位
            方式二(实时动态查询的结果):
                show full processlist
                FULL：显示完整的 SQL 语句内容（否则只显示前 100 个字符）.
                该命令查看当前MySQL在进行的线程，包括线程的状态、是否锁表等，可以实时地查看 SQL 的执行情况，同时对一些锁表操作进行优化。
                    | 列名         | 说明                                                                             |
                    | ----------- | ------------------------------------------------------------------------------ |
                    | **Id**      | 线程的唯一标识符。可以用 `KILL Id` 来终止该线程。                                                 |
                    | **User**    | 当前连接的 MySQL 用户名。                                                               |
                    | **Host**    | 连接来源的主机地址和端口，例如 `localhost:3306` 或 `192.168.1.100:50000`。                      |
                    | **db**      | 当前连接正在使用的数据库名称。如果未选择数据库，则为 `NULL`。                                             |
                    | **Command** | 当前线程正在执行的命令类型，如 `Sleep`、`Query`、`Connect`、`Binlog Dump` 等。                     |
                    | **Time**    | 当前状态持续的时间（秒）。例如：一个查询执行了 120 秒。                                                 |
                    | **State**   | 当前线程的状态（正在做什么），例如 `Sending data`、`Locked`、`Waiting for table metadata lock` 等。 |
                    | **Info**    | 当前线程正在执行的 SQL 语句内容。使用 `SHOW FULL PROCESSLIST` 可看到完整 SQL。                       |
        分析执行计划
            通过以上步骤查询到效率低的 SQL 语句后，可以通过 EXPLAIN命令获取 MySQL如何执行 SELECT 语句的信息，包括在 SELECT 语句执行过程中表如何连接和连接的顺序。
            EXPLAIN 输出各列含义说明
                | 列名                | 含义                                                            |
                | ------------------ | ------------------------------------------------------------- |
                | **id**             | 查询中每个子句的唯一标识符，表示查询中执行的顺序和层次结构。数值越大优先级越高。                      |
                | **select_type**   | 查询的类型，例如 `SIMPLE`（简单查询）、`PRIMARY`、`SUBQUERY`、`DERIVED`（派生表）等。 |
                | **table**          | 当前执行计划正在访问的表名或临时表名（如 `derivedN` 表示派生表）。                       |
                | **partitions**     | 表示匹配的分区（如使用了 `partitioned table`）。                            |
                | **type**           | **连接类型（Join Type）**，表示表的访问方式，是执行计划中最关键的指标之一。                  |
                | **possible_keys** | 可能使用的索引（根据查询条件推测出来的）。                                         |
                | **key**            | 实际使用的索引（为空表示没有使用索引）。                                          |
                | **key_len**       | 实际使用的索引的长度（单位为字节），越小越好。                                       |
                | **ref**            | 哪个列或常量与索引进行了比较（通常是连接字段）。                                      |
                | **rows**           | MySQL 预估会读取的行数。用于判断 SQL 的性能。                                  |
                | **filtered**       | 预估经过条件过滤后还剩下多少百分比的记录（范围 0\~100）。                              |
                | **Extra**          | 额外信息，包括是否使用了临时表、是否排序、是否使用索引覆盖等关键提示信息。                         |
            select_type 的常见值及解释
                | `select_type` 值        | 含义说明                                         |
                | ---------------------- | -------------------------------------------- |
                | `SIMPLE`               | 简单查询：不包含子查询或 UNION 的查询。                      |
                | `PRIMARY`              | 主查询：如果有子查询，最外层的查询就是 `PRIMARY`。               |
                | `SUBQUERY`             | 子查询：出现在 `SELECT`、`FROM`、`WHERE` 中的子查询（非派生表）。 |
                | `DERIVED`              | 派生表：出现在 `FROM` 子句中的子查询，会被物化成临时表。             |
                | `UNION`                | `UNION` 的第二个或后续的查询部分。                        |
                | `UNION RESULT`         | `UNION` 合并结果的输出部分，代表结果集本身。                   |
                | `DEPENDENT UNION`      | `UNION` 中依赖于外部查询的子部分。                        |
                | `DEPENDENT SUBQUERY`   | 依赖于外层查询的子查询，通常在 WHERE 子句中出现，并依赖外部字段。         |
                | `MATERIALIZED`         | 子查询被物化成临时表（MySQL 8.0+，用于优化相关子查询）。            |
                | `UNCACHEABLE SUBQUERY` | 结果不能缓存的子查询（如含变量的子查询），每行都重新执行。                |
            type（访问类型）常见值（从好到坏）：
                | 类型       | 说明                       |
                | -------- | ------------------------ |
                | `NULL`   | 无访问任何表, 任何索引, 直接返回结果, 比如 select now();           |
                | `system` | 表仅有一行（系统表），最优            |
                | `const`  | 主键或唯一索引 + 常量条件，最多返回一行    |
                | `eq_ref` | 联接中使用了主键或唯一索引，每次返回一行      |
                | `ref`    | 联接中使用了普通索引，返回多行           |
                | `range`  | 使用索引做范围查询（BETWEEN、<、> 等） |
                | `index`  | 全索引扫描（比全表好）              |
                | `ALL`    | 全表扫描，性能最差（应避免）           |
            Extra 常见值说明：
                | Extra 内容                         | 说明                                       |
                | --------------------------------- | ---------------------------------------- |
                | Using where                       | 使用了 WHERE 过滤条件                           |
                | Using index                       | 使用了**覆盖索引**，避免回表                         |
                | Using temporary                   | 使用了临时表（如 GROUP BY / ORDER BY 引起）         |
                | Using filesort                    | MySQL 使用文件排序（即非索引排序）                     |
                | Using join buffer                 | 表示使用了连接缓存（可能是因为没有索引）                     |
                | Using index condition             | 使用了索引条件下推（ICP），优化 WHERE                  |
                | Using where with pushed condition | 条件被“下推”到了存储引擎级别执行                        |
                | Impossible WHERE                  | WHERE 条件永远不成立                            |
                | Select tables optimized away      | 对聚合函数做了优化（如 `SELECT COUNT(*) FROM ...` ） |
        profile分析Sql
            Mysql从5.0.37版本开始增加了对 show profiles 和 show profile 语句的支持
            show profiles 能够在做SQL优化时帮助我们了解时间都耗费到哪里去了。。
            通过 have_profiling 参数，能够看到当前MySQL是否支持profile：
                select @@have_profiling;
                set profiling = 1;
            在获取到最消耗时间的线程状态后，MySQL支持进一步选择all、cpu、block io 、context switch、page faults
            等明细类型类查看MySQL在使用什么资源上耗费了过高的时间。例如，选择查看CPU的耗费时间
            
            SHOW PROFILE ALL FOR QUERY <query_id> 输出说明
                | 字段名                 | 说明                   |
                | ------------------- | -------------------- |
                | `Status`            | 当前阶段的名称（查询执行过程的步骤）   |
                | `Duration`          | 每个阶段耗费的时间（单位：秒）      |
                | `CPU_user`          | 用户态 CPU 时间           |
                | `CPU_system`        | 内核态 CPU 时间           |
                | `Block_ops_in`      | 阻塞的输入操作数（如磁盘读取）      |
                | `Block_ops_out`     | 阻塞的输出操作数（如磁盘写入）      |
                | `Messages_sent`     | 发送的消息数量（比如网络包）       |
                | `Messages_received` | 接收的消息数量              |
                | `Page_faults_major` | 主页错误（需要访问磁盘）         |
                | `Page_faults_minor` | 次页错误（可以从内存中恢复）       |
                | `Swaps`             | 内存交换次数               |
                | `Source_function`   | 内部函数调用（可选项，debug 信息） |
                | `Source_file`       | 源码文件名（可选项）           |
                | `Source_line`       | 行号（可选项）              |
            常见 Status 类型解释（即执行过程阶段）
                | `Status`               | 含义             |
                | ---------------------- | -------------- |
                | `starting`             | 初始化阶段，分配内存等    |
                | `checking permissions` | 检查权限           |
                | `Opening tables`       | 打开表文件          |
                | `System lock`          | 等待表锁或行锁        |
                | `init`                 | 初始化查询（如创建临时表）  |
                | `optimizing`           | 优化查询           |
                | `statistics`           | 收集统计信息（用于优化器）  |
                | `preparing`            | 准备执行计划         |
                | `executing`            | 执行计划中操作        |
                | `Sending data`         | 执行主查询并将结果返回客户端 |
                | `end`                  | 查询收尾阶段         |
                | `query end`            | 查询结束的清理阶段      |
                | `closing tables`       | 关闭表            |
                | `freeing items`        | 释放内存资源         |
                | `logging slow query`   | 如果是慢查询，写入日志    |
                | `cleaning up`          | 最后资源清理         |
            SHOW PROFILE <type> FOR QUERY <query_id> 中 <type> 选项解释:
                | 类型（type）           | 含义                       |
                | ------------------ | ------------------------ |
                | `CPU`              | 显示 CPU 使用时间（user/system） |
                | `MEMORY`           | 显示内存使用情况（不总是可用）          |
                | `BLOCK IO`         | 显示磁盘 I/O 情况              |
                | `CONTEXT SWITCHES` | 显示上下文切换情况                |
                | `IPC`              | 显示进程间通信数据                |
                | `PAGE FAULTS`      | 页面错误信息                   |
                | `SOURCE`           | 显示源码函数/文件行号（debug 用）     |
                | `SWAPS`            | 内存交换信息                   |
                | `ALL`              | 显示所有信息（最常用）              |
            
        trace优化器
            MySQL5.6提供了对SQL的跟踪trace, 通过trace文件能够进一步了解为什么优化器选择A计划, 而不是选择B计划
            打开trace, 设置格式为 JSON，并设置trace最大能够使用的内存大小，避免解析过程中因为默认内存过小而不能够完整展示。
                set optimizer_trace="enabled=on",end_markers_in_json=on; 
                set optimizer_trace_max_mem_size=1000000;
            最后， 检查information_schema.optimizer_trace就可以知道MySQL是如何执行SQL的 ：
                select * from information_schema.optimizer_trace `\G`;
                `\G`参数表示的是 将结果按“垂直格式”显示(json格式显示), 而不是表格形式显示。

        索引优化
            索引是数据库优化最常用也是最重要的手段之一, 通过索引通常可以帮助用户解决大多数的MySQL的性能优化问题。
            避免索引失效应用
                全值匹配
                最左前缀法则
                其他匹配原则
                    范围查询右边的列，不能使用索引 。
                    不要在索引列上进行运算操作, 索引将失效。
                    查询类型不匹配时, 索引将失效.
                    尽量使用覆盖索引, 避免select *
                    用or分割开的条件， 那么即使有涉及的索引都不会被用到。
                    以%开头的Like模糊查询，索引失效。
                    如果MySQL评估使用索引比全表更慢，则不使用索引。
                    is  NULL, is NOT NULL  有时有效, 有时索引失效。
                    普通索引时: in 走索引, not in 不走索引.
                    主键索引时: in 走索引, not in 也走索引.
                    单列索引和复合索引, 尽量使用复合索引.

        Sql优化
            大批量插入数据优化
                当使用load 命令导入数据的时候，适当的设置可以提高导入的效率。对于InnoDB 类型的表，有以下两种方式可以提高导入的效率:
                    主键顺序插入
                        因为InnoDB类型的表是按照主键的顺序保存的，所以将导入的数据按照主键的顺序排列，可以有效的提高导入数据的效率。
                        如果InnoDB表没有主键，那么系统会自动默认创建一个内部列作为主键，所以如果可以给表创建一个主键，将可以利用这点，来提高导入数据的效率。
                    关闭唯一性校验
                        在导入数据前执行 SET UNIQUE_CHECKS=0，关闭唯一性校验，在导入结束后执行SET UNIQUE_CHECKS=1，恢复唯一性校验，可以提高导入的效率。
                        因为本来 username 这一列就是一列唯一索引了, 所以在导入时就无需再次校验唯一索引列的唯一性了, 从而花费不必要的时间.
            insert优化
                如果需要同时对一张表插入很多行数据时，应该尽量使用多个值表的insert语句，这种方式将大大的缩减客户端与数据库之间的连接、关闭等消耗。使得效率比分开执行的单个insert语句快。
                    避免写法:
                        insert into tb_test values(1,'Tom');
                        insert into tb_test values(2,'Cat');
                        insert into tb_test values(3,'Jerry');
                    推荐写法:
                        insert into tb_test values(1,'Tom'),(2,'Cat')，(3,'Jerry');
                事务中插入数据尽量在一个事务中,插入多条数据, 而不是开多个事务, 每个事务插一条数据.
                    避免写法:
                        begin;
                            insert into tb_test values(1,'Tom');
                        commit;
                        begin;
                            insert into tb_test values(2,'Cat');
                        commit;
                        begin;
                            insert into tb_test values(3,'Jerry');
                        commit;
                    推荐写法:
                        begin;
                            insert into tb_test values(1,'Tom');
                            insert into tb_test values(2,'Cat');
                            insert into tb_test values(3,'Jerry');
                        commit;
                在插入时数据时尽量保证,是有序的主键插入, 而不是无序的主键插入.
                    避免写法:
                        insert into tb_test values(4,'Tim');
                        insert into tb_test values(1,'Tom');
                        insert into tb_test values(3,'Jerry');
                        insert into tb_test values(5,'Rose');
                        insert into tb_test values(2,'Cat');
                    推荐写法:
                        insert into tb_test values(1,'Tom');
                        insert into tb_test values(2,'Cat');
                        insert into tb_test values(3,'Jerry');
                        insert into tb_test values(4,'Tim');
                        insert into tb_test values(5,'Rose');
            orderby优化    
                两种排序情况:                    
                    Using filesort(使用文件排序)                   
                    第一种是通过对返回数据进行排序，也就是通常说的 filesort 排序，所有不是通过索引直接返回排序结果的排序都叫 FileSort 排序。
                    Using index(使用索引)
                    第二种通过有序索引顺序扫描直接返回有序数据，这种情况即为 using index，不需要额外排序，操作效率高。
                    
                Using filesort 情况的优化
                    通过创建合适的索引，能够减少 Filesort 的出现，但是在某些情况下，条件限制不能让Filesort消失，那就需要加快 Filesort的排序操作。对于Filesort ， MySQL 有两种排序算法：
                        1.两次扫描算法 ：MySQL4.1 之前，使用该方式排序。首先根据条件取出排序字段和行指针信息，然后在排序区 sort buffer 中排序，如果sort buffer不够，则在临时表 temporary table 中存储排序结果。完成排序之后，再根据行指针回表读取记录，该操作可能会导致大量随机I/O操作。
                        2.一次扫描算法：一次性取出满足条件的所有字段，然后在排序区 sort  buffer 中排序后直接输出结果集。排序时内存开销较大，但是排序效率比两次扫描算法要高。
                    MySQL 通过比较系统变量 max_length_for_sort_data 的大小和Query语句取出的字段总大小， 来判定是否那种排序算法，如果max_length_for_sort_data 更大，那么使用第二种优化之后的算法；否则使用第一种。
                    可以适当提高 sort_buffer_size  和 max_length_for_sort_data  系统变量，来增大排序区的大小，提高排序的效率。
                
            子查询优化
                使用子查询可以一次性的完成很多逻辑上需要多个步骤才能完成的SQL操作，同时也可以避免事务或者表锁死，并且写起来也很容易。
                但是，有些情况下，子查询是可以被更高效的连接（JOIN）替代。
                连接(Join)查询之所以更有效率一些 ，是因为MySQL不需要在内存中创建临时表来完成这个逻辑上需要两个步骤的查询工作。
                

            limit优化
                一般分页查询时，通过创建覆盖索引能够比较好地提高性能。一个常见又非常头疼的问题就是 limit 900000,10.
                此时需要MySQL排序前900010 记录，仅仅返回900000 - 900010 的记录，其他记录丢弃，查询排序的代价非常大 。
                优化方案一:
                    在索引上完成排序分页操作，最后根据主键关联回原表查询所需要的其他列内容。
                    把以下优化方案当作公式记在脑子里:
                        select * from tb_user limit 900000, 10;
                        优化为:
                        select * from tb_user a, (select id from tb_user limit 900000, 10) b where a.id = b.id;
                优化方案二:
                    该方案适用于主键自增的表，可以把Limit 查询转换成某个位置的查询 。
                    同样把以下优化方案当作公式记在脑子里:
                        select * from tb_user limit 900000, 10;
                        优化为:
                        select * from tb_user where id > 900000 limit 10;
                



零、 壹、贰、叁、肆、伍、陆、柒、捌、玖、拾;