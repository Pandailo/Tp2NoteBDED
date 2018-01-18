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
  <sj:tab forward="ActionEditJoramPlatform" selected="true"><bean:message key="tab.joramplatform"/></sj:tab>
  <sj:tab forward="JoramServers"><bean:message key="tab.joramservers"/></sj:tab>
  <sj:tab forward="JoramXml"><bean:message key="tab.joramxml"/></sj:tab>

  <sj:panel>

    <logic:equal name="joramPlatformForm" property="adapterLoaded" value="true">
      <sj:jonasgrid>
        <sj:gridrow>
          <sj:jgName><bean:message key="label.joramplatform.release"/></sj:jgName>
          <sj:jgValue><bean:write name="joramPlatformForm" property="version"/></sj:jgValue>
        </sj:gridrow>
      </sj:jonasgrid>
    </logic:equal>

    <sj:panelSeparator/>

    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.joramplatform.currentserver"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>

    <logic:equal name="joramPlatformForm" property="adapterLoaded" value="true">
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joramadapter.server.id"/></sj:jgName>
        <sj:jgValue><bean:write name="joramPlatformForm" property="serverIdTxt"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joramadapter.server.name"/></sj:jgName>
        <sj:jgValue><bean:write name="joramPlatformForm" property="serverName"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joramadapter.host.name"/></sj:jgName>
        <sj:jgValue><bean:write name="joramPlatformForm" property="hostName"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joramadapter.server.port"/></sj:jgName>
        <sj:jgValue><bean:write name="joramPlatformForm" property="serverPortTxt"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joramadapter.collocated"/></sj:jgName>
        <sj:jgValue><bean:write name="joramPlatformForm" property="collocatedServer"/></sj:jgValue>
      </sj:gridrow>
      <logic:present name="joramPlatformForm" property="configDir">
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joramadapter.config.dir"/></sj:jgName>
        <sj:jgValue><bean:write name="joramPlatformForm" property="configDir"/></sj:jgValue>
      </sj:gridrow>
      </logic:present>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joramadaper.persistent"/></sj:jgName>
        <sj:jgValue><bean:write name="joramPlatformForm" property="persistentServer"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joramadapter.admin.file"/></sj:jgName>
        <sj:jgValue><bean:write name="joramPlatformForm" property="adminFile"/></sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>
    </logic:equal>

    <logic:notEqual name="joramPlatformForm" property="adapterLoaded" value="true">
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="tab.joramplatform.joramlocalserver"/></sj:jgName>
        <sj:jgValue><bean:write name="joramPlatformForm" property="localServer"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joramplatform.joramlocalserver.host"/></sj:jgName>
        <sj:jgValue><bean:write name="joramPlatformForm" property="localHost"/></sj:jgValue>
      </sj:gridrow>
      <logic:notEqual name="joramPlatformForm" property="localPort" value="-1">
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joramplatform.joramlocalserver.port"/></sj:jgName>
        <sj:jgValue><bean:write name="joramPlatformForm" property="localPort"/></sj:jgValue>
      </sj:gridrow>
      </logic:notEqual>
      <logic:equal name="joramPlatformForm" property="localPort" value="-1">
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joramadapter.collocated"/></sj:jgName>
        <sj:jgValue><bean:message key="title.webapp.context"/></sj:jgValue>
      </sj:gridrow>
      </logic:equal>
    </sj:jonasgrid>
    </logic:notEqual>

    <sj:panelSeparator/>

    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.joramplatform.timers"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>

    <sj:jonasgrid>
    <logic:equal name="joramPlatformForm" property="adapterLoaded" value="true">
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joramadapter.connecting.timer"/></sj:jgName>
        <sj:gridcol valign="top"><bean:write name="joramPlatformForm" property="connectingTimerTxt"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.joramadapter.connecting.timer"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joramadapter.cnx.pending.timer"/></sj:jgName>
        <sj:gridcol valign="top"><bean:write name="joramPlatformForm" property="cnxPendingTimerTxt"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.joramadapter.cnx.pending.timer"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joramadapter.tx.pending.timer"/></sj:jgName>
        <sj:gridcol valign="top"><bean:write name="joramPlatformForm" property="txPendingTimerTxt"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.joramadapter.tx.pending.timer"/></sj:gridcol>
      </sj:gridrow>
    </logic:equal>

      <sj:gridrow>
        <sj:jgName><bean:message key="label.joramadmin.timeout"/></sj:jgName>
        <sj:gridcol valign="top"><bean:write name="joramPlatformForm" property="timeOutToAbortRequest"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.joramadmin.timeout"/></sj:gridcol>
      </sj:gridrow>

    </sj:jonasgrid>

    <sj:panelSeparator/>

    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.joramplatform.dmq"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>

    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joramadmin.default.dmq"/></sj:jgName>
        <logic:empty name="joramPlatformForm" property="defaultDMQ">
          <sj:jgValue><bean:message key="label.joramadmin.dmq.notset"/></sj:jgValue>
        </logic:empty>
        <logic:notEmpty name="joramPlatformForm" property="defaultDMQ">
          <sj:jgValue><bean:write name="joramPlatformForm" property="defaultDMQ"/></sj:jgValue>
        </logic:notEmpty>
      </sj:gridrow>
      <logic:equal name="joramPlatformForm" property="defaultThreshold" value="-1">
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joramadmin.default.threshold"/></sj:jgName>
        <sj:jgValue><bean:message key="label.joramadmin.dmq.notset"/></sj:jgValue>
      </sj:gridrow>
      </logic:equal>
      <logic:notEqual name="joramPlatformForm" property="defaultThreshold" value="-1">
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joramadmin.default.threshold"/></sj:jgName>
        <sj:jgValue><bean:write name="joramPlatformForm" property="defaultThreshold"/></sj:jgValue>
      </sj:gridrow>
      </logic:notEqual>
    </sj:jonasgrid>

    <sj:panelSeparator/>

    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="action.title.joramplatform.export"/></sj:jgColTitle>
      </sj:jgRowTitle>

    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><sj:jonasbutton forward="ActionExportRepository"><bean:message key="action.button.joramplatform.export"/></sj:jonasbutton></sj:jgName>
        <sj:jgValue><bean:message key="action.comment.joramplatform.export"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><sj:jonasbutton forward="ActionReloadJoramAdmin"><bean:message key="action.button.joramplatform.reload"/></sj:jonasbutton></sj:jgName>
        <sj:jgValue><bean:message key="action.comment.joramplatform.reload"/></sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>

  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>