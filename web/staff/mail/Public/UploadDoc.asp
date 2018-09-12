<HTML>
<HEAD>
<TITLE>电机厂Market--上传附件</TITLE>
<META http-equiv="Content-Type" content="text/html; charset=gb2312">

</HEAD>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<SCRIPT language=javascript>
	function checkfrm_upload(){
		if(document.frm_upload.doc.value==""){
			alert("请选择要上传的附件！");
			return false;
		}
	}
</SCRIPT>
<table border=0 width="100%" cellpadding=0 cellspacing=0>
<form name="frm_upload" action="UploadDocOk.asp" method="post" enctype="multipart/form-data" onsubmit="return checkfrm_upload()">
<input type="hidden" name="filepath" value="<%=request.querystring("filepath")%>">
<input type="hidden" name="formname" value="<%=request.querystring("formname")%>">
<input type="hidden" name="textname" value="<%=request.querystring("textname")%>">
  <tr >
	<td><input class=edit type="file" name="doc" style="width:70%"> <input type=submit name=s1 value=上传 style="width:60px;height:22px;"></td>
  </tr>
</form>
</table>
</BODY>
</HTML>