<!--#include file="Conn.asp"-->
<!--#include file="Check.asp"-->
<!--#include file ="Inc/Date.asp"-->
<%
Dim payid
Dim rs,ID,ListID,Payer,PayType,Money,Project,Menu,Times,InOut
payid = Request("id")
Set rs=Conn.Execute("Select * From [gdzcgl] Where ID="&payid)
ID = rs("ID")
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
<body text="#000000">
<table cellpadding="2" cellspacing="1" border="0" width="95%" class="tableBorder" align=center>
  <form action="gdzc_Edit2.asp?id=<%=ID%>&action=add" method=post id=form1 name=form1 onSubmit="return chk(this)">
    <tr bgcolor=ffffff> 
      <th height=25 colspan=8 align="center">固定资产信息显示</th>
    </tr>
    <tr bgcolor=ffffff> 
      <td width="8%" class="category"><div align="right">类别：</div></td>
      <td width="7%" class="category"> <input name="class" type="text" id="class" value="<%=rs("class")%>" size="10" maxlength="10" readonly></td>
      <td width="8%" class="category"><div align="right">设备号：</div></td>
      <td width="7%" class="category"> <input name="sb_id" type="text" id="sb_id" value="<%=rs("sb_id")%>" size="10" maxlength="10"  readonly></td>
      <td width="10%" class="category"><div align="right">采购日期：</div></td>
      <td colspan="2" class="category"><input name="caigoudate" type="text" id="caigoudate" value="<%=rs("caigoudate")%>" size="12" maxlength="12" readonly> 
        <input onclick="popUpCalendar(this, form1.caigoudate, 'yyyy-mm-dd')" type="button" value="请选择日期"></td>
    </tr>
    <tr  bgcolor=ffffff> 

      <td width="8%" class="category"><div align="right">设备名称：</div></td>
      <td width="7%" class="category"> <input name="name" type="text" id="name" value="<%=rs("name")%>" size="10" maxlength="10"></td>

      <td width="8%" class="category"><div align="right">使用部门：</div></td>
      <td width="10%" class="category"> <input name="department" type="text" id="department" value="<%=rs("department")%>" size="20" maxlength="150"></td>

      <td width="8%" class="category"><div align="right">数量：</div></td>
      <td width="7%" class="category"> <input name="quantity" type="text" id="quantity" onkeypress="javascript:CheckNum();" value="<%=rs("quantity")%>" size="10" maxlength="10"></td>


    </tr>
    <tr  bgcolor=ffffff> 
      <td width="8%" class="category"><div align="right">金额：</div></td>
      <td width="7%" class="category"> <input name="money" type="text" id="money" value="<%=rs("money")%>" size="10" maxlength="10"></td>
      <td width="8%" class="category"><div align="right">折旧率：</div></td>
      <td width="7%" class="category"> <input name="zejiu" type="text" id="zejiu"  onkeypress="javascript:CheckNum();" value="<%=rs("zejiu")%>" size="10" maxlength="10">%</td>

      <td  width="8%" class="category"><div align="right">备注：</div></td>
      <td width="17%" class="category"> <input name="remark" type="text" id="remark" value="<%=rs("remark")%>" size="20" maxlength="50"></td>



    </tr>

    <tr  bgcolor=ffffff> 
      <td width="8%" class="category"><div align="right">状态：</div></td>
      <td width="7%" class="category"> <input name="score" type="text" id="score" value="<%=rs("score")%>" size="10" maxlength="10"></td>
      <td width="8%" class="category"><div align="right"></div></td>
      <td width="7%" class="category"> </td>

      <td  width="8%" class="category"><div align="right"></div></td>
      <td width="17%" class="category"></td>



    </tr>

  </form>
</table>
<%
rs.Close
Set rs=Nothing

End if%>
</html>