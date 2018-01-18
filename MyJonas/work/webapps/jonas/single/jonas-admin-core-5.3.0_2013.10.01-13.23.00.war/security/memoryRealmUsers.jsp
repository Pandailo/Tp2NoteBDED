<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ConfirmActionMemoryRealm">
<html:hidden property="type"/>
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
  <sj:tab forward="ActionEditMemoryRealmUsers" selected="true"><bean:message key="tab.security.factory.memory.realm.users"/></sj:tab>
  <sj:tab forward="ActionEditMemoryRealmGroups"><bean:message key="tab.security.factory.memory.realm.groups"/></sj:tab>
  <sj:tab forward="ActionEditMemoryRealmRoles"><bean:message key="tab.security.factory.memory.realm.roles"/></sj:tab>
  <sj:panel>
    <sj:jonasgrid>
      <sj:jgRowTitle level="2">
        <sj:jgColTitle><bean:message key="title.security.factory.memory.realm.users.action"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow changeStyle="true">
        <sj:gridcol>
          <sj:grid cellPadding="10">
            <sj:gridrow>
              <sj:gridcol>
                <bean:define id="actionCreate" value="create"/>
                <sj:jonasbutton forward="ActionEditNewUserMemoryRealm" paramId="action" paramName="actionCreate">
                  <bean:message key="button.security.factory.memory.realm.users.create"/>
                </sj:jonasbutton>
              </sj:gridcol>
              <sj:gridcol>
                <bean:define id="forwardAfterSave" value="ActionEditMemoryRealmUsers"/>
                <sj:jonasbutton forward="ActionSaveRealm" paramId="forward" paramName="forwardAfterSave">
                  <bean:message key="button.save"/>
                </sj:jonasbutton>
              </sj:gridcol>
              <sj:gridcol>
                <sj:jonasbutton href="javascript:submitHidden('itemsMemoryRealmForm','type','user','action','remove')"><bean:message key="button.security.factory.memory.realm.users.remove"/></sj:jonasbutton>
              </sj:gridcol>
            </sj:gridrow>
          </sj:grid>
        </sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>

    <sj:panelSeparator/>

    <sj:jonasgrid>
      <bean:size id="listSize" name="listUsers"/>
      <logic:equal name="listSize" value="0">
        <sj:gridrow>
          <sj:gridcol><bean:message key="message.security.factory.memory.realm.users.none"/></sj:gridcol>
        </sj:gridrow>
      </logic:equal>
      <logic:notEqual name="listSize" value="0">
        <sj:jgRowTitle>
          <sj:jgColTitle></sj:jgColTitle>
          <sj:jgColTitle><bean:message key="label.security.factory.memory.realm.users.user"/></sj:jgColTitle>
        </sj:jgRowTitle>
        <logic:iterate id="item" name="listUsers">
          <sj:gridrow>
            <sj:gridcol width="5%">
              <html:multibox property="selectedItems">
                <bean:write name="item"/>
              </html:multibox>
            </sj:gridcol>
            <sj:gridcol>
              <html:link forward="ActionEditUserMemoryRealm" styleClass="panel"
                paramId="user" paramName="item">
                <bean:write name="item"/>
              </html:link>
            </sj:gridcol>
          </sj:gridrow>
        </logic:iterate>
      </logic:notEqual>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>
</html:form>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

