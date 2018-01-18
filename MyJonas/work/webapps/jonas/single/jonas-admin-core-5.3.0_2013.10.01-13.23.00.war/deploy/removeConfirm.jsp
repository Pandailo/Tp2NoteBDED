<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ApplyRemoveConfirm">
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
 <bean:define id="isDomain" name="removeForm" property="isDomain"/>
      <logic:equal name="isDomain" value="false">
      <sj:tab forward="ActionEditDeploy"><bean:message key="tab.deployment"/></sj:tab>
      </logic:equal>
      
       <logic:equal name="isDomain" value="true">
       <sj:tab forward="ActionEditDomainDeploy"><bean:message key="tab.deployment.domain"/></sj:tab>
      </logic:equal>
  <sj:tab forward="ActionEditUpload"><bean:message key="tab.deployment.upload"/></sj:tab>
  <sj:tab forward="ActionEditRemove"><bean:message key="tab.deployment.remove"/></sj:tab>
  <logic:equal name="removeForm" property="confirm" value="true">
    <sj:tab forward="Remove Confirm" selected="true"><bean:message key="tab.deployment.remove.confirm"/></sj:tab>
  </logic:equal>
  <logic:equal name="removeForm" property="confirm" value="false">
    <sj:tab forward="Remove Confirm" selected="true"><bean:message key="tab.deployment.remove.result"/></sj:tab>
  </logic:equal>
  
   <bean:define id="isConfig" name="removeForm" property="isConfigurable"/>
   <logic:equal name="isConfig" value="true">
       <sj:tab forward="ActionArchiveConfigSelect"><bean:message key="tab.configure"/></sj:tab>
   </logic:equal>
  
   <sj:panel>
    <logic:equal name="removeForm" property="confirm" value="false">
      <sj:jonasgrid>
        <sj:jgRowTitle level="2">
          <sj:jgColTitle><bean:message key="title.deployment.remove.confirm.removed"/></sj:jgColTitle>
        </sj:jgRowTitle>
        <bean:size id="listRemovedSize" name="removeForm" property="listRemoved"/>
        <logic:equal name="listRemovedSize" value="0">
          <sj:gridrow>
            <sj:gridcol><bean:message key="message.deployment.remove.confirm.deployed.none"/></sj:gridcol>
          </sj:gridrow>
        </logic:equal>
        <logic:iterate id="removed" name="removeForm" property="listRemoved">
          <sj:gridrow>
            <sj:gridcol><bean:write name="removed"/></sj:gridcol>
          </sj:gridrow>
        </logic:iterate>
      </sj:jonasgrid>
      <sj:panelSeparator/>
    </logic:equal>
    <bean:size id="listToBeRemovedSize" name="removeForm" property="listToBeRemoved"/>
    <logic:notEqual name="listToBeRemovedSize" value="0">
      <sj:jonasgrid>
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="title.deployment.remove.confirm.remove"/></sj:jgColTitle>
        </sj:jgRowTitle>
        <logic:iterate id="remove" name="removeForm" property="listToBeRemoved">
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
      <logic:equal name="removeForm" property="confirm" value="true">
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

