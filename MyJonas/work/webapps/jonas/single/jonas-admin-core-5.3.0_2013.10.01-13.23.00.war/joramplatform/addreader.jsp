<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ApplyJoramReader">
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
  <sj:tab forward="ActionAddJoramReader" selected="true"><bean:message key="tab.joramplatform.joramreader.add"/>
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
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.joramplatform.reader"/></sj:jgColTitle>
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
        <sj:jgName><bean:message key="label.joramplatform.user.name"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="name"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.joramplatform.user.name"/></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>

    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joramplatform.user.id"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="id"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.joramplatform.user.id"/></sj:gridcol>
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
