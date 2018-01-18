<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ApplyDeployConfirm">
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionEditDeploy"><bean:message key="tab.deployment"/></sj:tab>
  <logic:equal name="deployForm" property="confirm" value="true">
    <sj:tab forward="Deploy Confirm" selected="true"><bean:message key="tab.deployment.confirm"/></sj:tab>
  </logic:equal>
  <logic:equal name="deployForm" property="confirm" value="false">
    <sj:tab forward="Deploy Confirm" selected="true"><bean:message key="tab.deployment.result"/></sj:tab>
  </logic:equal>
  <bean:define id="isModule" name="deployForm" property="isModule"/>
  <logic:equal name="isModule" value="true">
    <sj:tab forward="ActionEditUpload"><bean:message key="tab.deployment.upload"/></sj:tab>
    <sj:tab forward="ActionEditRemove"><bean:message key="tab.deployment.remove"/></sj:tab>
  </logic:equal>
  <bean:define id="isConfig" name="deployForm" property="isConfigurable"/>
  <logic:equal name="isConfig" value="true">
      <sj:tab forward="ActionArchiveConfigSelect"><bean:message key="tab.configure"/></sj:tab>
  </logic:equal>

   <sj:panel>
    <sj:jonasgrid>
      <logic:equal name="deployForm" property="confirm" value="true">
        <sj:jgRowTitle level="2">
          <sj:jgColTitle><bean:message key="title.deployment.confirm.deployed"/></sj:jgColTitle>
        </sj:jgRowTitle>
      </logic:equal>
      <logic:equal name="deployForm" property="confirm" value="false">
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="title.deployment.confirm.deployed"/></sj:jgColTitle>
        </sj:jgRowTitle>
      </logic:equal>
      <bean:size id="listDeployedSize" name="deployForm" property="listDeployed"/>
      <logic:equal name="listDeployedSize" value="0">
        <sj:gridrow>
          <sj:gridcol><bean:message key="message.deployment.confirm.deployed.none"/></sj:gridcol>
        </sj:gridrow>
      </logic:equal>
      <logic:iterate id="deployed" name="deployForm" property="listDeployed">
        <sj:gridrow>
          <sj:gridcol><bean:write name="deployed"/></sj:gridcol>
        </sj:gridrow>
      </logic:iterate>
    </sj:jonasgrid>
    <sj:panelSeparator/>
    <bean:size id="listAddSize" name="deployForm" property="listAdd"/>
    <logic:notEqual name="listAddSize" value="0">
      <sj:jonasgrid>
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="title.deployment.confirm.add"/></sj:jgColTitle>
        </sj:jgRowTitle>
        <logic:iterate id="add" name="deployForm" property="listAdd">
          <sj:gridrow>
            <sj:gridcol><bean:write name="add"/></sj:gridcol>
          </sj:gridrow>
        </logic:iterate>
      </sj:jonasgrid>
      <sj:panelSeparator/>
    </logic:notEqual>
    <bean:size id="listRemoveSize" name="deployForm" property="listRemove"/>
    <logic:notEqual name="listRemoveSize" value="0">
      <sj:jonasgrid>
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="title.deployment.confirm.remove"/></sj:jgColTitle>
        </sj:jgRowTitle>
        <logic:iterate id="remove" name="deployForm" property="listRemove">
          <sj:gridrow>
            <sj:gridcol><bean:write name="remove"/></sj:gridcol>
          </sj:gridrow>
        </logic:iterate>
      </sj:jonasgrid>
      <sj:panelSeparator/>
    </logic:notEqual>
    <logic:present name="<%=Globals.ERROR_KEY%>">
      <sj:jonasgrid>
        <sj:gridrow styleClass="errors">
          <sj:gridcol styleClass="errors"><html:errors/></sj:gridcol>
        </sj:gridrow>
      </sj:jonasgrid>
      <sj:panelSeparator/>
    </logic:present>
    <logic:notPresent name="<%=Globals.ERROR_KEY%>">
      <logic:equal name="deployForm" property="confirm" value="true">
        <sj:jonasgrid>
          <sj:jgRowTitle level="2">
            <sj:jgColTitle><html:submit styleClass="button"><bean:message key="button.confirm"/></html:submit></sj:jgColTitle>
          </sj:jgRowTitle>
        </sj:jonasgrid>
      </logic:equal>
    </logic:notPresent>
  </sj:panel>
</sj:tabs>
</html:form>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

