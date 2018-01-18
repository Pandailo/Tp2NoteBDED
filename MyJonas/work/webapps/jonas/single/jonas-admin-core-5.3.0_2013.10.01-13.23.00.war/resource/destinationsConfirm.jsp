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
  <sj:tab forward="ActionListJmsResources"><bean:message key="tab.resource.destinations"/></sj:tab>
  <sj:tab forward="ActionApplyDestinations" selected="true"><bean:message key="tab.resource.destinations.confirm"/></sj:tab>
  <sj:panel>
    <sj:jonasgrid>
      <bean:size id="listSize" name="itemsDestinationsForm" property="selectedItems"/>
      <!-- Empty List -->
      <logic:equal name="listSize" value="0">
        <sj:gridrow styleClass="errors">
          <sj:gridcol><bean:message key="message.resource.destinations.list.empty"/></sj:gridcol>
        </sj:gridrow>
      </logic:equal>
      <!-- Full List -->
      <logic:notEqual name="listSize" value="0">
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="label.resource.destinations.name"/></sj:jgColTitle>
        </sj:jgRowTitle>

        <logic:iterate id="item" name="itemsDestinationsForm" property="selectedItems">
          <sj:gridrow>
            <sj:gridcol><bean:write name="item"/></sj:gridcol>
          </sj:gridrow>
        </logic:iterate>
      </logic:notEqual>
    </sj:jonasgrid>

    <logic:notEqual name="listSize" value="0">
      <sj:panelSeparator/>
      <sj:jonasgrid globalRowStyleClass="panel">
        <sj:gridrow>
          <sj:gridcol>
            <sj:jonasbutton forward="ActionApplyConfirmDestinations">
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