<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<meta http-equiv="refresh" content="10">
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionEditJoramPlatform"><bean:message key="tab.joramplatform"/></sj:tab>
  <logic:present name="joramPlatformForm">
    <sj:tab forward="JoramServers"><bean:message key="tab.joramservers"/></sj:tab>
  </logic:present>
  <logic:equal name="isLocalServer" value="true">
    <logic:equal name="collocatedServer" value="true">
      <sj:tab forward="ActionEditJoramServer"><bean:message key="tab.joramplatform.joramlocaldestinations"/></sj:tab>
    </logic:equal>
    <logic:notEqual name="collocatedServer" value="true">
      <sj:tab forward="ActionEditJoramServer"><bean:message key="tab.joramplatform.joramcurrentdestinations"/></sj:tab>
    </logic:notEqual>
  </logic:equal>
  <logic:notEqual name="isLocalServer" value="true">
    <sj:tab forward="ActionEditJoramServer"><bean:message key="tab.joramplatform.joramdestinations"/></sj:tab>
  </logic:notEqual>
  <logic:equal name="joramStatForm" property="type" value="queue">
  <sj:tab forward="ActionEditJoramQueue">
    <bean:write name="joramStatForm" property="name"/>
    <bean:message key="tab.joramplatform.queue"/>
  </sj:tab>
  </logic:equal>
  <logic:equal name="joramStatForm" property="type" value="topic">
  <sj:tab forward="ActionEditJoramTopic">
    <bean:write name="joramStatForm" property="name"/>
    <bean:message key="tab.joramplatform.topic"/>
  </sj:tab>
  </logic:equal>
  <sj:tab forward="JoramDestStatistics" selected="true">
    <bean:write name="joramStatForm" property="name"/>
    <bean:message key="tab.joramplatform.dest.stat"/>
  </sj:tab>
  <logic:present name="users">
    <logic:equal name="isLocalServer" value="true">
      <logic:equal name="collocatedServer" value="true">
        <sj:tab forward="JoramUsers"><bean:message key="tab.joramplatform.joramlocalusers"/></sj:tab>
      </logic:equal>
      <logic:notEqual name="collocatedServer" value="true">
        <sj:tab forward="JoramUsers"><bean:message key="tab.joramplatform.joramusers"/></sj:tab>
      </logic:notEqual>
    </logic:equal>
    <logic:notEqual name="isLocalServer" value="true">
      <sj:tab forward="JoramUsers"><bean:message key="tab.joramplatform.joramusers"/></sj:tab>
    </logic:notEqual>
  </logic:present>
  <sj:panel>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joramplatform.destination.stat.nbmsgs.received"/></sj:jgName>
        <sj:jgValue><bean:write name="joramStatForm" property="nbMsgsReceiveSinceCreation"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joramplatform.destination.stat.nbmsgs.senttodmq"/></sj:jgName>
        <sj:jgValue><bean:write name="joramStatForm" property="nbMsgsSendToDMQSinceCreation"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joramplatform.destination.stat.nbmsgs.delivered"/></sj:jgName>
        <sj:jgValue><bean:write name="joramStatForm" property="nbMsgsDeliverSinceCreation"/></sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>