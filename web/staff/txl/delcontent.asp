<%response.expires=0%>
<!--#include file="conn.asp"-->
<%
set conn=dbconn("conn")
id=request("id")
		sql="delete * from qiye where id="&id&""
		conn.execute(sql)
	response.write("<script language=""javascript"">")
	response.write("alert(""É¾³ý³É¹¦£¡"");")
	response.write("window.close();")
	response.write("</script>")

%>
