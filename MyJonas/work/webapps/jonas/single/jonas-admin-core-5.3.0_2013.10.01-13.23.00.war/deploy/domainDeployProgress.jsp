<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

       <script language="JavaScript">
                       function doLoad() {
                           setTimeout( "refresh()", 5000 );
                       }
                       
                       function refresh() {
                           window.location.href = "/jonasAdmin/ApplyDomainDeployConfirm.do";
                       }
       </script>

    
<bean:define id ="deploymentCompleted" name="domainDeployForm" property="deploymentCompleted"/>
<logic:equal name="deploymentCompleted" value="false">
       <body class="content" onLoad="doLoad();">
</logic:equal>
<logic:equal name="deploymentCompleted" value="true">
       <body class="content">
</logic:equal>


<html:form action="/ApplyDomainDeployConfirm">
<sj:titleContent usingWhere="true" tomThumb="true"/>

<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionEditDomainDeploy"><bean:message key="tab.deployment.domain"/></sj:tab>
  <sj:tab selected="true"><bean:message key="tab.deployment.domain.result"/></sj:tab>
  <sj:tab forward="ActionEditUpload"><bean:message key="tab.deployment.upload"/></sj:tab>
  <sj:tab forward="ActionEditRemove"><bean:message key="tab.deployment.remove"/></sj:tab>
    <bean:define id="isConfig" name="domainDeployForm" property="isConfigurable"/>
  <logic:equal name="isConfig" value="true">
      <sj:tab forward="ActionArchiveConfigSelect"><bean:message key="tab.configure"/></sj:tab>
  </logic:equal>
  <sj:panel>

    <bean:size id="listReportSize" name="domainDeployForm" property="reports"/>
    <logic:equal  name="domainDeployForm" property="selectedAction" value="undeploy">
    Total applications to undeploy: 
    </logic:equal>
    <logic:notEqual  name="domainDeployForm" property="selectedAction" value="undeploy">
    Total applications to deploy: 
    </logic:notEqual>
    <bean:write name="listReportSize"/>
    
    <logic:notEqual name="listReportSize" value="0">
        
      <logic:iterate id="deployReport" name="domainDeployForm" property="reports">
        <sj:jonasgrid>
          <sj:jgRowTitle>        
            <sj:jgColTitle>
              <bean:message key="message.deployment.domain.deploymentOf"/>
              <bean:write name="deployReport" property="key"/>
            </sj:jgColTitle>
          </sj:jgRowTitle>
        </sj:jonasgrid>                
        <sj:jonasgrid>
          <bean:define id="appReport"  name="deployReport" property="value"/>
          <logic:iterate id="serverReport" name="appReport">
            <sj:gridrow>
              <sj:gridcol width="20%"><bean:write name="serverReport" property="key"/></sj:gridcol>
              <sj:gridcol width="80%"><bean:write name="serverReport" property="value"/></sj:gridcol>
            </sj:gridrow>
          </logic:iterate>   
         </sj:jonasgrid>
   
         <sj:panelSeparator/>     
      </logic:iterate>

    </logic:notEqual>

    <logic:present name="<%=Globals.ERROR_KEY%>">
      <sj:jonasgrid>
        <sj:gridrow styleClass="errors">
          <sj:gridcol styleClass="errors"><html:errors/></sj:gridcol>
        </sj:gridrow>
      </sj:jonasgrid>
      <sj:panelSeparator/>
    </logic:present>

  </sj:panel>
</sj:tabs>
</html:form>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>
