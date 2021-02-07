--Truy vấn kết hợp điều kiện
--Dùng WHERE giống như IF
USE HowKteam
GO

SELECT gv.MAGV, gv.HOTEN,nt.TEN FROM dbo.GIAOVIEN AS gv ,dbo.NGUOITHAN AS nt
WHERE gv.MAGV =nt.MAGV

--Tìm tên giáo viên quản lý đề tài 
SELECT gv.MAGV,gv.HOTEN,dt.TENDT,dt.GVCNDT FROM dbo.DETAI AS dt,dbo.GIAOVIEN AS gv
WHERE dt.GVCNDT=gv.MAGV.

--Tìm tên đề tài tương ứng với tên chủ đề của đề tài đó
SELECT dt.TENDT,dt.MADT,cd.TENCD FROM dbo.DETAI AS dt,dbo.CHUDE AS cd
WHERE dt.MACD=cd.MACD

--Lấy ra giáo viên lớn hơn 50 tuổi
SELECT * FROM dbo.GIAOVIEN
WHERE YEAR(GETDATE())-YEAR(NGSINH)>50

--Lấy ra giáo viên là trưởng bộ môn
SELECT gv.* FROM dbo.GIAOVIEN AS gv, dbo.BOMON AS bm
WHERE gv.MAGV=bm.TRUONGBM

--COUNT(*) đếm số lượng tất cả record
--COUNT(tên trường cần đếm)
SELECT COUNT(*) AS N'Số lượng đề tài' FROM dbo.DETAI
--AVG(Tên column) dùng để tính giá trị trung bình của một cột có giá trị số
SELECT AVG(LUONG) AS 'TBLUONG' FROM dbo.GIAOVIEN
--SUM(tên column) là hàm tính tổng giá trị cảu một cột 
--Lấy tên giáo viên và tên đề tài người đó tham gia khi mà người đó tham gia nhiều hơn 1 lần, dùng truy vấn lồng