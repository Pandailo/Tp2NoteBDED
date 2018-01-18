<%@ page session="false" %>

<% Cookie[] cookies = request.getCookies(); %>

<HEAD><TITLE>Release session</TITLE></HEAD><BODY>
<h1>release Servlet output</h1>

<h2><%=request.getAttribute("sessionToReleaseInfo")%></h2>
<h2>Cookies</h2>
<%
if (cookies != null) {
	for (int i=0; i < cookies.length;i++)
		out.println(cookies[i].getName()+ ": " + cookies[i].getValue() + "<br>");
	out.println("<br>If present, the JSESSIONID cookie will be obsoleted.<br>");
} else {
	out.println("None.");
}
%>

<p>
<a href=<%=response.encodeURL("session")%>>go to session</a>,
<a href=<%=response.encodeURL("check")%>>check session</a>,
<a href=<%=response.encodeURL("../index.html")%>>home</a>.
<br/><strong>Sample is OK.</strong>
</BODY>
