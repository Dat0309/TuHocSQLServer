USE HowKteam
GO
--IF - ELSE trong T-SQL

DECLARE @tbLuong INT
SELECT @tbLuong = AVG(LUONG) FROM dbo.GIAOVIEN
--nếu lương của giáo viên lớn hơn lương trung bình thì xuất ra lớn hơn hoặc ngược lại
DECLARE @magv CHAR(10)='010'
PRINT @magv
DECLARE @luongMagv INT
SELECT @luongMagv = Luong FROM dbo.GIAOVIEN WHERE MAGV=@magv
IF @luongMagv > @tbLuong 
--begin
PRINT N'Lớn hơn'--Nếu có nhiều khối lệnh thì nên đưa vào cặp begin - end
--end
ELSE PRINT N'Nhỏ hơn' 
----------------------------------------------------------------------------
--Vòng lặp trong T-SQL
----------------------------------------------------------------------------
--WHILE được sử dụng trong SQL
DECLARE @i INT =0
WHILE (@i<10)
BEGIN
PRINT @i
SET @i+=1
END
----------------------------------------------------------------------------
--Cursor trong T-SQL
----------------------------------------------------------------------------
--Khi có nhu cầu duyệt từng record của bảng, với mỗi record có kết quả xử lý riêng thì dùng cursor

--Khởi tạo con trỏ dựa trên câu truy vấn,Con trỏ sẽ dựa vào bảng kết quả trả về của câu truy vấn
--DECLARE <tên con trỏ> cursor for <câu select> 
--Mở con trỏ ra sử dụng
--Open <Tên con trỏ>
--Đưa tên con trỏ vào các biến tương ứng
--FETCH NEXT FROM <tên con trỏ> INTO <Danh sách các biến tương ứng kết quả truy vấn>

--Thực hiện vòng lặp 

--WHILE @@FETCH_STATUS = 0
--BEGIN
--Câu lệnh thực hiện
--FETCH NEXT lại lần nữa
--FETCH NEXT FROM <Tên con trỏ> INTO <Danh sách các biến tương ứng kết quả truy vấn>
--END

--CLOSE <tên co trỏ>(Đóng con trỏ)
--DEALLOCATE <tên con trỏ> (Hủy vùng nhớ mà nó xin cấp phép) 

-------------------------
--VD:Từ tuổi của giáo viên, nếu lớn hơn giáo viên thì cho lương là 3000
--Nếu nhỏ hơn 40 và lớn hơn 30 thì cho lương 2000, ngược lại cho 1000
DECLARE GVCursor CURSOR FOR SELECT MAGV,YEAR(GETDATE())-YEAR(NGSINH) FROM dbo.GIAOVIEN

OPEN GVCursor

DECLARE @magv CHAR(10)
DECLARE @tuoi INT

FETCH NEXT FROM GVCursor INTO @magv,@tuoi
WHILE @@FETCH_STATUS =0
	BEGIN
	IF @tuoi > 50
		BEGIN 
		UPDATE dbo.GIAOVIEN SET LUONG = 3000 WHERE MAGV=@magv
		END
	ELSE 
	IF @tuoi >40
		BEGIN 
		UPDATE dbo.GIAOVIEN SET LUONG = 2000 WHERE MAGV=@magv
		END
		ELSE 
		BEGIN
		UPDATE dbo.GIAOVIEN SET LUONG = 1000 WHERE MAGV=@magv
		END
		FETCH NEXT FROM GVCursor INTO @magv,@tuoi
	END

CLOSE GVCursor
DEALLOCATE GVCursor
SELECT * FROM dbo.GIAOVIEN