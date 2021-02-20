USE HowKteam
GO
--Bài tập luyện hàm kết hợp, gom nhóm, truy vấn lồng
--a.Cho biết danh sách tất cả các giáo viên và họ tên giáo viên quản lý chuyên môn của họ
--Vì là lấy danh sách tất cả giáo viên nên ta sẽ lấy tất cả giáo viên ở bảng bên trái và lấy phần giao nhau của bảng bên phải.
SELECT GV2.MAGV, GV1.HOTEN, GV2.HOTEN AS GVQL
FROM dbo.GIAOVIEN as GV1 LEFT JOIN dbo.GIAOVIEN AS GV2 ON GV1.GVQLCM=GV2.MAGV
--b.Cho biết danh Sách tất cả các bộ môn và tên trưởng bộ môn đó
SELECT * FROM dbo.BOMON

SELECT BM.MABM,BM.TENBM,GV.HOTEN AS TRUONGBM
FROM dbo.BOMON BM LEFT JOIN dbo.GIAOVIEN GV ON GV.MAGV=BM.TRUONGBM
--Lấy ra danh sách giáo viên có nhiệm vụ quản lý chuyên môn, mà giáo viên này thuộc bộ môn HTTT
SELECT COUNT(DISTINCT(GVQLCM))
FROM dbo.GIAOVIEN 
WHERE MABM ='HTTT'

----------------------------------
--Gom nhóm với GROUP BY
--Với mỗi bộ môn, cho biết mã bộ môn và số lượng giáo viên của bộ môn đó
SELECT BOMON.MABM,COUNT(GIAOVIEN.HOTEN) AS SL 
FROM dbo.BOMON left JOIN dbo.GIAOVIEN ON GIAOVIEN.MABM=BOMON.MABM
GROUP BY BOMON.MABM --Gom nhớm bộ môn

--Truy vấn lồng
--Với mỗi bộ môn, cho biết tên bộ môn và số lượng giáo viên của bộ môn đó
SELECT TENBM ,(	SELECT COUNT(GIAOVIEN.MAGV)
				FROM dbo.GIAOVIEN
				WHERE GIAOVIEN.MABM=BOMON.MABM)
FROM dbo.BOMON 
--Cho biết người thân của giáo viên HTTT
SELECT *
FROM dbo.NGUOITHAN NT
WHERE NT.MAGV IN (	SELECT GV.MAGV
					FROM dbo.GIAOVIEN GV
					WHERE GV.MABM = 'HTTT')