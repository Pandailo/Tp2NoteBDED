<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ApplyRemove">
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
  <sj:tab forward="ActionEditRemove" selected="true"><bean:message key="tab.deployment.remove"/></sj:tab>

  <bean:define id="isConfig" name="removeForm" property="isConfigurable"/>
  <logic:equal name="isConfig" value="true">
      <sj:tab forward="ActionArchiveConfigSelect"><bean:message key="tab.configure"/></sj:tab>
  </logic:equal>
  
   <sj:panel>
    <sj:grid cellPadding="2" style="width:60%">
      <bean:size id="listRemovableSize" name="removeForm" property="listRemovable"/>
      <logic:notEqual name="listRemovableSize" value="0">
        <sj:gridrow>
          <sj:gridcol><b><bean:message key="label.deployment.remove.removable"/></b></sj:gridcol>
        </sj:gridrow>
        <sj:gridrow>
          <sj:gridcol align="center">
            <html:select property="removeSelected" styleClass="deploy" style="width:100%" multiple="true" size="10">
              <html:options property="listRemovable"/>
            </html:select>
          </sj:gridcol>
        </sj:gridrow>
        <sj:gridrow>
          <sj:gridcol><html:submit styleClass="button"><bean:message key="button.remove"/></html:submit></sj:gridcol>
        </sj:gridrow>
      </logic:notEqual>
      <logic:equal name="listRemovableSize" value="0">
        <sj:gridrow styleClass="errors">
          <sj:gridcol><bean:message key="message.deployment.modules.none"/></sj:gridcol>
        </sj:gridrow>
      </logic:equal>
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

