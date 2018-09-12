<HTML><HEAD>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META HTTP-EQUIV="Refresh" content="300">
<STYLE type=text/css>
A:link {
	FONT-SIZE: 12px; COLOR: #666666; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A:active {
	FONT-SIZE: 12px; COLOR: #666666; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A:visited {
	FONT-SIZE: 12px; COLOR: #666666; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A:hover {
	FONT-SIZE: 12px; COLOR: #f29422; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A.blue:link {
	FONT-SIZE: 12px; COLOR: #ffffff; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A.blue:active {
	FONT-SIZE: 12px; COLOR: #73a2d6; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A.blue:visited {
	FONT-SIZE: 12px; COLOR: #ffffff; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A.blue:hover {
	FONT-SIZE: 12px; COLOR: #73a2d6; LINE-HEIGHT: 20px; TEXT-DECORATION: underline
}
</STYLE>
<SCRIPT language=JavaScript>
				nereidFadeObjects = new Object();
				nereidFadeTimers = new Object();
				function nereidFade(object, destOp, rate, delta){
				if (!document.all)
				return
					if (object != "[object]"){ 
						setTimeout("nereidFade("+object+","+destOp+","+rate+","+delta+")",0);
						return;
					}
					clearTimeout(nereidFadeTimers[object.sourceIndex]);
					diff = destOp-object.filters.alpha.opacity;
					direction = 1;
					if (object.filters.alpha.opacity > destOp){
						direction = -1;
					}
					delta=Math.min(direction*diff,delta);
					object.filters.alpha.opacity+=direction*delta;
					if (object.filters.alpha.opacity != destOp){
						nereidFadeObjects[object.sourceIndex]=object;
						nereidFadeTimers[object.sourceIndex]=setTimeout("nereidFade(nereidFadeObjects["+object.sourceIndex+"],"+destOp+","+rate+","+delta+")",rate);
					}
				}
				</SCRIPT>
</HEAD>
<BODY leftMargin=0 topMargin=0 scroll=no marginheight="0" marginwidth="0">
<!-- #include file="conn.asp" -->
<%
sql="select * from config"
set rs_config=conn.execute(sql)
gonggao=rs_config("gonggao")
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0" bgColor=#3a6592 style="color:#FFFFFF; font-size:12px;">
  <tr>
    <td height="28" width="214"><IMG src="images/Title.gif" border="0"></td>
    <td width="100">系统公告：<img src="images/Announce.gif"></td>
	<td width="420"><MARQUEE onmouseover=this.stop() onmouseout=this.start() scrollAmount=1 scrollDelay=4 width=500 align="left"><%=gonggao%></MARQUEE></td>
    
    <td width="*" align="right" nowrap="nowrap">
	  [<A class=blue href="#" onClick="showModalDialog('about/about.htm',window,'dialogHeight:250px;dialogWidth:360px;dialogleft:200px;help:no;status:no;scroll:no');">关于系统</A>]
	  [<A class=blue href="javascript:parent.location.href='exit.asp'" onClick="return confirm('确定要退出吗？');">安全退出</A>]
	  &nbsp;&nbsp;
	</td>
  </tr>
</table>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 background=images/topnav_bg.jpg>
  <TR>
    <TD width="*" height=35>&nbsp;</TD>
	<TD valign="bottom" width="95">
	  <a href="gys/back.asp" target="right"><img src="images/button11.jpg" border="0"></a>
	</TD>
	<TD valign="bottom" width="95">
	  <a href="gys/sell.asp" target="right"><img src="images/button10.jpg" border="0"></a>
	</TD>
	<TD valign="bottom" width="95">
	  <a href="gys/modi_mima.asp" target="right"><img src="images/button7.jpg" border="0"></a>
	</TD>
	<TD valign="bottom" width="95">
	  <a href="deskgys.asp" target="right"><img src="images/button8.jpg" border="0"></a>
	</TD>		
  </TR></TABLE>
</BODY></HTML>
