USE HowKteam
GO
--Trigger để can thiệp vào từng sự kiện trong table
--Trigger sẽ được gọi mỗi khi có thao tác thay đổi thông tin bảng
--Inserted: Chứa những trường đã insert hoặc update
--Deleted: Chứa những trường đã bị xóa khỏi bảng
ALTER TRIGGER UTG_InsertGV
ON dbo.GIAOVIEN
FOR INSERT,UPDATE
AS
BEGIN
	--ROLLBACK TRAN --Hủy bỏ Thay đổi cập nhật bảng
	PRINT N'Đã cập nhật bảng'--Khi insert hoặc update table, trương trình sẽ tự động chạy trigger này và hiển thị ra màn hình dòng lệnh
END
GO
INSERT dbo.GIAOVIEN
(
    MAGV,
    HOTEN,
    LUONG,
    PHAI,
    NGSINH,
    DIACHI,
    GVQLCM,
    MABM
)
VALUES
(   N'011',       -- MAGV - nchar(3)
    N'dat',       -- HOTEN - nvarchar(50)
    0.0,       -- LUONG - float
    N'Nam',       -- PHAI - nchar(3)
    GETDATE(), -- NGSINH - date
    N'',       -- DIACHI - nchar(50)
    N'002',       -- GVQLCM - nchar(3)
    N'MMT'        -- MABM - nchar(4)
    )
----------------------------------------------
--VD: Không cho phép xóa thông tin của giáo viên có tuổi lớn hơn 40
ALTER TRIGGER UTG_OlderThan40
ON dbo.GIAOVIEN
FOR DELETE
AS
BEGIN
	DECLARE @Count INT=0

	SELECT @Count=COUNT(*) FROM Deleted AS de
	WHERE YEAR(GETDATE())-YEAR(de.NGSINH) <1

	IF(@Count >0)
		BEGIN
			PRINT N'Không được xóa người bé hơn 1 tuổi'
			ROLLBACK TRAN 
		END
END

SELECT * FROM dbo.GIAOVIEN
DELETE dbo.GIAOVIEN WHERE MAGV ='011'