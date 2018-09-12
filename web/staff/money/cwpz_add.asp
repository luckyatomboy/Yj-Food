<!--#include file="Conn.asp"-->
<!--#include file="Check.asp"-->
<!--#include file ="Inc/Date.asp"-->
<%
Dim ye,ke,xe,j,Sql
Dim rss,ord_id,len_id,zero,i
Dim isadmin,kk_id,kk_na,kk
Dim cus
Dim pro_id,pro_na,pro_gg,pro_money
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
<script src="Js/AddOrder.js"></script> 
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
</head>
</head>
<script language="JavaScript">
<!--

function chk(theForm){ 
if (theForm.XJBH.value == ""){
                alert("请输入凭证编号!");
                theForm.XJBH.focus();
                return (false);
        } 
if (theForm.CZRQ.value == ""){
                alert("请输入凭证日期!");
                theForm.XJBH.focus();
                return (false);
        } 
if (theForm.CZR.value == ""){
                alert("请输入操作人!");
                theForm.CZR.focus();
                return (false);
        } 
if (theForm.fj.value == ""){
                alert("请输入附件!");
                theForm.fj.focus();
                return (false);
        } 

if (theForm.spid1.value == ""){
                alert("请输入科目代码!");
                theForm.spid1.focus();
                return (false);
        } 

if (theForm.pro_sl1.value == ""){
                alert("请输入金额!");
                theForm.pro_sl1.focus();
                return (false);
        } 




}

function CheckNum(){
   if((event.keyCode<48||event.keyCode>57)&&event.keyCode!=46) event.returnValue=false; 
   }

function pronews(id) { window.open("cwpzfind1.asp?id="+id,"","height=500,width=550,left=350,top=0,resizable=yes,scrollbars=yes,status=no,toolbar=no,menubar=no,location=no");
}
function pronews2(id) { window.open("cwpzfind2.asp?id="+id,"","height=500,width=550,left=350,top=0,resizable=yes,scrollbars=yes,status=no,toolbar=no,menubar=no,location=no");
}
//-->
</script>
<body text="#000000">
<br>
<table width="98%" class="toptable grid" border="1" align="center" cellpadding="0" cellspacing="0" >
  <tr> 
    <td height="22"> <div align="left"><strong>&nbsp
        </strong></font><strong>操作[</strong>公司财务凭证<strong>]</strong></div></td>
  </tr>
</table>
<br>
<table cellpadding="6" cellspacing="0"  width="98%" class="toptable grid" border="1" align=center>
  <form action="cwpz_add2.asp" method=post id=form1 name=form1 onSubmit="return chk(this)">
    <tr bgcolor=ffffff> 
      <th height=25 align="center">公司财务凭证</th>
    </tr>
    <tr bgcolor=ffffff> 
      <td class="category"> <table width="100%"  cellpadding="4" cellspacing="2" class="toptable grid" border="1">
          <tr> 
            <td>凭证编号:<input name="XJBH" type="text" id="XJBH" size="12" maxlength="12">
            	  凭证日期:<input name="CZRQ" type="text" id="CZRQ" size="12" maxlength="12" value=<%=date()%> readonly>
            	  <input name="button" type="button" onClick="popUpCalendar(this, form1.CZRQ, 'yyyy-mm-dd')" value="选择">
            	  操作人:<input name="CZR" type="text" id="CZR" size="8" maxlength="8" value=<%=Session("ManageName")%>>
            	  附件数:<input name="fj" type="text" id="fj" size="4" maxlength="6" onKeyPress="javascript:CheckNum();">
            	</td>
          <tr>
          </tr>
<td>
            	借贷条数:<input name="spsl" type="text" id="spsl" value="2" size="5" maxlength="10" onKeyPress="javascript:CheckNum();"> 
              <input type="button" name="Submit4" onclick="setid();" value=" 点 击 " > 
              <font color="#FF0000">(添加一条借贷,请先输入要添加的借贷数量.) </font> 
</td>

          
        </table>
        <br> <SCRIPT language=javascript>
function setid()
{
	  var str;
	  str="";
	  if(!window.form1.spsl.value)
	   window.form1.spsl.value=1;
 	  for(var i=1;i<=window.form1.spsl.value;i++){
	        str+="<table width='100%' border='0' cellpadding='2' cellspacing='0'>";
            str+="<tr> ";
            str+="<td width='2%'> <div align='center'>"+i+"</div></td>";
           str+="<td width='4%'> <div align='center'>"; 
            str+="<input name='score"+i+"' type='text' size='4' maxlength='20' readonly>";
           str+="</div></td>";
           str+="<td width='7%'> <div align='center'>"; 
            str+="<input name='spid"+i+"' type='text' size='10' maxlength='20' readonly>";
            str+="<input type='button' name='Submit3' value='获取' onClick='javascript:pronews("+i+");'>";
           str+="</div></td>";
         str+="<td width='8%'> <div align='center'>"; 
          str+="<input name='pro_news"+i+"' type='text' size='15' maxlength='60' readonly>";
         str+="</div></td>";
          str+=" <td width='10%'><div align='center'></div>";
          str+="<div align='center'> ";
          str+="<input name='pro_sl"+i+"' type='text' onKeyPress=javascript:CheckNum(); size='10' maxlength='10'>";
          str+="</div></td>";
         str+="<td width='10%'> <div align='center'>"; 
          str+="<input name='remark"+i+"' type='text' size='15' maxlength='60'>";
         str+="</div></td></tr>";
         str+="</table>";
		 
		 }
	  window.upid.innerHTML=str+"<br>";
}
</SCRIPT> 
<table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#FFFFFF">
          <tr> 
            <td width="2%" class="category"> <div align="center">项目</div></td>
            <td width="4%" class="category"> <div align="center">类别</div></td>
            <td width="9%" class="category"> <div align="center">科目代码</div></td>
            <td width="8%" class="category"> <div align="center">科目名称</div></td>
            <td width="5%" class="category"> <div align="center">金额</div></td>
            <td width="10%" class="category"> <div align="center">摘要</div></td>
          <tr> 
            <td colspan="7" class="category" id=upid> <table width="100%" border="0" cellpadding="2" cellspacing="0">
                <tr> 
                  <td width="2%"> <div align="center">1</div></td>
                  <td width="4%"> <div align="center"> 
                      <input name="score1" type="text" id="score1" size="4" maxlength="20" readonly>
</td>
                  <td width="10%"> <div align="center"> 
                      <input name="spid1" type="text" id="spid1" size="10" maxlength="20" readonly>
                      <input type="button" name="Submit3" value="获取" onClick="javascript:pronews(1);">
                    </div></td>
                  <script language="JavaScript">
function ProNews(pid,pna,pgg,pmon,spid,pnews)
{
    var str1;
	var str2;
	var str3;
	var str4;
	var arr_str1;
	var arr_str2;
	var arr_str3;
	var arr_str4;
	var aa;
	str1 = pid;
	str2 = pna;
	str3 = pgg;
	str4 = pmon;
	arr_str1 = str1.split("||");
	arr_str2 = str2.split("||");
	arr_str3 = str3.split("||");
	arr_str4 = str4.split("||");

      for(var i=0;i<=arr_str1.length;i++){
		 if(spid==arr_str1[i]){
	        pnews.value=arr_str2[i]+" , "+arr_str3[i]+" , "+arr_str4[i];}
	  }
	  
}
</script>
                  <td width="8%"> <div align="center"> 
                      <input name="pro_news1" type="text" id="pro_news1" size="15" maxlength="20" readonly>
                    </div></td>
                  <td width="5%"> <div align="center"></div>
                    <div align="center"> 
                      <input name="pro_sl1" type="text" id="pro_sl1" onKeyPress="javascript:CheckNum();" size="10" maxlength="10">
                    </div></td>
                  <td width="10%"> <div align="center"> 
                      <input name="remark1" type="text" id="remark1" size="18" maxlength="60">
                    </div></td>  

                </tr>
              </table></td>
          </tr>
        </table>
       </td>
    </tr>
    <tr  bgcolor=ffffff> 
      <td height="30" align="center" class="category"> <input type="submit" name="Submit" value="添 加"> 
        <input type="reset" name="Submit2" value="清 空"></td>
    </tr>
  </form>
</table>
</html>