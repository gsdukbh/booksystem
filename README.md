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

