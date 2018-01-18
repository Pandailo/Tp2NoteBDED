<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ApplyJoramDestination">
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionEditJoramPlatform"><bean:message key="tab.joramplatform"/></sj:tab>
  <logic:present name="joramPlatformForm">
    <sj:tab forward="JoramServers"><bean:message key="tab.joramservers"/></sj:tab>
  </logic:present>
  <logic:equal name="isLocalServer" value="true">
    <logic:equal name="collocatedServer" value="true">
      <sj:tab forward="JoramDestinationsAfterCreate"><bean:message key="tab.joramplatform.joramlocalaftercreate"/></sj:tab>
    </logic:equal>
    <logic:notEqual name="collocatedServer" value="true">
      <sj:tab forward="JoramDestinationsAfterCreate"><bean:message key="tab.joramplatform.joramaftercreate"/></sj:tab>
    </logic:notEqual>
  </logic:equal>
  <logic:notEqual name="isLocalServer" value="true">
    <sj:tab forward="JoramDestinationsAfterCreate"><bean:message key="tab.joramplatform.joramaftercreate"/></sj:tab>
  </logic:notEqual>
  <sj:tab forward="ActionCreateJoramDestination" selected="true"><bean:message key="tab.joramplatform.joramdestination.create"/></sj:tab>
  <sj:panel>

    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.joramplatform.destination"/></sj:jgColTitle>
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
        <sj:jgName><bean:message key="label.joramplatform.destination.name"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="name"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.joramplatform.destination.name"/></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>

    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName></sj:jgName>
        <sj:gridcol>
          <html:radio property="type" value="topic"/><bean:message key="label.joramplatform.destinations.topic"/>
          <html:radio property="type" value="queue"/><bean:message key="label.joramplatform.destinations.queue"/>
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
</sj:tabs>
</html:form>

<%@ include file="../common/end.jsp" %>
</body>

</html:html>
