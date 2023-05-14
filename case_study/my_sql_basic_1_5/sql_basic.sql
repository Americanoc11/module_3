use furama;
-- SQL cơ bản
-- 1.	Thêm mới thông tin cho tất cả các
	--  bảng có trong CSDL để có thể thoả
    --  mãn các yêu cầu bên dưới.


-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt 
     -- đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
SELECT *FROM employee
WHERE
		  ( name_employee LIKE 'h%')
        OR (name_employee LIKE 't%')
        OR(name_employee LIKE 'k%') and char_length(name_employee) <=15;

-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 
-- 		tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select c.id_customer, c.name_customer,c.address, year(current_date())-year(date_of_birth) as 'age' from customer c
where year(current_date())-year(date_of_birth) >18 and year(current_date())-year(date_of_birth)<50
											and (address like '%Đà Nẵng' or address like'%Quảng Trị');

-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
	-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
    -- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
    select c.*,tc.id_type_customer ,count(ct.id_contract)
    from customer c
    join type_customer tc
    on tc.id_type_customer=c.id_type_customer
    join contract ct
    on ct.id_customer=c.id_customer
    where tc.name_type_customer= 'Diamond'
    group by c.id_customer
    order by count(ct.id_contract);
        -- diamon test
     select c.*,tc.id_type_customer ,tc.name_type_customer
    from customer c
    join type_customer tc
    on tc.id_type_customer=c.id_type_customer
      where tc.name_type_customer= 'Diamond';
    -- task4
    select c.*,tc.id_type_customer ,count(ct.id_contract)
    from customer c
    join type_customer tc
    on tc.id_type_customer=c.id_type_customer
    join contract ct
    on ct.id_customer=c.id_customer
    where tc.name_type_customer= 'Diamond'
    group by c.id_customer
    order by count(ct.id_contract);
    
    select*from contract;
-- 5.		Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc,
		-- tong_tien (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và
        -- Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
      
 select c.id_customer,c.name_customer,tc.name_type_customer,
		ct.id_contract, sf.name_service,
		ct.date_start_contract,ct.date_end_contract,(sf.rental_cost + ifnull(sum( cd.amount * ass.price),0)) as 'total_price'
from customer c
left join type_customer tc
on tc.id_type_customer=c.id_type_customer
left join contract ct
on ct.id_customer=c.id_customer
left join service_furama sf
on sf.id_service=ct.id_service
left join contract_details cd
on cd.id_contract=ct.id_contract
left join accompanying_services ass
on ass.id_service=cd.id_service
group by c.id_customer,ct.id_contract
;
SET sql_mode = 'ONLY_FULL_GROUP_BY';
-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu
	-- của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1
    -- của năm 2021 (Quý 1 là tháng 1, 2, 3).
select sf.id_service, sf.name_service, sf.usable_area, sf.rental_cost, ts.name_type_service
from service_furama sf
join type_service ts
on ts.id_type_service=sf.id_type_service
join contract ct
on ct.id_service=sf.id_service
where sf.id_service  not in ( select sf.id_service 
from service_furama sf
join type_service ts
on ts.id_type_service=sf.id_type_service
join contract ct
on ct.id_service=sf.id_service
 where year(ct.date_start_contract)= '2021' and month(ct.date_start_contract) in (1,2,3)
)
group by sf.id_service
order by name_service desc;
-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich,
	--  so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất
    --  cả các loại dịch vụ đã từng được khách hàng đặt phòng trong
    --  năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
select sf.id_service,sf.name_service,sf.usable_area,sf.rental_cost,ts.name_type_service,ct.date_start_contract
from service_furama sf
join type_service ts
on ts.id_type_service=sf.id_type_service
join contract ct
on ct.id_service=sf.id_service
where sf.id_service not in (
select sf.id_service
from service_furama sf
join type_service ts
on ts.id_type_service=sf.id_type_service
join contract ct
on ct.id_service=sf.id_service
 where year(date_start_contract)= 2021 and year(date_start_contract) not in(year(date_start_contract)=2021)
)
group by sf.id_service;

select * from customer;
select c.name_customer
from customer c
group by c.name_customer;
-- 8.2 cách 2
select distinct c.name_customer
from customer c;
-- 8.3 cách 3
select c.id_customer,c.name_customer
from customer c
union 
select c.id_customer,c.name_customer
from customer c;
-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select month(ct.date_start_contract) as 'Months', count(ct.id_customer) as 'Number customer'
from contract ct
join customer c
on c.id_customer=ct.id_customer
where year(ct.date_start_contract)= 2021
group by month(ct.date_start_contract)
order by month(ct.date_start_contract);
-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm.
--  Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong,
--  ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select ct.id_contract as 'Mã hợp đồng'
		,ct.date_start_contract as 'Ngày làm hợp đồng'
		,ct.date_end_contract as 'Ngày kết thúc'
		,ct.deposit as 'Tiền đặt cọc'
		,ifnull(sum(ctd.amount),0) as' Số lượng dịch vụ đi kèm'
from contract ct
left join contract_details ctd
on ctd.id_contract=ct.id_contract
group by ct.id_contract
;
-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select acs.id_service,acs.name_service
from accompanying_services acs
join contract_details cd
on cd.id_service=acs.id_service
join contract ct
on ct.id_service=cd.id_service
join customer c
on c.id_customer=ct.id_customer
join type_customer tc
on tc.id_type_customer=c.id_type_customer
 where tc.name_type_customer='Diamond' and c.address like '%Vinh' or c.address like '%Quảng Ngãi'
group by acs.id_service
order by acs.id_service;

-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng),
--  so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem),
--  tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
select*from customer;
select*from contract;
select ct.id_contract,e.name_employee,c.name_customer,c.phone,sf.name_service,sum(cd.amount) as 'amount_accompanying_service',ct.deposit
from contract ct
join customer c
on c.id_customer=ct.id_customer
join employee e
on e.id_employee=ct.id_employee
join service_furama sf
on sf.id_service= ct.id_service
join contract_details cd
on cd.id_contract=ct.id_contract
join accompanying_services acs
on acs.id_service=cd.id_service
where  (year(date_start_contract)=2020 and month(date_start_contract) in (10,11,12)) and year(date_start_contract) not in
(select ct.id_contract
 from contract ct
 where year(date_start_contract)=2021 and month(date_start_contract) in (1,2,3,4,5,6))
group by ct.id_contract
;
-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất
--  bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ
-- có số lần sử dụng nhiều như nhau).
select acs.id_service,acs.name_service,count(cd.amount)
from accompanying_services acs
join contract_details cd 
on cd.id_service= acs.id_service
join contract ct
on ct.id_contract=cd.id_contract
join customer c
on c.id_customer=ct.id_customer
group by count(cd.amount);

-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.
--  Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
select ct.id_contract,ts.name_type_service,acs.name_service,cd.amount
from contract ct
join service_furama sf
on sf.id_service=ct.id_service
join type_service ts
on ts.id_type_service=sf.id_type_service
join contract_details cd
on cd.id_contract=ct.id_contract
join accompanying_services acs
on acs.id_service= cd.id_service
where cd.amount=1;
-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm
--  ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi,
--  mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.

 select e.id_employee,e.name_employee,p.name_qualification,name_partscode,e.phone,e.address
 from employee e
 join qualification_employee p
 on p.id_qualification=e.id_qualification
 join partscode_employee pe
 on pe.id_partscode= e.id_partscode
 join contract ct
 on ct.id_employee=e.id_employee
 group by e.id_employee
 having count(ct.id_contract) <=3;

 -- chưa xét đk hợp đồng và năm
 select e.id_employee,
		e.name_employee,
		qe.name_qualification,
		pce.name_partscode,
		e.phone,e.address,
        ct.id_contract,
		year(ct.date_start_contract)
  , count(e.id_employee)
 from employee e
 join qualification_employee qe
 on qe.id_qualification= e.id_qualification
 join partscode_employee pce
 on pce.id_partscode= e.id_partscode
 join contract ct
 on ct.id_employee=e.id_employee
 group by e.id_employee
 ;
-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
select e.id_employee,e.name_employee,ifnull(ct.id_contract,0) as 'id_contract'
from employee e
left join contract ct
on ct.id_employee= e.id_employee
where ifnull(ct.id_contract,0)=0;

alter table employee
change column isEmployee is_employee tinyint(1) default '1';
-- add isEmployee tinyint(1) default'1';
select*from employee;
set sql_safe_updates=1;
update employee
 set is_employee= 1
 where id_employee = 10;
 
-- delete logic
select*
from employee
where is_employee=0;
 
-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
-- customer, type_customer,contract,service,contract_details,accompaning
select c.id_customer,c.name_customer,tc.id_type_customer,tc.name_type_customer,ct.id_contract,cd.id_contract_details,acs.id_service,((ct.deposit+sf.rental_cost)+ ifnull(sum(cd.amount*acs.price),0)) as 'total_bill'
from customer c
join type_customer tc
on tc.id_type_customer=c.id_type_customer
join contract ct
on ct.id_customer=c.id_customer
join service_furama sf
on sf.id_service= ct.id_service
join contract_details cd
on cd.id_contract=ct.id_contract
join accompanying_services acs
on acs.id_service=cd.id_service
group by c.id_customer
having total_bill >= 10000000;

update type_customer
set name_type_customer= 'Platinum'
where id_type_customer= 2 ;
update type_customer
set name_type_customer= 'Platinum'
where id_type_customer= 1 ;

-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
select c.id_customer,c.name_customer
from customer c
left join contract ct
on ct.id_customer=c.id_customer
where year(date_start_contract) < 2021;

alter table customer
add is_customer tinyint(1) default 1;
update customer
set is_customer= 0
where id_customer = 1 or id_customer = 3 or id_customer = 4;

-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
select*from accompanying_services;
select acs.id_service,acs.name_service,cd.amount,acs.price,ct.id_contract
from accompanying_services acs
join contract_details cd
on cd.id_service= acs.id_service
join contract ct
on ct.id_contract= cd.id_contract
group by acs.id_service
having cd.amount>10;

-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select 	e.id_employee as 'Id',
		e.name_employee as 'Name',
		e.email,e.phone as 'Email',
        e.date_of_birth as 'Date of birth',
        e.address as 'Address'
from employee e
left join contract ct
on ct.id_employee= e.id_employee
left join customer c
on c.id_customer= ct.id_customer
group by e.id_employee 
union 
select c.id_customer,c.name_customer,c.email,c.phone,c.date_of_birth,c.address
from customer c;

