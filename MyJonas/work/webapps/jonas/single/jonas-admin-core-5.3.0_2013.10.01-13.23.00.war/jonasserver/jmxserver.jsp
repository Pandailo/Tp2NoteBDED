<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>
<% String cmi = (String)request.getAttribute("cmi");
   String master = (String)request.getAttribute("master");
%>

<body class="content">
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forwardControl="ActionEditJonasServer"><bean:message key="tab.server.jonas"/></sj:tab>
  <sj:tab forward="ActionEditJmxServer" selected="true"><bean:message key="tab.server.jmx"/></sj:tab>
  <%if("true".equals(cmi) || "true".equals(master)){%>
  <sj:tab forward="ActionDisplayCmi"><bean:message key="tab.server.services.cmi"/></sj:tab>
  <%}%>
  <sj:tab forward="ActionListRegistry"><bean:message key="tab.server.registry"/></sj:tab>
  <logic:equal name="jmxServerForm" property="presentServletContainer" value="true">
    <sj:tab forward="ActionEditServletServer"><bean:message key="tab.server.servlet"/></sj:tab>
  </logic:equal>
  <sj:tab forward="ActionEditJvm"><bean:message key="tab.server.jvm"/></sj:tab>
  <sj:panel>
    <html:errors/>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.server.jmx.MBeanServerId"/></sj:jgName>
        <sj:jgValue><bean:write name="jmxServerForm" property="MBeanServerId"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.server.jmx.SpecificationName"/></sj:jgName>
        <sj:jgValue><bean:write name="jmxServerForm" property="specificationName"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.server.jmx.SpecificationVersion"/></sj:jgName>
        <sj:jgValue><bean:write name="jmxServerForm" property="specificationVersion"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.server.jmx.SpecificationVendor"/></sj:jgName>
        <sj:jgValue><bean:write name="jmxServerForm" property="specificationVendor"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.server.jmx.ImplementationName"/></sj:jgName>
        <sj:jgValue><bean:write name="jmxServerForm" property="implementationName"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.server.jmx.ImplementationVersion"/></sj:jgName>
        <sj:jgValue><bean:write name="jmxServerForm" property="implementationVersion"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.server.jmx.ImplementationVendor"/></sj:jgName>
        <sj:jgValue><bean:write name="jmxServerForm" property="implementationVendor"/></sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

