/*
觸發程序 Trigger
*/

use [購物系統]
go

-- 簡單案例 -- 不允許低於產品庫存量
drop table if exists t1

create table t1	--< 產品資料表
( 產品編號 int,
  產品名稱 varchar(10),
  庫存量 int)
go

-- 進貨
insert into t1 
values (1, '帽子', 10), (2, 'T恤', 10), (3, '褲子', 5)
go

select * from t1
go


create trigger tri_inventory
on t1
for update  --< 在事件發生之後自動執行
as
begin
	if (select [庫存量] from inserted) < 0
		rollback	--rollback：中止
	select * from inserted	--< 更新後的新資料
	select * from deleted	--< 更新前的舊資料
end
go


-- 假設買了產品編號2數量5
declare @var int = 3	--< 假設這是客戶的訂購數量

update [dbo].[t1]
set [庫存量] -= @var
where [產品編號] = 2

select * from [dbo].[t1]
go
