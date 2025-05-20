#############################
############ 索引 ############
#############################
########## 全文索引 ##########
#############################

use sqldb;

# 查看全文索引的搜索长度区间变量值
show variables like '%ft%';

# 数据准备
# 创建 t_article 表
create table t_article (
    id int primary key auto_increment,
    title varchar(255),
    content varchar(1000),
    writing_date date
    # fulltext (content) # 创建全文索引, 不推荐这种方式
);

# 插入数据
insert into t_article values(null, 'Yesterday Once More', 'When I was young I listen to the radio', '2021-10-01');
insert into t_article values(null, 'Right Here Waiting', 'Oceans apart, day after day, and I slowly go insane', '2021-10-02');
insert into t_article values(null, 'My Heart Will Go On', 'every night in my dreams, i see you, i feel you', '2021-10-03');
insert into t_article values(null, 'Everytihing I Do', 'eLook into my eyes, you will see what you mean to me', '2021-10-04');
insert into t_article values(null, 'Called To Say I Love You', 'say love you no new year`s day, to celebrate', '2021-10-05');
insert into t_article values(null, 'Nothing`s Gonna Change My Love For You', 'if i had to live my life without you near me', '2021-10-06');
insert into t_article values(null, 'Everybody', 'We`re gonna bring the flavor show U how.', '2021-10-07');

# 修改表结构建立全文索引
alter table t_article add fulltext index content_index(content);
# 添加全文索引
create fulltext index content_index on t_article(content);

# 删除全文索引
drop index content_index on t_article;
# 删除全文索引
alter table t_article drop index content_index;

# 使用全文索引
# yo查询无结果是因为 InnoDB 存储引擎的 innodb_ft_min_token_size 变量设定的关键字是3, 也就是最少要输入三个字符才可以.
# select * from t_article where match(content) against('yo');
select * from t_article where match(content) against('you');

# 不使用全文索引实现
# 当数据量非常庞大时, 就不能用这种模糊查询匹配了, 一定要用全文索引效率高很多.
select * from t_article where content like '%you%';

