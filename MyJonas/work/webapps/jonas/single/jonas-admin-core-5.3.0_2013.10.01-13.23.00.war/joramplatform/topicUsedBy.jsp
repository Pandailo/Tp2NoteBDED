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
  <sj:tab forward="ActionEditJoramPlatform"><bean:message key="tab.joramplatform"/></sj:tab>
  <logic:present name="joramPlatformForm">
    <sj:tab forward="JoramServers"><bean:message key="tab.joramservers"/></sj:tab>
  </logic:present>
  <sj:tab forward="ActionEditJoramServer"><bean:message key="tab.joramplatform.joramlocaldestinations"/></sj:tab>
  <sj:tab forward="ActionEditJoramTopic">
    <bean:write name="joramTopicForm" property="name"/>
    <bean:message key="tab.joramplatform.topic"/>
  </sj:tab>
  <sj:tab forward="JoramDestStatistics">
    <bean:write name="joramTopicForm" property="name"/>
    <bean:message key="tab.joramplatform.dest.stat"/>
  </sj:tab>
  <bean:size id="listSize" name="joramTopicForm" property="listUsedByEjb"/>
  <logic:notEqual name="listSize" value="0">
    <sj:tab forward="Joram Topic Used By" selected="true"><bean:message key="tab.joramplatform.topic.usedby"/></sj:tab>
  </logic:notEqual>
  <logic:present name="users">
    <sj:tab forward="JoramUsers"><bean:message key="tab.joramplatform.joramlocalusers"/></sj:tab>
  </logic:present>
  <sj:panel>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.joramplatform.topic.usedby.ejb"/></sj:jgColTitle>
        <sj:jgColTitle><bean:message key="title.joramplatform.topic.usedby.type"/></sj:jgColTitle>
      </sj:jgRowTitle>
      <logic:iterate id="item" name="joramTopicForm" property="listUsedByEjb">
        <sj:gridrow>
          <sj:gridcol>
            <logic:equal name="item" property="typeString" value="Ent">
              <html:link forward="ActionEditEjbEntity" styleClass="panel"
               paramId="select" paramName="item" paramProperty="objectName">
                <bean:write name="item" property="name"/>
              </html:link>
            </logic:equal>
            <logic:equal name="item" property="typeString" value="Sbf">
              <html:link forward="ActionEditEjbSbf" styleClass="panel"
               paramId="select" paramName="item" paramProperty="objectName">
                <bean:write name="item" property="name"/>
              </html:link>
            </logic:equal>
            <logic:equal name="item" property="typeString" value="Sbl">
              <html:link forward="ActionEditEjbSbl" styleClass="panel"
               paramId="select" paramName="item" paramProperty="objectName">
                <bean:write name="item" property="name"/>
              </html:link>
            </logic:equal>
            <logic:equal name="item" property="typeString" value="Mdb">
              <html:link forward="ActionEditEjbMdb" styleClass="panel"
               paramId="select" paramName="item" paramProperty="objectName">
                <bean:write name="item" property="name"/>
              </html:link>
            </logic:equal>
          </sj:gridcol>
          <sj:gridcol><bean:write name="item" property="type"/></sj:gridcol>
        </sj:gridrow>
      </logic:iterate>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>