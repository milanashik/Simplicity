# Simplicity
Latest 10 visitor information on the site.

## Technology used:
ASP.NET

SQL Server 2012

Bootstrap

Enterprise Library 6.0

Visual Studio

SQL Server Management Studio

Check the script.sql file. Run the script file to create database. There are two storedprocedure to insert and fetch visitors record.
```
/****** Object:  StoredProcedure [dbo].[SP_VisitorList_Select]    Script Date: 11/27/2019 7:51:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[SP_VisitorList_Select]
as
Begin
Select top 10
ipAddress, dateTime
from
tb_visitorInfo
order by
dateTime desc
end
GO
```
```
/****** Object:  StoredProcedure [dbo].[SP_VistorInfo_INSERT]    Script Date: 11/27/2019 7:51:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[SP_VistorInfo_INSERT]
@ipAddress nvarchar(50),
@dateTime smalldatetime
as
Begin
Insert into tb_visitorInfo
values(@ipAddress,@dateTime)
End
GO
```
The folder 'Simplicity' has the codes.

'CAPTURE.PNG' is the screenshot of the default page.

## Code to check
Default.aspx

Default.aspx.cs

DAL > VisiorDAL.cs

Model > VisitorDetails.cs

