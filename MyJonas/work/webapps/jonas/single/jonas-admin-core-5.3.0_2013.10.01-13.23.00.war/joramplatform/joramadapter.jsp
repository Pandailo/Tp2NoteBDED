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
  <sj:tab forward="ActionEditJoramPlatform"><bean:message key="tab.joramplatform"/></sj:tab>
  <sj:tab forward="ActionEditJoramResourceAdapter" selected="true"><bean:message key="tab.joramadapter"/></sj:tab>
  <sj:panel>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joramadapter.collocated"/></sj:jgName>
        <sj:jgValue><bean:write name="joramAdapterForm" property="collocatedServer"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joramadapter.config.dir"/></sj:jgName>
        <sj:jgValue><bean:write name="joramAdapterForm" property="configDir"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joramadapter.admin.file"/></sj:jgName>
        <sj:jgValue><bean:write name="joramAdapterForm" property="adminFile"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joramadaper.persistent"/></sj:jgName>
        <sj:jgValue><bean:write name="joramAdapterForm" property="persistentServer"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joramadapter.server.id"/></sj:jgName>
        <sj:jgValue><bean:write name="joramAdapterForm" property="serverIdTxt"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joramadapter.server.name"/></sj:jgName>
        <sj:jgValue><bean:write name="joramAdapterForm" property="serverName"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joramadapter.host.name"/></sj:jgName>
        <sj:jgValue><bean:write name="joramAdapterForm" property="hostName"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joramadapter.server.port"/></sj:jgName>
        <sj:jgValue><bean:write name="joramAdapterForm" property="serverPortTxt"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joramadapter.cnx.pending.timer"/></sj:jgName>
        <sj:jgValue><bean:write name="joramAdapterForm" property="cnxPendingTimerTxt"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joramadapter.connecting.timer"/></sj:jgName>
        <sj:jgValue><bean:write name="joramAdapterForm" property="connectingTimerTxt"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joramadapter.tx.pending.timer"/></sj:jgName>
        <sj:jgValue><bean:write name="joramAdapterForm" property="txPendingTimerTxt"/></sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>
