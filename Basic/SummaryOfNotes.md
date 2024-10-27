博学之, 审问之, 慎思之, 明辨之, 笃行之;
零、壹、贰、叁、肆、伍、陆、柒、捌、玖、拾;



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




壹.数据操纵语言DML

    










零、壹、贰、叁、肆、伍、陆、柒、捌、玖、拾;