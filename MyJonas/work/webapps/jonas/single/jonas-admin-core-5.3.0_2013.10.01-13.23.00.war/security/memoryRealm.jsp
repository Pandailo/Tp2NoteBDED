<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ApplyMemoryRealm">
<html:hidden property="action"/>
<html:hidden property="save"/>
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
  <logic:equal name="memoryRealmForm" property="action" value="create">
    <sj:tab forward="ActionEditMemoryRealm" selected="true"><bean:message key="tab.security.factory.memory.realm.new"/></sj:tab>
  </logic:equal>
  <logic:equal name="memoryRealmForm" property="action" value="apply">
    <sj:tab forward="ActionEditMemoryRealm" selected="true">
      <bean:write name="memoryRealmForm" property="name"/>
    </sj:tab>
    <sj:tab forward="ActionEditMemoryRealmUsers"><bean:message key="tab.security.factory.memory.realm.users"/></sj:tab>
    <sj:tab forward="ActionEditMemoryRealmGroups"><bean:message key="tab.security.factory.memory.realm.groups"/></sj:tab>
    <sj:tab forward="ActionEditMemoryRealmRoles"><bean:message key="tab.security.factory.memory.realm.roles"/></sj:tab>
  </logic:equal>
  <sj:panel>
    <logic:equal name="memoryRealmForm" property="action" value="apply">
      <sj:jonasgrid>
        <sj:jgRowTitle level="2">
          <sj:jgColTitle><bean:message key="title.security.factory.memory.realm.action"/></sj:jgColTitle>
        </sj:jgRowTitle>
      </sj:jonasgrid>
      <sj:jonasgrid>
        <sj:gridrow changeStyle="true">
          <sj:gridcol>
            <sj:grid cellPadding="10">
              <sj:gridrow>
                <sj:gridcol>
                  <bean:define id="forwardAfterSave" value="ActionEditMemoryRealm"/>
                  <sj:jonasbutton forward="ActionSaveRealm" paramId="forward" paramName="forwardAfterSave">
                    <bean:message key="button.save"/>
                  </sj:jonasbutton>
                </sj:gridcol>
                <sj:gridcol>
                  <bean:define id="realmName" name="memoryRealmForm" property="name"/>
                  <sj:jonasbutton forward="ActionClearCache" paramId="realm" paramName="realmName">
                    <bean:message key="button.security.factory.memory.realm.clearCache"/>
                  </sj:jonasbutton>
                </sj:gridcol>
              </sj:gridrow>
            </sj:grid>
          </sj:gridcol>
        </sj:gridrow>
      </sj:jonasgrid>
      <sj:panelSeparator/>
    </logic:equal>

    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.security.factory.memory.realm"/></sj:jgColTitle>
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
      <logic:equal name="memoryRealmForm" property="action" value="apply">
        <sj:jgRowTitle level="2" height="30">
          <sj:jgName>&nbsp;</sj:jgName>
          <sj:jgColTitle><bean:write name="memoryRealmForm" property="name"/></sj:jgColTitle>
          <sj:gridcol width="60%">&nbsp;</sj:gridcol>
        </sj:jgRowTitle>
      </logic:equal>
      <logic:equal name="memoryRealmForm" property="action" value="create">
        <sj:gridrow>
          <sj:jgName><bean:message key="label.security.factory.memory.realm.name"/></sj:jgName>
          <sj:gridcol valign="top"><html:text property="name"/></sj:gridcol>
          <sj:gridcol width="60%"><bean:message key="comment.security.factory.memory.realm.name"/></sj:gridcol>
        </sj:gridrow>
      </logic:equal>
    </sj:jonasgrid>

    <logic:equal name="memoryRealmForm" property="action" value="create">
      <sj:panelSeparator/>

      <sj:jonasgrid globalRowStyleClass="panel">
        <sj:gridrow>
          <sj:jgName></sj:jgName>
          <sj:gridcol>
            <html:submit styleClass="button" property="btnApply"><bean:message key="button.apply"/></html:submit>
            &nbsp;&nbsp;
            <html:reset styleClass="button"><bean:message key="button.reset"/></html:reset>
            &nbsp;&nbsp;
            <html:button styleClass="button" property="btnSave"
              onclick="submitHidden('memoryRealmForm','save','true')">
              <bean:message key="button.save"/>
            </html:button>
          </sj:gridcol>
        </sj:gridrow>
      </sj:jonasgrid>
    </logic:equal>
  </sj:panel>
</sj:tabs>
</html:form>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

