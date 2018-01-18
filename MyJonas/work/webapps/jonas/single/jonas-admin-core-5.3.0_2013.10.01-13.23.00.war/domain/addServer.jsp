<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ApplyJonasServer">
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionEditDomain"><bean:message key="tab.domain"/></sj:tab>
  <sj:tab forward="ActionCreateJonasServer" selected="true"><bean:message key="tab.domain.server.add"/></sj:tab>
  <sj:panel>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName>
          <logic:equal name="domainForm" property="cluster" value="true">
            <bean:message key="label.domain.clusterName"/>
          </logic:equal>
          <logic:notEqual name="domainForm" property="cluster" value="true">
            <bean:message key="label.domain.domainName"/>
          </logic:notEqual>
        </sj:jgName>
        <sj:jgValue><bean:write name="domainForm" property="name"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.domain.serverName"/></sj:jgName>
        <sj:jgValue><html:text name="newServerForm" property="serverName" size="20"/></sj:jgValue>
        <sj:gridcol><bean:message key="comment.domain.add.serverName"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.domain.serverURL"/></sj:jgName>
        <sj:jgValue><html:text name="newServerForm" property="serverURL" size="50"/></sj:jgValue>
        <sj:gridcol><bean:message key="comment.domain.add.serverURL"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.domain.clusterDaemonName"/></sj:jgName>
        <sj:jgValue><html:text name="newServerForm" property="serverCld" size="20"/></sj:jgValue>
        <sj:gridcol><bean:message key="comment.domain.add.serverCld"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.domain.serverUsername"/></sj:jgName>
        <sj:jgValue><html:text name="newServerForm" property="serverUsername" size="20"/></sj:jgValue>
        <sj:gridcol><bean:message key="comment.domain.add.serverUsername"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.domain.serverPassword"/></sj:jgName>
        <sj:jgValue><html:password name="newServerForm" property="serverPassword" size="20"/></sj:jgValue>
        <sj:gridcol><bean:message key="comment.domain.add.serverPassword"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.domain.serverPasswordAgain"/></sj:jgName>
        <sj:jgValue><html:password name="newServerForm" property="serverPasswordAgain" size="20"/></sj:jgValue>
        <sj:gridcol><bean:message key="comment.domain.add.serverPasswordAgain"/></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>
    <sj:panelSeparator/>

    <sj:jonasgrid globalRowStyleClass="panel">
      <sj:gridrow>
        <sj:jgName></sj:jgName>
        <sj:gridcol>
          <html:submit property="btn_apply" styleClass="button"><bean:message key="button.apply"/></html:submit>
        </sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>

    <logic:present name="<%=Globals.ERROR_KEY%>">
      <sj:jonasgrid>
        <sj:gridrow styleClass="errors">
          <sj:gridcol styleClass="errors"><html:errors/></sj:gridcol>
        </sj:gridrow>
      </sj:jonasgrid>
      <sj:panelSeparator/>
    </logic:present>
  </sj:panel>
</sj:tabs>
</html:form>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>
