<!-- Standard Struts Entries -->

<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.action.Action"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html:html locale="true">

<%@ include file="begin.jsp" %>

<script language="JavaScript" type="text/javascript">
function Submit()
{
  document.forms[0].submit();
}
</script>
<logic:present name="reloadAll">
<script language="JavaScript" type="text/javascript">
function reloadFrame()
{
  top.location.reload(true);
}
</script>
</logic:present>
<logic:notPresent name="reloadAll">
<script language="JavaScript" type="text/javascript">
function reloadFrame()
{
}
</script>
</logic:notPresent>

<body class="top" onload="reloadFrame()" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td rowspan="3" width="20%">
      <html:link forward="WelcomeContent" target="content">
        <html:img src="images/logo/JonasSmall.png" alt="Jonas Welcome" border="0"/>
      </html:link>
    </td>
    <td align="left" class="topTitle" width="80%"><strong>JOnAS Administration</strong></td>
  </tr>
  <tr>
    <td align="left">
      <table width="100%" border="0" cellspacing="0" cellpadding="2">
        <tr>
          <td align="left" class="top">
            <logic:notPresent name="reloadAll">
            <html:link forward="WelcomeContent" target="content" styleClass="top">
              <bean:message key="button.reset"/>
            </html:link>
            </logic:notPresent>
          </td>
          <td width="1%" align="right" class="top" nowrap>
            <html:link forward="Log Out" target="_top" styleClass="top">
              <bean:message key="button.logout"/>
            </html:link>
          </td>
          <td width="1%" align="right" class="top">&nbsp;</td>
        </tr>
      </table>
    </td>
  </tr>
  <logic:present name="errorServerSelect">
  <tr>
    <td class="topErrors"><html:errors property="serverSelect"/></td>
  </tr>
  </logic:present>
</table>

</body>

<!-- Standard Footer -->
<%@ include file="end.jsp" %>

</html:html>
