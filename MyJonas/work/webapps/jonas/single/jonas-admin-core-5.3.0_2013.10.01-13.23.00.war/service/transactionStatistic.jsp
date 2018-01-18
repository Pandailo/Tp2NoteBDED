<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<meta http-equiv="refresh" content="10"; URL="EditTransactionStatistic.do">
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionEditJtmService"><bean:message key="tab.jtmservice"/></sj:tab>
  <sj:tab forward="ActionEditTransactionStatistic" selected="true"><bean:message key="tab.jtmservice.stat"/></sj:tab>
  <sj:tab forward="ActionEditTransactionMonitor"><bean:message key="tab.jtmservice.moni"/></sj:tab>
  <sj:tab forward="ActionEditTransactionRecovery"><bean:message key="tab.jtmservice.reco"/></sj:tab>
  <sj:panel>
    <sj:jonasgrid>
      <sj:jgRowTitle level="2">
        <sj:jgColTitle><bean:message key="title.catalina.connectors.action"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow changeStyle="true">
        <sj:gridcol>
          <sj:grid cellPadding="10">
            <sj:gridrow>
              <sj:gridcol>
          <sj:jonasbutton forward="ActionResetCounters">
            <bean:message key="button.service.jtm.reset"/>
          </sj:jonasbutton>
              </sj:gridcol>
            </sj:gridrow>
          </sj:grid>
        </sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>

    <sj:panelSeparator/>

    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.service.jtm.stat.current"/></sj:jgName>
        <sj:jgValue><bean:write name="jtmStatisticForm" property="currentTransactions"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.service.jtm.stat.begun"/></sj:jgName>
        <sj:jgValue><bean:write name="jtmStatisticForm" property="begunTransactions"/></sj:jgValue>
        <sj:jgValue></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.service.jtm.stat.commited"/></sj:jgName>
        <sj:jgValue><bean:write name="jtmStatisticForm" property="commitedTransactions"/></sj:jgValue>
        <sj:jgValue></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.service.jtm.stat.rolledback"/></sj:jgName>
        <sj:jgValue><bean:write name="jtmStatisticForm" property="rollBackedTransactions"/></sj:jgValue>
        <sj:jgValue></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.service.jtm.stat.expired"/></sj:jgName>
        <sj:jgValue><bean:write name="jtmStatisticForm" property="expiredTransactions"/></sj:jgValue>
        <sj:jgValue></sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>