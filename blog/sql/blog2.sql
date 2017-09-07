-------------------------blog 项目 --------------------

-------------查询所有的表-------------

select * from B_ADMIN;--管理员
select * from B_COMMENT;--评论
select  * from b_article;--文章
select * from B_TAG;--标签
select * from B_TYPE;--类型
select  * from B_USER;--用户
select  * from b_drafets;--草稿
select * from B_COLUMN;   ---专栏

---------------------删除表和序列-----------
drop table b_admin;
drop table b_comment;
drop table b_DRAFETS;
drop table b_article;
drop table b_type;   
drop table b_tag;
drop table b_column;
drop table b_user;

drop sequence seq_usid;
drop sequence seq_adid;
drop sequence seq_aid;
drop sequence seq_cid;
drop sequence seq_drid;
drop sequence seq_tagid;
drop sequence seq_coid;
------------------------start create table---------------------
-----创建序列---
create sequence seq_usid start with 10001 increment by 1;
-------end-------


-----用户表
create table b_user(
       usid int primary key,               --用户id
       uemail varchar2(50) not null unique, --用户账号(邮箱登录)
       upassword varchar2(50) not null,   --用户密码
       uname varchar2(30),         		  --用户（昵称）    
       usex varchar2(4)  default '男' check (usex in('男','女')),     --用户性别
       ubirthday varchar2(30),            --用户出生日期
       uaddress varchar2(50),             --用户所在地
       upic varchar2(100),                --用户头像
       uphone varchar2(20),               --用户联系方式
       uprofession varchar2(40),          --用户的职业背景
       upersondesc varchar2(200)       	  --用户个人描述
);
-----管理员表--------------------

	-----创建序列---
create sequence seq_adid start with 1001 increment by 1; 
	-------end-------
create table b_admin(
       adid int primary key,              --管理员id 
       adname varchar2(30) not null unique,      --管理员名称
       adpassword varchar2(50) default '6f9b0a55df8ac28564cb9f63a10be8af6ab3f7c2',   --管理员密码 (默认值为 a)
       admail varchar2(50) not null unique --添加管理员邮箱（忘记密码登录）
);

-----文章所属类型（原创，转载，翻译） 1 2 3 类型不变

create table b_type(
       tid int primary key,
       tname varchar2(20)
);
-----插入文章类型
insert into b_type
select 1 , '原创' from dual union
select 2 , '转载' from dual union
select 3 , '翻译' from dual;


-----文章类别标签表-------------

	-----创建序列---
create  sequence seq_tagid start with 1 increment by 1;
	-------end-------
create table b_tag(
       tagid int primary key,      			 		--标签id
       tusid int references b_user(usid),			--用户id
       tagname varchar2(10) not null         --标签名称
);

-----文章内容表----------

	-----创建序列---
create sequence seq_aid start with 1 increment by 1;
	-------end-------
create table b_article(
       aid int primary key,               --文章id
       atitle varchar2(30) not null,      --文章标题
       tid int references b_type(tid),   --文章所属类型（原创，转载，翻译） 1 2 3 
       tagid int references b_tag(tagid),    --文章标签
       usid int references b_user(usid),     --文章作者
       atime varchar2(30),                --文章创作时间
       acontent varchar2(800),            --文章文本内容
       apic varchar2(200),                --文章图片  
       aviewnum varchar2(10) default '0'   --文章浏览量
);
--------评论表----------

	-----创建序列---
create sequence seq_cid start with 1 increment by 1;
	-------end-------
create table b_comment(
       cid int primary key,               --评论id
       caid int references b_article(aid) on delete cascade,--评论文章id
       usid int references b_user(usid),     --评论者id
       ccontent varchar2(800),            --评论内容
       ctime varchar2(30)              --评论时间
);

-----草稿箱----------
	-----创建序列---
create sequence seq_drid start with 1 increment by 1;
	-------end-------
create table b_drafets(
       drid int primary key,      --草稿箱id  
       usid int references b_user(usid) on delete cascade,     --文章作者      
       drtitle varchar2(60),      --文章的标题         
       drtypeid int,       --文章所属类型（原创，转载，翻译）
       drtagid int,        --文章标签
       drtime varchar2(30),       --文章创作时间
       drcontent varchar2(800),   --文章文本内容
       drpic varchar2(600)        --文章图片  
);

--博客专栏
create sequence seq_coid start with 1;
create table b_column(
       coid int primary key,               --专栏id
       cotitle  varchar2(40) not null,      --专栏标题（中文20个字 ）
       cocontent varchar2(100) ,  --专栏说明
       usid int references b_user(usid) not null,     --专栏创建者id
       cotime varchar2(40),                --专栏创建时间
       coaid varchar2(200),				--专栏里面所有文章的id
       copic varchar2(600),                --专栏图片  
       coviewnum  int  default 0 ,       --专栏浏览量
       articlenum int  default 0 -- 文章数
);

--------------------end create table-----------------------

------------------test Data -------------
---插入测试用户账号
	insert into b_user(usid,uemail,upassword) values(seq_usid.nextval,'123@qq.com','6f9b0a55df8ac28564cb9f63a10be8af6ab3f7c2');

	insert into b_user(usid,uemail,upassword) values(seq_usid.nextval,'6789@qq.com','6f9b0a55df8ac28564cb9f63a10be8af6ab3f7c2');

	insert into b_user(usid,uemail,upassword) values(seq_usid.nextval,'321@qq.com','6f9b0a55df8ac28564cb9f63a10be8af6ab3f7c2');	
-----插入管理员账号
	insert into B_ADMIN values(seq_adid.nextval,'admin','6f9b0a55df8ac28564cb9f63a10be8af6ab3f7c2','2576096522@qq.com');

