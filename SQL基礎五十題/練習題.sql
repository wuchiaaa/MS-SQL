use myDB

/* 1、查詢課程編號為「c001」的課程比「c002」的課程成績高的所有學生的學號 */
select A.sno
from (select sno,score from sc where cno='c001')as A,
(select sno,score from sc where cno='c002')as B
where A.score > B.score
and A.sno = B.sno


/* 2、查詢平均成績大於60分的學生的學號和平均成績 */
select sno, avg(score) as avg
from sc
group by sno
having avg(score) > 60


/* 3、查詢所有學生的學號、姓名、選課數、總成績 */
select st.sno as 學號, st.sname as 姓名, sc2.lesson_count as 選課數, sc2.sum as 總成績
from student as st
left join (select sc.sno, count(sc.cno) as lesson_count, sum(sc.score)as sum from sc group by sc.sno) as sc2
on st.sno = sc2.sno


/* 4、查詢姓「劉」的老師的個數 */
select count(tno) as "姓「劉」的老師的個數"
from [dbo].[teacher]
where tname like '劉%'


/* 5、查詢沒學過「劉陽」老師課的學生的學號、姓名 */
select s.sno, s.sname
from [dbo].[student] as s
where sno not in (select distinct sc.sno
from [dbo].[sc], [dbo].[teacher] as t, [dbo].[course] as c
where sc.cno = c.cno
and t.tno = c.tno
and t.tname = '劉陽')


/* 6、查詢學過編號為「c001」的課程並且也學過編號為「c002」的課程的學生的學號、姓名 */
---((方法一))---
--SET STATISTICS TIME ON  --查詢運行時間較短
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
---((方法二))---
--SET STATISTICS TIME ON  --查詢運行時間較長
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
---((錯誤答案))---
select student.sno, student.sname
from student, sc
where student.sno = sc.sno
and sc.sno in ('c001', 'c002')


/* 7、查詢學過「胡明星」老師所教的所有課的學生的學號、姓名 */
---((錯誤答案))---
select st.sno, st.sname
from [dbo].[student] as st
join sc on st.sno = sc.sno
join course on course.cno = sc.cno
join teacher as t on t.tno = course.tno
where t.tname = '胡明星'
---((同時學習SQL server、C#、PHP的學生))---
select sno, sname
from [dbo].[student]
where sno in (
select sc.sno
from teacher, course, sc
where teacher.tname = '胡明星' 
and teacher.tno = course.tno
and course.cno = sc.cno
group by sno
having count(sc.cno) = (select count(cno)
from [dbo].[course], [dbo].[teacher]
where teacher.tno = course.tno
and teacher.tname = '胡明星'))


/* 8、查詢課程編號為「c002」的總成績 */
select sum(score) as '總成績'
from [dbo].[sc]
where cno = 'c002'


/* 9、查詢所有課程成績小於60分的學生的學號、姓名 */
---((方法一))---
select distinct s.sno, s.sname
from [dbo].[student] as s
join [dbo].[sc]
on s.sno = sc.sno
where sc.score < 60
---((方法二))---
select s.sno, s.sname
from [dbo].[student] as s
where s.sno in (select sno from [dbo].[sc] where score < 60)


/* 10、查詢沒有學全所有課的學生的學號、姓名 */
select s.sno, s.sname
from [dbo].[student] as s, [dbo].[sc]
where s.sno = sc.sno
group by s.sno, s.sname
having (select count(cno) from [dbo].[course]) > (count(sc.cno))

