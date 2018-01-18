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
  <logic:equal name="joramStatForm" property="type" value="queue">
  <sj:tab forward="ActionEditJoramQueue">
    <bean:write name="joramStatForm" property="name"/>
    <bean:message key="tab.joramplatform.queue"/>
  </sj:tab>
  </logic:equal>
  <logic:equal name="joramStatForm" property="type" value="topic">
  <sj:tab forward="ActionEditJoramTopic">
    <bean:write name="joramStatForm" property="name"/>
    <bean:message key="tab.joramplatform.topic"/>
  </sj:tab>
  </logic:equal>
  <logic:notEqual name="joramQueueForm" property="freelyReadable" value="true">
  <sj:tab forward="JoramQueueReaders">
    <bean:write name="joramQueueForm" property="name"/>
    <bean:message key="tab.joramplatform.dest.readers"/>
  </sj:tab>
  </logic:notEqual>
  <logic:notEqual name="joramQueueForm" property="freelyWriteable" value="true">
  <sj:tab forward="JoramQueueWriters" selected="true">
    <bean:write name="joramQueueForm" property="name"/>
    <bean:message key="tab.joramplatform.dest.writers"/>
  </sj:tab>
  </logic:notEqual>
  <sj:tab forward="JoramDestStatistics">
    <bean:write name="joramStatForm" property="name"/>
    <bean:message key="tab.joramplatform.dest.stat"/>
  </sj:tab>
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
    <bean:size id="listSize" name="joramQueueForm" property="writerList"/>
    <sj:jonasgrid>
      <sj:jgRowTitle level="2">
        <sj:jgColTitle><bean:message key="title.joramwriters.action"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow changeStyle="true">
        <sj:gridcol>
          <sj:grid cellPadding="10">
            <sj:gridrow>
              <sj:gridcol>
                <sj:jonasbutton forward="ActionAddJoramWriter">
                  <bean:message key="button.joramwriters.action.add"/>
                </sj:jonasbutton>
              </sj:gridcol>
            </sj:gridrow>
          </sj:grid>
        </sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>

    <sj:panelSeparator/>

    <sj:jonasgrid>
      <logic:equal name="listSize" value="0">
        <sj:gridrow>
          <sj:gridcol>
            <bean:message key="message.joramwriters"/>
          </sj:gridcol>
        </sj:gridrow>
      </logic:equal>

      <logic:notEqual name="listSize" value="0">
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="label.joramplatform.user.name"/></sj:jgColTitle>
          <sj:jgColTitle><bean:message key="label.joramplatform.user.id"/></sj:jgColTitle>
        </sj:jgRowTitle>

        <logic:iterate id="item" name="joramQueueForm" property="writerList">
          <sj:gridrow>

            <sj:gridcol>
              <bean:write name="item" property="name"/>
            </sj:gridcol>


            <sj:gridcol>
              <bean:write name="item" property="id"/>
            </sj:gridcol>
          </sj:gridrow>
        </logic:iterate>
      </logic:notEqual>

    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>