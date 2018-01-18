<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Date" %>
<%@ page import="javax.ejb.Handle" %>
<%@ page import="org.ow2.jonas.examples.cluster.j2ee14.beans.samplecluster2.*" %>
<%@ page import="javax.rmi.PortableRemoteObject" %>
<%
  Date dc = new Date(session.getCreationTime());
  Date da = new Date(session.getLastAccessedTime());
%>
<HEAD><TITLE>SessionServlet Output</TITLE></HEAD>
<BODY>
<h1> SessionServlet Output </h1>
<p>getRequestURL <b><%=request.getRequestURL()%>
</b> for the <b><%=session.getAttribute("sessiontest.counter")%></b> times.<br>
from <%=request.getRemoteAddr()%>(user is <%=request.getRemoteUser()%>)
To server <%=request.getServerName()%> on port <%=request.getServerPort()%>.
<p>
<p>Request path: <br/>
<b>Servlet</b> executed on JOnAS instance (<b><%=request.getAttribute("jonas.WEB.served.by")%></b>)<br/>
<b>Stateless EJB</b> executed on JOnAS instance (<b><%=request.getAttribute("jonas.EJB.served.by")%></b>)<br/>

<p>
<br/>
<a href=<%=response.encodeURL("session")%>>Ask again</a>,
<a href=<%=response.encodeURL("release")%>>release session</a>,
<a href=<%=response.encodeURL("check")%>>check session</a>,
<a href=<%=response.encodeURL("../index.html")%>>home</a>.<br/>

Session Data:
New Session: <b><%=session.isNew()%></b>
<br>Session ID: <%=session.getId()%>
<br><b>Creation Time: <%=dc.toString()%></b>
<br>Last Accessed Time: <%=da.toString()%>
<p>
<pre>
<%
Handle h = (Handle) session.getAttribute("myStateful");
if (h != null) {
  MyStateful bean = null;
  try {
  bean = (MyStateful) PortableRemoteObject.narrow (h.getEJBObject() , MyStateful.class);
  out.print(bean.getLogDump());
  } catch (Exception e) {
    out.print(e.getMessage());
  }
}
%>
</pre>
<strong>Sample is OK.</strong>
</BODY>
