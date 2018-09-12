<!--#include file="Num.asp"-->
<%
'### To encrypt/decrypt include this code in your page 
'### strMyEncryptedString = EncryptString(strString)
'### strMyDecryptedString = DeCryptString(strMyEncryptedString)
'### You are free to use this code as long as credits remain in place
'### also if you improve this code let me know.

Private Function EncryptString(strString)
	'####################################################################
	'### Crypt Function (C) 2001 by Slavic Kozyuk grindkore@yahoo.com ###
	'### Arguments: strString <--- String you wish to encrypt ###
	'### Output: Encrypted HEX string ###
	'####################################################################

	Dim CharHexSet, intStringLen, strTemp, strRAW, i, intKey, intOffSet
	Randomize Timer

	intKey = Round((RND * 1000000) + 1000000) '##### Key Bitsize
	intOffSet = Round((RND * 1000000) + 1000000) '##### KeyOffSet Bitsize

	If IsNull(strString) = False Then
		strRAW = strString
		intStringLen = Len(strRAW)

		For i = 0 to intStringLen - 1
			strTemp = Left(strRAW, 1)
			strRAW = Right(strRAW, Len(strRAW) - 1)
			CharHexSet = CharHexSet & Hex(Asc(strTemp) * intKey)& Hex(intKey)
		Next

		EncryptString = CharHexSet & "|" & Hex(intOffSet + intKey) & "|" & Hex(intOffSet)
	Else
		EncryptString = ""
	End If
End Function

Private Function DeCryptString(strCryptString)
	'####################################################################
	'### Crypt Function (C) 2001 by Slavic Kozyuk grindkore@yahoo.com ###
	'### Arguments: Encrypted HEX stringt ###
	'### Output: Decrypted ASCII string ###
	'####################################################################
	'### Note this function uses HexConv() and get_hxno() functions ###
	'### so make sure they are not removed ###
	'####################################################################

	Dim strRAW, arHexCharSet, i, intKey, intOffSet, strRawKey, strHexCrypData

	strRawKey = Right(strCryptString, Len(strCryptString) - InStr(strCryptString, "|"))
	intOffSet = Right(strRawKey, Len(strRawKey) - InStr(strRawKey,"|"))
	intKey = HexConv(Left(strRawKey, InStr(strRawKey, "|") - 1)) - HexConv(intOffSet)
	strHexCrypData = Left(strCryptString, Len(strCryptString) - (Len(strRawKey) + 1))

	arHexCharSet = Split(strHexCrypData, Hex(intKey))

	For i=0 to UBound(arHexCharSet)
		strRAW = strRAW & Chr(HexConv(arHexCharSet(i))/intKey)
	Next

	DeCryptString = strRAW
End Function

Private Function HexConv(hexVar)
	Dim hxx, hxx_var, multiply 
	IF hexVar <> "" THEN
		hexVar = UCASE(hexVar)
		hexVar = StrReverse(hexVar)
		DIM hx()
		REDIM hx(LEN(hexVar))
		hxx = 0
		hxx_var = 0
		FOR hxx = 1 TO LEN(hexVar)
			IF multiply = "" THEN multiply = 1
			hx(hxx) = mid(hexVar,hxx,1)
			hxx_var = (get_hxno(hx(hxx)) * multiply) + hxx_var
			multiply = (multiply * 16)
		NEXT
		hexVar = hxx_var
		HexConv = hexVar
	END IF
End Function

Private Function get_hxno(ghx)
	If ghx = "A" Then
		ghx = 10
	ElseIf ghx = "B" Then
		ghx = 11
	ElseIf ghx = "C" Then
		ghx = 12
	ElseIf ghx = "D" Then
		ghx = 13
	ElseIf ghx = "E" Then
		ghx = 14
	ElseIf ghx = "F" Then
		ghx = 15
	End If
	get_hxno = ghx
End Function
%>

<%
Dim Image
Dim Width, Height
Dim num
Dim digtal
Dim Length
Dim sort
Length = 4 '自定计数器长度

Redim sort( Length )

num=cint(DeCryptString(request.querystring("attach_num")))	'获得数字
digital = ""
For I = 1 To Length -Len( num ) '补0
	digital = digital & "0"
Next
For I = 1 To Len( num )
	digital = digital & Mid( num, I, 1 )
Next
For I = 1 To Len( digital )
	sort(I) = Mid( digital, I, 1 )
Next
Width = 8 * Len( digital ) '图像的宽度
Height = 10 '图像的高度，在本例中为固定值

Response.ContentType="image/x-xbitmap"

hc=chr(13) & chr(10) 

Image = "#define counter_width " & Width & hc
Image = Image & "#define counter_height " & Height & hc
Image = Image & "static unsigned char counter_bits[]={" & hc

For I = 1 To Height
	For J = 1 To Length
		Image = Image & a(sort(J),I) & ","
	Next
Next

Image = Left( Image, Len( Image ) - 1 ) '去掉最后一个逗号
Image = Image & "};" & hc
%>
<%
Response.Write Image	'输出附加码
%>
