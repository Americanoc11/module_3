create database quan_ly_web_mua_ban_laptop;
use quan_ly_web_mua_ban_laptop;
-- tai khoan
create table roles(
ma_roles int primary key auto_increment,
ten_roles varchar(50) not null
);

create table tai_khoan(
ma_tai_khoan int primary key auto_increment,
ten_tai_khoan varchar(100) unique not null,
mat_khau varchar(50) not null
);
create table nguoi_dung_role(
ma_roles int,
ma_tai_khoan int,
primary key(ma_roles,ma_tai_khoan),
foreign key(ma_roles) references roles(ma_roles),
foreign key(ma_tai_khoan) references tai_khoan(ma_tai_khoan)
);

create table khach_hang(
ma_khach_hang int primary key auto_increment,
ten_khach_hang varchar(100),
email varchar(250) not null,
dien_thoai varchar(12) not null,
ma_tai_khoan int,
tai_khoan_user tinyint(1),
tai_khoan_admin tinyint(1),
foreign key(ma_tai_khoan) references tai_khoan(ma_tai_khoan)
);
create table nhan_vien(
ma_nhan_vien int primary key auto_increment,
ten_nhan_vien varchar(100),
email varchar(250) not null,
dien_thoai varchar(12) not null,
ma_tai_khoan int,
tai_khoan_user tinyint(1),
tai_khoan_admin tinyint(1),
foreign key(ma_tai_khoan) references tai_khoan(ma_tai_khoan)
);
-- sản phẩm
create table loai_san_pham(
ma_loai_sp int primary key auto_increment,
ten_loai_sp varchar(50) not null
);
create table san_pham(
ma_san_pham int primary key auto_increment,
ten_san_pham varchar(500) not null,
mo_ta longtext,
gia_tien bigint,
hinh_anh longtext,
ma_loai_sp int,
tai_khoan_admin tinyint,
foreign key(ma_loai_sp) references loai_san_pham(ma_loai_sp)
);
-- đơn hàng
create table dich_vu_di_kem(
ma_dich_vu int primary key auto_increment,
ten_dich_vu varchar(50) not null,
mo_ta varchar(500),
gia_tien bigint
);
create table don_dat_hang(
ma_don_hang int primary key auto_increment,
thoi_gian_dh datetime,
ma_khach_hang int,
ma_nhan_vien int,
tai_khoan_admin tinyint,
foreign key(ma_khach_hang) references khach_hang(ma_khach_hang),
foreign key(ma_nhan_vien) references nhan_vien(ma_nhan_vien)
);
create table don_hang_chi_tiet(
ma_dh_chi_tiet int primary key auto_increment,
ma_san_pham int,
ma_don_hang int,
ma_dich_vu int,
so_luong int,
tong_tien bigint,
foreign key(ma_san_pham) references san_pham(ma_san_pham),
foreign key(ma_don_hang) references don_dat_hang(ma_don_hang),
foreign key(ma_dich_vu) references dich_vu_di_kem(ma_dich_vu)
) ;
-- loai san pham
insert into loai_san_pham(ten_loai_sp)
value ('Asus');

-- san pham
INSERT INTO san_pham ( ten_san_pham, mo_ta, gia_tien, hinh_anh, ma_loai_sp, tai_khoan_admin) 
VALUES 
( 'Laptop Asus TUF Gaming FX506LHB-HN188W',
 '-15.6 inch, 1920 x 1080 Pixels, IPS, 60 Hz, 600 nits, OLED\r -Intel, Core i5, 12500H\r -8 GB (1 thanh 8 GB), DDR4, 3200 MHz\r -SSD 512 GB\r -Intel UHD Graphics',
 '15490000',
 'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/1/26/637787904727727554_asus-tuf-gaming-fx506lh-den-2022-dd.jpg',
 '1',
 '1')
, ( 'Laptop Asus TUF Gaming FX506LHB-HN188W',
 '-15.6 inch, 1920 x 1080 Pixels, IPS, 144 Hz, Anti-glare LED-backlit\r -Intel, Core i5, 11400H\r -8 GB (1 thanh 8 GB), DDR4, 3200 MHz\r -SSD 512 GB\r -NVIDIA GeForce RTX 3050 4GB; Intel UHD Graphics',
 '15490000',
 'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/1/26/637787904727727554_asus-tuf-gaming-fx506lh-den-2022-dd.jpg',
 '1',
 '1')
,( 'Laptop Asus Vivobook E1404FA-NK186W R5',
 '-14.0 inch Chính:, 1920 x 1080 Pixels Màn hình chính:, IPS, 60 Hz Màn hình chính:, 250 nits, LED Backlit Chính:\r AMD, Ryzen 5, 7520U\r -16 GB, LPDDR5, 5500 MHz\r -SSD 512 GB\r -AMD Radeon Graphics',
 '15490000',
 'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/1/26/637787904727727554_asus-tuf-gaming-fx506lh-den-2022-dd.jpg',
 '1',
 '1')
, ( 'Laptop Asus Vivobook M513UA-EJ704W R7',
 '-15.6 inch, FHD (1920 x 1080), TN, 60 Hz, Anti-Glare LED-Backlit Display',
 '15490000',
 'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/1/26/637787904727727554_asus-tuf-gaming-fx506lh-den-2022-dd.jpg',
 '1',
 '1')
,( 'Laptop Asus Vivobook A1503ZA-L1139W i5 ',
 '-15.6 inch, 1920 x 1080 Pixels, IPS, 60 Hz, 600 nits, OLED',
 '15490000',
 'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/1/26/637787904727727554_asus-tuf-gaming-fx506lh-den-2022-dd.jpg',
 '1',
 '1')
, ( 'Laptop Asus Vivobook M1503QA-L1026W R5 ',
 '-15.6 inch, FHD (1920 x 1080), IPS, 144 Hz, Anti - Glare',
 '15490000',
 'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/1/26/637787904727727554_asus-tuf-gaming-fx506lh-den-2022-dd.jpg',
 '1',
 '1')
, ( 'Laptop Asus TUF Gaming FX506HF-HN017W i5',
 '-15.6 inch, FHD (1920 x 1080), IPS, 144 Hz, Anti - Glare',
 '15490000',
 'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/1/26/637787904727727554_asus-tuf-gaming-fx506lh-den-2022-dd.jpg',
 '1',
 '1')
,( 'Laptop Asus Zenbook UM5401QA-KN209W R5',
 '-15.6 inch, FHD (1920 x 1080), IPS, 144 Hz, Anti - Glare',
 '15490000',
 'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/1/26/637787904727727554_asus-tuf-gaming-fx506lh-den-2022-dd.jpg',
 '1', 
 '1')
, ( 'Laptop Asus Vivobook 15 OLED A1505VA-L1113W',
 '-15.6 inch, 1920 x 1080 Pixels, IPS, 60 Hz, 600 nits, FHD\r -Intel, Core i5, 13500H\r -16 GB, DDR4, 3200 MHz\r -SSD 512 GB\r -Intel UHD Graphics',
 '15490000',
 'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/1/26/637787904727727554_asus-tuf-gaming-fx506lh-den-2022-dd.jpg',
 '1',
 '1');

-- insert tai_khoan
insert into roles(ten_roles)
value('admin'),('nhân viên'),('khách hàng');
select * from roles;

insert into tai_khoan(ten_tai_khoan,mat_khau)
value 
('nam','nam123'),
('tin','tin123'),
('thai','thai123'),
('duc','duc123'),
('hai','hai123');
select * from tai_khoan;
insert into nguoi_dung_role(ma_roles,ma_tai_khoan)
value 	(1,1),
		(3,2),
        (3,3),
        (3,4),
        (3,5);
select * from nguoi_dung_role;
select * from roles;

select tk.ma_tai_khoan,tk.ten_tai_khoan,r.ten_roles
from tai_khoan tk
join nguoi_dung_role ndr
on ndr.ma_tai_khoan=tk.ma_tai_khoan
join roles r
on	r.ma_roles=ndr.ma_roles
where tk.ma_tai_khoan=1;