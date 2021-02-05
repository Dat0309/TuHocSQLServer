--tạo khóa chính
-- Unique: duy nhất -> trong toàn bộ bảng, trường nào có từ khóa Unique thì không thể có 2 giá trị trùng nhau
-- Not Null là trường đó hông được phép null
-- Default: giá trị mặc định của trường đó nếu không gán giá trị khi insert
-- PRIMARY KEY bao gồm Unique và Not null, có thể cho khóa ngoại tham chiếu
CREATE TABLE DSKey
(
MaSV INT NOT NULL,
Ten NVARCHAR(10),
Lop NCHAR(100) DEFAULT N'CTK43',
Diem FLOAT


)

ALTER TABLE dbo.DSKey ADD PRIMARY KEY (MaSV)

INSERT dbo.DSKey
(
    MaSV,
    Ten,
	Lop,
    Diem
)
VALUES
(   5,   -- MaSV - int
    N'Trường', -- Ten - nvarchar(10)
	N'DPK43',
    8.0  -- Diem - float
    )
	UPDATE dbo.DSKey SET Lop = N'CTK43' WHERE Diem = 7

	