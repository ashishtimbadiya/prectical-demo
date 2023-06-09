USE [db_a98836_parlthummar001]
GO
/****** Object:  Table [dbo].[tblCity]    Script Date: 5/8/2023 8:49:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[StateId] [int] NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblState]    Script Date: 5/8/2023 8:49:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblState](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUserRegistration]    Script Date: 5/8/2023 8:49:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserRegistration](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](150) NULL,
	[MobileNo] [varchar](50) NULL,
	[Address] [nvarchar](500) NULL,
	[StateId] [int] NULL,
	[CityId] [int] NULL,
	[IsActvie] [bit] NULL,
	[IsDelete] [bit] NULL,
 CONSTRAINT [PK_Prec_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblCity] ON 

INSERT [dbo].[tblCity] ([Id], [Name], [StateId]) VALUES (1, N'surat', 1)
INSERT [dbo].[tblCity] ([Id], [Name], [StateId]) VALUES (2, N'vadodra', 1)
INSERT [dbo].[tblCity] ([Id], [Name], [StateId]) VALUES (3, N'bhavnagar', 1)
INSERT [dbo].[tblCity] ([Id], [Name], [StateId]) VALUES (7, N'Jaipur', 2)
INSERT [dbo].[tblCity] ([Id], [Name], [StateId]) VALUES (8, N'Ajmer', 2)
INSERT [dbo].[tblCity] ([Id], [Name], [StateId]) VALUES (9, N'kota', 2)
INSERT [dbo].[tblCity] ([Id], [Name], [StateId]) VALUES (4, N'Kanpur', 3)
INSERT [dbo].[tblCity] ([Id], [Name], [StateId]) VALUES (5, N'Lucknow', 3)
INSERT [dbo].[tblCity] ([Id], [Name], [StateId]) VALUES (6, N'Ghaziabad', 3)

SET IDENTITY_INSERT [dbo].[tblCity] OFF
GO
SET IDENTITY_INSERT [dbo].[tblState] ON 

INSERT [dbo].[tblState] ([Id], [Name]) VALUES (1, N'Gujrat')
INSERT [dbo].[tblState] ([Id], [Name]) VALUES (2, N'Rajastan')
INSERT [dbo].[tblState] ([Id], [Name]) VALUES (3, N'UP')
SET IDENTITY_INSERT [dbo].[tblState] OFF
GO
SET IDENTITY_INSERT [dbo].[tblUserRegistration] ON 

INSERT [dbo].[tblUserRegistration] ([UserId], [Name], [Email], [MobileNo], [Address], [StateId], [CityId], [IsActvie], [IsDelete]) VALUES (1, N'asdads', N'asdasd@sdfdsf.com', N'1234567892', N'asfasff assdasdad dsfdsf', 1, 2, 0, 1)
INSERT [dbo].[tblUserRegistration] ([UserId], [Name], [Email], [MobileNo], [Address], [StateId], [CityId], [IsActvie], [IsDelete]) VALUES (2, N'asdad', N'asdasd@sdfdsf.com', N'1234567892', N'asfasff asdasdad dsf dff fdg dfd adfasd sdfsf', 1, 2, 0, 1)
INSERT [dbo].[tblUserRegistration] ([UserId], [Name], [Email], [MobileNo], [Address], [StateId], [CityId], [IsActvie], [IsDelete]) VALUES (3, N'test', N'asdasd', N'5421425410', N'cdfsdfsf', 1, 1, 1, 0)
INSERT [dbo].[tblUserRegistration] ([UserId], [Name], [Email], [MobileNo], [Address], [StateId], [CityId], [IsActvie], [IsDelete]) VALUES (4, N'sdfdsf', N'dsff@dfs.com', N'3455635354', N'sdasdasd', 1, 1, 1, 0)
INSERT [dbo].[tblUserRegistration] ([UserId], [Name], [Email], [MobileNo], [Address], [StateId], [CityId], [IsActvie], [IsDelete]) VALUES (5, N'sdasdsd', N'sadasd@sdf.csdf', N'0123456789', N'asdadad dfdsdaddad', 1, 2, 0, 1)
INSERT [dbo].[tblUserRegistration] ([UserId], [Name], [Email], [MobileNo], [Address], [StateId], [CityId], [IsActvie], [IsDelete]) VALUES (6, N'test', N'test@gmail.com', N'9327838970', N'27,Saket Dham Society,Near KirAn Chok,Surat', 1, 2, 1, 0)
SET IDENTITY_INSERT [dbo].[tblUserRegistration] OFF
GO
/****** Object:  StoredProcedure [dbo].[CommonData]    Script Date: 5/8/2023 8:49:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author		: AT
-- Create date	: 06-05-2023
-- Description	: CommonData
-- Test Case	: EXEC dbo.CommonData
-- =============================================
CREATE PROCEDURE [dbo].[CommonData]

AS
BEGIN
  
  
  SELECT 
	Id,
    [Name] AS Statename 
  FROM 
	dbo.tblState
  SELECT 
	Id,
    [Name] AS  Cityname,
	StateId
  FROM 
	dbo.tblCity

END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 5/8/2023 8:49:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author		: AT
-- Create date	: 06-05-2023
-- Description	: DeleteUser
-- Test Case	: EXEC dbo.DeleteUser
-- =============================================
CREATE PROCEDURE [dbo].[DeleteUser]
(
    @UserId AS INT,
	@Message AS VARCHAR(5000) = '' OUTPUT,
    @Code AS INT = 0 OUTPUT
)
AS
SET NOCOUNT ON;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN
   
	DECLARE @TranCount INT;
    SET @Message = '';
    SET @Code = 0;

    BEGIN TRY
	SET @TranCount = @@trancount;
	SET @Code = 0;
	SET @Message = '';
	
		IF @TranCount = 0
		BEGIN
			BEGIN TRANSACTION
		END
		ELSE
		BEGIN
			SAVE TRANSACTION AddUpdateTran;
		END

	IF EXISTS (SELECT 1 FROM dbo.tblUserRegistration WHERE UserId = @UserId AND IsDelete = 0)
	BEGIN
	    
		UPDATE dbo.tblUserRegistration
        SET 
			IsActvie = 0,
			IsDelete = 1
		WHERE
			UserId = @UserId
		
	
	     SET @Message = 'Success.';
		 SET @Code = 0;
	END
	ELSE 
	BEGIN
	    SET @Message = 'User already Deleted.';
		 SET @Code = 1;
	END

		
        -- Commit transaction and exit
        IF @TranCount = 0
        BEGIN
            COMMIT;
        END;
       
    END TRY
    BEGIN CATCH
        DECLARE @xstate INT = XACT_STATE();

        IF (@xstate = -1) OR (@xstate = 1 AND @TranCount = 0)
        BEGIN
            ROLLBACK;
        END;
		IF @xstate = 1 and @TranCount > 0
		BEGIN
			ROLLBACK TRANSACTION AddUpdateTran;
		END
        SET @Message = 'An error occurred something went wrong.';
        SET @Code = 2;

    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 5/8/2023 8:49:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author		: AT
-- Create date	: 06-05-2023
-- Description	: UserRegister
-- Test Case	: EXEC dbo.UpdateUser
-- =============================================
CREATE PROCEDURE [dbo].[UpdateUser]
(
    @UserId AS INT,
	@Username AS VARCHAR(50),
    @Email VARCHAR(150),
	@MobileNo VARCHAR(15),
	@Address NVARCHAR(500),
	@StateId INT,
	@CityId INT,
	@Message AS VARCHAR(5000) = '' OUTPUT,
    @Code AS INT = 0 OUTPUT
)
AS
SET NOCOUNT ON;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN
   
	DECLARE @TranCount INT;
    SET @Message = '';
    SET @Code = 0;

    BEGIN TRY
	SET @TranCount = @@trancount;
	SET @Code = 0;
	SET @Message = '';
	
		IF @TranCount = 0
		BEGIN
			BEGIN TRANSACTION
		END
		ELSE
		BEGIN
			SAVE TRANSACTION AddUpdateTran;
		END

	DROP TABLE IF EXISTS #tmpUserList;

		SELECT 
			UserId,
            Name,
            Email,
            MobileNo
		INTO #tmpUserList
		FROM 
			dbo.tblUserRegistration
		WHERE IsDelete = 0;

	IF EXISTS(SELECT 1 FROM #tmpUserList WHERE Email = @Email AND UserId <>@UserId)
	BEGIN
	    SET @Message = 'Email already exist.';
		 SET @Code = 1;
	END
	ELSE IF EXISTS (SELECT 1 FROM #tmpUserList WHERE MobileNo = @MobileNo AND UserId <>@UserId)
	BEGIN
	    SET @Message = 'MobileNo already exist.';
		 SET @Code = 1;
	END
	ELSE
	BEGIN
	    
		UPDATE dbo.tblUserRegistration
        SET 
			[Name] = @Username,
			Email = @Email,
			MobileNo = @MobileNo,
			[Address] = @Address,
			StateId = @StateId,
			CityId = @CityId
		WHERE
			UserId = @UserId
		
	
	     SET @Message = 'User update successfully.';
		 SET @Code = 0;
	END

		DROP TABLE IF EXISTS #tmpUserList;
        -- Commit transaction and exit
        IF @TranCount = 0
        BEGIN
            COMMIT;
        END;
       
    END TRY
    BEGIN CATCH
		DROP TABLE IF EXISTS #tmpUserList;
        DECLARE @xstate INT = XACT_STATE();

        IF (@xstate = -1) OR (@xstate = 1 AND @TranCount = 0)
        BEGIN
            ROLLBACK;
        END;
		IF @xstate = 1 and @TranCount > 0
		BEGIN
			ROLLBACK TRANSACTION AddUpdateTran;
		END
        SET @Message = 'An error occurred something went wrong.';
        SET @Code = 2;

    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[UserRegister]    Script Date: 5/8/2023 8:49:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author		: AT
-- Create date	: 06-05-2023
-- Description	: UserRegister
-- Test Case	: EXEC dbo.UpdateUser
-- =============================================
CREATE PROCEDURE [dbo].[UserRegister]
(
	@Username AS VARCHAR(50),
    @Email VARCHAR(150),
	@MobileNo VARCHAR(15),
	@Address NVARCHAR(500),
	@StateId INT,
	@CityId INT,
	@Message AS VARCHAR(5000) = '' OUTPUT,
    @Code AS INT = 0 OUTPUT
)
AS
SET NOCOUNT ON;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN
   
	DECLARE @TranCount INT;
    SET @Message = '';
    SET @Code = 0;

    BEGIN TRY
	SET @TranCount = @@trancount;
	SET @Code = 0;
	SET @Message = '';
	
		IF @TranCount = 0
		BEGIN
			BEGIN TRANSACTION
		END
		ELSE
		BEGIN
			SAVE TRANSACTION AddUpdateTran;
		END

		DROP TABLE IF EXISTS #tmpUserList;

		SELECT 
			UserId,
            Name,
            Email,
            MobileNo
		INTO #tmpUserList
		FROM 
			dbo.tblUserRegistration
		WHERE IsDelete = 0;

	IF EXISTS(SELECT 1 FROM #tmpUserList WHERE Email = @Email)
	BEGIN
	    SET @Message = 'Email already exist.';
		 SET @Code = 1;
	END
	ELSE IF EXISTS (SELECT 1 FROM #tmpUserList WHERE MobileNo = @MobileNo)
	BEGIN
	    SET @Message = 'MobileNo already exist.';
		 SET @Code = 1;
	END
	ELSE
	BEGIN
	    
		INSERT INTO dbo.tblUserRegistration
		(
		    Name,
		    Email,
		    MobileNo,
		    Address,
		    StateId,
		    CityId,
		    IsActvie,
		    IsDelete
		)
		VALUES
		(   @Username, -- Name - varchar(50)
		    @Email, -- Email - varchar(150)
		    @MobileNo, -- MobileNo - varchar(50)
		    @Address, -- Address - nvarchar(500)
		    @StateId, -- StateId - int
		    @CityId, -- CityId - int
		    1, -- IsActvie - bit
		    0 -- IsDelete - bit
		);
	     SET @Message = 'User register successfully.';
		 SET @Code = 0;
	END
	
		DROP TABLE IF EXISTS #tmpUserList;
        -- Commit transaction and exit
        IF @TranCount = 0
        BEGIN
            COMMIT;
        END;
       
    END TRY
    BEGIN CATCH
		DROP TABLE IF EXISTS #tmpUserList;
        DECLARE @xstate INT = XACT_STATE();

        IF (@xstate = -1) OR (@xstate = 1 AND @TranCount = 0)
        BEGIN
            ROLLBACK;
        END;
		IF @xstate = 1 and @TranCount > 0
		BEGIN
			ROLLBACK TRANSACTION AddUpdateTran;
		END
        SET @Message = 'An error occurred something went wrong.';
        SET @Code = 2;

    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[UserReport]    Script Date: 5/8/2023 8:49:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author		: AT
-- Create date	: 06-05-2023
-- Description	: UserReport
-- Test Case	: EXEC dbo.UserReport
-- =============================================
CREATE PROCEDURE [dbo].[UserReport]

AS
BEGIN
  
  SELECT 
	tblR.UserId AS id,
    tblR.Name AS username,
    tblR.Email,
    tblR.MobileNo,
    tblR.Address,
    tblR.StateId,
	tblS.[Name] Statename,
    tblR.CityId,
	tblC.[Name] Cityname
  FROM 
	dbo.tblUserRegistration tblR
	INNER JOIN dbo.tblState tblS ON tblS.Id = tblR.StateId
	INNER JOIN dbo.tblCity tblC ON tblC.Id = tblR.CityId
  WHERE 
	tblR.IsDelete = 0;
END;
GO
