<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ApplyDatasourceProperties">
  <html:hidden property="action"/>
  <logic:equal name="datasourcePropertiesForm" property="action" value="edit">
    <html:hidden property="name"/>
    <html:hidden property="datasourceName"/>
    <html:hidden property="datasourceDescription"/>
    <html:hidden property="datasourceUrl"/>
    <html:hidden property="datasourceClassname"/>
    <html:hidden property="datasourceUsername"/>
    <html:hidden property="datasourcePassword"/>
    <html:hidden property="datasourceMapper"/>
  </logic:equal>
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionEditDeploy"><bean:message key="tab.deployment"/></sj:tab>
  <sj:tab forward="ActionListDatasources"><bean:message key="tab.resource.datasources"/></sj:tab>
  <sj:tab forward="ActionEditDatasourceProperties" selected="true">
    <logic:equal name="datasourcePropertiesForm" property="action" value="create">
      <bean:message key="tab.resource.datasource.properties.create"/>
    </logic:equal>
    <logic:equal name="datasourcePropertiesForm" property="action" value="edit">
      <bean:message key="tab.resource.datasource.properties"/>
    </logic:equal>
  </sj:tab>
  <sj:panel>
    <logic:present name="<%=Globals.ERROR_KEY%>">
      <sj:jonasgrid>
        <sj:gridrow styleClass="errors">
          <sj:gridcol styleClass="errors"><html:errors/></sj:gridcol>
        </sj:gridrow>
      </sj:jonasgrid>
      <sj:panelSeparator/>
    </logic:present>

    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.resource.datasource.properties.datasource"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resource.datasource.properties.name"/></sj:jgName>
        <sj:gridcol valign="top">
          <logic:equal name="datasourcePropertiesForm" property="action" value="create">
            <html:text property="name"/>
          </logic:equal>
          <logic:equal name="datasourcePropertiesForm" property="action" value="edit">
            <bean:write name="datasourcePropertiesForm" property="name"/>
          </logic:equal>
        </sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resource.datasource.properties.name"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resource.datasource.properties.datasourceName"/></sj:jgName>
        <sj:gridcol valign="top">
          <logic:equal name="datasourcePropertiesForm" property="action" value="create">
            <html:text property="datasourceName"/>
          </logic:equal>
          <logic:equal name="datasourcePropertiesForm" property="action" value="edit">
            <bean:write name="datasourcePropertiesForm" property="datasourceName"/>
          </logic:equal>
        </sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resource.datasource.properties.datasourceName"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resource.datasource.properties.datasourceDescription"/></sj:jgName>
        <sj:gridcol valign="top">
          <logic:equal name="datasourcePropertiesForm" property="action" value="create">
            <html:text property="datasourceDescription"/>
          </logic:equal>
          <logic:equal name="datasourcePropertiesForm" property="action" value="edit">
            <bean:write name="datasourcePropertiesForm" property="datasourceDescription"/>
          </logic:equal>
        </sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resource.datasource.properties.datasourceDescription"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resource.datasource.properties.datasourceUrl"/></sj:jgName>
        <sj:gridcol valign="top">
          <logic:equal name="datasourcePropertiesForm" property="action" value="create">
            <html:text property="datasourceUrl"/>
          </logic:equal>
          <logic:equal name="datasourcePropertiesForm" property="action" value="edit">
            <bean:write name="datasourcePropertiesForm" property="datasourceUrl"/>
          </logic:equal>
        </sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resource.datasource.properties.datasourceUrl"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resource.datasource.properties.datasourceClassname"/></sj:jgName>
        <sj:gridcol valign="top">
          <logic:equal name="datasourcePropertiesForm" property="action" value="create">
            <html:text property="datasourceClassname"/>
          </logic:equal>
          <logic:equal name="datasourcePropertiesForm" property="action" value="edit">
            <bean:write name="datasourcePropertiesForm" property="datasourceClassname"/>
          </logic:equal>
        </sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resource.datasource.properties.datasourceClassname"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resource.datasource.properties.datasourceUsername"/></sj:jgName>
        <sj:gridcol valign="top">
          <logic:equal name="datasourcePropertiesForm" property="action" value="create">
            <html:text property="datasourceUsername"/>
          </logic:equal>
          <logic:equal name="datasourcePropertiesForm" property="action" value="edit">
            <bean:write name="datasourcePropertiesForm" property="datasourceUsername"/>
          </logic:equal>
        </sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resource.datasource.properties.datasourceUsername"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resource.datasource.properties.datasourcePassword"/></sj:jgName>
        <sj:gridcol valign="top">
          <logic:equal name="datasourcePropertiesForm" property="action" value="create">
            <html:text property="datasourcePassword"/>
          </logic:equal>
          <logic:equal name="datasourcePropertiesForm" property="action" value="edit">
            <bean:write name="datasourcePropertiesForm" property="datasourcePassword"/>
          </logic:equal>
        </sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resource.datasource.properties.datasourcePassword"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resource.datasource.properties.datasourceMapper"/></sj:jgName>
        <sj:gridcol valign="top">
          <logic:equal name="datasourcePropertiesForm" property="action" value="create">
            <html:text property="datasourceMapper"/>
          </logic:equal>
          <logic:equal name="datasourcePropertiesForm" property="action" value="edit">
            <bean:write name="datasourcePropertiesForm" property="datasourceMapper"/>
          </logic:equal>
        </sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resource.datasource.properties.datasourceMapper"/></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>
    <sj:panelSeparator/>

    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.resource.datasource.properties.jdbc"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resource.datasource.properties.jdbcConnmaxage"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="jdbcConnmaxage"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resource.datasource.properties.jdbcConnmaxage"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resource.datasource.properties.jdbcMaxopentime"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="jdbcMaxopentime"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resource.datasource.properties.jdbcMaxopentime"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resource.datasource.properties.jdbcConnchecklevel"/></sj:jgName>
        <sj:gridcol valign="top">
          <html:select property="jdbcConnchecklevel">
            <bean:define id="listCheckingLevels" name="datasourcePropertiesForm" property="checkingLevels"/>
            <html:options collection="listCheckingLevels" property="value" labelProperty="label"/>
          </html:select>
        </sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resource.datasource.properties.jdbcConnchecklevel"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resource.datasource.properties.jdbcConnteststmt"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="jdbcConnteststmt"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resource.datasource.properties.jdbcConnteststmt"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resource.datasource.properties.jdbcMinconpool"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="jdbcMinconpool"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resource.datasource.properties.jdbcMinconpool"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resource.datasource.properties.jdbcMaxconpool"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="jdbcMaxconpool"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resource.datasource.properties.jdbcMaxconpool"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resource.datasource.properties.jdbcMaxwaittime"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="jdbcMaxwaittime"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resource.datasource.properties.jdbcMaxwaittime"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resource.datasource.properties.jdbcMaxwaiters"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="jdbcMaxwaiters"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resource.datasource.properties.jdbcMaxwaiters"/></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>
    <sj:panelSeparator/>
    <sj:jonasgrid globalRowStyleClass="panel">
      <sj:gridrow>
        <sj:jgName></sj:jgName>
        <sj:gridcol>
          <html:submit styleClass="button"><bean:message key="button.apply"/></html:submit>
          &nbsp;&nbsp;
          <html:reset styleClass="button"><bean:message key="button.reset"/></html:reset>
      </sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>
</html:form>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

