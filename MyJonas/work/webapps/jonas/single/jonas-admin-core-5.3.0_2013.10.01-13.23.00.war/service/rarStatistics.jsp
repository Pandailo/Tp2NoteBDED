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
  <sj:tab forward="ActionListResourceAdapters"><bean:message key="tab.resourceadapters"/></sj:tab>
  <sj:tab forward="ActionEditResourceAdapter"><bean:write name="resourceAdapterForm" property="name"/></sj:tab>
  <sj:tab forward="ActionEditResourceAdapterStat" selected="true"><bean:message key="tab.resourceadapter.rar.statistics"/></sj:tab>
  <bean:size id="listSize" name="resourceAdapterForm" property="listUsedByEjb"/>
  <logic:notEqual name="listSize" value="0">
    <sj:tab forward="ResourceAdapter Used By"><bean:message key="tab.resourceadapter.rar.usedby"/></sj:tab>
  </logic:notEqual>

  <sj:panel>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.resourceadapter.rar.poolState"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.rar.currentOpened"/></sj:jgName>
        <sj:gridcol><bean:write name="resourceAdapterForm" property="currentOpened"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.rar.currentOpened"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.rar.currentBusy"/></sj:jgName>
        <sj:gridcol><bean:write name="resourceAdapterForm" property="currentBusy"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.rar.currentBusy"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.rar.currentInTx"/></sj:jgName>
        <sj:gridcol><bean:write name="resourceAdapterForm" property="currentInTx"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.rar.currentInTx"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.rar.busyMin"/></sj:jgName>
        <sj:gridcol><bean:write name="resourceAdapterForm" property="busyMinRecent"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.rar.busyMin"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.rar.busyMax"/></sj:jgName>
        <sj:gridcol><bean:write name="resourceAdapterForm" property="busyMaxRecent"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.rar.busyMax"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.rar.connectionLeaks"/></sj:jgName>
        <sj:gridcol><bean:write name="resourceAdapterForm" property="connectionLeaks"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.rar.connectionLeaks"/></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>  
     
    <sj:panelSeparator/>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.resourceadapter.rar.getConnectionStat"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.rar.servedOpen"/></sj:jgName>
        <sj:gridcol><bean:write name="resourceAdapterForm" property="servedOpen"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.rar.servedOpen"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.rar.rejectedOpen"/></sj:jgName>
        <sj:gridcol><bean:write name="resourceAdapterForm" property="rejectedOpen"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.rar.rejectedOpen"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.rar.rejectedFull"/></sj:jgName>
        <sj:gridcol><bean:write name="resourceAdapterForm" property="rejectedFull"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.rar.rejectedFull"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.rar.rejectedTimeout"/></sj:jgName>
        <sj:gridcol><bean:write name="resourceAdapterForm" property="rejectedTimeout"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.rar.rejectedTimeout"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.rar.rejectedOther"/></sj:jgName>
        <sj:gridcol><bean:write name="resourceAdapterForm" property="rejectedOther"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.rar.rejectedOther"/></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>
         
    <sj:panelSeparator/>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.resourceadapter.rar.waitersStat"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.rar.currentWaiters"/></sj:jgName>
        <sj:gridcol><bean:write name="resourceAdapterForm" property="currentWaiters"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.rar.currentWaiters"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.rar.waitersHigh"/></sj:jgName>
        <sj:gridcol><bean:write name="resourceAdapterForm" property="waitersHigh"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.rar.waitersHigh"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.rar.waitersHighRecent"/></sj:jgName>
        <sj:gridcol><bean:write name="resourceAdapterForm" property="waitersHighRecent"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.rar.waitersHighRecent"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.rar.waiterCount"/></sj:jgName>
        <sj:gridcol><bean:write name="resourceAdapterForm" property="waiterCount"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.rar.waiterCount"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.rar.waitingHigh"/></sj:jgName>
        <sj:gridcol><bean:write name="resourceAdapterForm" property="waitingHigh"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.rar.waitingHigh"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.rar.waitingHighRecent"/></sj:jgName>
        <sj:gridcol><bean:write name="resourceAdapterForm" property="waitingHighRecent"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.rar.waitingHighRecent"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.rar.waitingTime"/></sj:jgName>
        <sj:gridcol><bean:write name="resourceAdapterForm" property="waitingTime"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.rar.waitingTime"/></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>  
         
    <sj:panelSeparator/>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.resourceadapter.rar.openPhysConn"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.rar.openedCount"/></sj:jgName>
        <sj:gridcol><bean:write name="resourceAdapterForm" property="openedCount"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.rar.openedCount"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.rar.connectionFailures"/></sj:jgName>
        <sj:gridcol><bean:write name="resourceAdapterForm" property="connectionFailures"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.rar.connectionFailures"/></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>
    
    <sj:panelSeparator/>
    <sj:jonasgrid globalRowStyleClass="panel">
      <sj:gridrow>
        <sj:jgName></sj:jgName>
        <sj:gridcol>
          <html:button property="btn_apply" styleClass="button"
            onclick="submitHidden('resourceAdapterForm','action','apply')">
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
