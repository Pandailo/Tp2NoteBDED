<!-- Standard Struts Entries -->

<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<html:html locale="true">

<!-- Make sure window is not in a frame -->
<script language="JavaScript" type="text/javascript">
  if (top != self) {
    top.location=self.document.location;
  }
</script>

<!-- Standard Content -->

<%@ include file="begin.jsp"%>

<!-- Body -->
<style type="text/css">
<!--
.Style1 {color: #FFFFFF}
-->
</style>
<link href="style/jonasAdmin.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.Style6 {color: #FFFFFF; font-weight: bold; }
.Style8 {color: #ececec}
-->
</style>
<body class="login">

<!-- Login -->
<form method="POST"
  action='<%= response.encodeURL("j_security_check") %>' name="loginForm"><div align="center">
</div>
<table width="873" height="156" border="0" align="center">
<tr>
  <td>
  <div align="left" height="20%"><html:img src="images/logo/balJonasAdminLogin.png"/></div>
  </td>
  <td width="30%"><h3><font color="#000000"></font>
  </h3></td>
  <td>
  </td>
  <td>
 <div align="right"><html:img src="images/logo/logoOW2.png"/></div>
 </td>
 </tr>
</table>
<table width="873" height="100" border="0" align="center">
<tr>
<td>
</td>
</tr>
</table>
<table width="584" height="50" border="0" align="center">
<tr>
  <td>
  <div align="center"><img src="images/jonasAdmin.png" alt="JOnAS Administration" /></div>
  </td>
 </tr>
</table>

<table width="385" height="163" border="0" align="center">
  <tr>
    <td>&nbsp;</td>
    <td><table width="200" height="100" align="center" bgcolor="#555555" class="authentifLoginTable">
      <tr>
        <td><div align="center"><span class="Style6">
          <bean:message key="label.login.username" />
        </span></div></td>
        <td><input name="j_username" type="text" size="16"
          maxlength="16" /></td>
      </tr>
      <tr>
        <td><div align="center"><span class="Style6">
          <bean:message key="label.login.password"/>
        </span></div></td>
        <td><input name="j_password" type="password"
          size="16" maxlength="16" /></td>
      </tr>
      <!-- login reset buttons layout -->
      <tr>
        <td align="right">&nbsp;</td>
        <td align="left"><input type="submit" class="longButton"
          value='<bean:message key="button.login"/>'>
          &nbsp;&nbsp;
             <input type="reset" class="longButton"
          value='<bean:message key="button.reset"/>'></td>
      </tr>
    </table></td>
    <td>&nbsp;</td>
  </tr>
</table>
</form>

<script language="JavaScript" type="text/javascript">
  <!--
    document.forms["loginForm"].elements["j_username"].focus()
  // -->
</script>

</body>

<!-- Standard Footer -->

<%@ include file="end.jsp"%>

</html:html>
