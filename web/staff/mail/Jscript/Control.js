 
function GetOffsetTop(objObject)
{
var objParent
 
 intTop = objObject.offsetTop;
 objParent = objObject.offsetParent;
 while(null!=objParent){
  intTop += objParent.offsetTop;
  objParent = objParent.offsetParent;
 }
 return intTop;
}

//调整窗口大小
function window_onresize()
{  
 var intHeight=0;
 if(document.all.divMain){
	intHeight = document.body.offsetHeight - GetOffsetTop(divMain); 
	if(intHeight>40){
		divMain.style.height = document.body.offsetHeight - GetOffsetTop(divMain);
	}
 }
 /*
 if(document.all.divLeft){
	intHeight=document.body.offsetHeight-GetOffsetTop(divLeft);
	if(intHeight>40){
		divLeft.style.height = document.body.offsetHeight - GetOffsetTop(divLeft);
	}
 }
 
 if(document.all.LeftBG){
	LeftBG.style.top=intHeight-147;
	LeftBG.style.visibility="visible";
 }
 */
 
}

//窗口初始化
function window_onload(NoStatus,NoContext,NoSelect)
{ 
  window_onresize(); 
  
  if(NoStatus==null) NoStatus=true;
  if(NoContext==null) NoContext=true;
  if(NoSelect==null) NoSelect=true;  
  
  if(NoStatus) showStatus();  
  if(NoContext) document.oncontextmenu = ShowContextMenu;
  if(NoSelect)
  {
	//document.ondragstart = new Function("return false;");
	//document.onselectstart = new Function("return false;");
  }  
  document.onkeydown = HidenAnyKey;
}

//显示右键菜单
function ShowContextMenu(e)
{		
	/*
	if(document.oncontextmenu)
	{		
		if(window.cswmShowInFrame && document.readyState == 'complete')
		{
			var id="ContextMenu";			
			var x=event.x + document.body.scrollLeft;
			var y=event.y + document.body.scrollTop;
			cswmShowInFrame(id,x ,y);			
			aspnm_hideSelectElements("cswmPopup"+id);			
		}		
	}
	return false;
	*/
}

//屏蔽功能快键
function HidenAnyKey(e)
{ 
	//if (window.event.keyCode==13) return false;									//屏蔽Enter
	if ((window.event.ctrlKey)&&(window.event.keyCode==78)) return false;		//屏蔽Ctrl+N
	if ((window.event.ctrlKey)&&(window.event.keyCode==80))						//屏蔽Ctrl+P
	{
		alert("对不起，本页没有打印功能...");
		return false;
	}
}

//隐藏程序菜单
function HidenMenu()
{
	if(window.cswmShowInFrame && top.main.document.readyState == 'complete')
	{
		cswmHide();
		aspnm_restoreSelectElements();
	}
}

//弹出帮助窗口
function toHelp(HelpID)
{
	var x=document.body.offsetWidth-360;
	var myWin=window.open("../public/Help.aspx?id="+HelpID,"Help","width=300,height=380,top=44,left="+x+",toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no");
	myWin.focus();
}

//弹出窗口
function OpenWin(myUrl,width,height)
{		
	var x=window.screen.availWidth-width-30;
	var myWin=window.open(myUrl,"Fmis0","width="+width+",height="+height+",top=44,left="+x+",toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no");	
	myWin.moveTo(x,44);
	myWin.resizeTo(width,height);
	myWin.focus();

}

var string1="欢迎使用电机厂MarketMIS系统";
//var string2="请您提出宝贵意见或建议";
var string2="";
var string3="技术支持：hanf@myce.net.cn";
var string4="";

var scrtxt=string1;
var lentxt=scrtxt.length;
var k=1;
var width=65;
var pos=1-width;

//显示状态栏信息
function showStatus()
{
	if(k<=3){
		if(k==1){scrtxt=string1;
				lentxt=scrtxt.length;}
		if(k==2){scrtxt=string2;
				lentxt=scrtxt.length;}
		if(k==3){scrtxt=string3;
				lentxt=scrtxt.length;}
		if(k==4){scrtxt=string4;
				lentxt=scrtxt.length;}
	}
	else
	{
		scrtxt=string1;
		lentxt=scrtxt.length;
		k=1;
	}
	
	pos++;
	var scroller=" ";
	//var flag = false;//jackal
	if(pos<0)
	{
		for(var i=1;i<=Math.abs(pos);i++)
		{
			scroller=scroller+" ";
		}
		scroller=scrtxt.substring(0,width-i+1)+scroller;
	}
	else
	{
		for(j=1;j<100;j++){scroller=scroller+" ";}
			for(x=1;x<1000;x++);
			pos=1-width;
			k++;			
		//flag = true;//jackal
	}
	window.status=scroller;
	//if(flag)//jackal
		//setTimeout("showStatus()",4000);
	//else
		setTimeout("showStatus()",40);
}

//禁止在页面上的回车事件(用于表单提交页面)
function BlockFormSubmit(){
	if(typeof(ValidatorOnSubmit) == "function"){		
		Page_BlockSubmit=true;
	}
}