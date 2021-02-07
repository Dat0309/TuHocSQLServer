USE HowKteam
GO

--Tìm kiếm gần đúng
--Dùng Like để tìm kiếm gần đúng
--Đặt dấu % ở trướng hoặc ở sau tùy theo nhu cầu tìm kiếm, vd
--Tìm tên kết thúc có chữ h
SELECT * FROM dbo.GIAOVIEN
WHERE HOTEN LIKE '%h'
--Tìm người tên Sơn
SELECT * FROM dbo.GIAOVIEN
WHERE HOTEN LIKE N'%Sơn'


--inner Join kiểu cũ là những tao tác truy vấn (select) đi kèm với điều kiện
SELECT * FROM dbo.GIAOVIEN
WHERE HOTEN LIKE '%h'

--inner join kiểu đúng: inner join sẽ tạo ra một vùng chứa các trường có thuộc tính giống nhau (khóa chính, khóa ngoại)
SELECT *FROM dbo.GIAOVIEN INNER JOIN dbo.BOMON
ON BOMON.MABM = GIAOVIEN.MABM
--Join kết hợp điều kiện where
SELECT GV.MAGV,GV.HOTEN,GV.PHAI,BM.TENBM, K.TENKHOA
FROM dbo.BOMON AS BM
     JOIN dbo.GIAOVIEN AS GV ON GV.MABM = BM.MABM
     JOIN dbo.KHOA AS K ON K.MAKHOA = BM.MAKHOA
WHERE GV.PHAI ='NAM'
--ON sẽ lấy nhũng trường có thuộc tính giống nhau có thể tạo ra điều kiện để truy vấn và nhắc lệnh
 --ON Sẽ nhắc chúng ta nên dùng những điều kiện nào để truy vấn, không giống như where phải tự nghĩ ra điều kiện
 --Nên sử dụng inner join!

 --full Outer join
 --là mệnh đề truy vấn với kết quả trả về là tập hợp tất cả dữ liệu chung và riêng giữa thông qua điều kiện kết hợp 2 bảng
 --các dữ liệu riêng là các dữ liệu không có điểm trùng khớp với điều kiện thì các trường ở bảng sẽ hiển thị là NULL
 --Cấu trúc
 --SELECT <Danh sách column>
--FROM <Table A> FULL OUTER JOIN <Table B>
--ON <Điều kiện kết hợp AB>
--Cần cẩn trọng trong việ sử dụng, do kết quả trả về rất lớn
--vd: những trường hợp sử dụng outer join, 

--Hiển thị thông tin giáo viên đã chủ nhiệm đề tài và những giáo viên chưa chủ nhiệm đề tài để phân nhiệm vụ
SELECT GV.MAGV, GV.HOTEN, DT.MADT,DT.TENDT
FROM dbo.GIAOVIEN AS GV
FULL OUTER JOIN dbo.DETAI AS DT ON DT.GVCNDT = GV.MAGV
--Xuất thông tin bộ môn đã có giáo viên dạy và chưa có:
SELECT BM.MABM, BM.TENBM, GV.MAGV,GV.HOTEN
FROM dbo.BOMON AS BM
FULL OUTER JOIN dbo.GIAOVIEN AS GV ON GV.MABM = BM.MABM
--Xuất giáo viên phái nữ chưa có đề tài nào quản lý
SELECT dt.MADT,dt.TENDT,dt.GVCNDT,gv.MAGV,gv.HOTEN,gv.PHAI
FROM dbo.DETAI AS dt 
FULL OUTER JOIN dbo.GIAOVIEN AS gv ON gv.MAGV=dt.GVCNDT
WHERE gv.PHAI=N'Nữ'
