<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="JonasMqConnectPlatformAction"><bean:message key="tab.jonasmqconnect.servers"/></sj:tab>
  <sj:tab forward="JonasMqConnectStartAction"><bean:write name="mqconnector" /></sj:tab>
  <sj:tab forward="JonasMqConnectDestinationsAction"><bean:message key="tab.jonasmqconnect.destinations"/></sj:tab>
  <%--sj:tab forward="JonasMqConnectStartAction"><bean:message key="tab.jonasmqconnect.server"/></sj:tab>
  <sj:tab forward="JonasMqConnectDestinationsAction"><bean:message key="tab.jonasmqconnect.destinations"/></sj:tab--%>
  <sj:tab forward="JonasMqConnectDestinationDeleteConfirmAction" selected="true"><bean:message key="tab.jonasmqconnect.deletedestination"/></sj:tab>

  <sj:panel>
    <logic:present name="<%=Globals.ERROR_KEY%>">
      <sj:panelSeparator/>
      <sj:jonasgrid>
        <sj:gridrow styleClass="errors">
          <sj:gridcol styleClass="errors"><html:errors/></sj:gridcol>
        </sj:gridrow>
      </sj:jonasgrid>
      <sj:panelSeparator/>
    </logic:present>
    <sj:jonasgrid>
      <bean:size id="listSize" name="JonasMqConnectDestinationDeleteForm" property="destinations"/>
      <!-- Empty List -->
      <logic:equal name="listSize" value="0">
        <sj:gridrow styleClass="errors">
          <sj:gridcol><bean:message key="message.joansmqconnect.destinations.list.empty"/></sj:gridcol>
        </sj:gridrow>
      </logic:equal>
      <!-- Full List -->
      <logic:notEqual name="listSize" value="0">
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="label.joansmqconnect.destination.name"/></sj:jgColTitle>
        </sj:jgRowTitle>

        <logic:iterate id="item" name="JonasMqConnectDestinationDeleteForm" property="destinations">
          <sj:gridrow>
            <sj:gridcol><bean:write name="item"/></sj:gridcol>
          </sj:gridrow>
        </logic:iterate>
        <input type="hidden" name="destinationsStr" value="<bean:write name="JonasMqConnectDestinationDeleteForm" property="destinationsStr"/>">        
      </logic:notEqual>
    </sj:jonasgrid>

    <logic:notEqual name="listSize" value="0">
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joansmqconnect.destinations.deletephysicaldestination"/></sj:jgName>
        <sj:gridcol>
          <input type="radio" name="deletePhysicalDestination" value="yes"><bean:message key="label.joansmqconnect.destinations.deletephysicaldestination.yes"/>
          <input type="radio" name="deletePhysicalDestination" value="no" checked><bean:message key="label.joansmqconnect.destinations.deletephysicaldestination.no"/>
        </sj:gridcol>
        <sj:gridcol>
        </sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>
    </logic:notEqual>

    <logic:notEqual name="listSize" value="0">
      <sj:panelSeparator/>
      <sj:jonasgrid globalRowStyleClass="panel">
        <sj:gridrow>
          <sj:gridcol>
            <sj:jonasbutton forward="JonasMqConnectDestinationDeleteConfirmAction">
              <bean:message key="button.confirm"/>
            </sj:jonasbutton>
          </sj:gridcol>
        </sj:gridrow>
      </sj:jonasgrid>
    </logic:notEqual>
  </sj:panel>
  <sj:tab forward="JonasMqConnectMdbsAction"><bean:message key="tab.jonasmqconnect.mdbs"/></sj:tab>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>
