<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">

<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">  
  <bean:define id="isDomain" name="archiveConfigForm" property="isDomain"/>
  <logic:equal name="isDomain" value="false">
    <sj:tab forward="ActionEditDeploy"><bean:message key="tab.deployment"/></sj:tab>
   </logic:equal>
      
  <logic:equal name="isDomain" value="true">
    <sj:tab forward="ActionEditDomainDeploy"><bean:message key="tab.deployment.domain"/></sj:tab>
  </logic:equal>
  <sj:tab forward="ActionEditUpload"><bean:message key="tab.deployment.upload"/></sj:tab>
  <sj:tab forward="ActionEditRemove"><bean:message key="tab.deployment.remove"/></sj:tab>
  <sj:tab forward="ActionArchiveConfigSelect"><bean:message key="tab.configure"/></sj:tab>
  <sj:tab forward="ActionArchiveConfig" selected="true"><bean:message key="tab.config.confirm"/></sj:tab>
  <sj:panel>

  <sj:jonasgrid>
  	<sj:jgRowTitle>
  		<sj:jgColTitle><bean:message key="title.config.confirmed"/></sj:jgColTitle>
  		<sj:jgColTitle> </sj:jgColTitle>  		
  	</sj:jgRowTitle>
  	<sj:gridrow>
  		<sj:gridcol><bean:message key="message.config.archiveName"/></sj:gridcol>
  		<sj:gridcol><bean:write name="archiveConfigForm" property="archiveName" /></sj:gridcol>  		
  	</sj:gridrow>
  	<sj:gridrow>
  		<sj:gridcol><bean:message key="message.config.fileName"/></sj:gridcol>
  		<sj:gridcol><bean:write name="archiveConfigForm" property="pathName" /></sj:gridcol>  		
  	</sj:gridrow>
  </sj:jonasgrid>
  
  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>
