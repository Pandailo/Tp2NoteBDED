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
  <sj:tab selected="true"><bean:message key="tab.service.security"/></sj:tab>
  <sj:panel>
    <bean:size id="listSize" name="listSecurityRealms"/>
    <logic:equal name="listSize" value="0">
      <sj:gridrow>
        <sj:gridcol><bean:message key="message.service.security.realm.notused"/></sj:gridcol>
      </sj:gridrow>
    </logic:equal>
    <logic:notEqual name="listSize" value="0">
      <sj:jonasgrid>
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="title.service.security.realm.name"/></sj:jgColTitle>
          <sj:jgColTitle><bean:message key="title.service.security.realm.type"/></sj:jgColTitle>
          <sj:jgColTitle><bean:message key="title.service.security.realm.path"/></sj:jgColTitle>
          <sj:jgColTitle><bean:message key="title.service.security.realm.used"/></sj:jgColTitle>
          <sj:jgColTitle>&nbsp;</sj:jgColTitle>
        </sj:jgRowTitle>
        <logic:iterate id="item" name="listSecurityRealms">
          <sj:gridrow>
            <sj:gridcol width="20%">
              <logic:present name="item" property="type">
                <logic:equal name="item" property="type" value="memory">
                  <html:link forward="ActionEditMemoryRealm" styleClass="panel"
                    paramId="resource" paramName="item" paramProperty="name">
                    <bean:write name="item" property="name"/>
                  </html:link>
                </logic:equal>
                <logic:equal name="item" property="type" value="datasource">
                  <html:link forward="ActionEditDatasourceRealm" styleClass="panel"
                    paramId="resource" paramName="item" paramProperty="name">
                    <bean:write name="item" property="name"/>
                  </html:link>
                </logic:equal>
                <logic:equal name="item" property="type" value="ldap">
                  <html:link forward="ActionEditLdapRealm" styleClass="panel"
                    paramId="resource" paramName="item" paramProperty="name">
                    <bean:write name="item" property="name"/>
                  </html:link>
                </logic:equal>
              </logic:present>
              <logic:notPresent name="item" property="type">
                <bean:write name="item" property="name"/>
              </logic:notPresent>
            </sj:gridcol>
            <sj:gridcol width="20%">
              <logic:present name="item" property="type">
                <bean:write name="item" property="type"/>
              </logic:present>
              <logic:notPresent name="item" property="type">
                <bean:message key="label.service.security.realm.type.unknown"/>
              </logic:notPresent>
            </sj:gridcol>
            <sj:gridcol width="20%">
              <logic:present name="item" property="contextPath">
                <bean:write name="item" property="contextPath"/>
              </logic:present>
              <logic:notPresent name="item" property="contextPath">
                <bean:message key="label.service.security.realm.path.unknown"/>
              </logic:notPresent>
            </sj:gridcol>
            <sj:gridcol align="center" width="5%">
              <logic:equal name="item" property="usedBySecurityService" value="true">
                <html:img src="../images/icon/tag_blue.gif"/>
              </logic:equal>
              &nbsp;
            </sj:gridcol>
            <sj:gridcol>&nbsp;</sj:gridcol>
          </sj:gridrow>
        </logic:iterate>
      </sj:jonasgrid>
    </logic:notEqual>
  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

