<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ApplyConfirmRealms">
<html:hidden property="action"/>
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <logic:equal name="typeRealm" value="all">
    <sj:tab forward="ActionListRealms">
      <bean:message key="tab.security.factory.realms"/>
    </sj:tab>
  </logic:equal>
  <logic:notEqual name="typeRealm" value="all">
    <bean:define id="itemAllRealms" value="all"/>
    <sj:tab forward="ActionListRealms" paramId="realm" paramName="itemAllRealms">
      <bean:message key="tab.security.factory.realms"/>
    </sj:tab>
  </logic:notEqual>
  <logic:equal name="typeRealm" value="memory">
    <sj:tab forward="ActionListRealms" paramId="realm" paramName="typeRealm">
      <bean:message key="tab.security.factory.realms.memory"/>
    </sj:tab>
  </logic:equal>
  <logic:equal name="typeRealm" value="datasource">
    <sj:tab forward="ActionListRealms" paramId="realm" paramName="typeRealm">
      <bean:message key="tab.security.factory.realms.datasource"/>
    </sj:tab>
  </logic:equal>
  <logic:equal name="typeRealm" value="ldap">
    <sj:tab forward="ActionListRealms" paramId="realm" paramName="typeRealm">
      <bean:message key="tab.security.factory.realms.ldap"/>
    </sj:tab>
  </logic:equal>
  <sj:tab forward="ActionListRealms" selected="true">
    <bean:message key="tab.security.factory.realms.confirm"/>
    <bean:write name="itemsRealmsForm" property="action"/>
  </sj:tab>

  <sj:panel>
    <sj:jonasgrid>
      <bean:size id="listSize" name="itemsRealmsForm" property="selectedRealmItem"/>
      <logic:equal name="listSize" value="0">
        <sj:gridrow styleClass="errors">
          <sj:gridcol><bean:message key="message.security.factory.realms.none"/></sj:gridcol>
        </sj:gridrow>
      </logic:equal>
      <logic:notEqual name="listSize" value="0">
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="title.security.factory.realms.name"/></sj:jgColTitle>
          <sj:jgColTitle><bean:message key="title.security.factory.realms.type"/></sj:jgColTitle>
        </sj:jgRowTitle>
        <logic:iterate id="item" name="itemsRealmsForm" property="selectedRealmItem">
          <sj:gridrow>
            <sj:gridcol width="17%"><b><bean:write name="item" property="name"/></b></sj:gridcol>
            <sj:gridcol><bean:write name="item" property="type"/></sj:gridcol>
          </sj:gridrow>
        </logic:iterate>
      </logic:notEqual>
    </sj:jonasgrid>
    <logic:notEqual name="listSize" value="0">
      <sj:panelSeparator/>
      <sj:jonasgrid globalRowStyleClass="panel">
        <sj:gridrow>
          <sj:gridcol>
            <html:submit styleClass="button" property="btnSubmit">
              <bean:message key="button.confirm"/>
            </html:submit>
          </sj:gridcol>
        </sj:gridrow>
      </sj:jonasgrid>
    </logic:notEqual>
  </sj:panel>
</sj:tabs>
</html:form>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

