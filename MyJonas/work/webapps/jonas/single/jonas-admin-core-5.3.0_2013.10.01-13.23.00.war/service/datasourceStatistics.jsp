<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.action.Action"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ApplyDatasourceStat">
<html:hidden property="action"/>
<meta http-equiv="refresh" content="10">

<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionListDatabases"><bean:message key="tab.database.datasources"/></sj:tab>
  <sj:tab forward="ActionEditDatasource"><bean:write name="datasourceForm" property="datasourceName"/></sj:tab>
  <sj:tab forward="ActionEditDatasourceStat" selected="true"><bean:message key="tab.database.datasource.statistics"/></sj:tab>
  <bean:size id="listSize" name="datasourceForm" property="listUsedByEjb"/>
  <logic:notEqual name="listSize" value="0">
    <sj:tab forward="Datasource Used By"><bean:message key="tab.database.datasource.usedby"/></sj:tab>
  </logic:notEqual>

  <sj:panel>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.database.datasource.poolState"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.database.datasource.currentOpened"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="currentOpened"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.database.datasource.currentOpened"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.database.datasource.currentBusy"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="currentBusy"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.database.datasource.currentBusy"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.database.datasource.currentInTx"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="currentInTx"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.database.datasource.currentInTx"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.database.datasource.busyMin"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="busyMinRecent"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.database.datasource.busyMin"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.database.datasource.busyMax"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="busyMaxRecent"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.database.datasource.busyMax"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.database.datasource.connectionLeaks"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="connectionLeaks"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.database.datasource.connectionLeaks"/></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>  
     
    <sj:panelSeparator/>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.database.datasource.getConnectionStat"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.database.datasource.servedOpen"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="servedOpen"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.database.datasource.servedOpen"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.database.datasource.rejectedOpen"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="rejectedOpen"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.database.datasource.rejectedOpen"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.database.datasource.rejectedFull"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="rejectedFull"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.database.datasource.rejectedFull"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.database.datasource.rejectedTimeout"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="rejectedTimeout"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.database.datasource.rejectedTimeout"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.database.datasource.rejectedOther"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="rejectedOther"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.database.datasource.rejectedOther"/></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>
         
    <sj:panelSeparator/>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.database.datasource.waitersStat"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.database.datasource.currentWaiters"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="currentWaiters"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.database.datasource.currentWaiters"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.database.datasource.waitersHigh"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="waitersHigh"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.database.datasource.waitersHigh"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.database.datasource.waitersHighRecent"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="waitersHighRecent"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.database.datasource.waitersHighRecent"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.database.datasource.waiterCount"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="waiterCount"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.database.datasource.waiterCount"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.database.datasource.waitingHigh"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="waitingHigh"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.database.datasource.waitingHigh"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.database.datasource.waitingHighRecent"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="waitingHighRecent"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.database.datasource.waitingHighRecent"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.database.datasource.waitingTime"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="waitingTime"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.database.datasource.waitingTime"/></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>  
         
    <sj:panelSeparator/>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.database.datasource.openPhysConn"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.database.datasource.openedCount"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="openedCount"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.database.datasource.openedCount"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.database.datasource.connectionFailures"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="connectionFailures"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.database.datasource.connectionFailures"/></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>
    
    <sj:panelSeparator/>
    <sj:jonasgrid globalRowStyleClass="panel">
      <sj:gridrow>
        <sj:jgName></sj:jgName>
        <sj:gridcol>
          <html:button property="btn_apply" styleClass="button"
            onclick="submitHidden('datasourceForm','action','apply')">
            <bean:message key="button.refresh"/>
          </html:button>
        </sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>
</html:form>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>
