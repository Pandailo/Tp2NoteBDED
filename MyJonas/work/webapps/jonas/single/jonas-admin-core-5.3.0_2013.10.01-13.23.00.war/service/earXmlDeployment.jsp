<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionListAppContainers"><bean:message key="tab.appcontainers"/></sj:tab>
  <sj:tab forward="ActionEditEar">
    <bean:write name="earForm" property="filename"/>
  </sj:tab>
  <bean:size id="listWarsSize" name="earForm" property="wars"/>
  <logic:notEqual name="listWarsSize" value="0">
    <sj:tab forward="Ear Wars"><bean:message key="tab.ear.wars"/></sj:tab>
  </logic:notEqual>
  <bean:size id="listJarsSize" name="earForm" property="ejbjars"/>
  <logic:notEqual name="listJarsSize" value="0">
    <sj:tab forward="Ear Jars"><bean:message key="tab.ear.jars"/></sj:tab>
  </logic:notEqual>
  <bean:size id="listRarsSize" name="earForm" property="rars"/>
  <logic:notEqual name="listRarsSize" value="0">
    <sj:tab forward="Ear Rars"><bean:message key="tab.ear.rars"/></sj:tab>
  </logic:notEqual>
  <logic:present name="earForm" property="xmlDeploymentDescriptor">
    <logic:notEqual name="earForm" property="xmlDeploymentDescriptor" value="">
      <sj:tab forward="Ear Xml Deployment Descriptor" selected="true"><bean:message key="tab.ear.xmlDeploymentDescriptor"/></sj:tab>
    </logic:notEqual>
  </logic:present>

  <sj:panel>
    <sj:jonasgrid globalRowStyleClass="panel">
      <sj:gridrow>
        <sj:gridcol><sj:xmlFile><bean:write name="earForm" property="xmlDeploymentDescriptor"/></sj:xmlFile></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

