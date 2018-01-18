<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>
<body class="content">
<html:form action="/ApplyUpload" method="post" enctype="multipart/form-data">
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">

      <bean:define id="isDomain" name="uploadForm" property="isDomain"/>
      <logic:equal name="isDomain" value="false">
      <sj:tab forward="ActionEditDeploy"><bean:message key="tab.deployment"/></sj:tab>
      </logic:equal>
      
       <logic:equal name="isDomain" value="true">
       <sj:tab forward="ActionEditDomainDeploy"><bean:message key="tab.deployment.domain"/></sj:tab>
      </logic:equal>

  <sj:tab forward="ActionEditUpload" selected="true"><bean:message key="tab.deployment.upload"/></sj:tab>
  <sj:tab forward="ActionEditRemove"><bean:message key="tab.deployment.remove"/></sj:tab>
  
  <bean:define id="isConfig" name="uploadForm" property="isConfigurable"/>
  <logic:equal name="isConfig" value="true">
      <sj:tab forward="ActionArchiveConfigSelect"><bean:message key="tab.configure"/></sj:tab>
  </logic:equal>
  
  <sj:panel>
    <sj:grid cellPadding="2">
      <sj:gridrow>
        <sj:gridcol align="center"><html:file size="90%" property="uploadedFile"/></sj:gridcol>
        <sj:gridcol><html:submit styleClass="buttonDeploy"><bean:message key="button.upload"/></html:submit></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:gridcol align="left"><html:checkbox property="overwrite" value="true"><bean:message key="message.upload.replace"/></html:checkbox></sj:gridcol>
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

