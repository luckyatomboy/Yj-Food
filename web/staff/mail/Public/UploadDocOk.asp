<%@language="VBscript"%>
<%Response.Expires=0%>
<!--#include file="Upload.asp"-->
<%
dim upload
set upload=new upload_5xSoft ''建立上传对象

filepath="../Doc/"	'上传文件目录
formname=upload.form("formname")
textname=upload.form("textname")

set file=upload.file("doc")

if file.filesize>0 then
	Randomize
	n = cstr(int(99*rnd+1))
	file_name=year(now) & right("0"&month(now),2) & right("0"&day(now),2) & right("0"&hour(now),2) & right("0"&minute(now),2) & right("0"&second(now),2) & right("0"&n,2)
	file_ext=right(file.FileName,4)
	if file_ext<>".doc" and file_ext<>".xls" and file_ext<>".rar" and file_ext<>".zip" and file_ext<>".jpg" and file_ext<>".gif"  and file_ext<>".ppt"  and file_ext<>".txt" and file_ext<>".DOC" and file_ext<>".XLS" and file_ext<>".RAR" and file_ext<>".ZIP" and file_ext<>".JPG" and file_ext<>".GIF"  and file_ext<>".PPT"  and file_ext<>".TXT" then
		response.write("<script language='javascript'>alert('只允许上传doc,xls,rar,zip,jpg,gif,ppt,txt！');history.back();</script>")
		response.end
	end if
	filename=file_name & file_ext
	'response.write  Server.mappath(filepath&filename)
	file.SaveAs Server.mappath(filepath&filename)
	response.write("<script language='javascript'>parent.document."&formname&"."&textname&".value='"&filename&"';</script>")
end if
set file=nothing
%>