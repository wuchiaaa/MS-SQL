/*
Ĳ�o�{�� Trigger
*/

use [�ʪ��t��]
go

-- ²��ר� -- �����\�C�󲣫~�w�s�q
drop table if exists t1

create table t1	--< ���~��ƪ�
( ���~�s�� int,
  ���~�W�� varchar(10),
  �w�s�q int)
go

-- �i�f
insert into t1 
values (1, '�U�l', 10), (2, 'T��', 10), (3, '�Ǥl', 5)
go

select * from t1
go


create trigger tri_inventory
on t1
for update  --< �b�ƥ�o�ͤ���۰ʰ���
as
begin
	if (select [�w�s�q] from inserted) < 0
		rollback	--rollback�G����
	select * from inserted	--< ��s�᪺�s���
	select * from deleted	--< ��s�e���¸��
end
go


-- ���]�R�F���~�s��2�ƶq5
declare @var int = 3	--< ���]�o�O�Ȥ᪺�q�ʼƶq

update [dbo].[t1]
set [�w�s�q] -= @var
where [���~�s��] = 2

select * from [dbo].[t1]
go
