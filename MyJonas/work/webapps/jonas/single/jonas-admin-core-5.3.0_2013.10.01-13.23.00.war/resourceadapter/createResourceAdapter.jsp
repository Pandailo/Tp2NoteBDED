<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ApplyTemplateCreateResourceAdapter">

<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <bean:define id="isDomain" name="createResourceAdapterForm" property="isDomain"/>
  <logic:equal name="isDomain" value="false">
    <sj:tab forward="ActionEditDeploy"><bean:message key="tab.deployment"/></sj:tab>
   </logic:equal>
      
  <logic:equal name="isDomain" value="true">
    <sj:tab forward="ActionEditDomainDeploy"><bean:message key="tab.deployment.domain"/></sj:tab>
  </logic:equal>
  <sj:tab forward="ActionEditUpload"><bean:message key="tab.deployment.upload"/></sj:tab>
  <sj:tab forward="ActionEditRemove"><bean:message key="tab.deployment.remove"/></sj:tab>
  <sj:tab forward="ActionArchiveConfigSelect"><bean:message key="tab.configure"/></sj:tab>
  <sj:tab forward="ActionCreateResourceAdapter" selected="true">
      <bean:message key="tab.resourceadapter.create"/>
  </sj:tab>
  <sj:panel>
    <logic:present name="<%=Globals.ERROR_KEY%>">
      <sj:jonasgrid>
        <sj:gridrow styleClass="errors">
          <sj:gridcol styleClass="errors"><html:errors/></sj:gridcol>
        </sj:gridrow>
      </sj:jonasgrid>
      <sj:panelSeparator/>
    </logic:present>

    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.resourceadapter.resourceadapter"/></sj:jgColTitle>
      </sj:jgRowTitle>
      <sj:gridrow>
          <sj:gridcol><b><bean:message key="message.resourcadapter.select.template"/></b></sj:gridcol>
        </sj:gridrow>
    </sj:jonasgrid>
    
 
    <sj:panelSeparator/>

    <sj:jonasgrid globalRowStyleClass="panel">
       <sj:gridrow>
          <sj:gridcol>
		    <html:radio property="template" value="JDBC"/>JDBC  (DriverManager)<br/>
		    <html:radio property="template" value="Other"/>Other <br/>
          </sj:gridcol>
        </sj:gridrow>    
      <sj:gridrow>
        <sj:jgName></sj:jgName>
        <sj:gridcol>
          <html:submit styleClass="button"><bean:message key="button.apply"/></html:submit>
		 </sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>
</html:form>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

