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
  <sj:tab forward="ActionListCatalinaConnectors"><bean:message key="tab.catalina.connectors"/></sj:tab>
  <sj:tab forward="ActionListCatalinaConnectors" selected="true">
    <bean:message key="tab.catalina.connectors.confirm"/>
    <bean:write name="itemsConnectorsForm" property="action"/>
  </sj:tab>
  <sj:panel>
    <sj:jonasgrid>
      <bean:size id="listSize" name="listConnectorsSelected"/>
      <logic:equal name="listSize" value="0">
        <sj:gridrow styleClass="errors">
          <sj:gridcol><bean:message key="message.catalina.connectors.none"/></sj:gridcol>
        </sj:gridrow>
      </logic:equal>
      <logic:notEqual name="listSize" value="0">
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="label.catalina.connectors.port"/></sj:jgColTitle>
          <sj:jgColTitle><bean:message key="label.catalina.connectors.address"/></sj:jgColTitle>
          <sj:jgColTitle><bean:message key="label.catalina.connectors.type"/></sj:jgColTitle>
        </sj:jgRowTitle>
        <logic:iterate id="item" name="listConnectorsSelected">
          <sj:gridrow>
            <sj:gridcol width="10%"><bean:write name="item" property="port"/></sj:gridcol>
            <sj:gridcol width="20%"><bean:write name="item" property="address"/></sj:gridcol>
            <sj:gridcol><bean:write name="item" property="connectorType"/></sj:gridcol>
          </sj:gridrow>
        </logic:iterate>
      </logic:notEqual>
    </sj:jonasgrid>
    <logic:notEqual name="listSize" value="0">
      <sj:panelSeparator/>
      <sj:jonasgrid globalRowStyleClass="panel">
        <sj:gridrow>
          <sj:gridcol>
            <sj:jonasbutton forward="ConnectorsRemoveConfirm">
              <bean:message key="button.confirm"/>
            </sj:jonasbutton>
          </sj:gridcol>
        </sj:gridrow>
      </sj:jonasgrid>
    </logic:notEqual>

  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

