<%
'===============================================================
'函数名称：字符串特殊字符转换（使能够插入数据库表）
'参    数：
'----------str ---- 待转换的字符串
'返 回 值：转换后的新字符串
function FormatString(str)
	str = replace(str,chr(39),"’")	'单引号
	str = replace(str,chr(34),"“")	'双引号
	str = replace(str,chr(44),"，")	'逗号
	'str = replace(str,chr(32) & chr(32),"&nbsp;&nbsp;")	'双空格
	str = replace(str,chr(62),"&gt;")	'大于号
	str = replace(str,chr(60),"&lt;")	'小于号
	'str = replace(str,vbcrlf,"<br>")	'回车
	'...................
	FormatString = str
end function
'===============================================================
'函数名称：将字符串以HTML格式输入
'参    数：
'----------str ---- 待转换的字符串
'返 回 值：转换后的新字符串
function FormatStringHTML(str)
	str = replace(str,chr(32),"&nbsp;")	'双空格
	str = replace(str,vbcrlf,"<br>")	'回车换行
	'...................
	FormatStringHTML = str
end function
'===============================================================
'函数名称：将日期格式化为需要的格式
'参    数：
'----------strDate ---- 待转换的字符串
'返 回 值：转换后的新字符串
function FormatDate(strDate,Date_Type)
	y = year(strDate)
	m = month(strDate)
	d = day(strDate)
	select case Date_Type
		case 1	'yyyy-m-d 格式
			FormatDate = y & "-" & m & "-" & d
		case 2	'yyyy/m/d 格式
			FormatDate = y & "/" & m & "/" & d
		case 3	'm/d/yyyy 格式
			FormatDate = m & "/" & d & "/" & y
		case 4	'年-月-日 格式
			FormatDate = y & "年" & m & "月" & d & "日"
	end select
end function
'===============================================================
'函数名称：权限验证
'参    数：
'----------Employee_ID ---- 员工编号
'----------Application_ID ----  功能编号，模块编号（3位）+功能编号（4位），例如：2000200中的前3位“200”表示“合同管理”，后4位“0200”表示“合同管理”中的“新签合同”
'返 回 值：布尔值
Function CheckAuth(Employee_ID,Application_ID)
	CheckAuth = False	'默认没有该权限
	if Employee_ID = 1 then	'超级用户“admin”，Employee_ID 为：1，第一个添加的用户，拥有所有权限
		CheckAuth = true
		exit function
	end if	
	if IsNumeric(Application_ID) then	'正确的功能编码
		'正常情况，判断是否有权限
		'select Employee_ID from Employee_Auth where Employee_ID = @Employee_ID and Application_ID = @Application_ID
		'sql = "sp_Employee_Check_Auth " & Employee_ID & "," & Application_ID
		sql = "select Employee_ID from Employee_Auth where Employee_ID = " & Employee_ID & " and Application_ID = " & Application_ID
		set conn = Server.CreateObject("ADODB.Connection")
		set rs = Server.CreateObject("ADODB.Recordset")
		conn.open connstr
		set rs = conn.execute(sql)
		if not rs.eof then
			CheckAuth = true
		else
			CheckAuth = false
		end if
		rs.close
		set rs = nothing
		conn.close
		set conn = nothing
	else	'错误的功能编码
		CheckAuth = False
		exit function
	end if
End Function

'===============================================================
'函数名称：操作日志
'参    数：
'----------Rec_Content ----  操作内容
'----------Command_Line ---- 执行命令行
'返 回 值：无
Sub Op_Rec(Rec_Content,Command_Line)
	'转换特殊字符
	Command_Line = FormatString(Command_Line)
	'insert into Employee_Op_Rec(Employee_ID,Rec_Content,Remote_Addr,Command_Line)  values(@Employee_ID,@Rec_Content,@Remote_Addr,@Command_Line)
	'sql = "sp_Employee_Op_Rec " & Session("Employee_ID") & ",'" & Rec_Content & "','" & Request.ServerVariables("REMOTE_ADDR") & "','" & Command_Line & "'"
	'response.write sql
	sql = "insert into Employee_Op_Rec(Employee_ID,Rec_Content,Remote_Addr,Command_Line)  values(" & Session("Employee_ID") & ",'" & Rec_Content & "','" & Request.ServerVariables("REMOTE_ADDR") & "','" & Command_Line & "')"
	set conn = Server.CreateObject("ADODB.Connection")
	conn.open connstr
	conn.execute(sql)
	conn.close
	set conn = nothing
End Sub

'===============================================================
'函数名称：生成行业下拉框
'参    数：
'----------Trade_Code ---- 默认行业编码
'返 回 值：无
sub Trade_List(Trade_Code)
	response.write "<select name=""Trade_Code"" size=1>"
	for i=0 to UBound(aryTrade)
		if CStr(Trade_Code) = CStr(i) then tag = " selected"
		response.write "<option value=""" & i & """" & tag & ">" & aryTrade(i) & "</option>"
		tag = ""
	next
	response.write "</select>"
end sub

'===============================================================
'函数名称：计算工作日
'参    数：
'----------date_begin ---- 开始日期
'----------date_end ---- 结束日期
'返 回 值：工作日
function workdays(date_begin , date_end)
	date_begin = CDate(date_begin)
	date_end = CDate(date_end)
	if IsDate(date_begin) and IsDate(date_end) then
		workdays = 0
		for d=0 to datediff("d" , date_begin , date_end)
			if weekday(date_begin + d) <> 1 and weekday(date_begin + d) <> 7 then
				workdays = workdays + 1
			end if
		next
	else	
		workdays = "未知"
	end if
end function


'===============================================================
'函数名称：判断是否符合规范
'参    数：
'----------Str ---- 被判断字符串
'----------Type ---- 被判断字符串类型，n-数字，s-字符串，d-日期
'返 回 值：无
function IsNot(InputString,StringType)
	'默认输入不合法
	IsNot = false
	'输入为空时不合法
	if Trim(InputString) = "" then exit function
	'合法输入
	select case StringType
		case "n"
			if IsNumeric(InputString) then IsNot = true
		case "d"
			if IsDate(InputString) then IsNot = true
		case "s"
			IsNot = true
		case else
			IsNot = false	'不可知情况视为不合法
	end select
end function
%>