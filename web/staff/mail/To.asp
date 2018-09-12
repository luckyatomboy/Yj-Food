<!--#include file="Conn.asp"-->
<HTML>
<HEAD>
<TITLE>选择收件人</TITLE>
<META http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="css/main.css" type="text/css" rel="stylesheet">
<link href="../style/style.css" rel="stylesheet" type="text/css">
<style>
body {
	background-color:#FFFFFF;
}
</style>
</HEAD>
<BODY bgColor="#ffffff" leftMargin="0" topMargin="0">
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;选择收件人</td>
	  <td align="right">&nbsp;</td>
    
    </tr>
  </table>
  </table>

<!---->
<script language="javascript">
	function HandleSubmit(){
		//
		var to="";
		var toId="";
		var arr_to="";

		var EmpIds=document.ABP.EmpId;
		for(var i=0;i<EmpIds.length;i++){
			if(EmpIds[i].checked==true){
				arr_to=EmpIds[i].value.split("|");
				if(to==""){
					toId=arr_to[0];
					to=arr_to[1];
				}else{
					toId=toId+","+arr_to[0];
					to=to+","+arr_to[1];
				}
			}
		}
		//
		var _R = new Object();
		_R.to=to;
		_R.toId=toId;
		//_R.cc=frm.cc.value;
		//_R.bcc=frm.bcc.value;
		window.returnValue=_R;
		window.close();
	}
</script>
<BR>
<form name="ABP" method="post">
<input type="hidden" name="ToEmps">
<table cellSpacing="0" cellPadding="0" width="500" border="0">
  <tr>
    <td width="13" height="30"></td>
	<td colspan="2" bgcolor="#A0C6E5">
	<table border="0" width="100%">
	  <tr>
		<td>
		<table cellSpacing="0"  bgcolor="#ffffff" cellPadding="0" width="100%" border="0">
		  <%
		  toId=Request("toId")
		  Set RsDept=conn.execute("SELECT id,zu FROM zu_login")
		  Do While Not RsDept.Eof
		  %>
		  <tr>
			<td width="13"></td>
			<td width="120"><%=RsDept("zu")%></td>
			<td></td>
		  </tr>
		  <%
			Set RsEmp=conn.execute("SELECT id,username FROM login WHERE id_zu="&RsDept("id")&"")
			Do While Not RsEmp.Eof
		  %>
		  <tr>
			<td></td>
			<td>　　<%=RsEmp("username")%></td>
			<td><input type="checkbox" <%if instr(toId,RsEmp("username"))>0 then response.write("checked")%> name="EmpId" value="<%=RsEmp("username")%>|<%=RsEmp("username")%>"></td>
		  </tr>
		  <%
				RsEmp.movenext
			Loop
			RsDept.movenext
		  Loop
		  Set RsDept =nothing
		  %>
		</table>
		</td>
	  </tr>
	  <tr>
		<td height="23" align="center">
		<input type="button" name="btnSelectAll" value="全选" onClick="javascript:select_change();" style="width:60px;">
		<input type="button" name="btnOk" value="确定" style="width:60px;" onClick="HandleSubmit();">
		<input type="button" name="btnCancel" value="取消" onClick="window.close();" style="width:60px;">
		</td>
	  </tr>
	</table>
	</td>
  </tr>
</table>
</form>
<BR>
<!---->
</BODY>
</HTML>
<%
set conn=nothing
%>
<script language="javascript">
	function select_All(checked){
		for (var i=0;i<document.ABP.EmpId.length;i++){
			var e = document.ABP.EmpId[i];
			e.checked = checked;
		}
	}

	function select_change(){
		if(document.ABP.btnSelectAll.value=="全选"){
			document.ABP.btnSelectAll.value="取消";
			select_All(true);
		}else{
			document.ABP.btnSelectAll.value="全选";
			select_All(false);
		}
	}
</script>