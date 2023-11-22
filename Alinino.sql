Create DATABASE ALINiNo
Use ALINino

Create Table PublishingHouse
(
	Id int identity Primary key,
	Title nvarchar(20),
	IsDeleted bit Default 0
)

Create Table Bindings
(
	Id int identity Primary key,
	Title nvarchar(20),
	IsDeleted bit Default 0
)

Create Table Categories
(
	Id int identity Primary key,
	Title nvarchar(20),
	ParentCategoryId int REFERENCES Categories(Id),
	IsDeleted bit Default 0
)
Create Table Books
(
	Id int identity Primary key,
	Title nvarchar(20),
	Description nvarchar(250),
	ActualPrice int not null,
	DiscountPrice int default null,
	PublishingHouseId int REFERENCES PublishingHouse(id),
	StockCount int,
	ArticleCode nvarchar(20),
	BindingId int REFERENCES Bindings(Id),
	Pages int,
	CategoryId int REFERENCES Categories(Id),
	IsDeleted bit Default 0
)



Create Table Authors
(
	Id int identity Primary key,
	Name nvarchar(30),
	Surname nvarchar(30),
	IsDeleted bit Default 0
)


Create Table Genres
(
	Id int identity Primary key,
	Title nvarchar(20),
	IsDeleted bit Default 0
)


Create Table Languages
(
	Id int identity Primary key,
	Title nvarchar(50),
	IsDeleted bit Default 0
)



Create Table BooksGenres
(
	Id int identity Primary key,
	BookId  int REFERENCES Books(Id),
	GenreId  int REFERENCES Genres(Id),
)


Create Table BooksAuthors
(
	Id int identity Primary key,
	BookId  int REFERENCES Books(Id),
	AuthorId  int REFERENCES Authors(Id),
)


Create Table BooksLanguages
(
	Id int identity Primary key,
	BookId  int REFERENCES Books(Id),
	LanguageId  int REFERENCES Languages(Id),
)

Create Table Comments
(
	Id int identity Primary key,
	Description nvarchar(250),
	BookId  int REFERENCES Books(Id),
	Rating int Check(Rating between 0 and 5),
	Name nvarchar(50) not null,
	Email nvarchar(254) not null,
	ImgUrl nvarchar(max),
	IsDeleted bit Default 0
)

--TRIGGERS (TASK2)

ALTER TRIGGER UpdateIsDeletedOnBooks
ON Books
INSTEAD OF Delete
AS
BEGIN
        UPDATE Books
        SET IsDeleted = 'True'
        WHERE Id in (Select Id From deleted)
END;

DELETE Books Where Id = 10

Create TRIGGER UpdateIsDeletedOnAuthors
ON Authors
INSTEAD OF Delete
AS
BEGIN
        UPDATE Authors
        SET IsDeleted = 'True'
        WHERE Id in (Select Id From deleted)
END;

DELETE Authors Where Id = 2

Create TRIGGER UpdateIsDeletedOnBindings
ON Bindings
INSTEAD OF Delete
AS
BEGIN
        UPDATE Bindings
        SET IsDeleted = 'True'
        WHERE Id in (Select Id From deleted)
END;



Create TRIGGER UpdateIsDeletedOnCategories
ON Categories
INSTEAD OF Delete
AS
BEGIN
        UPDATE Categories
        SET IsDeleted = 'True'
        WHERE Id in (Select Id From deleted)
END;

Create TRIGGER UpdateIsDeletedOnComments
ON Comments
INSTEAD OF Delete
AS
BEGIN
        UPDATE Comments
        SET IsDeleted = 'True'
        WHERE Id in (Select Id From deleted)
END;

Create TRIGGER UpdateIsDeletedOnGenres
ON Genres
INSTEAD OF Delete
AS
BEGIN
        UPDATE Genres
        SET IsDeleted = 'True'
        WHERE Id in (Select Id From deleted)
END;

Create TRIGGER UpdateIsDeletedOnLanguages
ON Languages
INSTEAD OF Delete
AS
BEGIN
        UPDATE Languages
        SET IsDeleted = 'True'
        WHERE Id in (Select Id From deleted)
END;

Create TRIGGER UpdateIsDeletedOnPublishingHouse
ON PublishingHouse
INSTEAD OF Delete
AS
BEGIN
        UPDATE PublishingHouse
        SET IsDeleted = 'True'
        WHERE Id in (Select Id From deleted)
END;
--INSERTS AND UPTADES (TASK1)

ALTER PROCEDURE InsertPairsOfData
    @PublishingHouseTitle NVARCHAR(20),
    @BindingTitle NVARCHAR(20),
    @CategoryTitle NVARCHAR(20),
    @BookTitle NVARCHAR(20),
    @AuthorName NVARCHAR(30),
    @AuthorSurname NVARCHAR(30),
    @GenreTitle NVARCHAR(20),
    @LanguageTitle NVARCHAR(50),
    @BookLanguageId INT,
    @BookActualPrice INT,
    @BookPublishingHouseId INT,
    @BookStockCount INT,
	@BookArticleCode NVARCHAR(20),
    @BookBindingId INT,
    @BookPages INT,
    @BookCategoryId INT,
    @BookDescription NVARCHAR(250),
    @BookDiscountPrice INT = NULL,
    @CommentDescription NVARCHAR(250),
    @CommentRating INT,
    @CommentName NVARCHAR(50),
    @CommentEmail NVARCHAR(254),
    @CommentImgUrl NVARCHAR(MAX)
AS
BEGIN
        -- Insert into PublishingHouse
        INSERT INTO PublishingHouse (Title)
        VALUES (@PublishingHouseTitle)

        -- Insert into Bindings
        INSERT INTO Bindings (Title)
        VALUES (@BindingTitle)

        -- Insert into Categories
        INSERT INTO Categories (Title)
        VALUES (@CategoryTitle)

        -- Insert into Books
        INSERT INTO Books (Title, Description, ActualPrice, DiscountPrice, PublishingHouseId, StockCount, ArticleCode, BindingId, Pages, CategoryId)
        VALUES (@BookTitle, @BookDescription, @BookActualPrice, @BookDiscountPrice, @BookPublishingHouseId, @BookStockCount, @BookArticleCode, @BookBindingId, @BookPages, @BookCategoryId)

        -- Insert into Authors
        INSERT INTO Authors (Name, Surname)
        VALUES (@AuthorName, @AuthorSurname)

        -- Insert into Genres
        INSERT INTO Genres (Title)
        VALUES (@GenreTitle)

        -- Insert into Languages
        INSERT INTO Languages (Title)
        VALUES (@LanguageTitle)
END


	EXEC InsertPairsOfData
    @PublishingHouseTitle = '',
    @BindingTitle = 'Hard',
    @CategoryTitle = 'Books in Russian',
    @BookTitle = 'Sovereign',
    @AuthorName = ' Christopher John',
    @AuthorSurname = 'Sansom',
    @GenreTitle = 'Detective',
    @LanguageTitle = 'Russian',
    @BookLanguageId = 1,
    @BookActualPrice = 50,
    @BookPublishingHouseId = 1,
    @BookStockCount = 100,
    @BookArticleCode = '9785389181281',
    @BookBindingId = 1,
    @BookPages = 200,
    @BookCategoryId = 1,
    @BookDescription = 'Summer of 1541. The King of England, Henry VIII, worried about the prospect of a rebellion, is going to 
	visit York in the north of the kingdom to prevent a possible recurrence of the rebellion.  should become the kings 
	temporary residence. Here begins a series of mysterious incidents.
	First, the stained glass master Oldroyd dies. When inspecting the house of the deceased,
	a cache with a box containing old documents was discovered. Shardlake himself becomes the next victim.
	He loses consciousness from a blow to the head, and the papers found, which can shed light on the true 
	initiators of the conspiracy, disappear... In the world of literary heroes and in the minds of todays readers, the image of Matthew
	Shardlake occupies an honorable place along with such famous characters as Sherlock Holmes. Hercule Poirot, Nero Wolfe and Commissar Megre',
    @BookDiscountPrice = NULL,
    @CommentDescription = 'Your fast delivery service was excellent. I will order again!',
    @CommentRating = 5,
    @CommentName = 'Nargiz Giyasova',
    @CommentEmail = 'john@example.com',
    @CommentImgUrl = 'https://static.insales-cdn.com/images/products/1/5060/775173060/uk795247.jpg';

    --UPTADE

	DECLARE @PublishingHouseTitle NVARCHAR(20) = 'World'
	DECLARE @BindingTitle NVARCHAR(20) = 'Soft'
	DECLARE @PublishingHouseId INT, @BindingId INT

        -- if PublishingHouse exists
        SELECT @PublishingHouseId = Id FROM PublishingHouse WHERE Title = @PublishingHouseTitle;
        
        IF @PublishingHouseId IS NULL

            -- if PublishingHouse if it doesn't exist
            INSERT INTO PublishingHouse (Title) VALUES (@PublishingHouseTitle)
            SET @PublishingHouseId = SCOPE_IDENTITY()
			INSERT INTO PublishingHouse (Title)
			VALUES (@PublishingHouseTitle);

 SELECT @BindingId = Id FROM Bindings WHERE Title = @BindingTitle;

		IF @BindingTitle IS NULL

			INSERT INTO Bindings(Title) VALUES (@BindingTitle)
            SET @BindingTitle = SCOPE_IDENTITY()
			INSERT INTO Bindings (Title)
			VALUES (@BindingTitle);

	select * from PublishingHouse
	
	
