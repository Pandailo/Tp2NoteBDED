
<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ApplyMonitoring">
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionEditMonitoring" selected="true"><bean:message key="tab.monitoring.general"/></sj:tab>
  <!--logic:equal name="WhereAreYou" property="jonasActivatedMonitoring" value="true"-->
  <logic:equal name="monitoringForm" property="activated" value="true">
    <sj:tab forward="ActionEditMemory"><bean:message key="tab.monitoring.memory"/></sj:tab>
	<sj:tab forward="ActionEditStackDump"><bean:message key="tab.monitoring.stackdump"/></sj:tab>
  </logic:equal>
  <sj:panel>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="get.title.monitoring.general"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid globalRowStyleClass="panel">
      <sj:gridrow>
        <sj:jgName><bean:message key="get.label.monitoring.general.activated"/></sj:jgName>
        <sj:jgValue><html:checkbox property="activated"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName></sj:jgName>
        <sj:jgValue><html:submit styleClass="button"><bean:message key="button.apply"/></html:submit></sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>
    <sj:panelSeparator/>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="list.title.monitoring.general"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="list.label.monitoring.general.allThreadsCount"/></sj:jgName>
        <sj:jgValue><bean:write name="monitoringForm" property="allThreadsCount"/></sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>
</html:form>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

