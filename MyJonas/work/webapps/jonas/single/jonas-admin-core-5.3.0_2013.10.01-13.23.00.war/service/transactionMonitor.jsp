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
  <sj:tab forward="ActionEditJtmService"><bean:message key="tab.jtmservice"/></sj:tab>
  <sj:tab forward="ActionEditTransactionStatistic"><bean:message key="tab.jtmservice.stat"/></sj:tab>
  <sj:tab forward="ActionEditTransactionMonitor" selected="true"><bean:message key="tab.jtmservice.moni"/></sj:tab>
  <sj:tab forward="ActionEditTransactionRecovery"><bean:message key="tab.jtmservice.reco"/></sj:tab>
  <sj:panel>
    <sj:jonasgrid>
      <bean:size id="listSize" name="listTransactionsEntries"/>
      <logic:equal name="listSize" value="0">
        <sj:gridrow>
          <sj:gridcol><bean:message key="message.transactionsentries.none"/></sj:gridcol>
        </sj:gridrow>
      </logic:equal>
      <logic:notEqual name="listSize" value="0">
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="label.service.jtm.moni.date"/></sj:jgColTitle>
          <sj:jgColTitle><bean:message key="label.service.jtm.moni.transaction"/></sj:jgColTitle>
          <sj:jgColTitle><bean:message key="label.service.jtm.moni.resource"/></sj:jgColTitle>
          <sj:jgColTitle><bean:message key="label.service.jtm.moni.state"/></sj:jgColTitle>
        </sj:jgRowTitle>
        <logic:iterate id="item" name="listTransactionsEntries">
          <sj:gridrow valign="top">
            <sj:gridcol><bean:write name="item" property="date"/></sj:gridcol>
            <sj:gridcol><bean:write name="item" property="transaction"/></sj:gridcol>
            <sj:gridcol><bean:write name="item" property="resource"/></sj:gridcol>
            <sj:gridcol><bean:write name="item" property="state"/></sj:gridcol>
          </sj:gridrow>
        </logic:iterate>
      </logic:notEqual>
    </sj:jonasgrid>

    <sj:panelSeparator/>

    <sj:jonasgrid globalRowStyleClass="panel">
      <sj:gridrow>
        <sj:jgName></sj:jgName>
         <sj:gridcol>
          <sj:jonasbutton forward="ActionResetTransactions">
            <bean:message key="button.service.jtm.refreshtx"/>
          </sj:jonasbutton>
         </sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>