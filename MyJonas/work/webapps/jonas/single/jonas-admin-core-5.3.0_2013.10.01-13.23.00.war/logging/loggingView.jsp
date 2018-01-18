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
  <sj:tab forward="ActionListLoggers"><bean:message key="tab.loggers"/></sj:tab>
  <sj:tab forward="ActionEditLoggingJonas"><bean:message key="tab.logging.jonas"/></sj:tab>
  <sj:tab forward="ActionViewLoggingJonas" selected="true"><bean:message key="tab.logging.view_recent"/></sj:tab>
  <sj:panel>
    <bean:define id="isBuffer" name="viewJonasLoggingForm" property="buffer"/>
    <logic:notEqual name ="isBuffer" value="true">
      <sj:jonasgrid>
        <sj:gridrow>
          <sj:gridcol>
            <bean:message key="message.logging.view.nobuffer"/>
          </sj:gridcol>
        </sj:gridrow>
      </sj:jonasgrid>
    </logic:notEqual>
    <logic:equal name ="isBuffer" value="true">
    <sj:jonasgrid>
      <sj:gridrow>
          <sj:jgName><bean:message key="label.logging.jonas.view.recent.date.latest"/></sj:jgName>
          <sj:jgValue><bean:write name="viewJonasLoggingForm" property="latestDate"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
          <sj:jgName><bean:message key="label.logging.jonas.view.recent.date.oldest"/></sj:jgName>
          <sj:jgValue><bean:write name="viewJonasLoggingForm" property="oldestDate"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
         <sj:jgName><bean:message key="label.logging.jonas.view.errors"/></sj:jgName>
         <sj:jgValue><bean:write name="viewJonasLoggingForm" property="severeCount"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
          <sj:jgName><bean:message key="label.logging.jonas.view.warnings"/></sj:jgName>
          <sj:jgValue><bean:write name="viewJonasLoggingForm" property="warningCount"/></sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>

    <sj:panelSeparator/>

    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.logging.jonas.view.recent"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>

    <sj:jonasgrid>
      <sj:gridrow>
        <sj:gridcol><pre><bean:write name="viewJonasLoggingForm" property="recent"/></pre></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>

    <sj:panelSeparator/>


    <sj:panelSeparator/>

    <sj:jonasgrid globalRowStyleClass="panel">
      <sj:gridrow>
        <sj:jgName></sj:jgName>
        <sj:gridcol>
          <sj:jonasbutton forward="ActionViewLoggingJonas">
            <bean:message key="button.logging.jonas.view.recent"/>
          </sj:jonasbutton>
        </sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>

    </logic:equal>
  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>