use furama;
-- 1.	Thêm mới thông tin cho tất cả các bảng có trong CSDL để có thể thoả mãn các yêu cầu bên dưới.
-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống
-- có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select * from customer
where( name_customer like '%H%' or name_customer like '%T%' or name_customer like '%K%' );
-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.

select id_customer, name_customer,address, year(current_date())-year(date_of_birth) as 'age'
from customer 
where year(current_date())-year(date_of_birth) >18 
and year(current_date())-year(date_of_birth)<50
and (address like '%Đà Nẵng' or address like'%Quảng Trị');

-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select c.id_customer,c.name_customer,count(c.id_customer)
from customer c
join type_customer tc
on tc.id_type_customer=c.id_type_customer
join contract ct
on ct.id_customer=c.id_customer
join service_furama sf
on sf.id_service=ct.id_service
where tc.name_type_customer='Diamond'
group by c.id_customer;

-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu,
--  ngay_lam_hop_dong, ngay_ket_thuc, tong_tien (Với tổng tiền được tính theo công
-- thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem,
--  hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa
-- từng đặt phòng cũng phải hiển thị ra).
select c.id_customer,c.name_customer,tc.name_type_customer,ct.id_contract,
sf.name_service,ct.date_start_contract,ct.date_end_contract,rental_cost,
(sf.rental_cost+ ifnull(sum(ctd.amount*accs.price),0)) as 'total'
from customer c
left join type_customer tc
on	tc.id_type_customer=c.id_type_customer
 join contract ct
on	ct.id_customer=c.id_customer
left join service_furama sf
on	sf.id_service=ct.id_service
left join contract_details ctd
on	ctd.id_contract=ct.id_contract
left join accompanying_services accs
on	accs.id_service=ctd.id_service
group by c.id_customer,ct.id_contract
order by c.id_customer;

-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu
--  của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của
-- năm 2021 (Quý 1 là tháng 1, 2, 3).
select sf.id_service,sf.name_service,sf.usable_area,sf.rental_cost,ts.name_type_service
from service_furama sf
join type_service ts
on ts.id_type_service=sf.id_type_service
where sf.id_service not in (
select sf.id_service
from service_furama sf
left join contract ct
on ct.id_service=sf.id_service
where year(ct.date_start_contract)='2021' and month(ct.date_start_contract) in (1,2,3)
);
-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da,
-- chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách
-- hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
select sf.id_service,sf.name_service,sf.usable_area,sf.number_person,sf.rental_cost,tps.name_type_service
from service_furama sf
join type_service tps
on	tps.id_type_service=sf.id_type_service
where sf.id_service not in (
select sf.id_service
from service_furama sf
join contract ct
on	ct.id_service=sf.id_service
where year(ct.date_start_contract)='2021' 
);
-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không
-- trùng nhau.Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
select c.name_customer
from customer c
group by c.name_customer;

delimiter $
create procedure select_all_name()
begin
select c.name_customer
from customer c
group by c.name_customer;
end $
delimiter ;
call select_all_name();
-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong
-- năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select month(ct.date_start_contract) as `month`,count(c.id_customer)
from contract ct
join customer c 
on c.id_customer=ct.id_contract
group by `month`
order by `month`;
-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ
-- đi kèm. Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc,
-- tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select ct.id_contract,ct.date_start_contract,ct.date_end_contract,ct.deposit,ifnull(sum(ctd.amount),0)
from contract ct
left join contract_details ctd
on ctd.id_contract=ct.id_contract
left join accompanying_services accs
on accs.id_service=ctd.id_service
group by ct.id_contract
order by ct.id_contract;
select * from customer;
-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có
-- ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.

select accs.id_service,accs.name_service
from customer c
join type_customer tc
on tc.id_type_customer=c.id_type_customer
join contract ct
on ct.id_customer=c.id_customer
join contract_details ctd
on ctd.id_contract=ct.id_contract
join accompanying_services accs
on accs.id_service=ctd.id_service
where (c.address like '% Quảng ngãi%' or c.address like '% Vinh%') and tc.name_type_customer='Diamond';

-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng),
-- so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa
-- trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã
-- từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng
-- đặt vào 6 tháng đầu năm 2021.

select ct.id_contract,e.name_employee,c.name_customer,c.phone,sf.name_service,ifnull(sum(ctd.amount),0) as 'amount service',ct.deposit
from contract ct
left join employee e
on e.id_employee=ct.id_employee
left join customer c
on c.id_customer=ct.id_customer
join service_furama sf
on sf.id_service=ct.id_service
left join contract_details ctd
on ctd.id_contract=ct.id_contract
where  (year(ct.date_start_contract)='2020' and (month(ct.date_start_contract) in(10,11,12))) and year(ct.date_start_contract) not in(
select id_contract
from contract
where (year(ct.date_start_contract)='2021' and (month(ct.date_start_contract) in(1,2,3,4,5,6)))
)
group by ct.id_contract;
-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các
-- Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng
-- nhiều như nhau).
select accs.id_service,accs.name_service,ifnull(sum(ctd.amount),0) as 'amount'
from accompanying_services accs
join contract_details ctd
on ctd.id_service=accs.id_service
join contract ct
on ct.id_contract=ctd.id_contract
group by accs.id_service
having amount>10;

-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần
-- duy nhất. Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem,
-- so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).

    
--     select  ct.id_contract,ts.name_type_service,accs.name_service
--     from accompanying_services accs
--     join contract_details ctd
--     on ctd.id_service=accs.id_service
--     join contract ct
--     on ct.id_contract=ctd.id_contract
--     join service_furama sf
--     on sf.id_service=ct.id_contract
--     join type_service ts
--     on ts.id_type_service= sf.id_type_service
--     group by accs.name_service,accs.id_service;
    
-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten,
-- ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 
-- 3 hợp đồng từ năm 2020 đến 2021.

-- select
-- e.id_employee,e.name_employee,qe.name_qualification,
-- pe.name_partscode,e.phone,e.address,count(ct.id_contract)
-- from employee e
-- join qualification_employee qe
-- on qe.id_qualification=e.id_qualification
-- join partscode_employee pe
-- on pe.id_partscode=e.id_partscode
-- join contract ct
-- on ct.id_employee=e.id_employee
-- where count(ct.id_contract) <=3 and (
-- select ct.id_contract
-- from contract ct
-- where year(ct.date_start_contract)='2020' and year(ct.date_start_contract)='2021'
-- )
-- group by e.id_employee
--  ;

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.

select
e.id_employee,e.name_employee,qe.name_qualification,
pe.name_partscode,e.phone,e.address,ct.id_contract
from employee e
left join qualification_employee qe
on qe.id_qualification=e.id_qualification
left join partscode_employee pe
on pe.id_partscode=e.id_partscode
left join contract ct
on ct.id_employee=e.id_employee;
-- xóa vật lý
delete from employee
where id_employee=4; -- (4,5,6,8,9)

-- xóa logic
alter table employee 
add is_delete tinyint(1) default'1';
set sql_safe_updates=0;
update employee
set is_delete=0
where id_employee=4; -- (4,5,6,8,9)
set sql_safe_updates=1;
select * from employee
where is_delete=0;
-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond,
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 
-- 2021 là lớn hơn 10.000.000 VNĐ.
select c.id_customer, c.name_customer, tc.name_type_customer
from customer c
join type_customer tc
on	tc.id_type_customer=c.id_type_customer;

update customer
set id_type_customer=1
where id_customer=10;


-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).

-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.

-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
 