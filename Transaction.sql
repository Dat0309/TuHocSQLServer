USE HowKteam
GO
--Transaction
SELECT * FROM dbo.NGUOITHAN

BEGIN TRANSACTION
DELETE dbo.NGUOITHAN WHERE TEN=N'Hùng'
--Chuỗi thao tác loằng ngoằng phức tạp
ROLLBACK --Kiểu như quay ngược thời gian lại lúc BEGIN TRANSACTION, Hùng sẽ không bị xóa    

BEGIN TRANSACTION
DELETE dbo.NGUOITHAN WHERE TEN=N'Hùng'
--Chuỗi thao tác loằng ngoằng phức tạp
COMMIT --Chấp nhận cho xóa Hùng khỏi table