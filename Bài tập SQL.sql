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
----------------------------------------------------------------
--Truy vấn lồng nâng cao
----------------------------------------------------------------
--Các phép toán tập hợp: Phép trừ, Giao, Hội
--Phép trừ: sử dụng toán tử EXCEPT, truy vấn lồng với NOT EXISTS(Bài Nâng cao) hoặc NOT IN(Baì Bình thường)
--VD: Tìm các giáo viên không tham gia đề tài nào = Tất cả giáo viên trừ giáo viên có tham gia đề tài
SELECT GV.MAGV,GV.HOTEN
FROM dbo.GIAOVIEN GV
EXCEPT 
SELECT TG.MAGV,GV.HOTEN
FROM  dbo.THAMGIADT TG JOIN dbo.GIAOVIEN GV ON TG.MAGV=GV.MAGV
----------------------------
SELECT GV.MAGV,GV.HOTEN
FROM dbo.GIAOVIEN GV
WHERE NOT EXISTS(
				SELECT TG.MAGV
				FROM  dbo.THAMGIADT TG 
				WHERE TG.MAGV=GV.MAGV)
---------------------------
SELECT GV.MAGV,GV.HOTEN
FROM dbo.GIAOVIEN GV
WHERE GV.MAGV  NOT IN (	SELECT TG.MAGV
						FROM  dbo.THAMGIADT TG)

-- Phép giao: Lấy ra tập hợp các phần tử giống nhau giữa A & B
-- Sử dụng toán tử INTERSECT hoặc EXISTS, IN 
--Tìm các giáo viên vừa tham gia đề tài, vừa làm trưởng bộ môn:
SELECT GV.MAGV, GV.HOTEN
FROM dbo.GIAOVIEN GV JOIN dbo.THAMGIADT TG 
ON TG.MAGV = GV.MAGV
INTERSECT
SELECT GV.MAGV,GV.HOTEN
FROM dbo.BOMON BM JOIN dbo.GIAOVIEN GV
ON BM.TRUONGBM= GV.MAGV
------------------------------------
SELECT GV.MAGV,GV.HOTEN
FROM dbo.GIAOVIEN GV
WHERE EXISTS (	SELECT TG.MAGV
				FROM dbo.THAMGIADT TG
				WHERE TG.MAGV=GV.MAGV)
		AND
		EXISTS(	SELECT BM.TRUONGBM
				FROM dbo.BOMON BM
				WHERE BM.TRUONGBM=GV.MAGV)
-----------------------------
--PHÉP HỢP: sử dụng toán tử UNION (Cá dòng trùng lặp sẽ được bỏ đi), UNIONALL (Lấy tất cả các dòng của các bảng)
--Liệt kê những giáo viên có tham gia đề tài và giáo viên là chủ bộ môn.

--Phép chia: Thông thường đề có chữ "tất cả" 
--Tìm các giáo viên mà tham gia tất cả các đề tài :

--Tìm các giáo viên / Mà không có đề tài nào / mà đề tài đó không được phân công giáo viên đó làm:
SELECT DISTINCT TG.MAGV--Tìm các giáo viên 
FROM dbo.THAMGIADT TG
WHERE NOT EXISTS (		SELECT *--Mà không có đề tài nào
						FROM dbo.DETAI DT
						WHERE NOT EXISTS (		SELECT *--mà đề tài đó không được phân công giáo viên đó làm
												FROM dbo.THAMGIADT TG2
												WHERE TG2.MAGV=TG.MAGV AND DT.MADT=TG2.MADT ))

--Tìm tên các giáo viên 'HTTT' mà tham gia tất cả các đề tài thuộc chủ đề 'QLGD'

--Tìm tên các giáo viên BM HTTT / mà không có đề tài của chủ đề QLGD nào / mà các giáo viên đó không làm
SELECT  DISTINCT GV.MAGV,GV.HOTEN
FROM	dbo.THAMGIADT TG JOIN dbo.GIAOVIEN GV ON GV.MAGV = TG.MAGV --Tập kết quả
WHERE	GV.MABM='HTTT'
		AND
        NOT EXISTS (SELECT * 
					FROM dbo.DETAI DT --Tập chia
					WHERE DT.MACD='QLGD' 
					AND NOT EXISTS( SELECT * 
									FROM dbo.THAMGIADT TG2 --Tập bị chia
									WHERE TG2.MADT=TG2.MADT --Điều kiện do sánh với tập chia
									 AND TG.MAGV=TG2.MAGV))--Điều kiện so sánh với tập kết quả 