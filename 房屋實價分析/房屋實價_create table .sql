use [�Ыι���n�J�t��]

drop table if exists land.Main
drop table if exists land.Main_Rent
drop table if exists land.Park
drop table if exists land.Build
drop table if exists land.Land

drop table if exists land.Main_a
drop table if exists land.a_Build
drop table if exists land.a_Land
drop table if exists land.a_Park

drop table if exists land.Main_b
drop table if exists land.b_Land
drop table if exists land.b_Park

drop table if exists land.c_Main_Rent
drop table if exists land.c_Build
drop table if exists land.c_Land
drop table if exists land.c_Park
go
drop schema if exists land
go
create schema land
go

-- ���ʲ��R�� -------------------------------------------------------------------
drop table if exists land.Main_a
create table land.Main_a
( �m���� nchar(3),
  ����Ъ� nvarchar(15),
  �g�a�Ϭq��m�ت��Ϭq���P nvarchar(30),
  �g�a�����`���n���褽�� decimal(8, 2),
  �����g�a�ϥΤ��� nvarchar(2),
  �D�����g�a�ϥΤ��� nvarchar(2),
  �D�����g�a�ϥνs�w nvarchar(2),
  ����~��� date,					--����~��� date
  ������ɼ� nvarchar(15),
  ����h�� nvarchar(15),
  �`�Ӽh�� nvarchar(4),
  �ت����A nvarchar(20),
  �D�n�γ~ nvarchar(15),
  �D�n�ا� nvarchar(10),
  �ؿv�����~�� date,
  �ت������`���n���褽�� decimal(8, 2),
  [�ت��{�p�槽-��] tinyint,
  [�ت��{�p�槽-�U] tinyint,
  [�ت��{�p�槽-��] tinyint,
  [�ت��{�p�槽-�j��] nchar(1),
  ���L�޲z��´ nchar(1),
  �`���� int,
  ��������褽�� int,
  �������O nvarchar(10),
  ���첾���`���n���褽�� decimal(8, 2),
  �����`���� int,
  �Ƶ� nvarchar(100),
  �s�� char(19) primary key
)
go

-- �ت����ʲ��R��
drop table if exists land.a_Build
create table land.a_Build
( �s�� char(19),
  ���� tinyint,
  �ت����ୱ�n���褽�� decimal(8, 2),
  �D�n�γ~ nvarchar(15),
  �D�n�ا� nvarchar(10),
  �ؿv������� nvarchar(50),
  �`�h�� nvarchar(4),
  �ت����h nvarchar(30)
)
go

-- �g�a���ʲ��R��
drop table if exists land.a_Land
create table land.a_Land
( �s�� char(19),
  �g�a�Ϭq��m nvarchar(10),
  �g�a���ୱ�n���褽�� decimal(8, 2),
  �ϥΤ��ϩνs�w nvarchar(10)
)
go

-- ���������ʲ��R��
drop table if exists land.a_Park
create table land.a_Park
( �s�� char(19),
  �������O nvarchar(10),
  ������� int,
  ���쭱�n���褽�� decimal(8, 2)
)
go



-- �w��ζR�� -------------------------------------------------------------------
drop table if exists land.Main_b
select * into land.Main_b from land.Main_a where 1 = 0
--alter table land.Main_b add primary key(�s��)

-- �g�a�w��ζR��
drop table if exists land.b_Land
select * into land.b_Land from land.a_Land where 1 = 0
--alter table land.b_Land add primary key(�s��)

-- �������w��ζR��
drop table if exists land.b_Park
select * into land.b_Park from land.a_Park where 1 = 0
--alter table land.b_Park add primary key(�s��)


-- ���ʲ����� -------------------------------------------------------------------
drop table if exists land.c_Main_Rent
create table land.c_Main_Rent
( �m���� nchar(3),
  ����Ъ� nvarchar(15),
  �g�a�Ϭq��m�ت��Ϭq���P nvarchar(30),
  �g�a�����`���n���褽�� decimal(8, 2),
  �����g�a�ϥΤ��� nvarchar(2),
  �D�����g�a�ϥΤ��� nvarchar(2),
  �D�����g�a�ϥνs�w nvarchar(2),
  ����~��� date,						--����~��� date
  ����ɼ� nvarchar(15),
  ����h�� nvarchar(15),
  �`�Ӽh�� nvarchar(4),
  �ت����A nvarchar(20),
  �D�n�γ~ nvarchar(15),
  �D�n�ا� nvarchar(10),
  �ؿv�����~�� date,
  �ت��`���n���褽�� decimal(8, 2),
  [�ت��{�p�槽-��] tinyint,
  [�ت��{�p�槽-�U] tinyint,
  [�ت��{�p�槽-��] tinyint,
  [�ت��{�p�槽-�j��] nchar(1),
  ���L�޲z��´ nchar(1),
  ���L���í� nchar(1),
  �`�B�� int,
  ��������褽�� int,
  �������O nvarchar(10),
  ���쭱�n���褽�� decimal(8, 2),
  �����`�B�� int,
  �Ƶ� nvarchar(100),
  �s�� char(19) primary key
)
go

-- �ت����ʲ����� ---------------------------------------------------------------
drop table if exists land.c_Build
select * into land.c_Build from land.a_Build where 1 = 0
--alter table land.c_Build add primary key(�s��)
go

-- �g�a���ʲ����� ---------------------------------------------------------------
drop table if exists land.c_Land
select * into land.c_Land from land.a_Land where 1 = 0
--alter table land.c_Land add primary key(�s��)
go

-- ���������ʲ����� -------------------------------------------------------------
drop table if exists land.c_Park
select * into land.c_Park from land.a_Park where 1 = 0
--alter table land.c_Park add primary key(�s��)
go
