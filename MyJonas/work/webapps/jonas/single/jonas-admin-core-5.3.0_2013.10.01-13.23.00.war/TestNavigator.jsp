<%@ page import="javax.servlet.http.*,java.util.*"%>

<html>
<head>
<title>
TestNavigator
</title>
</head>
<body bgcolor="#ffffff">
<h1>Test Navigator</h1>
<%
String sUserAgent = request.getHeader("user-agent");
%>
<hr>
<h3>Request info</h3>
Server name : <%=request.getServerName()%><br>
Server port : <%=request.getServerPort()%><br>
Scheme : <%=request.getScheme()%><br>
Protocol : <%=request.getProtocol()%><br>
Query string : <%=request.getQueryString()%><br>
Remote address : <%=request.getRemoteAddr()%><br>
Remote host : <%=request.getRemoteHost()%><br>
Remote user : <%=request.getRemoteUser()%><br>
Request URI : <%=request.getRequestURI()%><br>
Context path : <%=request.getContextPath()%><br>
Servlet path : <%=request.getServletPath()%><br>
Path info : <%=request.getPathInfo()%><br>
Path translated : <%=request.getPathTranslated()%><br>
<hr>
<h3>User Agent</h3>
<%=sUserAgent%>
<hr>
<table border="1" cellpadding="2" cellspacing="0">
<tr><th colspan="2" align="left">Header</th></tr>
<tr><th align="left">Name</th><th align="left">Value</th></tr>
<%
String sName = null;
String sValue = null;
Enumeration oEnum = request.getHeaderNames();
while (oEnum.hasMoreElements())
{
  sName = (String) oEnum.nextElement();
  sValue = request.getHeader(sName);
%>
  <tr><td><%=sName%></td><td><%=sValue%></td></tr>
<%
}
%>
</table>
</body>
</html>
