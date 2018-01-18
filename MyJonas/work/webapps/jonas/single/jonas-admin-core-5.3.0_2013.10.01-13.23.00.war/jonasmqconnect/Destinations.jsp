<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="/common/begin.jsp" %>
<body class="content">
<html:form action="/JonasMqConnectDestinationDelete">
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <%--sj:tab forward="JonasMqConnectStartAction"><bean:message key="tab.jonasmqconnect.server"/></sj:tab--%>
  <sj:tab forward="JonasMqConnectPlatformAction"><bean:message key="tab.jonasmqconnect.servers"/></sj:tab>
  <sj:tab forward="JonasMqConnectStartAction"><bean:write name="mqconnector" /></sj:tab>
  <sj:tab forward="JonasMqConnectDestinationsAction" selected="true"><bean:message key="tab.jonasmqconnect.destinations"/></sj:tab>
  <sj:tab forward="JonasMqConnectMdbsAction"><bean:message key="tab.jonasmqconnect.mdbs"/></sj:tab>
  <sj:panel>
    <bean:size id="listSize" name="mqdestinations"/>
    <sj:jonasgrid>
      <sj:jgRowTitle level="2">
        <sj:jgColTitle><bean:message key="title.joansmqconnect.action"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow changeStyle="true">
        <sj:gridcol>
          <sj:grid cellPadding="10">
            <sj:gridrow>
              <sj:gridcol>
                <sj:jonasbutton forward="JonasMqConnectDestinationAddAction">
                  <bean:message key="button.joansmqconnect.createdestination"/>
                </sj:jonasbutton>
              </sj:gridcol>
              <logic:notEqual name="listSize" value="0">
              <sj:gridcol>
                <sj:jonasbutton href="javascript:submitForm('JonasMqConnectDestinationDeleteForm')">
                  <bean:message key="button.joansmqconnect.removedestination"/>
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
            <bean:message key="message.joansmqconnect.none"/>
          </sj:gridcol>
        </sj:gridrow>
      </logic:equal>
      <logic:notEqual name="listSize" value="0">
        <sj:jgRowTitle>
          <sj:jgColTitle>&nbsp;</sj:jgColTitle>
          <sj:jgColTitle><bean:message key="label.joansmqconnect.destination.name"/></sj:jgColTitle>
          <sj:jgColTitle><bean:message key="label.joansmqconnect.destination.type"/></sj:jgColTitle>
          <sj:jgColTitle><bean:message key="label.joansmqconnect.destination.basename"/></sj:jgColTitle>
        </sj:jgRowTitle>

        <logic:iterate id="item" name="mqdestinations">
          <sj:gridrow>
            <sj:gridcol width="5%">
              <html:multibox property="selectedDestinations">
                <bean:write name="item" property="name"/>
              </html:multibox>
            </sj:gridcol>
            <sj:gridcol width="17%">
              <logic:equal name="item" property="type" value="queue">
                <html:link action="/JonasMqConnectDestinationEdit.do?operation=view" styleClass="panel" paramId="jndiName" paramName="item" paramProperty="name">
                  <bean:write name="item" property="name"/>
                </html:link>
              </logic:equal>
              <logic:equal name="item" property="type" value="topic">
                <html:link action="/JonasMqConnectDestinationEdit.do?operation=view" styleClass="panel" paramId="jndiName" paramName="item" paramProperty="name">
                  <bean:write name="item" property="name"/>
                </html:link>
              </logic:equal>
            </sj:gridcol>
            <sj:gridcol>
              <bean:write name="item" property="type"/>
            </sj:gridcol>
            <sj:gridcol>
              <bean:write name="item" property="baseName"/>
            </sj:gridcol>
          </sj:gridrow>
        </logic:iterate>
      </logic:notEqual>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>
</html:form>
</body>
<%@ include file="/common/end.jsp" %>
</html:html>