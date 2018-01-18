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
  <sj:tab forward="ActionListQueues"><bean:message key="tab.jms.queues"/></sj:tab>
  <sj:tab forward="ActionListTopics" selected="true"><bean:message key="tab.jms.topics"/></sj:tab>
  <sj:panel>
    <sj:jonasgrid>
      <bean:size id="listSize" name="topicsList"/>
      <logic:equal name="listSize" value="0">
        <sj:gridrow>
          <sj:gridcol><bean:message key="message.service.jms.topics.none"/></sj:gridcol>
        </sj:gridrow>
      </logic:equal>
      <logic:notEqual name="listSize" value="0">
        <logic:iterate id="item" name="topicsList">
          <sj:gridrow>
            <sj:gridcol>
              <html:link forward="ActionPresentTopic" styleClass="panel" paramId="name"  paramName="item">
                <bean:write name="item"/>
              </html:link>
            </sj:gridcol>
          </sj:gridrow>
        </logic:iterate>
      </logic:notEqual>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>