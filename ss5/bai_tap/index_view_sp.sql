create database view_index_sp_product;
use view_index_sp_product;
 create table product(
id_product int primary key auto_increment,
code_product int,
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
        
-- bước 3:
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create index index_code_product
on product(code_product);
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index index_composite
on product(name_product,price);
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select * 
from product
where code_product= 003;
-- So sánh câu truy vấn trước và sau khi tạo index
select * from product
where code_product=003;

explain select * 
from product
where code_product= 003;

-- Bước 4:
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view v_product (code_product,name_product,price,status_product) as
select code_product,name_product,price,status_product
from product;
-- Tiến hành sửa đổi view
select * from v_product;
update v_product
set price=16000
where code_product=2;
-- Tiến hành xoá view
drop view v_product;

-- Bước 5:
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure
display_product()
begin
select * from product;
end // 
delimiter ;
call display_product();
-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure insert_into(
`code` int,
`name` varchar(50),
price double,
amount int,
`description` varchar(255),
`status` bit(1)
)
begin
insert into product
(code_product ,
name_product,
price ,
amount ,
description_product ,
status_product)
value (`code`,`name`,price,amount,`description`,`status`);
end //
delimiter ;
-- Tạo store procedure sửa thông tin sản phẩm theo id

delimiter //
create procedure update_by_id(id int)
begin
set sql_safe_updates=0;
update product 
set name_product='Banh mi 2 trung'
where id_product= id;
set sql_safe_updates=1;
end //
delimiter ;
call update_by_id(2);
select * from product;

-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure delete_by_id(id int)
begin
set sql_safe_updates=0;
delete from product 
where id_product= id;
set sql_safe_updates=1;
end //
delimiter ;