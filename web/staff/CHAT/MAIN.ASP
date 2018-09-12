 
<%
if session("username")="" then response.redirect "error.asp?id=14"
'u_list2=application("userlist")
'for l=1 to ubound(u_list2)
'ua_list2=ua_list2&u_list2(l)
'next
'if Instr(ua_list2,session("username"))>0  then response.redirect "error.asp?id=14"
%>
<html>
<head>
<title>OA会议中心</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<frameset cols="*,0" frameborder="NO" border="0" framespacing="0" rows="*"> 
  <frameset rows="1,*" frameborder="NO" border="0" framespacing="0" cols="*"> 
    <frame name="list" scrolling="yes" noresize src="list.asp">
    <frameset rows="*,80" frameborder="NO" border="0" framespacing="0"> 
      <frame name="talk" src="javascript:parent.nullframe">
      <frame name="say" scrolling="NO" noresize src="say.asp">
    </frameset>
  </frameset>
  
  
  
  <frame name="online" scrolling="NO" noresize src="online.asp">
</frameset>
  
<noframes> 
<body bgcolor="#FFFFFF" text="#000000">
</body>
</noframes> 
</html>







