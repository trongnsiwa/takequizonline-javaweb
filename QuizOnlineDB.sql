USE [master]
GO
/****** Object:  Database [QuizOnlineDB]    Script Date: 2/17/2021 6:01:49 PM ******/
CREATE DATABASE [QuizOnlineDB]
GO
ALTER DATABASE [QuizOnlineDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuizOnlineDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuizOnlineDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuizOnlineDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuizOnlineDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuizOnlineDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuizOnlineDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuizOnlineDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuizOnlineDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuizOnlineDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuizOnlineDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuizOnlineDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuizOnlineDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuizOnlineDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuizOnlineDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuizOnlineDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuizOnlineDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuizOnlineDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuizOnlineDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuizOnlineDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuizOnlineDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuizOnlineDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuizOnlineDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuizOnlineDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuizOnlineDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuizOnlineDB] SET  MULTI_USER 
GO
ALTER DATABASE [QuizOnlineDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuizOnlineDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuizOnlineDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuizOnlineDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QuizOnlineDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QuizOnlineDB]
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 2/17/2021 6:01:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Answer](
	[AnswerId] [char](1) NOT NULL,
	[QuestionId] [varchar](10) NOT NULL,
	[AnswerContent] [nvarchar](max) NOT NULL,
	[IsCorrect] [bit] NOT NULL,
 CONSTRAINT [PK_Answer] PRIMARY KEY CLUSTERED 
(
	[AnswerId] ASC,
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Question]    Script Date: 2/17/2021 6:01:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Question](
	[QuestionId] [varchar](10) NOT NULL,
	[QuestionContent] [nvarchar](max) NOT NULL,
	[SubjectId] [varchar](7) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Question_1] PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentQuiz]    Script Date: 2/17/2021 6:01:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentQuiz](
	[Id] [varchar](60) NOT NULL,
	[UserId] [nvarchar](50) NOT NULL,
	[SubjectId] [varchar](7) NOT NULL,
	[TimeLimit] [int] NULL,
	[Grade] [float] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
 CONSTRAINT [PK_StudentQuiz] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentQuizDetail]    Script Date: 2/17/2021 6:01:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentQuizDetail](
	[Id] [varchar](60) NOT NULL,
	[QuestionId] [varchar](10) NOT NULL,
	[QuestionContent] [nvarchar](max) NULL,
	[Answer1] [nvarchar](max) NULL,
	[Answer2] [nvarchar](max) NULL,
	[Answer3] [nvarchar](max) NULL,
	[Answer4] [nvarchar](max) NULL,
	[AnswerCorrect] [int] NULL,
 CONSTRAINT [PK_StudentQuizDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 2/17/2021 6:01:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Subject](
	[SubjectId] [varchar](7) NOT NULL,
	[SubjectName] [nvarchar](100) NULL,
	[TotalQuestion] [int] NULL,
	[TimeLimit] [int] NULL,
	[QuizQuestionQuantity] [int] NULL,
	[Grade] [float] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Submit]    Script Date: 2/17/2021 6:01:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Submit](
	[SubmitId] [varchar](15) NOT NULL,
	[SubjectId] [varchar](7) NOT NULL,
	[UserId] [nvarchar](50) NOT NULL,
	[NumberOfCorrect] [int] NOT NULL,
	[Grade] [float] NOT NULL,
	[SubmitDate] [datetime] NULL,
 CONSTRAINT [PK_Submit] PRIMARY KEY CLUSTERED 
(
	[SubmitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SubmitDetail]    Script Date: 2/17/2021 6:01:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SubmitDetail](
	[SubmitId] [varchar](15) NOT NULL,
	[QuestionId] [varchar](10) NOT NULL,
	[AnswerChoice] [char](1) NULL,
	[IsCorrect] [bit] NOT NULL,
	[Point] [float] NOT NULL,
 CONSTRAINT [PK_SubmitDetail_1] PRIMARY KEY CLUSTERED 
(
	[SubmitId] ASC,
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 2/17/2021 6:01:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[Email] [nvarchar](50) NOT NULL,
	[Password] [char](44) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[IsAdmin] [bit] NOT NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'A', N'PRN292_1', N'explicitly internal', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'A', N'SWR302_10', N'May, Should, Could, Won''t', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'A', N'SWR302_11', N' horizontal prototype', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'A', N'SWR302_12', N'None of the answers', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'A', N'SWR302_13', N'A document detailing software requirements and specifications', 1)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'A', N'SWR302_14', N'Clarify, complete, and validate requirements', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'A', N'SWR302_15', N'performance, security, usability', 1)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'A', N'SWR302_16', N'performance requirement', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'A', N'SWR302_17', N'A goal or task that specific classes of users must be able to perform with a system, or a desired product attribute', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'A', N'SWR302_18', N'A description of a behavior that a system will exhibit under specific conditions', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'A', N'SWR302_19', N'validation phase', 1)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'A', N'SWR302_2', N'Security requirements', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'A', N'SWR302_20', N'Robustness', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'A', N'SWR302_21', N'Managers', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'A', N'SWR302_22', N'debug programs following the detection of run-time errors', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'A', N'SWR302_3', N'The background describe the primary benefits that the new system will provide to its sponsors. buyers. and users.', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'A', N'SWR302_4', N'Expected products of of efforts', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'A', N'SWR302_5', N'Technical documentation', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'A', N'SWR302_6', N'Data dictionary', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'A', N'SWR302_7', N'To make sure that there are no programming errors in the software', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'A', N'SWR302_8', N'The programmers monitor the data entry screens as data is entered', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'A', N'SWR302_9', N' System testing', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'A', N'SWT301_1', N' Scheduling test analysis and design tasks.', 1)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'A', N'SWT301_10', N' Implementation and execution.', 1)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'A', N'SWT301_11', N' During test planning.', 1)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'A', N'SWT301_12', N'Providing coaching to users and defining usage guidelines', 1)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'A', N'SWT301_2', N'Customers and users', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'A', N'SWT301_3', N'Developers.', 1)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'A', N'SWT301_4', N'The name and / or organisational position of the person raising the problem.', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'A', N'SWT301_5', N'Impact analysis assesses the effect on the system of a defect found in regression testing.', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'A', N'SWT301_6', N'To enhance the security of the system', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'A', N'SWT301_7', N'Login Browse Basket Checkout Basket Checkout Pay Logout.', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'A', N'SWT301_8', N'Usability defects found by customers', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'A', N'SWT301_9', N'Testing performed by potential customers at the developers location.', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'B', N'PRN292_1', N'explicitly static', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'B', N'SWR302_10', N'May, Should, Can, Won''t', 1)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'B', N'SWR302_11', N'paper prototype', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'B', N'SWR302_12', N'Each reader''s interpretation matches what the author intended to communicate', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'B', N'SWR302_13', N'A document which features instructions for how to install new software and test it for errors', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'B', N'SWR302_14', N'Specific technologies, tools, languages, and databases that must be used or avoided', 1)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'B', N'SWR302_15', N'integrity, interoperability, performance', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'B', N'SWR302_16', N' interoperability requirement', 1)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'B', N'SWR302_17', N'A policy, guideline, standard, or regulation that defines or constrains some aspect of the business. Not a software requirement in itself, but the origin of several types of software requirements', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'B', N'SWR302_18', N'A policy, guideline, standard, or regulation that defines or constrains some aspect of the business. Not a software requirement in itself, but the origin of several types of software requirements', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'B', N'SWR302_19', N'elicitation phase', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'B', N'SWR302_2', N'Stakeholder profiles', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'B', N'SWR302_20', N'Security', 1)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'B', N'SWR302_21', N'Users of the software', 1)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'B', N'SWR302_22', N'determine the performance of algorithm implementations', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'B', N'SWR302_3', N'The background describes the business opportunity that exists and the market in which the product will be
competing.', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'B', N'SWR302_4', N'Keep everyone engaged', 1)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'B', N'SWR302_5', N'Requirements documentation', 1)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'B', N'SWR302_6', N'Decision tree', 1)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'B', N'SWR302_7', N'To make sure that the users are correctly using the program', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'B', N'SWR302_8', N'The software is installed and tested for any logic errors', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'B', N'SWR302_9', N'Integration testing', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'B', N'SWT301_1', N'Initiating corrective actions.', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'B', N'SWT301_10', N'Planning and control.', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'B', N'SWT301_11', N'During test analysis.', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'B', N'SWT301_12', N'Monitoring tool usage and reducing the need for risk analysis', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'B', N'SWT301_2', N'Developers and designers', 1)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'B', N'SWT301_3', N'Analysts.', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'B', N'SWT301_4', N'Version of the Software Under Test.', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'B', N'SWT301_5', N'Impact analysis assesses the effect of a new person joining the regression test team.', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'B', N'SWT301_6', N'To prevent the endless loops in code.', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'B', N'SWT301_7', N'Login Browse Basket Checkout Pay Logout.', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'B', N'SWT301_8', N'Defects in infrequently used functionality', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'B', N'SWT301_9', N'Testing performed by potential customers at their own locations.', 1)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'C', N'PRN292_1', N'implicitly static', 1)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'C', N'SWR302_10', N' Must, Should, Can, Will', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'C', N'SWR302_11', N'mock-up prototype', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'C', N'SWR302_12', N'Anyone who reads the requirement comes to the same interpretation as any other reader', 1)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'C', N'SWR302_13', N'A document used while testing the software code for validity', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'C', N'SWR302_14', N'Create a subset that will grow into the ultimate product', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'C', N'SWR302_15', N' availability, integrity, interoperability', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'C', N'SWR302_16', N'reliability requirement', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'C', N'SWR302_17', N'A description of a property or characteristic that a system must exhibit or a constraint that it must respect', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'C', N'SWR302_18', N'A top-level requirement for a product that contains multiple subsystems, which could be all software or software and hardware', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'C', N'SWR302_19', N'analysis phase', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'C', N'SWR302_2', N'Interfaces', 1)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'C', N'SWR302_20', N'Maintainability', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'C', N'SWR302_21', N'Entry level personnel', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'C', N'SWR302_22', N'identify, control, and track requirements changes', 1)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'C', N'SWR302_3', N'The background summazies the important business benefts the product will provide in a quantitative and measurable way.', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'C', N'SWR302_4', N'Elicitation objectives', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'C', N'SWR302_5', N'Software design documentation', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'C', N'SWR302_6', N'Swimlane diagram', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'C', N'SWR302_7', N'To make sure there are no errors when running the program', 1)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'C', N'SWR302_8', N'The code is examined for quality and efficiency', 1)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'C', N'SWR302_9', N'Acceptance testing', 1)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'C', N'SWT301_1', N'Monitoring progress and test coverage.', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'C', N'SWT301_10', N'Analysis and design.', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'C', N'SWT301_11', N'During test execution.', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'C', N'SWT301_12', N'Improving processes and focusing more on component testing', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'C', N'SWT301_2', N' Business and systems analysts', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'C', N'SWT301_3', N'Testers.', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'C', N'SWT301_4', N'Suggestions as to how to fix the problem.', 1)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'C', N'SWT301_5', N'Impact analysis assesses whether or not a defect found in regression testing has been fixed
correctly.', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'C', N'SWT301_6', N'To swerve as an alternative or "Plan-B"', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'C', N'SWT301_7', N'Login Browse Basket Checkout Basket Logout.', 1)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'C', N'SWT301_8', N'Defects that were detected early', 1)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'C', N'SWT301_9', N'Testing performed by product developers at the customer''s location.', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'D', N'PRN292_1', N'implicitly internal', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'D', N'SWR302_10', N'Must, Should, Could, Won''t', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'D', N'SWR302_11', N'throwaway prototype', 1)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'D', N'SWR302_12', N'Each implementation of readers matches what the author intended to communicate', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'D', N'SWR302_13', N'A document listing the time it takes to execute the existing manual processes', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'D', N'SWR302_14', N'Explore design alternatives', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'D', N'SWR302_15', N'performance, efficiency, reliability', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'D', N'SWR302_16', N' robustness requirement', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'D', N'SWR302_17', N'A description of a behavior that a system will exhibit under specific conditions', 1)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'D', N'SWR302_18', N'A description of a property or characteristic that a system must exhibit or a constraint that it must respect', 1)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'D', N'SWR302_19', N'specification phase', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'D', N'SWR302_2', N'Business rules', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'D', N'SWR302_20', N'Order products', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'D', N'SWR302_21', N' Middle level stakeholder', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'D', N'SWR302_22', N'minimize miscommunication and unnecessary rework', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'D', N'SWR302_3', N'The background summazies the rationale and context for the new product or for changes to be made to an existing one. Describe the history or situation that led to the decision to build', 1)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'D', N'SWR302_4', N'Schedule and resource estimates', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'D', N'SWR302_5', N'Users document', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'D', N'SWR302_6', N'State-transition diagram', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'D', N'SWR302_7', N'To make sure that all software requirements have been implemented', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'D', N'SWR302_8', N'The users report missing functionality to the programmers', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'D', N'SWR302_9', N'Unit testing', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'D', N'SWT301_1', N'Measuring and analyzing results.', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'D', N'SWT301_10', N'Test closure.', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'D', N'SWT301_11', N'When evaluating exit criteria', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'D', N'SWT301_12', N'Assessing testing completion and minimizing code reviews', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'D', N'SWT301_2', N'System and acceptance testers', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'D', N'SWT301_3', N'Incident Managers.', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'D', N'SWT301_4', N'Actual and expected results.', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'D', N'SWT301_5', N' Impact analysis assesses the effect of a change to the system to determine how much regression
testing to do.', 1)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'D', N'SWT301_6', N' To define when to stop testing', 1)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'D', N'SWT301_7', N'Login Browse Basket Browse Basket Checkout Pay Logout.', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'D', N'SWT301_8', N'Minor defects that were found by users', 0)
GO
INSERT [dbo].[Answer] ([AnswerId], [QuestionId], [AnswerContent], [IsCorrect]) VALUES (N'D', N'SWT301_9', N'Testing performed by product developers at their own locations.', 0)
GO
INSERT [dbo].[Question] ([QuestionId], [QuestionContent], [SubjectId], [CreatedDate], [Status]) VALUES (N'PRN292_1', N'Unlike const however, read-only fields are NOT______', N'PRN292', CAST(N'2021-02-17 17:31:33.030' AS DateTime), N'Activate')
GO
INSERT [dbo].[Question] ([QuestionId], [QuestionContent], [SubjectId], [CreatedDate], [Status]) VALUES (N'SWR302_10', N'The MoSCoW prioritization scheme stand for four possible priority classifications for the requirements in a set (IIBA 2009):', N'SWR302', CAST(N'2021-02-01 23:33:39.143' AS DateTime), N'Activate')
GO
INSERT [dbo].[Question] ([QuestionId], [QuestionContent], [SubjectId], [CreatedDate], [Status]) VALUES (N'SWR302_11', N'A __________________ is discarded after it has been used to generate feedback, whereas an evolutionary prototype grows into the final product through a series of iterations', N'SWR302', CAST(N'2021-02-01 23:34:09.027' AS DateTime), N'Activate')
GO
INSERT [dbo].[Question] ([QuestionId], [QuestionContent], [SubjectId], [CreatedDate], [Status]) VALUES (N'SWR302_12', N'The important goals of writing requirement:', N'SWR302', CAST(N'2021-02-01 23:34:43.347' AS DateTime), N'Activate')
GO
INSERT [dbo].[Question] ([QuestionId], [QuestionContent], [SubjectId], [CreatedDate], [Status]) VALUES (N'SWR302_13', N'What is a software requirements specification (SRS) document?', N'SWR302', CAST(N'2021-02-01 23:35:16.637' AS DateTime), N'Activate')
GO
INSERT [dbo].[Question] ([QuestionId], [QuestionContent], [SubjectId], [CreatedDate], [Status]) VALUES (N'SWR302_14', N'Which is not the purpose of software prototype?', N'SWR302', CAST(N'2021-02-01 23:35:52.040' AS DateTime), N'Activate')
GO
INSERT [dbo].[Question] ([QuestionId], [QuestionContent], [SubjectId], [CreatedDate], [Status]) VALUES (N'SWR302_15', N'Which is(are) quality attributes that we should consider their effects on desktop and mobile systems:', N'SWR302', CAST(N'2021-02-01 23:36:22.567' AS DateTime), N'Activate')
GO
INSERT [dbo].[Question] ([QuestionId], [QuestionContent], [SubjectId], [CreatedDate], [Status]) VALUES (N'SWR302_16', N'Giving an example of quality requirements: "Authorization of an ATM withdrawal request shall take no more than 2.0 seconds". This is a__________', N'SWR302', CAST(N'2021-02-01 23:36:50.907' AS DateTime), N'Activate')
GO
INSERT [dbo].[Question] ([QuestionId], [QuestionContent], [SubjectId], [CreatedDate], [Status]) VALUES (N'SWR302_17', N'Which is the definition of functional requirement?', N'SWR302', CAST(N'2021-02-01 23:37:36.343' AS DateTime), N'Activate')
GO
INSERT [dbo].[Question] ([QuestionId], [QuestionContent], [SubjectId], [CreatedDate], [Status]) VALUES (N'SWR302_18', N'Which is the definition of nonfunctional requirement?', N'SWR302', CAST(N'2021-02-01 23:38:22.510' AS DateTime), N'Activate')
GO
INSERT [dbo].[Question] ([QuestionId], [QuestionContent], [SubjectId], [CreatedDate], [Status]) VALUES (N'SWR302_19', N'Developing acceptance tests and criteria to confirm that a product based on the requirements', N'SWR302', CAST(N'2021-02-01 23:38:51.793' AS DateTime), N'Activate')
GO
INSERT [dbo].[Question] ([QuestionId], [QuestionContent], [SubjectId], [CreatedDate], [Status]) VALUES (N'SWR302_2', N'Which could requirements NOT be reused in the scope of cross an enterprise', N'SWR302', CAST(N'2021-01-30 00:01:19.227' AS DateTime), N'Activate')
GO
INSERT [dbo].[Question] ([QuestionId], [QuestionContent], [SubjectId], [CreatedDate], [Status]) VALUES (N'SWR302_20', N'Which one of the following is a functional requirement ?', N'SWR302', CAST(N'2021-02-01 23:39:54.813' AS DateTime), N'Activate')
GO
INSERT [dbo].[Question] ([QuestionId], [QuestionContent], [SubjectId], [CreatedDate], [Status]) VALUES (N'SWR302_21', N'Which is one of the most important stakeholder from the following ?', N'SWR302', CAST(N'2021-02-01 23:40:27.033' AS DateTime), N'Activate')
GO
INSERT [dbo].[Question] ([QuestionId], [QuestionContent], [SubjectId], [CreatedDate], [Status]) VALUES (N'SWR302_22', N'The use of traceability lades helps to', N'SWR302', CAST(N'2021-02-02 22:57:09.910' AS DateTime), N'Activate')
GO
INSERT [dbo].[Question] ([QuestionId], [QuestionContent], [SubjectId], [CreatedDate], [Status]) VALUES (N'SWR302_3', N'Which is the CORRECT statements that descnbe about background section in the template of Vision and scope document?', N'SWR302', CAST(N'2021-01-30 00:02:06.377' AS DateTime), N'Activate')
GO
INSERT [dbo].[Question] ([QuestionId], [QuestionContent], [SubjectId], [CreatedDate], [Status]) VALUES (N'SWR302_4', N'Which is NOT a basic element of Plan when you do repuiremenls elicitation on your project?', N'SWR302', CAST(N'2021-01-30 00:02:51.270' AS DateTime), N'Activate')
GO
INSERT [dbo].[Question] ([QuestionId], [QuestionContent], [SubjectId], [CreatedDate], [Status]) VALUES (N'SWR302_5', N'A key tool for software designer, developer and their test team is to carry out their respective tasks is defined by:', N'SWR302', CAST(N'2021-01-31 14:06:08.617' AS DateTime), N'Activate')
GO
INSERT [dbo].[Question] ([QuestionId], [QuestionContent], [SubjectId], [CreatedDate], [Status]) VALUES (N'SWR302_6', N'To depict the complex logic, which representation technique should be used?', N'SWR302', CAST(N'2021-01-31 14:18:59.707' AS DateTime), N'Activate')
GO
INSERT [dbo].[Question] ([QuestionId], [QuestionContent], [SubjectId], [CreatedDate], [Status]) VALUES (N'SWR302_7', N'Which of the following is NOT the purpose of software verification and validation?', N'SWR302', CAST(N'2021-01-31 14:22:15.830' AS DateTime), N'Activate')
GO
INSERT [dbo].[Question] ([QuestionId], [QuestionContent], [SubjectId], [CreatedDate], [Status]) VALUES (N'SWR302_8', N'What happens during static testing?', N'SWR302', CAST(N'2021-01-31 14:23:40.453' AS DateTime), N'Activate')
GO
INSERT [dbo].[Question] ([QuestionId], [QuestionContent], [SubjectId], [CreatedDate], [Status]) VALUES (N'SWR302_9', N'In the V model, the user requirements are detected by ___________', N'SWR302', CAST(N'2021-01-31 15:21:47.250' AS DateTime), N'Activate')
GO
INSERT [dbo].[Question] ([QuestionId], [QuestionContent], [SubjectId], [CreatedDate], [Status]) VALUES (N'SWT301_1', N'Which of the following is a MAJOR task of test planning?', N'SWT301', CAST(N'2021-02-02 17:04:19.497' AS DateTime), N'Activate')
GO
INSERT [dbo].[Question] ([QuestionId], [QuestionContent], [SubjectId], [CreatedDate], [Status]) VALUES (N'SWT301_10', N'Which activity in the fundamental test process creates test suites for efficient test execution?', N'SWT301', CAST(N'2021-02-03 12:29:30.990' AS DateTime), N'Deactivate')
GO
INSERT [dbo].[Question] ([QuestionId], [QuestionContent], [SubjectId], [CreatedDate], [Status]) VALUES (N'SWT301_11', N'When should configuration management procedures be implemented?', N'SWT301', CAST(N'2021-02-03 12:41:35.000' AS DateTime), N'Deactivate')
GO
INSERT [dbo].[Question] ([QuestionId], [QuestionContent], [SubjectId], [CreatedDate], [Status]) VALUES (N'SWT301_12', N'Which of the following can be considered as success factors when deploying a new tool in an
organization?', N'SWT301', CAST(N'2021-02-03 13:01:27.400' AS DateTime), N'Activate')
GO
INSERT [dbo].[Question] ([QuestionId], [QuestionContent], [SubjectId], [CreatedDate], [Status]) VALUES (N'SWT301_2', N'Who typically use static analysis tools?', N'SWT301', CAST(N'2021-02-02 17:05:22.880' AS DateTime), N'Activate')
GO
INSERT [dbo].[Question] ([QuestionId], [QuestionContent], [SubjectId], [CreatedDate], [Status]) VALUES (N'SWT301_3', N' Who would USUALLY perform debugging activities?', N'SWT301', CAST(N'2021-02-02 17:06:07.220' AS DateTime), N'Activate')
GO
INSERT [dbo].[Question] ([QuestionId], [QuestionContent], [SubjectId], [CreatedDate], [Status]) VALUES (N'SWT301_4', N'Which of the following would you NOT usually find on a software incident report?', N'SWT301', CAST(N'2021-02-02 17:06:42.460' AS DateTime), N'Activate')
GO
INSERT [dbo].[Question] ([QuestionId], [QuestionContent], [SubjectId], [CreatedDate], [Status]) VALUES (N'SWT301_5', N'Which of the following is correct?', N'SWT301', CAST(N'2021-02-03 11:53:15.563' AS DateTime), N'Activate')
GO
INSERT [dbo].[Question] ([QuestionId], [QuestionContent], [SubjectId], [CreatedDate], [Status]) VALUES (N'SWT301_6', N' In software testing what is the main purpose of exit criteria?', N'SWT301', CAST(N'2021-02-03 11:55:37.417' AS DateTime), N'Activate')
GO
INSERT [dbo].[Question] ([QuestionId], [QuestionContent], [SubjectId], [CreatedDate], [Status]) VALUES (N'SWT301_7', N'Given the following state transition diagram Which of the following series of state transitions contains an INVALID transition which may indicate a fault in the system design?', N'SWT301', CAST(N'2021-02-03 11:56:30.633' AS DateTime), N'Deactivate')
GO
INSERT [dbo].[Question] ([QuestionId], [QuestionContent], [SubjectId], [CreatedDate], [Status]) VALUES (N'SWT301_8', N'Which defects are OFTEN much cheaper to remove?', N'SWT301', CAST(N'2021-02-03 11:56:59.853' AS DateTime), N'Deactivate')
GO
INSERT [dbo].[Question] ([QuestionId], [QuestionContent], [SubjectId], [CreatedDate], [Status]) VALUES (N'SWT301_9', N'What is beta testing?', N'SWT301', CAST(N'2021-02-03 12:27:22.733' AS DateTime), N'Activate')
GO
INSERT [dbo].[Subject] ([SubjectId], [SubjectName], [TotalQuestion], [TimeLimit], [QuizQuestionQuantity], [Grade], [StartDate], [EndDate]) VALUES (N'PRN292', N'C# And DotNet', 1, 3, 1, 10, CAST(N'2021-02-17 00:00:00.000' AS DateTime), CAST(N'2021-02-18 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Subject] ([SubjectId], [SubjectName], [TotalQuestion], [TimeLimit], [QuizQuestionQuantity], [Grade], [StartDate], [EndDate]) VALUES (N'SWR302', N'Software Requirement', 21, 7, 21, 10, CAST(N'2021-02-16 00:00:00.000' AS DateTime), CAST(N'2021-02-20 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Subject] ([SubjectId], [SubjectName], [TotalQuestion], [TimeLimit], [QuizQuestionQuantity], [Grade], [StartDate], [EndDate]) VALUES (N'SWT301', N'Software Testing', 8, 6, 3, 10, CAST(N'2021-02-16 00:00:00.000' AS DateTime), CAST(N'2021-02-22 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Submit] ([SubmitId], [SubjectId], [UserId], [NumberOfCorrect], [Grade], [SubmitDate]) VALUES (N'Pi210217DWDSU', N'PRN292', N'iwa@gmail.com', 0, 0, CAST(N'2021-02-17 17:40:53.720' AS DateTime))
GO
INSERT [dbo].[Submit] ([SubmitId], [SubjectId], [UserId], [NumberOfCorrect], [Grade], [SubmitDate]) VALUES (N'Pi210217GYXCX', N'PRN292', N'iwa@gmail.com', 0, 0, CAST(N'2021-02-17 17:53:20.590' AS DateTime))
GO
INSERT [dbo].[Submit] ([SubmitId], [SubjectId], [UserId], [NumberOfCorrect], [Grade], [SubmitDate]) VALUES (N'Pi210217IWDDG', N'PRN292', N'iwa@gmail.com', 1, 10, CAST(N'2021-02-17 17:42:59.353' AS DateTime))
GO
INSERT [dbo].[Submit] ([SubmitId], [SubjectId], [UserId], [NumberOfCorrect], [Grade], [SubmitDate]) VALUES (N'Si210203UAWEO', N'SWR302', N'iwa@gmail.com', 20, 9.5, CAST(N'2021-02-03 18:01:31.547' AS DateTime))
GO
INSERT [dbo].[Submit] ([SubmitId], [SubjectId], [UserId], [NumberOfCorrect], [Grade], [SubmitDate]) VALUES (N'Si210216KFBTD', N'SWT301', N'iwa@gmail.com', 2, 6.6999998092651367, CAST(N'2021-02-16 21:26:53.610' AS DateTime))
GO
INSERT [dbo].[Submit] ([SubmitId], [SubjectId], [UserId], [NumberOfCorrect], [Grade], [SubmitDate]) VALUES (N'Si210216LXXXI', N'SWT301', N'iwa@gmail.com', 0, 0, CAST(N'2021-02-16 21:18:01.383' AS DateTime))
GO
INSERT [dbo].[Submit] ([SubmitId], [SubjectId], [UserId], [NumberOfCorrect], [Grade], [SubmitDate]) VALUES (N'Si210216TURSN', N'SWT301', N'iwa@gmail.com', 1, 3.2999999523162842, CAST(N'2021-02-16 21:21:56.343' AS DateTime))
GO
INSERT [dbo].[Submit] ([SubmitId], [SubjectId], [UserId], [NumberOfCorrect], [Grade], [SubmitDate]) VALUES (N'Si210217ESNCU', N'SWT301', N'iwa@gmail.com', 0, 0, CAST(N'2021-02-17 17:55:35.257' AS DateTime))
GO
INSERT [dbo].[Submit] ([SubmitId], [SubjectId], [UserId], [NumberOfCorrect], [Grade], [SubmitDate]) VALUES (N'Si210217HICYY', N'SWR302', N'iwa@gmail.com', 20, 9.5, CAST(N'2021-02-17 17:49:40.887' AS DateTime))
GO
INSERT [dbo].[Submit] ([SubmitId], [SubjectId], [UserId], [NumberOfCorrect], [Grade], [SubmitDate]) VALUES (N'Si210217TPCHJ', N'SWR302', N'iwa@gmail.com', 0, 0, CAST(N'2021-02-17 17:53:40.910' AS DateTime))
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Pi210217DWDSU', N'PRN292_1', NULL, 0, 0)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Pi210217GYXCX', N'PRN292_1', NULL, 0, 0)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Pi210217IWDDG', N'PRN292_1', N'C', 1, 10)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210203UAWEO', N'SWR302_10', N'B', 1, 0.4761904776096344)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210203UAWEO', N'SWR302_11', N'D', 1, 0.4761904776096344)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210203UAWEO', N'SWR302_12', N'C', 1, 0.4761904776096344)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210203UAWEO', N'SWR302_13', N'A', 1, 0.4761904776096344)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210203UAWEO', N'SWR302_14', N'B', 1, 0.4761904776096344)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210203UAWEO', N'SWR302_15', N'A', 1, 0.4761904776096344)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210203UAWEO', N'SWR302_16', NULL, 0, 0)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210203UAWEO', N'SWR302_17', N'D', 1, 0.4761904776096344)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210203UAWEO', N'SWR302_18', N'D', 1, 0.4761904776096344)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210203UAWEO', N'SWR302_19', N'A', 1, 0.4761904776096344)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210203UAWEO', N'SWR302_2', N'C', 1, 0.4761904776096344)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210203UAWEO', N'SWR302_20', N'B', 1, 0.4761904776096344)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210203UAWEO', N'SWR302_21', N'B', 1, 0.4761904776096344)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210203UAWEO', N'SWR302_22', N'C', 1, 0.4761904776096344)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210203UAWEO', N'SWR302_3', N'D', 1, 0.4761904776096344)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210203UAWEO', N'SWR302_4', N'B', 1, 0.4761904776096344)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210203UAWEO', N'SWR302_5', N'B', 1, 0.4761904776096344)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210203UAWEO', N'SWR302_6', N'B', 1, 0.4761904776096344)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210203UAWEO', N'SWR302_7', N'C', 1, 0.4761904776096344)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210203UAWEO', N'SWR302_8', N'C', 1, 0.4761904776096344)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210203UAWEO', N'SWR302_9', N'C', 1, 0.4761904776096344)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210216KFBTD', N'SWT301_1', N'A', 1, 3.3333332538604736)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210216KFBTD', N'SWT301_12', N'B', 0, 0)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210216KFBTD', N'SWT301_3', N'A', 1, 3.3333332538604736)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210216LXXXI', N'SWT301_1', N'D', 0, 0)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210216LXXXI', N'SWT301_12', NULL, 0, 0)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210216LXXXI', N'SWT301_6', NULL, 0, 0)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210216TURSN', N'SWT301_2', N'B', 1, 3.3333332538604736)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210216TURSN', N'SWT301_4', N'A', 0, 0)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210216TURSN', N'SWT301_6', N'A', 0, 0)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217ESNCU', N'SWT301_4', NULL, 0, 0)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217ESNCU', N'SWT301_5', NULL, 0, 0)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217ESNCU', N'SWT301_9', N'A', 0, 0)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217HICYY', N'SWR302_10', N'B', 1, 0.4761904776096344)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217HICYY', N'SWR302_11', N'D', 1, 0.4761904776096344)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217HICYY', N'SWR302_12', N'C', 1, 0.4761904776096344)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217HICYY', N'SWR302_13', N'A', 1, 0.4761904776096344)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217HICYY', N'SWR302_14', N'B', 1, 0.4761904776096344)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217HICYY', N'SWR302_15', N'A', 1, 0.4761904776096344)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217HICYY', N'SWR302_16', N'B', 1, 0.4761904776096344)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217HICYY', N'SWR302_17', N'D', 1, 0.4761904776096344)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217HICYY', N'SWR302_18', N'D', 1, 0.4761904776096344)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217HICYY', N'SWR302_19', N'A', 1, 0.4761904776096344)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217HICYY', N'SWR302_2', N'A', 0, 0)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217HICYY', N'SWR302_20', N'B', 1, 0.4761904776096344)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217HICYY', N'SWR302_21', N'B', 1, 0.4761904776096344)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217HICYY', N'SWR302_22', N'C', 1, 0.4761904776096344)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217HICYY', N'SWR302_3', N'D', 1, 0.4761904776096344)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217HICYY', N'SWR302_4', N'B', 1, 0.4761904776096344)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217HICYY', N'SWR302_5', N'B', 1, 0.4761904776096344)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217HICYY', N'SWR302_6', N'B', 1, 0.4761904776096344)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217HICYY', N'SWR302_7', N'C', 1, 0.4761904776096344)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217HICYY', N'SWR302_8', N'C', 1, 0.4761904776096344)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217HICYY', N'SWR302_9', N'C', 1, 0.4761904776096344)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217TPCHJ', N'SWR302_10', NULL, 0, 0)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217TPCHJ', N'SWR302_11', NULL, 0, 0)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217TPCHJ', N'SWR302_12', NULL, 0, 0)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217TPCHJ', N'SWR302_13', NULL, 0, 0)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217TPCHJ', N'SWR302_14', NULL, 0, 0)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217TPCHJ', N'SWR302_15', NULL, 0, 0)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217TPCHJ', N'SWR302_16', NULL, 0, 0)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217TPCHJ', N'SWR302_17', N'A', 0, 0)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217TPCHJ', N'SWR302_18', NULL, 0, 0)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217TPCHJ', N'SWR302_19', NULL, 0, 0)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217TPCHJ', N'SWR302_2', NULL, 0, 0)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217TPCHJ', N'SWR302_20', NULL, 0, 0)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217TPCHJ', N'SWR302_21', NULL, 0, 0)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217TPCHJ', N'SWR302_22', NULL, 0, 0)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217TPCHJ', N'SWR302_3', NULL, 0, 0)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217TPCHJ', N'SWR302_4', NULL, 0, 0)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217TPCHJ', N'SWR302_5', NULL, 0, 0)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217TPCHJ', N'SWR302_6', NULL, 0, 0)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217TPCHJ', N'SWR302_7', NULL, 0, 0)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217TPCHJ', N'SWR302_8', NULL, 0, 0)
GO
INSERT [dbo].[SubmitDetail] ([SubmitId], [QuestionId], [AnswerChoice], [IsCorrect], [Point]) VALUES (N'Si210217TPCHJ', N'SWR302_9', NULL, 0, 0)
GO
INSERT [dbo].[User] ([Email], [Password], [Name], [IsAdmin], [Status]) VALUES (N'123@123.com', N'jZae727K08KaOmKSgOaGzww/XVqGr/PKEgIMkjrcbJI=', N'NST', 0, N'New')
GO
INSERT [dbo].[User] ([Email], [Password], [Name], [IsAdmin], [Status]) VALUES (N'79@79.com', N'jZae727K08KaOmKSgOaGzww/XVqGr/PKEgIMkjrcbJI=', N'79 Li', 1, N'New')
GO
INSERT [dbo].[User] ([Email], [Password], [Name], [IsAdmin], [Status]) VALUES (N'iwa@gmail.com', N'jZae727K08KaOmKSgOaGzww/XVqGr/PKEgIMkjrcbJI=', N'Iwa', 0, N'New')
GO
INSERT [dbo].[User] ([Email], [Password], [Name], [IsAdmin], [Status]) VALUES (N'trong@gmail.com', N'jZae727K08KaOmKSgOaGzww/XVqGr/PKEgIMkjrcbJI=', N'Nguyen Si Trong', 1, N'New')
GO
ALTER TABLE [dbo].[Question] ADD  CONSTRAINT [DF__Question__Create__2D27B809]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Question1] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Question] ([QuestionId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_Question1]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Subject1] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([SubjectId])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Subject1]
GO
ALTER TABLE [dbo].[StudentQuiz]  WITH CHECK ADD  CONSTRAINT [FK_StudentQuiz_Subject1] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([SubjectId])
GO
ALTER TABLE [dbo].[StudentQuiz] CHECK CONSTRAINT [FK_StudentQuiz_Subject1]
GO
ALTER TABLE [dbo].[StudentQuiz]  WITH CHECK ADD  CONSTRAINT [FK_StudentQuiz_User1] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Email])
GO
ALTER TABLE [dbo].[StudentQuiz] CHECK CONSTRAINT [FK_StudentQuiz_User1]
GO
ALTER TABLE [dbo].[StudentQuizDetail]  WITH CHECK ADD  CONSTRAINT [FK_StudentQuizDetail_Question1] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Question] ([QuestionId])
GO
ALTER TABLE [dbo].[StudentQuizDetail] CHECK CONSTRAINT [FK_StudentQuizDetail_Question1]
GO
ALTER TABLE [dbo].[StudentQuizDetail]  WITH CHECK ADD  CONSTRAINT [FK_StudentQuizDetail_StudentQuiz] FOREIGN KEY([Id])
REFERENCES [dbo].[StudentQuiz] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentQuizDetail] CHECK CONSTRAINT [FK_StudentQuizDetail_StudentQuiz]
GO
ALTER TABLE [dbo].[Submit]  WITH CHECK ADD  CONSTRAINT [FK_Submit_Subject1] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([SubjectId])
GO
ALTER TABLE [dbo].[Submit] CHECK CONSTRAINT [FK_Submit_Subject1]
GO
ALTER TABLE [dbo].[Submit]  WITH CHECK ADD  CONSTRAINT [FK_Submit_User1] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Email])
GO
ALTER TABLE [dbo].[Submit] CHECK CONSTRAINT [FK_Submit_User1]
GO
ALTER TABLE [dbo].[SubmitDetail]  WITH CHECK ADD  CONSTRAINT [FK_SubmitDetail_Question] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Question] ([QuestionId])
GO
ALTER TABLE [dbo].[SubmitDetail] CHECK CONSTRAINT [FK_SubmitDetail_Question]
GO
ALTER TABLE [dbo].[SubmitDetail]  WITH CHECK ADD  CONSTRAINT [FK_SubmitDetail_Submit1] FOREIGN KEY([SubmitId])
REFERENCES [dbo].[Submit] ([SubmitId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SubmitDetail] CHECK CONSTRAINT [FK_SubmitDetail_Submit1]
GO
USE [master]
GO
ALTER DATABASE [QuizOnlineDB] SET  READ_WRITE 
GO
