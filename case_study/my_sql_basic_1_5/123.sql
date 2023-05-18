create database product_management_web;
use product_management_web;

create table supplier(
supplier_id int primary key auto_increment,
name_supplier varchar(100),
address varchar(200),
phone varchar(11),
logo varchar(200)
);
insert into supplier(name_supplier,address,phone,logo)
value 	
("ADIDAS"	    ,"Bến Tre"	    ,"01697638366"	,"images/logo2.jpg"),
("ASICS TIGER"	,"TRUNG QUỐC"	,"0987232232"	,"image/logolining.jpg"),
("BALANCE"	    ,"Bình Thuận"	,"0983067225"	,"images/logo3.jpg"),
("Converse"	    ,"Việt Nam"	    ,"0987232232"	,"image/logolining.jpg"),
("Fila"      	,"Đức"	        ,"0987232232"	,"image/logolining.jpg"),
("K-SWISSS"	    ,"Nhật Bản"  	,"0987232232"	,"image/logolining.jpg"),
("LINING"	    ,"HÀN QUỐC"  	,"0987232232"	,"image/logolining.jpg"),
("NEAKER"	    ,"Lâm Đồng"	    ,"0983067226"	,"images/logo4.jpg"),
("NIKED"	    ,"Long An"	    ,"0983067224"	,"images/logo1.jpg"),
("Puma"	        ,"Italya"	    ,"0987232232"	,"image/logolining.jpg"),
("Reebok"	    ,"Mỹ"	        ,"0987232232"	,"image/logolining.jpg");

create table type_product(
type_product_id int primary key auto_increment,
name_type varchar(50),
supplier_id int,
`describe` varchar(200),
foreign key (supplier_id) references supplier(supplier_id)
);
insert into type_product(name_type,supplier_id,`describe`)
value
('Đi chơi'	,1	,'Dùng để đi chơi những nơi sang trọn'),
('Thể thao'	,9	,'Dùng để tập thể dục');


create table product(
product_id int primary key auto_increment,
name_product varchar(100),
price_discount bigint,
price bigint,
amount int,
supplier_id int,
type_product_id int,
image varchar(500),
import_quantity int,
quantity_sold int,
foreign key ( supplier_id) references supplier(supplier_id),
foreign key (type_product_id) references type_product(type_product_id)
);
insert into product 
(name_product,price_discount,price,amount,supplier_id,type_product_id,image,import_quantity,quantity_sold)
value
("ADIDAS trắng"	        ,500000	    ,700000	    ,2	,1	,1 ,"images/s12.jpg",12	,3),
("ASICS TIGER trắng" 	,1300000	,1300000	,2	,9	,2 ,"images/s12.jpg",22	,6),
("ASICS TIGER vàng"	    ,500000	    ,500000	    ,23	,1	,2 ,"images/s12.jpg",34	,12),
("ASICS TIGER cam"      ,700000	    ,700000	    ,2	,2	,1 ,"images/s12.jpg",34	,2),
("New balance đen"	    ,600000	    ,600000	    ,2	,3	,1 ,"images/s12.jpg",35	,2),
("CONVERSE đen-trắng"	,800000	    ,900000	    ,2	,9	,2 ,"images/s12.jpg",12	,4),
("Fila vàng"	        ,50000	    ,500000	    ,50	,5	,2 ,"images/s12.jpg",50	,3),
("K-SWISS đen"	        ,500000	    ,500000	    ,45	,3	,1 ,"images/s12.jpg",45	,2),
("Li-ning đỏ-xám"	    ,1200000	,1300000	,2	,9	,1 ,"images/s12.jpg",19	,5),
("Li-ning đen"	        ,600000	    ,600000	    ,45	,9	,1,"images/s12.jpg"	,34	,1),
("Li-ning đen-trắng"	,1100000	,1200000	,2	,7	,2,"images/s12.jpg"	,23	,2),
("NIKED  xám"	        ,1000000	,1000000	,2	,9	,2,"images/s12.jpg"	,45	,2),
("Puma cam"	            ,1300000	,1300000	,2	,11	,2,"images/s12.jpg"	,45	,2),
("PUMA xịn đỏ"	        ,900000	    ,1000000	,2	,10	,1,"images/s12.jpg"	,65	,5),
("REEBOK trắng"	        ,200000	    ,200000	    ,2	,11 ,2,"images/s12.jpg"	,10	,1);

create table product_details(
product_id int,
describe_1 varchar(200),
describe_2 varchar(200),
describe_3 varchar(200),
describe_4 varchar(200),
describe_5 varchar(200),
image_details varchar(500),
foreign key (product_id) references product(product_id)
);
insert into product_details(product_id)
value (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15);

create table `account` (
account_user varchar(100) primary key,
password_user varchar(50),
user_name varchar(50),
gender bit,
phone varchar(50),
email varchar(250),
date_of_birth date,
address varchar(200),
amount_purchases int,
`role` varchar(50)
);
insert into `account`
(account_user,password_user,user_name,gender,phone,email,date_of_birth,address,amount_purchases,`role`)
value
("anhdinh"	    ,"anhdinh11" 	,"Nguyễn Thị Anh Đình"	,0	    ,"0983452134"	,"anhdinh@gmail.com"         	,"1997-8-23"	,"Quận 7"	,1	,"customer"),
("hiendi"	    ,"hiendi11"	    ,"Lê Hiên Di"	        ,0	    ,"01643023456"	,"vothituyetphuong11@gmail.com"	,"1998-1-6" 	,"Quận 5"	,3	,"customer"),
("hientran"	    ,"hientran11"	,"Trần Thị Hiền"     	,0	    ,"016430813550"	,"hientran@gmail.com"	        ,"1997-5-5"	    ,"Quận 9"	,1	,"customer"),
("lephong"	    ,"lephong11"	,"Nguyễn Lê Phong"	    ,1	    ,"01643081355"	,"lephong@gmail.com"	        ,"1997-1-3" 	,"Quận 2"	,5	,"customer"),
("nguyentanhau"	,"1234567"	    ,"hau"	                ,1	    ,"0966490297"	,"15130052@st.hcmuaf.edu.vn"	,"2017-6-24"	,"vcxzcvxz"	,0	,"admin"),
("thuyhang"	    ,"thuyhang11"	,"Trần Thị Thúy Hằng"	,0	    ,"0958762121"	,"thuyhang@gmail.com"	        ,"1998-9-11"	,"Quận 10"	,1	,"customer"),
("trongtin"	    ,"trongtin11"	,"Lê Trọng Tín"	        ,1	    ,"01697638366"	,"bbq11@gmail.com"	            ,"1995-10-23"   ,"Lâm Đồng"	,6	,"customer"),
("tronguy"	    ,"tronguy11"	,"Lê Trọng Uy"      	,1	    ,"0981234657"	,"tronguy@gmail.com"	        ,"1997-1-7"	    ,"Quận 6"	,2	,"customer"),
("tuyetphuong"	,"tuytphuong11"	,"Võ Thị Tuyết Phương"	,0	    ,"01697638366"	,"15130052@st.hcmuaf.edu.vn"	,"1997-10-15"	,"TPHCM"	,2  ,"khach");

create table orders(
orders_id int primary key auto_increment,
customer_name varchar(100),
product_list_id int,
amount_total int,
total bigint,
day_start date,
phone varchar(11),
email varchar(250),
status_orders tinyint(1),
foreign key (phone) references `account` (phone),
foreign key (email) references `account` (email)
);

