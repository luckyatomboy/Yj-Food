<%@language="VBscript"%>
<%Response.Expires=0%>
<!--#include file="../include/checkadmin.asp"-->
<!--#include file="../include/upload.asp"-->
<!--#include file="../include/conn.asp"-->
<%
dim upload,file,sfilename,bfilename,formName,sPath,bPath,iCount
set upload=new upload_5xSoft ''建立上传对象

imgpath="../newsimgages/"	'图片路径
ver="cn"

action = upload.form("action") '编辑类型
if action = "edit" then
	editid=upload.form("editid")

	columnid=upload.form("columnid")
	title = replace(upload.form("title"),"'","''")
	content = replace(upload.form("content"),"'","''")
	index = upload.form("index")
	if index<>"1" then index="0"
	important = upload.form("important")
	if important<>"1" then important="0"

	imgposition = upload.form("imgposition")
	imgurl = upload.form("imgurl")

	conn.execute "update tbl_news set columnid="&columnid&", title='"&title&"',index='"&index&"',important='"&important&"',content='"&content&"',imgposition='"&imgposition&"',imgurl='"&imgurl&"' where id="&editid

	'上传图片
	set file=upload.file("imgname")
	if file.FileSize>0 then
		imgname=ver & "_" & editid & right(file.FileName,4)
		file.SaveAs Server.mappath(imgpath&imgname)
		conn.execute "update tbl_news set imgname='"&imgname&"' where id="&editid
	end if
	set file=nothing
end if
%>
<form name="frmback" method="post" action="edit_news.asp">
<input type="hidden" name="keyword" value="<%=upload.form("keyword")%>">
<input type="hidden" name="days" value="<%=upload.form("days")%>">
<input type="hidden" name="id" value="<%=upload.form("id")%>">
<input type="hidden" name="editpage" value="<%=upload.form("editpage")%>">
<input type="hidden" name="intPage" value="<%=upload.form("intPage")%>">
</form>
<script language="javascript">
	document.frmback.submit();
</script>