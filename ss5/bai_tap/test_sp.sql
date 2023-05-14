create database demo_sp;
use demo_sp;
 create table product(
id int primary key auto_increment,
code_product int unique,
name_product varchar(45),
price double,
amount int,
description_product varchar(255),
status_product bit(1)
);
insert into product(code_product,name_product,price,amount,description_product,status_product)
value 	(001,'Bánh my',3000,10,'Bánh mì không',1),
		(002,'Bánh mỳ ốp la',13000,10,' trứng',1),
		(003,'Bánh mỳ thịt chả',16000,10,'thịt chả',1),
        (004,'Bánh mỳ thịt nướng',16000,10,'thịt nướng',1);
        select*from product;
delimiter //
-- display
create procedure
display_product()
begin
select * from product;
end; // 
delimiter ;
call display_product();

-- insert
delimiter //
create procedure
insert_student(
id int,
code_product int ,
name_product varchar(45),
price double,
amount int,
description_product varchar(255),
status_product bit(1))
begin
insert into product (
id ,
code_product  ,
name_product ,
price ,
amount ,
description_product ,
status_product
 )

value (
id ,
code_product  ,
name_product ,
price ,
amount ,
description_product ,
status_product 
);
end;
//delimiter ;
call insert_student(6,005,'Bánh my cá',13000,10,'Bánh mì cá',1)

-- update
delimiter //
create procedure
update_student(
id int,
code_product int ,
name_product varchar(45),
price double,
amount int,
description_product varchar(255),
status_product bit(1))
begin
update product
set
code_product=code_product ,
name_product=name_product  ,
price =price ,
amount =amount ,
description_product=description_product  ,
status_product=status_product
where @id=id;
end;
//delimiter ;
set sql_safe_updates=0;
call update_student(1,1,'Hampurger',5000,1,'Banh mi khong',1);
call display_product();