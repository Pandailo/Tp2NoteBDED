<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ApplyRoleMemoryRealm">
<html:hidden property="action"/>
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <bean:define id="itemAllRealms" value="all"/>
  <sj:tab forward="ActionListRealms" paramId="realm" paramName="itemAllRealms">
    <bean:message key="tab.security.factory.realms"/>
  </sj:tab>
  <bean:define id="itemMemoryRealm" value="memory"/>
  <sj:tab forward="ActionListRealms" paramId="realm" paramName="itemMemoryRealm">
    <bean:message key="tab.security.factory.realms.memory"/>
  </sj:tab>
  <sj:tab forward="ActionEditMemoryRealm">
    <bean:write name="memoryRealmForm" property="name"/>
  </sj:tab>
  <sj:tab forward="ActionEditMemoryRealmUsers"><bean:message key="tab.security.factory.memory.realm.users"/></sj:tab>
  <sj:tab forward="ActionEditMemoryRealmGroups"><bean:message key="tab.security.factory.memory.realm.groups"/></sj:tab>
  <sj:tab forward="ActionEditMemoryRealmRoles"><bean:message key="tab.security.factory.memory.realm.roles"/></sj:tab>
  <logic:equal name="roleMemoryRealmForm" property="action" value="apply">
    <sj:tab forward="ActionEditRoleMemoryRealm" selected="true">
      <bean:message key="tab.security.factory.memory.realm.role"/>
      <bean:write name="roleMemoryRealmForm" property="role"/>
    </sj:tab>
  </logic:equal>
  <logic:equal name="roleMemoryRealmForm" property="action" value="create">
    <sj:tab forward="ActionEditRoleMemoryRealm" selected="true"><bean:message key="tab.security.factory.memory.realm.role.new"/></sj:tab>
  </logic:equal>

  <sj:panel>
    <logic:present name="<%=Globals.ERROR_KEY%>">
      <sj:jonasgrid>
        <sj:gridrow styleClass="errors">
          <sj:gridcol styleClass="errors"><html:errors/></sj:gridcol>
        </sj:gridrow>
      </sj:jonasgrid>
      <sj:panelSeparator/>
    </logic:present>

    <!-- ROLE -->
    <logic:equal name="roleMemoryRealmForm" property="action" value="apply">
      <sj:jonasgrid>
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="title.security.factory.memory.realm.role"/></sj:jgColTitle>
        </sj:jgRowTitle>
      </sj:jonasgrid>
      <sj:jonasgrid>
        <sj:jgRowTitle level="2">
          <sj:jgName><bean:message key="label.security.factory.memory.realm.role.name"/></sj:jgName>
          <sj:jgColTitle><bean:write name="roleMemoryRealmForm" property="role"/></sj:jgColTitle>
        </sj:jgRowTitle>
      </sj:jonasgrid>
      <sj:jonasgrid globalRowStyleClass="panel">
        <sj:gridrow>
          <sj:jgName><bean:message key="label.security.factory.memory.realm.role.description"/></sj:jgName>
          <sj:jgValue><html:text property="description" size="50"/></sj:jgValue>
        </sj:gridrow>
      </sj:jonasgrid>
    </logic:equal>
    <!-- New ROLE -->
    <logic:equal name="roleMemoryRealmForm" property="action" value="create">
      <sj:jonasgrid>
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="title.security.factory.memory.realm.role.new"/></sj:jgColTitle>
        </sj:jgRowTitle>
      </sj:jonasgrid>
      <sj:jonasgrid globalRowStyleClass="panel">
        <sj:gridrow>
          <sj:jgName><bean:message key="label.security.factory.memory.realm.role.name"/></sj:jgName>
          <sj:jgValue><html:text property="role"/></sj:jgValue>
        </sj:gridrow>
        <sj:gridrow>
          <sj:jgName><bean:message key="label.security.factory.memory.realm.role.description"/></sj:jgName>
          <sj:jgValue><html:text property="description"/></sj:jgValue>
        </sj:gridrow>
      </sj:jonasgrid>
    </logic:equal>

    <sj:panelSeparator/>

    <!-- BUTTONS -->
    <sj:jonasgrid globalRowStyleClass="panel">
      <sj:gridrow>
        <sj:jgName></sj:jgName>
        <sj:jgValue>
          <logic:equal name="roleMemoryRealmForm" property="action" value="apply">
            <html:submit styleClass="button"><bean:message key="button.apply"/></html:submit>
          </logic:equal>
          <logic:equal name="roleMemoryRealmForm" property="action" value="create">
            <html:submit styleClass="button"><bean:message key="button.create"/></html:submit>
          </logic:equal>
        </sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>
</html:form>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

