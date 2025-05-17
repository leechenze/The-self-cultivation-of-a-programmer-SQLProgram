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
        TODO
    
    单列索引(singleColumnIndex.sql)
        
    
    





零、 壹、贰、叁、肆、伍、陆、柒、捌、玖、拾;