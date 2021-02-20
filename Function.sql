USE HowKteam
GO
--Function 
CREATE FUNCTION UF_LuongGV(@MaGV CHAR(10))
RETURNS INT
AS
BEGIN
DECLARE @Luong INT
SELECT @Luong = Luong FROM dbo.GIAOVIEN WHERE @MaGV=MAGV
RETURN @Luong
END
GO

SELECT * FROM dbo.GIAOVIEN
WHERE LUONG =(
SELECT dbo.UF_LuongGV('001') AS L)
go
--Tạo hàm xác định số truyền vào có phải là số chẵn hay không
CREATE FUNCTION UF_IsOdd(@Num int)
RETURNS nvarchar(20)
AS
BEGIN
IF (@Num % 2 =0)
RETURN N'Số Chẵn'
ELSE RETURN N'Số Lẻ'

RETURN N'Không xác định'
END

SELECT dbo.UF_IsOdd(YEAR(GETDATE())-YEAR(NGSINH)) FROM dbo.GIAOVIEN