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
--Một số hàm liên quan đến ngày giờ mà SQL hỗ trợ
/*
-DATEDIFF: Hàm tính khoảng cách (hiệu) 2 thời gian theo một đơn vị nào đó (ngày tháng, năm, giờ , phút, giây)
VD: DATEDIFF(d,Thời gian trừ,thời gian được trừ)
-DATEPART: Hàm lấy một phần trong giá trị thời gian (ngày, tháng, năm, giờ, phút, giây)
-YEAR,MONTH,DAY: Hàm lấy năm, tháng, ngày của một giá trị thời gian truyền vào.
-GETDATE: Hàm lấy ngày hiện hành của hệ thống
*/
--CAST: Chuyển đổi kiểu dữ liệu. VD:
--Chuyển đổi kiểu Lương từ float sang varchar để ghép với chuỗi tên giáo viên kiểu varchar: 
SELECT HOTEN + CAST(LUONG AS VARCHAR) 
FROM dbo.GIAOVIEN 
