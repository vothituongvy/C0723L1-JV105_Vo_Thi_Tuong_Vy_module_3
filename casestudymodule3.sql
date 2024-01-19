create database furama1;
use furama1;
create table vi_tri(
	ma_vi_tri int primary key auto_increment,
    ten_vi_tri varchar(45)
);
create table trinh_do(
	ma_trinh_do int primary key auto_increment,
    ten_trinh_do varchar(45)
);
create table bo_phan(
	ma_bo_phan int primary key auto_increment,
    ten_bo_phan varchar(45)
);
create table nhan_vien(
	ma_nhan_vien int primary key auto_increment,
    ho_ten varchar(45) not null,
    ngay_sinh date not null,
    so_cmnd varchar(45) not null,
    luong double not null,
    so_dien_thoai varchar(45),
    email varchar(45),
    dia_chi varchar(45),
    ma_vi_tri int not null,
    ma_trinh_do int not null,
    ma_bo_phan int not null,
    foreign key(ma_vi_tri) references vi_tri(ma_vi_tri),
    foreign key(ma_trinh_do) references trinh_do(ma_trinh_do),
    foreign key(ma_bo_phan) references bo_phan(ma_bo_phan)
);
create table loai_khach(
	ma_loai_khach int primary key,
    ten_loai_khach varchar(45)
);
create table khach_hang(
	ma_khach_hang int primary key,
    ma_loai_khach int not null,
    ho_ten varchar(45) not null,
    ngay_sinh date not null,
    gioi_tinh bit(1) not null,
    so_cmnd varchar(45) not null,
    so_dien_thoai varchar(45) not null,
    email varchar(45),
    dia_chi varchar(45),
    foreign key (ma_loai_khach) references loai_khach(ma_loai_khach)
);
create table kieu_thue(
	ma_kieu_thue int primary key,
	ten_kieu_thue varchar(45)
);
create table loai_dich_vu(
	ma_loai_dich_vu int primary key,
	ten_loai_dich_vu varchar(45)
);
CREATE TABLE dich_vu (
    ma_dich_vu INT primary key,
    ten_dich_vu VARCHAR(45) NOT NULL,
    dien_tich INT,
    chi_phi_thue DOUBLE NOT NULL,
    so_nguoi_toi_da INT,
    tieu_chuan_phong VARCHAR(45),
    mo_ta_tien_nghi_khac VARCHAR(45),
    dien_tich_ho_boi DOUBLE,
    so_tang INT,
    ma_kieu_thue INT NOT NULL,
    ma_loai_dich_vu INT NOT NULL,
    FOREIGN KEY (ma_kieu_thue)
        REFERENCES kieu_thue (ma_kieu_thue),
    FOREIGN KEY (ma_loai_dich_vu)
        REFERENCES loai_dich_vu (ma_loai_dich_vu)
);
create index index_ma_dich_vu on dich_vu(ma_dich_vu);
create table hop_dong(
	ma_hop_dong int primary key,
    ngay_lam_hop_dong datetime not null,
    ngay_ket_thuc datetime not null,
    tien_dat_coc double not null,
    ma_nhan_vien int not null,
    ma_khach_hang int not null,
    ma_dich_vu int not null,
    foreign key (ma_nhan_vien) references nhan_vien(ma_nhan_vien),
    foreign key (ma_khach_hang) references khach_hang (ma_khach_hang),
    foreign key (ma_dich_vu) references dich_vu(ma_dich_vu)
);
create table dich_vu_di_kem(
	ma_dich_vu_di_kem int primary key,
    ten_dich_vu_di_kem varchar(45) not null,
    gia double not null,
    don_vi varchar(10) not null,
    trang_thai varchar(45)
);
create table hop_dong_chi_tiet(
	ma_hop_dong_chi_tiet int primary key,
    ma_hop_dong int not null,
    ma_dich_vu_di_kem int not null,
    so_luong int not null,
    foreign key (ma_hop_dong) references hop_dong(ma_hop_dong),
    foreign key (ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem)
);
-- câu 1
INSERT INTO `furama1`.`bo_phan` (`ma_bo_phan`, `ten_bo_phan`) VALUES ('1', 'Sale-Marketing');
INSERT INTO `furama1`.`bo_phan` (`ma_bo_phan`, `ten_bo_phan`) VALUES ('2', 'Hành chính');
INSERT INTO `furama1`.`bo_phan` (`ma_bo_phan`, `ten_bo_phan`) VALUES ('3', 'Phục vụ');
INSERT INTO `furama1`.`bo_phan` (`ma_bo_phan`, `ten_bo_phan`) VALUES ('4', 'Quản lý');
INSERT INTO `furama1`.`dich_vu` (`ma_dich_vu`, `ten_dich_vu`, `dien_tich`, `chi_phi_thue`, `so_nguoi_toi_da`, `tieu_chuan_phong`, `mo_ta_tien_nghi_khac`, `dien_tich_ho_boi`, `so_tang`, `ma_kieu_thue`, `ma_loai_dich_vu`) VALUES ('1', 'Villa Beach Front', '25000', '10000000', '10', 'vip', 'Có hồ bơi', '500', '4', '3', '1');
INSERT INTO `furama1`.`dich_vu` (`ma_dich_vu`, `ten_dich_vu`, `dien_tich`, `chi_phi_thue`, `so_nguoi_toi_da`, `tieu_chuan_phong`, `mo_ta_tien_nghi_khac`, `so_tang`, `ma_kieu_thue`, `ma_loai_dich_vu`) VALUES ('2', 'House Princess 01', '14000', '5000000', '7', 'vip', 'Có thêm bếp nướng', '3', '2', '2');
INSERT INTO `furama1`.`dich_vu` (`ma_dich_vu`, `ten_dich_vu`, `dien_tich`, `chi_phi_thue`, `so_nguoi_toi_da`, `tieu_chuan_phong`, `mo_ta_tien_nghi_khac`, `ma_kieu_thue`, `ma_loai_dich_vu`) VALUES ('3', 'Room Twin 01', '5000', '1000000', '2', 'normal', 'Có tivi', '4', '3');
INSERT INTO `furama1`.`dich_vu` (`ma_dich_vu`, `ten_dich_vu`, `dien_tich`, `chi_phi_thue`, `so_nguoi_toi_da`, `tieu_chuan_phong`, `mo_ta_tien_nghi_khac`, `dien_tich_ho_boi`, `so_tang`, `ma_kieu_thue`, `ma_loai_dich_vu`) VALUES ('4', 'Villa No Beach Front', '22000', '9000000', '8', 'normal', 'Có hồ bơi', '300', '3', '3', '1');
INSERT INTO `furama1`.`dich_vu` (`ma_dich_vu`, `ten_dich_vu`, `dien_tich`, `chi_phi_thue`, `so_nguoi_toi_da`, `tieu_chuan_phong`, `mo_ta_tien_nghi_khac`, `so_tang`, `ma_kieu_thue`, `ma_loai_dich_vu`) VALUES ('5', 'House Princess 02', '10000', '4000000', '5', 'normal', 'Có thêm bếp nướng', '2', '3', '2');
INSERT INTO `furama1`.`dich_vu` (`ma_dich_vu`, `ten_dich_vu`, `dien_tich`, `chi_phi_thue`, `so_nguoi_toi_da`, `tieu_chuan_phong`, `mo_ta_tien_nghi_khac`, `ma_kieu_thue`, `ma_loai_dich_vu`) VALUES ('6', 'Room Twin 02', '3000', '900000', '2', 'normal', 'Có tivi', '4', '3');
INSERT INTO `furama1`.`dich_vu_di_kem` (`ma_dich_vu_di_kem`, `ten_dich_vu_di_kem`, `gia`, `don_vi`, `trang_thai`) VALUES ('1', 'Karaoke', '10000', 'giờ', 'tiện nghi, hiện tại');
INSERT INTO `furama1`.`dich_vu_di_kem` (`ma_dich_vu_di_kem`, `ten_dich_vu_di_kem`, `gia`, `don_vi`, `trang_thai`) VALUES ('2', 'Thuê xe máy', '10000', 'chiếc', 'hỏng 1 xe');
INSERT INTO `furama1`.`dich_vu_di_kem` (`ma_dich_vu_di_kem`, `ten_dich_vu_di_kem`, `gia`, `don_vi`, `trang_thai`) VALUES ('3', 'Thuê xe đạp', '20000', 'chiếc', 'tốt');
INSERT INTO `furama1`.`dich_vu_di_kem` (`ma_dich_vu_di_kem`, `ten_dich_vu_di_kem`, `gia`, `don_vi`, `trang_thai`) VALUES ('4', 'Buffet buổi sáng', '15000', 'suất', 'đầy đủ đồ ăn, tráng miệng');
INSERT INTO `furama1`.`dich_vu_di_kem` (`ma_dich_vu_di_kem`, `ten_dich_vu_di_kem`, `gia`, `don_vi`, `trang_thai`) VALUES ('5', 'Buffet buổi trưa', '90000', 'suất', 'đầy đủ đồ ăn, tráng miệng');
INSERT INTO `furama1`.`dich_vu_di_kem` (`ma_dich_vu_di_kem`, `ten_dich_vu_di_kem`, `gia`, `don_vi`, `trang_thai`) VALUES ('6', 'Buffet buổi tối', '16000', 'suất', 'đầy đủ đồ ăn, tráng miệng');
INSERT INTO `furama1`.`hop_dong` (`ma_hop_dong`, `ngay_lam_hop_dong`, `ngay_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khach_hang`, `ma_dich_vu`) VALUES ('1', '2020-12-08 00:00:00', '2020-12-08 00:00:00', '0', '3', '1', '3');
INSERT INTO `furama1`.`hop_dong` (`ma_hop_dong`, `ngay_lam_hop_dong`, `ngay_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khach_hang`, `ma_dich_vu`) VALUES ('2', '2020-07-14 00:00:00', '2020-07-21 00:00:00', '200000', '7', '3', '1');
INSERT INTO `furama1`.`hop_dong` (`ma_hop_dong`, `ngay_lam_hop_dong`, `ngay_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khach_hang`, `ma_dich_vu`) VALUES ('3', '2021-03-15 00:00:00', '2021-03-17 00:00:00', '50000', '3', '4', '2');
INSERT INTO `furama1`.`hop_dong` (`ma_hop_dong`, `ngay_lam_hop_dong`, `ngay_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khach_hang`, `ma_dich_vu`) VALUES ('4', '2021-01-14 00:00:00', '2021-01-18 00:00:00', '100000', '7', '5', '5');
INSERT INTO `furama1`.`hop_dong` (`ma_hop_dong`, `ngay_lam_hop_dong`, `ngay_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khach_hang`, `ma_dich_vu`) VALUES ('5', '2021-07-14 00:00:00', '2021-07-15 00:00:00', '0', '7', '2', '6');
INSERT INTO `furama1`.`hop_dong` (`ma_hop_dong`, `ngay_lam_hop_dong`, `ngay_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khach_hang`, `ma_dich_vu`) VALUES ('6', '2021-06-01 00:00:00', '2021-06-03 00:00:00', '0', '7', '7', '6');
INSERT INTO `furama1`.`hop_dong` (`ma_hop_dong`, `ngay_lam_hop_dong`, `ngay_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khach_hang`, `ma_dich_vu`) VALUES ('7', '2021-09-02 00:00:00', '2021-09-05 00:00:00', '100000', '7', '4', '4');
INSERT INTO `furama1`.`hop_dong` (`ma_hop_dong`, `ngay_lam_hop_dong`, `ngay_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khach_hang`, `ma_dich_vu`) VALUES ('8', '2021-06-17 00:00:00', '2021-06-18 00:00:00', '150000', '3', '4', '1');
INSERT INTO `furama1`.`hop_dong` (`ma_hop_dong`, `ngay_lam_hop_dong`, `ngay_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khach_hang`, `ma_dich_vu`) VALUES ('9', '2020-11-19 00:00:00', '2020-11-19 00:00:00', '0', '3', '4', '3');
INSERT INTO `furama1`.`hop_dong` (`ma_hop_dong`, `ngay_lam_hop_dong`, `ngay_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khach_hang`, `ma_dich_vu`) VALUES ('10', '2021-04-12 00:00:00', '2021-04-14 00:00:00', '0', '10', '3', '5');
INSERT INTO `furama1`.`hop_dong` (`ma_hop_dong`, `ngay_lam_hop_dong`, `ngay_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khach_hang`, `ma_dich_vu`) VALUES ('11', '2021-04-25 00:00:00', '2021-04-25 00:00:00', '0', '2', '2', '1');
INSERT INTO `furama1`.`hop_dong` (`ma_hop_dong`, `ngay_lam_hop_dong`, `ngay_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khach_hang`, `ma_dich_vu`) VALUES ('12', '2021-05-25 00:00:00', '2021-05-27 00:00:00', '0', '7', '10', '1');
INSERT INTO `furama1`.`hop_dong_chi_tiet` (`ma_hop_dong_chi_tiet`, `ma_hop_dong`, `ma_dich_vu_di_kem`, `so_luong`) VALUES ('1', '2', '4', '5');
INSERT INTO `furama1`.`hop_dong_chi_tiet` (`ma_hop_dong_chi_tiet`, `ma_hop_dong`, `ma_dich_vu_di_kem`, `so_luong`) VALUES ('2', '2', '5', '8');
INSERT INTO `furama1`.`hop_dong_chi_tiet` (`ma_hop_dong_chi_tiet`, `ma_hop_dong`, `ma_dich_vu_di_kem`, `so_luong`) VALUES ('3', '2', '6', '15');
INSERT INTO `furama1`.`hop_dong_chi_tiet` (`ma_hop_dong_chi_tiet`, `ma_hop_dong`, `ma_dich_vu_di_kem`, `so_luong`) VALUES ('4', '3', '1', '1');
INSERT INTO `furama1`.`hop_dong_chi_tiet` (`ma_hop_dong_chi_tiet`, `ma_hop_dong`, `ma_dich_vu_di_kem`, `so_luong`) VALUES ('5', '3', '2', '11');
INSERT INTO `furama1`.`hop_dong_chi_tiet` (`ma_hop_dong_chi_tiet`, `ma_hop_dong`, `ma_dich_vu_di_kem`, `so_luong`) VALUES ('6', '1', '3', '1');
INSERT INTO `furama1`.`hop_dong_chi_tiet` (`ma_hop_dong_chi_tiet`, `ma_hop_dong`, `ma_dich_vu_di_kem`, `so_luong`) VALUES ('7', '1', '2', '2');
INSERT INTO `furama1`.`hop_dong_chi_tiet` (`ma_hop_dong_chi_tiet`, `ma_hop_dong`, `ma_dich_vu_di_kem`, `so_luong`) VALUES ('8', '12', '2', '2');
INSERT INTO `furama1`.`kieu_thue` (`ma_kieu_thue`, `ten_kieu_thue`) VALUES ('1', 'year');
INSERT INTO `furama1`.`kieu_thue` (`ma_kieu_thue`, `ten_kieu_thue`) VALUES ('2', 'month');
INSERT INTO `furama1`.`kieu_thue` (`ma_kieu_thue`, `ten_kieu_thue`) VALUES ('3', 'day');
INSERT INTO `furama1`.`kieu_thue` (`ma_kieu_thue`, `ten_kieu_thue`) VALUES ('4', 'hour');
INSERT INTO `furama1`.`loai_dich_vu` (`ma_loai_dich_vu`, `ten_loai_dich_vu`) VALUES ('1', 'Villa');
INSERT INTO `furama1`.`loai_dich_vu` (`ma_loai_dich_vu`, `ten_loai_dich_vu`) VALUES ('2', 'House');
INSERT INTO `furama1`.`loai_dich_vu` (`ma_loai_dich_vu`, `ten_loai_dich_vu`) VALUES ('3', 'Room');
INSERT INTO `furama1`.`loai_khach` (`ma_loai_khach`, `ten_loai_khach`) VALUES ('1', 'Diamond');
INSERT INTO `furama1`.`loai_khach` (`ma_loai_khach`, `ten_loai_khach`) VALUES ('2', 'Platinium');
INSERT INTO `furama1`.`loai_khach` (`ma_loai_khach`, `ten_loai_khach`) VALUES ('3', 'Gold');
INSERT INTO `furama1`.`loai_khach` (`ma_loai_khach`, `ten_loai_khach`) VALUES ('4', 'Silver');
INSERT INTO `furama1`.`loai_khach` (`ma_loai_khach`, `ten_loai_khach`) VALUES ('5', 'Member');
INSERT INTO `furama1`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) VALUES ('1', 'Nguyễn Văn An', '1970-11-07', '456231786', '10000000', '0901234121', 'annguyen@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng', '1', '3', '1');
INSERT INTO `furama1`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) VALUES ('2', 'Lê Văn Bình', '1997-04-09', '654231234', '7000000', '0934212314', 'binhlv@gmail.com', '22 Yên Bái, Đà Nẵng', '1', '2', '2');
INSERT INTO `furama1`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) VALUES ('3', 'Hồ Thị Yến', '1995-12-12', '999231723', '14000000', '0412352315', 'thiyen@gmail.com', 'K234/11 Điện Biên Phủ, Gia Lai', '1', '3', '2');
INSERT INTO `furama1`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) VALUES ('4', 'Võ Công Toản', '1980-04-04', '123231365', '17000000', '0374443232', 'toan0404@gmail.com', '77 Hoàng Diệu, Quảng Trị', '1', '4', '4');
INSERT INTO `furama1`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) VALUES ('5', 'Nguyễn Bỉnh Phát', '1999-12-09', '454363232', '6000000', '0902341231', 'phatphat@gmail.com', '43 Yên Bái, Đà Nẵng', '2', '1', '1');
INSERT INTO `furama1`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) VALUES ('6', 'Khúc Nguyễn An Nghi', '2000-11-08', '964542311', '7000000', '0978653213', 'annghi20@gmail.com', '294 Nguyễn Tất Thành, Đà Nẵng', '2', '2', '3');
INSERT INTO `furama1`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) VALUES ('7', 'Nguyễn Hữu Hà', '1993-01-01', '534323231', '8000000', '0941234553', 'nhh0101@gmail.com', '4 Nguyễn Chí Thanh, Huế', '2', '3', '2');
INSERT INTO `furama1`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) VALUES ('8', 'Nguyễn Hà Đông', '1989-09-03', '234414123', '9000000', '0642123111', 'donghanguyen@gmail.com', '111 Hùng Vương, Hà Nội', '2', '4', '4');
INSERT INTO `furama1`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) VALUES ('9', 'Tòng Hoang', '1982-09-03', '256781231', '6000000', '0245144444', 'hoangtong@gmail.com', '213 Hàm Nghi, Đà Nẵng', '2', '4', '4');
INSERT INTO `furama1`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) VALUES ('10', 'Nguyễn Công Đạo', '1994-01-08', '755434343', '8000000', '0988767111', 'nguyencongdao12@gmail.com', '6 Hoà Khánh, Đồng Nai', '2', '3', '2');
INSERT INTO `furama1`.`trinh_do` (`ma_trinh_do`, `ten_trinh_do`) VALUES ('1', 'Trung Cấp');
INSERT INTO `furama1`.`trinh_do` (`ma_trinh_do`, `ten_trinh_do`) VALUES ('2', 'Cao Đẳng');
INSERT INTO `furama1`.`trinh_do` (`ma_trinh_do`, `ten_trinh_do`) VALUES ('3', 'Đại Học');
INSERT INTO `furama1`.`trinh_do` (`ma_trinh_do`, `ten_trinh_do`) VALUES ('4', 'Sau Đại Học');
INSERT INTO `furama1`.`vi_tri` (`ma_vi_tri`, `ten_vi_tri`) VALUES ('1', 'Quản Lý');
INSERT INTO `furama1`.`vi_tri` (`ma_vi_tri`, `ten_vi_tri`) VALUES ('2', 'Nhân Viên');
INSERT INTO `furama1`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) VALUES ('1', '5', 'Nguyễn Thị Hào', '1970-11-07',0, '643431213', '0945423362', 'thihao07@gmail.com', '23 Nguyễn Hoàng, Đà Nẵng');
INSERT INTO `furama1`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) VALUES ('2', '3', 'Phạm Xuân Diệu', '1992-08-08', 1, '865342123', '0954333333', 'xuandieu92@gmail.com', 'K77/22 Thái Phiên, Quảng Trị');
INSERT INTO `furama1`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) VALUES ('3', '1', 'Trương Đình Nghệ', '1990-02-27',1, '488645199', '0373213122', 'nghenhan2702@gmail.com', 'K323/12 Ông Ích Khiêm, Vinh');
INSERT INTO `furama1`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) VALUES ('4', '1', 'Dương Văn Quan', '1981-07-08', 1, '543432111', '0490039241', 'duongquan@gmail.com', 'K453/12 Lê Lợi, Đà Nẵng');
INSERT INTO `furama1`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) VALUES ('5', '4', 'Hoàng Trần Nhi Nhi', '1995-12-09',0, '795453345', '0312345678', 'nhinhi123@gmail.com', '224 Lý Thái Tổ, Gia Lai');
INSERT INTO `furama1`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) VALUES ('6', '4', 'Tôn Nữ Mộc Châu', '2005-12-06', 0, '732434215', '0988888844', 'tonnuchau@gmail.com', '37 Yên Thế, Đà Nẵng');
INSERT INTO `furama1`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) VALUES ('7', '1', 'Nguyễn Mỹ Kim', '1984-04-08', 0, '856453123', '0912345698', 'kimcuong84@gmail.com', 'K123/45 Lê Lợi, Hồ Chí Minh');
INSERT INTO `furama1`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) VALUES ('8', '3', 'Nguyễn Thị Hào', '1999-04-08', 0, '965656433', '0763212345', 'haohao99@gmail.com', '55 Nguyễn Văn Linh, Kon Tum');
INSERT INTO `furama1`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) VALUES ('9', '1', 'Trần Đại Danh', '1994-07-01', 1, '432341235', '0643343433', 'danhhai99@gmail.com', '24 Lý Thường Kiệt, Quảng Ngãi');
INSERT INTO `furama1`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) VALUES ('10', '2', 'Nguyễn Tâm Đắc', '1989-07-01',1, '344343432', '0987654321', 'dactam@gmail.com', '22 Ngô Quyền, Đà Nẵng');
-- câu 2
select * 
from nhan_vien 
where ho_ten like 'h%' or ho_ten like 't%' or ho_ten like 'k%' and char_length(ho_ten)<=15;
-- câu 3
select *  
from khach_hang
where (DATEDIFF(curdate(),ngay_sinh)>=18*365 and DATEDIFF(curdate(),ngay_sinh) <=50*365) and (dia_chi like '%Đà Nẵng' or dia_chi like '%Quảng Trị');
-- câu 4
select h.ma_khach_hang, k.ho_ten, count(*) as so_lan_dat
from hop_dong h
join khach_hang k on h.ma_khach_hang=k.ma_khach_hang
join loai_khach lk on k.ma_loai_khach=lk.ma_loai_khach
where lk.ma_loai_khach=1
group by h.ma_khach_hang
order by so_lan_dat asc;
-- câu 5
SELECT kh.ma_khach_hang,
       kh.ho_ten,
       lk.ten_loai_khach,
       hd.ma_hop_dong,
       dv.ten_dich_vu,
       hd.ngay_lam_hop_dong,
       hd.ngay_ket_thuc,
       IFNULL(SUM(hdct.so_luong * dvdk.gia), 0) + dv.chi_phi_thue as tong_tien
FROM khach_hang kh
         LEFT JOIN loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
         LEFT JOIN hop_dong hd ON hd.ma_khach_hang = kh.ma_khach_hang
         LEFT JOIN hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
         LEFT JOIN dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
         LEFT JOIN dich_vu dv ON dv.ma_dich_vu = hd.ma_dich_vu
GROUP BY kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong,
         hd.ngay_ket_thuc
ORDER BY kh.ma_khach_hang;
-- câu 6
select dv.ma_dich_vu , dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue,ldv.ten_loai_dich_vu
 from loai_dich_vu ldv join dich_vu dv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
 where dv.ma_dich_vu not in (
 select distinct hd.ma_dich_vu
 from hop_dong hd
 where year(hd.ngay_lam_hop_dong ) = 2021 and quarter(hd.ngay_lam_hop_dong) = 1);
-- câu 7
select dv.ma_dich_vu , dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue,ldv.ten_loai_dich_vu
 from loai_dich_vu ldv join dich_vu dv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
 where dv.ma_dich_vu in (
 select distinct hd.ma_dich_vu
 from hop_dong hd
 where year(hd.ngay_lam_hop_dong ) = 2020)
 and dv.ma_dich_vu not in (
 select distinct hd.ma_dich_vu
 from hop_dong hd
 where year(hd.ngay_lam_hop_dong ) = 2021);
 -- cau 8
-- c1
select khach_hang.ho_ten
from khach_hang
group by khach_hang.ho_ten;

-- c2
select distinct khach_hang.ho_ten
from khach_hang;
-- c3
select khach_hang.ho_ten
from khach_hang
union
select khach_hang.ho_ten
from khach_hang;

-- cau9
select month(ngay_lam_hop_dong) as thang, count(ma_khach_hang) as so_luong_khach_hang
from hop_dong
where year(ngay_lam_hop_dong) = 2021
group by thang
order by thang;
-- cau 10
select hop_dong.ma_hop_dong,
       hop_dong.ngay_lam_hop_dong,
       hop_dong.ngay_ket_thuc,
       hop_dong.tien_dat_coc,
       ifnull(SUM(hop_dong_chi_tiet.so_luong),0)
       -- SUM(hop_dong_chi_tiet.so_luong) as so_luong_dich_vu_di_kem
from hop_dong
         left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
group by hop_dong.ma_hop_dong; 
-- cau 11
select dich_vu_di_kem.ma_dich_vu_di_kem, dich_vu_di_kem.ten_dich_vu_di_kem
from khach_hang
         join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
         join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
         join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
         join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
where (loai_khach.ten_loai_khach = 'Diamond')
  and (khach_hang.dia_chi like '%Vinh%' or khach_hang.dia_chi like '%Quảng Ngãi%');
-- cau12
select hop_dong.ma_hop_dong,
       nhan_vien.ho_ten,
       khach_hang.ho_ten,
       khach_hang.so_dien_thoai,
       dich_vu.ten_dich_vu,
       sum(hop_dong_chi_tiet.so_luong) as so_luong_dich_vu_di_kem,
       hop_dong.tien_dat_coc,
       hop_dong.ngay_lam_hop_dong
from hop_dong
         join nhan_vien on nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
         join khach_hang on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
         join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
         left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
where hop_dong.ma_hop_dong in
      (select ma_hop_dong from hop_dong where hop_dong.ngay_lam_hop_dong between '2020-10-31' and '2020-12-31')
  and hop_dong.ma_hop_dong not in
      (select ma_hop_dong from hop_dong where hop_dong.ngay_lam_hop_dong between '2021-01-01' and '2021-06-31')
group by hop_dong.ma_hop_dong,dich_vu.ten_dich_vu;
-- cau13
select ten_dich_vu_di_kem, sum(so_luong) as so_luong_dich_vu_di_kem
from dich_vu_di_kem
         join hop_dong_chi_tiet on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
group by dich_vu_di_kem.ma_dich_vu_di_kem
having sum(so_luong) = (
    select max(so_luong_dich_vu_di_kem)
    from (
             select sum(so_luong) as so_luong_dich_vu_di_kem
             from hop_dong_chi_tiet
             group by ma_dich_vu_di_kem
         ) as ten_dich_vu_di_kem
);

-- cau14
select hop_dong.ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, count(1) as so_lan_su_dung
from hop_dong
         join hop_dong_chi_tiet hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
         join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
         join dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
         join loai_dich_vu on loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
where dich_vu_di_kem.ma_dich_vu_di_kem in (
    select dich_vu_di_kem.ma_dich_vu_di_kem
    from hop_dong_chi_tiet
             join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
    group by dich_vu_di_kem.ma_dich_vu_di_kem
    having count(1) = 1
)
group by hop_dong.ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem
order by ma_hop_dong;
-- cau15
select nv.ma_nhan_vien, ho_ten, td.ten_trinh_do, bp.ten_bo_phan, so_dien_thoai, dia_chi
from nhan_vien nv
         join hop_dong hd
              on hd.ma_nhan_vien = nv.ma_nhan_vien
         join trinh_do td
              on td.ma_trinh_do = nv.ma_trinh_do
         join bo_phan bp
              on bp.ma_bo_phan = nv.ma_bo_phan
where year (hd.ngay_lam_hop_dong) between 2020 and 2021
group by hd.ma_nhan_vien
having count(hd.ma_nhan_vien) <=3
order by ma_nhan_vien;
-- cau16.
set
sql_safe_updates = 0;
delete
from nhan_vien
where ma_nhan_vien not in
      (select ma_nhan_vien
       from hop_dong
       where year (
    hop_dong.ngay_lam_hop_dong) between 2019
  and 2021);
set
sql_safe_updates = 1;
-- câu 17 
create view temp_view1 as
	select
		kh.khid,
        lk.lkname,
		hd.hdid,
		hdct.hdcthdid,
		(dv.dvprice + sum(ifnull((hdct.soluong * dvdk.dvdkprice),0))) as tong_tien
	from
		khach_hang kh
	join hop_dong hd on hd.hdkhachhangid = kh.khid
	join dich_vu dv on hd.hddichvuid = dv.dvid
    join loai_khach lk on kh.khloaikhachid = lk.lkid
	left join hop_dong_chi_tiet hdct on hd.hdid = hdct.hdcthdid
	left join dich_vu_di_kem dvdk on hdct.hdctdvdkid = dvdk.dvdkid
	where year(hd.hdbegindate) = 2021
	group by kh.khid, hd.hdid, hdct.hdcthdid
	order by khid;
create view temp_view2 as
	select tv1.khid, sum(tv1.tong_tien) as tong_tien
	from temp_view1 tv1
	where tv1.lkname = 'Platinum'
	group by khid
    having sum(tv1.tong_tien) > 10000000;

-- step 3: FINAL STEP
set sql_safe_updates = 0;
update khach_hang kh
set kh.khloaikhachid = (select lk.lkid from loai_khach lk where lk.lkname = 'Diamond')
where kh.khid in (select tv2.khid from temp_view2 tv2);
set sql_safe_updates = 1;
-- cau 18
SET
foreign_key_checks = 0;
delete
kh
from khach_hang kh
where exists(
select 1
from hop_dong hd
where hd.ma_khach_hang =kh.ma_khach_hang and year(hd.ngay_lam_hop_dong)<2021
);
-- câu 19
set sql_safe_updates = 0;
update dich_vu_di_kem
set dich_vu_di_kem.gia = dich_vu_di_kem.gia*2
where dich_vu_di_kem.ma_dich_vu_di_kem in (
select cd.ma_dich_vu_di_kem
from hop_dong_chi_tiet cd join hop_dong co on cd.ma_hop_dong = co.ma_hop_dong
where year(co.ngay_lam_hop_dong) = 2020
group by cd.ma_dich_vu_di_kem
having sum(cd.so_luong) > 10
);

set sql_safe_updates = 1;
-- câu 20.
select ma_nhan_vien as id, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from nhan_vien
union all
select ma_khach_hang as id, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from khach_hang ;
-- câu 21
create view v_nhan_vien as
select nv.ma_nhan_vien as ma_nhan_vien1,nv.ho_ten,nv.ngay_sinh,nv.so_cmnd,nv.luong,nv.so_dien_thoai,nv.email,nv.dia_chi
from nhan_vien nv
join hop_dong hd on nv.ma_nhan_vien=hd.ma_nhan_vien
where dia_chi like '%hai chau%' and hd.ngay_lam_hop_dong between '2019-12-12 00:00:00' and '2019-12-13 00:00:00';
-- câu 22
create or replace view v_nhan_vien as
select nv.ma_nhan_vien as ma_nhan_vien1,nv.ho_ten,nv.ngay_sinh,nv.so_cmnd,nv.luong,nv.so_dien_thoai,nv.email,nv.dia_chi
from nhan_vien nv
join hop_dong hd on nv.ma_nhan_vien=hd.ma_nhan_vien
where dia_chi like '%lien chieu%' and hd.ngay_lam_hop_dong between '2019-12-12 00:00:00' and '2019-12-13 00:00:00' 
-- câu 23
delimiter //
create procedure sp_xoa_khach_hang (xoa_ma_khach_hang int)
begin
    if exists(select 1 from khach_hang where ma_khach_hang = xoa_ma_khach_hang)
        then delete from khach_hang where ma_khach_hang = xoa_ma_khach_hang;
    end if;
end //
delimiter
call sp_xoa_khach_hang(2);
-- câu 24
DELIMITER //

CREATE PROCEDURE sp_them_moi_hop_dong (
    IN p_ma_nhan_vien INT,
    IN p_ngay_lam_hop_dong DATE,
    IN p_loai_hop_dong VARCHAR(50)
)
BEGIN
    DECLARE v_count INT;
    
    -- Kiểm tra tính hợp lệ của dữ liệu bổ sung
    IF p_ma_nhan_vien IS NULL OR p_ngay_lam_hop_dong IS NULL OR p_loai_hop_dong IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Dữ liệu bổ sung không hợp lệ.';
    END IF;
    
    -- Kiểm tra trùng khóa chính
    SELECT COUNT(*) INTO v_count FROM hop_dong WHERE ma_nhan_vien = p_ma_nhan_vien AND ngay_lam_hop_dong = p_ngay_lam_hop_dong;
    IF v_count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Khóa chính đã tồn tại.';
    END IF;
    
    -- Thêm mới vào bảng hop_dong
    INSERT INTO hop_dong (ma_nhan_vien, ngay_lam_hop_dong, loai_hop_dong)
    VALUES (p_ma_nhan_vien, p_ngay_lam_hop_dong, p_loai_hop_dong);
    
    -- Đảm bảo toàn vẹn tham chiếu đến các bảng liên quan (nếu có)
    -- ... viết mã kiểm tra toàn vẹn tham chiếu ở đây (nếu cần)
    
    -- Thông báo thành công
    SELECT 'Thêm mới hop_dong thành công.' AS message;
    
END //
DELIMITER ;