create database use_count;
use use_count;

create table customer(
id_customer int primary key auto_increment,
name_customer varchar(255),
name_contract varchar(255),
address varchar(255),
city varchar(45),
postal_code varchar(45),
country varchar(45)
);
insert into customer(name_customer,name_contract,address,city,postal_code,country)
value	('Alfreds Futterkiste','Maria Anders','Obere Str. 57','Berlin','12209','Germany'),
		('Ana Trujillo Emparedados y helados','Ana Trujillo','Avda. de la Constitución 2222','México D.F.','05021','Mexico'),
        ('Antonio Moreno Taquería','Antonio Moreno','Mataderos 2312','México D.F.','05023','Mexico'),
        ('Around the Horn','Thomas Hardy','120 Hanover Sq','London','WA1 1DP','	UK');
        
     select*from customer;   
     
     -- use SQL limit
     -- sử dụng limit để chỉ rõ số dòng sẽ được trả về
     -- limit(n,m)
     -- n: bỏ giá trị đầu. vd: limit 2,3 . bỏ đi dòng 1,2. In ra 3 dòng kế tiếp.
     -- m,: số dòng muốn in ra
     select* from customer
     limit 2,3;
     