USE HowKteam
GO

--GROUP BY - HAVING
--giải quyết trường hợp agreegate function không thể sử dụng trong WHERE
--Having giống như câu lệnh WHERE của SELECT nhưng nó giành cho GROUP BY
--Xuất ra số lượng giáo viên trong từng bộ môn mà số giáo viên > 1
SELECT TENBM,COUNT(*) AS 'SOGV' FROM dbo.GIAOVIEN,dbo.BOMON
WHERE BOMON.MABM=GIAOVIEN.MABM
GROUP BY TENBM
HAVING COUNT(*)>1

--Auto Increament tức là tự tăng giá trị số của trường đó, mặc định bắt đầu từ 1


CREATE TABLE TestAuto
(
	ID INT PRIMARY KEY IDENTITY , 
	-- tự tăng trường này. Phải là số. 
	-- Mặc định bắt đầu từ 1. và tăng 1 đơn vị
	Name NVARCHAR(100)
)
GO

INSERT dbo.TestAuto( Name )VALUES (N'')
INSERT dbo.TestAuto( Name )VALUES (N'')
INSERT dbo.TestAuto( Name )VALUES (N'')
INSERT dbo.TestAuto( Name )VALUES (N'')
INSERT dbo.TestAuto( Name )VALUES (N'')
INSERT dbo.TestAuto( Name )VALUES (N'')
INSERT dbo.TestAuto( Name )VALUES (N'')

CREATE TABLE TestAuto2
(
	ID INT PRIMARY KEY IDENTITY(5, 10), -- Tự tăng. Bắt đầu từ 5. Mỗi lần tăng 10 đơn vị
	Name NVARCHAR(100)
)
GO

INSERT dbo.TestAuto2( Name )VALUES (N'')
INSERT dbo.TestAuto2( Name )VALUES (N'')
INSERT dbo.TestAuto2( Name )VALUES (N'')
INSERT dbo.TestAuto2( Name )VALUES (N'')
INSERT dbo.TestAuto2( Name )VALUES (N'')
INSERT dbo.TestAuto2( Name )VALUES (N'')
INSERT dbo.TestAuto2( Name )VALUES (N'')

