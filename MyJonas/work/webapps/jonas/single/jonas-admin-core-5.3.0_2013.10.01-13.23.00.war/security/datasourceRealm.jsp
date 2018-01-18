<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ApplyDatasourceRealm">
<html:hidden property="action"/>
<html:hidden property="save"/>
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <bean:define id="itemAllRealms" value="all"/>
  <sj:tab forward="ActionListRealms" paramId="realm" paramName="itemAllRealms">
    <bean:message key="tab.security.factory.realms"/>
  </sj:tab>
  <bean:define id="itemDatasourceRealm" value="datasource"/>
  <sj:tab forward="ActionListRealms" paramId="realm" paramName="itemDatasourceRealm">
    <bean:message key="tab.security.factory.realms.datasource"/>
  </sj:tab>
  <logic:equal name="datasourceRealmForm" property="action" value="create">
    <sj:tab forward="ActionEditDatasourceRealm" selected="true"><bean:message key="tab.security.factory.datasource.realm.new"/></sj:tab>
  </logic:equal>
  <logic:equal name="datasourceRealmForm" property="action" value="apply">
    <sj:tab forward="ActionEditDatasourceRealm" selected="true">
      <bean:message key="tab.security.factory.datasource.realm"/>
      <bean:write name="datasourceRealmForm" property="name"/>
    </sj:tab>
  </logic:equal>
  <sj:panel>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.security.factory.datasource.realm"/></sj:jgColTitle>
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
      <logic:equal name="datasourceRealmForm" property="action" value="apply">
        <sj:jgRowTitle level="2" height="30">
          <sj:jgName>&nbsp;</sj:jgName>
          <sj:jgColTitle><bean:write name="datasourceRealmForm" property="name"/></sj:jgColTitle>
          <sj:gridcol width="60%">&nbsp;</sj:gridcol>
        </sj:jgRowTitle>
      </logic:equal>
      <logic:equal name="datasourceRealmForm" property="action" value="create">
        <sj:gridrow>
          <sj:jgName><bean:message key="label.security.factory.datasource.realm.name"/></sj:jgName>
          <sj:gridcol valign="top"><html:text property="name"/></sj:gridcol>
          <sj:gridcol width="60%"><bean:message key="comment.security.factory.datasource.realm.name"/></sj:gridcol>
        </sj:gridrow>
      </logic:equal>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.security.factory.datasource.realm.dsName"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="dsName"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.security.factory.datasource.realm.dsName"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.security.factory.datasource.realm.userTable"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="userTable"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.security.factory.datasource.realm.userTable"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.security.factory.datasource.realm.userTablePasswordCol"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="userTablePasswordCol"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.security.factory.datasource.realm.userTablePasswordCol"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.security.factory.datasource.realm.userTableUsernameCol"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="userTableUsernameCol"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.security.factory.datasource.realm.userTableUsernameCol"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.security.factory.datasource.realm.roleTable"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="roleTable"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.security.factory.datasource.realm.roleTable"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.security.factory.datasource.realm.roleTableRolenameCol"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="roleTableRolenameCol"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.security.factory.datasource.realm.roleTableRolenameCol"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.security.factory.datasource.realm.roleTableUsernameCol"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="roleTableUsernameCol"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.security.factory.datasource.realm.roleTableUsernameCol"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.security.factory.datasource.realm.algorithm"/></sj:jgName>
        <sj:gridcol valign="top">
          <html:select property="algorithm">
            <bean:define id="listSecurityAlgorithms" name="datasourceRealmForm" property="securityAlgorithms"/>
            <html:options collection="listSecurityAlgorithms" property="value" labelProperty="label"/>
          </html:select>
        </sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.security.factory.datasource.realm.algorithm"/></sj:gridcol>
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
          &nbsp;&nbsp;
          <html:button styleClass="button" property="btnSave"
            onclick="submitHidden('datasourceRealmForm','save','true')">
            <bean:message key="button.save"/>
          </html:button>
        </sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>
</html:form>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

