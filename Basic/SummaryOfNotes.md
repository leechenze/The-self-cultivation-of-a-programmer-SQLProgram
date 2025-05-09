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
        





零、 壹、贰、叁、肆、伍、陆、柒、捌、玖、拾;