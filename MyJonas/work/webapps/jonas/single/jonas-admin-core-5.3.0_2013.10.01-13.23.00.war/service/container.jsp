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
  <sj:tab forward="ActionListContainers"><bean:message key="tab.ejbcontainers"/></sj:tab>
  <sj:tab forward="ActionViewContainer" selected="true"><bean:write name="containerForm" property="filename"/></sj:tab>
  <sj:tab forward="ActionEditContainerStatistic"><bean:message key="tab.container.statistic"/></sj:tab>
  <sj:tab forward="ActionViewContainerEjbs"><bean:message key="tab.container.ejbs"/></sj:tab>
  <sj:panel>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.container.name"/></sj:jgName>
        <sj:jgValue><bean:write name="containerForm" property="containerName"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.container.path"/></sj:jgName>
        <sj:jgValue><bean:write name="containerForm" property="path"/></sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>
    <logic:equal name="containerForm" property="inEar" value="true">
      <sj:panelSeparator/>
      <sj:jonasgrid>
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="title.container.ear"/></sj:jgColTitle>
        </sj:jgRowTitle>
      </sj:jonasgrid>
      <sj:jonasgrid>
        <sj:gridrow>
          <sj:jgName>
            <html:link forward="ActionEditEar" styleClass="panel"
              paramId="select" paramName="containerForm" paramProperty="earON">
              <bean:write name="containerForm" property="earFilename"/>
            </html:link>
          </sj:jgName>
          <sj:jgValue><bean:write name="containerForm" property="earPath"/></sj:jgValue>
        </sj:gridrow>
      </sj:jonasgrid>
    </logic:equal>
  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

