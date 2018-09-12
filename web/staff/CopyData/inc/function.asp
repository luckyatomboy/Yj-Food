<%
Public Function SELVAR(SEL,LASTSELVAR)
   dim S
        Y = Year(now)
	    M = month(now)
		if Len(M) < 2 then M = "0" & M
	    D = day(now)
		if Len(D) < 2 then D = "0" & D
   Select Case SEL
	  Case "FN"
        URL = trim(Request.ServerVariables("SCRIPT_NAME"))
		FN = Right(url, Len(URL) - InStrRev(URL, "/"))
		S = FN
	  Case "YY"
	    S = year(now)
	  Case "MM"
		if Len(M) < 2 then M = "0" & M
		S = M
	  Case "DD"
		if Len(D) < 2 then D = "0" & D
		S = D
	  Case "SaleNum"
		if Len(D) < 2 then D = "0" & D	   
        LastNum = SelectZD("select saleid from sale Order by saleid desc",0)
        if Len(LastNum)< 6 then LastNum = left("00000000",6-len(LastNum+1)) & LastNum+1
	    S = Year(now) & M & D & LastNum
	  Case "thisDate"
	    S = Y & "-" & M & "-" & D
	  Case "DateNum"
	    S = Y & M & D & hour(now) & Minute(Now) 
	  Case "stockNum"
	    if Len(D) < 2 then D = "0" & D	   
        LastNum = SelectZD("select stockmid from stockm Order by stockmid desc",0)
        if Len(LastNum)< 6 then LastNum = left("00000000",6-len(LastNum+1)) & LastNum+1
	    S = Year(now) & M & D & LastNum

   End Select
   SELVAR = S
End Function


Function SOBJ(n,ServerObj)
         On Error Resume Next
         dim ServerObject(18)
         ServerObject(0)  = "MSWC.AdRotator"
         ServerObject(1)  = "MSWC.BrowserType"
         ServerObject(2)  = "MSWC.NextLink"
         ServerObject(3)  = "MSWC.Tools"
         ServerObject(4)  = "MSWC.Status"
         ServerObject(5)  = "MSWC.Counters"
         ServerObject(6)  = "IISSample.ContentRotator"
         ServerObject(7)  = "IISSample.PageCounter"
         ServerObject(8)  = "MSWC.PermissionChecker"
         ServerObject(9)  = "Scripting.FileSystemObject"
         ServerObject(10) = "adodb.connection"
         ServerObject(11) = "SoftArtisans.FileUp"
         ServerObject(12) = "SoftArtisans.FileManager"
         ServerObject(13) = "JMail.SMTPMail"
         ServerObject(14) = "CDONTS.NewMail"
         ServerObject(15) = "Persits.MailSender"
         ServerObject(16) = "LyfUpload.UploadFile"
         ServerObject(17) = "Persits.Upload.1"
		 ServerObject(18) = "ADODB.Stream"
		 SOBJ = False
		 Set ServerObj = Server.CreateObject(ServerObject(n))
		 if Err = 0 then 
		    SOBJ = true
		 else
		    Err.Clear
		 end if
End Function




Sub Create_Folder(PATH_NAME)
    if not Right(PATH_NAME,1) = "/" then PATH_NAME = PATH_NAME & "/"
	if SOBJ(9,ServerObj) = false then
	else
	    if ServerObj.FolderExists(Server.MapPath(PATH_NAME)) = False Then 
           F_PATHA = split(PATH_NAME,"/")
           F_PATHB = F_PATHA(0)
		   For i_FPATH = 0 to (ubound(F_PATHA))
			   if i_FPATH = 0 then F_PATHC = F_PATHB else F_PATHC = F_PATHC & "\" & F_PATHA(i_FPATH)
				  if not i_FPATH = ubound(F_PATHA) then
				     if ServerObj.FolderExists(Server.MapPath(F_PATHC)) = False Then ServerObj.CreateFolder(Server.MapPath(F_PATHC))
				  end if
		   next
        end if
	end if
    Set ServerObj = Nothing
End Sub

'***************************************************************************************************
Function StrLen(textStr,textLen,ShowLast)
         ShowLast = ShowLast
         if ShowLast = "" then ShowLast = "…"
         if Len(textStr) > textLen then 
		    textStr = Left(textStr,textLen)&ShowLast
		 else
		    textStr = textStr
		 end if
		 StrLen = textStr
End Function
'***************************************************************************************************
Public SupplierinfoArr 
SupplierinfoArr = array(USuid, USCode, USForShort , USHelpMarkCode, USFullName , USLinkman , USPlace , USLinkPhone , USmobileTelehone , USfax , USEmail , USArrearageTime , USArrearageTether , USBankNumber , USWebSite , USScopeOfOperation , USAddress , USdisabled , USPriceType , USutypeid , USregtime , USlasttime , USRemark)

Public AdmininfoArr
AdmininfoArr = array(AAid , ALoginid , ALoginPassWord , ATrueName , APcNum , APlace , APhone , AMobileTelephone , AWebsite , AEmail , AZip , AIdCard , ABirthday , ANativePlace , AFolk , ASex , AMarital , APassDegree , AFlag , ARank , AAddress , Adisabled , AAtypeid , ARegtime , Alasttime , ARemark )

Public mArray
mArray = array(Mstockid , Misstockid , MstockNum , Msupplierid , Mmtypeid , MCode , McName , Mmodel , MeName , MeRemark , McRemark , MtypeCode , MQuality , Minprice , Moutprice , Minhow , Munit , Mtotal , Minpayment , Mintotime , Mupdatetime , MguarantyTime , MguarantyRemark , MstockMax , MstockMin , MthisDate , Maid , Mauid , Mdisabled , MinModel )

CLASS CL01
   Public us 
   Private Sub Class_Initialize()
     Set us   = Server.CreateObject("Adodb.RecordSet" )
   End Sub
   Public function Supplierinfo
      us.Open(SQL),Conn,1,3
	     if not us.eof then
		    USuid = us("uid")
		    USCode = us("Code")'代码
		    USForShort = us("ForShort")'简称
		    USHelpMarkCode = us("HelpMarkCode")'助记码
		    USFullName = us("FullName")'全称
		    USLinkman = us("Linkman")'联系人
		    USPlace = us("Place")'职位
		    USLinkPhone = us("LinkPhone")'联系电话
		    USmobileTelehone = us("mobileTelehone")'手机
		    USfax = us("fax")'
		    USEmail = us("Email")'
		    USArrearageTime = us("ArrearageTime")'欠款期限
		    USArrearageTether = us("ArrearageTether")'欠款限额
		    USBankNumber = us("BankNumber")'银行帐号
            USWebSite = us("WebSite")'网址
            USScopeOfOperation = us("ScopeOfOperation")'经营范围
            USAddress = us("Address")'详细地址
            USdisabled = us("disabled")'是否可用
            USPriceType = us("PriceType")'价格类型
            USutypeid = us("utypeid")'注册到-相应id
			USregtime = us("regtime")'注册时间
			USlasttime = us("lasttime")'最后活动时间
			USRemark = us("Remark")'备注
		else
		    USutypeid = 0
		    USuid = 0
			USLinkman = "未知"
		end if
		us.Close
   End function


   Public function Admininfo
      us.Open(SQL),Conn,1,3
	     if not us.eof then
		  AAid = us("aid")
		  ALoginid = us("Loginid")'登陆名
		  ALoginPassWord = us("LoginPassWord")'登陆密码
		  ATrueName = us("TrueName")'真名
		  APcNum = us("PcNum")'电脑编号
		  APlace = us("Place")'职位
		  APhone = us("Phone")'联系电话
		  AMobileTelephone = us("MobileTelephone")'移动电话
		  AWebsite = us("Website")'网址
		  AEmail = us("Email")'Email
		  AZip = us("Zip")'邮编

		  AIdCard = us("IdCard")'身份证
		  ABirthday = us("Birthday")'生日
		  ANativePlace = us("NativePlace")'籍贯
		  AFolk = us("Folk")'民族
		  ASex = us("Sex")'
		  AMarital = us("Marital")'婚姻否
		  APassDegree = us("PassDegree")'学位
		  AFlag = us("Flag")'权限
		  ARank = us("Rank")'等级

		  AAddress = us("Address")'详细地址
		  Adisabled = us("disabled")'是否可用
		  AAtypeid = us("Atypeid")
		  ARegtime = us("Regtime")
		  Alasttime = us("lasttime")
		  ARemark = us("Remark")'备注
		else
		    AAid = 0
		end if
		us.Close
   End function




   Public function mArray
      us.Open(SQL),Conn,1,3
	     if not us.eof then
		  Mstockid = us("stockid")'
		  Misstockid = us("isstockid")'相关主记录id
		  MstockNum = us("stockNum") '进货号
          Msupplierid = isNumber(us("supplierid"),"int",0)'相应供应商id
          Mmtypeid = isNumber(us("mtypeid"),"int",0)'所属商品类别id
          MCode = us("Code")'代码
          McName = us("cName")'中文名
		  Mmodel = us("model")'型号
          MeName = us("eName")'英文名
          MeRemark = us("eRemark")'英文备注
          McRemark = us("cRemark")'中文备注
          MtypeCode = us("typeCode")'型号条码
		  MQuality = us("Quality") '性质
          Minprice = us("inprice")'参考进货价
          Moutprice = us("outprice")'参考预出售价
          Minhow = us("inhow")'数量
          Munit = us("unit")'单位
          Mtotal = us("total")'总价格
          Minpayment = us("inpayment")'已支付给供应商
          Mintotime = us("intotime")'进货时间
          Mupdatetime = us("updatetime")'最后修改时间
          MguarantyTime = us("guarantyTime")'保修期
          MguarantyRemark = us("guarantyRemark")'保修期备注
          MstockMax = us("stockMax")'库存上限
          MstockMin = us("stockMin")'库存下限
          MthisDate = us("thisDate")'
          Maid = isNumber(us("aid"),"int",0)'
          Mauid = isNumber(us("auid"),"int",0)'
          Mdisabled = isNumber(us("disabled"),"int",0)'
          MinModel = us("inModel")'入库模式-是直接录入或销售时同步录入
		else
		    Mmtypeid = 0
		    Mstockid = 0
			Misstockid = 0
			Msupplierid = 0
		end if
		us.Close
   End function

   Public function HtmlF(val)
      if isnull(val) or val = "" then exit function
      HtmlF = Replace(Replace(val,"<br/>",chr(13)),"&nbsp;"," ")
   end function


   Public Function splitList(inv,sgin,lastsplitList)
    if isNull(inv) or inv = "" then 
	   splitList = lastsplitList
	   exit function
	end if
    invReplace = Replace(inv," ","")
	splitinv = Split(invReplace,sgin)
	invUbound = UBound(splitinv)
    for i_sp = 0 to invUbound
	    Oneinv = isNumber(splitinv(i_sp),"int",0)
		if not i_sp = invUbound then  Oneinv = Oneinv & "," else Oneinv = Oneinv
		Oneinv_ = Oneinv_ & Oneinv
    next
	splitList = Oneinv_
   End Function




   Private Sub Class_Terminate()
		if isobject(us) then Set us = nothing
   End Sub
End CLASS


Public function classagin(aName,val)
     dim c , ed0 , ed1
	 if val = 0 then ed0 = " selected = 'selected' style = 'color:red;' " else ed0 = ""
	 if val = 1 then ed1 = " selected = 'selected' style = 'color:red;' " else ed1 = ""
	 c = "<select name = '" & aName & "' size = '1'>"
	 c = c & "<option value = '0' " & ed0 & ">客户</option>"
	 c = c & "<option value = '1' " & ed1 & ">商家</option>"
	 c = c & "</select>"
	 classagin = c
end function

Function DateSearch(DateStar,DateEnd,DateSQL,Dateindex,Dateinfo)
    DateStar = trim(Request("DateStar"))
	DateEnd = trim(Request("DateEnd"))
	if isDate(DateStar) = true and isDate(DateEnd) = true then
	   DateSQL = " and (thisDate Between '" & DateStar & "' and '" & DateEnd & "') "
	   Dateinfo = "从 " & DateStar &" 到 " & DateEnd 
	else
	   dim YY , MM , DD
	       YY = Year(now)
		   MM = month(now):if Len(MM) < 2 then MM = "0" & MM
		   DD = day(now):if Len(DD) < 2 then DD = "0" & DD
		   SELD = YY & "-" & MM & "-" & DD
		   SELM = YY & "-" & MM
		   SELY = YY
	   SELECT CASE Dateindex
	      Case "D"
		      DateSQL = " and left(thisDate,10) = '" & SELD & "'"
			  Dateinfo = YY & "年" & MM & "月" & DD & "日"
		  Case "M"
		      DateSQL = " and left(thisDate,7) = '" & SELM & "'"
			  Dateinfo = YY & "年" & MM & "月"
		  Case "Y"
		      DateSQL = " and left(thisDate,4) = '" & SELY & "'"
			  Dateinfo = YY & "年"
		  Case "ALL"
		      DateSQL = ""
			  Dateinfo = "全部"
	   End Select
	end if
End Function



Public function htmlencode(str,selhtml)
    if not selhtml = "Y" then 
	   htmlencode = str
	   exit function
	end if

    dim result
    dim l
    if isNULL(str) then 
       htmlencode=""
       exit function
    end if
    l=len(str)
    result=""
	dim i
	for i = 1 to l
	    select case mid(str,i,1)
	           case "<"
	                result=result&"&lt;"
	           case ">"
	                result=result&"&gt;"
               case chr(13)
	                result=result&"<br/>"
	           case chr(34)
	                result=result&"&quot;"
	           case "&"
	                result=result&"&amp;"
               case chr(32)	           
	                'result=result&"&nbsp;"
	                if i+1<=l and i-1>0 then
	                   if mid(str,i+1,1)=chr(32) or mid(str,i+1,1)=chr(9) or mid(str,i-1,1)=chr(32) or mid(str,i-1,1)=chr(9)  then	                      
	                      result=result&"&nbsp;"
	                   else
	                      result=result&" "
	                   end if
	                else
	                   result=result&"&nbsp;"	                    
	                end if
	           case chr(9)
	                result=result&"    "
	           case else
	                result=result&mid(str,i,1)
         end select
       next 
       htmlencode=result
end function





















Public AboutDateSelect
       AboutDateSelect = array(Byear , Bmonth , Bday , Bin , Eyear , Emonth , Eday , Ein , DATE_INDEX , SearchYmd , Bymd , Eymd , DATE_SQL , DATE_INFO )
Public Function DateSelect(AboutDateSelect)
   Byear = trim(GetText(Byear & Bin,"G","number",4,4,"none"))
   if Len(Byear) < 4 then Byear = "20" & Byear
   Bmonth = trim(GetText(Bmonth & Bin,"G","number",1,2,"none"))
   if Len(Bmonth) < 2 then Bmonth = "0" & Bmonth
   Bday = trim(GetText(Bday & Bin,"G","number",1,2,"none"))
   if Len(Bday) < 2 then Bday = "0" & Bday

   Eyear = trim(GetText(Eyear & Ein,"G","number",4,4,"none"))
   if Len(Eyear) < 4 then Eyear = "20" & Eyear
   Emonth = trim(GetText(Emonth & Ein,"G","number",1,2,"none"))
   if Len(Emonth) < 2 then Emonth = "0" & Emonth
   Eday = trim(GetText(Eday & Ein,"G","number",1,2,"none"))
   if Len(Eday) < 2 then Eday = "0" & Eday

   THIS_YEAR = YEAR(NOW)
   THIS_MONTH = MONTH(NOW):if Len(THIS_MONTH) < 2  then THIS_MONTH = "0" & THIS_MONTH
   THIS_DAY = DAY(NOW):if Len(THIS_DAY) < 2 then THIS_DAY = "0" & THIS_DAY
   
   SearchYmd = trim(Request("SearchYmd"))
   if SearchYmd = "YES" then
      dim RBymd , BEymd 
      RBymd = trim(Request("Bymd"))
	  REymd = trim(Request("Eymd"))
      if isDate(RBymd) and isDate(REymd) then
         Bymd = RBymd
		 Eymd = REymd

		 Byear = SplitAbout(Bymd,"-",0,"20")
		 Bmonth = SplitAbout(Bymd,"-",1,"0")
		 Bday = SplitAbout(Bymd,"-",2,"0")

		 Eyear = SplitAbout(Eymd,"-",0,"20")
		 Emonth = SplitAbout(Eymd,"-",1,"0")
		 Eday = SplitAbout(Eymd,"-",2,"0")

	  	 DATE_SQL = " and (thisDate Between '" & Bymd & "' and '" & Eymd & "') "
	     DATE_INFO = "从" & Bymd & "至" & Eymd & ""
	  else
         Bymd = Byear & "-" & Bmonth & "-" & Bday
         Eymd = Eyear & "-" & Emonth & "-" & Eday
	     DATE_SQL = " and (thisDate Between '" & Bymd & "' and '" & Eymd & "') "
	     DATE_INFO = "从" & Bymd & "至" & Eymd & ""
	  end if
   else
 	  DATE_SQL = ""
	  Select Case DATE_INDEX
		 Case "Y"
		   DATE_SQL = " and left(thisDate,4) = '" & THIS_YEAR & "'"
		   DATE_INFO = THIS_YEAR & "年"
		 Case "M"
		   DATE_SQL = " and left(thisDate,7) = '" & THIS_YEAR & "-" & THIS_MONTH & "'"
		   DATE_INFO = THIS_YEAR & "年" & THIS_MONTH & "月"
		 Case "D"
		   DATE_SQL = " and left(thisDate,11) = '" & THIS_YEAR & "-" & THIS_MONTH & "-" & THIS_DAY & "'"
		   DATE_INFO = THIS_YEAR & "年" & THIS_MONTH & "月" & THIS_DAY & "日"
	  End Select
  end if
End Function





Public Function Check(BadStr,inputStr,viewBadStr,mode)
         valLen = Len(inputStr)
		 BadLen = Len(BadStr)
		 vieLen = Len(viewBadStr)

		 For i_C = 1 to valLen
			     inputS = mid(inputStr,i_C,1)

		     For i_B = 1 to BadLen
				 inBadS  = mid(BadStr,i_B,1)
				 viBadS =  mid(viewBadStr,i_B,1)

				 Select Case mode
				        Case "0"
				             if inputS = inBadS then inputS = viBadS else inputS = inputS end if
						Case "1"
						     if inputS = inBadS then inputS = viewBadStr
				 End Select
			 Next

				 inputStrA = inputStrA & inputS
		 Next

		 Check = inputStrA
End Function



Public Function usertype(SQL,Rusertypeid,boxWidth,boxName,uTypeALL)
  if boxWidth = "" then boxWidth = 100
  Set uRst = Server.CreateObject("Adodb.RecordSet")
	  uRst.Open(SQL),Conn,1,1
		  if not uRst.eof then
			 dim utypeWrite
			 utypeWrite = "<select name = '" & boxName & "' style = 'width:" & boxWidth & "'>"
			 for i_ut = 1 to uRst.RecordCount
				 if uRst.eof then Exit for
				 utypeid = uRst("utypeid")
				 uTypeName = uRst("uTypeName")
				 
				 uopt = uopt & "<option value = '" & utypeid & "' " & v1v2(utypeid,Rusertypeid," style = 'color:red;' selected = 'selected' ","") & ">" & uTypeName & "</option>"
				 uRst.movenext
			 next
		  else
		  end if
		  uRst.Close
		  Set uRst = Nothing
		  if utypeALL = "view" then utALL = "<option value = '0' " & v1v2(0,Rtypeid," style = 'color:red;' selected = 'selected' ","") & ">全部类别</option>" else tALL = ""
		  usertype = utypeWrite & uopt & utALL & "</select>"
End Function


Public Function admintype(SQL,RAtypeid,boxWidth,boxName,ATypeALL)
  if boxWidth = "" then boxWidth = 100
  Set aRst = Server.CreateObject("Adodb.RecordSet")
	  aRst.Open(SQL),Conn,1,1
		  if not aRst.eof then
			 dim atypeWrite
			 atypeWrite = "<select name = '" & boxName & "' style = 'width:" & boxWidth & "'>"
			 for i_at = 1 to aRst.RecordCount
				 if aRst.eof then Exit for
				 Atypeid = aRst("Atypeid")
				 ATypeName = aRst("ATypeName")
				 
				 aopt = aopt & "<option value = '" & Atypeid & "' " & v1v2(Atypeid,RAtypeid," style = 'color:red;' selected = 'selected' ","") & ">" & ATypeName & "</option>"
				 aRst.movenext
			 next
		  else
		  end if
		  aRst.Close
		  Set aRst = Nothing
		  if AtypeALL = "view" then AtALL = "<option value = '0' " & v1v2(0,RAtypeid," style = 'color:red;' selected = 'selected' ","") & ">全部类别</option>" else tALL = ""
		  admintype = atypeWrite & aopt & atALL & "</select>"
End Function


Public Function mtype(SQL,Rmtypeid,boxWidth,boxName,ATypeALL)
  if boxWidth = "" then boxWidth = 100
  Set mRst = Server.CreateObject("Adodb.RecordSet")
	  mRst.Open(SQL),Conn,1,1
		  if not mRst.eof then
			 dim mtypeWrite
			 mtypeWrite = "<select name = '" & boxName & "' style = 'width:" & boxWidth & "'>"
			 for i_mt = 1 to mRst.RecordCount
				 if mRst.eof then Exit for
				 mtypeid = mRst("mtypeid")
				 mTypeName = mRst("mTypeName")
				 
				 mopt = mopt & "<option value = '" & mtypeid & "' " & v1v2(mtypeid,Rmtypeid," style = 'color:red;' selected = 'selected' ","") & ">" & mTypeName & "</option>"
				 mRst.movenext
			 next
		  else
		  end if
		  mRst.Close
		  Set mRst = Nothing
		  if mtypeALL = "view" then mtALL = "<option value = '0' " & v1v2(0,Rmtypeid," style = 'color:red;' selected = 'selected' ","") & ">全部类别</option>" else tALL = ""
		  mtype = mtypeWrite & mopt & mtALL & "</select>"
End Function





Public Function usertypeSub(SQL,Rusertypeid,boxWidth,boxName,uTypeALL)
  if boxWidth = "" then boxWidth = 100
  Set uRst = Server.CreateObject("Adodb.RecordSet")
  Set uRst_ = Server.CreateObject("Adodb.RecordSet")
	  uRst.Open(SQL),Conn,1,1
		  if not uRst.eof then
			 dim utypeSubWrite
			 Response.Write"<select name = '" & boxName & "' style = 'width:" & boxWidth & "' >"
			 for i_ut = 1 to uRst.RecordCount
				 if uRst.eof then Exit for
				 utypeid = uRst("utypeid")
				 uTypeName = uRst("uTypeName")
				 uTypeSelect = uRst("uTypeSelect")
				 
				 Response.Write"<option value = '' style = 'color:blue;'>" & uTypeName & "</option>"
				 uRst_.Open("select * from usertype where uTypeSelect = " & utypeid & ""),Conn,1,1
				 if not uRst_.eof then
				    for i_ut_ = 1 to uRst_.RecordCount
					    if uRst_.eof then exit for
				           utypeid_ = uRst_("utypeid")
				           uTypeName_ = uRst_("uTypeName")
				           uTypeSelect_ = uRst_("uTypeSelect")
						   utypeidSelected = v1v2(utypeid_,Rusertypeid," style = 'color:red;' selected = 'selected' " , "")
						   Response.Write"<option value = '" & utypeid_ & "' " & utypeidSelected & ">　" & uTypeName_ & "</option>"
				        uRst_.movenext
					next
				 else
				 end if
				        uRst_.Close
				 uRst.movenext
			 next
		  else
		  end if
		  uRst.Close
		  Set uRst = Nothing
		  Set uRst_ = Nothing
		  if utypeALL = "view" then utALL = "<option value = '0' " & v1v2(0,Rtypeid," style = 'color:red;' selected = 'selected' ","") & ">全部类别</option>" else tALL = ""
		  Response.Write utALL & "</select>"
End Function






Public Function admintypeSub(SQL,Radmintypeid,boxWidth,boxName,uTypeALL)
  if boxWidth = "" then boxWidth = 100
  Set aRst = Server.CreateObject("Adodb.RecordSet")
  Set aRst_ = Server.CreateObject("Adodb.RecordSet")
	  aRst.Open(SQL),Conn,1,1
		  if not aRst.eof then
			 dim AtypeSubWrite
			 Response.Write"<select name = '" & boxName & "' style = 'width:" & boxWidth & "' >"
			 for i_at = 1 to aRst.RecordCount
				 if aRst.eof then Exit for
				 Atypeid = aRst("Atypeid")
				 ATypeName = aRst("ATypeName")
				 ATypeSelect = aRst("ATypeSelect")
				 
				 Response.Write"<option value = '' style = 'color:blue;'>" & ATypeName & "</option>"
				 aRst_.Open("select * from admintype where ATypeSelect = " & Atypeid & ""),Conn,1,1
				 if not aRst_.eof then
				    for i_at_ = 1 to aRst_.RecordCount
					    if aRst_.eof then exit for
				           Atypeid_ = aRst_("Atypeid")
				           ATypeName_ = aRst_("ATypeName")
				           ATypeSelect_ = aRst_("ATypeSelect")
						   AtypeidSelected = v1v2(Atypeid_,Radmintypeid," style = 'color:red;' selected = 'selected' " , "")
						   Response.Write"<option value = '" & Atypeid_ & "' " & AtypeidSelected & ">　" & ATypeName_ & "</option>"
				        aRst_.movenext
					next
				 else
				 end if
				        aRst_.Close
				 aRst.movenext
			 next
		  else
		  end if
		  aRst.Close
		  Set aRst = Nothing
		  Set aRst_  =Nothing
		  if AtypeALL = "view" then AtALL = "<option value = '0' " & v1v2(0,Radmintypeid," style = 'color:red;' selected = 'selected' ","") & ">全部类别</option>" else AALL = ""
		  Response.Write AtALL & "</select>"
End Function




Public Function mtypeSub(SQL,Rmtypeid,boxWidth,boxName,mTypeALL)
  if boxWidth = "" then boxWidth = 100
  Set mRst = Server.CreateObject("Adodb.RecordSet")
  Set mRst_ = Server.CreateObject("Adodb.RecordSet")
	  mRst.Open(SQL),Conn,1,1
		  if not mRst.eof then
			 dim mtypeSubWrite
			 Response.Write"<select name = '" & boxName & "' style = 'width:" & boxWidth & "' >"
			 for i_mt = 1 to mRst.RecordCount
				 if mRst.eof then Exit for
				 mtypeid = mRst("mtypeid")
				 mTypeName = mRst("mTypeName")
				 mTypeSelect = mRst("mTypeSelect")
				 
				 Response.Write"<option value = '' style = 'color:blue;'>" & mTypeName & "</option>"
				 mRst_.Open("select * from mtype where mTypeSelect = " & mtypeid & ""),Conn,1,1
				 if not mRst_.eof then
				    for i_mt_ = 1 to mRst_.RecordCount
					    if mRst_.eof then exit for
				           mtypeid_ = mRst_("mtypeid")
				           mTypeName_ = mRst_("mTypeName")
				           mTypeSelect_ = mRst_("mTypeSelect")
						   mtypeidSelected = v1v2(mtypeid_,Rmtypeid," style = 'color:red;' selected = 'selected' " , "")
						   Response.Write"<option value = '" & mtypeid_ & "' " & mtypeidSelected & ">　" & mTypeName_ & "</option>"
				        mRst_.movenext
					next
				 else
				 end if
				        mRst_.Close
				 mRst.movenext
			 next
		  else
		  end if
		  mRst.Close
		  Set mRst = Nothing
		  Set mRst_  =Nothing
		  if mtypeALL = "view" then mtALL = "<option value = '0' " & v1v2(0,Rmtypeid," style = 'color:red;' selected = 'selected' ","") & ">全部类别</option>" else mALL = ""
		  Response.Write mtALL & "</select>"
End Function








Public Function PriceTypeList(BoxName,PriceType,RPriceType)
       PriceTypeList = "" & _
	     "<select name = '" & BoxName & "'>" & _
		 "<option value = '1' " & v1v2(1,RPriceType," style = 'color:red;' selected = 'selected' ","") & ">价格类型一</option>" & _
		 "<option value = '2' " & v1v2(2,RPriceType," style = 'color:red;' selected = 'selected' ","") & ">价格类型二</option>" & _
		 "<option value = '3' " & v1v2(3,RPriceType," style = 'color:red;' selected = 'selected' ","") & ">价格类型三</option>" & _
		 "<option value = '4' " & v1v2(4,RPriceType," style = 'color:red;' selected = 'selected' ","") & ">价格类型四</option>" & _
		 "</select>"
End Function


Public function financeType_(SQL,BoxName,boxW,RfinanceType)
   dim fRs , i_fRs , f , f_
   if boxW = "" then boxW = "auto"
   Set fRs = Server.CreateObject("Adodb.RecordSet")
   
       fRs.Open(SQL),Conn,1,1
	       if not fRs.eof then
		      f = "<select name = '" & BoxName & "' style = 'width:" & boxW & ";'>"
		      for i_fRs = 1 to fRs.RecordCount
		      ftypeid_ = fRs("ftypeid")
			  if RfinanceType = ftypeid_ then fSelected = " style = 'color:red;' checked = 'true' " else fSelected = ""
			      f_ = f_ & "<option value = '" & ftypeid_ & "' " & fSelected & ">" & fRs("ftypeName") & "</option>"
				  fRs.movenext
			  next
			  financeType_ = f & f_ & "</select>"
		   else
		      financeType_ = "<span style = 'color:red;'>请在类别管理添加一个财务类别</span>"
		   end if
		   fRs.Close
		   Set fRs = Nothing
end function
			      


Public Function Logining(Loginid,LoginPass,gourl)
       BadStr = "[［］]`~!@#$%^&*()_-+=|\	<>/?'"""
       viewBadStr = "LL］]｀~！＠＃＄％＾＆＊（）＿－＋＝｜＼ 〈〉／？’”"
       Loginid = Check(BadStr,trim(Request("Loginid")),viewBadStr,"0")
       LoginPass = Check(BadStr,trim(Request("LoginPassWord")),viewBadStr,"0")
	   SQL = "select * from admins where Loginid = '" & Loginid & "' and LoginPassWord = '" & Loginpass & "'"
	   'Server.Transfer gourl
	   Rs.Open(SQL),conn,1,3
	      if not Rs.eof then
		     Session("Seuid_inc") = Rs("aid")
			 Session("Seloginid_inc") = Rs("loginid")
			 Session("SeTrueName_inc") = Rs("TrueName")
		     Session("Sepass_inc") = Rs("LoginPassWord")
		     Session("SeFlag_inc") = Rs("Flag")
			 Session("SeRank_inc") = Rs("Rank")
			 Rs("lasttime") = now()
			 Rs.update
			 Response.Redirect gourl & "?info=登陆成功．请稍候…"
		  else
			 Response.Redirect gourl & "?info=错误的用户名或密码！"
			 Exit function
		  end if
	   Rs.Close
End Function


Seuid_inc = isNumber(Session("Seuid_inc"),"int",0)
Seloginid_inc = Session("Seloginid_inc")
SeTrueName_inc = Session("SeTrueName_inc")
Sepass_inc = Session("Sepass_inc")
SeFlag_inc = Session("SeFlag_inc")
SeRank_inc = isNumber(Session("SeRank_inc"),"int",1000)


'thisFlag
'SessionFlag 用户字段的flag
'sgin 分隔符
Public Function AdminSelFlag(thisFlag,sgin)
   AdminSelFlag = false
   dim SessionFlag
   SessionFlag = SelectZD("select flag from admins where aid = " & Seuid_inc & "","")
   if isnull(SessionFlag) or SessionFlag = "" then 
      exit function
   end if
   SessionFlagSplit = Split(Replace(SessionFlag," ",""),sgin)
   SessionFlagUbound = Ubound(SessionFlagSplit)
   for iFlag = 0 to SessionFlagUbound
       if SessionFlagSplit(iFlag) = thisFlag then
	      AdminSelFlag = true
		  exit function
	   else
	      AdminSelFlag = false
	   end if
    next
end Function
   




Public Function isLogin
    isLogin = true
    if isNumber(Seuid_inc,"int",0) = 0 then exit function
	isLogin = true
End Function

Public Function Logouting
       SQL = "update admins set lasttime = '" & now() & "' where aid = " & isNumber(Seuid_inc,"int",0) & ""
       Conn.Execute(SQL)
	   Session.Abandon
	   Logouting = viewinfo("divLoca","您已经成功退出！请稍候…","index.asp")
End Function











Public Function DataCount(SQL,DataCountLast)
         DataCount = conn.Execute(SQL)(0)
		 if DataCount = "" or isnull(DataCount) or isNumeric(DataCount) = false then DataCount = DataCountLast
End Function

Public Function SplitAbout(vin,boxoff,list,lastSplitAbout)
   if isnull(vin) or vin = "" then 
      SplitAbout = lastSplitAbout
      Exit Function
   end if
   Splitvin = Split(vin,boxoff)
   vinUBound = UBound(Splitvin)
   if list > vinUBound then 
      SplitAbout = lastSplitAbout
      Exit Function
   end if
   SplitAbout = Splitvin(list)
End Function



Public Function ButtonExecute(formname,Btype,Bvalue,Exevalue,alertBox)
       if not alertBox = "" then alertBox_ = ""
       ButtonExecute = "<input type = '" & Btype & "' value = '" & Bvalue & "' onclick = ""javascript:" & alertBox_ & " " & formname & ".Options.value = '" & Exevalue & "';"">"
End Function


'### List 批量操作
Public Function selAnnounceList(selAnnounce)
       selAnnounce = trim(Request.Form(selAnnounce))
       if not (selAnnounce) = "" then
	      dim idReplace , idSplit , idUBound , i_ , iList_
	      idReplace = Replace(selAnnounce," ","")
		  idSplit = Split(idReplace,",")
		  idUBound = UBound(idSplit)
		  For i_ = 0 to idUBound
		      if not i_ = idUBound then iList = isNumber(idSplit(i_),"int",0) & "," else iList = isNumber(idSplit(i_),"int",0)
			  iList_ = iList_ & iList 
		  next
	   else
	      iList_ = false
	   end if
       selAnnounceList = iList_
End Function
'###



Public function isNumber(val,sel,isNumberLast)
 if isNumeric(val) = false or len(val) > 200 or val = "" then
    isNumber = isNumberLast
	exit function
 end if
 val = cstr(val)
 dim isNumberLen , val_
     isNumberLen = "0123456789"
	 val_ = Replace(val,"-","")
 select case sel
	case "int"
	   valLen = len(val_)
	   for iisNum = 1 to valLen
		   if inStr(isNumberLen,mid(val_,iisNum,1)) = 0 then
			  isNumber = isNumberLast
			  exit function
		   else
			  isNumber = val
		   end if
	   next
	case "dec"
	   valdec = Replace(val_,".","")
	   valLen = len(valdec)
	   for iisNum = 1 to valLen
		   if inStr(isNumberLen,mid(valdec,iisNum,1)) = 0 then
			  isNumber = isNumberLast
			  exit function
		   else
			  isNumber = val
		   end if
	   next	
 end select
 if csng(isNumber) < 0 then isNumber = -(abs(isNumber)) else isNumber = abs(isNumber)
 if inStrRev(isNumber,".") = 1 then isNumber = "0" & isNumber
End function

'Public function isNumber(val,sel,isNumberLast)
' if isnull(val) or val = "" then 
'	isNumber = isNumberLast
'	exit function
' end if
'
' if inStrRev(val,"-")>1 then 
'	isNumber = isNumberLast
'	Exit Function
' end if
'
' val_ = Replace(val,"-","")
' select case sel
'	case "int"
'	   valLen = len(val_)
'	   for iisNum = 1 to valLen
'		   if isnumeric(mid(val_,iisNum,1)) = false then
'			  isNumber = isNumberLast
'			  exit function
'		   else
'			  isNumber = val
'		   end if
'	   next
'	case "dec"
'	   if UBound(Split(val_,".")) > 1 then
'		  isNumber = isNumberLast
'		  exit function
'	   end if
'	   val__ = Replace(val_,".","")
'	   valLen = len(val__)
'	   for iisNum = 1 to valLen
'		   if isnumeric(mid(val__,iisNum,1)) = false then
'			  isNumber = isNumberLast
'			  exit function
'		   else
'			  isNumber = val
'		   end if
'	   next	
' end select
' if csng(isNumber) < 0 then isNumber = -(abs(isNumber)) else isNumber = abs(isNumber)
' if inStrRev(isNumber,".") = 1 then isNumber = "0" & isNumber
'End function




Public Function GetText(Textname,selgp,selstr,minLen,maxLen,lastGetText)
         if lastGetText = "" then lastGetText = "…"
		 if lastGetText = "none" then lastGetText = " "
		 dim Textname_
		 Textname_ = trim(Request(Textname))
         if selgp = "P" then Textname_ = trim(Request.form(Textname))
		 Select case selstr
		    case "Str",""
			  if Len(Textname_) < minLen or Len(Textname_) > maxLen then Textname_ = lastGetText
			case "number"
			  Textname_ = isNumber(Textname_,"dec",lastGetText)
			  if Len(Textname_) < minLen or Len(TextStr) > maxLen then Textname_ = lastGetText
         End Select
		 GetText = Textname_
End Function

Public Function SelectZD(SQL,SelectZDLast)
         Set SZ = conn.Execute(SQL)
	         if not SZ.eof then
			    SelectZD = trim(SZ(0))
			 else
			    SelectZD = SelectZDLast
			 end if
			 if SelectZD = "" or isnull(SelectZD) then SelectZD = SelectZDLast
		 SZ.Close
		 Set SZ = Nothing
End Function





'选择多字段
'SQL = "select uid,userLoginid,userName from TABuserList "
'Public ZD(2)
'Call SAZD(SQL,ZD,"SAZDLast")
'Response.Write ZD(0)
'Response.Write ZD(1)
'Response.Write ZD(2)
Public Function SAZD(SQL,ZD,SAZDLast)
    dim SZ
    Set SZ = Conn.Execute(SQL)
	if SZ.eof then
	   for iSAZD = 0 to Ubound(ZD) 
	       ZD(iSAZD) = SAZDLast 
	   next
	else
	   for iSAZD = 0 to Ubound(ZD)
		   ZD(iSAZD) = trim(SZ(iSAZD))
		   if isnull(ZD(iSAZD)) or ZD(iSAZD) = "" then ZD(iSAZD) = SAZDLast
	   next
    end if
	SZ.Close
	Set SZ = Nothing
End Function









Public Function viewinfo(sel,info,gourl)
     dim ST , SE
	     ST = "<script type = 'text/javascript'>"
		 SE = "</script>"
     Select case sel
	    case "alertBack"
		     vi = " alert('" & info & "');history.go(-1); "
		case "alertLoca"
		     vi = " alert('" & info & "');location.href = '" & gourl & "'; "
		case "Location"
             vi = "location.href = '" & gourl & "';"
		case "LocaparentTime"
             vi = "setTimeout('parent.location.href = \'" & gourl & "\'',2000);"
	    case "alertClose"
		     vi = "alert('" & info & "');window.close();"
	    case "divLoca"
		     vi = "var BW = document.body.clientWidth ;var BH = document.body.clientHeight ;" & _
			      "document.write(""<div style='position: absolute; left:""+((BW-300)/2)+""px;top:""+((BH-100)/2)+""px;width:300px;height:10px;z-index:100;border:solid red 3px ;background-color:#eeeeee;text-align:center;padding:5px;'>" & info & "</div>"");"
		case "LocaTimeself"
             vi = "setTimeout('location.href = \'" & gourl & "\'',2000);"
	    case "Logingo"
		     vi = "parent.top.location.href='" & HOME_PATH & "index.asp';" 
		case "LoginC"
             vi = "window.close();" 
	    case "CloseTime"
		     vi = gourl & "setTimeout('window.close()'," & info & ");"
	 End Select
	 viewinfo = ST & vi & SE
End Function

		
Public Function outPriceinPrice(inprice_ALL,EveryKCP_Sum_ALL)
	Set CS = Server.CreateObject("adodb.RecordSet")
	A__ = ("select stockid from salelist where not isnull(saleid) " & DATE_SQL & keySQL & " group by stockid")
	CS.Open(A__),Conn,1,1
	if not CS.eof then
	   CSCount = CS.RecordCount
	   for i_C = 1 to CSCount
		   inpriceOne = SelectZD("select inprice from stock where stockid = " & CS("stockid") & "",0)
		   inhowSum = SelectZD("select Sum(inhow) from stock where stockid = " & CS("stockid") & "",0)
		   outhowSum = SelectZD("select Sum(outhow) from salelist where stockid = " & CS("stockid") & "",0)
		   KCP = (inhowSum-outhowSum)
		   inpriceOne_Sum = inpriceOne*inhowSum
		   inprice_ALL = inprice_ALL + inpriceOne_Sum
		   EveryKCP_Sum = inpriceOne * KCP
		   EveryKCP_Sum_ALL = EveryKCP_Sum_ALL + EveryKCP_Sum
		   CS.movenext
	   next
	else
	end if
	CS.Close
	Set CS = Nothing
End Function















Public Function RowCount(textName)
         if isnull(textName) or textName = "" then 
		    RowCount = 0
		    Exit Function
		 end if
		 textNameReplace = Replace(textName," ","")
		 textNameUBound = UBound(Split(textNameReplace,","))
		 if textNameUBound < 0 then textNameUBound = 0
		 RowCount = textNameUBound
End Function


Public Function Split_(invalue,boxoff)
    if isnull(invalue) or invalue = "" then
	   Split_ = Split("")
	   Exit Function
	end if
	if boxoff = "" then boxoff = ","
    SplitValue = Split(Replace(invalue," ",""),boxoff)
	Split_ = SplitValue
End Function


Public Function SearchSupplier(Rs,SQL,Rsupplierid,boxName,boxStyle)
   Rs.Open(SQL),Conn,1,1
      if not Rs.eof then
	     dim S
		 S = "<select name = '" & boxName & "' style = '" & boxStyle & "'>"
	     for i_uid = 1 to Rs.RecordCount
		     Suid = Rs("uid")
			 SFullName = Rs("FullName")
			 if Rsupplierid = Suid then 
			    Selected_ = " style = 'color:red;' selected = 'selected' " 
			 else 
			    Selected_ = ""
			 end if
		     SO = SO & "<option value = '" & Suid & "' " & Selected_ & ">" & SFullName &  "</option>"
			 Rs.movenext
		 Next

		 if Rsupplierid = 0 then Selected__ = " style = 'color:red;' selected = 'selected' " else Selected__ = ""
		 SearchSupplier = S & SO & "<option value = '' " & Selected__ & ">全部供应商</option></select>"
	  else
	     SearchSupplier = "请先添加一个供应商！"
	  end if
	  Rs.Close
End Function



Public Function SelectSupplier(supplierid)
   Rs.Open("select * From supplier Order By supplierid Desc"),Conn,1,1
      if not Rs.eof then
	     dim i_supplierid , supplierid__ , supplier__ , OptionList
	     SelectSupplier = "<select name = 'supplierid' size = '1'>"
		 for i_supplierid = 1 to Rs.RecordCount
		     supplierid__ = Rs("supplierid")
			 supplier__ = Rs("supplier")
		     if supplierid = supplierid__ then option__ = " style = 'color:red;' selected = 'selected' " else option__ = ""
		     OptionList_ = OptionList_ & "<option value = '" & supplierid__ & "' " & option__ & ">" & supplier__ & "</option>"
			 Rs.movenext
		 Next
		 SelectSupplier = SelectSupplier & OptionList_ & "</select>"
	  else
	     SelectSupplier = "请先添加一个供应商类别！"
	  end if
	  Rs.Close
End Function

















Function v1v2(v1,v2,view,Lastv1v2)
         if v1 = v2 then 
		    v1v2 = view
		 else
		    v1v2 = Lastv1v2
		 end if
end Function




Public ProductZDArr
       ProductZDArr = array(stockid , supplierid , productname , unit , inprice , inhow , total , intotime , uid , uuid , remark , SQL)
Public Function Productview(ProductZDArr)
       dim PS
       Set PS = Server.CreateObject("Adodb.RecordSet")
	       PS.Open(SQL),Conn,1,1
		   if not PS.eof then
			  stockid = PS("stockid")
			  supplierid = PS("supplierid")'相应供应商id
			  mtypeid = PS("mtypeid")'所属商品类别id
			  Code = PS("Code")'代码
			  cName = PS("cName")'中文名
			  eName = PS("eName")'英文名
			  eRemark = PS("eRemark")'英文备注
			  cRemark = PS("cRemark")'中文备注
			  typeCode = PS("typeCode")'型号条码
			  Quality = PS("Quality")'性质-
			  inprice = PS("inprice")'参考进货价
			  outprice = PS("outprice")'参考预出售价
			  productname = PS("productname")
			  unit = PS("unit")

			  inprice = isNumber(PS("inprice"),"dec",0)
			  inhow = isNumber(PS("inhow"),"dec",0)
			  total = isNumber(PS("total"),"dec",0)

			  intotime = PS("intotime")
			  thisDate = PS("thisDate")
			  uid = PS("uid")
			  uuid = PS("uuid")
			  remark = PS("remark")
		   else
		      id = 0
		   end if
		   PS.Close
		   Set PS = Nothing
End Function


Public SaleZDArr
       SaleZDArr = array(saleid , stockid , outprice , outhow , uid , outtime , outdate , outremark)
Public Function Saleview(SaleZDArr)
       dim sRs
	   Set sRs = Server.CreateObject("Adodb.RecordSet")
	       sRs.Open(SQL),Conn,1,1
		   if not sRs.eof then
			  saleid = sRs("saleid")
			  stockid = sRs("stockid")
			  outprice = sRs("outprice")

			  outhow = isNumber(sRs("outhow"),"dec",0)
			  inhow = isNumber(sRs("inhow"),"dec",0)

			  intotime = sRs("intotime")
			  thisDate = sRs("thisDate")
			  uid = sRs("uid")
			  uuid = sRs("uuid")
			  remark = sRs("remark")
		   else
		      id = 0
		   end if
		   sRs.Close
		   Set sRs = Nothing
End Function


Public Function PaginatinoGoogle(byref Rs,noteTotal,thisPageSize,LinkFile,LUrl,LArr)
		 noteTotal = Rs.RecordCount '记录总数
		 thisPageSize = abs(isNumber(thisPageSize,"int",10))
		 rs.PageSize = thisPageSize '每页显示记录数
		 Page = trim(request("Page"))
		 Page = abs(isNumber(Page,"int",1))
		 MaxPage = Rs.PageCount
		 if Page > MaxPage then Page = MaxPage
		 if Page = 0 then Page = 1
		 rs.AbsolutePage = Page
		 PPrevPagePic = "首页"
		 NNextPagePic = "尾页"
		 if Page > 1 then 
		    PagePrint = "<a href='" & LinkFile &"?Page=1" & "&" & LUrl & "'>" & PPrevPagePic & "</a> <a href='" & LinkFile &"?Page=" & (Page - 1) & "&" & LUrl & "'>" & PrevPagePic & "</a>"
		 else
		    PagePrint =  " " & PPrevPagePic & " " & PrevPagePic & " "
		 end if  

         'PCount-当前页面前，循环显示4页-->
         '1---PCount页要特殊对待
		 dim i_P
		 PCount = isNumber(PCount,"int",5)
		 For i_P = 1 to PCount
			 if Page > i_P then 
			    A = i_P
			 else
			 end if
		 Next
		 'Response.Write "A = " & A
         '当前页面前，循环显示PCount页
         i = ""
         for i = (Page - A) to (Page - 1)
             PagePrint = PagePrint & " <a href='" & LinkFile & "?Page=" & i & "&" & LUrl & "'>" & i & "</a> "
         next

         '当前所在页面
         PagePrint = PagePrint & " <span style='color:red;'>" & Page & "</span> "

         '当前页面后，循环显示PCount页
         i = ""
         for i = (Page + 1) to (Page + PCount)
             if i > MaxPage then exit for
                PagePrint = PagePrint & " <a href='" & LinkFile & "?Page=" & i & "&" & LUrl & "'>" & i & "</a> "
         next

		 if Page = MaxPage or Page > MaxPage then
		    PagePrint = PagePrint & " " & NextPagePic & " " & NNextPagePic & " "
		 else
		    PagePrint = PagePrint & " <a href='" & LinkFile & "?Page=" & (Page+1) & "&" & LUrl & "'>" & NextPagePic & "</a> <a href='" & LinkFile & "?Page=" & MaxPage & "&" & LUrl &"'>" & NNextPagePic & "</a> "
		 end if
         
     PaginatinoGoogle = "总记录：" & noteTotal & " " & thisPageSize & "/页 页次：" & Page & "/" & MaxPage & " " & PagePrint 
End Function



Function Pagination(ByRef rs,Page,thisPageSize,SELPageSize,LinkFile,LUrl,LB,LC,LD)

         dim total,retval,MaxPage
		     total = Rs.RecordCount
             Page = trim(request("Page"))
             Page = abs(isNumber(Page,"int",1))
			 SELPageSize = trim(request("PageSize"))
			 SELPageSize = abs(isNumber(SELPageSize,"int",10))
             thisPageSize = SELPageSize
			 rs.PageSize = thisPageSize '每页条数
		     MaxPage = Rs.PageCount '总页数
		     if Page > MaxPage then Page = MaxPage
		     if Page <= 0 then Page = 1
             rs.absolutepage = Page


			 PageSizeArr = Array(10,20,40,80,160,total)
			 PageSizeArrCount = Ubound(PageSizeArr)
			 For i_PSArr = 0 to PageSizeArrCount
			     if thisPageSize = PageSizeArr(i_PSArr) then viewPage = "<span style='color:red;'>" & PageSizeArr(i_PSArr) & "</span>" else viewPage = PageSizeArr(i_PSArr) end if
				 viewPageA = viewPageA & viewPage
				 SELPAGE = " <a href = '" & LinkFile & "?Page=" & Page & "&PageSize=" & PageSizeArr(i_PSArr) & LUrl & "'>" & viewPage & "</a> "
				 SELPAGEA = SELPAGEA & SELPAGE 
			 Next
		     SELPAGE = SELPAGEA 
             
			 if Page = 1 then 
			    retval = "首页 前页"
			 else
			    if Page > MaxPage then Page = MaxPage
			    retval = "<a href='"&LinkFile&"?page=1" & LUrl & "' title='第一页'>首页</a> <a href='"&LinkFile&"?page=" & (Page-1) & LUrl &"' title='前一页'>前页</a>"
			 end if

		     retval = retval &" 页次：<span style='color:red;'>" & Page & "</span>/<span style='color:blue;'>" & MaxPage & "</span> "


			 retval = retval & "每页显示" & SELPAGE & "记录  总记录：<span style='color:red;'>" & total & "</span> "

			 if Page = MaxPage then 
			    retval = retval & "后页 尾页"
			 else
			    retval = retval & "<a href='" & LinkFile & "?page="&(Page+1) & LUrl & "' title='后一页'>后页</a> <a href='" &LinkFile&"?page=" & MaxPage & LUrl & "' title='最后一页'>尾页</a> "
			 end if
             Pagination = retval
			 LB = total
End Function











Public Function ConnClose()
	if IsObject(Rs) then
		Set Rs=NoThing
	end if
	if IsObject(Conn) then
		Conn.close
		Set Conn=NoThing
	end if
End Function

%>

		        