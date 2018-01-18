<html>
<head>
<title>TestFont</title>


<%
String sText= "abcdefABCDEF";
String sPrefTextSize = "TextSize";
String[] asTextSize = {"larger", "smaller", "xx-small", "x-small", "small", "medium", "large", "x-large", "xx-large"};

String sPrefPxSize = "PxSize";
String[] asPxSize = {"1px", "4px", "6px", "8px", "10px", "12px", "14px", "16px", "20px", "24px"};

String sPrefEmSize = "EmSize";
String[] asEmSizeTitle = {"01em", "02em", "04em", "05em", "06em", "07em", "08em", "09em", "1em", "11em", "12em", "14em", "16em", "18em", "2em"};
String[] asEmSize = {"0.1em", "0.2em", "0.4em", "0.5em", "0.6em", "0.7em", "0.8em", "0.9em", "1em", "1.1em", "1.2em", "1.4em", "1.6em", "1.8em", "2em"};

String sPrefPcSize = "PcSize";
//String[] asPcSizeTitle = {"1", "10", "30", "50", "70", "80", "90", "100", "110", "120", "130", "140", "150", "160", "180", "200", "220", "240"};
//String[] asPcSize = {"1%", "10%", "30%", "50%", "70%", "80%", "90%", "100%", "110%", "120%", "130%", "140%", "150%", "160%", "180%", "200%", "220%", "240%"};
int iMax=260;
int iMin=10;
int iGap=5;
int iInter= (iMax - iMin) / iGap;
String[] asPcSizeTitle = new String[iInter];
String[] asPcSize = new String[iInter];
int iValue;
for (int i=0; i < iInter; i++)
{
  iValue = iMin + (i * iGap);
  asPcSizeTitle[i] = String.valueOf(iValue);
  asPcSize[i] = String.valueOf(iValue)+"%";
}

%>

<style>
<%
int iRow = 0;

// Text
for (iRow=0; iRow < asTextSize.length; iRow++)
{
%>
 .<%=sPrefTextSize+asTextSize[iRow]%> {
 	font-family : Arial, Helvetica, sans-serif;
 	font-size : <%=asTextSize[iRow]%>;
	font-style: normal;
 }
 .<%=sPrefTextSize+asTextSize[iRow]%>Bold {
 	font-family : Arial, Helvetica, sans-serif;
 	font-size : <%=asTextSize[iRow]%>;
	font-style: normal;
	font-weight : bold;
 }
<%
}
// Pixel
for (iRow=0; iRow < asPxSize.length; iRow++)
{
%>
 .<%=sPrefPxSize+asPxSize[iRow]%> {
 	font-family : Arial, Helvetica, sans-serif;
 	font-size : <%=asPxSize[iRow]%>;
	font-style: normal;
 }
 .<%=sPrefPxSize+asPxSize[iRow]%>Bold {
 	font-family : Arial, Helvetica, sans-serif;
 	font-size : <%=asPxSize[iRow]%>;
	font-style: normal;
	font-weight : bold;
 }
<%
}

// EM
for (iRow=0; iRow < asEmSize.length; iRow++)
{
%>
 .<%=sPrefEmSize+asEmSizeTitle[iRow]%> {
 	font-family : Arial, Helvetica, sans-serif;
 	font-size : <%=asEmSize[iRow]%>;
	font-style: normal;
 }
 .<%=sPrefEmSize+asEmSizeTitle[iRow]%>Bold {
 	font-family : Arial, Helvetica, sans-serif;
 	font-size : <%=asEmSize[iRow]%>;
	font-style: normal;
	font-weight : bold;
 }
<%
}


// Pourcent
for (iRow=0; iRow < asPcSize.length; iRow++)
{
%>
 .<%=sPrefPcSize+asPcSizeTitle[iRow]%> {
 	font-family : Arial, Helvetica, sans-serif;
 	font-size : <%=asPcSize[iRow]%>;
	font-style: normal;
 }
 .<%=sPrefPcSize+asPcSizeTitle[iRow]%>Bold {
 	font-family : Arial, Helvetica, sans-serif;
 	font-size : <%=asPcSize[iRow]%>;
	font-style: normal;
	font-weight : bold;
 }
<%
}
%>
</style>

</head>
<body bgcolor="#ffffff">
<h1>Test Font</h1>

<table border="1" cellspacing="0" cellpadding="2">
<tr>
  <td colspan="3">Constant font</td>
</tr>
<tr>
  <td>&nbsp;</td>
  <td>normal</td>
  <td>bold</td>
</tr>
<%
// Text
for (iRow=0; iRow < asTextSize.length; iRow++)
{
%>
<tr>
  <td><%=asTextSize[iRow]%></td>
  <td class="<%=sPrefTextSize+asTextSize[iRow]%>"><%=sText%></td>
  <td class="<%=sPrefTextSize+asTextSize[iRow]%>Bold"><%=sText%></td>
</tr>
<%
}
%>
</table>

<table border="1" cellspacing="0" cellpadding="2">
<tr>
  <td colspan="3">Pixel font</td>
</tr>
<tr>
  <td>&nbsp;</td>
  <td>normal</td>
  <td>bold</td>
</tr>
<%
// Pixel
for (iRow=0; iRow < asPxSize.length; iRow++)
{
%>
<tr>
  <td><%=asPxSize[iRow]%></td>
  <td class="<%=sPrefPxSize+asPxSize[iRow]%>"><%=sText%></td>
  <td class="<%=sPrefPxSize+asPxSize[iRow]%>Bold"><%=sText%></td>
</tr>
<%
}
%>
</table>

<table border="1" cellspacing="0" cellpadding="2">
<tr>
  <td colspan="3">EM font</td>
</tr>
<tr>
  <td>&nbsp;</td>
  <td>normal</td>
  <td>bold</td>
</tr>
<%
// EM
for (iRow=0; iRow < asEmSize.length; iRow++)
{
%>
<tr>
  <td><%=asEmSize[iRow]%></td>
  <td class="<%=sPrefEmSize+asEmSizeTitle[iRow]%>"><%=sText%></td>
  <td class="<%=sPrefEmSize+asEmSizeTitle[iRow]%>Bold"><%=sText%></td>
</tr>
<%
}
%>
</table>

<table border="1" cellspacing="0" cellpadding="2">
<tr>
  <td colspan="3">Pourcent font</td>
</tr>
<tr>
  <td>&nbsp;</td>
  <td>normal</td>
  <td>bold</td>
</tr>
<%
// Pourcent
for (iRow=0; iRow < asPcSize.length; iRow++)
{
%>
<tr>
  <td><%=asPcSize[iRow]%></td>
  <td class="<%=sPrefPcSize+asPcSizeTitle[iRow]%>"><%=sText%></td>
  <td class="<%=sPrefPcSize+asPcSizeTitle[iRow]%>Bold"><%=sText%></td>
</tr>
<%
}
%>
</table>

</body>
</html>
