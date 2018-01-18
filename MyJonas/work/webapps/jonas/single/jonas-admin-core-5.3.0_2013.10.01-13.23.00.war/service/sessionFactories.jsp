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
  <sj:tab forward="ActionEditMailService"><bean:message key="tab.mailservice"/></sj:tab>
  <sj:tab forward="ActionListSessionMailFactories" selected="true"><bean:message key="tab.mailservice.sessions"/></sj:tab>
  <sj:tab forward="ActionListMimePartMailFactories"><bean:message key="tab.mailservice.mimeparts"/></sj:tab>
  <sj:panel>
    <sj:jonasgrid>
      <bean:size id="listSize" name="listMailFactories"/>
      <logic:equal name="listSize" value="0">
        <sj:gridrow>
          <sj:gridcol><bean:message key="message.mailservice.sessions.none"/></sj:gridcol>
        </sj:gridrow>
      </logic:equal>
      <logic:notEqual name="listSize" value="0">
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="title.mailservice.factory.name"/></sj:jgColTitle>
          <sj:jgColTitle><bean:message key="title.mailservice.factory.jndiname"/></sj:jgColTitle>
        </sj:jgRowTitle>
        <logic:iterate id="item" name="listMailFactories">
          <sj:gridrow>
            <sj:gridcol>
              <html:link forward="ActionEditSessionMailFactory" styleClass="panel"
                paramId="name" paramName="item" paramProperty="name">
                <bean:write name="item" property="name"/>
              </html:link>
            </sj:gridcol>
            <sj:gridcol>
              <bean:write name="item" property="jndiName"/>
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