#############################
########## 存储过程 ##########
#############################
########## 流程控制 ##########
#############################

use sqldb;

############################## 分支语句 ##############################

############################## IF ELSE ##############################
# 输入学生的成绩判断成绩的级别
delimiter $$
create procedure proce06(inout score int)
begin
    if score < 60 then
        select '不及格';
    elseif score >= 60 and score < 80 then
        select '及格';
    elseif score >= 80 and score < 90 then
        select '良好';
    elseif score >= 90 and score <= 100 then
        select '优秀';
    else
        select '成绩错误';
    end if;
end $$
delimiter ;

drop procedure proce06;

set @score = 100;
call proce06(@score);

# 输入员工名字, 判断工资情况
delimiter $$
create procedure proce07(inout ename varchar(20))
begin
    declare varSalary double;
    declare result varchar(20);
    
    select sal into varSalary from sp_emp where sp_emp.ename = ename;
    
    if varSalary < 10000 then
        set result =  '试用薪资';
    elseif varSalary < 20000 then
        set result =  '正式薪资';
    elseif varSalary < 30000 then
        set result =  '元老薪资';
    else
        set result = '薪资范围错误或大于30000';
    end if;
    select result;
end $$
delimiter ;

set @ename = '甘宁';
call proce07(@ename);


############################## CASE ##############################
# 支付方式
# 1.微信支付
# 2.支付宝支付
# 3.银行卡支付
# 4.其它方式支付

delimiter $$
create procedure proce08(in payType int)
begin
    # 方式一
    case payType
        when 1 then select '微信支付';
        when 2 then select '支付宝支付';
        when 3 then select '银行卡支付';
        else select '其它方式支付';
    end case;
#     # 方式二
#     case
#         when payType = 1 then select '微信支付';
#         when payType = 2 then select '支付宝支付';
#         when payType = 3 then select '银行卡支付';
#         else select '其它方式支付';
#         end case;
end $$
delimiter ;

drop procedure proce08;

call proce08(3);


############################## 循环语句 ##############################
# 创建测试表
create table user (
    uid int primary key,
    username varchar(50),
    password varchar(50)
);

truncate table user;

############################## WHILE ##############################

# 向user表中循环插入10条语句
delimiter $$
create procedure proce09(in insertCount int)
begin
    declare i int default 1;
    while i <= insertCount do
            insert into user values(i, concat_ws('_','user',i),'123456');
            set i = i + 1;
        end while;
end $$
delimiter ;
call proce09(10);

############################## WHILE + LEAVE ##############################

# 向user表中循环插入10条语句, 从第五条跳出
delimiter $$
create procedure proce10(in insertCount int)
begin
    declare i int default 1;
    labelA: while i <= insertCount do
        insert into user values(i, concat_ws('_','user',i),'123456');
        if i = 5 then leave labelA;
        end if;
        set i = i + 1;
    end while labelA;
    select '循环结束';
end $$
delimiter ;
call proce10(10);

############################## WHILE + ITERATE ##############################
# 向user表中循环插入10条语句, 跳过第五条
delimiter $$
create procedure proce11(in insertCount int)
begin
    declare i int default 0;
    labelA: while i < insertCount do
            
            set i = i + 1;
            if i = 5 then iterate labelA;
            end if;
            insert into user values(i, concat_ws('_','user',i),'123456');
            
        end while labelA;
    select '循环结束';
end $$
delimiter ;
call proce11(10);

############################## REPEAT ##############################
truncate table user;

# 向user表中循环插入10条语句
delimiter $$
create procedure proce12(in insertCount int)
begin
    declare i int default 1;
    labelA: repeat
            insert into user values(i, concat_ws('_','user',i),'123456');
            set i = i + 1;
            until i > insertCount
        end repeat labelA;
end $$
delimiter ;
call proce12(10);

############################## LOOP ##############################
truncate table user;

delimiter $$
create procedure proce13(in insertCount int)
begin
    declare i int default 1;
    labelA: loop
        insert into user values(i, concat_ws('-','user',i), '123456');
        set i = i + 1;
        if i > insertCount then leave labelA;
        end if;
    end loop labelA;

end $$
delimiter ;

call proce13(20);





