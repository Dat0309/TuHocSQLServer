USE HowKteam
GO

--View : là một table ảo-tạm, cập nhật dữ liệu mà view truy vấn tới mỗi khi lấy view ra xài.
--Tức là mỗi khi table gốc có sự thay đổi dữ liệu, thì table view cũng tự động thay đổi theo bảng gốc.
--View sẽ được tạo từ một truy vấn, sử dụng view như một bảng bình thường
CREATE VIEW testView AS
SELECT * FROM dbo.BOMON

SELECT * FROM testview
-- Tạo ra view TestView từ câu truy vấn
CREATE VIEW TestView as
SELECT * FROM dbo.GIAOVIEN

SELECT * FROM testview

UPDATE dbo.GIAOVIEN SET LUONG = 90
WHERE MAGV = '006'

SELECT * FROM TestView

-- xóa view
DROP VIEW TestView

-- update view
Alter VIEW TestView as
SELECT HOTEN FROM dbo.GIAOVIEN

-- tạo view có dấu
CREATE VIEW [Giáo dục miễn phí] AS
SELECT * FROM dbo.KHOA

SELECT * FROM [Giáo dục miễn phí]

--CHECK Là điều kiện nhập dữ liệu do người quản lý db đặt ra
--Có thể tạo check y như tạo khóa chính
CREATE TABLE TestCheck
(
	id INT PRIMARY KEY IDENTITY,
	Luong INT CHECK(Luong > 3000 AND Luong < 9000)
)
INSERT dbo.TestCheck
        ( Luong )
VALUES  ( 4000)

SELECT * FROM testcheck
--Tạo Check ngay khi tạo table
--CREATE TABLE TestCheck
--(
--	id INT PRIMARY KEY IDENTITY,
--	Luong INT,
--	CHECK(Luong > 3000 AND Luong < 9000)
--)
--Tạo Check sau khi tạo table
--ALTER TABLE dbo.TestCheck ADD CONSTRAINT CK_Luong
--CHECK (Luong > 3000 AND Luong < 9000)