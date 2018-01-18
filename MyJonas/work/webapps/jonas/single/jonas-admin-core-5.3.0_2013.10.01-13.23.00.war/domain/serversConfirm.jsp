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
  <sj:tab forward="ActionEditDomain"><bean:message key="tab.domain"/></sj:tab>
  <sj:tab forward="ActionEditDomain" selected="true">
    <bean:message key="tab.catalina.connectors.confirm"/>
    <bean:write name="itemsServersForm" property="action"/>
  </sj:tab>

  <sj:panel>
  <logic:present name="listServersSelected">
    <sj:jonasgrid>
      <bean:size id="listSize" name="listServersSelected"/>
      <logic:equal name="listSize" value="0">
        <sj:gridrow styleClass="errors">
          <sj:gridcol><bean:message key="message.domain.apply.servers.none"/></sj:gridcol>
        </sj:gridrow>
      </logic:equal>
      <logic:notEqual name="listSize" value="0">
        <logic:iterate id="item" name="listServersSelected">
          <sj:gridrow>
            <sj:jgName><bean:message key="label.domain.move.server"/></sj:jgName>
            <sj:jgValue><bean:write name="item"/></sj:jgValue>
          </sj:gridrow>
        </logic:iterate>
        <sj:gridrow>
          <sj:jgName><bean:message key="label.domain.move.from"/></sj:jgName>
          <logic:notEqual name="domainForm" property="cluster" value="true">
            <sj:jgValue>Domain</sj:jgValue>
          </logic:notEqual>
          <logic:equal name="domainForm" property="cluster" value="true">
            <sj:jgValue><bean:write name="domainForm" property="name"/></sj:jgValue>
          </logic:equal>
        </sj:gridrow>
      </logic:notEqual>
    </sj:jonasgrid>
    <logic:notEqual name="listSize" value="0">
      <sj:panelSeparator/>
      <sj:jonasgrid globalRowStyleClass="panel">
        <sj:gridrow>
          <sj:gridcol>
            <sj:jonasbutton forward="ActionApplyJonasServersConfirm">
              <bean:message key="button.confirm"/>
            </sj:jonasbutton>
          </sj:gridcol>
        </sj:gridrow>
      </sj:jonasgrid>
    </logic:notEqual>
  </logic:present>
  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>