<%@language="VBscript"%>
<%Response.Expires=0%>
<!--#include file="../include/checkadmin.asp"-->
<!--#include file="../include/conn.asp"-->
<script language="javascript">
	function OpenHTMLEditor(){
		window.open('./htmleditor/editor.html','','width=768,height=500,top=10,left=10');
	}
	function OpenHTMLPreview(){
		srcstr=document.all.content.value
		srcstr=srcstr.replace("[HTML]","");
		srcstr=srcstr.replace("[/HTML]","");
		PreviewPage=window.open('','_blank','');
		PreviewPage.document.write(srcstr);
	}
</script>
<%
id=request.form("id")
if id="" or isnull(id) then
	response.wirte("<p align=center>该信息不存在或者已经被删除，请<a href='javascript:history.back();'>返回</a>！</p>")
	response.end
end if
set rs=server.createobject("adodb.recordset")
rs.open "select * from tbl_news where id in ("&id&") order by id desc",conn,3,1
if rs.eof then
	response.wirte("<p align=center>该信息不存在或者已经被删除，请<a href='javascript:history.back();'>返回</a>！</p>")
	response.end
end if

'back
keyword=request.form("keyword")
days=request.form("days")
intPage=request.form("intPage")

editrecordnum=rs.recordcount
editpage=request.form("editpage")
if editpage="" or isnull(editpage) or not isnumeric(editpage) then editpage=1
editpage=cint(editpage)
rs.pagesize=1
editpagecount=rs.pagecount
rs.absolutePage=editpage
%>
<style>
	td{font-size:13px;}
</style>
<script language="javascript">
	function doSubmit(){
		var obj=document.frmedit;

		if(obj.columnid.value==""){
			alert("请选择目录！");
			obj.columnid.focus();
			return false;
		}

		if(obj.title.value==""){
			alert("标题不能为空！");
			obj.title.focus();
			return false;
		}

		if(obj.content.value==""){
			alert("内容不能为空！");
			obj.content.focus();
			return false;
		}

		if(obj.imgname.value!=""){
			var filename;
			var fileext;
			filename=obj.imgname.value;
			fileext=filename.substr(filename.length-3,3);
			fileext=fileext.toUpperCase();
			if ((fileext != "GIF") && (fileext != "JPG")){                  
                  alert("图片格式不正确，请选择GIF或JPG图片！");
                  return false;
			}
		}
	}
</script>

<table border="0" cellspacing="1" width="700" >
  <tr>
    <td height="23" align="center"background="../../images/r_1.gif"><font style="font-size:13px;" ><b>维护新闻</b></font></td>
  </tr>
  <%if editpagecount>1 then%>
  <!--item list start-->
  <form name="frmitem" method="post">
  <input type="hidden" name="id" value="<%=id%>">
  <input type="hidden" name="intPage" value="<%=intPage%>">
  <input type="hidden" name="keyword" value="<%=keyword%>">
  <input type="hidden" name="days" value="<%=days%>">
  <tr bgcolor="#FFFFFF">
    <td height="23" align="center"><!--#include file="../include/showitem.asp"--></td>
  </tr>
  </form>
  <!--item list end-->
  <%end if%>
  <!--edit start-->
  <form name="frmedit" enctype="multipart/form-data" method="post" action="edit_news_ok.asp" onsubmit="javascript:return doSubmit();">
  <input type="hidden" name="action" value="edit">
  <input type="hidden" name="id" value="<%=id%>">
  <input type="hidden" name="editid" value="<%=rs("id")%>">
  <input type="hidden" name="keyword" value="<%=keyword%>">
  <input type="hidden" name="days" value="<%=days%>">
  <input type="hidden" name="intPage" value="<%=intPage%>">
  <input type="hidden" name="editpage" value="<%=editpage%>">
  <tr>
    <td height="23" bgcolor="#FFFFFF">
	<br>
	<table align="center" border="0" width="96%">
	  <tr>
		<td height="26">目录</td>
		<td>
		<select name="columnid">
		<option value=""></option>
		<%
		set rs_root=conn.execute("select columnid,columnname from tbl_news_column where columnparentid=0 order by columnid desc")
		do while not rs_root.eof
			if rs("columnid")=rs_root("columnid") then
				response.write("<option selected value="&rs_root("columnid")&">⊙"&rs_root("columnname")&"</option>")
			else
				response.write("<option value="&rs_root("columnid")&">⊙"&rs_root("columnname")&"</option>")
			end if
			set rs_child=conn.execute("select columnid,columnname from tbl_news_column where columnparentid="&rs_root("columnid")&" order by columnid desc")
			do while not rs_child.eof
				if rs("columnid")=rs_child("columnid") then
					response.write("<option selected value="&rs_child("columnid")&"> ├─"&rs_child("columnname")&"</option>")
				else
					response.write("<option value="&rs_child("columnid")&"> ├─"&rs_child("columnname")&"</option>")
				end if
				rs_child.movenext
			loop
			rs_root.movenext
		loop
		set rs_root=nothing
		%>
		</select>
		</td>
	  </tr>
	  <tr>
		<td height="26">标题</td>
		<td><input type="text" name="title" value="<%=rs("title")%>" style="width:480px;"></td>
	  </tr>
	  <tr>
		<td colspan="2" height="8"></td>
	  </tr>
	  <tr>
		<td colspan="2" align="center">
		<%if rs("imgname")<>"" then%>
		<img height="100" src="../newsimgages/<%=rs("imgname")%>">
		<%end if%>
		</td>
	  </tr>
	  <tr>
		<td height="26">图片</td>
		<td><input type="file" name="imgname" style="width:480px;"></td>
	  </tr>
	  <tr style="display:none;">
		<td height="26">图片位置</td>
		<td>		
		<select name="imgposition">
		<option value="0" <%if rs("imgposition")="0" then response.write("selected")%>>默认位置</option>
		<option value="1" <%if rs("imgposition")="1" then response.write("selected")%>>上</option>
		<option value="2" <%if rs("imgposition")="2" then response.write("selected")%>>中</option>
		<option value="3" <%if rs("imgposition")="3" then response.write("selected")%>>下</option>
		</select>
		</td>
	  </tr>
	  <tr>
		<td height="26">图片链接</td>
		<td><input type="text" name="imgurl" style="width:410px;" value="<%=rs("imgurl")%>"></td>
	  </tr>
	  <tr>
		<td colspan="2" height="8"></td>
	  </tr>
	  <tr>
		<td height="26">标记</td>
		<td>
		<input type="checkbox" name="index" <%if rs("index")="1" then response.write("checked")%> value="1">首页新闻
		<input type="checkbox" name="important" <%if rs("important")="1" then response.write("checked")%> value="1">重点新闻
		</td>
	  </tr>
	  <tr>
		<td height="26" valign="top">内容</td>
		<td>

<textarea rows="15" name="content" style="display:none"><%=rs("content")%></textarea>
              <iframe ID="content" src="../../rededit/ewebeditor.htm?id=content&style=coolblue" frameborder="0" scrolling="no" width="550" HEIGHT="350"></iframe> 			
			
</td>
	  </tr>
	</table>
	<br>
	</td>
  </tr>
  <tr>
    <td height="23" colspan="2" align="center">
	<input type="submit" name="btnSubmit" value="确定" style="width:60px;">
	<input type="reset" name="btnReset" value="取消" style="width:60px;">
	<input type="button" name="btnBack" value="返回" onclick="javascript:doBack();" style="width:60px;">
	</td>
  </tr>
  </form>
</table>
<!--back-->
<form name="frmback" method="post" action="list_news.asp">
<input type="hidden" name="keyword" value="<%=keyword%>">
<input type="hidden" name="days" value="<%=days%>">
<input type="hidden" name="intPage" value="<%=intPage%>">
</form>
<script language="javascript">
	function doBack(){
		document.frmback.submit();
	}
</script>