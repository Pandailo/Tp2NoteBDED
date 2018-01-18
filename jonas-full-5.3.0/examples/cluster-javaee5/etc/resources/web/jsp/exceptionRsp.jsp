<%@ page session="false" %>

<HEAD><TITLE>Exception</TITLE></HEAD><BODY>
<h1>exception Servlet output</h1>

<p>
<%

	out.println("MyException caught :" + request.getAttribute("expectedException") + "<br>");
    out.println("Exception=" + request.getAttribute("exception") + "<br>");
%>
<a href=<%=response.encodeURL("../index.html")%>>return to home</a>.
</BODY>
