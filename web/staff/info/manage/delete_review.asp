<%@language="VBscript"%>
<%Response.Expires=0%>
<!--#include file="../include/checkadmin.asp"-->
<!--#include file="../include/conn.asp"-->
<%
id=request.form("id")
if id="" or isnull(id) then id=0
conn.execute "delete from tbl_news_review where reviewid in ("&id&")"
%>
<form name="frmback" method="post" action="list_review.asp">
<input type="hidden" name="ipage" value="<%=request.form("ipage")%>">
<input type="hidden" name="keyword" value="<%=request.form("keyword")%>">
<input type="hidden" name="days" value="<%=request.form("days")%>">
</form>
<script language="javascript">
	document.frmback.submit();
</script>