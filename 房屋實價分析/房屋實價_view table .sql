use [�Ыι���n�J�t��]
go

--�Ы��˵���
create view ��v as
select	iif( 
			left(ltrim([�g�a�Ϭq��m�ت��Ϭq���P]), 3) like '__��' or       --ltrim �h������ť�
			left(ltrim([�g�a�Ϭq��m�ت��Ϭq���P]), 3) like '__��',
			left(ltrim([�g�a�Ϭq��m�ت��Ϭq���P]), 3),
			iif(
				[�m����] like '__��' or
				[�m����] like '__��',
				[�m����],
				NULL
			   )
		   ) ����,
		*
from [land].[Main_a]
where [�����g�a�ϥΤ���] = N'��'
go

select * from [dbo].[��v]