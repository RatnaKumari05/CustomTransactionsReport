create database customtransaction;
use customtransaction;
create table product(
productid int primary key auto_increment,
productname varchar(30),
productcost decimal(13,2),
quantity int,
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
transactionamount decimal(13,2),
foreign key (merchantid) references merchant(merchantid)
);

create table transactioncart(
tpid int not null primary key auto_increment,
transactionid int,
productid int,
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

drop table merchant;
drop table transactions;
drop table product;
drop table merchantpreferences;
drop table transactioncart;
show tables;


insert into merchant(merchantname,email,password) 
values("Siddhant","Siddhant@gmail.com","Siddhant123"),
("Amit","Amit@gmail.com","Amit123"),
("Saif","ms@gmail.com","saif123"),
("Ratna","ratna@gmail.com","ratn123");

insert into product(productname, productcost,category,quantity) 
values ("Shoes",2999,"Footwears",20),
("Mobile",90000,"Electronics",30),
("Goggles",200,"Fashion",10),
("Kurta",8000,"Clothings",120),
("Ring",50000,"Jwellery",130),
("Refrigerator",69999,"Electronics",120),
("Car",200000,"Veichles",110),
("Jeans",200,"Clothings",140),
("bracelet",1000,"Jwellery",145);

insert into transactions(merchantid,custid,custname,billingaddress,timestamps,pincode,transactionamount) 
values(1004,14,"ratna",'Hyderabad',"2022-02-12 01:02:06",123897,960000),
(1004,11,"ram",'Nashik',"2021-08-30 05:00:06",422009,28000),
(1004,12,"Ankush",'Delhi',"2011-08-30 05:00:06",422004,280000),
(1004,12,"Anil",'Chennai',"2002-07-30 05:00:06",422005,2000),
(1004,14,"alok",'Mumbai',"2021-08-30 05:00:06",422001,40000),
(1004,12,"sid",'pune',"2021-08-30 05:00:06",433009,100000),
(1004,14,"sanjay",'Ratnagiri',"2021-08-30 05:00:06",422007,2800000);


insert into transactioncart(transactionid,productid) values
(1236,1112),
(1237,1114),
(1238,1111),
(1239,1113);


insert into merchantpreferences values(1,1003,576234,1,10000,'amit');
insert into merchantpreferences values(2,1002,456278,1,10000,'rahul');

select * from merchant;
select * from merchantpreferences;
select * from transactions;
select * from product;
select * from transactioncart;




select * from transactions where timestamps between '2000-02-12 12:01:07' and '2021-08-13 12:00:06';
select * from transactions t where t.merchantid=1004 and transactionamount > 10000 and transactionamount < 300 and t.custname='ram' and t.pincode=422009 ;