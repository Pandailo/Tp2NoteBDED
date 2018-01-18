<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ApplyDatasource">
<html:hidden property="action"/>
<html:hidden property="datasourceName"/>

<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionListDatabases"><bean:message key="tab.database.datasources"/></sj:tab>
  <sj:tab forward="ActionEditDatasource" selected="true"><bean:write name="datasourceForm" property="datasourceName"/></sj:tab>
  <sj:tab forward="ActionEditDatasourceStat"><bean:message key="tab.database.datasource.statistics"/></sj:tab>
  <bean:size id="listSize" name="datasourceForm" property="listUsedByEjb"/>
  <logic:notEqual name="listSize" value="0">
    <sj:tab forward="Datasource Used By"><bean:message key="tab.database.datasource.usedby"/></sj:tab>
  </logic:notEqual>

  <sj:panel>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.database.datasource.config"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.database.datasource.dsName"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="dsName"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.database.datasource.datasourceDescription"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="datasourceDescription"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.database.datasource.url"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="url"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.database.datasource.userName"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="userName"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.database.datasource.password"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="password"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.database.datasource.mapper"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="datasourceMapper"/></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>
    <sj:panelSeparator/>

    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.database.driver.config"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.database.driver.className"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="className"/></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>
    <sj:panelSeparator/>   
    
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.database.datasource.config.jdbc"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <logic:present name="<%=Globals.ERROR_KEY%>">
      <sj:jonasgrid>
        <sj:gridrow styleClass="errors">
          <sj:gridcol styleClass="errors"><html:errors/></sj:gridcol>
        </sj:gridrow>
      </sj:jonasgrid>
      <sj:panelSeparator/>
    </logic:present>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.database.datasource.jdbcConnMaxAge"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="jdbcConnMaxAge"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.database.datasource.jdbcConnMaxAge"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.database.datasource.jdbcMaxOpenTime"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="jdbcMaxOpenTime"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.database.datasource.jdbcMaxOpenTime"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.database.datasource.jdbcConnCheckLevel"/></sj:jgName>
        <sj:gridcol valign="top">
          <html:select property="jdbcConnCheckLevel">
            <bean:define id="listCheckingLevels" name="datasourceForm" property="checkingLevels"/>
            <html:options collection="listCheckingLevels" property="value" labelProperty="label"/>
          </html:select>
        </sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.database.datasource.jdbcConnCheckLevel"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.database.datasource.jdbcTestStatement"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="jdbcTestStatement"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.database.datasource.jdbcTestStatement"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.database.datasource.jdbcMinConnPool"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="jdbcMinConnPool"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.database.datasource.jdbcMinConnPool"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.database.datasource.jdbcMaxConnPool"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="jdbcMaxConnPool"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.database.datasource.jdbcMaxConnPool"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.database.datasource.jdbcMaxWaitTime"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="jdbcMaxWaitTime"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.database.datasource.jdbcMaxWaitTime"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.database.datasource.jdbcMaxWaiters"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="jdbcMaxWaiters"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.database.datasource.jdbcMaxWaiters"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.database.datasource.jdbcPstmtMax"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="jdbcPstmtMax"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.database.datasource.jdbcPstmtMax"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.database.datasource.jdbcSamplingPeriod"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="jdbcSamplingPeriod"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.database.datasource.jdbcSamplingPeriod"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.database.datasource.jdbcAdjustPeriod"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="jdbcAdjustPeriod"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.database.datasource.jdbcAdjustPeriod"/></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>
    <sj:panelSeparator/>
    <sj:jonasgrid globalRowStyleClass="panel">
      <sj:gridrow>
        <sj:jgName></sj:jgName>
        <sj:gridcol>
          <html:button property="btn_apply" styleClass="button"
            onclick="submitHidden('datasourceForm','action','apply')">
            <bean:message key="button.apply"/>
          </html:button>
          &nbsp;&nbsp;
          <html:reset styleClass="button"><bean:message key="button.reset"/></html:reset>
          &nbsp;&nbsp;
          <html:button property="btn_save" styleClass="button"
            onclick="submitHidden('datasourceForm','action','save')">
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

