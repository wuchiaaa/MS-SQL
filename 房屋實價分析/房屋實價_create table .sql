use [房屋實價登入系統]

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

-- 不動產買賣 -------------------------------------------------------------------
drop table if exists land.Main_a
create table land.Main_a
( 鄉鎮市區 nchar(3),
  交易標的 nvarchar(15),
  土地區段位置建物區段門牌 nvarchar(30),
  土地移轉總面積平方公尺 decimal(8, 2),
  都市土地使用分區 nvarchar(2),
  非都市土地使用分區 nvarchar(2),
  非都市土地使用編定 nvarchar(2),
  交易年月日 date,					--交易年月日 date
  交易筆棟數 nvarchar(15),
  移轉層次 nvarchar(15),
  總樓層數 nvarchar(4),
  建物型態 nvarchar(20),
  主要用途 nvarchar(15),
  主要建材 nvarchar(10),
  建築完成年月 date,
  建物移轉總面積平方公尺 decimal(8, 2),
  [建物現況格局-房] tinyint,
  [建物現況格局-廳] tinyint,
  [建物現況格局-衛] tinyint,
  [建物現況格局-隔間] nchar(1),
  有無管理組織 nchar(1),
  總價元 int,
  單價元平方公尺 int,
  車位類別 nvarchar(10),
  車位移轉總面積平方公尺 decimal(8, 2),
  車位總價元 int,
  備註 nvarchar(100),
  編號 char(19) primary key
)
go

-- 建物不動產買賣
drop table if exists land.a_Build
create table land.a_Build
( 編號 char(19),
  屋齡 tinyint,
  建物移轉面積平方公尺 decimal(8, 2),
  主要用途 nvarchar(15),
  主要建材 nvarchar(10),
  建築完成日期 nvarchar(50),
  總層數 nvarchar(4),
  建物分層 nvarchar(30)
)
go

-- 土地不動產買賣
drop table if exists land.a_Land
create table land.a_Land
( 編號 char(19),
  土地區段位置 nvarchar(10),
  土地移轉面積平方公尺 decimal(8, 2),
  使用分區或編定 nvarchar(10)
)
go

-- 停車場不動產買賣
drop table if exists land.a_Park
create table land.a_Park
( 編號 char(19),
  車位類別 nvarchar(10),
  車位價格 int,
  車位面積平方公尺 decimal(8, 2)
)
go



-- 預售屋買賣 -------------------------------------------------------------------
drop table if exists land.Main_b
select * into land.Main_b from land.Main_a where 1 = 0
--alter table land.Main_b add primary key(編號)

-- 土地預售屋買賣
drop table if exists land.b_Land
select * into land.b_Land from land.a_Land where 1 = 0
--alter table land.b_Land add primary key(編號)

-- 停車場預售屋買賣
drop table if exists land.b_Park
select * into land.b_Park from land.a_Park where 1 = 0
--alter table land.b_Park add primary key(編號)


-- 不動產租賃 -------------------------------------------------------------------
drop table if exists land.c_Main_Rent
create table land.c_Main_Rent
( 鄉鎮市區 nchar(3),
  交易標的 nvarchar(15),
  土地區段位置建物區段門牌 nvarchar(30),
  土地移轉總面積平方公尺 decimal(8, 2),
  都市土地使用分區 nvarchar(2),
  非都市土地使用分區 nvarchar(2),
  非都市土地使用編定 nvarchar(2),
  租賃年月日 date,						--租賃年月日 date
  租賃筆棟數 nvarchar(15),
  租賃層次 nvarchar(15),
  總樓層數 nvarchar(4),
  建物型態 nvarchar(20),
  主要用途 nvarchar(15),
  主要建材 nvarchar(10),
  建築完成年月 date,
  建物總面積平方公尺 decimal(8, 2),
  [建物現況格局-房] tinyint,
  [建物現況格局-廳] tinyint,
  [建物現況格局-衛] tinyint,
  [建物現況格局-隔間] nchar(1),
  有無管理組織 nchar(1),
  有無附傢俱 nchar(1),
  總額元 int,
  單價元平方公尺 int,
  車位類別 nvarchar(10),
  車位面積平方公尺 decimal(8, 2),
  車位總額元 int,
  備註 nvarchar(100),
  編號 char(19) primary key
)
go

-- 建物不動產租賃 ---------------------------------------------------------------
drop table if exists land.c_Build
select * into land.c_Build from land.a_Build where 1 = 0
--alter table land.c_Build add primary key(編號)
go

-- 土地不動產租賃 ---------------------------------------------------------------
drop table if exists land.c_Land
select * into land.c_Land from land.a_Land where 1 = 0
--alter table land.c_Land add primary key(編號)
go

-- 停車場不動產租賃 -------------------------------------------------------------
drop table if exists land.c_Park
select * into land.c_Park from land.a_Park where 1 = 0
--alter table land.c_Park add primary key(編號)
go
