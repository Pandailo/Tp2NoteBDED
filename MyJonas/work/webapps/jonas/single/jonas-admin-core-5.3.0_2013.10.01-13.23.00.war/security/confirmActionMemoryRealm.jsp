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
  <logic:equal name="itemsMemoryRealmForm" property="type" value="user">
    <sj:tab forward="ActionEditMemoryRealmUsers" selected="true">
      <bean:message key="tab.security.factory.memory.realm.confirm"/>
      <bean:write name="itemsMemoryRealmForm" property="action"/>
      <bean:write name="itemsMemoryRealmForm" property="type"/>
    </sj:tab>
  </logic:equal>
  <sj:tab forward="ActionEditMemoryRealmGroups"><bean:message key="tab.security.factory.memory.realm.groups"/></sj:tab>
  <logic:equal name="itemsMemoryRealmForm" property="type" value="group">
    <sj:tab forward="ActionEditMemoryRealmGroups" selected="true">
      <bean:message key="tab.security.factory.memory.realm.confirm"/>
      <bean:write name="itemsMemoryRealmForm" property="action"/>
      <bean:write name="itemsMemoryRealmForm" property="type"/>
    </sj:tab>
  </logic:equal>
  <sj:tab forward="ActionEditMemoryRealmRoles"><bean:message key="tab.security.factory.memory.realm.roles"/></sj:tab>
  <logic:equal name="itemsMemoryRealmForm" property="type" value="role">
    <sj:tab forward="ActionEditMemoryRealmRoles" selected="true">
      <bean:message key="tab.security.factory.memory.realm.confirm"/>
      <bean:write name="itemsMemoryRealmForm" property="action"/>
      <bean:write name="itemsMemoryRealmForm" property="type"/>
    </sj:tab>
  </logic:equal>

  <sj:panel>
    <sj:jonasgrid>
      <bean:size id="listSize" name="itemsMemoryRealmForm" property="selectedItems"/>
      <!-- Empty List -->
      <logic:equal name="listSize" value="0">
        <sj:gridrow styleClass="errors">
          <sj:gridcol><bean:message key="message.security.factory.memory.realm.list.empty"/></sj:gridcol>
        </sj:gridrow>
      </logic:equal>
      <!-- Full List -->
      <logic:notEqual name="listSize" value="0">
        <sj:jgRowTitle>
          <sj:jgColTitle>
            <!-- USER -->
            <logic:equal name="itemsMemoryRealmForm" property="type" value="user">
              <logic:equal name="itemsMemoryRealmForm" property="action" value="remove">
                <bean:message key="title.security.factory.memory.realm.confirm.user.remove"/>
              </logic:equal>
            </logic:equal>
            <!-- GROUP -->
            <logic:equal name="itemsMemoryRealmForm" property="type" value="group">
              <logic:equal name="itemsMemoryRealmForm" property="action" value="remove">
                <bean:message key="title.security.factory.memory.realm.confirm.group.remove"/>
              </logic:equal>
            </logic:equal>
            <!-- ROLE -->
            <logic:equal name="itemsMemoryRealmForm" property="type" value="role">
              <logic:equal name="itemsMemoryRealmForm" property="action" value="remove">
                <bean:message key="title.security.factory.memory.realm.confirm.role.remove"/>
              </logic:equal>
            </logic:equal>
          </sj:jgColTitle>
        </sj:jgRowTitle>
        <logic:iterate id="item" name="itemsMemoryRealmForm" property="selectedItems">
          <sj:gridrow>
            <sj:gridcol><b><bean:write name="item"/></b></sj:gridcol>
          </sj:gridrow>
        </logic:iterate>
      </logic:notEqual>
    </sj:jonasgrid>

    <logic:notEqual name="listSize" value="0">
      <sj:panelSeparator/>
      <sj:jonasgrid globalRowStyleClass="panel">
        <sj:gridrow>
          <sj:gridcol>
            <sj:jonasbutton forward="ActionApplyConfirmMemoryRealm">
              <bean:message key="button.confirm"/>
            </sj:jonasbutton>
          </sj:gridcol>
        </sj:gridrow>
      </sj:jonasgrid>
    </logic:notEqual>
  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

