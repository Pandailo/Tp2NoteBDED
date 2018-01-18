<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ApplyUserMemoryRealm">
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
  <logic:equal name="userMemoryRealmForm" property="action" value="apply">
    <sj:tab forward="ActionEditUserMemoryRealm" selected="true">
      <bean:message key="tab.security.factory.memory.realm.user"/>
      <bean:write name="userMemoryRealmForm" property="user"/>
    </sj:tab>
  </logic:equal>
  <logic:equal name="userMemoryRealmForm" property="action" value="create">
    <sj:tab forward="ActionEditUserMemoryRealm" selected="true"><bean:message key="tab.security.factory.memory.realm.user.new"/></sj:tab>
  </logic:equal>
  <sj:tab forward="ActionEditMemoryRealmGroups"><bean:message key="tab.security.factory.memory.realm.groups"/></sj:tab>
  <sj:tab forward="ActionEditMemoryRealmRoles"><bean:message key="tab.security.factory.memory.realm.roles"/></sj:tab>

  <sj:panel>
    <logic:present name="<%=Globals.ERROR_KEY%>">
      <sj:jonasgrid>
        <sj:gridrow styleClass="errors">
          <sj:gridcol styleClass="errors"><html:errors/></sj:gridcol>
        </sj:gridrow>
      </sj:jonasgrid>
      <sj:panelSeparator/>
    </logic:present>

    <!-- USER -->
    <logic:equal name="userMemoryRealmForm" property="action" value="apply">
      <sj:jonasgrid>
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="title.security.factory.memory.realm.user"/></sj:jgColTitle>
        </sj:jgRowTitle>
      </sj:jonasgrid>
      <sj:jonasgrid>
        <sj:jgRowTitle level="2">
          <sj:jgName><bean:message key="label.security.factory.memory.realm.user.name"/></sj:jgName>
          <sj:jgColTitle><bean:write name="userMemoryRealmForm" property="user"/></sj:jgColTitle>
        </sj:jgRowTitle>
      </sj:jonasgrid>
    </logic:equal>
    <!-- New USER -->
    <logic:equal name="userMemoryRealmForm" property="action" value="create">
      <sj:jonasgrid>
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="title.security.factory.memory.realm.user.new"/></sj:jgColTitle>
        </sj:jgRowTitle>
      </sj:jonasgrid>
      <sj:jonasgrid globalRowStyleClass="panel">
        <sj:gridrow>
          <sj:jgName><bean:message key="label.security.factory.memory.realm.user.name"/></sj:jgName>
          <sj:jgValue><html:text property="user"/></sj:jgValue>
        </sj:gridrow>
        <sj:gridrow>
          <sj:jgName><bean:message key="label.security.factory.memory.realm.user.password"/></sj:jgName>
          <sj:jgValue><html:password property="password"/></sj:jgValue>
        </sj:gridrow>
        <sj:gridrow>
          <sj:jgName><bean:message key="label.security.factory.memory.realm.user.confirmPassword"/></sj:jgName>
          <sj:jgValue><html:password property="confirmPassword"/></sj:jgValue>
        </sj:gridrow>
      </sj:jonasgrid>
    </logic:equal>

    <sj:panelSeparator/>

    <!-- ROLES -->
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.security.factory.memory.realm.user.roles"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:grid cellPadding="2">
      <sj:gridrow>
        <sj:gridcol align="center"><b><bean:message key="label.security.factory.memory.realm.user.roles.used"/></b></sj:gridcol>
        <sj:gridcol>&nbsp;</sj:gridcol>
        <sj:gridcol align="center"><b><bean:message key="label.security.factory.memory.realm.user.roles.notused"/></b></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:gridcol align="center">
          <html:hidden property="rolesUsed"/>
          <html:select property="rolesUsedSelected" styleClass="dispatch" multiple="true" size="5">
            <html:options property="listRolesUsed"/>
          </html:select>
        </sj:gridcol>
        <sj:gridcol align="center">
          <table border="0" cellpadding="0" cellspacing="0">
            <tr><td align="center">
            &nbsp;<html:button styleClass="buttonDeploy" property="btnRolesUsed" onclick="copySelected('userMemoryRealmForm','rolesNotused','rolesUsed')"><bean:message key="button.push.left"/></html:button>&nbsp;
            </td></tr>
            <tr><td>&nbsp;</td></tr>
            <tr><td align="center">
            &nbsp;<html:button styleClass="buttonDeploy" property="btnRolesNotused" onclick="copySelected('userMemoryRealmForm','rolesUsed','rolesNotused')"><bean:message key="button.push.right"/></html:button>&nbsp;
            </td></tr>
          </table>
        </sj:gridcol>
        <sj:gridcol align="center">
          <html:hidden property="rolesNotused"/>
          <html:select property="rolesNotusedSelected" styleClass="dispatch" multiple="true" size="5">
            <html:options property="listRolesNotused"/>
          </html:select>
        </sj:gridcol>
      </sj:gridrow>
    </sj:grid>

    <sj:panelSeparator/>

    <!-- GROUPS -->
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.security.factory.memory.realm.user.groups"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:grid cellPadding="2">
      <sj:gridrow>
        <sj:gridcol align="center"><b><bean:message key="label.security.factory.memory.realm.user.groups.used"/></b></sj:gridcol>
        <sj:gridcol>&nbsp;</sj:gridcol>
        <sj:gridcol align="center"><b><bean:message key="label.security.factory.memory.realm.user.groups.notused"/></b></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:gridcol align="center">
          <html:hidden property="groupsUsed"/>
          <html:select property="groupsUsedSelected" styleClass="dispatch" multiple="true" size="5">
            <html:options property="listGroupsUsed"/>
          </html:select>
        </sj:gridcol>
        <sj:gridcol align="center">
          <table border="0" cellpadding="0" cellspacing="0">
            <tr><td align="center">
            &nbsp;<html:button styleClass="buttonDeploy" property="btnGroupsUsed" onclick="copySelected('userMemoryRealmForm','groupsNotused','groupsUsed')"><bean:message key="button.push.left"/></html:button>&nbsp;
            </td></tr>
            <tr><td>&nbsp;</td></tr>
            <tr><td align="center">
            &nbsp;<html:button styleClass="buttonDeploy" property="btnGroupsNotused" onclick="copySelected('userMemoryRealmForm','groupsUsed','groupsNotused')"><bean:message key="button.push.right"/></html:button>&nbsp;
            </td></tr>
          </table>
        </sj:gridcol>
        <sj:gridcol align="center">
          <html:hidden property="groupsNotused"/>
          <html:select property="groupsNotusedSelected" styleClass="dispatch" multiple="true" size="5">
            <html:options property="listGroupsNotused"/>
          </html:select>
        </sj:gridcol>
      </sj:gridrow>
    </sj:grid>

    <sj:panelSeparator/>

    <!-- PASSWORD for a known user -->
    <logic:equal name="userMemoryRealmForm" property="action" value="apply">
      <sj:jonasgrid>
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="title.security.factory.memory.realm.user.password"/></sj:jgColTitle>
        </sj:jgRowTitle>
      </sj:jonasgrid>
      <sj:jonasgrid globalRowStyleClass="panel">
        <sj:gridrow>
          <sj:jgName><bean:message key="label.security.factory.memory.realm.user.password"/></sj:jgName>
          <sj:jgValue><html:password property="password"/></sj:jgValue>
        </sj:gridrow>
        <sj:gridrow>
          <sj:jgName><bean:message key="label.security.factory.memory.realm.user.confirmPassword"/></sj:jgName>
          <sj:jgValue><html:password property="confirmPassword"/></sj:jgValue>
        </sj:gridrow>
      </sj:jonasgrid>
    </logic:equal>

    <sj:panelSeparator/>

    <!-- BUTTONS -->
    <sj:jonasgrid globalRowStyleClass="panel">
      <sj:gridrow>
        <sj:jgName></sj:jgName>
        <sj:jgValue>
          <logic:equal name="userMemoryRealmForm" property="action" value="apply">
            <html:submit styleClass="button"><bean:message key="button.apply"/></html:submit>
          </logic:equal>
          <logic:equal name="userMemoryRealmForm" property="action" value="create">
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

