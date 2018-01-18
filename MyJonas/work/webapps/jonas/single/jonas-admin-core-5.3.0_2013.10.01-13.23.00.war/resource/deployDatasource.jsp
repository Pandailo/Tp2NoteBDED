<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ApplyDeploy">
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionEditDeploy" selected="true"><bean:message key="tab.deployment"/></sj:tab>
  <sj:tab forward="ActionListDatasources"><bean:message key="tab.resource.datasources"/></sj:tab>
  <sj:panel>
    <sj:grid cellPadding="2">
      <sj:gridrow>
        <sj:gridcol align="center"><b><bean:message key="label.deployment.deployable"/></b></sj:gridcol>
        <sj:gridcol>&nbsp;</sj:gridcol>
        <sj:gridcol align="center"><b><bean:message key="label.deployment.deployed"/></b></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:gridcol align="center">
          <html:hidden property="undeploy"/>
          <html:select property="undeploySelected" styleClass="deploy" multiple="true" size="10">
            <html:options property="listUndeploy"/>
          </html:select>
        </sj:gridcol>
        <sj:gridcol align="center">
          <table border="0" cellpadding="0" cellspacing="0">
            <tr><td align="center">
              <html:button styleClass="buttonDeploy" property="btnDeploy" onclick="copySelected('deployForm','undeploy','deploy')">
                <bean:message key="button.deployment.deploy"/>
              </html:button>
            </td></tr>
            <tr><td>&nbsp;</td></tr>
            <tr><td align="center">
              <html:button styleClass="buttonDeploy" property="btnUndeploy" onclick="copySelected('deployForm','deploy','undeploy')">
                <bean:message key="button.deployment.undeploy"/>
              </html:button>
            </td></tr>
          </table>
        </sj:gridcol>
        <sj:gridcol align="center">
          <html:hidden property="deploy"/>
          <html:select property="deploySelected" styleClass="deploy" multiple="true" size="10">
            <html:options property="listDeploy"/>
          </html:select>
        </sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:gridcol>&nbsp;</sj:gridcol>
        <sj:gridcol align="center"><html:submit styleClass="buttonDeploy"><bean:message key="button.apply"/></html:submit></sj:gridcol>
        <sj:gridcol>&nbsp;</sj:gridcol>
      </sj:gridrow>
    </sj:grid>

    <sj:panelSeparator/>

    <logic:present name="<%=Globals.ERROR_KEY%>">
      <sj:jonasgrid>
        <sj:gridrow styleClass="errors">
          <sj:gridcol styleClass="errors"><html:errors/></sj:gridcol>
        </sj:gridrow>
      </sj:jonasgrid>
    </logic:present>

  </sj:panel>
</sj:tabs>
</html:form>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

