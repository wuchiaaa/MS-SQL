/*初始化學生表  student*/
insert into [dbo].[student]([sno], [sname], [sage], [ssex]) values ('s001','張三',23,'男');
insert into student values ('s002','李四',23,'男');
insert into student values ('s003','吳鵬',25,'男');
insert into student values ('s004','琴沁',20,'女');
insert into student values ('s005','王麗',20,'女');
insert into student values ('s006','李波',21,'男');
insert into student values ('s007','劉玉',21,'男');
insert into student values ('s008','蕭蓉',21,'女');
insert into student values ('s009','陳蕭曉',23,'女');
insert into student values ('s010','陳美',22,'女');

/*初始化教師表  teacher */
insert into teacher values ('t001','劉陽');
insert into teacher values ('t002','諶燕');
insert into teacher values ('t003','胡明星');


/*初始化課程表  course*/
insert into course values ('c001','J2SE','t002'); 
insert into course values ('c002','Java Web','t002');
insert into course values ('c003','SSH','t001');
insert into course values ('c004','Oracle','t001');
insert into course values ('c005','SQL SERVER 2005','t003');
insert into course values ('c006','C#','t003');
insert into course values ('c007','JavaScript','t002');
insert into course values ('c008','DIV+CSS','t001');
insert into course values ('c009','PHP','t003');
insert into course values ('c010','EJB3.0','t002');


/*初始化成績表  sc*/
insert into sc values ('s001','c001',78.9);
insert into sc values ('s002','c001',80.9);
insert into sc values ('s003','c001',81.9);
insert into sc values ('s004','c001',60.9);
insert into sc values ('s001','c002',82.9);
insert into sc values ('s002','c002',72.9); 
insert into sc values ('s005','c003',78.9);
insert into sc values ('s006','c004',50.9);
insert into sc values ('s007','c005',81.9);
insert into sc values ('s008','c006',50.9);
insert into sc values ('s005','c007',42.9);
insert into sc values ('s006','c008',72.9); 
insert into sc values ('s005','c009',52.9);
insert into sc values ('s006','c010',92.9);
