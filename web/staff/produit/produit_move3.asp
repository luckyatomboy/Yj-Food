<%
if session("redboy_username")="" then
%>
<script language="javascript">
top.location.href="../index.asp"
</script>
<%  
  response.end
end if
%>
<!-- #include file="../conn2.asp" -->
<!-- #include file="../const.asp" -->
<html>
<head>
<title><%=dianming%> - 库存盘点</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../style/style.css" rel="stylesheet" type="text/css">
<style>
body {
	background-color:#FFFFFF;
}
</style>
</HEAD>

<BODY>
<%
if fla15="0" and session("redboy_id")<>"1" then
%>
<br><center><img src="../images/note.gif" align="absmiddle">&nbsp;<font color="#FF0000">你不具备此权限，请与管理员联系！</font></center>
<%  
  response.end
end if
%>
<%if request("hid")="" then%> 
<%
sql="select * from produit where id="&request("id")
set rs=conn.execute(sql)
%>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;库存盘点</td>
	  <td align="right">&nbsp;</td>
    </tr>
  </table>
</td>
<td><img src="../images/r_2.gif" alt="" /></td>
</tr>
<tr>
<td></td>
<td>
<table align="center" cellpadding="4" cellspacing="1" class="toptable grid" border="1">
      <form name="form3">
        <input type="hidden" name="id" value="<%=request("id")%>">
        <input type="hidden" name="page" value="<%=request("page")%>">
        <input type="hidden" name="ku" value="<%=request("ku")%>">
        <input type="hidden" name="bigclass" value="<%=request("bigclass")%>">
        <input type="hidden" name="smallclass" value="<%=request("smallclass")%>">
        <input type="hidden" name="keyword" value="<%=request("keyword")%>">
		<input type="hidden" name="order1" value="<%=request("order1")%>">
	    <input type="hidden" name="order2" value="<%=request("order2")%>">
	    <input type="hidden" name="order3" value="<%=request("order3")%>">
	    <input type="hidden" name="order4" value="<%=request("order4")%>">
	    <input type="hidden" name="order5" value="<%=request("order5")%>">
	    <input type="hidden" name="order6" value="<%=request("order6")%>">
	    <input type="hidden" name="order7" value="<%=request("order7")%>">
	    <input type="hidden" name="order8" value="<%=request("order8")%>">
	    <input type="hidden" name="order9" value="<%=request("order9")%>">
	    <input type="hidden" name="order10" value="<%=request("order10")%>">
	    <input type="hidden" name="order11" value="<%=request("order11")%>">
	    <input type="hidden" name="order12" value="<%=request("order12")%>">
	    <input type="hidden" name="order13" value="<%=request("order13")%>">
	    <input type="hidden" name="order14" value="<%=request("order14")%>">
	    <input type="hidden" name="order15" value="<%=request("order15")%>">

        <tr>
       <td align="right" height="30">盘点类型：</td>
          <td class="category">
		  <select name="pdlx">
		    <option value="盘盈"> 盘盈</option>
		    <option value="盘亏"> 盘亏</option>
		  </select>
		  </td>
        </tr>
          <td height="30" align="right">盘点数量：</td>
          <td class="category">
            <input type="text" name="shulian" style="width:50px" onKeyUp="value=value.replace(/[^\d.]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d.]/g,''))" value="<%=rs("shulian")%>"></td>
        </tr>
		<tr>
	      <td align="right" height="30">盘点时间：</td>
          <td class="category">
		    <input name="selldate" value="<%=date()%>" readonly style="width:150px">
		    <img src="../images/date.gif" align="absmiddle" style="cursor:pointer;" onClick="JavaScript:window.open('day.asp?form=form3&field=selldate&oldDate='+selldate.value,'','directorys=no,toolbar=no,status=no,menubar=no,scrollbars=no,resizable=no,width=250,height=170,top=200,left=520');">
		  </td>
        </tr>
	    <tr>
          <td align="right" height="30">经办人：</td>
          <td class="category">
		  <%
		  if session("redboy_id")=1 then
			sql="select * from login order by id_zu,id"
			set rs_login=conn.execute(sql)
		  else
			sql="select * from login where id="&session("redboy_id")
			set rs_login=conn.execute(sql)	  
		  end if
		  if rs_login.eof then
		  %>
	      <script language="javascript">
	        alert("请先添加员工！")
	        window.location.href="../system/user_add.asp"
	      </script>
		  <%
		  response.end
		  else
		  %>
		  <select name="id_login">
		  <%
		  do while rs_login.eof=false
		  %>
		    <option value="<%=rs_login("id")%>"<%if rs_login("username")=session("redboy_username") then%> selected="selected"<%end if%>><%=rs_login("username")%> (<%=rs_login("bianhao")%>)</option>
		  <%
		    rs_login.movenext
		  loop
		  %>
		  </select>
		  <%
		  end if
		  %>		
		  </td>
        </tr>
		<tr>
	      <td align="right" height="30">备注：</td>
          <td class="category">
		    <textarea name="beizhu" cols="60" rows="3"></textarea>
		  </td>
        </tr>		
        <tr>
		  <td height="30">&nbsp;</td>
          <td class="category" align="left"><input type="submit" value=" 确认盘点 " class="button">
		    <input type="hidden" name="hid" value="ok">
		    <input type="reset" value=" 重新填写 " class="button">
		  </td>
        </tr>	
	  </form>					
    </table>
</td>
<td></td>
</tr>
<tr>
<td><img src="../images/r_4.gif" alt="" /></td>
<td></td>
<td><img src="../images/r_3.gif" alt="" /></td>
</tr>
</table>

<table cellpadding=0 cellspacing=0 width="100%" align=center><tr><td height="5"></td></tr></table>

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;产品详细信息</td>
	  <td align="right">&nbsp;</td>
    </tr>
  </table>
</td>
<td><img src="../images/r_2.gif" alt="" /></td>
</tr>
<tr>
<td></td>
<td>
<table align="center" cellpadding="4" cellspacing="1" class="toptable grid" border="1">
      <tr>
        <td align="right" height="30">所属大类：</td>
        <td class="category">
          <%
	      sql="select * from bigclass where id="&rs("id_bigclass")
	      set rs_bigclass=conn.execute(sql)
	      %>
          <%=rs_bigclass("bigclass")%></td>
      </tr>  
      <tr>
        <td align="right" height="30">所属小类：</td>
        <td class="category">
          <%
	      sql="select * from smallclass where id="&rs("id_smallclass")
	      set rs_smallclass=conn.execute(sql)
		  %>
          <%if rs_smallclass.eof=false then%><%=rs_smallclass("smallclass")%><%else%>&nbsp;<%end if%></td>
      </tr>	   
      <tr>
        <td width="25%" height="30" align="right">产品名称： </td>
        <td width="75%" class="category"><%=rs("title")%></td>
      </tr>
      <tr>
        <td align="right" height="30">产品货号： </td>
        <td class="category"><%=rs("huohao")%></td>
      </tr>
      <tr>
        <td align="right" height="30">库存数量：</td>
        <td class="category">
		  <%
	      sql="select * from produit where huohao='"&rs("huohao")&"'"
	      set rs_shulian=conn.execute(sql)
	      nowshulian=0
		  nowtext=""
	      do while rs_shulian.eof=false
   	        nowshulian=nowshulian+rs_shulian("shulian")
			sql="select * from ku where id="&rs_shulian("id_ku")
			set rs_ku=conn.execute(sql)
		    nowtext=nowtext+rs_ku("ku")&"("&formatnumber(rs_shulian("shulian"),3)&")，"
	        rs_shulian.movenext
	      loop		  
		  %>
		  共<%=formatnumber(nowshulian,3)%>，<%=left(nowtext,len(nowtext)-1)%></td>
      </tr>
      <tr>
        <td align="right" height="30">产品单位：</td>
        <td class="category"><%=rs("danwei")%></td>
      </tr>		  
      <tr>
        <td align="right" height="30">产品价格：</td>
        <td class="category">推荐卖价：<%=formatnumber(rs("price"),3)%>，进货价：<%=formatnumber(rs("price2"),3)%></td>
      </tr>	  
      <tr>
        <td align="right" height="30">串号：</td>
        <td class="category"><%=rs("guige")%></td>
      </tr>
	  <tr>
        <td align="right" height="30">包装体积：</td>
        <td class="category"><%=rs("tiji")%></td>
      </tr>
      <tr>
        <td align="right" height="30">最低库存报警数量：</td>
        <td class="category"><%=rs("baojin")%></td>
      </tr>	  
      <tr>
        <td align="right" height="30">产品类型：</td>
        <td class="category"><%if rs("class")=0 then%>正常产品<%else%>公司赠品<%end if%></td>
      </tr>
      <tr>
        <td align="right" height="30">兑换所需积分：</td>
        <td class="category"><%=rs("duihuan")%></td>
      </tr>	  	  
      <tr>
        <td align="right" height="30">提成：</td>
        <td class="category">
		  <%if rs("tichen_type")=0 then%>按百分比提成<%else%>固定提成<%end if%>，
		  销售一件提成：<%=rs("tichen")%> <%if rs("tichen_type")=0 then%>%<%else%>元<%end if%>
		</td>
      </tr>
      <tr>
        <td align="right" height="30">产品备注：</td>
        <td class="category">
		  <%=replace(replace(rs("beizhu")&""," ","&nbsp;"),chr(13),"<br>")%></td>
      </tr>	  
	  <%if showpic="yes" then%>
      <tr>
        <td align="right" height="30">图片：</td>
        <td class="category">
		  <%if rs("photo")<>"" then%><a href="../upload/<%=rs("photo")%>" target="_blank"><img src="../upload/<%=rs("photo")%>" border="0"></a><%else%>无图<%end if%>
		</td>
      </tr>
	  <%end if%>		  		      
	  </table>
</td>
<td></td>
</tr>
<tr>
<td><img src="../images/r_4.gif" alt="" /></td>
<td></td>
<td><img src="../images/r_3.gif" alt="" /></td>
</tr>
</table>
<%
else
nowselldate=request("selldate")
nowbeizhu=request("beizhu")
nowku_chu=request("ku_chu")
nowku_ru=request("ku_ru")
nowshulian=request("shulian")
pdlx=request("pdlx")
if nowshulian="" then
  nowshulian=0
end if
'response.write pdlx
'response.end


set rs_produit=conn.execute("select * from produit where id="&request("id"))
if pdlx="盘亏" then
sql="select * from produit where id="&request("id")
set rs=conn.execute(sql)
if rs("shulian")<int(nowshulian) then
%>
<script language="javascript">
alert("<%=rs_ku_chu("ku")%> 库存不足！")
window.history.go(-1)
</script> 
<%
  response.end
end if
end if

if pdlx="盘亏" then
nowshulian=-1*cdbl(nowshulian)
end if

set rs=server.createobject("ADODB.RecordSet")
sql="select * from produit where id="&request("id")
rs.open sql,conn,1,3
rs("shulian")=rs("shulian")+nowshulian
rs.update
rs.close



nowid_login=request("id_login")
set rs_login=conn.execute("select * from login where id="&nowid_login)
nowbianhao=replace(replace(replace(replace(replace(replace(FormatDateTime(now(),0),":","")," ",""),"-",""),"/",""),"上午",""),"下午","")
nowbianhao=right(nowbianhao,len(nowbianhao)-2)
sql="select bigclass from bigclass where id="&rs_produit("id_bigclass")
set rs_bigclass=conn.execute(sql)
sql="select smallclass from smallclass where id="&rs_produit("id_smallclass")
set rs_smallclass=conn.execute(sql)
if rs_smallclass.eof then
  smallclass=""
else
  smallclass=rs_smallclass(0)
end if
sql="insert into kcpd(lx,id_produit,bigclass,smallclass,title,huohao,shulian,guige,id_login,login,type,selldate,price,price2,photo,bianhao,beizhu) values('"&pdlx&"',"&rs_produit("id")&",'"&rs_bigclass(0)&"','"&smallclass&"','"&rs_produit("title")&"','"&rs_produit("huohao")&"',"&nowshulian&",'"&rs_produit("guige")&"',"&nowid_login&",'"&rs_login("username")&"',0,'"&nowselldate&"',"&rs_produit("price")&","&rs_produit("price2")&",'"&rs_produit("photo")&"','"&nowbianhao&"','"&nowbeizhu&"')"
'response.write sql
conn.execute(sql)
%>
<script language="javascript">
alert("库存盘点成功！")
window.location.href="produit_move.asp?page=<%=request("page")%>&keyword=<%=request("keyword")%>&ku=<%=request("ku")%>&bigclass=<%=request("bigclass")%>&smallclass=<%=request("smallclass")%>&order1=<%=request("order1")%>&order2=<%=request("order2")%>&order3=<%=request("order3")%>&order4=<%=request("order4")%>&order5=<%=request("order5")%>&order6=<%=request("order6")%>&order7=<%=request("order7")%>&order8=<%=request("order8")%>&order9=<%=request("order9")%>&order10=<%=request("order10")%>&order11=<%=request("order11")%>&order12=<%=request("order12")%>&order13=<%=request("order13")%>&order14=<%=request("order14")%>&order15=<%=request("order15")%>"
</script> 
<%
end if
%>
</body>
</html>