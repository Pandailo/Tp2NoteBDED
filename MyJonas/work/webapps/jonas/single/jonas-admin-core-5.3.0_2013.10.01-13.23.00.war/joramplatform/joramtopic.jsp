<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/joramTopicForm">
<html:hidden property="action"/>

<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionEditJoramPlatform"><bean:message key="tab.joramplatform"/></sj:tab>
  <logic:present name="joramPlatformForm">
    <sj:tab forward="JoramServers"><bean:message key="tab.joramservers"/></sj:tab>
  </logic:present>
  <logic:equal name="isLocalServer" value="true">
    <logic:equal name="collocatedServer" value="true">
      <sj:tab forward="ActionEditJoramServer"><bean:message key="tab.joramplatform.joramlocaldestinations"/></sj:tab>
    </logic:equal>
    <logic:notEqual name="collocatedServer" value="true">
      <sj:tab forward="ActionEditJoramServer"><bean:message key="tab.joramplatform.joramcurrentdestinations"/></sj:tab>
    </logic:notEqual>
  </logic:equal>
  <logic:notEqual name="isLocalServer" value="true">
    <sj:tab forward="ActionEditJoramServer"><bean:message key="tab.joramplatform.joramdestinations"/></sj:tab>
  </logic:notEqual>
  <sj:tab forward="ActionEditJoramTopic" selected="true">
    <bean:write name="joramTopicForm" property="name"/>
    <bean:message key="tab.joramplatform.topic"/>
  </sj:tab>
  <logic:notEqual name="joramTopicForm" property="freelyReadable" value="true">
    <sj:tab forward="JoramTopicReaders">
      <bean:write name="joramTopicForm" property="name"/>
      <bean:message key="tab.joramplatform.dest.readers"/>
    </sj:tab>
  </logic:notEqual>
  <logic:notEqual name="joramTopicForm" property="freelyWriteable" value="true">
    <sj:tab forward="JoramTopicWriters">
      <bean:write name="joramTopicForm" property="name"/>
      <bean:message key="tab.joramplatform.dest.writers"/>
    </sj:tab>
  </logic:notEqual>
  <sj:tab forward="JoramDestStatistics">
    <bean:write name="joramTopicForm" property="name"/>
    <bean:message key="tab.joramplatform.dest.stat"/>
  </sj:tab>
  <bean:size id="listSize" name="joramTopicForm" property="listUsedByEjb"/>
  <logic:notEqual name="listSize" value="0">
    <sj:tab forward="Joram Topic Used By"><bean:message key="tab.joramplatform.topic.usedby"/></sj:tab>
  </logic:notEqual>
  <logic:present name="users">
    <logic:equal name="isLocalServer" value="true">
      <logic:equal name="collocatedServer" value="true">
        <sj:tab forward="JoramUsers"><bean:message key="tab.joramplatform.joramlocalusers"/></sj:tab>
      </logic:equal>
      <logic:notEqual name="collocatedServer" value="true">
        <sj:tab forward="JoramUsers"><bean:message key="tab.joramplatform.joramusers"/></sj:tab>
      </logic:notEqual>
    </logic:equal>
    <logic:notEqual name="isLocalServer" value="true">
      <sj:tab forward="JoramUsers"><bean:message key="tab.joramplatform.joramusers"/></sj:tab>
    </logic:notEqual>
  </logic:present>
  <sj:panel>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joramadmin.destination.name"/></sj:jgName>
        <sj:jgValue><bean:write name="joramTopicForm" property="name"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joramadmin.destination.id"/></sj:jgName>
        <sj:jgValue><bean:write name="joramTopicForm" property="id"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joramadmin.destination.creationDate"/></sj:jgName>
        <sj:jgValue><bean:write name="joramTopicForm" property="creationDate"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joramadmin.destination.dmq"/></sj:jgName>
        <logic:present name="joramQueueForm" property="dmq">
          <sj:jgValue><bean:write name="joramQueueForm" property="dmq"/></sj:jgValue>
        </logic:present>
        <logic:notPresent name="joramQueueForm" property="dmq">
          <sj:jgValue><bean:message key="label.joramadmin.queue.dmq.notset"/></sj:jgValue>
        </logic:notPresent>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joramadmin.topic.subscriptions"/></sj:jgName>
        <sj:jgValue><bean:write name="joramTopicForm" property="subscriptions"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joramadmin.topic.subscribers"/></sj:jgName>
        <sj:gridcol><html:textarea name="joramTopicForm" property="subscribers" rows="2" cols="50"/></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>

    <sj:panelSeparator/>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joramadmin.destination.readable"/></sj:jgName>
        <sj:jgValue>
          <html:select property="freelyReadable">
            <bean:define id="booleanVals" name="joramTopicForm" property="booleanVals"/>
            <html:options collection="booleanVals" property="value" labelProperty="label"/>
          </html:select>
        </sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joramadmin.destination.writeable"/></sj:jgName>
        <sj:jgValue>
          <html:select property="freelyWriteable">
            <bean:define id="booleanVals" name="joramTopicForm" property="booleanVals"/>
            <html:options collection="booleanVals" property="value" labelProperty="label"/>
          </html:select>
        </sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>

    <sj:panelSeparator/>
    <sj:jonasgrid globalRowStyleClass="panel">
      <sj:gridrow>
        <sj:jgName></sj:jgName>
        <sj:gridcol>
          <html:button property="btn_apply" styleClass="button"
            onclick="submitHidden('joramTopicForm','action','apply')">
            <bean:message key="button.apply"/>
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