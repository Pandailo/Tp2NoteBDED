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
  <sj:tab forward="ActionEditJmsService" selected="true"><bean:message key="tab.jmsservice"/></sj:tab>
  <sj:tab forward="ActionListConnectionFactories"><bean:message key="tab.jms.connfacts"/></sj:tab>
  <sj:tab forward="ActionListQueues"><bean:message key="tab.jms.queues"/></sj:tab>
  <sj:tab forward="ActionListTopics"><bean:message key="tab.jms.topics"/></sj:tab>
  <sj:panel>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.service.jms.momName"/></sj:jgName>
        <sj:jgValue><bean:write name="jmsServiceForm" property="momName"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.service.jms.momLocation"/></sj:jgName>
        <sj:jgValue><bean:write name="jmsServiceForm" property="momLocation"/></sj:jgValue>
      </sj:gridrow>
	  <logic:notEqual name="jmsServiceForm" property="momUrl" value="">
        <sj:gridrow>
          <sj:jgName><bean:message key="label.service.jms.momUrl"/></sj:jgName>
          <sj:jgValue><bean:write name="jmsServiceForm" property="momUrl"/></sj:jgValue>
        </sj:gridrow>
      </logic:notEqual>

    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>