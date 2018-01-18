<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html:html locale="true">
<%@ include file="begin.jsp" %>
<frameset cols="250,*">
  <frame name="tree" src="<%=response.encodeURL("setUpTree.do")%>" scrolling="auto">
  <frame name="right" src="<%=response.encodeURL("frameright.jsp")%>" scrolling="No">
</frameset>
<%@ include file="end.jsp" %>

<noframes>
<body bgcolor="#FFFFFF" text="#000000">
  <h1>Sorry, use a browser who accepts the frames !</h1>
</body>
</noframes>
</html:html>
