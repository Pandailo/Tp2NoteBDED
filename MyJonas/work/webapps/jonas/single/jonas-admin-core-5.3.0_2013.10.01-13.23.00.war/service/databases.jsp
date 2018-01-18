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
  <sj:tab forward="ActionListDatabases" selected="true"><bean:message key="tab.database.datasources"/></sj:tab>
  <sj:panel>
    <sj:jonasgrid>
      <bean:size id="listSize" name="listDatabases"/>
      <logic:equal name="listSize" value="0">
        <sj:gridrow>
          <sj:gridcol><bean:message key="message.database.datasources.none"/></sj:gridcol>
        </sj:gridrow>
      </logic:equal>
      <logic:notEqual name="listSize" value="0">
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="title.database.datasources.name"/></sj:jgColTitle>
          <sj:jgColTitle><bean:message key="title.database.datasources.jndiName"/></sj:jgColTitle>
          <sj:jgColTitle><bean:message key="title.database.datasources.jdbcConnectionOpened"/></sj:jgColTitle>
        </sj:jgRowTitle>
        <logic:iterate id="item" name="listDatabases">
          <sj:gridrow>
            <sj:gridcol>
              <html:link forward="ActionEditDatasource" styleClass="panel"
                paramId="name" paramName="item" paramProperty="name">
                <bean:write name="item" property="name"/>
              </html:link>
            </sj:gridcol>
            <sj:gridcol><bean:write name="item" property="jndiName"/></sj:gridcol>
            <sj:gridcol><bean:write name="item" property="jdbcConnectionOpened"/></sj:gridcol>
          </sj:gridrow>
        </logic:iterate>
      </logic:notEqual>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

