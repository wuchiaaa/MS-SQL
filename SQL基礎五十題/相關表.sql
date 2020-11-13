/*學生表*/
create table student
(
    sno varchar(10) primary key not null,
    sname varchar(20),
    sage tinyint,
    ssex varchar(5)
)
 
/*教師表*/
create table teacher 
(
   tno varchar(10) primary key,
   tname varchar(20)
) 

/*課程表*/
create table course
(
    cno varchar(10),
    cname varchar(20),
    tno varchar(20),
    constraint pk_course primary key (cno,tno)
) 

/*成績表*/
create table sc 
(
    sno varchar(10),
    cno varchar(10),
    score numeric(4,2),
    constraint pk_sc primary key (sno,cno)
)
