<%@language="VBscript"%>
<%Response.Expires=0%>
<!--#include file="../include/checkadmin.asp"-->
<!--#include file="../include/conn.asp"-->
<style>
	td{font-size:13px;}
</style>
<script language="javascript">
	//修改
	function doEdit(){
		if(checkedNum()>0){
			document.frmlist.action="edit_news.asp";
			document.frmlist.submit();
		}else{
			alert("请选择您要修改的新闻！");
		}
	}
	//删除
	function doDelete(){
		if(checkedNum()>0){
			if(confirm("确定要删除所选择的新闻吗？\n注意：删除后不能恢复！")){
				document.frmlist.action="delete_news.asp";
				document.frmlist.submit();
			}
		}else{
			alert("请选择您要删除的新闻！");
		}
	}
	//选择
	function doSelect(){
		if(document.frmlist.btnSelect.value=="全选"){
			for(var i=0;i<document.frmlist.id.length;i++)
				document.frmlist.id[i].checked=true;
			
			document.frmlist.btnSelect.value="取消";
			//document.frmlist.checkall.checked=true;
		}else{
			for(var i=0;i<document.frmlist.id.length;i++)
				document.frmlist.id[i].checked=false;
			document.frmlist.btnSelect.value="全选";
			//document.frmlist.checkall.checked=false;
		}
	}
	//全选
	function doCheckall(){
		if(document.frmlist.id[0].checked){
			for(var i=0;i<document.frmlist.id.length;i++)
				document.frmlist.id[i].checked=true;
			
			document.frmlist.btnSelect.value="取消";
		}else{
			for(var i=0;i<document.frmlist.id.length;i++)
				document.frmlist.id[i].checked=false;
			document.frmlist.btnSelect.value="全选";
		}
	}
	//数目
	function checkedNum(){
		var num=0;
		for(var i=0;i<document.frmlist.id.length;i++){
			if(document.frmlist.id[i].checked)
				num++;
		}
		return num;
	}
</script>
<%
keyword=request.form("keyword")
days=request.form("days")
columnid=request.form("columnid")
if columnid="" or isnull(columnid) or not isnumeric(columnid) then
	columnid=0
else
	columnid=cint(columnid)
end if

if days="" or isnull(days) or not isnumeric(days) then days="0"
if keyword<>"" then search_string = search_string & " and (title like '%"&keyword&"%' or content like '%"&keyword&"%')"
if days<>"" and days<>"0" then search_string = search_string & " and datediff('d',regdate,now())<"&days
if columnid<>0 then search_string = search_string & " and columnid="&columnid
%>
<table border="0" cellspacing="1" width="600" >
  <tr>
    <td height="23"><img src="images/spacer.gif" width="10" height="1"><font style="font-size:13px;" ><b>浏览新闻</b></font></td>
  </tr>
  <tr>
    <td height="23" bgcolor="#FFFFFF">
	<!--search-->
	<br>
	<div align="center">
	<form name="frmsearch" method="post">
	关键字：
	<input type="text" name="keyword" value="<%=keyword%>">
	<select name="columnid">
	<option value="0">所有目录</option>
	<%
		set rs_root=conn.execute("select columnid,columnname from tbl_news_column where columnparentid=0 order by columnid desc")
		do while not rs_root.eof
			if columnid=rs_root("columnid") then
				response.write("<option selected value="&rs_root("columnid")&">⊙"&rs_root("columnname")&"</option>")
			else
				response.write("<option value="&rs_root("columnid")&">⊙"&rs_root("columnname")&"</option>")
			end if
			set rs_child=conn.execute("select columnid,columnname from tbl_news_column where columnparentid="&rs_root("columnid")&" order by columnid desc")
			do while not rs_child.eof
				if columnid=rs_child("columnid") then
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
	<select name="days">
	<option value="0" <%if days="0" then response.write("selected")%>>所有</option>
	<option value="1" <%if days="1" then response.write("selected")%>>今天</option>
	<option value="10" <%if days="10" then response.write("selected")%>>近10天</option>
	<option value="20" <%if days="20" then response.write("selected")%>>近20天</option>
	<option value="30" <%if days="30" then response.write("selected")%>>近30天</option>
	</select>
	<input type="submit" name="btnSubmit" value="搜索" style="width:60px;">
	</form>
	</div>

	<!--list-->
	<table align="center" border="0" width="96%" cellpadding="1" cellspacing="1" bgcolor="#D6DFF7">
	  <form name="frmlist" method="post">
	  <tr bgcolor="#FFFFFF" align="center">
		<td><b>标题</b></td>
		<td width="60"><b>点击数</b></td>
		<td width="80"><b>发布日期</b></td>

	  </tr>
	  <%
	  dim sqlstr
	  dim intPage,intRecordcount,intPagecount,itotalpage

	  intPage=request.form("intPage")
	  if intPage="" or isnull(intPage) or not isnumeric(intPage) then intPage=1
	  intPage=cint(intPage)

	  sqlstr="select id,title,imgname,hits,regdate,index,important from tbl_news order by id desc"
	  if search_string<>"" then
		sqlstr="select id,title,imgname,hits,regdate,index,important from tbl_news where 1<>0 "&search_string&" order by id desc"
	  end if

	  set rs=server.createobject("adodb.recordset")
	  rs.open sqlstr,conn,3,1
	  intRecordcount=rs.recordcount
	  if intRecordcount>0 then
		  rs.pagesize=8
		  intPagecount=rs.pagecount
		  if intPage>intPagecount or intPage<1 then intPage=1
		  rs.absolutePage=intPage
		  for i=1 to rs.pagesize
	  %>
	  <tr bgcolor="#FFFFFF" align="center">
	
		<td align="left">
		<a href="../docc/news_detail.asp?id=<%=rs("id")%>"><%=rs("title")%></a>
		<%if rs("imgname")<>"" then response.write("（图）")%>
		</td>
		<td><%=rs("hits")%></td>
		<td><%=formatdatetime(rs("regdate"),2)%></td>

	  </tr>
	  <%
			rs.movenext
			if rs.eof then exit for
		  next
	  end if
	  %>
	  <tr bgcolor="#FFFFFF">
		<td colspan="7" align="center" height="60">

		</td>
	  </tr>
	  <input type="hidden" name="intPage" value="<%=intPage%>">
	  <input type="hidden" name="keyword" value="<%=keyword%>">
	  <input type="hidden" name="days" value="<%=days%>">
	  <input type="hidden" name="columnid" value="<%=columnid%>">
	  </form>
	</table>
	<br>
	</td>
  </tr>
  <!--showpage-->
  <form name="frmpage" method="post">
  <input type="hidden" name="keyword" value="<%=keyword%>">
  <input type="hidden" name="days" value="<%=days%>">
  <input type="hidden" name="columnid" value="<%=columnid%>">
  <tr>
    <td colspan="2" height="23" align="center">
	<!--#include file="../include/showpage.asp"-->
	</td>
  </tr>
  </form>
</table>
