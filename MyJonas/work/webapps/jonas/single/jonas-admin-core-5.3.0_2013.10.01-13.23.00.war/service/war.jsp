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
  <sj:tab forward="ActionEditWar" selected="true">
    <logic:present name="warForm"  property="filename">
      <bean:write name="warForm" property="filename"/>
    </logic:present>
    <logic:notPresent name="warForm"  property="filename">
      <bean:message key="tab.war"/>
    </logic:notPresent>
  </sj:tab>
  <bean:size id="listServletsSize" name="warForm" property="listServlets"/>
  <logic:notEqual name="listServletsSize" value="0">
    <sj:tab forward="War Servlets">
      <bean:message key="tab.war.servlets"/>
    </sj:tab>
  </logic:notEqual>
  <logic:notEqual name="warForm" property="xmlContent" value="">
    <sj:tab forward="War Web Xml"><bean:message key="tab.war.xmlContent"/></sj:tab>
  </logic:notEqual>
  <logic:notEqual name="warForm" property="jonasXmlContent" value="">
    <sj:tab forward="War Jonas Xml"><bean:message key="tab.war.jonasXmlContent"/></sj:tab>
  </logic:notEqual>

  <sj:panel>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.war.container"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.war.contextRoot"/></sj:jgName>
        <sj:jgValue><bean:write name="warForm" property="contextRoot"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.war.hostName"/></sj:jgName>
        <sj:jgValue><bean:write name="warForm" property="hostName"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.war.warPath"/></sj:jgName>
        <sj:jgValue><bean:write name="warForm" property="warPath"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.war.java2DelegationModel"/></sj:jgName>
        <sj:jgValue><bean:write name="warForm" property="java2DelegationModel"/></sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>
    <logic:equal name="warForm" property="inEar" value="true">
      <sj:panelSeparator/>
      <sj:jonasgrid>
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="title.war.ear"/></sj:jgColTitle>
        </sj:jgRowTitle>
      </sj:jonasgrid>
      <sj:jonasgrid>
        <sj:gridrow>
          <logic:present name="warForm" property="earON">
            <sj:jgName>
            <html:link forward="ActionEditEar" styleClass="panel"
              paramId="select" paramName="warForm" paramProperty="earON">
              <bean:write name="warForm" property="earFilename"/>
            </html:link>
            </sj:jgName>
          </logic:present>
          <logic:notPresent name="warForm" property="earON">
            <sj:jgName>
            <bean:write name="warForm" property="earFilename"/>
            </sj:jgName>
          </logic:notPresent>
          <sj:jgValue><bean:write name="warForm" property="earPath"/></sj:jgValue>
        </sj:gridrow>
      </sj:jonasgrid>
    </logic:equal>
  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

