create database customtransaction;
use customtransaction;
create table product(
productid int primary key auto_increment,
productname varchar(30),
productcost decimal(13,2),
category varchar(30));

create table merchant(
merchantid int primary key auto_increment,
merchantname varchar(30),
email varchar(60),
password varchar(30));

create table transactions(
transactionid int primary key auto_increment,
custid int,
custname varchar(30),
merchantid int,
billingaddress text,
timestamps timestamp ,
pincode int,
foreign key (merchantid) references merchant(merchantid)
);

create table transactioncart(
tpid int not null primary key auto_increment,
transactionid int,
productid int,
quantity int,
foreign key (productid) references product(productid),
foreign key (transactionid) references transactions(transactionid));

alter table transactioncart auto_increment=101;

create table merchantpreferences(
merchantid int,
pincode bigint,
upperlimit int,
lowerlimit int,
custname varchar(30),
foreign key (merchantid) references merchant(merchantid));

alter table merchant auto_increment=1001;
alter table product auto_increment=1111;
alter table transactions auto_increment=1234;
alter table merchantpreferences add column mpid int primary key not null auto_increment first;

show tables;

desc product;
desc merchant;
desc transactions;
desc merchantpreferences;
desc transactionproduct;




insert into merchant(merchantname,email,password) 
values("Siddhant","Siddhant@gmail.com","Siddhant123"),
("Amit","Amit@gmail.com","Amit123"),
("Saif","ms@gmail.com","saif123"),
("Ratna","ratna@gmail.com","ratn123");

insert into product(productname, productcost,category) 
values ("Shoes",2999,"Footwears"),
("Mobile",90000,"Electronics"),
("Goggles",2000,"Fashion"),
("Kurta",8000,"Clothings"),
("Ring",50000,"Jwellery"),
("Refrigerator",69999,"Electronics"),
("Car",200000,"Veichles"),
("Jeans",200,"Clothings"),
("bracelet",1000,"Jwellery");

insert into transactions(merchantid,custid,custname,billingaddress,timestamps,pincode) 
values(1001,11,"ram",'Nashik',"2021-08-13 12:00:06",422009),
(1002,12,"rahul",'Mumbai',"2000-02-12 12:01:07",456278),
(1003,13,"amit",'Delhi',"2002-01-31 07:00:06",576234),
(1004,14,"ratna",'Hyderabad',"2022-02-12 01:02:06",123897),
(1004,11,"ram",'Nashik',"2021-08-30 05:00:06",422009),
(1002,16,"sujit",'chennai',"2008-12-31 12:00:06",765456);

insert into transactioncart(transactionid,productid,quantity) values
(1236,1112,300),
(1237,1114,180),
(1238,1111,20),
(1239,1113,220),
(1236,1114,120);

insert into merchantpreferences values(1002,208017,0,0,'sid');

select * from merchant;

select * from transactions;

select * from transactions where timestamps between '2000-02-12 12:01:07' and '2021-08-13 12:00:06';



select * from transactions t1 inner join transactioncart t2  on  t1.transactionid = t2.transactionid inner join  product p on p.productid = t2.productid;


select * from  transactioncart t2 inner join  product p on p.productid = t2.productid;