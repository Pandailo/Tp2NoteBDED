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

 <bean:define id="isDomain" name="uploadForm" property="isDomain"/>
      <logic:equal name="isDomain" value="false">
      <sj:tab forward="ActionEditDeploy"><bean:message key="tab.deployment"/></sj:tab>
      </logic:equal>
      
       <logic:equal name="isDomain" value="true">
       <sj:tab forward="ActionEditDomainDeploy"><bean:message key="tab.deployment.domain"/></sj:tab>
      </logic:equal>
  <sj:tab forward="ActionEditUpload"><bean:message key="tab.deployment.upload"/></sj:tab>
  <sj:tab forward="ActionEditUpload" selected="true"><bean:message key="tab.deployment.result"/></sj:tab>
  <sj:tab forward="ActionEditRemove"><bean:message key="tab.deployment.remove"/></sj:tab>
  
   <bean:define id="isConfig" name="uploadForm" property="isConfigurable"/>
   <logic:equal name="isConfig" value="true">
       <sj:tab forward="ActionArchiveConfigSelect"><bean:message key="tab.configure"/></sj:tab>
   </logic:equal>
   
   <sj:panel>

     <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName>FileName</sj:jgName>
        <sj:jgValue><%= request.getAttribute("fileName") %></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName>The File size</sj:jgName>
        <sj:jgValue><%= request.getAttribute("size") %></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName>Result</sj:jgName>
        <sj:jgValue><%= request.getAttribute("data") %></sj:jgValue>
      </sj:gridrow>
     </sj:jonasgrid>

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

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

