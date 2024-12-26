# show tables;

###########################
######### 插入数据 #########
###########################
# 方式一:
# insert into student (sid, name, gender, age, birth, address, score)
# values (0, 'douglas', 'man', 23, '2004-12-21', '西安市未央区', 20.1);

# 方式二:
# insert into student(sid, name, gender, age, birth, address, score)
# values (1, 'hilary', 'woman', 13, '1999-12-21', '咸阳市秦都区', 20),
#        (2, 'linclon', 'man', 12, '1911-2-11', '咸阳市渭城区', 30),
#        (3, 'nixon', 'man', 13, '1929-12-21', '西安市长安区', 40),
#        (4, 'newton', 'man', 13, '1922-12-21', '西安市灞桥区', 50);

# 方式三:
# insert into student
# value (5, 'grim', 'man', 19, '1292-1-21', '西安市碑林区', 50);

###########################
######### 修改数据 #########
###########################
# 方式一:
# update student
# set address = '西安市新城区',
#     score   = 10,
#     age     = 20;

###########################
######### 删除数据 #########
###########################
# 方式一:
# delete from student where sid = 5;
# 删除表所有数据
# delete from student;

# 方式二:
# truncate table student;

# 方式三:
# truncate student;











select * from student;



