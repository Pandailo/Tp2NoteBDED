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
  <sj:tab forward="ActionEditTransactionRecovery"><bean:message key="tab.jtmservice.reco"/></sj:tab>
  <sj:tab forward="ActionListXaResource"> <bean:message key="tab.jtmservice.xars"/></sj:tab>
  <sj:tab forward="ActionApplyConfirmXaResource" selected="true"><bean:message key="tab.xaresource.recovery.confirm"/></sj:tab>
  <sj:panel>
    <sj:jonasgrid>
      <bean:size id="listSize" name="itemsXaResourceForm" property="selectedItems"/>
      <!-- Empty List -->
      <logic:equal name="listSize" value="0">
        <sj:gridrow styleClass="errors">
          <sj:gridcol><bean:message key="message.xaresource.recovery.non.selected"/></sj:gridcol>
        </sj:gridrow>
      </logic:equal>
      <!-- Full List -->
      <logic:notEqual name="listSize" value="0">
        <sj:jgRowTitle>
          <sj:jgColTitle>
            <!-- COMMIT -->
              <logic:equal name="itemsXaResourceForm" property="action" value="commit">
                <bean:message key="title.xaresource.recovery.confirm.commit"/>
              </logic:equal>
            <!-- ROLLBACK -->
              <logic:equal name="itemsXaResourceForm" property="action" value="rollback">
                <bean:message key="title.xaresource.recovery.confirm.rollback"/>
              </logic:equal>
            <!-- FORGET -->
              <logic:equal name="itemsXaResourceForm" property="action" value="forget">
                <bean:message key="title.xaresource.recovery.confirm.forget"/>
              </logic:equal>
          </sj:jgColTitle>
        </sj:jgRowTitle>
        <logic:iterate id="item" name="itemsXaResourceForm" property="selectedItems">
          <sj:gridrow>
            <sj:gridcol><b><bean:write name="item"/></b></sj:gridcol>
          </sj:gridrow>
        </logic:iterate>
      </logic:notEqual>
    </sj:jonasgrid>

    <logic:notEqual name="listSize" value="0">
      <sj:panelSeparator/>
      <sj:jonasgrid globalRowStyleClass="panel">
        <sj:gridrow>
          <sj:gridcol>
            <sj:jonasbutton forward="ActionApplyConfirmXaResource">
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

