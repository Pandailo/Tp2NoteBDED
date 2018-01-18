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
    <sj:tab forward="Ear Jars" selected="true"><bean:message key="tab.ear.jars"/></sj:tab>
  </logic:notEqual>
  <bean:size id="listRarsSize" name="earForm" property="rars"/>
  <logic:notEqual name="listRarsSize" value="0">
    <sj:tab forward="Ear Rars"><bean:message key="tab.ear.rars"/></sj:tab>
  </logic:notEqual>
  <logic:present name="earForm" property="xmlDeploymentDescriptor">
    <logic:notEqual name="earForm" property="xmlDeploymentDescriptor" value="">
      <sj:tab forward="Ear Xml Deployment Descriptor"><bean:message key="tab.ear.xmlDeploymentDescriptor"/></sj:tab>
    </logic:notEqual>
  </logic:present>

  <sj:panel>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.ear.jars.name"/></sj:jgColTitle>
        <sj:jgColTitle><bean:message key="title.ear.jars.path"/></sj:jgColTitle>
      </sj:jgRowTitle>
      <logic:iterate id="item" name="earForm" property="ejbjars">
        <sj:gridrow valign="top">
          <sj:gridcol>
            <html:link forward="ActionEditContainer" styleClass="panel"
              paramId="select" paramName="item" paramProperty="objectName">
              <bean:write name="item" property="name"/>
            </html:link>
          </sj:gridcol>
          <sj:gridcol>
            <bean:write name="item" property="filePath"/>
          </sj:gridcol>
        </sj:gridrow>
      </logic:iterate>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

