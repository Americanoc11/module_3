create database ss5_demo;
use ss5_demo;
 create table products(
id int primary key auto_increment,
code_product int unique,
name_product varchar(45),
price double,
amount int,
description_product varchar(255),
status_product bit(1)
);
insert into products(code_product,name_product,price,amount,description_product,status_product)
value 	(001,'Bánh my',3000,10,'Bánh mì không',1),
		(002,'Bánh mỳ ốp la',13000,10,' trứng',1),
		(003,'Bánh mỳ thịt chả',16000,10,'thịt chả',1),
        (004,'Bánh mỳ thịt nướng',16000,10,'thịt nướng',1);
-- step 3        
-- before
explain select name_product from products
where name_product='Bánh mì thịt chả';
-- after
create index name_product
on products(name_product);
create index price
on products(price);
explain select name_product from products
where name_product='Bánh mì thịt chả';
-- Befor create index
-- nó sẽ duyệt từng dòng đến ô cần tìm.
--  vd : name_product='Bánh mì thịt chả'
-- nó sẽ duyệt qua 12 dòng nếu không tính id . filtered: 33.33
-- After create index
-- nó sẽ đến cột đó và chỉ thẳng đến cột đang chứa giá trị . filtered: 100.00

-- step 4
create view v_products(code_product,name_product,price,status_product) as
select code_product,name_product,price,status_product from products;
select*from v_products;

-- edit view
set sql_safe_updates=0;
update v_products
 set price= '4000'
 where code_product=2;
 select*from v_products;
 select*from products;
drop view v_products;

-- step 5
-- creat sp 
delimiter //
create procedure
display_information(
id int,
code_product int,
name_product varchar(45),
price double,
amount int,
description_product varchar(255),
status_product bit(1)
)
begin
select*from products;
end //
delimiter ;

-- create sp add product
delimiter //
create procedure
add_product(
id int,
code_product int,
name_product varchar(45),
price double,
amount int,
description_product varchar(255),
status_product bit(1)
)
begin
insert into products
value	(),
		(),
        (),
        (),
        (),
        (),
        ();
end //
delimiter ;

-- create sp edit product
delimiter //
create procedure
edit_product(name_product varchar(45))
begin
 set name_product= (select name_product from products p
					where p.name_product= name_product);
end //
delimiter ;

-- create sp detele product by id
delimiter //
create procedure
edit_product(id int,name_product varchar(45))
begin
 delete from products
 where id=1 and 'Bánh mỳ thịt chả';
end // 
delimiter ;

