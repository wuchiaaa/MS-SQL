use [房屋實價登入系統]
go

--創建檢視表
create view 住宅 as
select	iif( 
			left(ltrim([土地區段位置建物區段門牌]), 3) like '__市' or       --ltrim 去掉左邊空白
			left(ltrim([土地區段位置建物區段門牌]), 3) like '__縣',
			left(ltrim([土地區段位置建物區段門牌]), 3),
			iif(
				[鄉鎮市區] like '__市' or
				[鄉鎮市區] like '__縣',
				[鄉鎮市區],
				NULL
			   )
		   ) 縣市,
		*
from [land].[Main_a]
where [都市土地使用分區] = N'住'
go

select * from [dbo].[住宅]