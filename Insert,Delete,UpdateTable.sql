-- thêm dữ liệu
--Kiểu số -> đưa vào số bình thường, không cần ''
--Kiểu ký tự hoặc ngày cần để trong cặp ''
--nếu là tiếng việt thì cần phải có N trước cặp ''

    
	CREATE TABLE DSLop
	(
	MaSV NCHAR(10),
	HTen NVARCHAR(20),
	NS DATE,
	GioiTinh BIT,
	Diem FLOAT
	)
	GO

    INSERT dbo.DSLop
    VALUES
    (   N'1914775',       -- MaSV - nchar(10)
        N'Đinh Trọng Đạt',       -- HTen - nvarchar(20)
        '20010309', -- NS - date
        1,      -- GioiTinh - bit
        9.0        -- Diem - float
        )
		 INSERT dbo.DSLop
    VALUES
    (   N'1914154',       -- MaSV - nchar(10)
        N'Đào Xuân Hải',       -- HTen - nvarchar(20)
        '20010504', -- NS - date
        1,      -- GioiTinh - bit
        8.0        -- Diem - float
        )
		 INSERT dbo.DSLop
    VALUES
    (   N'1914647',       -- MaSV - nchar(10)
        N'Trần Minh Cảnh',       -- HTen - nvarchar(20)
        '20000305', -- NS - date
        2,      -- GioiTinh - bit
        9.0        -- Diem - float
        )
        
		--xóa dữ liệu DELETE
		--Nếu chỉ dùng delete sẽ xóa hết bảng
		--nếu muốn xóa một đối tượng nhất định, dùng where kết hợp với các toán tử <,>,<=,>=,=,<>,and, or
		DELETE dbo.DSLop WHERE MaSV = '1914775'

		--update dữ liệu
		-- tương tự thao tác DELETE

		UPDATE dbo.DSLop SET Diem = 9.5 WHERE Diem = 8.0