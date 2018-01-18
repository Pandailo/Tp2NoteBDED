<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/RemoveJoramDestinations">
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionEditJoramPlatform"><bean:message key="tab.joramplatform"/></sj:tab>
  <logic:present name="joramPlatformForm">
    <sj:tab forward="JoramServers"><bean:message key="tab.joramservers"/></sj:tab>
  </logic:present>
  <logic:equal name="isLocalServer" value="true">
    <logic:equal name="collocatedServer" value="true">
      <sj:tab forward="ActionEditJoramServer" selected="true"><bean:message key="tab.joramplatform.joramlocaldestinations"/></sj:tab>
    </logic:equal>
    <logic:notEqual name="collocatedServer" value="true">
      <sj:tab forward="ActionEditJoramServer" selected="true"><bean:message key="tab.joramplatform.joramcurrentdestinations"/></sj:tab>
    </logic:notEqual>
  </logic:equal>
  <logic:notEqual name="isLocalServer" value="true">
    <sj:tab forward="ActionEditJoramServer" selected="true"><bean:message key="tab.joramplatform.joramdestinations"/></sj:tab>
  </logic:notEqual>
  <logic:equal name="isLocalServer" value="true">
    <logic:equal name="collocatedServer" value="true">
      <sj:tab forward="JoramUsers"><bean:message key="tab.joramplatform.joramlocalusers"/></sj:tab>
    </logic:equal>
    <logic:notEqual name="collocatedServer" value="true">
      <sj:tab forward="JoramUsers"><bean:message key="tab.joramplatform.joramcurrentusers"/></sj:tab>
    </logic:notEqual>
  </logic:equal>
  <logic:notEqual name="isLocalServer" value="true">
    <sj:tab forward="JoramUsers"><bean:message key="tab.joramplatform.joramusers"/></sj:tab>
  </logic:notEqual>
  <sj:panel>
    <bean:size id="listSize" name="destinations"/>
    <sj:jonasgrid>
      <sj:jgRowTitle level="2">
        <sj:jgColTitle><bean:message key="title.joramdestinations.action"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow changeStyle="true">
        <sj:gridcol>
          <sj:grid cellPadding="10">
            <sj:gridrow>
              <sj:gridcol>
                <sj:jonasbutton forward="ActionCreateJoramDestination">
                  <bean:message key="button.joramdestinations.action.create"/>
                </sj:jonasbutton>
              </sj:gridcol>
              <logic:notEqual name="listSize" value="0">
              <sj:gridcol>
                <sj:jonasbutton href="javascript:submitForm('removeDestinationsForm')">
                  <bean:message key="button.joramdestinations.action.remove"/>
                </sj:jonasbutton>
              </sj:gridcol>
              </logic:notEqual>
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
            <bean:message key="message.joramdestinations.none"/>
            <bean:write name="localId"/>
          </sj:gridcol>
        </sj:gridrow>
      </logic:equal>
      <logic:notEqual name="listSize" value="0">
        <sj:jgRowTitle>
          <sj:jgColTitle>&nbsp;</sj:jgColTitle>
          <sj:jgColTitle><bean:message key="label.joramplatform.destination.name"/></sj:jgColTitle>
          <sj:jgColTitle><bean:message key="label.joramplatform.destination.type"/></sj:jgColTitle>
          <sj:jgColTitle><bean:message key="label.joramplatform.destination.id"/></sj:jgColTitle>
        </sj:jgRowTitle>

        <logic:iterate id="item" name="destinations">
          <sj:gridrow>
            <sj:gridcol width="5%">
              <logic:equal name="item" property="used" value="false">
              <logic:equal name="item" property="manageable" value="true">
                <html:multibox property="selectedItems">
                  <bean:write name="item" property="name"/>
                </html:multibox>
              </logic:equal>
              </logic:equal>
            </sj:gridcol>
            <sj:gridcol width="17%">
            <logic:equal name="item" property="manageable" value="true">
              <logic:equal name="item" property="type" value="Queue">
                <html:link forward="ActionEditJoramQueue" styleClass="panel" paramId="name"  paramName="item" paramProperty="name">
                  <bean:write name="item" property="name"/>
                </html:link>
              </logic:equal>
              <logic:equal name="item" property="type" value="Topic">
                <html:link forward="ActionEditJoramTopic" styleClass="panel" paramId="name"  paramName="item" paramProperty="name">
                  <bean:write name="item" property="name"/>
                </html:link>
              </logic:equal>
            </logic:equal>
            <logic:notEqual name="item" property="manageable" value="true">
              <bean:write name="item" property="name"/>
            </logic:notEqual>
            </sj:gridcol>
            <sj:gridcol>
              <bean:write name="item" property="type"/>
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
</html:form>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>
