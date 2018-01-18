<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ApplyDomainDeployConfirm">
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionEditDomainDeploy"><bean:message key="tab.deployment.domain"/></sj:tab>
  <logic:equal name="domainDeployForm" property="confirm" value="true">
    <sj:tab forward="Deploy Confirm" selected="true"><bean:message key="tab.deployment.confirm"/></sj:tab>
  </logic:equal>
  <logic:equal name="domainDeployForm" property="confirm" value="false">
    <sj:tab forward="Deploy Confirm" selected="true"><bean:message key="tab.deployment.result"/></sj:tab>
  </logic:equal>
  <sj:tab forward="ActionEditUpload"><bean:message key="tab.deployment.upload"/></sj:tab>
  <sj:tab forward="ActionEditRemove"><bean:message key="tab.deployment.remove"/></sj:tab>
    <bean:define id="isConfig" name="domainDeployForm" property="isConfigurable"/>
  <logic:equal name="isConfig" value="true">
      <sj:tab forward="ActionArchiveConfigSelect"><bean:message key="tab.configure"/></sj:tab>
  </logic:equal>
   <sj:panel>

    <sj:jonasgrid>
            <sj:jgRowTitle>
             <sj:jgColTitle><bean:message key="message.deployment.domain.toUndeploy"/></sj:jgColTitle>
           </sj:jgRowTitle>
      <bean:size id="listDeploySize" name="domainDeployForm" property="deploySelected"/>
      <logic:equal name="listDeploySize" value="0">
        <sj:gridrow>
          <sj:gridcol><bean:message key="message.deployment.domain.noApps"/></sj:gridcol>
        </sj:gridrow>
      </logic:equal>
      <logic:iterate id="deploy" name="domainDeployForm" property="deploySelected">
        <sj:gridrow>
          <sj:gridcol><bean:write name="deploy"/></sj:gridcol>
        </sj:gridrow>
      </logic:iterate>
    </sj:jonasgrid>

	<sj:panelSeparator/>

    <sj:jonasgrid>
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="message.deployment.domain.targetServersUndeploy"/></sj:jgColTitle>
        </sj:jgRowTitle>
      <bean:size id="listServerSize" name="domainDeployForm" property="listTargetSelectedNames"/>
      <logic:equal name="listServerSize" value="0">
        <sj:gridrow>
          <sj:gridcol><bean:message key="message.deployment.domain.noServers"/></sj:gridcol>
        </sj:gridrow>
      </logic:equal>
      <logic:iterate id="serverName" name="domainDeployForm" property="listTargetSelectedNames">
        <sj:gridrow>
          <sj:gridcol><bean:write name="serverName"/></sj:gridcol>
        </sj:gridrow>
      </logic:iterate>
    <sj:panelSeparator/>
    </sj:jonasgrid>


    <logic:present name="<%=Globals.ERROR_KEY%>">
      <sj:jonasgrid>
        <sj:gridrow styleClass="errors">
          <sj:gridcol styleClass="errors"><html:errors/></sj:gridcol>
        </sj:gridrow>
      </sj:jonasgrid>
      <sj:panelSeparator/>
    </logic:present>
    <logic:notPresent name="<%=Globals.ERROR_KEY%>">
      <logic:equal name="domainDeployForm" property="confirm" value="true">
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

