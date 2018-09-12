<%response.expires=0%>
<!--#include file="conn.asp"-->
<script src="openwin.js"></script>
<%

typenumber=request("typenumber")
lookstr=request("lookstr")
if typenumber<>"" and lookstr<>"" then
	sql=""
	select case typenumber
		case "1"
			sql="select * from qiye where diqu='"&lookstr&"' order by xh,id desc"
		case "2"
			sql="select * from qiye where companystyle='"&lookstr&"' order by xh,id desc"
		case "3"
			if request.form("submit")=" 查询 " then
				dim conditionflag,sums
				dim sqlstr(9)
				sums=0
				conditionflag=false
				for i=1 to 9
					sqlstr(i)=""
				next
				for i=1 to 7
					findstr=request.form("C"&cstr(i))
					if findstr="ON" then
						select case i
							case 1
								fieldname="企业名称"
							case 2
								fieldname="contact"
							case 3
								fieldname="production"
							case 4
								fieldname="address"
							case 5
								fieldname="phone"
							case 6
								fieldname="fax"
							case 7
								fieldname="postcode"
						end select
						sqlstr(i)=fieldname&" like '%"&request.form("T"&cstr(i))&"%'"
						sums=sums+1
						conditionflag=true
					end if
				next
				if request.form("C8")="ON" and request.form("D1")<>"" then
					conditionflag=true
					sqlstr(8)="diqu='"&request.form("D1")&"'"
					sums=sums+1
				end if
				if request.form("C9")="ON" and request.form("D2")<>"" then
					conditionflag=true
					sqlstr(9)="companystyle='"&request.form("D2")&"'"
					sums=sums+1
				end if
				if conditionflag then
					sql="select * from qiye where "
					for i=1 to 9
						if sums=1 and sqlstr(i)<>"" then
							sql=sql&sqlstr(i)
						elseif sqlstr(i)<>"" then
							if i=1 then
								sql=sql&sqlstr(i)
							elseif sql<>"select * from qiye where " then
								sql=sql&" and "&sqlstr(i)
							else
								sql=sql&sqlstr(i)
							end if
						end if
					next
					response.cookies("findcondiction")=sql
				end if
			else
				sql=request.cookies("findcondiction")
			end if
	end select
	if sql="" then
		response.write("<script language=""javascript"">")
		response.write("alert(""请至少选择一个条件！"");")
		response.write("history.go(-1);")
		response.write("</script>")
		response.end
	elseif sql<>"" then
		set conn=dbconn("conn")
		set rs=server.createobject("adodb.recordset")
		rs.open sql,conn,1
%>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><%=lookstr%>企业通迅录</title>


<link rel="stylesheet" type="text/css" href="../css/css.css">
<link href="../style/style.css" rel="stylesheet" type="text/css">
<style>
body {
	background-color:#FFFFFF;
}
</style>
<script language="vbscript">
sub checkkey()
    if window.event.keyCode  >57 or window.event.keyCode <48  then 
		window.event.keyCode=0
	end if    
end sub
</script>
</head>
<body bgcolor="#ffffff" topmargin="5" leftmargin="5">
<br>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;通迅录</td>
	  <td align="right">&nbsp;</td>
    
    </tr>
  </table>
  </table>

</font></b>
<%
		if rs.eof and rs.bof then
			response.write("<br><br><center><font color=""red"" size=""+1"">对不起，该类别中没有通迅录！</font></center>")
			conn.close
			set rs=nothing
			set conn=nothing
		else
			rs.pagesize     = 10
			maxpages        = rs.pagecount
			if maxpages=0 then
				maxpages=1
			end if
			pagenumber=request("page")
			if pagenumber="" then
				page=1
			elseif not isnumeric(pagenumber) then
				page=1
			else
				page=clng(pagenumber)
			end if
			if page<=0 then
				page=1
			elseif page>maxpages then
				page=maxpages
			end if
			rs.absolutepage = page
			total           = rs.recordcount
%>
<div align="center">
  <center>
  <table border="0" cellpadding="0" cellspacing="0" width="450" height="40">
    <tr>
      <td>
<%
	if maxpages>1  then
		response.write("<a href=""dispinfo.asp?typenumber="&typenumber&"&lookstr="&lookstr&"&page=1"">首&nbsp;&nbsp页</a>&nbsp;&nbsp;&nbsp;")
		response.write("<a href=""dispinfo.asp?typenumber="&typenumber&"&lookstr="&lookstr&"&page="&page-1&chr(34)&">上一页</a>&nbsp;&nbsp;&nbsp;")
		response.write("<a href=""dispinfo.asp?typenumber="&typenumber&"&lookstr="&lookstr&"&page="&page+1&chr(34)&">下一页</a>&nbsp;&nbsp;&nbsp;")
		response.write("<a href=""dispinfo.asp?typenumber="&typenumber&"&lookstr="&lookstr&"&page="&maxpages&chr(34)&">尾&nbsp;&nbsp页</a>&nbsp;&nbsp;&nbsp;")
	end if
%>共<font color="blue"><%=total%></font>条记录&nbsp;&nbsp;页码：<font color="blue"><%=page%></font>/<font color="blue"><%=maxpages%></font>&nbsp;&nbsp;第<input type="text" name="T1" size="20" style="width: 26; height: 22" class="doc_txt" onkeypress="vbscript:checkkey()">页<input type="button" value="Go" name="B3" onclick="javascript:location.href='dispinfo.asp?typenumber=<%=typenumber%>&lookstr=<%=lookstr%>&page='+T1.value">
</td>
    </tr>
  </table>
  </center>
</div>
<div align="center">
  <center>
  <table border="1" cellpadding="0" cellspacing="0" width="650" bordercolorlight="#C0C0C0" bordercolordark="#FFFFFF">
    <tr>
      <td align="center" height="25" bgcolor="#EFEFEF" width="446">单位</font></a></td>
      <td align="center" height="8" bgcolor="#EFEFEF" width="446">姓名</font></a></td>
      <td align="center" height="25" bgcolor="#EFEFEF" width="446">部门与处室</font></a></td>
      <td align="center" height="15" bgcolor="#EFEFEF" width="446">职务</font></a></td>
      <td align="center" height="10" bgcolor="#EFEFEF" width="446">电话</font></a></td>
      <td align="center" height="10" bgcolor="#EFEFEF" width="446">手机</font></a></td>      	      	      	      	      	      	      	
      <td align="center" height="10" bgcolor="#EFEFEF" width="446">Email</font></a></td>      	      	      	      	      	      	      	
    </tr>
    <tr>

<%
	if total>0 then
		for ipage=1 to rs.pagesize
%>
<td   bgcolor="#EFEFEF" width="446"><a href="#" onclick ="javascript:openwinfun('dispcontent2.asp?id=<%=cstr(rs("id"))%>&printflag=0','qymlwin',400,550);"><%=trim(rs("companystyle"))%></a></td>
<td   bgcolor="#EFEFEF" width="446"><a href="#" onclick ="javascript:openwinfun('dispcontent2.asp?id=<%=cstr(rs("id"))%>&printflag=0','qymlwin',400,550);"><font color="red"><%=trim(rs("contact"))%></font></a></td>
<td   bgcolor="#EFEFEF" width="446">	<%=trim(rs("bmcs"))%>&nbsp;</td>
<td   bgcolor="#EFEFEF" width="446">	<%=trim(rs("zw"))%>&nbsp;</td>
<td   bgcolor="#EFEFEF" width="446">	<%=trim(rs("phone"))%>&nbsp;</td>
<td   bgcolor="#EFEFEF" width="446">	<%=trim(rs("sjhm"))%>&nbsp;</td>
<td   bgcolor="#EFEFEF" width="446">	<%=trim(rs("email"))%>&nbsp;</td>
    </tr>
  </center>
</div>

<%
			rs.movenext
			if rs.eof then exit for
		next
	end if
%>
  </table>

<div align="center">
  <table border="0" cellpadding="0" cellspacing="0" width="450" height="40">
    <tr>
      <td>
<%
	if maxpages>1  then
		response.write("<a href=""dispinfo.asp?typenumber="&typenumber&"&lookstr="&lookstr&"&page=1"">首&nbsp;&nbsp页</a>&nbsp;&nbsp;&nbsp;")
		response.write("<a href=""dispinfo.asp?typenumber="&typenumber&"&lookstr="&lookstr&"&page="&page-1&chr(34)&">上一页</a>&nbsp;&nbsp;&nbsp;")
		response.write("<a href=""dispinfo.asp?typenumber="&typenumber&"&lookstr="&lookstr&"&page="&page+1&chr(34)&">下一页</a>&nbsp;&nbsp;&nbsp;")
		response.write("<a href=""dispinfo.asp?typenumber="&typenumber&"&lookstr="&lookstr&"&page="&maxpages&chr(34)&">尾&nbsp;&nbsp页</a>&nbsp;&nbsp;&nbsp;")
	end if
%>共<font color="blue"><%=total%></font>条记录&nbsp;&nbsp;页码：<font color="blue"><%=page%></font>/<font color="blue"><%=maxpages%></font>&nbsp;&nbsp;第<input type="text" name="T2" size="20" style="width: 26; height: 22" class="doc_txt" onkeypress="vbscript:checkkey()">页<input type="button" value="Go" name="B3" onclick="javascript:location.href='dispinfo.asp?typenumber=<%=typenumber%>&lookstr=<%=lookstr%>&page='+T2.value">
</td>
    </tr>
  </table>
</div>
</body>
</html>
<%
			conn.close
			set rs=nothing
			set conn=nothing
		end if
	end if
else
	
end if
%>
