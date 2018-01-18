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
  <sj:tab forward="ActionListConnectionFactories" selected="true"><bean:message key="tab.jms.connfacts"/></sj:tab>
  <sj:tab forward="ActionListQueues"><bean:message key="tab.jms.queues"/></sj:tab>
  <sj:tab forward="ActionListTopics"><bean:message key="tab.jms.topics"/></sj:tab>
  <sj:panel>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.jms.connfact.name"/></sj:jgColTitle>
        <sj:jgColTitle><bean:message key="title.jms.connfact.comment"/></sj:jgColTitle>
      </sj:jgRowTitle>
      <logic:iterate id="cf" name="cfList">
        <sj:gridrow valign="top">
          <sj:gridcol>
            <html:link forward="ActionPresentConnectionFactory" styleClass="panel"
              paramId="name" paramName="cf" paramProperty="name">
              <bean:write name="cf" property="name" />
            </html:link>
          </sj:gridcol>
          <sj:gridcol><bean:write name="cf" property="comment" /></sj:gridcol>
        </sj:gridrow>
      </logic:iterate>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>