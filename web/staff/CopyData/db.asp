<!--#include file="../conn2.asp"-->
<%
Public StartTime:StartTime=timer
Public inpriceSeeSet
       inpriceSeeSet = 0
Const  CCode = "0"
Const  QCode = "1"
Public Conn
Public Rs
Set Conn = server.CreateObject("ADODB.Connection")
Set rs   = server.createobject("adodb.recordSet")
Public PrintCabSite
       PrintCabSite = "http://www.pconline.gd.cn/ScriptX.cab#Version=5,60,0,360"

Function DataOpen(SelectDataType,setdb,DataName,HOME_PATH,DataPassWord)
         dim connStr
         Select Case SelectDataType
            Case "Access"
				Select Case setdb
					   Case "1"
					   connStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(HOME_PATH & DataName)
					   Case "2"
					   connStr = "driver={Microsoft Access Driver (*.mdb)};dbq=" & Server.MapPath(HOME_PATH & DataName)
					   DataType = " Access "
				End Select
		     Case "SQL2000"
	               connStr="driver={SQL Server};server=127.0.0.1;uid=sa;pwd=;database=ting" 
			       DataType = " SQLServer 2000 "
		     Case "",null
			       Response.Write "连接数据库时出现错误．请检查数据库相关参数！"
		           Response.End
		 End Select
         Conn.Open connStr
End Function

Call DataOpen(SelectDataType,"1",DataName,HOME_PATH,DataPassWord)
function endtime
  dim endtime_
  endtime_ = timer()
  endtime = endtime_ - StartTime
end function


Dim adu,adp,adl,chk_id
Dim mlev,lev1,lev2,lev3,lev4,lev5,lev6,lev7
Dim chk
SettingArray=Split(session("nflag"), ",")

adu = Replace(Session("ManageName"),"'","")
adp = Replace(Session("ManagePwd"),"'","")
adl = Replace(Session("ManageLevel"),"'","")   




%>
