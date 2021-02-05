CREATE DATABASE TruongHoc

CREATE TABLE Mon
(
MaBM CHAR(10) PRIMARY KEY,--Khóa nội
Ten NVARCHAR(100) DEFAULT N'Tên bộ môn'
)
CREATE TABLE Class
(
MaLop CHAR(10) PRIMARY KEY,--Khóa nội
Ten NVARCHAR(100) DEFAULT N'Tên lớp'
)
GO
--Điều kiện để tạo khóa ngoại
--Tham chiếu tới khóa chính
--Unique,not null, cùng kiểu dữ liệu, cùng số lượng trường, có sắp xếp tuần tự
--Đảm bảo toàn vẹn dữ liệu, không có trường hợp tham chiếu tới kiểu dữ liệu không tồn tại
CREATE TABLE Teacher
(
MaGV CHAR(10) PRIMARY KEY,--Khóa nội
Ten NVARCHAR(100) DEFAULT N'Tên giáo viên',
DiaChi NVARCHAR(100) DEFAULT N'Địa chỉ giáo viên',
NgaySinh DATE,
GT BIT,
MaBM CHAR(10), --Khóa ngoại để truy xuất dữ liệu của khóa nội MaBM trong bảng BoMon
 FOREIGN KEY(MaBM) REFERENCES dbo.Mon(MaBM) --Cách tạo khóa ngoại ngay khi tạo bảng
)
GO
 CREATE TABLE Studen
 (
 MaHS CHAR(10) PRIMARY KEY,--Khóa nội
 Ten NVARCHAR(100) DEFAULT N'Tên học sinh',
 Lop CHAR(10),--Khóa Ngoại để tham chiếu tới dữ liệu của khóa nội MaLop
 Diem FLOAT
 )
 GO
 --Tạo khóa ngoại ở ngoài bảng, sau khi tạo bảng
 ALTER TABLE dbo.Studen ADD CONSTRAINT FKHS FOREIGN KEY (Lop) REFERENCES dbo.Class (MaLop)
 --Đặt tên cho khóa ngoại (CONSTRAINT) để sau này dễ xóa khóa ngoại, ví dụ:
 --ALTER TABLE dbo.HocSinh DROP CONSTRAINT FKHS 
	INSERT dbo.Mon
	VALUES
	 (   '2', -- MaBM - char(10)
     N'' -- Ten - nvarchar(100)
     )

	 INSERT dbo.Teacher
	 VALUES
	 (   'GV02',        -- MaGV - char(10)
	     N'Dũng',       -- Ten - nvarchar(100)
	     N'Đà Lạt',       -- DiaChi - nvarchar(100)
	     '19800104', -- NgaySinh - date
	     2,      -- GT - bit
	     '1'         -- MaBM - char(10)
	     )

		 INSERT dbo.Class
		 VALUES
		 (   'QTK43', -- MaLop - char(10)
		     N'Quản Trị' -- Ten - nvarchar(100)
		     )

			 INSERT dbo.Studen
			 VALUES
			 (   '003',  -- MaHS - char(10)
			     N'Duy Danh', -- Ten - nvarchar(100)
			     'QTK43',  -- Lop - char(10)
			     8.0  -- Diem - float
			     )