<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body onLoad="javascript:history.go(-1)">
<%
select case request.querystring("id")
case 1
err_str="您的昵称与聊天室内已有用户名重复，请换名重试！"
case 14
err_str="聊天昵称不能为空！"

end select
Response.Write "<script Language=Javascript>alert('" & err_str & "');</script>"
%>
</body>
</html>
