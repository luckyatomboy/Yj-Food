<!--
//The Javascript written by ZHUHO (zhuho2000@sina.com)
//Version 1.0 /2002.11.19	
	
	function SwapButton(id, state)
	{	
		if(state == "on")
			eval("document." + id + "Button.src='MenuIcon/" + id + "ButtonOn.gif'");
		else if(state == "off")
			eval("document." + id + "Button.src='MenuIcon/" + id + "Button.gif'");
		else if(state =="hover")
			eval("document." + id + "Button.src='MenuIcon/" + id + "ButtonHover.gif'");
	}
	
	
	function cswmShow(id)
	{						
		if(GetMenuShow()==0)
		{
			SwapButton(id, 'hover');
		}
		else
		{		
			if(top.main.cswmShowInFrame && top.main.document.readyState == 'complete')
			{
				SwapButton(id, 'on');
				var x=aspnm_pageX(document.all[id+"Button"]);
				top.main.cswmShowInFrame(id,x ,-1);
				top.main.aspnm_hideSelectElements("cswmPopup"+id);
			}
		}
	}
	
	function ResetMenu()
	{
		SetMenuShow(0);
		if(top.main.cswmShowInFrame && top.main.document.readyState == 'complete')
		{			
			top.main.cswmHide();
			top.main.aspnm_restoreSelectElements();			
		}	
	}
	
	function ClickMenu(id)
	{
		SetMenuShow(1);
		cswmShow(id);
	}
	
	function OutMenu(id)
	{
		if(GetMenuShow()==0)
		{
			SwapButton(id, 'off');
		}
	}
	
	function aspnm_pageX(element)
	{
		var x = 0;
		do 
			x += element.offsetLeft;
		while ((element = element.offsetParent));
		return x; 
	}
	
	function GetMenuShow()
	{
		if(document.all["MenuShow"].value==null||document.all["MenuShow"].value=="")
		{
			document.all["MenuShow"].value=0;
		}
		return document.all["MenuShow"].value;	
	}
	
	function SetMenuShow(theValue)
	{
		document.all["MenuShow"].value=theValue;
	}	

	 
//-->