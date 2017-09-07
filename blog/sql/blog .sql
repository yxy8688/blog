-------------blog项目 --------
update b_article set aviewnum = (aviewnum+10) where usid=10002;--添加浏览量
update b_user set  uemail='2576096522@qq.com' where usid=10002;--修改用户邮箱
update b_admin set  admail='2576096522@qq.com' where adname='admin';--修改管理员邮箱

文章数大于10 ，浏览量大于20 ，  返回文章总数， 总浏览量 aviewnum  用户基本信息
select * from b_user bu inner join
(select usid,count(1) articlenum ,sum(aviewnum) aviewtotal from b_article group by usid) t on t.usid = bu.usid
where t.articlenum>10 and t.aviewtotal>20;
select sum(aviewnum) from b_article where usid = 10007;
--查询标签表（重复的标签名分组计数,忽略标签名大小写）；tagid,tusid,tagname
		select g.tagname tagname,count(g.tagname) as articlenum from
			(select lower(t.tagname) tagname,a.aid aid from b_tag t inner join b_article a on t.tagid = a.tagid ) g
			group by g.tagname ;
select * from b_tag t group by t.tagname
		
select sysdate from dual;
-------------------------------------
create sequence seq_usid start with 10001;

-----用户表
create table b_user(
       usid int primary key,               --用户id
       uemail varchar2(50) not null unique, --用户账号(邮箱登录)
       upassword varchar2(50) not null,   --用户密码
       uname varchar2(30),         		  --用户（昵称）    
       usex varchar2(4)  default '男' check (usex in('男','女')),     --用户性别
       ubirthday varchar2(20),            --用户出生日期
       uaddress varchar2(30),             --用户所在地
       upic varchar2(100),                --用户头像
       uphone varchar2(20),               --用户联系方式
       uprofession varchar2(20),          --用户的职业背景
       upersondesc varchar2(200)        --用户个人描述
);
select * from b_user;
select * from b_user where uemail='2576096522@qq.com'
update b_user set  uemail='2576096522@qq.com' where usid=10151

insert into b_user(usid,uemail,upassword) values(seq_usid.nextval,'1506173890@qq.com','a');
update  b_user set upassword = '6f9b0a55df8ac28564cb9f63a10be8af6ab3f7c2';

select count(1) total ,ceil(count(1)/10) totalPage ,10 currPage,20pageSize from b_user
select * from (select n.*,rownum rn from (select * from b_user )n
where 10*10>=rownum) t where rn>(10-1)*10


--插入155条用户数据
insert into b_user
select seq_usid.nextval, 
dbms_random.string('x', 4)||'@qq.com','a',
dbms_random.string('l',dbms_random.value(5, 20)),
decode(ceil(dbms_random.value(0, 2)), 1, '男', '女'),
to_char(add_months(sysdate, dbms_random.value(12*18, 12*50) * -1), 'yyyy-MM-dd'),
decode(ceil(dbms_random.value(0, 6)), 1, '湖南', 2, '湖北', 3, '广东', 4, '广西', 5, '北京', '上海'),'',
'180'||ceil(dbms_random.value(10000000,99999999)) ,
decode(ceil(dbms_random.value(0, 6)), 1, '程序员', 2, '测试员', 3, '分析员', 4, '设计员', 5, '翻译员'),'' from dual connect by level <= 150;

--update b_user set uemail=replace(uemail,'qq.com','@qq.com');

insert into b_user(usid,uemail,upassword) values(seq_usid.nextval,'1506173890@qq.com','a');
update  b_user set upassword = '6f9b0a55df8ac28564cb9f63a10be8af6ab3f7c2';

update b_user set uname = '星空浪漫' , ubirthday = '1999-11-1' , uphone = '10086' ,uprofession = '软件编程师' ,upersondesc = '我是非常叼炸天的，别小看我哦！' where usid = 10007;
update b_user set uaddress = '湖南省-衡阳市-珠晖区' where usid = 10007;
insert into b_user(usid,uemail,upassword) values(seq_usid.nextval,'123@qq.com','6f9b0a55df8ac28564cb9f63a10be8af6ab3f7c2');

select * from b_user;
delete b_user where usid = 10153;

create sequence seq_adid start with 1001;
-----管理员表
create table b_admin(
       adid int primary key,              --管理员id 
       adname varchar2(30) not null unique,      --管理员名称
       adpassword varchar2(50) default '6f9b0a55df8ac28564cb9f63a10be8af6ab3f7c2',   --管理员密码 (默认值为 a)
       admail varchar2(50) not null unique --添加管理员邮箱（忘记密码登录）
);
 update b_admin set  admail='2576096522@qq.com' where adname='admin'
 truncate table B_ADMIN;--删除表数据
 alter table b_admin add (admail varchar2(50) not null unique);--添加管理员邮箱（忘记密码登录）

--插入管理员数据
insert into B_ADMIN values(seq_adid.nextval,'admin','a'),'2576096522@qq.com');
select * from B_ADMIN;
-----修改字段
alter table B_ADMIN modify adpassword varchar2(50);

update  B_ADMIN set adpassword = '6f9b0a55df8ac28564cb9f63a10be8af6ab3f7c2';

-----文章所属类型（原创，转载，翻译） 1 2 3 
create table b_type(
       tid int primary key,
       tname varchar2(20)
);
create sequence seq_tid start with 4;
--插入文章类型
insert into b_type
select 1 , '原创' from dual union
select 2 , '转载' from dual union
select 3 , '翻译' from dual;

select * from B_TYPE;
-----文章标签类别表 
create table b_tag(
       tagid int primary key,      			 		--标签id
       tusid int references b_user(usid),			--用户id
       tagname varchar2(10) not null ,         --标签名称
);
-----------为文章表签表添加一个字段
alter table b_tag add tusid int references b_user(usid);
--修改文章标签的约束
alter table b_tag modify tagname  not null ,
-----------------------------------
--
update b_tag set   tusid=10151

--创建序列
create  sequence seq_tagid start with 1;

select  * from b_tag;

insert into b_tag values(seq_tagid.nextval,'oracle');
insert into b_tag values(seq_tagid.nextval,'spring');
insert into b_tag values(seq_tagid.nextval,'jsp');
insert into b_tag values(seq_tagid.nextval,'java');
insert into b_tag values(seq_tagid.nextval,'mysql');


select count(1) from b_tag where tagname='java'

create sequence seq_aid start with 1;
-----文章内容表
create table b_article(
       aid int primary key,               --文章id
       atitle varchar2(20) not null,      --文章标题
       tid int references b_type(tid),   --文章所属类型（原创，转载，翻译） 1 2 3 
       tagid int references b_tag(tagid),    --文章标签
       usid int references b_user(usid),     --文章作者
       atime varchar2(30),                --文章创作时间
       acontent varchar2(800),            --文章文本内容
       apic varchar2(200),                --文章图片  
       aviewnum varchar2(10)            --文章浏览量
);
insert into b_article values(seq_aid.nextval,'java编程',1,1,10001,
to_char(sysdate,'yyyy-MM-dd hh:mm:ss'),'java是面向对象的一种编程，由属性和方法组成。Java对c的有点是不适用指针，实现跨区域','',0);
alter table b_article modify acontent varchar2(2000) ;


-----更改时间
update b_article set atime = to_char(sysdate,'yyyy-MM-dd hh24:mm:ss') where aid = 122;

update b_article set aviewnum = (aviewnum+10) where usid=10002;

select to_char(sysdate,'yyyy-MM-dd hh:mi:ss')  from dual;

	select * from (
		select t.*, rownum rn  from (select bar.*,bu.uname,bt.tagname,bty.tname,nvl(w.commentnum,0) as commentnum from b_article bar
		inner join b_user bu on bar.usid = bu.usid
		left join b_tag bt on bar.tagid=bt.tagid
		left join b_type bty on bar.tid =bty.tid
		left join (select d.caid,count(1) as commentnum from (
			select caid from B_COMMENT b right join B_ARTICLE ba on ba.aid = b.caid) d group by d.caid) w
			on w.caid = bar.aid order by bar.atime desc) t 
		where 30>=rownum)  
		where rn>20
		
		
	
	
	
-------------------------------更改数据库时区操作
select dbtimezone from dual;
select systimestamp from dual; 
alter database set time_zone = '+08:00';

select sessiontimezone from dual;
----------------------------------------------

------------------------------------文章热度查询
	select * from (select bar.*,bu.uname,bt.tagname,bty.tname,nvl(w.commentnum,0) as commentnum from b_article bar
		left join b_user bu on bar.usid = bu.usid
		left join b_tag bt on bar.tagid=bt.tagid
		left join b_type bty on bar.tid =bty.tid
		left join (select d.caid,count(1) as commentnum from (
			select caid from B_COMMENT b inner join B_ARTICLE ba on ba.aid = b.caid) d group by d.caid) w
			on w.caid = bar.aid order by bar.aviewnum desc) where rownum <=6;
-------------------------------------浏览量的自加			
select aviewnum from b_article where aid = 181;	
update B_ARTICLE set aviewnum = (aviewnum+1) where aid =181;

select to_char(sysdate,'yyyy-MM-dd hh:mm:ss') hr from dual;
insert into b_article(aid,atitle,tid,tagid,usid,atime,aviewnum,acontent) values(seq_aid.nextval,'java的基本介绍',1,1,10002,
			'2017-4-1','30','常常是彼此交换名片，然后郑重或是出于礼貌用手机记下对方的电话号'); 
insert into b_article(aid,atitle,tid,tagid,usid,atime,aviewnum,acontent) values(seq_aid.nextval,'oracle的基本介绍',1,1,10002,
			'2017-4-1','50','oracle数据库'); 
insert into b_article(aid,atitle,tid,tagid,usid,atime,aviewnum,acontent) values(seq_aid.nextval,'spring的基本介绍',1,2,10002,
			'2017-4-1','60','spring:一个开源的框架；  包含：IOC(控制反转)/DI（依赖注入） 和 面向切面编程'); 
insert into b_article(aid,atitle,tid,tagid,usid,atime,aviewnum,acontent) values(seq_aid.nextval,'aop的作用',1,3,10003,
			'2017-4-1','40','主要有两点：1.解决代码的混乱问题2.代码的分散问题'); 
insert into b_article(aid,atitle,tid,tagid,usid,atime,aviewnum,acontent) values(seq_aid.nextval,'事务的特性',1,4,10003,
			'2017-4-1','40','1. 原子性 2. 一致性 3. 隔离性  4. 持久性'); 
			
insert into b_article(aid,atitle,tid,tagid,usid,atime,aviewnum,acontent,apic) values(seq_aid.nextval,'事务的特性',1,4,10003,
			'2017-4-1','40','1. 原子性 2. 一致性 3. 隔离性  4. 持久性',''); 
select * from b_article;

delete from B_ARTICLE where atime = '2017-4-1'

select count(1) total,ceil(count(1)/5) from B_ARTICLE where usid =10007;



--查询当前时间
select to_char(sysdate,'yyyy-MM-dd hh:mm:ss') from dual;

--修改字段属性，aviewnum 默认值为0
alter table b_article modify (aviewnum varchar2(10) default '0');

select count(1) from b_article a inner join b_tag t on a.tagid = t.tagid

------------------分页查询所有（通过个人id）
select * from ( select n.*,rownum rn
		from(
		select bar.* ,nvl(w.commentnum,0) as commentnum  from
		(select
		d.caid,count(1) as commentnum from (select caid from B_COMMENT b
		inner join B_ARTICLE ba on ba.aid = b.caid) d group by d.caid) w
		right join
		B_ARTICLE bar on w.caid = bar.aid order by bar.atime desc) n where
		5>=rownum
		and n.usid = 10007 ) t where rn>0

select count(1) from (select b.caid , b.* from B_COMMENT b inner join B_ARTICLE ba on ba.aid = b.caid) d group by d.caid  ;		

 
-----评论表
create sequence seq_cid start with 1 increment by 1;
create table b_comment(
       cid int primary key,               --评论id
       caid int references b_article(aid) on delete cascade,--评论文章id
       usid int references b_user(usid),     --评论者id
       ccontent varchar2(800),            --评论内容
       ctime varchar2(30)              --评论时间
);
select b.*,t.*,bu.uname from b_comment b inner join (select aid,atime from B_ARTICLE where usid = 10007) t on b.caid = t.aid
								inner join B_USER bu on b.usid = bu.usid;

select count(1) from (select * from B_COMMENT b inner join (select aid from B_ARTICLE where usid = 10007) t	on b.caid = t.aid);

select * from b_comment;
								
-----修改字段
alter table b_comment modify ctime varchar2(30);

--------插入评论表数据
insert into B_COMMENT values(seq_cid.nextval,122,10007,'这篇文章非常棒！！','2017-4-11 21:55:33');
insert into B_COMMENT values(seq_cid.nextval,123,10007,'这篇文章是真的！！','2017-4-13 21:55:33');
insert into B_COMMENT values(seq_cid.nextval,41,10007,'这篇文章非常棒12！！','2017-4-12 21:55:33');
insert into B_COMMENT values(seq_cid.nextval,46,10007,'这篇文章非常棒123！！','2017-4-11 21:55:33');

select b.*,rownum from B_COMMENT b;

------------------分页查询评论表
	select * from (
		select t.*, rownum rn from (
		select b.*,bu.uname,bu.upic from b_comment b 
		inner join b_user bu on bu.usid = b.usid order by b.ctime) t 
		where 4>=rownum and t.caid = 181 )  
		where rn>2
	
------删除文章表的同时删除评论
delete from B_ARTICLE where aid = 41 ;
select * from (select
		n.*,rownum rn from (select ba.*, bu.uname,bt.tagname,bty.tname from
		b_article ba
		inner join b_user bu on ba.usid = bu.usid
		inner join b_tag bt on ba.tagid=bt.tagid
		inner join b_type bty on ba.tid =bty.tid order by 1 )n where
		5>=rownum and n.usid = 10007) t where rn>1
		
select count(1) from (select b.caid , b.* from B_COMMENT b inner join B_ARTICLE ba on ba.aid = b.caid) d group by d.caid  ;		

---------连接评论表获取评论数，指定用户
select * from ( select n.*,rownum rn from(
select bar.* ,nvl(w.commentnum,0) as commentnum from
(select d.caid,count(1) as commentnum from (select caid from B_COMMENT b inner join B_ARTICLE ba on ba.aid = b.caid) d group by d.caid) w 
right join B_ARTICLE bar on w.caid = bar.aid order by w.caid) n where 5>=rownum and n.usid =10007) t where rn>0;

create sequence seq_drid start with 1 increment by 1;
-----草稿箱
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

insert into b_drafets values(seq_drid.nextval,10007,'你好',1,2,'2017-04-12','hello world!','/upload/a1.jpg');


--博客专栏
create sequence seq_coid start with 1;
create table b_column(
       coid int primary key,               --专栏id
       cotitle  varchar2(40) not null,      --专栏标题
     cocontent varchar2(100) ,  --专栏说明
       usid int references b_user(usid) not null,     --专栏创建者id
       cotime varchar2(40),                --专栏创建时间
       coaid varchar2(200),				--专栏里面所有文章的id
       copic varchar2(600),                --专栏图片  
       coviewnum  int  default 0 ,       --专栏浏览量
       articlenum int  default 0 -- 文章数
);
insert into b_column values(seq_coid.nextval,'三大框架的实现','三大框架包含：spring,springmvc,mybatis',10001,to_char(sysdate,'yyyy-MM-dd hh24:mm:ss'),'','',0);
insert into b_column values(seq_coid.nextval,'b/s模型','b/s模型包含：jsp,servlet,maven,oracle',10008,to_char(sysdate,'yyyy-MM-dd hh:mm:ss'),'','',0);
alter table b_column add articlenum int  default 0; --添加字段 文章数
alter table B_COLUMN modify cotitle varchar2(40);

update B_ARTICLE set aviewnum = (aviewnum+1) where aid =181;

select * from B_ADMIN;--管理员
select * from B_COMMENT;--评论
select  * from b_article;--文章
select * from B_TAG;--标签
select * from B_TYPE;--类型
select  * from B_USER;--用户
select  * from b_drafets;--草稿
select * from b_column;--专栏

drop table b_admin;
drop table b_article;
drop table b_type;   
drop table b_tag;  
drop table b_comment;
drop table b_DRAFETS;
drop table b_user;
drop table b_column;

drop sequence seq_usid;
drop sequence seq_adid;
drop sequence seq_aid;
drop sequence seq_cid;
drop sequence seq_drid;
drop sequence seq_tid;
drop sequence seq_tagid;
drop sequence seq_coid;
select * from b_article  where atitle like '%设计%';
select b.*,nvl(n.articlenum,0) from B_TYPE b left join (select tid,count(1) articlenum from b_article group by tid) n on b.tid = n.tid
select tid,count(1) articlenum from b_article group by tid


select tag.*,nvl(w.articlenum,0) as articlenum from
		(select g.tagid,count(1) as articlenum from
		(select t.tagid from b_tag t inner join b_article a on t.tagid = a.tagid ) g
		group by g.tagid) w
		right join B_TAG tag on w.tagid = tag.tagid order
		by w.tagid

		
		select  sysdate from dual;