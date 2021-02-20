USE HowKteam
GO
--STORE PROCEDURE
--Là chương trình hay thủ tục, Ta có thể dùng T-SQL EXCUTE (EXEC) Để thực thi các store procedure
--store procedure khác với các hàm xử lý giá trị trả về của chúng
--Không chứa trong tên và chúng không được sử dụng trực tiếp trong biểu thức

/* TÍNH CHẤT
Động: có thể chỉnh sửa khối lệnh, tái sử dụng nhiều lần
Nhanh hơn: Tự phân tích cú pháp cho tối ưu. Và tạo bản sao để lần chạy sau không cần thực thi lại từ đầu
Bảo mật: Giowis hạn quyền cho user nào được sử dụng, user nào không.
giảm bandwidth: Với các gói transaction lớn. Vài ngàn dòng lệnh cùng một lúc thì dùng store sẽ đảm bảo
*/

/* Cấu trúc
CREATE PROC <Tên store>
[paramter truyền vô nếu có]
AS
BEGIN
	<CODE CỬ LÝ> SELECT * FROM GIAOVIEN
END

Nếu chỉ là câu truy vấn thì có thể không cần begin và end
*/