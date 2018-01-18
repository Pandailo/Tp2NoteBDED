<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ApplyLoggingJonas">
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionListLoggers"><bean:message key="tab.loggers"/></sj:tab>
  <sj:tab forward="ActionEditLoggingJonas" selected="true"><bean:message key="tab.logging.jonas"/></sj:tab>
  <sj:tab forward="ActionViewLoggingJonas"><bean:message key="tab.logging.view_recent"/></sj:tab>
  <sj:panel>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="get.title.logging.jonas"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid globalRowStyleClass="panel">
      <sj:gridrow>
        <sj:jgName><bean:message key="get.label.logging.jonas.topic"/></sj:jgName>
        <sj:jgValue>
          <html:select property="topic">
            <html:options property="topics"/>
          </html:select>
        </sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="get.label.logging.jonas.level"/></sj:jgName>
        <sj:jgValue>
          <html:select property="level">
            <bean:define id="loggerLevel" name="loggingJonasForm" property="loggerJonasLevels"/>
            <html:options collection="loggerLevel" property="value" labelProperty="label"/>
          </html:select>
        </sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName></sj:jgName>
        <sj:jgValue><html:submit styleClass="button"><bean:message key="button.apply"/></html:submit></sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>
    <sj:panelSeparator/>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgNameTitle><bean:message key="list.title.logging.jonas.levels"/></sj:jgNameTitle>
        <sj:jgValueTitle><bean:message key="list.title.logging.jonas.topics"/></sj:jgValueTitle>
      </sj:jgRowTitle>
      <logic:iterate id="item" name="loggingJonasForm" property="topicLevelList">
        <sj:gridrow>
          <sj:jgName><bean:write name="item" property="level"/></sj:jgName>
          <sj:jgValue><bean:write name="item" property="topic"/></sj:jgValue>
        </sj:gridrow>
      </logic:iterate>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>
</html:form>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

