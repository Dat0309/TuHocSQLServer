USE HowKteam
GO

--GROUP BY sử dụng trong trường hợp thao tác với Agreegate Function
--Agreegate function:
/*
AVG()	Returns the average value
COUNT()	Returns the number of rows
FIRST()	Returns the first value
LAST()	Returns the last value
MAX()	Returns the largest value
MIN()	Returns the smallest value
ROUND()	Rounds a numeric field to the number of decimals specified
SUM()	Returns the sum
*/

 /*
string function

CHARINDEX	Tìm một phần tử có tồn tại ở trong chuỗi hay không
CONCAT()	 Cắt chuỗi
LEFT()		Lấy ra bên trái
LEN() / LENGTH()	Returns the length of the value in a text field
LOWER() / LCASE()	Converts character data to lower case
LTRIM()	 
SUBSTRING() / MID()	Extract characters from a text field
PATINDEX()	 
REPLACE()	Thay thế 
RIGHT()		Thấy bên phải
RTRIM()	 
UPPER() / UCASE()	Converts character data to upper case
*/
--Xuất ra Danh sách tên bộ môn và số lượng giáo viên của bộ môn đó
SELECT TENBM,COUNT(*) FROM dbo.BOMON,dbo.GIAOVIEN
WHERE BOMON.MABM=GIAOVIEN.MABM
GROUP BY TENBM --Cột hiển thị phải là thuộc tính nằm trong khối group by hoặc là agrregate function

--Lấy ra tên giáo viên và số lượng đề tài giáo viên đó làm
SELECT gv.HOTEN,COUNT(*) FROM dbo.GIAOVIEN AS gv, dbo.THAMGIADT AS tg
WHERE gv.MAGV=tg.MAGV
GROUP BY gv.HOTEN

/*
Bài tập:
1.Xuất ra tên giáo viên và số lượng người thân của giáo viên đó
2.Xuất ra tên giáo viên và số lượng đề tài đã hoàn thành mà giáo viên đó tham gia
3.Xuất ra tên khoa có tổng số lương của giáo viên trong khoa là lớn nhất
*/
--1.
SELECT HOTEN,COUNT(*) AS N'NGƯỜI THÂN' FROM dbo.GIAOVIEN,dbo.NGUOITHAN
WHERE GIAOVIEN.MAGV=NGUOITHAN.MAGV
GROUP BY HOTEN
--2
SELECT HOTEN,COUNT(*)AS N'SỐ LƯỢNG ĐỀ TÀI' FROM dbo.GIAOVIEN, dbo.THAMGIADT
WHERE GIAOVIEN.MAGV=THAMGIADT.MAGV
GROUP BY HOTEN
--3
SELECT TENKHOA,COUNT(*) AS 'BM' FROM dbo.KHOA,dbo.BOMON
WHERE KHOA.MAKHOA=BOMON.MAKHOA 
GROUP BY TENKHOA

