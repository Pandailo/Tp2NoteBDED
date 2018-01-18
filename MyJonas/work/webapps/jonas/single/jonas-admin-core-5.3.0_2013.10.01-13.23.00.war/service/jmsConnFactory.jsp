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
  <sj:tab forward="ActionEditJmsService"><bean:message key="tab.jmsservice"/></sj:tab>
  <sj:tab forward="ActionListConnectionFactories"><bean:message key="tab.jms.connfacts"/></sj:tab>
  <sj:tab selected="true">
    <bean:write name="cfForm" property="name"/>
  </sj:tab>
  <bean:size id="listSize" name="cfForm" property="listUsedByEjb"/>
  <logic:notEqual name="listSize" value="0">
    <sj:tab forward="ConnectionFactory Used By"><bean:message key="tab.jms.cf.usedby"/></sj:tab>
  </logic:notEqual>
  <sj:tab forward="ActionListQueues"><bean:message key="tab.jms.queues"/></sj:tab>
  <sj:tab forward="ActionListTopics"><bean:message key="tab.jms.topics"/></sj:tab>
  <sj:panel>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.service.jms.cf.mode"/></sj:jgName>
        <sj:jgValue><bean:write name="cfForm" property="mode"/></sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>