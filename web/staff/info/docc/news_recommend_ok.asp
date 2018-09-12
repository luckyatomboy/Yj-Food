<%
if request.querystring("Flag")="OK" then
	response.write("<script language='javascript'>alert('该条信息已经成功地推荐给您的朋友！');window.close();</script>")
	response.end
end if
if request.form("action")="news_recommend" then
	title=request.form("title")
	content=request.form("content")
	yourname=request.form("yourname")
	yourmail=request.form("yourmail")
	friendmail=request.form("friendmail")
	yourcontent=request.form("yourcontent")
	sContent="您的朋友<b>"&yourname&"</b>向您推荐了下面一条信息：<BR>------------------------<BR>" & content & "<BR><BR><BR>以下是您朋友的留言：<BR>------------------------<BR>" & yourcontent & "<BR><BR><BR><a target='_blank' href='http://www.semmw.com'>上海电机厂</a><BR>------------------------<BR>网站建设，网站推广，集团邮箱，系统开发，企业应用软件..."
end if
%>
<form name="frmmail" method="post" action="sendmail.asp">
<input type="hidden" name="sFrom" value="<%=yourmail%>">
<input type="hidden" name="sTo" value="<%=friendmail%>">
<input type="hidden" name="sSubject" value="<%=title%>">
<textarea style="display:none;" name="sContent"><%=sContent%></textarea>
</form>
<script language="javascript">
	document.frmmail.submit();
</script>