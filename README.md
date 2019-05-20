**图书管理系统**

**数据库设计**

`create table borrowinfo( 
  borrowID char(6) ,
  bookId char(8),
  borrowDay date ,
  borrowRenewDay date,
  borrowRemandDay date,
  borrowPenalty real,
  borrowstatus tinyint ,
  id int identity,
  primary key(borrowID,bookId,id),
  foreign key(borrowID) references readerinfo(borrowID),
  foreign key (bookId) references bookinfo(bookId) ) 
`

**分页实现**

`create procedure paging_BookInfo
 (	@pageIndex int, -- 第几页
 	@pageSize int  -- 每页包含的记录数
 )
 as
 begin 
 	select top (select @pageSize) *     -- 这里注意一下，不能直接把变量放在这里，要用select
 	from (select row_number() over(order by bookId) as rownumber,* 
 			from [bookinfo]) temp_row 
 	where rownumber>(@pageIndex-1)*@pageSize;
 end`
