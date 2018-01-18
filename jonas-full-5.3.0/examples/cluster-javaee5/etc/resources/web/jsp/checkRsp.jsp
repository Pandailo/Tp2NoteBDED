<%@ page session="false" %>
<%
Cookie[] cookies = request.getCookies();
HttpSession session = request.getSession(false);
%>

<HEAD><TITLE>Check session</TITLE></HEAD>
<BODY>
<h1>check Servlet output</h1>
<%= (session != null ? "<h2>Logged in.</h2>Session ID: " + session.getId() + "<p>" : "<h2>No session.</h2>") %>
<%
  if ( cookies != null)
	for (int i=0; i < cookies.length;i++)
		out.println(cookies[i].getName()+ ": " + cookies[i].getValue() + "<br>");
%>
<br><%=request.getAttribute("sessionCheckInfo")%><p>
<a href=<%=response.encodeURL("session")%>>go to session</a>,
<% if (session != null) out.println("<a href=" + response.encodeURL("release") + ">logout</a>, ");%>
<a href=<%=response.encodeURL("check")%>>check session</a>,
<a href=<%=response.encodeURL("../index.html")%>>home</a>.
<br/><strong>Sample is OK.</strong>
</BODY>