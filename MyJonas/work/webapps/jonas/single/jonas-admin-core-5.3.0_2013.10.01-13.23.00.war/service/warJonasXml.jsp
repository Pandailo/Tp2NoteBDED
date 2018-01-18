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
  <sj:tab forward="ActionListWebContainers"><bean:message key="tab.webcontainers"/></sj:tab>
  <sj:tab forward="ActionEditWebApp">
    <bean:write name="webAppForm" property="labelPathContext"/>
  </sj:tab>
  <sj:tab forward="ActionEditWar">
    <logic:present name="warForm"  property="filename">
      <bean:write name="warForm" property="filename"/>
    </logic:present>
    <logic:notPresent name="warForm"  property="filename">
      <bean:message key="tab.war"/>
    </logic:notPresent>
  </sj:tab>
  <bean:size id="listServletsSize" name="warForm" property="listServlets"/>
  <logic:notEqual name="listServletsSize" value="0">
    <sj:tab forward="War Servlets"><bean:message key="tab.war.servlets"/></sj:tab>
  </logic:notEqual>
  <logic:notEqual name="warForm" property="xmlContent" value="">
    <sj:tab forward="War Web Xml"><bean:message key="tab.war.xmlContent"/></sj:tab>
  </logic:notEqual>
  <logic:notEqual name="warForm" property="jonasXmlContent" value="">
    <sj:tab forward="War Jonas Xml" selected="true"><bean:message key="tab.war.jonasXmlContent"/></sj:tab>
  </logic:notEqual>

  <sj:panel>
    <sj:jonasgrid globalRowStyleClass="panel">
      <sj:gridrow>
        <sj:gridcol><sj:xmlFile><bean:write name="warForm" property="jonasXmlContent"/></sj:xmlFile></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

