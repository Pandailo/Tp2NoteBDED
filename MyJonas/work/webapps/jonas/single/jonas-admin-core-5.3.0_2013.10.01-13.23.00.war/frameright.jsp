<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html:html locale="true">
<%@ include file="begin.jsp" %>
<frameset rows="96,*" framespacing="0" frameborder="0" border="0">
  <frame name="top" src="<%=response.encodeURL("EditTop.do?firstCall=true")%>" scrolling="No">
  <frame name="content" src="<%=response.encodeURL("welcomeContent.jsp")%>" scrolling="auto">
</frameset>
<%@ include file="end.jsp" %>

<noframes>
<body bgcolor="#FFFFFF" text="#000000">
  <h1>Sorry, use a browser who accepts the frames !</h1>
</body>
</noframes>
</html:html>
