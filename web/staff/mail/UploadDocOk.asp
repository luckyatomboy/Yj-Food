<%@language="VBscript"%>
<%Response.Expires=0%>
<!--#include file="Public/Upload.asp"-->
<!--#include file="Conn.asp"-->
<%
dim upload
set upload=new upload_5xSoft ''建立上传对象

filepath=upload.form("filepath")	'上传文件目录
FolderId=upload.form("FolderId")

set file=upload.file("doc")
if file.filesize>0 then
	pos=instrRev(file.FileName,".")
	if pos=0 then
		file_name=file.FileName
		file_ext=""
	else
		file_name=mid(file.FileName,1,pos-1)
		file_ext =mid(file.FileName,pos+1,len(file.FileName)-1)
	end if

	if file_ext<>".doc" and file_ext<>".xls" and file_ext<>".rar" and file_ext<>".zip" and file_ext<>".jpg" and file_ext<>".gif"  and file_ext<>".ppt"  and file_ext<>".txt" and file_ext<>".DOC" and file_ext<>".XLS" and file_ext<>".RAR" and file_ext<>".ZIP" and file_ext<>".JPG" and file_ext<>".GIF"  and file_ext<>".PPT"  and file_ext<>".TXT" then
		response.write("<script language='javascript'>alert('只允许上传doc,xls,rar,zip,jpg,gif,ppt,txt！');history.back();</script>")
		response.end
	end if


	file_size=file.filesize
	
	'on error resume next
	conn.execute "INSERT INTO Tbl_File(FolderId,FileName,FileExt,FileSize,DeptName,DeptId,EmpName,EmpId) VALUES("&FolderId&",'"&File_Name&"','"&File_Ext&"',"&file_size&",'"&session("DeptName")&"',"&session("DeptId")&",'"&session("EmpName")&"',"&session("EmpId")&")"
	set rs=conn.execute("SELECT TOP 1 FileId FROM Tbl_File ORDER BY FileId DESC")
	FileId=rs("FileId")
	set rs=nothing
	if FileId<>"" then
		file.SaveAs Server.mappath(filepath&FileId&"."&file_ext)
	end if
	conn.execute "UPDATE Tbl_Folder SET FileNum=FileNum+1 WHERE FolderId="&FolderId
	response.write("<script language='javascript'>alert('文件上传成功！请刷新后浏览！');</script>")
end if
set file=nothing
%>