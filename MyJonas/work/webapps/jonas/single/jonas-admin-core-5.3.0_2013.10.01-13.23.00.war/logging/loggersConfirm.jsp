<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ApplyLoggersConfirm">
<html:hidden property="action"/>
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionListLoggers"><bean:message key="tab.loggers"/></sj:tab>
  <sj:tab forward="ActionListLoggers" selected="true">
    <bean:message key="tab.loggers.confirm"/>
    <bean:write name="itemsLoggersForm" property="action"/>
  </sj:tab>
  <sj:panel>
    <sj:jonasgrid>
      <bean:size id="listSize" name="itemsLoggersForm" property="selectedItemsList"/>
      <logic:equal name="listSize" value="0">
        <sj:gridrow styleClass="errors">
          <sj:gridcol><bean:message key="message.loggers.none"/></sj:gridcol>
        </sj:gridrow>
      </logic:equal>
      <logic:notEqual name="listSize" value="0">
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="title.loggers.name"/></sj:jgColTitle>
          <sj:jgColTitle><bean:message key="title.loggers.container"/></sj:jgColTitle>
          <sj:jgColTitle><bean:message key="title.loggers.container.name"/></sj:jgColTitle>
        </sj:jgRowTitle>
        <logic:iterate id="item" name="itemsLoggersForm" property="selectedItemsList">
          <sj:gridrow>
            <sj:gridcol><bean:write name="item" property="name"/></sj:gridcol>
            <sj:gridcol><bean:write name="item" property="containerType"/></sj:gridcol>
            <sj:gridcol><bean:write name="item" property="containerName"/></sj:gridcol>
          </sj:gridrow>
        </logic:iterate>
      </logic:notEqual>
    </sj:jonasgrid>
    <logic:notEqual name="listSize" value="0">
      <sj:panelSeparator/>
      <sj:jonasgrid globalRowStyleClass="panel">
        <sj:gridrow>
          <sj:gridcol>
            <html:submit styleClass="button" property="btnSubmit">
              <bean:message key="button.confirm"/>
            </html:submit>
          </sj:gridcol>
        </sj:gridrow>
      </sj:jonasgrid>
    </logic:notEqual>

  </sj:panel>
</sj:tabs>
</html:form>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

