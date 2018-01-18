<!-- Standard Struts Entries -->

<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">

<!-- Standard Content -->

<%@ include file="begin.jsp" %>

<!-- Body -->

<body class="errors">
<!--
<table border="0" cellspacing="0" cellpadding="0">
<tr>
  <td><html:img border="0" src="images/logo/JonasSadSmall_Orange.jpg"/></td>
  <td><h1>Global error</h1></td>
</tr>
</table>
<p>
<html:errors/>
<p>
-->
<table border="0" cellspacing="0" cellpadding="0">
<tr>
  <td><h1><bean:message key="title.error.global"/></h1></td>
  <td align="right"><html:img border="0" src="images/logo/JonasSadSmall.png"/></td>
</tr>
<tr><td colspan="2"><p><html:errors/><p></td></tr>
<tr><td colspan="2">&nbsp;</td></tr>
<tr><td colspan="2" align="center"><sj:jonasbutton page="/" target="_top" ><bean:message key="button.refresh"/></sj:jonasbutton></td></tr>
</table>
</body>

<!-- Standard Footer -->

<%@ include file="end.jsp" %>

</html:html>
