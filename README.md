图书管理系统
 =====
demo 展示
--

* demo 地址 https://demo-1.werls.top
* 说明

       1. 默认用户为管理员
       2. 普通用户 账号:1361404576@qq.com 密码:qq1361404576

更新说明
-----

* 2019/6/12 
 更新了界面
 
 * 数据创建：
 
   ````
   create  database DookDb
    
   create table bookinfo(
          bookId varchar(50) primary key ,
          bookName varchar(50),
          bookAuthor varchar(50),
          bookPublishUnit varchar(50),
          bookRate int,
          bookSort varchar(50),
          bookCover varchar(50),
          bookRemark varchar(500)
      )
   create table readerinfo(
       borrowID varchar(50) primary key ,
       readerName varchar(50),
       passwd varchar(50),
       readerSex varchar(50),
       readerUnit varchar(50),
       readerPhone varchar(50),
       readerIDCard varchar(50),
       readerType varchar(50),
       readerTime date,
       raederCondition varchar(50)
   )
   create table borrowInfo(
       borrowID varchar(50),
       bookId varchar(50),
       [borrowDay] date default getdate(),
       borrowRenewDay varchar(50),
       borrowRemandDay varchar(50),
       borrowPenalty int,
       borrowstatus varchar(50),
       primary key(borrowID,bookId),
       foreign key(borrowID) references readerinfo(borrowID),
       foreign key (bookId) references bookinfo(bookId)
   )
   create table bookUser(
                             buser varchar(50) primary key ,
                             bpwd varchar(50),
                             bphone varchar(50)
    )

环境说明
------

* jdk 1.8 Tomcat 9.0.16  SQL Server2017 数据库 ,IDEA2019.1 开发软件


