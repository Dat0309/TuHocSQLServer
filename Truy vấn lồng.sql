--Truy vấn lồng
USE HowKteam
GO

--Kiểm tra xem giáo viên 001 có phải là GVQLCM hay không
--lấy ra danh sách các GVQLCM, sau đó kiểm tra xem có giáo viên nào trong DSGV có MAGV nằm trong danh sách GVQLCM
SELECT * FROM dbo.GIAOVIEN
WHERE MAGV ='001'
AND MAGV IN --kiểm tra xem MAGV 001 có nằm trong DS GVQLCM không
(
SELECT GVQLCM FROM dbo.GIAOVIEN
)

--Cấu trúc truy vấn lồng trong From
SELECT * FROM
 dbo.GIAOVIEN AS GV, (SELECT * FROM dbo.BOMON) AS BM
 WHERE gv.MABM=bm.MABM

 --VD:
 --Xuất ra ds giáo viên tham gia nhiều hơn một đề tài
 SELECT * FROM dbo.GIAOVIEN AS gv --Lấy ra tất cả thông tin của bảng giáo viên
 WHERE 1< --Khi số lượng đề tài giáo viên tham gia lớn hơn 1 
 (
 SELECT COUNT(*) FROM dbo.THAMGIADT --Tìm số lượng đề tài giáo viên 
 WHERE MAGV=gv.MAGV
 )

 --Xuất ra thông tin giáo viên có hơn 2 người thân
 SELECT * FROM dbo.GIAOVIEN AS gv
 WHERE 1<
 (
 SELECT COUNT(*) FROM dbo.NGUOITHAN
 WHERE MAGV=gv.MAGV
 )

--Xuất ra thông tin của khoa mà có nhiều hơn 2 giáo viên
SELECT * FROM dbo.KHOA AS k
WHERE 2< 
(
SELECT COUNT(*) FROM dbo.BOMON AS bm, dbo.GIAOVIEN AS gv
WHERE bm.MAKHOA=k.MAKHOA 
AND bm.MABM=gv.MABM
)

-- Sắp xếp giảm dần 
--select MAGV from dbo.giaovien
--order by magv desc(giảm) /asc (tăng)

--BÀI TẬP
/*2. Xuất ra danh sách các giáo viên lớn tuổi trung bình giáo viên trong trường

Lấy ra danh sách (MaGV, Tuoi) as GVT

Kiểm tra mã GV tồn tại trong GVT2 là đúng*/
SELECT * FROM dbo.GIAOVIEN AS GV2
WHERE YEAR(GETDATE())-YEAR(GV2.NGSINH) >
(
SELECT AVG(YEAR(GETDATE())-YEAR(GV.NGSINH))AS 'TUOI' FROM dbo.GIAOVIEN AS GV
)

