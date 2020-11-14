use myDB

/* 1�B�d�߽ҵ{�s�����uc001�v���ҵ{��uc002�v���ҵ{���Z�����Ҧ��ǥͪ��Ǹ� */
select A.sno
from (select sno,score from sc where cno='c001')as A,
(select sno,score from sc where cno='c002')as B
where A.score > B.score
and A.sno = B.sno


/* 2�B�d�ߥ������Z�j��60�����ǥͪ��Ǹ��M�������Z */
select sno, avg(score) as avg
from sc
group by sno
having avg(score) > 60


/* 3�B�d�ߩҦ��ǥͪ��Ǹ��B�m�W�B��ҼơB�`���Z */
select st.sno as �Ǹ�, st.sname as �m�W, sc2.lesson_count as ��Ҽ�, sc2.sum as �`���Z
from student as st
left join (select sc.sno, count(sc.cno) as lesson_count, sum(sc.score)as sum from sc group by sc.sno) as sc2
on st.sno = sc2.sno


/* 4�B�d�ߩm�u�B�v���Ѯv���Ӽ� */
select count(tno) as "�m�u�B�v���Ѯv���Ӽ�"
from [dbo].[teacher]
where tname like '�B%'


/* 5�B�d�ߨS�ǹL�u�B���v�Ѯv�Ҫ��ǥͪ��Ǹ��B�m�W */
select s.sno, s.sname
from [dbo].[student] as s
where sno not in (select distinct sc.sno
from [dbo].[sc], [dbo].[teacher] as t, [dbo].[course] as c
where sc.cno = c.cno
and t.tno = c.tno
and t.tname = '�B��')


/* 6�B�d�߾ǹL�s�����uc001�v���ҵ{�åB�]�ǹL�s�����uc002�v���ҵ{���ǥͪ��Ǹ��B�m�W */
---((��k�@))---
--SET STATISTICS TIME ON  --�d�߹B��ɶ����u
--GO
select sc.sno, s.sname
from [dbo].[sc], [dbo].[student] as s
where sc.cno='c001'
and sc.sno = s.sno
and exists (select * from [dbo].[sc] as sc2
where sc2.sno = sc.sno
and sc2.cno='c002') 
--SET STATISTICS IO OFF
--GO
---((��k�G))---
--SET STATISTICS TIME ON  --�d�߹B��ɶ�����
--GO
select sc.sno, sc2.sname
from [dbo].[sc]
inner join (
select sc.sno,s.sname from [dbo].[sc], student as s
where cno='c001'
and sc.sno = s.sno) as sc2
on sc.sno = sc2.sno
where sc.cno='c002'
--SET STATISTICS IO OFF
--GO
---((���~����))---
select student.sno, student.sname
from student, sc
where student.sno = sc.sno
and sc.sno in ('c001', 'c002')


/* 7�B�d�߾ǹL�u�J���P�v�Ѯv�ұЪ��Ҧ��Ҫ��ǥͪ��Ǹ��B�m�W */
---((���~����))---
select st.sno, st.sname
from [dbo].[student] as st
join sc on st.sno = sc.sno
join course on course.cno = sc.cno
join teacher as t on t.tno = course.tno
where t.tname = '�J���P'
---((�P�ɾǲ�SQL server�BC#�BPHP���ǥ�))---
select sno, sname
from [dbo].[student]
where sno in (
select sc.sno
from teacher, course, sc
where teacher.tname = '�J���P' 
and teacher.tno = course.tno
and course.cno = sc.cno
group by sno
having count(sc.cno) = (select count(cno)
from [dbo].[course], [dbo].[teacher]
where teacher.tno = course.tno
and teacher.tname = '�J���P'))


/* 8�B�d�߽ҵ{�s�����uc002�v���`���Z */
select sum(score) as '�`���Z'
from [dbo].[sc]
where cno = 'c002'


/* 9�B�d�ߩҦ��ҵ{���Z�p��60�����ǥͪ��Ǹ��B�m�W */
---((��k�@))---
select distinct s.sno, s.sname
from [dbo].[student] as s
join [dbo].[sc]
on s.sno = sc.sno
where sc.score < 60
---((��k�G))---
select s.sno, s.sname
from [dbo].[student] as s
where s.sno in (select sno from [dbo].[sc] where score < 60)


/* 10�B�d�ߨS���ǥ��Ҧ��Ҫ��ǥͪ��Ǹ��B�m�W */
select s.sno, s.sname
from [dbo].[student] as s, [dbo].[sc]
where s.sno = sc.sno
group by s.sno, s.sname
having (select count(cno) from [dbo].[course]) > (count(sc.cno))

