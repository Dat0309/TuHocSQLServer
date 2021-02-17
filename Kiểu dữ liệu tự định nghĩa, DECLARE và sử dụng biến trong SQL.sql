--Kiểu dữ liệu tự định nghĩa
USE HowKteam
GO
--Cấu trúc:
--EXEC sp_addtype 'Tên kiểu dữ liệu', 'Kiểu dữ liệu thực tế', 'Not null'(có hay không cũng không sao)
--Dữ liệu tự định nghĩa khi tạo ra sẽ được lưu ở Programmability-Types-User-defined data types
EXEC sp_addtype 'Dat','nvarchar(100)','Not null' 

CREATE TABLE testType1
(
Name Dat,
Address NVARCHAR(100)
)
GO
--Xóa type
EXEC sp_droptype 'Dat'
                    
------------------------------------------------------------------------
--Declare và sử dụng biến trong SQL
------------------------------------------------------------------------
--Tạo biến để lưu lại và tái sử dụng, không phải rườm rà trong những câu truy vấn lồng khó.
--vd: Lấy ra tuổi của giáo viên có lương thấp nhất.
--Tìm ra Mã giáo viên có lương thấp nhất.
SELECT MAGV FROM dbo.GIAOVIEN WHERE LUONG=(SELECT MIN(LUONG) FROM dbo.GIAOVIEN)
--Lấy ra tuổi của giáo viên có mã giáo viên trùng với mã giáo viên trên
SELECT YEAR(GETDATE()) - YEAR(NGSINH) FROM dbo.GIAOVIEN 
WHERE MAGV = (SELECT MAGV FROM dbo.GIAOVIEN WHERE LUONG=(SELECT MIN(LUONG) FROM dbo.GIAOVIEN))

--------Cách 2: sử dụng biến lưu trữ
--Tạo ra một biến kiểu char lưu trữ mã giáo viên lương thấp nhất
DECLARE @MinLuong CHAR(10)
SELECT @MinLuong =MAGV FROM dbo.GIAOVIEN WHERE  LUONG=(SELECT MIN(LUONG) FROM dbo.GIAOVIEN)
SELECT YEAR(GETDATE()) - YEAR(NGSINH) FROM dbo.GIAOVIEN WHERE MAGV = @MinLuong

--Khởi tạo với giá trị mặc định
DECLARE @a INT =0
--Khởi tạo bình thường
DECLARE @b INT 
--set dữ liệu cho biến
SET @a +=1
--DECLARE chỉ tạo ra một biến đơn để lưu trữ.
