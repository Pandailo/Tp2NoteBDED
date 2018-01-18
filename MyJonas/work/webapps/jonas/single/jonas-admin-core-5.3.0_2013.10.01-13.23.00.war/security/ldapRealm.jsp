<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ApplyLdapRealm">
<html:hidden property="action"/>
<html:hidden property="save"/>
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <bean:define id="itemAllRealms" value="all"/>
  <sj:tab forward="ActionListRealms" paramId="realm" paramName="itemAllRealms">
    <bean:message key="tab.security.factory.realms"/>
  </sj:tab>
  <bean:define id="itemLdapRealm" value="ldap"/>
  <sj:tab forward="ActionListRealms" paramId="realm" paramName="itemLdapRealm">
    <bean:message key="tab.security.factory.realms.ldap"/>
  </sj:tab>
  <logic:equal name="ldapRealmForm" property="action" value="create">
    <sj:tab forward="ActionEditLdapRealm" selected="true"><bean:message key="tab.security.factory.ldap.realm.new"/></sj:tab>
  </logic:equal>
  <logic:equal name="ldapRealmForm" property="action" value="apply">
    <sj:tab forward="ActionEditLdapRealm" selected="true">
      <bean:message key="tab.security.factory.ldap.realm"/>
      <bean:write name="ldapRealmForm" property="name"/>
    </sj:tab>
  </logic:equal>
  <sj:panel>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.security.factory.ldap.realm"/></sj:jgColTitle>
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
      <logic:equal name="ldapRealmForm" property="action" value="apply">
        <sj:jgRowTitle level="2" height="30">
          <sj:jgName>&nbsp;</sj:jgName>
          <sj:jgColTitle><bean:write name="ldapRealmForm" property="name"/></sj:jgColTitle>
          <sj:gridcol width="60%">&nbsp;</sj:gridcol>
        </sj:jgRowTitle>
      </logic:equal>
      <logic:equal name="ldapRealmForm" property="action" value="create">
        <sj:gridrow>
          <sj:jgName><bean:message key="label.security.factory.ldap.realm.name"/></sj:jgName>
          <sj:gridcol valign="top"><html:text property="name"/></sj:gridcol>
          <sj:gridcol width="60%"><bean:message key="comment.security.factory.ldap.realm.name"/></sj:gridcol>
        </sj:gridrow>
      </logic:equal>

      <sj:gridrow>
        <sj:jgName><bean:message key="label.security.factory.ldap.realm.baseDn"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="baseDn"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.security.factory.ldap.realm.baseDn"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.security.factory.ldap.realm.userDn"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="userDn"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.security.factory.ldap.realm.userDn"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.security.factory.ldap.realm.roleDn"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="roleDn"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.security.factory.ldap.realm.roleDn"/></sj:gridcol>
      </sj:gridrow>

      <sj:gridrow>
        <sj:jgName><bean:message key="label.security.factory.ldap.realm.initialContextFactory"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="initialContextFactory"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.security.factory.ldap.realm.initialContextFactory"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.security.factory.ldap.realm.providerUrl"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="providerUrl"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.security.factory.ldap.realm.providerUrl"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.security.factory.ldap.realm.securityAuthentication"/></sj:jgName>
        <sj:gridcol valign="top">
          <html:select property="securityAuthentication">
            <bean:define id="listSecurityAuthenticationLdapValues" name="ldapRealmForm" property="securityAuthenticationLdapValues"/>
            <html:options collection="listSecurityAuthenticationLdapValues" property="value" labelProperty="label"/>
          </html:select>
        </sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.security.factory.ldap.realm.securityAuthentication"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.security.factory.ldap.realm.authenticationMode"/></sj:jgName>
        <sj:gridcol valign="top">
          <html:select property="authenticationMode">
            <bean:define id="listAuthenticationModeLdapValues" name="ldapRealmForm" property="authenticationModeLdapValues"/>
            <html:options collection="listAuthenticationModeLdapValues" property="value" labelProperty="label"/>
          </html:select>
        </sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.security.factory.ldap.realm.authenticationMode"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.security.factory.ldap.realm.securityPrincipal"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="securityPrincipal"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.security.factory.ldap.realm.securityPrincipal"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.security.factory.ldap.realm.securityCredentials"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="securityCredentials"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.security.factory.ldap.realm.securityCredentials"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.security.factory.ldap.realm.userSearchFilter"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="userSearchFilter"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.security.factory.ldap.realm.userSearchFilter"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.security.factory.ldap.realm.roleSearchFilter"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="roleSearchFilter"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.security.factory.ldap.realm.roleSearchFilter"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.security.factory.ldap.realm.userPasswordAttribute"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="userPasswordAttribute"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.security.factory.ldap.realm.userPasswordAttribute"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.security.factory.ldap.realm.userRolesAttribute"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="userRolesAttribute"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.security.factory.ldap.realm.userRolesAttribute"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.security.factory.ldap.realm.roleNameAttribute"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="roleNameAttribute"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.security.factory.ldap.realm.roleNameAttribute"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.security.factory.ldap.realm.language"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="language"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.security.factory.ldap.realm.language"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.security.factory.ldap.realm.referral"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="referral"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.security.factory.ldap.realm.referral"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.security.factory.ldap.realm.securityProtocol"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="securityProtocol"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.security.factory.ldap.realm.securityProtocol"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.security.factory.ldap.realm.stateFactories"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="stateFactories"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.security.factory.ldap.realm.stateFactories"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.security.factory.ldap.realm.algorithm"/></sj:jgName>
        <sj:gridcol valign="top">
          <html:select property="algorithm">
            <bean:define id="listSecurityAlgorithms" name="ldapRealmForm" property="securityAlgorithms"/>
            <html:options collection="listSecurityAlgorithms" property="value" labelProperty="label"/>
          </html:select>
        </sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.security.factory.ldap.realm.algorithm"/></sj:gridcol>
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
            onclick="submitHidden('ldapRealmForm','save','true')">
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

