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
  <sj:tab forward="ActionEditWebApp" selected="true">
    <bean:write name="webAppForm" property="pathContext"/>
  </sj:tab>
  <logic:present name="webAppForm" property="path">
    <bean:size id="listServletsSize" name="webAppForm" property="listServlets"/>
    <logic:notEqual name="listServletsSize" value="0">
      <sj:tab forward="War Servlets">
        <bean:message key="tab.war.servlets"/>
      </sj:tab>
    </logic:notEqual>
    <logic:notEqual name="webAppForm" property="xmlContent" value="">
      <sj:tab forward="War Web Xml"><bean:message key="tab.war.xmlContent"/></sj:tab>
    </logic:notEqual>
    <logic:notEqual name="webAppForm" property="jonasXmlContent" value="">
      <sj:tab forward="War Jonas Xml"><bean:message key="tab.war.jonasXmlContent"/></sj:tab>
    </logic:notEqual>
  </logic:present>
  <sj:panel>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.war.context"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.war.contextRoot"/></sj:jgName>
        <sj:jgValue><bean:write name="webAppForm" property="contextRoot"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.war.hostName"/></sj:jgName>
        <sj:jgValue><bean:write name="webAppForm" property="hostName"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.war.warPath"/></sj:jgName>
        <sj:jgValue><bean:write name="webAppForm" property="warPath"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.war.java2DelegationModel"/></sj:jgName>
        <sj:jgValue><bean:write name="webAppForm" property="java2DelegationModel"/></sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>
    <logic:equal name="webAppForm" property="inEarCase" value="true">
      <sj:panelSeparator/>
      <sj:jonasgrid>
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="title.war.ear"/></sj:jgColTitle>
        </sj:jgRowTitle>
      </sj:jonasgrid>
      <sj:jonasgrid>
        <sj:gridrow>
          <sj:jgName>
            <html:link forward="ActionEditEar" styleClass="panel"
              paramId="path" paramName="webAppForm" paramProperty="earPath">
              <bean:write name="webAppForm" property="earFilename"/>
            </html:link>
          </sj:jgName>
          <sj:jgValue><bean:write name="webAppForm" property="earPath"/></sj:jgValue>
        </sj:gridrow>
      </sj:jonasgrid>
    </logic:equal>
  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

