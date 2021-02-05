USE HowKteam
GO
SELECT * FROM dbo.CONGVIEC --* tức là lấy hết toàn bộ dữ liệu từ bảng
--Lấy mã đề tài và ngày kiểm tra, ngắn cách bởi dấu phấy
SELECT MADT,NGAYKT FROM dbo.CONGVIEC
--Đổi tên cột dùng AS
SELECT MADT AS N'Đạt' FROM dbo.CONGVIEC
--Truy xuất nhiều bảng cùng lúc
SELECT * FROM dbo.CHUDE,dbo.DETAI
SELECT * FROM dbo.DETAI