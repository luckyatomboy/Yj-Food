<%response.expires=0%>
<!--#include file="conn.asp"-->

<%
'返回字符串的实际长度
Function strlength(inputstr)
	Dim length,i
	length=0
	For i=1 To len(inputstr)
		If Asc(Mid(inputstr,i,1))<0 Then
			length=length+2
		Else
			length=length+1
		End If
	Next
	strlength=length
End Function

set conn=dbconn("conn")
id=request("id")

if id="" then
id=0
end if	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>企业通迅录</title>
<link rel="stylesheet" type="text/css" href="../css/css.css">
<script language="javascript">
function checkform()
{
	if (document.form1.gsmc.value=="" || document.form1.gsmc.value=="企业名称")
	{
		alert("请输入企业名称！");
		document.form1.gsmc.focus();
		return (false);
	}
	if (document.form1.sf.value=="")
	{
		alert("请选择企业所在省份！");
		document.form1.sf.focus();
		return (false);
	}
	if (document.form1.qylx.value=="")
	{
		alert("请选择所属类别！");
		document.form1.qylx.focus();
		return (false);
	}

	return (true);
}
</script>
<script language="vbscript">
sub checkkey()
    if window.event.keyCode  >57 or window.event.keyCode <48 then 
		if window.event.keyCode<>32 and window.event.keyCode<>45 and window.event.keyCode<>40 and window.event.keyCode<>41 then
			window.event.keyCode=0
		end if
	end if    
end sub
</script>
<script language="JavaScript">
function CheckNum(){
   if((event.keyCode<48||event.keyCode>57)&&event.keyCode!=46) event.returnValue=false; 
   }
//-->
</script>
</head>

<body bgcolor="#ffffff" topmargin="5" leftmargin="5">
<div align="center">
<br><b><font color="black" size="+1">修改企业通迅录</font></b><br><br>
<%
if request.form("submit")=" 提交 " then
	errorinfo=""
	gsmc=request.form("gsmc")
	if strlength(gsmc)>250 then
		errorinfo=errorinfo&"企业名称太长，不能超过250个字符！<br>"
	end if
	if gsmc="" then
		errorinfo=errorinfo&"企业名称不能为空！<br>"
	end if
	lxr=request.form("lxr")
	if strlength(lxr)>50 then
		errorinfo=errorinfo&"姓名太长，不能超过50个字符！<br>"
	end if
	sf=request.form("sf")
	qylx=request.form("qylx")
	dz=request.form("dz")
	if strlength(dz)>180 then
		errorinfo=errorinfo&"企业地址太长，不能超过180个字符！<br>"
	end if
	cp=request.form("cp")
	dh=request.form("dh")
	if strlength("dh")>100 then
		errorinfo=errorinfo&"电话太长，不能超过100个字符！<br>"
	end if
	cz=request.form("cz")
	if strlength("cz")>50 then
		errorinfo=errorinfo&"传真太长，不能超过50个字符！<br>"
	end if
	yb=request.form("yb")
	if strlength("yb")>50 then
		errorinfo=errorinfo&"邮编太长，不能超过50个字符！<br>"
	end if
	dzyj=request.form("dzyj")
	if strlength("dzyj")>80 then
		errorinfo=errorinfo&"Email太长，不能超过80个字符！<br>"
	end if
	bz=request.form("bz")

	xh=request.form("xh")
if xh="" then xh=null
  zw=request.form("zw")
	ld=request.form("ld")
  bmcs=request.form("bmcs")
	zggz=request.form("zggz")
	sjhm=request.form("sjhm")
			

	if errorinfo<>"" then
%>
<div align="center">
<table widht="80%" border="0">
<tr><td>
<center><b><font color="red" size="+1">出错了</font></b></center><br><br>
<font color="#ee0000" size="+1"><%=errorinfo%></font>
<center><input type="button" value="返回" onclick="history.go( -1 );return true;"></center>
</td></tr></table>
</div>
<%
		response.end
		conn.close
		set conn=nothing
	else
		sql="delete * from qiye where id="&id&""
		conn.execute(sql)
		sql="insert into qiye (diqu,companystyle,企业名称,address,postcode,phone,fax,email,contact,production,other,xh,zw,ld,bmcs,zggz,sjhm) values("
		sql=sql&"'"&sf&"','"
		sql=sql&qylx&"','"
		sql=sql&gsmc&"','"
		sql=sql&dz&"','"
		sql=sql&yb&"','"
		sql=sql&dh&"','"
		sql=sql&cz&"','"
		sql=sql&dzyj&"','"
		sql=sql&lxr&"','"
		sql=sql&cp&"','"
		sql=sql&bz&"',"
sql=sql&xh&",'"
sql=sql&zw&"','"
sql=sql&ld&"','"
sql=sql&bmcs&"','"
sql=sql&zggz&"','"		
sql=sql&sjhm&"')"				
		conn.execute(sql)
		response.write("<br><center><font color=""red"">修改企业成功！</font></center><br>")
	end if
end if
%>
<form method="POST" action="editcontent.asp" name="form1" onsubmit="return checkform()">
<input type="hidden" name="id" size="20" style="width: 174; height: 22" class="doc_txt" maxlength="80"   value=<%=id%>>
<%
	set conn=dbconn("conn")
	set rs1=server.createobject("adodb.recordset")
	sql="select * from qiye where id="&id
	rs1.open sql,conn,1
	if not rs1.eof then
%>
  <table width="365" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td width="360" height="200" valign="top">
        <table width="460" border="1" cellspacing="0" cellpadding="0" height="200">
          <tr bordercolor="#000000">
            <td valign="top">
              <div align="right">
                <table border="0" cellpadding="0" cellspacing="0" width="100%" height="75">
                  <tr>
                    <td width="50%" height="34" align="center"><textarea rows="3" name="gsmc" cols="28" class="doc_txt2" style="text-align : center;color:red;font-color:red;font-family:黑体;font-size:16px" maxlength="250"><%=rs1("企业名称")%></textarea></td>
                    <td width="50%" rowspan="2" height="75" align="center" valign="top">
<div align="center">
  <table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td width="25%" valign="middle">
        <p align="right">
<b>详:</b>
        </p>
      </td>
      <td width="75%" valign="middle">
        <p align="center">
        <textarea rows="6" name="cp" cols="20" class="doc_txt2"><%=rs1("production")%></textarea></p>       
      </td>
    </tr>
  </table>
</div>
					</td>
                  </tr>
                  <tr>
                    <td width="100%" height="41" align="center">
<p align="left">&nbsp;<b>姓名：<input type="text" name="lxr" size="10" style="width: 80; height: 22" class="doc_txt" maxlength="50" value=<%=rs1("contact")%>>
	序号：<input type="text" name="xh" size="8" style="width: 80; height: 22" class="doc_txt" maxlength="8" onkeypress="javascript:CheckNum();" value=<%=rs1("xh")%>>
	</b>
					</td>
                  </tr>
                </table>
              </div>
              <div align="right">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                  <tr>
                    <td width="100%" height="25" colspan="2">
                      <hr color="#000000">
                    </td>
                  </tr>
                  <tr>
                    <td width="50%" height="25">
                    &nbsp;<b>省份：<select size="1" name="sf">
					<option value="">请选择</option>
<%
	set rs=server.createobject("adodb.recordset")
	sql="select * from diqu"
	rs.open sql,conn,1
	do while not rs.eof	
		response.write("<option value="&chr(34)&trim(rs("diqu"))&chr(34)&">"&trim(rs("diqu"))&"</option>")
		rs.movenext
	loop
%>					
                    </select></b>
                    </td>
                    <td width="50%" height="25">
                    &nbsp;<b>所属类别：<select size="1" name="qylx">
					<option value="">请选择</option>
<%
	set rs=nothing
	set rs=server.createobject("adodb.recordset")
	sql="select * from fenlei"
	rs.open sql,conn,1
	do while not rs.eof	
		response.write("<option value="&chr(34)&trim(rs("leibie"))&chr(34)&">"&trim(rs("leibie"))&"</option>")
		rs.movenext
	loop
%>
                    </select></b>
                    </td>
                  </tr>
                  <tr>
                    <td width="100%" height="25" colspan="2">
                      <div align="right">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                          <tr>
                            <td width="11%" valign="middle">&nbsp;<b>地址：</b></td>
                            <td width="88%" valign="middle">
                            <input type="text" name="dz" size="20" style="width: 395; height: 22" class="doc_txt" maxlength="180" value=<%=trim(rs1("address"))%>></td>
                          </tr>
                        </table>
                      </div>
					</td>
                  </tr>
                  <tr>
                    <td width="50%" height="25">
                      <div align="right">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                          <tr>
                            <td width="23%" valign="middle">&nbsp;<b>电话：</b></td>
                            <td width="77%" valign="middle">
<input type="text" name="dh" size="20" style="width: 172; height: 22" class="doc_txt" onkeypress="vbscript:checkkey()" maxlength="100" value=<%=rs1("phone")%>>                            
                            </td>
                          </tr>
                        </table>
                      </div>
					</td>
                    <td width="50%" height="25">&nbsp;<b>传真：</b><input type="text" name="cz" size="20" style="width: 177; height: 22" class="doc_txt" onkeypress="vbscript:checkkey()" maxlength="50"  value=<%=rs1("fax")%>>
					</td>
                  </tr>
                  <tr>
                    <td width="50%" height="25">
                      <div align="right">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                          <tr>
                            <td width="23%" valign="middle">&nbsp;<b>Email：</b></td>
                            <td width="77%" valign="middle">
<input type="text" name="dzyj" size="20" style="width: 174; height: 22" class="doc_txt" maxlength="80"   value=<%=rs1("email")%>>
                            </td>
                          </tr>
                        </table>
                      </div>
					</td>
                    <td width="50%" height="25">&nbsp;<b>邮编：</b><input type="text" name="yb" size="20" style="width: 177; height: 22" class="doc_txt" onkeypress="vbscript:checkkey()" maxlength="50"  value=<%=rs1("postcode")%>></td>
                  </tr>
                  <tr>
                    <td width="50%" height="25">&nbsp;<b>职务：</b><input type="text" name="zw" size="20" style="width: 177; height: 22" class="doc_txt"  maxlength="50"  value=<%=rs1("zw")%>></td>

                    <td width="50%" height="25">&nbsp;<b>路电：</b><input type="text" name="ld" size="20" style="width: 177; height: 22" class="doc_txt"  maxlength="50" value=<%=rs1("ld")%>></td>
                  </tr>
                  <tr>
                     <td width="50%" height="25">&nbsp;<b>部门与处室：</b><input type="text" name="bmcs" size="20" style="width: 137; height: 22" class="doc_txt"  maxlength="50" value=<%=rs1("bmcs")%>></td>

                    <td width="50%" height="25">&nbsp;<b>主管工作：</b><input type="text" name="zggz" size="20" style="width: 137; height: 22" class="doc_txt"  maxlength="50" value=<%=rs1("zggz")%>></td>
                  </tr>
                  <tr>             	

                  <td width="50%" height="25">&nbsp;<b>手机号码：</b><input type="text" name="sjhm" size="20" style="width: 137; height: 22" class="doc_txt"  maxlength="50" value=<%=rs1("sjhm")%>></td>
                  </tr>
                  <tr>
                  	
                  	
                    <td width="100%" height="25" colspan="2">
<div align="right">
  <table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td width="11%" valign="middle">&nbsp;<b>备注：</b></td>
      <td width="89%" valign="middle">
<textarea rows="4" name="bz" cols="54" class="doc_txt2"> <%=rs1("other")%></textarea>					
      </td>
    </tr>










  
  </table>
</div>
					</td>
                  </tr>
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
      <td width="5" valign="top" bgcolor="#E0E0E0"><img src="images/dot.gif" width="6" height="10"></td>
    </tr>
    <tr> 
      <td colspan="2" height="5" bgcolor="#E0E0E0"><img src="images/dot.gif" width="10" height="6"></td>
    </tr>
  </table>
<br>
<input type="submit" value=" 提交 " name="submit">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value=" 重填 " onclick="javascript:window.close();">
</div>
<%end if
set rs1=nothing
%>

</form>
</body>
</html>
