/*��l�ƾǥͪ�  student*/
insert into [dbo].[student]([sno], [sname], [sage], [ssex]) values ('s001','�i�T',23,'�k');
insert into student values ('s002','���|',23,'�k');
insert into student values ('s003','�d�P',25,'�k');
insert into student values ('s004','�^�G',20,'�k');
insert into student values ('s005','���R',20,'�k');
insert into student values ('s006','���i',21,'�k');
insert into student values ('s007','�B��',21,'�k');
insert into student values ('s008','���T',21,'�k');
insert into student values ('s009','������',23,'�k');
insert into student values ('s010','����',22,'�k');

/*��l�ƱЮv��  teacher */
insert into teacher values ('t001','�B��');
insert into teacher values ('t002','�ۿP');
insert into teacher values ('t003','�J���P');


/*��l�ƽҵ{��  course*/
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


/*��l�Ʀ��Z��  sc*/
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
