<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/JonasMqConnectDestinationAddConfirm">
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="JonasMqConnectPlatformAction"><bean:message key="tab.jonasmqconnect.servers"/></sj:tab>
  <sj:tab forward="JonasMqConnectStartAction"><bean:write name="mqconnector" /></sj:tab>
  <sj:tab forward="JonasMqConnectDestinationsAction"><bean:message key="tab.jonasmqconnect.destinations"/></sj:tab>
  <%--sj:tab forward="JonasMqConnectStartAction"><bean:message key="tab.jonasmqconnect.server"/></sj:tab>
  <sj:tab forward="JonasMqConnectDestinationsAction"><bean:message key="tab.jonasmqconnect.destinations"/></sj:tab--%>
  <sj:tab forward="JonasMqConnectDestinationAddAction" selected="true"><bean:message key="tab.jonasmqconnect.createdestination"/></sj:tab>

<sj:panel>

    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.joansmqconnect.createdestination"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>

    <logic:present name="<%=Globals.ERROR_KEY%>">
      <sj:panelSeparator/>
      <sj:jonasgrid>
        <sj:gridrow styleClass="errors">
          <sj:gridcol styleClass="errors"><html:errors/></sj:gridcol>
        </sj:gridrow>
      </sj:jonasgrid>
      <sj:panelSeparator/>
    </logic:present>

    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joansmqconnect.destination.name"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="name"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.joansmqconnect.destination.name"/></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>

    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joansmqconnect.destination.proprieties"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="proprieties"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.joansmqconnect.destination.proprieties"/></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>

    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName></sj:jgName>
        <sj:gridcol>
          <html:radio property="type" value="topic"/><bean:message key="label.joansmqconnect.destinations.topic"/>
          <html:radio property="type" value="queue"/><bean:message key="label.joansmqconnect.destinations.queue"/>
        </sj:gridcol>
        <sj:gridcol>
        </sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>

    <sj:panelSeparator/>

    <sj:jonasgrid globalRowStyleClass="panel">
      <sj:gridrow>
        <sj:jgName></sj:jgName>
          <sj:gridcol>
            <html:submit styleClass="button" property="btnApply"><bean:message key="button.apply"/></html:submit>
            &nbsp;&nbsp;
            <html:reset styleClass="button"><bean:message key="button.reset"/></html:reset>
          </sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>

  </sj:panel>
  <sj:tab forward="JonasMqConnectMdbsAction"><bean:message key="tab.jonasmqconnect.mdbs"/></sj:tab>
</sj:tabs>
</html:form>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>
