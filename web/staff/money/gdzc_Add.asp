<!--#include file="Conn.asp"-->
<!--#include file="Check.asp"-->
<!--#include file ="Inc/Date.asp"-->
<%
Dim isInOut

isInOut = Request("InOut")




%>
<html>
<head>
<title>管理中心</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../style/style.css" rel="stylesheet" type="text/css">
<style>
body {
	background-color:#FFFFFF;
}
</style>
<script language="JavaScript" src="Image/js.js"></SCRIPT>
</head>
<%
Dim payid
Dim rs,ID,ListID,Payer,PayType,Money,Project,Menu,Times,InOut
payid = Request("id")
Set rs=Conn.Execute("Select * From [gdzcgl] Where 1=2")
%>
<html>
<head>
<title>管理中心</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="Image/style.css" type=text/css rel=stylesheet>
<script language="JavaScript" src="Image/js.js"></SCRIPT>
</head>
<%
If Request.QueryString("action")="update" Then
   Call PaySave
Else
%>

<script language="JavaScript">
<!--
function change(obj,i) {
he=parseInt(obj.style.height);
if (he>=80&&he<=400)
   obj.style.height=he+i+'px';
else 
   obj.style.height='80px';
}

function chk(theForm){

if (theForm.sbclass.value == ""){
                alert("请输入设备类别!");
                theForm.sbclass.focus();
                return (false);
        }         

if (theForm.sb_id.value == ""){
                alert("请输入设备编号!");
                theForm.sb_id.focus();
                return (false);
        }         

if (theForm.name.value == ""){
                alert("请输入设备名称!");
                theForm.name.focus();
                return (false);
        }         

if (theForm.department.value == ""){
                alert("请输入部门!");
                theForm.department.focus();
                return (false);
        } 
if (theForm.money.value == ""){
                alert("请输入金额!");
                theForm.money.focus();
                return (false);
        } 
if (theForm.quantity.value == ""){
                alert("请输入数量!");
                theForm.quantity.focus();
                return (false);
        } 
if (theForm.zejiu.value == ""){
                alert("请输入折旧!");
                theForm.zejiu.focus();
                return (false);
        } 

if (theForm.score.value == ""){
                alert("请输入状态!");
                theForm.score.focus();
                return (false);
        } 
if (theForm.zejiu.value*1 > 100){
                alert("折旧不能超过100%!");
                theForm.zejiu.focus();
                return (false);
        } 

if (theForm.score.value!="正常" && theForm.score.value!="报废"){
                alert("状态只能为正常或报废!");
                theForm.score.focus();
                return (false);
        } 
}

function CheckNum(){
   if((event.keyCode<48||event.keyCode>57)&&event.keyCode!=46) event.returnValue=false; 
   }
//-->
</script>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;固定资产信息新增</td>
	  <td align="right">&nbsp;</td>
    
    </tr>
  </table>
<body text="#000000">
<table cellpadding="2" cellspacing="1" class="toptable grid" border="1" width="95%" class="tableBorder" align=center>
  <form action="gdzc_add2.asp?id=<%=ID%>&action=add" method=post id=form1 name=form1 onSubmit="return chk(this)">

    <tr bgcolor=ffffff> 
      <td width="8%" class="category"><div align="right">类别：</div></td>
      <td width="7%" class="category"> <input name="sbclass" type="text" id="sbclass"  size="10" maxlength="10"></td>
      <td width="8%" class="category"><div align="right">设备号：</div></td>
      <td width="7%" class="category"> <input name="sb_id" type="text" id="sb_id"  size="10" maxlength="10"></td>
      <td width="10%" class="category"><div align="right">采购日期：</div></td>
      <td colspan="2" class="category"><input name="caigoudate" type="text" id="caigoudate" value="<%=date()%>" size="12" maxlength="12" readonly> 
        <input onclick="popUpCalendar(this, form1.caigoudate, 'yyyy-mm-dd')" type="button" value="请选择日期"></td>
    </tr>
    <tr  bgcolor=ffffff> 

      <td width="8%" class="category"><div align="right">设备名称：</div></td>
      <td width="7%" class="category"> <input name="name" type="text" id="name"  size="10" maxlength="10"></td>

      <td width="8%" class="category"><div align="right">使用部门：</div></td>
      <td width="10%" class="category"> <input name="department" type="text" id="department"  size="20" maxlength="150"></td>

      <td width="8%" class="category"><div align="right">数量：</div></td>
      <td width="7%" class="category"> <input name="quantity" type="text" id="quantity" onkeypress="javascript:CheckNum();"  size="10" maxlength="10"></td>


    </tr>
    <tr  bgcolor=ffffff> 
      <td width="8%" class="category"><div align="right">金额：</div></td>
      <td width="7%" class="category"> <input name="money" type="text" id="money" onkeypress="javascript:CheckNum();"  size="10" maxlength="10"></td>
      <td width="8%" class="category"><div align="right">折旧率：</div></td>
      <td width="7%" class="category"> <input name="zejiu" type="text" id="zejiu"  onkeypress="javascript:CheckNum();" value="0" size="10" maxlength="10">%</td>

      <td  width="8%" class="category"><div align="right">备注：</div></td>
      <td width="17%" class="category"> <input name="remark" type="text" id="remark"  size="20" maxlength="50"></td>



    </tr>

    <tr  bgcolor=ffffff> 
      <td width="8%" class="category"><div align="right">状态：</div></td>
      <td width="7%" class="category"> <input name="score" type="text" id="score" value="正常" size="10" maxlength="10"></td>
      <td width="8%" class="category"><div align="right"></div></td>
      <td width="7%" class="category"> </td>

      <td  width="8%" class="category"><div align="right"></div></td>
      <td width="17%" class="category"></td>



    </tr>

    <tr  bgcolor=ffffff> 
      <td colspan="7" align="center" class="category"><input type="submit" name="Submit" value="新 增"></td>
    </tr>
  </form>
</table>
<%
rs.Close
Set rs=Nothing

End if%>
</html>