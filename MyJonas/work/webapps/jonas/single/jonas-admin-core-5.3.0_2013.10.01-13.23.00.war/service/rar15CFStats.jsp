<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.action.Action"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/EditResourceAdapterCFStat">
<html:hidden property="action"/>
<meta http-equiv="refresh" content="10">

<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionListResourceAdapters"><bean:message key="tab.resourceadapters"/></sj:tab>
  <sj:tab forward="ActionEditResourceAdapter"><bean:write name="resourceAdapterForm" property="name"/></sj:tab>
 <bean:size id="listCFSize" name="resourceAdapterForm" property="CF"/>
  <logic:notEqual name="listCFSize" value="0">
    <sj:tab forward="Rar ConnectionFactories"><bean:message key="tab.rar.cf"/></sj:tab>
  </logic:notEqual>
  <bean:size id="listASSize" name="resourceAdapterForm" property="AS"/>
  <logic:notEqual name="listASSize" value="0">
    <sj:tab forward="Rar ActivationSpecs"><bean:message key="tab.rar.as"/></sj:tab>
  </logic:notEqual>
  <bean:size id="listAOSize" name="resourceAdapterForm" property="AO"/>
  <logic:notEqual name="listAOSize" value="0">
    <sj:tab forward="Rar AdminObjects"><bean:message key="tab.rar.ao"/></sj:tab>
  </logic:notEqual>
  <sj:tab forward="ActionEditResourceAdapterCF">
    <bean:write name="resourceAdapterCFForm" property="name"/>
  </sj:tab>
  <sj:tab forward="ActionEditResourceAdapterCFStat" selected="true"><bean:message key="tab.resourceadapter.rar.statistics"/></sj:tab>
  <bean:size id="listSize" name="resourceAdapterForm" property="listUsedByEjb"/>
  <logic:notEqual name="listSize" value="0">
    <sj:tab forward="ResourceAdapter Used By1.5"><bean:message key="tab.resourceadapter.rar.usedby"/></sj:tab>
  </logic:notEqual>

  <sj:panel>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.rar.poolState"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.rar.currentOpened"/></sj:jgName>
        <sj:gridcol><bean:write name="resourceAdapterCFForm" property="currentOpened"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.rar.currentOpened"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.rar.currentBusy"/></sj:jgName>
        <sj:gridcol><bean:write name="resourceAdapterCFForm" property="currentBusy"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.rar.currentBusy"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.rar.currentInTx"/></sj:jgName>
        <sj:gridcol><bean:write name="resourceAdapterCFForm" property="currentInTx"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.rar.currentInTx"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.rar.busyMin"/></sj:jgName>
        <sj:gridcol><bean:write name="resourceAdapterCFForm" property="busyMinRecent"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.rar.busyMin"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.rar.busyMax"/></sj:jgName>
        <sj:gridcol><bean:write name="resourceAdapterCFForm" property="busyMaxRecent"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.rar.busyMax"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.rar.connectionLeaks"/></sj:jgName>
        <sj:gridcol><bean:write name="resourceAdapterCFForm" property="connectionLeaks"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.rar.connectionLeaks"/></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>

    <sj:panelSeparator/>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.rar.getConnectionStat"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.rar.servedOpen"/></sj:jgName>
        <sj:gridcol><bean:write name="resourceAdapterCFForm" property="servedOpen"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.rar.servedOpen"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.rar.rejectedOpen"/></sj:jgName>
        <sj:gridcol><bean:write name="resourceAdapterCFForm" property="rejectedOpen"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.rar.rejectedOpen"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.rar.rejectedFull"/></sj:jgName>
        <sj:gridcol><bean:write name="resourceAdapterCFForm" property="rejectedFull"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.rar.rejectedFull"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.rar.rejectedTimeout"/></sj:jgName>
        <sj:gridcol><bean:write name="resourceAdapterCFForm" property="rejectedTimeout"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.rar.rejectedTimeout"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.rar.rejectedOther"/></sj:jgName>
        <sj:gridcol><bean:write name="resourceAdapterCFForm" property="rejectedOther"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.rar.rejectedOther"/></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>

    <sj:panelSeparator/>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.rar.waitersStat"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.rar.currentWaiters"/></sj:jgName>
        <sj:gridcol><bean:write name="resourceAdapterCFForm" property="currentWaiters"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.rar.currentWaiters"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.rar.waitersHigh"/></sj:jgName>
        <sj:gridcol><bean:write name="resourceAdapterCFForm" property="waitersHigh"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.rar.waitersHigh"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.rar.waitersHighRecent"/></sj:jgName>
        <sj:gridcol><bean:write name="resourceAdapterCFForm" property="waitersHighRecent"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.rar.waitersHighRecent"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.rar.waiterCount"/></sj:jgName>
        <sj:gridcol><bean:write name="resourceAdapterCFForm" property="waiterCount"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.rar.waiterCount"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.rar.waitingHigh"/></sj:jgName>
        <sj:gridcol><bean:write name="resourceAdapterCFForm" property="waitingHigh"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.rar.waitingHigh"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.rar.waitingHighRecent"/></sj:jgName>
        <sj:gridcol><bean:write name="resourceAdapterCFForm" property="waitingHighRecent"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.rar.waitingHighRecent"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.rar.waitingTime"/></sj:jgName>
        <sj:gridcol><bean:write name="resourceAdapterCFForm" property="waitingTime"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.rar.waitingTime"/></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>

    <sj:panelSeparator/>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.rar.openPhysConn"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.rar.openedCount"/></sj:jgName>
        <sj:gridcol><bean:write name="resourceAdapterCFForm" property="openedCount"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.rar.openedCount"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.rar.connectionFailures"/></sj:jgName>
        <sj:gridcol><bean:write name="resourceAdapterCFForm" property="connectionFailures"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.rar.connectionFailures"/></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>

    <sj:panelSeparator/>
    <sj:jonasgrid globalRowStyleClass="panel">
      <sj:gridrow>
        <sj:jgName></sj:jgName>
        <sj:gridcol>
          <html:button property="btn_apply" styleClass="button"
            onclick="submitHidden('resourceAdapterCFForm','action','apply')">
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
