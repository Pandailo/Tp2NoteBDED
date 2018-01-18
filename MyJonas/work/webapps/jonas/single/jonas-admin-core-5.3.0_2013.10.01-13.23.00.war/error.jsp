<!-- Standard Struts Entries -->
<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html:html locale="true">

<!-- Standard Content -->
<%@ include file="begin.jsp" %>

<!-- Body -->
<body class="errors">
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td align="center"><html:img border="0" src="images/logo/JonasSadSmall.png"/></td>
</tr>
<tr>
  <td align="center" class="errorTitle"><bean:message key="error.login"/></td>
</tr>
<tr><td class="errorTitle">&nbsp;</td></tr>
<tr>
  <td align="center" class="errorLink">
    <bean:message key="error.login.tryagain"/>
    <html:link page="/" styleClass="error"><bean:message key="error.login.clickhere"/></html:link>
  </td>
</tr>
</table>

</body>

<!-- Standard Footer -->

<%@ include file="end.jsp" %>

</html:html>
