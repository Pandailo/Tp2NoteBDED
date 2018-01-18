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
  <sj:tab forward="ActionListJoramServers"><bean:message key="tab.joramservers"/></sj:tab>
  <sj:tab forward="ActionEditJoramRemoteServer" selected="true"><bean:message key="tab.joramplatform.joramremoteserver"/></sj:tab>
  <sj:panel>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joramplatform.joramremoteserver.serverId"/></sj:jgName>
        <sj:jgValue><bean:write name="joramRemoteServerForm" property="serverId"/></sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>
    <sj:panelSeparator/>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="action.title.joramplatform.joramremoteserver"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName>
          <sj:jonasbutton forward="ActionListRemoteDestinations" paramId="id" paramName="joramRemoteServerForm" paramProperty="serverId">
            <bean:message key="action.button.joramplatform.joramremoteserver.getdestinations"/>
          </sj:jonasbutton>
        </sj:jgName>
        <sj:jgValue><bean:message key="action.comment.joramplatform.joramremoteserver.getdestinations"/></sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

