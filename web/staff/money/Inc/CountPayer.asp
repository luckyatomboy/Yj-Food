<%
Dim tpp,Sql,pType
Dim nian,selpayer
Dim RecordCou
Dim i,j,k
Dim yue,yueStr
Dim Money,Totel
Dim InMonth(12),OutMonth(12),SumMonth(12)
Dim InTotel,OutTotel,SumTotel
Dim month(12)
Sub CountPay
nian = Request.Form("nian")
selpayer = Request.Form("selpayer")
For i=1 To 12
month(i) = nian & "-0" & i
Next
%>
   <table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#CCCCCC">
          <tr> 
            <td width="9%" height="25" class="category">费用类型</td>
            <td width="5%" class="category"><div align="center">1月</div></td>
            <td width="5%" class="category"><div align="center">2月</div></td>
            <td width="5%" class="category"><div align="center">3月</div></td>
            <td width="5%" class="category"><div align="center">4月</div></td>
            <td width="5%" class="category"><div align="center">5月</div></td>
            <td width="5%" class="category"><div align="center">6月</div></td>
            <td width="5%" class="category"><div align="center">7月</div></td>
            <td width="5%" class="category"><div align="center">8月</div></td>
            <td width="5%" class="category"><div align="center">9月</div></td>
            <td width="5%" class="category"><div align="center">10月</div></td>
            <td width="5%" class="category"><div align="center">11月</div></td>
            <td width="5%" class="category"><div align="center">12月</div></td>
            <td width="9%" class="category"><div align="center"><b>合计</b></div></td>
          </tr>
<%
Set tpp = Server.CreateObject("ADODB.RecordSet")
Sql = "Select PayType From [PayType]"
tpp.Open Sql,Conn,1,1
If tpp.Eof Then
Response.Write "<tr><td height='26' colspan='14' bgcolor=#ffffff>没有记录!</td></tr>"
Else
tpp.MoveLast
RecordCou = tpp.RecordCount
tpp.MoveFirst
For i=1 To RecordCou
pType = tpp(0)
%>
          <tr bgcolor="#FFFFFF"> 
            <td height="26"><%=pType%></td>
<%
Totel = 0
j = 1
Do Until j > 12
Money = 0
Set yue = Conn.Execute("Select Payer,Money,InOut From [PayList] Where Payer='"&selpayer&"' and PayType='"&pType&"' and month(Time)= "&j&" and year(time)="&nian&"")
If Not yue.Eof Then
   Do While Not yue.Eof
   If yue(2) = 1 Then Money = Money + cdbl(yue(1))
   If yue(2) = 0 Then Money = Money - Cdbl(yue(1))
   yue.MoveNext
   Loop
Totel = Totel + Money

        For k=1 To 12
         If k=j Then
           If Money<0 Then OutMonth(k) = OutMonth(k) + Money
           If Money>0 Then InMonth(k) = InMonth(k) + Money
           SumMonth(k) = SumMonth(k) + Money
         End if
        Next
        
If cdbl(Money) < 0 Then Money = "<font color='#ff0000'>"& Money &"</font>"
Response.Write "<td><div align='center'>" & Money & "</div></td>"
Else
Response.Write "<td><div align='center'>0</div></td>"
End if
yue.Close
Set yue=Nothing
j = j + 1
Loop
%>
            
            
            <td><div align="center">
            <b>
<%If Totel<0 Then 
Response.Write "<font color='#ff0000'>"& Totel &"</font>"
Else
Response.Write Totel
End if
%>
             </b></div></td>
           </tr>
<%
If Totel>0 Then InTotel = InTotel + Totel
If Totel<0 Then OutTotel = OutTotel + Totel
SumTotel = SumTotel + Totel
tpp.MoveNext
Next
End if
tpp.Close
Set tpp=Nothing

%>
          <tr bgcolor="#FFFFFF"> 
            <td height="25" class="category"><b>支出合计</b></td>
<%For i=1 To 12
If OutMonth(i)="" Then OutMonth(i)=0
%>
<td class="category"><div align="center"><b><font color=#ff0000><%=OutMonth(i)%></font></b></div></td>
<%Next%>
    <td class="category"><div align="center"><b><font color="#ff0000"><%=OutTotel%></font></b></div></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td height="25" class="category"><b>收入合计</b></td>
<%For i=1 To 12
If InMonth(i)="" Then InMonth(i)=0
%>
<td class="category"><div align="center"><b><%=InMonth(i)%></b></div></td>
<%Next%>
            <td class="category"><div align="center"><b><%=InTotel%></b></div></td>
          </tr>
        </table>
<%End Sub%>

