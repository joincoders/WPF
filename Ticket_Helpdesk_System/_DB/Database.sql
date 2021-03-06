USE [HELPDESK]
GO
/****** Object:  UserDefinedFunction [dbo].[FConvertUnicode]    Script Date: 03/01/2022 17:04:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[FConvertUnicode](
	@Name NVARCHAR(50)
)
RETURNS NVARCHAR(MAX)
AS
BEGIN
	DECLARE @Len INT, @I INT, @Code NVARCHAR(MAX)
	SET @Len = LEN(@Name) SET @I = 1
	SET @Code = ''
	WHILE @I <= @Len BEGIN
		SET @Code = @Code + CONVERT(NVARCHAR(50), UNICODE(SUBSTRING(@Name, @I, 1))) + ','
		SET @I = @I + 1
	END
	 
	RETURN REPLACE(@Code, '8203,', '')
END
GO
/****** Object:  Table [dbo].[tblrecordid]    Script Date: 03/01/2022 17:04:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblrecordid](
	[branchcode] [nvarchar](50) NOT NULL,
	[convalue] [nvarchar](50) NOT NULL,
	[recordid] [int] NULL,
	[description] [nvarchar](250) NULL,
 CONSTRAINT [PK_tblrecordid] PRIMARY KEY CLUSTERED 
(
	[branchcode] ASC,
	[convalue] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblrecordid] ([branchcode], [convalue], [recordid], [description]) VALUES (N'0101', N'CATEGORY', 10, N'CATEGORY')
INSERT [dbo].[tblrecordid] ([branchcode], [convalue], [recordid], [description]) VALUES (N'0101', N'DRAFT_ISSUE', 16, N'DRAFT_ISSUE')
INSERT [dbo].[tblrecordid] ([branchcode], [convalue], [recordid], [description]) VALUES (N'0101', N'ISSUE', 41, N'ISSUE')
INSERT [dbo].[tblrecordid] ([branchcode], [convalue], [recordid], [description]) VALUES (N'0101', N'ISSUE_DRAFT', 7, N'ISSUE_DRAFT')
INSERT [dbo].[tblrecordid] ([branchcode], [convalue], [recordid], [description]) VALUES (N'0101', N'LOGS_USER', 160, N'LOGS_USER')
INSERT [dbo].[tblrecordid] ([branchcode], [convalue], [recordid], [description]) VALUES (N'0101', N'SUB_CATEGORY', 18, N'SUB_CATEGORY')
INSERT [dbo].[tblrecordid] ([branchcode], [convalue], [recordid], [description]) VALUES (N'0101', N'SYSDONUM', 72, N'SYSDONUM')
INSERT [dbo].[tblrecordid] ([branchcode], [convalue], [recordid], [description]) VALUES (N'0101', N'USER_ID', 7, N'USER_ID')
INSERT [dbo].[tblrecordid] ([branchcode], [convalue], [recordid], [description]) VALUES (N'1010', N'LOGS_USER', 15, N'LOGS_USER')
INSERT [dbo].[tblrecordid] ([branchcode], [convalue], [recordid], [description]) VALUES (N'1010', N'USER_ID', 2, N'USER_ID')
/****** Object:  Table [dbo].[tblbranch]    Script Date: 03/01/2022 17:04:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblbranch](
	[branchcode] [nvarchar](10) NOT NULL,
	[subofbranch] [nvarchar](10) NOT NULL,
	[is_branch] [bit] NULL,
	[Disable] [bit] NULL,
	[branchname] [nvarchar](250) NULL,
	[branchshort] [nvarchar](250) NULL,
	[inputter] [nvarchar](150) NULL,
	[create_at] [datetime] NULL,
 CONSTRAINT [PK_tblbranch] PRIMARY KEY CLUSTERED 
(
	[branchcode] ASC,
	[subofbranch] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblbranch] ([branchcode], [subofbranch], [is_branch], [Disable], [branchname], [branchshort], [inputter], [create_at]) VALUES (N'0101', N'9090', 1, 0, N'GDT-HO', N'HO', N'joincoder1@gmail.com', CAST(0x0000AE1F014E92ED AS DateTime))
/****** Object:  Table [dbo].[tbl_user_profile]    Script Date: 03/01/2022 17:04:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_user_profile](
	[pro_id] [nvarchar](10) NOT NULL,
	[pro_name] [nvarchar](50) NULL,
	[pro_name_kh] [nvarchar](50) NULL,
	[disable] [bit] NULL,
	[inputter] [nvarchar](150) NULL,
	[create_at] [datetime] NULL,
 CONSTRAINT [PK_tbl_user_profile] PRIMARY KEY CLUSTERED 
(
	[pro_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_user_profile] ([pro_id], [pro_name], [pro_name_kh], [disable], [inputter], [create_at]) VALUES (N'01', N'Requester', N'Requester', 0, N'joincoder1@gmail.com', CAST(0x0000AE1F014E92ED AS DateTime))
INSERT [dbo].[tbl_user_profile] ([pro_id], [pro_name], [pro_name_kh], [disable], [inputter], [create_at]) VALUES (N'02', N'Approver', N'Approver', 0, N'joincoder1@gmail.com', CAST(0x0000AE1F014E92ED AS DateTime))
/****** Object:  Table [dbo].[tbl_user_logs]    Script Date: 03/01/2022 17:04:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_user_logs](
	[log_num] [nvarchar](10) NOT NULL,
	[branchcode] [nvarchar](10) NOT NULL,
	[log_detail] [nvarchar](550) NULL,
	[log_user] [nvarchar](150) NULL,
	[log_at] [datetime] NULL,
 CONSTRAINT [PK_tbl_user_logs] PRIMARY KEY CLUSTERED 
(
	[log_num] ASC,
	[branchcode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_user_logs] ([log_num], [branchcode], [log_detail], [log_user], [log_at]) VALUES (N'L0136', N'0101', N'User login to system', N'joincoder2@gmail.com', CAST(0x0000AE4B009E38E6 AS DateTime))
INSERT [dbo].[tbl_user_logs] ([log_num], [branchcode], [log_detail], [log_user], [log_at]) VALUES (N'L0137', N'0101', N'User try to getting report : rpt_report_os', N'joincoder2@gmail.com', CAST(0x0000AE4B009E5AA9 AS DateTime))
INSERT [dbo].[tbl_user_logs] ([log_num], [branchcode], [log_detail], [log_user], [log_at]) VALUES (N'L0138', N'0101', N'User login to system', N'joincoder3@gmail.com', CAST(0x0000AE4B00A4BADC AS DateTime))
INSERT [dbo].[tbl_user_logs] ([log_num], [branchcode], [log_detail], [log_user], [log_at]) VALUES (N'L0139', N'0101', N'User login to system', N'joincoder2@gmail.com', CAST(0x0000AE4B00A4E622 AS DateTime))
INSERT [dbo].[tbl_user_logs] ([log_num], [branchcode], [log_detail], [log_user], [log_at]) VALUES (N'L0140', N'0101', N'User login to system', N'joincoder2@gmail.com', CAST(0x0000AE4B00A50626 AS DateTime))
INSERT [dbo].[tbl_user_logs] ([log_num], [branchcode], [log_detail], [log_user], [log_at]) VALUES (N'L0141', N'0101', N'User login to system', N'joincoder1@gmail.com', CAST(0x0000AE4B00A5173F AS DateTime))
INSERT [dbo].[tbl_user_logs] ([log_num], [branchcode], [log_detail], [log_user], [log_at]) VALUES (N'L0142', N'0101', N'User try to getting report : rpt_report_os', N'joincoder1@gmail.com', CAST(0x0000AE4B00A54C92 AS DateTime))
INSERT [dbo].[tbl_user_logs] ([log_num], [branchcode], [log_detail], [log_user], [log_at]) VALUES (N'L0143', N'0101', N'User try to getting report : rpt_report_issue', N'joincoder1@gmail.com', CAST(0x0000AE4B00A5525C AS DateTime))
INSERT [dbo].[tbl_user_logs] ([log_num], [branchcode], [log_detail], [log_user], [log_at]) VALUES (N'L0144', N'0101', N'User login to system', N'joincoder@gmail.com', CAST(0x0000AE4B00B4702E AS DateTime))
INSERT [dbo].[tbl_user_logs] ([log_num], [branchcode], [log_detail], [log_user], [log_at]) VALUES (N'L0145', N'0101', N'User login to system', N'joincoder@gmail.com', CAST(0x0000AE4B00B60B2E AS DateTime))
INSERT [dbo].[tbl_user_logs] ([log_num], [branchcode], [log_detail], [log_user], [log_at]) VALUES (N'L0146', N'0101', N'User login to system', N'joincoder@gmail.com', CAST(0x0000AE4B00B746EF AS DateTime))
INSERT [dbo].[tbl_user_logs] ([log_num], [branchcode], [log_detail], [log_user], [log_at]) VALUES (N'L0147', N'0101', N'User try to getting report : rpt_report_os', N'joincoder@gmail.com', CAST(0x0000AE4B00B94C23 AS DateTime))
INSERT [dbo].[tbl_user_logs] ([log_num], [branchcode], [log_detail], [log_user], [log_at]) VALUES (N'L0148', N'0101', N'User try to getting report : rpt_report_issue_closed', N'joincoder@gmail.com', CAST(0x0000AE4B00B95DB8 AS DateTime))
INSERT [dbo].[tbl_user_logs] ([log_num], [branchcode], [log_detail], [log_user], [log_at]) VALUES (N'L0149', N'0101', N'User try to getting report : rpt_report_issue_closed', N'joincoder@gmail.com', CAST(0x0000AE4B00B979C8 AS DateTime))
INSERT [dbo].[tbl_user_logs] ([log_num], [branchcode], [log_detail], [log_user], [log_at]) VALUES (N'L0150', N'0101', N'User try to getting report : rpt_report_issue_closed', N'joincoder@gmail.com', CAST(0x0000AE4B00B97D33 AS DateTime))
INSERT [dbo].[tbl_user_logs] ([log_num], [branchcode], [log_detail], [log_user], [log_at]) VALUES (N'L0151', N'0101', N'User try to getting report : rpt_report_issue_closed', N'joincoder@gmail.com', CAST(0x0000AE4B00B980F7 AS DateTime))
INSERT [dbo].[tbl_user_logs] ([log_num], [branchcode], [log_detail], [log_user], [log_at]) VALUES (N'L0152', N'0101', N'User try to getting report : rpt_report_issue_closed', N'joincoder@gmail.com', CAST(0x0000AE4B00B98DD9 AS DateTime))
INSERT [dbo].[tbl_user_logs] ([log_num], [branchcode], [log_detail], [log_user], [log_at]) VALUES (N'L0153', N'0101', N'User try to getting report : rpt_report_issue', N'joincoder@gmail.com', CAST(0x0000AE4B00B998C9 AS DateTime))
INSERT [dbo].[tbl_user_logs] ([log_num], [branchcode], [log_detail], [log_user], [log_at]) VALUES (N'L0154', N'0101', N'User login to system', N'joincoder@gmail.com', CAST(0x0000AE4B00BC39ED AS DateTime))
INSERT [dbo].[tbl_user_logs] ([log_num], [branchcode], [log_detail], [log_user], [log_at]) VALUES (N'L0155', N'0101', N'User try to getting report : rpt_report_os', N'joincoder@gmail.com', CAST(0x0000AE4B00BD8D15 AS DateTime))
INSERT [dbo].[tbl_user_logs] ([log_num], [branchcode], [log_detail], [log_user], [log_at]) VALUES (N'L0156', N'0101', N'User try to getting report : rpt_report_os', N'joincoder@gmail.com', CAST(0x0000AE4B00BDA6F2 AS DateTime))
INSERT [dbo].[tbl_user_logs] ([log_num], [branchcode], [log_detail], [log_user], [log_at]) VALUES (N'L0157', N'0101', N'User try to getting report : rpt_report_issue', N'joincoder@gmail.com', CAST(0x0000AE4B00BDBC4D AS DateTime))
INSERT [dbo].[tbl_user_logs] ([log_num], [branchcode], [log_detail], [log_user], [log_at]) VALUES (N'L0158', N'0101', N'User try to getting report : rpt_report_issue', N'joincoder@gmail.com', CAST(0x0000AE4B00BDC3CA AS DateTime))
INSERT [dbo].[tbl_user_logs] ([log_num], [branchcode], [log_detail], [log_user], [log_at]) VALUES (N'L0159', N'0101', N'User try to getting report : rpt_report_issue_closed', N'joincoder@gmail.com', CAST(0x0000AE4B00BE036D AS DateTime))
INSERT [dbo].[tbl_user_logs] ([log_num], [branchcode], [log_detail], [log_user], [log_at]) VALUES (N'L0160', N'0101', N'User login to system', N'joincoder@gmail.com', CAST(0x0000AE4B00C71B3F AS DateTime))
/****** Object:  Table [dbo].[tbl_user_info]    Script Date: 03/01/2022 17:04:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_user_info](
	[user_id] [nvarchar](10) NOT NULL,
	[branchcode] [nvarchar](10) NOT NULL,
	[user_name] [nvarchar](250) NULL,
	[gender] [nvarchar](20) NULL,
	[dob] [date] NULL,
	[place_of_birth] [nvarchar](250) NULL,
	[address] [nvarchar](250) NULL,
	[phone] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[idcard] [nvarchar](10) NULL,
	[position] [nvarchar](50) NULL,
	[workplace] [nvarchar](250) NULL,
	[create_at] [datetime] NULL,
	[update_at] [datetime] NULL,
 CONSTRAINT [PK_tbl_user_info] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[branchcode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_user_info] ([user_id], [branchcode], [user_name], [gender], [dob], [place_of_birth], [address], [phone], [email], [idcard], [position], [workplace], [create_at], [update_at]) VALUES (N'0101-0002', N'1010', N'Bong Map', N'01', CAST(0x45190B00 AS Date), N'ស្រុកបន្ទាយមាស ខេត្តកំពត', N'សែនសុខ ភ្នំពេញ', N'010500313', N'joincoder@gmail.com', N'172', N'Programmer', N'GDT', CAST(0x0000AE1B009A7DB7 AS DateTime), NULL)
INSERT [dbo].[tbl_user_info] ([user_id], [branchcode], [user_name], [gender], [dob], [place_of_birth], [address], [phone], [email], [idcard], [position], [workplace], [create_at], [update_at]) VALUES (N'0101-0005', N'0101', N'Coder', N'01', CAST(0x6B170B00 AS Date), N'Somrong , Sen sok , phnom penh', N'Somrong , Sen sok , phnom penh', N'012500339', N'joincoder@gmail.com', N'0111', N'Programmer', N'GDT', CAST(0x0000AE4B00A4B2F6 AS DateTime), NULL)
INSERT [dbo].[tbl_user_info] ([user_id], [branchcode], [user_name], [gender], [dob], [place_of_birth], [address], [phone], [email], [idcard], [position], [workplace], [create_at], [update_at]) VALUES (N'0101-0007', N'0101', N'JoinCoder', N'01', CAST(0x72170B00 AS Date), N'Somrong , Sen sok , Phnom penh', N'Somrong , Sen sok , Phnom penh', N'012 500339', N'joincoder@gmail.com', N'123', N'programmer', N'GDT', CAST(0x0000AE4B00BC2EE7 AS DateTime), NULL)
/****** Object:  Table [dbo].[tbl_sub_categories]    Script Date: 03/01/2022 17:04:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_sub_categories](
	[sub_id] [nvarchar](10) NOT NULL,
	[cat_id] [nvarchar](10) NOT NULL,
	[branchcode] [nvarchar](10) NOT NULL,
	[sub_name] [nvarchar](50) NULL,
	[disable] [bit] NULL,
	[inputter] [nvarchar](150) NULL,
	[create_at] [datetime] NULL,
 CONSTRAINT [PK_tbl_sub_categories_1] PRIMARY KEY CLUSTERED 
(
	[sub_id] ASC,
	[branchcode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_sub_categories] ([sub_id], [cat_id], [branchcode], [sub_name], [disable], [inputter], [create_at]) VALUES (N'S0016', N'C0009', N'0101', N'Phone problem', 0, N'joincoder@gmail.com', CAST(0x0000AE4B00BC87E3 AS DateTime))
INSERT [dbo].[tbl_sub_categories] ([sub_id], [cat_id], [branchcode], [sub_name], [disable], [inputter], [create_at]) VALUES (N'S0017', N'C0009', N'0101', N'Server Network', 0, N'joincoder@gmail.com', CAST(0x0000AE4B00BC9835 AS DateTime))
INSERT [dbo].[tbl_sub_categories] ([sub_id], [cat_id], [branchcode], [sub_name], [disable], [inputter], [create_at]) VALUES (N'S0018', N'C0010', N'0101', N'Pos print out', 0, N'joincoder@gmail.com', CAST(0x0000AE4B00BCB0F5 AS DateTime))
/****** Object:  Table [dbo].[tbl_status]    Script Date: 03/01/2022 17:04:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_status](
	[stu_id] [nvarchar](50) NOT NULL,
	[branchcode] [nvarchar](50) NOT NULL,
	[status] [nvarchar](150) NULL,
	[disable] [bit] NULL,
	[inputter] [nvarchar](150) NULL,
	[create_at] [datetime] NULL,
 CONSTRAINT [PK_tbl_status] PRIMARY KEY CLUSTERED 
(
	[stu_id] ASC,
	[branchcode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_status] ([stu_id], [branchcode], [status], [disable], [inputter], [create_at]) VALUES (N'S0001', N'0101', N'Accept', 0, N'joincoder1@gmail.com', CAST(0x0000AE1F014E92ED AS DateTime))
INSERT [dbo].[tbl_status] ([stu_id], [branchcode], [status], [disable], [inputter], [create_at]) VALUES (N'S0002', N'0101', N'Inprogress', 0, N'joincoder1@gmail.com', CAST(0x0000AE1F014E92ED AS DateTime))
INSERT [dbo].[tbl_status] ([stu_id], [branchcode], [status], [disable], [inputter], [create_at]) VALUES (N'S0003', N'0101', N'Solved', 0, N'joincoder1@gmail.com', CAST(0x0000AE1F014E92ED AS DateTime))
INSERT [dbo].[tbl_status] ([stu_id], [branchcode], [status], [disable], [inputter], [create_at]) VALUES (N'S0004', N'0101', N'Close issue', 0, N'joincoder1@gmail.com', CAST(0x0000AE1F014E92ED AS DateTime))
/****** Object:  Table [dbo].[tbl_reports]    Script Date: 03/01/2022 17:04:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_reports](
	[rpt_id] [nvarchar](50) NOT NULL,
	[rpt_name] [nvarchar](50) NULL,
	[rpt_tittle] [nvarchar](50) NULL,
	[disable] [bit] NULL,
	[inputter] [nvarchar](50) NULL,
	[create_at] [datetime] NULL,
 CONSTRAINT [PK_tbl_reports] PRIMARY KEY CLUSTERED 
(
	[rpt_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_reports] ([rpt_id], [rpt_name], [rpt_tittle], [disable], [inputter], [create_at]) VALUES (N'01', N'rpt_report_os', N'Issue request', 0, N'joincoder1@gmail.com', CAST(0x0000AE1F014E92ED AS DateTime))
INSERT [dbo].[tbl_reports] ([rpt_id], [rpt_name], [rpt_tittle], [disable], [inputter], [create_at]) VALUES (N'02', N'rpt_report_issue', N'Issue Outstanding', 0, N'joincoder1@gmail.com', CAST(0x0000AE1F014E92ED AS DateTime))
INSERT [dbo].[tbl_reports] ([rpt_id], [rpt_name], [rpt_tittle], [disable], [inputter], [create_at]) VALUES (N'03', N'rpt_report_issue_closed', N'Issue Closed', 0, N'joincoder1@gmail.com', CAST(0x0000AE1F014E92ED AS DateTime))
/****** Object:  Table [dbo].[tbl_main_categories]    Script Date: 03/01/2022 17:04:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_main_categories](
	[cat_id] [nvarchar](10) NOT NULL,
	[branchcode] [nvarchar](10) NOT NULL,
	[cat_name] [nvarchar](250) NULL,
	[disable] [bit] NULL,
	[inputter] [nvarchar](150) NULL,
	[create_at] [datetime] NULL,
 CONSTRAINT [PK_tbl_main_categories] PRIMARY KEY CLUSTERED 
(
	[cat_id] ASC,
	[branchcode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_main_categories] ([cat_id], [branchcode], [cat_name], [disable], [inputter], [create_at]) VALUES (N'C0009', N'0101', N'Network problem', 0, N'joincoder@gmail.com', CAST(0x0000AE4B00BC639B AS DateTime))
INSERT [dbo].[tbl_main_categories] ([cat_id], [branchcode], [cat_name], [disable], [inputter], [create_at]) VALUES (N'C0010', N'0101', N'System POS', 0, N'joincoder@gmail.com', CAST(0x0000AE4B00BC6FF9 AS DateTime))
/****** Object:  Table [dbo].[tbl_issue_process]    Script Date: 03/01/2022 17:04:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_issue_process](
	[sysdoc] [nvarchar](50) NOT NULL,
	[branchcode] [nvarchar](50) NOT NULL,
	[issue_id] [nvarchar](50) NOT NULL,
	[status] [nvarchar](50) NULL,
	[inputter] [nvarchar](150) NULL,
	[create_at] [datetime] NULL,
 CONSTRAINT [PK_tbl_issue_process] PRIMARY KEY CLUSTERED 
(
	[sysdoc] ASC,
	[branchcode] ASC,
	[issue_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_issue_process] ([sysdoc], [branchcode], [issue_id], [status], [inputter], [create_at]) VALUES (N'0101-0070', N'0101', N'0040', N'S0001', N'joincoder@gmail.com', CAST(0x0000AE4B00BD5F43 AS DateTime))
INSERT [dbo].[tbl_issue_process] ([sysdoc], [branchcode], [issue_id], [status], [inputter], [create_at]) VALUES (N'0101-0071', N'0101', N'0040', N'S0002', N'joincoder@gmail.com', CAST(0x0000AE4B00BD761C AS DateTime))
INSERT [dbo].[tbl_issue_process] ([sysdoc], [branchcode], [issue_id], [status], [inputter], [create_at]) VALUES (N'0101-0072', N'0101', N'0040', N'S0004', N'joincoder@gmail.com', CAST(0x0000AE4B00BDEE23 AS DateTime))
/****** Object:  Table [dbo].[tbl_issue_list]    Script Date: 03/01/2022 17:04:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_issue_list](
	[issue_id] [nvarchar](10) NOT NULL,
	[branchcode] [nvarchar](10) NOT NULL,
	[cat_id] [nvarchar](10) NULL,
	[sub_id] [nvarchar](10) NULL,
	[issue] [nvarchar](500) NULL,
	[status] [nvarchar](10) NULL,
	[respone] [nvarchar](500) NULL,
	[inputter] [nvarchar](150) NULL,
	[create_at] [datetime] NULL,
	[update_at] [datetime] NULL,
	[closed_at] [datetime] NULL,
 CONSTRAINT [PK_tbl_issue_list] PRIMARY KEY CLUSTERED 
(
	[issue_id] ASC,
	[branchcode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_issue_list] ([issue_id], [branchcode], [cat_id], [sub_id], [issue], [status], [respone], [inputter], [create_at], [update_at], [closed_at]) VALUES (N'0040', N'0101', N'C0009', N'S0016', N'I can not call early morning
also can not hear clearly', N'S0004', N'checking with source code
- change network this issue has been completed', N'joincoder@gmail.com', CAST(0x0000AE4B00BCDA62 AS DateTime), CAST(0x0000AE4B00BDEE23 AS DateTime), CAST(0x0000AE4B00BDEE23 AS DateTime))
INSERT [dbo].[tbl_issue_list] ([issue_id], [branchcode], [cat_id], [sub_id], [issue], [status], [respone], [inputter], [create_at], [update_at], [closed_at]) VALUES (N'0041', N'0101', N'C0010', N'S0018', N'Can not print invoice out
anything else also can not get report', NULL, NULL, N'joincoder@gmail.com', CAST(0x0000AE4B00BD3CA9 AS DateTime), NULL, NULL)
/****** Object:  Table [dbo].[tbl_issue_draft]    Script Date: 03/01/2022 17:04:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_issue_draft](
	[dra_id] [nvarchar](10) NOT NULL,
	[branchcode] [nvarchar](10) NOT NULL,
	[cat_id] [nvarchar](10) NULL,
	[sub_id] [nvarchar](10) NULL,
	[issue] [nvarchar](500) NULL,
	[inputter] [nvarchar](150) NULL,
	[create_at] [datetime] NULL,
 CONSTRAINT [PK_tbl_issue_draft] PRIMARY KEY CLUSTERED 
(
	[dra_id] ASC,
	[branchcode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_issue_draft] ([dra_id], [branchcode], [cat_id], [sub_id], [issue], [inputter], [create_at]) VALUES (N'DRA0004', N'0101', N'C0002', N'S0005', N'88999', N'joincoder1@gmail.com', CAST(0x0000AE19016FA476 AS DateTime))
INSERT [dbo].[tbl_issue_draft] ([dra_id], [branchcode], [cat_id], [sub_id], [issue], [inputter], [create_at]) VALUES (N'DRA0005', N'0101', N'C0002', N'S0005', N'88999 2022', N'joincoder1@gmail.com', CAST(0x0000AE19016FB17A AS DateTime))
INSERT [dbo].[tbl_issue_draft] ([dra_id], [branchcode], [cat_id], [sub_id], [issue], [inputter], [create_at]) VALUES (N'DRA0006', N'0101', N'C0004', N'S0009', N'ពេលព្រឹក យឺត', N'joincoder1@gmail.com', CAST(0x0000AE1A016387EE AS DateTime))
INSERT [dbo].[tbl_issue_draft] ([dra_id], [branchcode], [cat_id], [sub_id], [issue], [inputter], [create_at]) VALUES (N'DRA0007', N'0101', N'C0004', N'S0009', N'ពេលព្រឹក យឺត 33', N'joincoder1@gmail.com', CAST(0x0000AE1A0163F5C4 AS DateTime))
INSERT [dbo].[tbl_issue_draft] ([dra_id], [branchcode], [cat_id], [sub_id], [issue], [inputter], [create_at]) VALUES (N'DRA0011', N'0101', N'C0002', N'S0004', N'កុំព្យូរទ័រ មិនអាចភ្ជាប់ទៅកាន់ ម៉ាស៊ីបោះពុម្ពបាន', N'joincoder1@gmail.com', CAST(0x0000AE1C00FBC93D AS DateTime))
INSERT [dbo].[tbl_issue_draft] ([dra_id], [branchcode], [cat_id], [sub_id], [issue], [inputter], [create_at]) VALUES (N'DRA0012', N'0101', N'C0004', N'S0011', N'មិនអាច បង្កើត stock ថ្មីបាន', N'joincoder1@gmail.com', CAST(0x0000AE1E015EED6D AS DateTime))
INSERT [dbo].[tbl_issue_draft] ([dra_id], [branchcode], [cat_id], [sub_id], [issue], [inputter], [create_at]) VALUES (N'DRA0013', N'0101', N'C0002', N'S0005', N'Eorr when export report', N'joincoder1@gmail.com', CAST(0x0000AE1E0168653C AS DateTime))
INSERT [dbo].[tbl_issue_draft] ([dra_id], [branchcode], [cat_id], [sub_id], [issue], [inputter], [create_at]) VALUES (N'DRA0014', N'0101', N'C0004', N'S0011', N'មិនអាច Post EOM បាន', N'joincoder1@gmail.com', CAST(0x0000AE1F008D0D2E AS DateTime))
INSERT [dbo].[tbl_issue_draft] ([dra_id], [branchcode], [cat_id], [sub_id], [issue], [inputter], [create_at]) VALUES (N'DRA0015', N'0101', N'C0001', N'S0010', N'It can not print out', N'joincoder@gmail.com', CAST(0x0000AE4B00B68FE0 AS DateTime))
INSERT [dbo].[tbl_issue_draft] ([dra_id], [branchcode], [cat_id], [sub_id], [issue], [inputter], [create_at]) VALUES (N'DRA0016', N'0101', N'C0010', N'S0018', N'Can not print invoice out', N'joincoder@gmail.com', CAST(0x0000AE4B00BD1CB3 AS DateTime))
/****** Object:  Table [dbo].[sysPermission]    Script Date: 03/01/2022 17:04:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sysPermission](
	[pro_id] [nvarchar](10) NOT NULL,
	[menu_id] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_sysPermission_1] PRIMARY KEY CLUSTERED 
(
	[pro_id] ASC,
	[menu_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[sysPermission] ([pro_id], [menu_id]) VALUES (N'01', N'001')
INSERT [dbo].[sysPermission] ([pro_id], [menu_id]) VALUES (N'01', N'002')
INSERT [dbo].[sysPermission] ([pro_id], [menu_id]) VALUES (N'01', N'004')
INSERT [dbo].[sysPermission] ([pro_id], [menu_id]) VALUES (N'01', N'005')
INSERT [dbo].[sysPermission] ([pro_id], [menu_id]) VALUES (N'01', N'006')
INSERT [dbo].[sysPermission] ([pro_id], [menu_id]) VALUES (N'01', N'010')
INSERT [dbo].[sysPermission] ([pro_id], [menu_id]) VALUES (N'01', N'015')
INSERT [dbo].[sysPermission] ([pro_id], [menu_id]) VALUES (N'01', N'017')
INSERT [dbo].[sysPermission] ([pro_id], [menu_id]) VALUES (N'02', N'001')
INSERT [dbo].[sysPermission] ([pro_id], [menu_id]) VALUES (N'02', N'002')
INSERT [dbo].[sysPermission] ([pro_id], [menu_id]) VALUES (N'02', N'003')
INSERT [dbo].[sysPermission] ([pro_id], [menu_id]) VALUES (N'02', N'004')
INSERT [dbo].[sysPermission] ([pro_id], [menu_id]) VALUES (N'02', N'005')
INSERT [dbo].[sysPermission] ([pro_id], [menu_id]) VALUES (N'02', N'006')
INSERT [dbo].[sysPermission] ([pro_id], [menu_id]) VALUES (N'02', N'010')
INSERT [dbo].[sysPermission] ([pro_id], [menu_id]) VALUES (N'02', N'011')
INSERT [dbo].[sysPermission] ([pro_id], [menu_id]) VALUES (N'02', N'012')
INSERT [dbo].[sysPermission] ([pro_id], [menu_id]) VALUES (N'02', N'013')
INSERT [dbo].[sysPermission] ([pro_id], [menu_id]) VALUES (N'02', N'015')
INSERT [dbo].[sysPermission] ([pro_id], [menu_id]) VALUES (N'02', N'017')
/****** Object:  Table [dbo].[sysMenus]    Script Date: 03/01/2022 17:04:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sysMenus](
	[MenuID] [nvarchar](10) NOT NULL,
	[Names] [nvarchar](150) NULL,
	[Tittle] [nvarchar](150) NULL,
	[SubOf] [nvarchar](10) NULL,
 CONSTRAINT [PK_sysMenus] PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[sysMenus] ([MenuID], [Names], [Tittle], [SubOf]) VALUES (N'001', N'_File', N'File', NULL)
INSERT [dbo].[sysMenus] ([MenuID], [Names], [Tittle], [SubOf]) VALUES (N'002', N'_Ticket', N'Ticket', NULL)
INSERT [dbo].[sysMenus] ([MenuID], [Names], [Tittle], [SubOf]) VALUES (N'003', N'_Tools', N'Tools', NULL)
INSERT [dbo].[sysMenus] ([MenuID], [Names], [Tittle], [SubOf]) VALUES (N'004', N'_Setting', N'Setting', NULL)
INSERT [dbo].[sysMenus] ([MenuID], [Names], [Tittle], [SubOf]) VALUES (N'005', N'_About', N'About', NULL)
INSERT [dbo].[sysMenus] ([MenuID], [Names], [Tittle], [SubOf]) VALUES (N'006', N'_report', N'Report List', N'001')
INSERT [dbo].[sysMenus] ([MenuID], [Names], [Tittle], [SubOf]) VALUES (N'007', N'_logout_app', N'log out', N'001')
INSERT [dbo].[sysMenus] ([MenuID], [Names], [Tittle], [SubOf]) VALUES (N'008', N'_exit_app', N'Exit', N'001')
INSERT [dbo].[sysMenus] ([MenuID], [Names], [Tittle], [SubOf]) VALUES (N'010', N'_request_ticket', N'Request Ticket', N'002')
INSERT [dbo].[sysMenus] ([MenuID], [Names], [Tittle], [SubOf]) VALUES (N'011', N'_verify_ticket', N'Verify Ticket', N'002')
INSERT [dbo].[sysMenus] ([MenuID], [Names], [Tittle], [SubOf]) VALUES (N'012', N'_Main_Category', N'Create Main Category', N'003')
INSERT [dbo].[sysMenus] ([MenuID], [Names], [Tittle], [SubOf]) VALUES (N'013', N'_Sub_Category', N'Create Sub Category', N'003')
INSERT [dbo].[sysMenus] ([MenuID], [Names], [Tittle], [SubOf]) VALUES (N'014', N'_register_users', N'User Control', N'004')
INSERT [dbo].[sysMenus] ([MenuID], [Names], [Tittle], [SubOf]) VALUES (N'015', N'_about_me', N'About me', N'005')
INSERT [dbo].[sysMenus] ([MenuID], [Names], [Tittle], [SubOf]) VALUES (N'017', N'_PasswordReset', N'Change Password', N'004')
/****** Object:  Table [dbo].[sysconstants]    Script Date: 03/01/2022 17:04:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sysconstants](
	[con_id] [nvarchar](50) NOT NULL,
	[con_display] [nvarchar](50) NOT NULL,
	[con_line] [nvarchar](50) NOT NULL,
	[disable] [bit] NULL,
 CONSTRAINT [PK_sysconstants] PRIMARY KEY CLUSTERED 
(
	[con_id] ASC,
	[con_display] ASC,
	[con_line] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[sysconstants] ([con_id], [con_display], [con_line], [disable]) VALUES (N'0', N'No', N'Active', 0)
INSERT [dbo].[sysconstants] ([con_id], [con_display], [con_line], [disable]) VALUES (N'01', N'Male', N'gender', 0)
INSERT [dbo].[sysconstants] ([con_id], [con_display], [con_line], [disable]) VALUES (N'02', N'Female', N'gender', 0)
INSERT [dbo].[sysconstants] ([con_id], [con_display], [con_line], [disable]) VALUES (N'1', N'Yes', N'Active', 0)
INSERT [dbo].[sysconstants] ([con_id], [con_display], [con_line], [disable]) VALUES (N'S0001', N'Accept', N'Status', 0)
/****** Object:  Table [dbo].[sys_versions]    Script Date: 03/01/2022 17:04:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_versions](
	[version] [nvarchar](50) NOT NULL,
	[date_at] [date] NULL,
	[tag] [nvarchar](1) NULL,
 CONSTRAINT [PK_sys_versions] PRIMARY KEY CLUSTERED 
(
	[version] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[sys_versions] ([version], [date_at], [tag]) VALUES (N'0.0.0.1', CAST(0xF2260B00 AS Date), N'1')
/****** Object:  Table [dbo].[sys_user_logins]    Script Date: 03/01/2022 17:04:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_user_logins](
	[user_id] [nvarchar](10) NOT NULL,
	[branchcode] [nvarchar](10) NOT NULL,
	[sub_of_branch] [nvarchar](10) NOT NULL,
	[profile_id] [nvarchar](10) NOT NULL,
	[user_login] [nvarchar](250) NULL,
	[user_pwd] [nvarchar](250) NULL,
	[disable] [bit] NULL,
	[create_at] [datetime] NULL,
	[expired_at] [date] NULL,
	[inputter] [nvarchar](150) NULL,
 CONSTRAINT [PK_sys_user_logins] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[branchcode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[sys_user_logins] ([user_id], [branchcode], [sub_of_branch], [profile_id], [user_login], [user_pwd], [disable], [create_at], [expired_at], [inputter]) VALUES (N'0101-0002', N'0101', N'0101', N'01', N'joincoder2@gmail.com', N'X3uKWyQJc0asFkVhpXKSZmdZq3aZ7LispuZa2vVVTqJRByxNOc7gvg==', 0, CAST(0x0000AE1B013E797D AS DateTime), CAST(0xE3440B00 AS Date), N'joincoder@gmail.com')
INSERT [dbo].[sys_user_logins] ([user_id], [branchcode], [sub_of_branch], [profile_id], [user_login], [user_pwd], [disable], [create_at], [expired_at], [inputter]) VALUES (N'0101-0003', N'0101', N'0101', N'02', N'joincoder1@gmail.com', N'X3uKWyQJc0asFkVhpXKSZmdZq3aZ7LispuZa2vVVTqJRByxNOc7gvg==', 0, CAST(0x0000AE1D016ACEFF AS DateTime), CAST(0xE5440B00 AS Date), N'joincoder1@gmail.com')
INSERT [dbo].[sys_user_logins] ([user_id], [branchcode], [sub_of_branch], [profile_id], [user_login], [user_pwd], [disable], [create_at], [expired_at], [inputter]) VALUES (N'0101-0005', N'0101', N'0101', N'01', N'joincoder3@gmail.com', N'PqM3N4uOEi17QUfY6IMjcGwazi82uifEXw/Pz5QY06kq2N9u/L4sBA==', 0, CAST(0x0000AE4B00A4B2F6 AS DateTime), CAST(0x13450B00 AS Date), N'joincoder3@gmail.com')
INSERT [dbo].[sys_user_logins] ([user_id], [branchcode], [sub_of_branch], [profile_id], [user_login], [user_pwd], [disable], [create_at], [expired_at], [inputter]) VALUES (N'0101-0007', N'0101', N'0101', N'02', N'joincoder@gmail.com', N'5wts5L4L7OHgM8Zfy4PQ0YfilBpitK6cqkC0T5IIhY/Ek9ddXTtlEw==', 0, CAST(0x0000AE4B00BC2EE7 AS DateTime), CAST(0x13450B00 AS Date), N'joincoder@gmail.com')
/****** Object:  StoredProcedure [dbo].[rpt_report_os]    Script Date: 03/01/2022 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[rpt_report_os]
	@vBranchcode	NVARCHAR(10),
	@vMainCategory	NVARCHAR(20),
	@vSubCategory	NVARCHAR(20),
	@vDateFrom		DATE,
	@vDateTo		DATE
AS
BEGIN
	
	SELECT A.issue_id, 
		   A.branchcode,
		   A.cat_id,
		   B.cat_name AS MainCategory,
		   A.sub_id,
		   C.sub_name AS SubCategory,
		   A.issue,
		   A.inputter,
		   A.create_at
	FROM tbl_issue_list AS A
	INNER JOIN tbl_main_categories AS B ON A.branchcode=B.branchcode AND A.cat_id=B.cat_id
	INNER JOIN tbl_sub_categories AS C ON A.branchcode=C.branchcode AND A.sub_id=C.sub_id
	WHERE	A.branchcode=@vBranchcode AND 
			A.closed_at IS NULL AND 
			CONVERT(DATE,A.create_at) BETWEEN @vDateFrom AND @vDateTo AND 
			A.cat_id LIKE @vMainCategory+'%' AND 
			A.sub_id LIKE @vSubCategory+'%'  
	ORDER BY A.issue_id
END
GO
/****** Object:  StoredProcedure [dbo].[rpt_report_issue_closed]    Script Date: 03/01/2022 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[rpt_report_issue_closed]
	@vBranchcode	NVARCHAR(10),
	@vMainCategory	NVARCHAR(20),
	@vSubCategory	NVARCHAR(20),
	@vDateFrom		DATE,
	@vDateTo		DATE
AS
BEGIN
	
	SELECT A.issue_id, 
		   A.branchcode,
		   A.cat_id,
		   B.cat_name AS MainCategory,
		   A.sub_id,
		   C.sub_name AS SubCategory,
		   A.issue,
		   ISNULL(S.[status],'N/A') AS [status],
		   A.inputter,
		   A.create_at,
		   A.closed_at
	FROM tbl_issue_list AS A
	INNER JOIN tbl_main_categories AS B ON A.branchcode=B.branchcode AND A.cat_id=B.cat_id
	INNER JOIN tbl_sub_categories AS C ON A.branchcode=C.branchcode AND A.sub_id=C.sub_id
	LEFT JOIN tbl_status AS S ON A.branchcode=S.branchcode AND A.[status]=S.stu_id
	WHERE	A.branchcode=@vBranchcode AND 
			CONVERT(DATE,A.closed_at) BETWEEN @vDateFrom AND @vDateTo AND 
			A.cat_id LIKE @vMainCategory+'%' AND 
			A.sub_id LIKE @vSubCategory+'%'    
	ORDER BY A.issue_id
END
GO
/****** Object:  StoredProcedure [dbo].[rpt_report_issue]    Script Date: 03/01/2022 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[rpt_report_issue]
	@vBranchcode	NVARCHAR(10),
	@vMainCategory	NVARCHAR(20),
	@vSubCategory	NVARCHAR(20),
	@vStatus		NVARCHAR(20),
	@vDateFrom		DATE,
	@vDateTo		DATE
AS 
BEGIN

	SELECT A.issue_id, 
		   A.branchcode,
		   A.cat_id,
		   B.cat_name AS MainCategory,
		   A.sub_id,
		   C.sub_name AS SubCategory,
		   A.issue,
		   ISNULL(S.[status],'N/A') AS [status],
		   A.inputter,
		   A.create_at
	FROM tbl_issue_list AS A
	INNER JOIN tbl_main_categories AS B ON A.branchcode=B.branchcode AND A.cat_id=B.cat_id
	INNER JOIN tbl_sub_categories AS C ON A.branchcode=C.branchcode AND A.sub_id=C.sub_id
	LEFT JOIN tbl_status AS S ON A.branchcode=S.branchcode AND A.[status]=S.stu_id
	WHERE	A.branchcode=@vBranchcode AND 
			CONVERT(DATE,A.create_at) BETWEEN @vDateFrom AND @vDateTo AND 
			A.cat_id LIKE @vMainCategory+'%' AND 
			A.sub_id LIKE @vSubCategory+'%'  AND
			A.[status] LIKE @vStatus+'%' 
	ORDER BY A.issue_id
END
GO
/****** Object:  UserDefinedFunction [dbo].[fun_status_fix]    Script Date: 03/01/2022 17:04:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fun_status_fix](
	@vstatus		NVARCHAR(20)
)
RETURNS NVARCHAR(250)
AS
BEGIN
	declare @vreturn NVARCHAR(250) ;
	declare @vLast   NVARCHAR(250) ;
	if(@vstatus='st_code')begin
		SET @vreturn = ISNULL ((SELECT TOP 1 stu_id FROM tbl_status ORDER BY stu_id ),'S0001')
	end else if (@vstatus='cl_code')begin
		SET @vreturn = ISNULL ((SELECT TOP 1 stu_id FROM tbl_status ORDER BY stu_id desc),'S0004')
	end 
	RETURN isnull(@vreturn,'') 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fun_issue_status]    Script Date: 03/01/2022 17:04:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fun_issue_status](
	@vstatus		NVARCHAR(20),
	@vbranchcode	NVARCHAR(10),
	@vtracode1		NVARCHAR(10)=''
)
RETURNS NVARCHAR(250)
AS
BEGIN
	declare @vreturn NVARCHAR(250) ;
	declare @vLast   NVARCHAR(250) ;
	if(@vstatus='st_issue')begin
		SET @vLast = ISNULL((SELECT TOP 1 [status] FROM tbl_issue_process AS A WHERE A.branchcode=@vbranchcode AND A.issue_id=@vtracode1 ORDER BY create_at ),'S0001')
		SET @vreturn = ISNULL((SELECT TOP 1 [status] FROM tbl_status AS A WHERE A.stu_id=@vLast ORDER BY stu_id ),'N/A')
	end 

	RETURN isnull(@vreturn,'') 
END
GO
/****** Object:  StoredProcedure [dbo].[proc_destory_draft]    Script Date: 03/01/2022 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_destory_draft]
	@CMD			NVARCHAR(10),
	@vDraft_ID		NVARCHAR(10),
	@vBranchcode	NVARCHAR(10),
	@vInputter		NVARCHAR(150)
as
begin
	
	IF (@CMD='D_DRAFT')BEGIN
		DELETE A FROM tbl_issue_draft  AS A WHERE A.branchcode=@vBranchcode AND A.dra_id=@vDraft_ID
	END 
	
	SELECT @vDraft_ID AS TRANCODE

end
GO
/****** Object:  StoredProcedure [dbo].[proc_create_user_logins]    Script Date: 03/01/2022 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_create_user_logins]
	@CMD			NVARCHAR(10),
	@vUser_id		NVARCHAR(10),
	@vBranchcode	NVARCHAR(10),
	@vProfile		NVARCHAR(250),
	@vUserlogin		NVARCHAR(250),
	@vUserPwd		NVARCHAR(250),
	@vDisable		BIT,
	@vInputter		NVARCHAR(150)

AS
BEGIN
	DECLARE @vExpired DATE 
	SET @vExpired=DATEADD(D,365,GETDATE())

	IF(@CMD='AUTO')BEGIN
		
		INSERT INTO sys_user_logins (user_id,branchcode,sub_of_branch,profile_id,user_login,user_pwd,disable,create_at,expired_at,inputter)
					VALUES (@vUser_id,@vBranchcode,@vBranchcode,@vProfile,@vUserlogin,@vUserPwd,@vDisable,GETDATE(),@vExpired,@vUserlogin)


	END
END
GO
/****** Object:  StoredProcedure [dbo].[proc_permission_profile]    Script Date: 03/01/2022 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[proc_permission_profile]
	@vPro_ID	NVARCHAR(20),
	@vMenuName	NVARCHAR(20)
AS
BEGIN
	-- GET MAIN MENU 
	SELECT A.pro_id,
		   A.menu_id,
		   B.Names,
		   B.Tittle
	INTO #tmpMenu
	FROM sysPermission AS A 
	INNER JOIN sysMenus AS B ON A.menu_id=B.MenuID
	WHERE A.pro_id=@vPro_ID AND B.Names=@vMenuName


	SELECT A.pro_id,
		   B.MenuID,
		   B.Names,
		   B.Tittle
	FROM #tmpMenu AS A 
	INNER JOIN sysMenus AS B ON A.menu_id=B.SubOf
	INNER JOIN sysPermission AS P ON A.pro_id=P.pro_id AND P.menu_id=B.MenuID


END

--- pro_permission_profile '01','_Setting'
GO
/****** Object:  StoredProcedure [dbo].[proc_password_reset]    Script Date: 03/01/2022 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_password_reset]
	@CMD			NVARCHAR(10),
	@vUserlogin		NVARCHAR(150),
	@vBranchcode	NVARCHAR(10),
	@vUserPwd		NVARCHAR(250),
	@vInputter		NVARCHAR(150)
AS
BEGIN
	
	IF(@CMD='PWD_RESET')BEGIN
		
		UPDATE A SET 
			   A.user_pwd=@vUserPwd
		FROM sys_user_logins AS A WHERE A.branchcode=@vBranchcode AND A.user_login=@vUserlogin

	END
	SELECT @vUserlogin AS TRANCODE
END
GO
/****** Object:  StoredProcedure [dbo].[proc_next_id]    Script Date: 03/01/2022 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_next_id]
	@vbranchcode nvarchar(10),
	@vcolumns	nvarchar(50),
	@vlevels	nvarchar(50),
	@vcode		nvarchar(100) OUTPUT 
AS
BEGIN
	
	declare @vsequence	NVARCHAR(100)
	declare @vtype		NVARCHAR(100)
	declare @vsql		NVARCHAR(250)
	declare @retval		int   
	declare @ParmDefinition nvarchar(500);
	declare @vMinlength	int =4
	declare @vMaxlength	int =8


	set		@vcolumns=UPPER(ISNULL(@vcolumns,''))
	select	@vsql = N'select @retvalOUT = MAX(ISNULL(recordid,0)) from tblrecordid where  branchcode=''' + @vbranchcode+ ''' and convalue='''+ @vcolumns + '''';  
	set		@ParmDefinition = N'@retvalOUT int OUTPUT';
		
	IF NOT EXISTS ( SELECT BRANCHCODE FROM tblrecordid WHERE branchcode=@vbranchcode AND convalue=@vcolumns)BEGIN
		SELECT @vbranchcode AS BranchCode ,@vcolumns AS ConValue,'' AS recordid,@vcolumns AS [Description] INTO #tmpData  
		INSERT INTO tblrecordid (branchcode,convalue,recordid,description) SELECT * FROM #tmpData
	END

	EXEC sp_executesql @vsql, @ParmDefinition, @retvalOUT=@retval OUTPUT;
	SET   @vsequence= @retval+1;
	SET   @vsql = ' UPDATE tblrecordid SET recordid= ' + @vsequence +'  WHERE convalue='''+ @vcolumns + ''' AND branchcode= '''+@vbranchcode+'''' ;  
	Exec (@vsql)

	IF (@vlevels='branchcode')BEGIN
		SET   @vcode = REPLICATE(0,4-LEN(@vsequence)) + @vsequence;
	END ELSE IF (@vlevels='0')BEGIN
		---	0235
		SET   @vcode = REPLICATE(0,@vMinlength-LEN(@vsequence)) + @vsequence;
	END ELSE IF (@vlevels='1')BEGIN
		--- 1010-0234
		SET   @vcode = @vbranchcode+'-'+ REPLICATE(0,@vMinlength-LEN(@vsequence)) + @vsequence;
	END ELSE IF (@vlevels='2')BEGIN
		SET   @vcode = ISNULL(LEFT(@vcolumns,3),'N')+REPLICATE(0,@vMinlength-LEN(@vsequence)) + @vsequence;
	END ELSE IF (@vlevels='3')BEGIN
		SET   @vcode = ISNULL(LEFT(@vcolumns,1),'N')+REPLICATE(0,@vMinlength-LEN(@vsequence)) + @vsequence;
	END ELSE IF (@vlevels='9')BEGIN
		--- 2021115-00000232
		SET   @vcode =RIGHT(Convert(NVARCHAR(10),datepart(yyyy, getdate())),4)+RIGHT(Convert(NVARCHAR(10),datepart(MM, getdate())),2)+RIGHT(Convert(NVARCHAR(10),datepart(DD, getdate())),2)+'-'+ CONVERT(NVARCHAR(100),ISNULL(REPLICATE(0,@vMaxlength-LEN(@vsequence)),'') + @vsequence);
	END
END
GO
/****** Object:  StoredProcedure [dbo].[proc_sql_delete]    Script Date: 03/01/2022 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_sql_delete]
	@CMD			NVARCHAR(20),
	@vIssue_ID		NVARCHAR(100),
	@vBranchcode	NVARCHAR(100),
	@vInputter		NVARCHAR(100)
AS
BEGIN
	DECLARE @vMsg	nvarchar(500)

	IF EXISTS(SELECT A.issue_id FROM tbl_issue_list AS  A WHERE A.branchcode=@vBranchcode AND A.issue_id=@vIssue_ID AND A.[status] IS NOT NULL )BEGIN
		SET @vMsg ='Cannot delete because this record in progress !'
		RAISERROR (@vMsg,16,1);
		RETURN 
	END

	IF (@CMD='D_ISSUE')BEGIN
		DELETE A FROM tbl_issue_list AS  A WHERE A.branchcode=@vBranchcode AND A.issue_id=@vIssue_ID AND A.[status] IS NULL 
	END
	SELECT @vIssue_ID AS TRANCODE
END
GO
/****** Object:  StoredProcedure [dbo].[proc_rpt_lists]    Script Date: 03/01/2022 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_rpt_lists]
	@CMD			NVARCHAR(20),
	@vBranchcode	NVARCHAR(100),
	@vCon1			NVARCHAR(100)=''
AS
BEGIN

	IF (@CMD='RPT_NAME')BEGIN
		SELECT DISTINCT 
		       A.rpt_id,
			   A.rpt_name AS code , 
			   A.rpt_tittle AS NAME
		FROM tbl_reports AS A   
		WHERE A.[disable]='0'
		ORDER BY A.rpt_id
		
	END ELSE IF (@CMD='RPT_MAIN')BEGIN
		SELECT DISTINCT
			  CONVERT(NVARCHAR(200),'%') AS CODE ,
			  CONVERT(NVARCHAR(200),'ALL') AS NAME 
		UNION  ALL
		SELECT A.cat_id AS CODE , 
			   A.cat_name AS NAME 
		FROM tbl_main_categories AS A
		WHERE A.branchcode=@vBranchcode AND 
			  A.[disable]='0'
	END ELSE IF (@CMD='RPT_SUB')BEGIN
		SELECT DISTINCT
			  CONVERT(NVARCHAR(200),'%') AS CODE ,
			  CONVERT(NVARCHAR(200),'ALL') AS NAME 
		UNION  ALL
		SELECT A.sub_id AS CODE , 
			   A.sub_name AS NAME 
		FROM tbl_sub_categories AS A
		inner join tbl_main_categories as b on a.branchcode=b.branchcode and a.cat_id=b.cat_id
		WHERE A.branchcode=@vBranchcode AND 
			  A.[disable]='0' AND 
			  A.cat_id=@vCon1
	END ELSE IF (@CMD='RPT_STATUS')BEGIN
		SELECT DISTINCT
			  CONVERT(NVARCHAR(200),'%') AS CODE ,
			  CONVERT(NVARCHAR(200),'ALL') AS NAME 
		UNION  ALL
		SELECT A.stu_id AS CODE , 
			   A.status AS NAME  
		FROM tbl_status AS A 
		WHERE A.disable='0'
		ORDER BY CODE 
		
	END


END
GO
/****** Object:  StoredProcedure [dbo].[proc_user_logins]    Script Date: 03/01/2022 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[proc_user_logins]
	@VUserlogin		NVARCHAR(100)
AS
BEGIN
	
	SELECT TOP 1 
		  A.user_id,
		  A.branchcode,
		  A.profile_id,
		  B.pro_name,
		  a.expired_at,
		  a.user_pwd,
		  a.user_login
	FROM sys_user_logins AS A 
	inner join tbl_user_profile AS B ON A.profile_id=B.pro_id
	WHERE A.user_login=@VUserlogin


END
GO
/****** Object:  StoredProcedure [dbo].[proc_update_issue]    Script Date: 03/01/2022 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[proc_update_issue]
	@CMD			NVARCHAR(10),
	@vIssue_id		NVARCHAR(10),
	@vBranchcode	NVARCHAR(10),
	@vStatus		NVARCHAR(50),
	@vRespone		NVARCHAR(250),
	@vInputter		NVARCHAR(150)
AS
BEGIN
	DECLARE @vSysDoc	NVARCHAR(50)
	IF(@CMD='Accept')BEGIN
		DELETE FROM tbl_issue_process WHERE branchcode=@vBranchcode AND issue_id=@vIssue_id;
		SET @vStatus = dbo.fun_status_fix('st_code')

		EXEC proc_next_id @vbranchcode,'SYSDONUM','1',@vSysDoc out ;

		INSERT INTO tbl_issue_process (sysdoc,branchcode,issue_id,status,inputter,create_at) 
			   VALUES (@vSysDoc,@vBranchcode,@vIssue_id,@vStatus,@vInputter,GETDATE()) 
			   
			   UPDATE A SET 
				      A.[status]=@vStatus
			   FROM tbl_issue_list AS A WHERE A.branchcode=@vBranchcode AND A.issue_id=@vIssue_id
	END ELSE IF(@CMD='Update')BEGIN

		DELETE FROM tbl_issue_process WHERE branchcode=@vBranchcode AND issue_id=@vIssue_id AND [status]=@vStatus;
		EXEC proc_next_id @vbranchcode,'SYSDONUM','1',@vSysDoc out ;

		INSERT INTO tbl_issue_process (sysdoc,branchcode,issue_id,status,inputter,create_at) 
			   VALUES (@vSysDoc,@vBranchcode,@vIssue_id,@vStatus,@vInputter,GETDATE()) 


		if(dbo.fun_status_fix('cl_code')=@vStatus)BEGIN
			update	A SET 
				   A.respone=@vRespone,
				   A.[status]=@vStatus,
				   A.update_at=GETDATE(),
				   A.closed_at=GETDATE()
			from tbl_issue_list AS A WHERE A.branchcode=@vBranchcode AND A.issue_id=@vIssue_id 
		END ELSE BEGIN
			update A SET 
				   A.respone=@vRespone,
				   A.[status]=@vStatus,
				   A.update_at=GETDATE(),
				   A.closed_at=NULL
			from tbl_issue_list AS A WHERE A.branchcode=@vBranchcode AND A.issue_id=@vIssue_id 
		END 

	END

	SELECT @vIssue_id AS TRANCODE

END
GO
/****** Object:  StoredProcedure [dbo].[proc_sub_main_category]    Script Date: 03/01/2022 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_sub_main_category]
	@CMD			NVARCHAR(10),
	@vSub_id		NVARCHAR(10),
	@vBranchcode	NVARCHAR(10),
	@vName			NVARCHAR(250),
	@vCategory		NVARCHAR(10),
	@vDisable		BIT,
	@vInputter		NVARCHAR(150)
AS
BEGIN
	IF(@CMD='I')BEGIN
		EXEC proc_next_id @vbranchcode,'Sub_Category','3',@vSub_id out ;
		
		INSERT INTO tbl_sub_categories(sub_id,branchcode,sub_name,cat_id,[disable],inputter,create_at)
			   VALUES (@vSub_id,@vBranchcode,@vName,@vCategory,@vDisable,@vInputter,GETDATE())
	END ELSE IF(@CMD='U')BEGIN
		UPDATE A SET 
			   A.sub_name=@vName,
			   A.cat_id=@vCategory,
			   A.[disable]=@vDisable
		FROM tbl_sub_categories AS A
		WHERE A.branchcode=@vBranchcode AND A.sub_id=@vSub_id
	END
	SELECT @vSub_id AS TRANCODE
END
GO
/****** Object:  StoredProcedure [dbo].[proc_sql_excute]    Script Date: 03/01/2022 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_sql_excute]
	@CMD			NVARCHAR(20),
	@vBranchcode	NVARCHAR(100),
	@vCon1			NVARCHAR(100)='',
	@vCon2			NVARCHAR(100)=''
AS
BEGIN
	
	IF (@CMD='USER_EXIT')BEGIN
		SELECT TOP 1 A.user_login FROM sys_user_logins AS A WHERE A.user_login=@vBranchcode
	END ELSE IF (@CMD='Active')BEGIN
		SELECT DISTINCT 
			   A.con_id AS code,
			   A.con_display AS NAME
		FROM sysconstants AS A
		WHERE A.con_line='Active'
		ORDER BY A.con_id DESC 
	END ELSE IF (@CMD='Main_Category')BEGIN
		SELECT DISTINCT 
			   A.cat_id AS code,
			   A.cat_name AS NAME
		FROM tbl_main_categories AS A
		WHERE A.branchcode=@vBranchcode AND A.[disable]=0 
		ORDER BY A.cat_id
	END ELSE IF (@CMD='Sub_Category')BEGIN
		SELECT DISTINCT 
			   A.sub_id AS code,
			   A.sub_name AS NAME
		FROM tbl_sub_categories AS A
		inner join tbl_main_categories AS B ON A.branchcode=B.branchcode AND A.cat_id=B.cat_id
		WHERE A.branchcode=@vBranchcode AND 
			  A.cat_id LIKE @vCon1+'%' AND
			  A.[disable]=0 
		ORDER BY A.sub_id
	END ELSE IF (@CMD='List_Main')BEGIN
		SELECT DISTINCT 
			  A.cat_id,
			  A.cat_name,
			  CASE WHEN A.[disable] = 1 THEN 'Yes' ELSE 'No' END AS [DISABLE],
			  A.inputter
		FROM tbl_main_categories AS A 
		WHERE A.branchcode=@vBranchcode
		ORDER BY A.cat_id
	END ELSE IF (@CMD='List_Sub')BEGIN
		SELECT DISTINCT 
			  A.sub_id,
			  A.sub_name,
			  B.cat_name ,
			  A.cat_id,
			  CASE WHEN A.[disable] = 1 THEN 'Yes' ELSE 'No' END AS [DISABLE],
			  A.inputter
		FROM tbl_sub_categories AS A 
		inner join tbl_main_categories AS B ON A.branchcode=B.branchcode AND A.cat_id=B.cat_id
		WHERE A.branchcode=@vBranchcode
		ORDER BY A.cat_id,A.sub_id
	END ELSE IF (@CMD='View_Main')BEGIN
		SELECT DISTINCT 
			  A.cat_id,
			  A.cat_name,
			  CONVERT(nvarchar(10),A.[disable]) AS [disable],
			  A.inputter
		FROM tbl_main_categories AS A 
		WHERE A.branchcode=@vBranchcode AND A.cat_id=@vCon1
		ORDER BY A.cat_id
	END ELSE IF (@CMD='View_Sub')BEGIN
		SELECT DISTINCT 
			  A.sub_id,
			  A.sub_name,
			  B.cat_name ,
			  A.cat_id,
			  CONVERT(nvarchar(10),A.[disable]) AS [disable],
			  A.inputter
		FROM tbl_sub_categories AS A 
		inner join tbl_main_categories AS B ON A.branchcode=B.branchcode AND A.cat_id=B.cat_id
		WHERE A.branchcode=@vBranchcode AND A.sub_id=@vCon1
		ORDER BY A.cat_id,A.sub_id
	END ELSE IF (@CMD='View_Status')BEGIN
		SELECT DISTINCT 
			   A.stu_id AS code,
			   A.status AS NAME
		FROM tbl_status AS A
		WHERE A.branchcode=@vBranchcode AND 
			  A.[disable]='0'
		ORDER BY A.stu_id
	END ELSE IF (@CMD='V_ISSUE')BEGIN
		SELECT A.issue_id,
			   A.cat_id,
			   A.sub_id,
			   B.cat_name AS Main_category,
			   c.sub_name AS Sub_category,
			   A.issue,
			   A.respone,
			   A.create_at,
			   A.inputter,
			   ISNULL(A.status,'') AS status,
			   ISNULL(A.respone,'') AS respone,
			   CASE WHEN A.[status] IS NOT NULL THEN 'Yes' ELSE 'No' END btnReadOnly
		FROM tbl_issue_list AS A 
		INNER JOIN tbl_main_categories AS B ON A.branchcode=B.branchcode AND A.cat_id=B.cat_id
		INNER JOIN tbl_sub_categories AS C ON A.branchcode=C.branchcode AND  A.cat_id=c.cat_id AND A.sub_id=c.sub_id
		WHERE A.branchcode=@vBranchcode AND A.issue_id=@vCon1
	END ELSE IF (@CMD='V_DRAFT')BEGIN
		SELECT A.dra_id as issue_id,
			   A.cat_id,
			   A.sub_id,
			   B.cat_name AS Main_category,
			   c.sub_name AS Sub_category,
			   A.issue,
			   A.create_at,
			   A.inputter,
			   'No' AS btnReadOnly
		FROM tbl_issue_draft AS A 
		INNER JOIN tbl_main_categories AS B ON A.branchcode=B.branchcode AND A.cat_id=B.cat_id
		INNER JOIN tbl_sub_categories AS C ON A.branchcode=C.branchcode AND  A.cat_id=c.cat_id AND A.sub_id=c.sub_id
		WHERE A.branchcode=@vBranchcode AND A.dra_id=@vCon1
		ORDER BY A.create_at DESC

	END ELSE IF (@CMD='ISSUE_SOLVE')BEGIN
		SELECT A.issue_id,
			   A.cat_id,
			   A.sub_id,
			   B.cat_name AS Main_category,
			   c.sub_name AS Sub_category,
			   A.issue,
			   A.respone,
			   A.create_at,
			   A.inputter,
			   ISNULL(P.inputter,'') AS Responder,
			   P.create_at,
			   DBO.FConvertUnicode(B.cat_name) AS DDDD
		FROM tbl_issue_list AS A 
		INNER JOIN tbl_main_categories AS B ON A.branchcode=B.branchcode AND A.cat_id=B.cat_id
		INNER JOIN tbl_sub_categories AS C ON A.branchcode=C.branchcode AND a.cat_id=c.cat_id AND A.sub_id=c.sub_id
		LEFT JOIN tbl_issue_process AS P ON A.branchcode=P.branchcode AND A.issue_id=P.issue_id AND P.[status]=dbo.fun_status_fix('st_code')
		WHERE A.branchcode=@vBranchcode AND
			  (DBO.FConvertUnicode(B.cat_name) LIKE '%'+ DBO.FConvertUnicode(@vCon1)+'%' OR 
			   A.issue_id LIKE @vCon1+'%' OR 
			   DBO.FConvertUnicode(A.issue) LIKE '%'+ DBO.FConvertUnicode(@vCon1) +'%' ) AND
			  (A.closed_at is null OR CONVERT(DATE,A.closed_at)=CONVERT(DATE,GETDATE()))
		ORDER BY A.create_at DESC
	END ELSE IF (@CMD='LOOK_ISSUE')BEGIN
		SELECT TOP 1
			   A.issue_id 
		FROM tbl_issue_list AS A
		INNER JOIN tbl_issue_process AS B ON A.branchcode=B.branchcode AND A.issue_id=B.issue_id
		WHERE A.branchcode=@vBranchcode AND A.issue_id=@vCon1
	END ELSE IF (@CMD='ISSUE_DRAFT')BEGIN
		SELECT A.dra_id,
			   A.cat_id,
			   A.sub_id,
			   B.cat_name AS Main_category,
			   c.sub_name AS Sub_category,
			   A.issue,
			   A.create_at,
			   A.inputter
		FROM tbl_issue_draft AS A 
		INNER JOIN tbl_main_categories AS B ON A.branchcode=B.branchcode AND A.cat_id=B.cat_id
		INNER JOIN tbl_sub_categories AS C ON A.branchcode=C.branchcode AND a.cat_id=c.cat_id AND A.sub_id=c.sub_id
		WHERE A.branchcode=@vBranchcode AND A.inputter=@vCon1
		ORDER BY A.create_at DESC
	END ELSE IF (@CMD='ISSUE')BEGIN
		SELECT A.issue_id,
			   A.cat_id,
			   A.sub_id,
			   B.cat_name AS Main_category,
			   c.sub_name AS Sub_category,
			   A.issue,
			   A.create_at,
			   A.inputter
		FROM tbl_issue_list AS A 
		INNER JOIN tbl_main_categories AS B ON A.branchcode=B.branchcode AND A.cat_id=B.cat_id
		INNER JOIN tbl_sub_categories AS C ON A.branchcode=C.branchcode AND a.cat_id=c.cat_id AND A.sub_id=c.sub_id
		WHERE A.branchcode=@vBranchcode AND A.closed_at IS NULL 
		ORDER BY A.create_at DESC
	
	END
END
GO
/****** Object:  StoredProcedure [dbo].[proc_register_users]    Script Date: 03/01/2022 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_register_users]
	@CMD			NVARCHAR(10),
	@vUser_id		NVARCHAR(10),
	@vBranchcode	NVARCHAR(10),
	@vFullname		NVARCHAR(250),
	@vGender		NVARCHAR(10),
	@vDOB			DATE,
	@vPlaceDOB		NVARCHAR(250),
	@vAddress		NVARCHAR(250),
	@vPhone			NVARCHAR(50),
	@vEmail			NVARCHAR(50),
	@vIdcard		NVARCHAR(50),
	@vPosition		NVARCHAR(250),
	@vDepartment	NVARCHAR(250),
	@vProfile		NVARCHAR(250),
	@vUserlogin		NVARCHAR(250),
	@vUserPwd		NVARCHAR(250),
	@vInputter		NVARCHAR(250)
AS
BEGIN
	IF (@vBranchcode='' OR @vBranchcode IS NULL)BEGIN
		SET @vBranchcode=(SELECT TOP 1 A.branchcode FROM tblbranch AS A WHERE A.branchcode<>A.subofbranch)
	END

	IF(@CMD='I')BEGIN
		EXEC proc_next_id @vbranchcode,'USER_ID','1',@vUser_id out ;
		
		INSERT INTO tbl_user_info ([user_id],branchcode,[user_name],gender,dob,place_of_birth,[address],phone,email,idcard,position,workplace,create_at) 
								  VALUES (@vUser_id,@vBranchcode,@vFullname,@vGender,@vDOB,@vPlaceDOB,@vAddress,@vPhone,@vEmail,@vIdcard,@vPosition,@vDepartment,GETDATE())
		
		EXEC proc_create_user_logins 'AUTO',@vUser_id,@vBranchcode,@vProfile,@vUserlogin,@vUserPwd,0,@vInputter
	END

	SELECT @vUser_id AS TRANCODE
	 
END
GO
/****** Object:  StoredProcedure [dbo].[proc_issue_ticket]    Script Date: 03/01/2022 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_issue_ticket]
	@CMD			NVARCHAR(10),
	@vIssue_id		NVARCHAR(10),
	@vBranchcode	NVARCHAR(10),
	@vMainCateogry	NVARCHAR(10),
	@vSubCateogry	VARCHAR(10),
	@vDetail		NVARCHAR(250),
	@vInputter		NVARCHAR(50)
AS
BEGIN
	DECLARE @vMsg	nvarchar(500)
	
	IF(@CMD='I')BEGIN

		EXEC proc_next_id @vbranchcode,'ISSUE','0',@vIssue_id out ;
		INSERT INTO tbl_issue_list (issue_id,branchcode,cat_id,sub_id,issue,inputter,create_at) values (@vIssue_id,@vBranchcode,@vMainCateogry,@vSubCateogry,@vDetail,@vInputter,GETDATE())

	END ELSE IF(@CMD='U')BEGIN
	
		IF NOT EXISTS(SELECT TOP 1 A.issue_id FROM tbl_issue_list AS A WHERE A.branchcode=@vBranchcode AND A.issue_id=@vIssue_id AND A.inputter=@vInputter)BEGIN
			SET @vMsg ='Sorry ! only inputter can update .'
			RAISERROR (@vMsg,16,1);
			RETURN 
		END
	
	
		UPDATE A SET 
			   A.cat_id=@vMainCateogry,
			   A.sub_id=@vSubCateogry,
			   A.issue=@vDetail,
			   A.status=NULL
		FROM tbl_issue_list AS A 
		WHERE A.branchcode=@vBranchcode AND A.issue_id=@vIssue_id
	END ELSE IF(@CMD='Draft')BEGIN
		EXEC proc_next_id @vbranchcode,'DRAFT_ISSUE','2',@vIssue_id out ;
		INSERT INTO tbl_issue_draft (dra_id,branchcode,cat_id,sub_id,issue,inputter,create_at) values (@vIssue_id,@vBranchcode,@vMainCateogry,@vSubCateogry,@vDetail,@vInputter,GETDATE())
	END

	SELECT @vIssue_id AS TRANCODE
END
GO
/****** Object:  StoredProcedure [dbo].[proc_create_main_category]    Script Date: 03/01/2022 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[proc_create_main_category]
	@CMD			NVARCHAR(10),
	@vCat_id		NVARCHAR(10),
	@vBranchcode	NVARCHAR(10),
	@vName			NVARCHAR(250),
	@vDisable		BIT,
	@vInputter		NVARCHAR(150)
AS
BEGIN
	IF(@CMD='I')BEGIN
		EXEC proc_next_id @vbranchcode,'Category','3',@vCat_id out ;
		
		INSERT INTO tbl_main_categories (cat_id,branchcode,cat_name,[disable],inputter,create_at)
			   VALUES (@vCat_id,@vBranchcode,@vName,@vDisable,@vInputter,GETDATE())
	END ELSE IF(@CMD='U')BEGIN
		UPDATE A SET 
			   A.cat_name=@vName,
			   A.[disable]=@vDisable
		FROM tbl_main_categories AS A
		WHERE A.branchcode=@vBranchcode AND A.cat_id=@vCat_id
	END
	SELECT @vCat_id AS TRANCODE
END
GO
/****** Object:  StoredProcedure [dbo].[proc_user_logs]    Script Date: 03/01/2022 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[proc_user_logs]
	@vBranchcode	NVARCHAR(10),
	@vAction		NVARCHAR(500),
	@vInputter		NVARCHAR(150)
AS
BEGIN
	DECLARE @vlog_num	NVARCHAR(10)
	EXEC proc_next_id @vbranchcode,'Logs_user','3',@vlog_num out ;
		
	insert into tbl_user_logs (log_num,branchcode,log_detail,log_user,log_at)
		        values (@vlog_num,@vBranchcode,@vAction,@vInputter,GETDATE())
END
GO
