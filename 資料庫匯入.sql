--�إ߸�Ʈw:
create database Drink;

--�إ߸�ƪ�:
use Drink;

------------------------------ �|�� ------------------------------

--�R�����
drop table SQLMemberID
drop table SQLMemberData;
drop table SQLMemberDataVendor;

--�}���
create table SQLMemberID(
UserID varchar(50) not null PRIMARY KEY,--�b��
UserPaws varchar(50) not null,--�K�X
ClassMember varchar(10) not null,--���O
VAT varchar(10), --�νs
Email varchar(50),
picture varbinary(max))

create table SQLMemberData(
UserID varchar(50) not null,--�b��
Name varchar(50) ,--�m�W
Birthday varchar(10)) --�ͤ�

create table SQLMemberDataVendor(
UserID varchar(50) not null,--�b��
Vendor varchar(50) ,--���~�W��
Principal varchar(10) ,--�t�d�H
Address varchar(50))--�a�}

-------------------------------
------------------------------------------------------------------------------------------------------
--�[�J���
--ClassMember �ϥΪ����O a:�@�� b:���~ c:���a d:���u fa:�@��|���ѰO�K�X���ק� fb:���~�|���ѰO�K�X���ק�
--UserID �Ϫ̱b��, UserPaws �ϥΪ̱K�X, ClassMember �ϥΪ����O, VAT �Τ@�s��, Email
insert into SQLMemberID (UserID, UserPaws, ClassMember, Email) values ('admin', 'admin', 'gm','ordermealsystem@gmail.com');

insert into SQLMemberID (UserID, UserPaws, ClassMember, Email) values ('a123456', 'a123', 'a','asbill920166@gmail.com');
insert into SQLMemberID (UserID, UserPaws, ClassMember, Email) values ('asd546666', 'a123', 'a','asd546666@gmail.com');
insert into SQLMemberID (UserID, UserPaws, ClassMember, Email) values ('qwe124532', 'a123', 'a','addd2121@gmail.com');
insert into SQLMemberID (UserID, UserPaws, ClassMember, Email) values ('gff7655666', 'a123', 'a','dsa5566655333@gmail.com');
insert into SQLMemberID (UserID, UserPaws, ClassMember, Email) values ('dsa1321323', 'a123', 'a','asd546666@gmail.com');
insert into SQLMemberID (UserID, UserPaws, ClassMember, Email) values ('gg123456', 'a123', 'a','ordermealsystem@gmail.com');

insert into SQLMemberID (UserID, UserPaws, ClassMember, Email) values ('dhggg1321323', 'a123', 'a','dhggg1321323@gmail.com');
insert into SQLMemberID (UserID, UserPaws, ClassMember, Email) values ('dfff321323', 'a123', 'a','dfff321323@gmail.com');
insert into SQLMemberID (UserID, UserPaws, ClassMember, Email) values ('ggsds1323', 'a123', 'a','ggsds1323@gmail.com');
insert into SQLMemberID (UserID, UserPaws, ClassMember, Email) values ('dfasdsa21323', 'a123', 'a','dfasdsa21323@gmail.com');


insert into SQLMemberID (UserID, UserPaws, ClassMember, VAT, Email) values ('b123456', 'a123', 'b','12345678','ordermealsystem@gmail.com');
insert into SQLMemberID (UserID, UserPaws, ClassMember, VAT, Email) values ('g656666', 'a123', 'b','2343683','hgfs23443@gmail.com');
insert into SQLMemberID (UserID, UserPaws, ClassMember, VAT, Email) values ('jg12333213', 'a123', 'b','1413264','trtr234555@gmail.com');
insert into SQLMemberID (UserID, UserPaws, ClassMember, VAT, Email) values ('ff1245555423', 'a123', 'b','13213222','dsadd23333@gmail.com');

--UserID �Ϫ̱b��, Name �Ϫ̦W�l, Birthday �ͤ�
insert into SQLMemberData (UserID, Name, Birthday) values ('a123456', '���j��', '2021-07-15');
insert into SQLMemberData (UserID, Name, Birthday) values ('asd546666', '�����s', '2000-02-10');
insert into SQLMemberData (UserID, Name, Birthday) values ('qwe124532', '���a��', '1999-04-08');
insert into SQLMemberData (UserID, Name, Birthday) values ('gff7655666', '�M�|��', '1997-05-15');
insert into SQLMemberData (UserID, Name, Birthday) values ('dsa1321323', '�����g', '2021-07-10');
insert into SQLMemberData (UserID, Name, Birthday) values ('gg123456', '�[���', '1996-03-21');

insert into SQLMemberData (UserID, Name, Birthday) values ('dhggg1321323', '�Q�s��', '1990-01-31');
insert into SQLMemberData (UserID, Name, Birthday) values ('dfff321323', '�I�a��', '1992-02-12');
insert into SQLMemberData (UserID, Name, Birthday) values ('ggsds1323', '�dĬ��', '1996-09-01');
insert into SQLMemberData (UserID, Name, Birthday) values ('dfasdsa21323', '���b��', '2021-09-01');

--UserID �Ϫ̱b��,Vendor ���~�W��,Principal �t�d�H,Address �a�}
insert into SQLMemberDataVendor (UserID, Vendor,Principal ,Address) values ('b123456', 'III���', 'Ted','��饫���c�Ϥ��j��300��');
insert into SQLMemberDataVendor (UserID, Vendor,Principal ,Address) values ('g656666', 'TAT', 'Alax','�x������Ϭ������@�q22��7�Ӥ�3');
insert into SQLMemberDataVendor (UserID, Vendor,Principal ,Address) values ('jg12333213', 'QAQ', 'Fank','�x�_�����s�ϥ��v�F���G�q200��');
insert into SQLMemberDataVendor (UserID, Vendor,Principal ,Address) values ('ff1245555423', 'QQ', 'FH','�������j��ϤE����5��32��43��');




--�d��
select * from SQLMemberID;--�b��
select * from SQLMemberData;--�@��|�����
select * from SQLMemberDataVendor;--���~�|�����

------------------------------ �ʪ��� ------------------------------

--�d��
select * from OrderssItem;
select * from Orderss;
--�R��
  drop table OrderssItem;
  drop table Orderss;

--�q��
create table Orderss(
   OrderssID int identity(1,1) constraint ORD_ORDID_pk primary key ,
   shopcarID  int not null,
   customerID varchar(50) not null,
   customerName varchar(10) not null,
   customerPhone varchar(10) not null,
   storeID int not null,
   shopDate date default getdate() not null,
   storeneworderss varchar(1) not null,
   total numeric not null
   );

   --�q�����
 create table OrderssItem(
   OrderssID int not null,
   OitemID int identity(100,1) not null,
   poructName varchar(100) not null ,
   actualprice numeric ,
   QTY int not null,
   itemtot numeric not null,
   constraint ORDitem_ORDID_itemID_pk primary key(OrderssID,OitemID),
   constraint ORDitem_ORDIDToORD_fk FOREIGN key(OrderssID) REFERENCES Orderss(OrderssID), );







------------------------------ �Q�װ� ------------------------------
create table discuss123
(
ID int identity(10001,1) primary key not null,
UserID varchar(50) not null ,
--���aID
storeid varchar(50) not null ,
--���a�W
title varchar(50) not null,
--���~ID
disOitemID varchar(50) not null,
--�~�W
proname	varchar(50) not null,
--����
drinkDiscuss varchar (50),
--�P�P
drinkstar varchar(20),
)

select * from discuss123;


drop table discuss123;








------------------------------ ���a�β��~ ------------------------------

--�R��store
drop table store

--�R�����~
drop table storeproduct

--���a
	create table store(
	
	storeid numeric(10) identity(1000,1) constraint store_storeid_pk PRIMARY KEY,
	startdate date default getdate(),
	cuserid varchar(50),
	title varchar(50) constraint store_title_nn NOT NULL,
	manager varchar(10) constraint store_manager_nn NOT NULL,
	stadd varchar(80) constraint store_stadd_nn NOT NULL,
	tel varchar(20),
	intro varchar(200),
	photo varbinary(max)
	)


--���~
create table storeproduct(
proid numeric(10) identity(100,1) constraint storeproduct_proid_pk PRIMARY KEY,
pstartdate date default getdate(),
pstoreid numeric(10),
proname varchar(50) constraint storeproduct_proname_nn NOT NULL,
proprice int constraint storeproduct_proprice_nn NOT NULL,
category varchar(50),
pintro varchar(200),
pphoto varbinary(max)
)



--�d��store
select *
from store

--�d��product
select *
from storeproduct



------------------------------ ���� ------------------------------

--�d�߭��ɯS����ƪ�
select * from Activity;

--�R�����ɯS����ƪ�
drop table Activity;

--�s�W���ɯS����ƪ�
create table Activity(
	-- ID �۰ʥͦ��A�q1000 �}�l�A�� PK
	activityid int identity(1000,1) constraint activity_activityid_pk primary key,
	-- ���ɯS���D�D�A�̦h30�r
	activitytopic varchar(30) not null,
	-- ���ɯS���}�l�ɶ��A��J�榡'2020-10-10 13:00:00'
	starttime datetime not null,
	-- ���ɯS�������ɶ��A��J�榡'2020-10-10 13:00:00'
	endtime datetime not null,
	-- ���ɯS�����e�A�̦h500 �r
	activitycontent varchar(500),
	-- ���ɯS���ʭ�
	activityimg varbinary(max),
	-- ���ɯS�����aID
	pstoreid int
);

--���� insert ���

------------------------------

--�d�߯S���ӫ~��ƪ�
select * from ActivityDiscountItem;

--�R���S���ӫ~��ƪ�
drop table ActivityDiscountItem;

--�s�W�S���ӫ~��ƪ�
create table ActivityDiscountItem(
	-- �C�ӧ馩�~��ID �۰ʥͦ��A�q1000 �}�l�A�� PK
	discountid int identity(1000,1) constraint activityDiscountItem_discountid_pk primary key,
	-- ����ID 
	activityid int not null,
	-- �ӫ~ID
	proid int not null,
	-- �ӫ~�W��
	proname	varchar(50) not null,
	-- �ӫ~���
	proprice int not null,
	-- �ӫ~�馩��
	disprice int not null,
	-- �Ӱӫ~���aID
	storeid int
	);


--���ݭn insert ���


------------------------------ NEW--���a�s����� ------------------------------
--�R��storerec
--drop table storerec

create table storerec(
seditid numeric(10) identity(1000000,1) constraint storerec_editid_pk PRIMARY KEY,
cuserid varchar(50),
storeid numeric(10),
editdate smalldatetime default getdate(),
item varchar(25), --�s�W�B�R���B�s��
detail varchar(100)
)

--�d��storeRec

select *
from storerec


