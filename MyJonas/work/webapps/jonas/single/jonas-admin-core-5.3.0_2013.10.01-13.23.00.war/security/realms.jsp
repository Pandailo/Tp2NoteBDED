<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ApplyRealms">
<html:hidden property="action"/>
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <logic:equal name="typeRealm" value="all">
    <sj:tab forward="ActionListRealms" selected="true">
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
    <sj:tab forward="ActionListRealms" selected="true">
      <bean:message key="tab.security.factory.realms.memory"/>
    </sj:tab>
  </logic:equal>
  <logic:equal name="typeRealm" value="datasource">
    <sj:tab forward="ActionListRealms" selected="true">
      <bean:message key="tab.security.factory.realms.datasource"/>
    </sj:tab>
  </logic:equal>
  <logic:equal name="typeRealm" value="ldap">
    <sj:tab forward="ActionListRealms" selected="true">
      <bean:message key="tab.security.factory.realms.ldap"/>
    </sj:tab>
  </logic:equal>
  <sj:panel>
    <sj:jonasgrid>
      <sj:jgRowTitle level="2">
        <sj:jgColTitle><bean:message key="title.security.factory.realms.action"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow changeStyle="true">
        <sj:gridcol>
          <sj:grid cellPadding="10">
            <sj:gridrow>
              <bean:define id="actionCreate" value="create"/>
              <logic:equal name="typeRealm" value="all">
                <sj:gridcol>
                  <sj:jonasbutton forward="ActionEditMemoryRealm" paramId="action" paramName="actionCreate">
                    <bean:message key="button.security.factory.realms.create.memory"/>
                  </sj:jonasbutton>
                </sj:gridcol>
                <sj:gridcol>
                  <sj:jonasbutton forward="ActionEditDatasourceRealm" paramId="action" paramName="actionCreate">
                    <bean:message key="button.security.factory.realms.create.datasource"/>
                  </sj:jonasbutton>
                </sj:gridcol>
                <sj:gridcol>
                  <sj:jonasbutton forward="ActionEditLdapRealm" paramId="action" paramName="actionCreate">
                    <bean:message key="button.security.factory.realms.create.ldap"/>
                  </sj:jonasbutton>
                </sj:gridcol>
              </logic:equal>
              <logic:equal name="typeRealm" value="memory">
                <sj:gridcol>
                  <sj:jonasbutton forward="ActionEditMemoryRealm" paramId="action" paramName="actionCreate">
                    <bean:message key="button.security.factory.realms.create.memory"/>
                  </sj:jonasbutton>
                </sj:gridcol>
              </logic:equal>
              <logic:equal name="typeRealm" value="datasource">
                <sj:gridcol>
                  <sj:jonasbutton forward="ActionEditDatasourceRealm" paramId="action" paramName="actionCreate">
                    <bean:message key="button.security.factory.realms.create.datasource"/>
                  </sj:jonasbutton>
                </sj:gridcol>
              </logic:equal>
              <logic:equal name="typeRealm" value="ldap">
                <sj:gridcol>
                  <sj:jonasbutton forward="ActionEditLdapRealm" paramId="action" paramName="actionCreate">
                    <bean:message key="button.security.factory.realms.create.ldap"/>
                  </sj:jonasbutton>
                </sj:gridcol>
              </logic:equal>
              <sj:gridcol>
                <sj:jonasbutton forward="ActionSaveRealm">
                  <bean:message key="button.save"/>
                </sj:jonasbutton>
              </sj:gridcol>
              <sj:gridcol>
                <sj:jonasbutton href="javascript:submitHidden('itemsRealmsForm','action','remove')"><bean:message key="button.security.factory.realms.remove"/></sj:jonasbutton>
              </sj:gridcol>
            </sj:gridrow>
          </sj:grid>
        </sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>

    <sj:panelSeparator/>

    <sj:jonasgrid>
      <bean:size id="listSize" name="listRealms"/>
      <logic:equal name="listSize" value="0">
        <sj:gridrow>
          <sj:gridcol><bean:message key="message.security.factory.realms.none"/></sj:gridcol>
        </sj:gridrow>
      </logic:equal>
      <logic:notEqual name="listSize" value="0">
        <sj:jgRowTitle>
          <sj:jgColTitle>&nbsp;</sj:jgColTitle>
          <sj:jgColTitle><bean:message key="title.security.factory.realms.name"/></sj:jgColTitle>
          <sj:jgColTitle><bean:message key="title.security.factory.realms.type"/></sj:jgColTitle>
        </sj:jgRowTitle>
        <logic:iterate id="item" name="listRealms">
          <sj:gridrow>
            <sj:gridcol width="5%">
              <logic:equal name="item" property="usedBySecurityService" value="false">
                <html:multibox property="selectedItems">
                  <bean:write name="item" property="name"/>
                </html:multibox>
              </logic:equal>
            </sj:gridcol>
            <sj:gridcol width="17%">
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
            </sj:gridcol>
            <sj:gridcol><bean:write name="item" property="type"/></sj:gridcol>
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

