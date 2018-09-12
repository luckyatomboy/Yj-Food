<!--
//The Javascript written by ZHUHO (zhuho2000@sina.com)
//Version 1.1 /2002.11.19
//Update:2003.05.26

function ToolsButton(dispText,sImg,mImg,myUrl,target)
{
	this.dispText = dispText;
	this.sImg=ImgPath+sImg;
	this.mImg=ImgPath+mImg;
	this.Url=myUrl;
	this.target=target;
	
	return this;
}

var ImgPath="../Menu/ToolBarIcon/"
ButtonItems = new Array();

ButtonItems[0]=new ToolsButton('首页','home.gif','home_hover.gif','../Public/Home.asp','');
ButtonItems[1]=new ToolsButton('订单跟踪','order.gif','order_hover.gif','http://www.ce.net.cn','_blank');
ButtonItems[2]=new ToolsButton('内部联络','client.gif','client_hover.gif','../Office/New.asp','');
ButtonItems[3]=new ToolsButton('搜索','search.gif','search_hover.gif','','');
ButtonItems[4]=new ToolsButton('隐藏目录','dir_hide.gif','dir_hide_hover.gif','','');
ButtonItems[5]=new ToolsButton('显示目录','dir_show.gif','dir_show_hover.gif','','');
ButtonItems[6]=new ToolsButton('关于本系统','noti.gif','noti_hover.gif','../Help/About.asp','');
//ButtonItems[7]=new ToolsButton('反馈意见','help.gif','help_hover.gif','../Help/Suggest.asp','');
ButtonItems[8]=new ToolsButton('退出系统','exit.gif','exit_hover.gif','../Login/Loginout.asp','');
ButtonItems[9]=new ToolsButton('后退','back.gif','back_hover.gif','javascript:history.go(-1)','');
ButtonItems[10]=new ToolsButton('前进','forward.gif','forward_hover.gif','javascript:history.go(1)','');
ButtonItems[11]=new ToolsButton('刷新','reload.gif','reload_hover.gif','javascript:history.go(0)','');
ButtonItems[12]=new ToolsButton('HTML编辑器','html.gif','html_hover.gif','javascript:showhtmleditor();','');


//
function showhtmleditor(){
	//alert("html编辑器");
	showModalDialog("../Public/Editor/content_editor.asp","","dialogWidth=638px;dialogHeight=380px;status=no");
}

function ButtonOver(Img,ButtonID){

	Img.src=ButtonItems[ButtonID].mImg;
	Img.alt=ButtonItems[ButtonID].dispText;
}

function ButtonOut(Img,ButtonID){

	Img.src=ButtonItems[ButtonID].sImg;
	Img.alt=ButtonItems[ButtonID].dispText;
}

function ButtonClick(ButtonID){
	if(ButtonID==8){
		if(confirm("您真的要退出本系统吗?")) document.location.href=ButtonItems[ButtonID].Url;
	}		
	else
	{	
		if(ButtonItems[ButtonID].target!="")
			window.open(ButtonItems[ButtonID].Url,ButtonItems[ButtonID].target);
		else
			document.location.href=ButtonItems[ButtonID].Url;
	}
}

//屏蔽/设置某控件或按钮的回车事件,myobj控件名，ivalue=true为设置回车事件，false为屏蔽回车事件
function keyPressEvent(myobj,ivalue){
	var keycode = event.keyCode;
	if(keycode==13)	document.form1.onsubmit = new Function('return '+ivalue);
}

function refreshContent() {  
   document.location.reload(true);
}

function showSearchMenu() {
	if(window.cswmShowInFrame && document.readyState == 'complete')
	{		
		var id="Search";
		//SwapButton(id, 'on');
		document.all.SearchMenuShow.value="1";
		var x=aspnm_pageX(document.all[id+"Button"]);
		var y=aspnm_pageY(document.all[id+"Button"])+document.all[id+"Button"].height-2;
		cswmShowInFrame(id,x ,y);
		aspnm_hideSelectElements("cswmPopup"+id);		
	}

}

function hideSearchMenu(){
	if(isSearchMenu()){
		if(window.cswmShowInFrame && document.readyState == 'complete')
		{		
			cswmHide();
			aspnm_restoreSelectElements();			
		}
	}
	else
		ButtonOut(document.all["SearchButton"],3);
}

function isSearchMenu(){
	if(document.all.SearchMenuShow.value=="1")
		return true;
	else
		return false;
}

function SwapSearchButton(state){	
	if(state == "on")
		eval("document.all.SearchButton.src='"+ImgPath+"search_press.gif'");
	else if(state == "off")
	{
		eval("document.all.SearchButton.src='"+ImgPath+"search.gif'");
		document.all.SearchMenuShow.value="0";
	}
}

function CreateToolsBar()
{	
	document.write("<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">");
	document.write("<TBODY>");
	document.write("<tr>");
	document.write("<td background=\"../Menu/ToolbarIcon/line_h.gif\" colspan=\"5\" height=\"1\">");
	document.write("</td>");
	document.write("</tr>");
	document.write("<TR>");
	document.write("<td bgcolor=\"#dbd7d0\" valign=\"center\" align=\"left\" width=\"16\"><img src=\"../Menu/ToolbarIcon/3d.gif\" width=\"13\" height=\"33\"></td>");
	document.write("<td bgcolor=\"#dbd7d0\" valign=\"center\" align=\"left\">");
	document.write("<table border=\"0\" height=\"30\" cellpadding=\"0\" cellspacing=\"0\">");
	document.write("<TBODY>");
	document.write("<tr>");
	document.write("<td align=\"left\"><img src=\"../Menu/ToolbarIcon/back.gif\" width=\"61\" height=\"30\" border=\"0\" onMouseOver=\"ButtonOver(this,9);\" onMouseOut=\"ButtonOut(this,9);\" onclick=\"ButtonClick(9);\"></td>");
	document.write("<td width=\"4\"></td>");
	document.write("<td align=\"left\"><img src=\"../Menu/ToolbarIcon/forward.gif\" width=\"33\" height=\"30\" border=\"0\" onMouseOver=\"ButtonOver(this,10);\" onMouseOut=\"ButtonOut(this,10);\" onclick=\"ButtonClick(10);\"></td>");
	document.write("<td width=\"4\"></td>");
	document.write("<td align=\"left\"><img src=\"../Menu/ToolbarIcon/reload.gif\" width=\"33\" height=\"30\" border=\"0\" onMouseOver=\"ButtonOver(this,11);\" onMouseOut=\"ButtonOut(this,11);\" onclick=\"ButtonClick(11);\"></td>");
	document.write("<td width=\"4\"></td>");
	document.write("<td align=\"left\"><img src=\"../Menu/ToolbarIcon/home.gif\" width=\"34\" height=\"30\" border=\"0\" onMouseOver=\"ButtonOver(this,0);\" onMouseOut=\"ButtonOut(this,0);\" onclick=\"ButtonClick(0);\"></td>");
	document.write("<td width=\"11\" align=\"middle\"><img src=\"../Menu/ToolbarIcon/separator.gif\" width=\"7\" height=\"30\"></td>");
	document.write("<!--");
	document.write("<td align=\"left\"><img src=\"../Menu/ToolbarIcon/order.gif\" width=\"86\" height=\"30\" border=\"0\" onMouseOver=\"ButtonOver(this,1);\" onMouseOut=\"ButtonOut(this,1);\" onclick=\"ButtonClick(1);\"></td>");
	document.write("<td width=\"4\"></td>");
	document.write("-->");
	document.write("<td align=\"left\"><img src=\"../Menu/ToolbarIcon/client.gif\" width=\"90\" height=\"30\" border=\"0\" onMouseOver=\"ButtonOver(this,2);\" onMouseOut=\"ButtonOut(this,2);\" onclick=\"ButtonClick(2);\"></td>");
	document.write("<td width=\"4\"></td>");
	document.write("<!--");
	document.write("<td width=\"11\" align=\"middle\"><img src=\"../Menu/ToolbarIcon/separator.gif\" width=\"7\" height=\"30\"></td>");
	document.write("-->");
	document.write("<td align=\"left\"><img ID=\"SearchButton\" src=\"../Menu/ToolbarIcon/search.gif\" width=\"76\" height=\"30\" border=\"0\" onMouseOver=\"ButtonOver(this,3);\" onMouseOut=\"hideSearchMenu();\" onclick=\"showSearchMenu();\" name=\"SearchButton\"></td>");
	document.write("<td width=\"11\" align=\"middle\"><img src=\"../Menu/ToolbarIcon/separator.gif\" width=\"7\" height=\"30\"></td>");
	document.write("<td align=\"left\"><img src=\"../Menu/ToolbarIcon/noti.gif\" width=\"34\" height=\"30\" border=\"0\" onMouseOver=\"ButtonOver(this,6);\" onMouseOut=\"ButtonOut(this,6);\" onclick=\"ButtonClick(6);\"></td>");
	document.write("<td width=\"4\"><input type=\"hidden\" name=\"SearchMenuShow\" value=\"0\"></td>");
//	document.write("<td align=\"left\"><img src=\"../Menu/ToolbarIcon/help.gif\" width=\"34\" height=\"30\" border=\"0\" onMouseOver=\"ButtonOver(this,7);\" onMouseOut=\"ButtonOut(this,7)\" onclick=\"ButtonClick(7);\"></td>");
	document.write("<td align=\"left\"><img src=\"../Menu/ToolbarIcon/html.gif\" width=\"34\" height=\"30\" border=\"0\" onMouseOver=\"ButtonOver(this,12);\" onMouseOut=\"ButtonOut(this,12)\" onclick=\"ButtonClick(12);\"></td>");	//html编辑器
	document.write("<td width=\"4\"></td>");
	document.write("<td align=\"left\"><img src=\"../Menu/ToolbarIcon/exit.gif\" width=\"67\" height=\"30\" border=\"0\" onMouseOver=\"ButtonOver(this,8);\" onMouseOut=\"ButtonOut(this,8);\" onclick=\"ButtonClick(8);\"></td>");
	document.write("</tr>");
	document.write("</TBODY>");
	document.write("</table>");
	document.write("</td>");
	document.write("<td width=\"50\"><img src=\"../Menu/ToolbarIcon/logo_v.gif\" width=\"2\" height=\"35\"><img src=\"../Menu/ToolbarIcon/logo.gif\" width=\"48\" height=\"35\"></td>");
	document.write("<td bgcolor=\"#808080\" width=\"1\"></td>");
	document.write("</TR>");
	document.write("<tr>");
	document.write("<td bgcolor=\"#808080\" colspan=\"5\" height=\"1\">");
	document.write("</td>");
	document.write("</tr>");
	document.write("</TBODY>");
	document.write("</table>");	
	
}

//创建工具条
CreateToolsBar();

//-->