<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="/common/begin.jsp" %>
<body class="content">
<html:form action="/JonasMqConnect">
<input type="hidden" name="operation" value="apply">
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="JonasMqConnectPlatformAction"><bean:message key="tab.jonasmqconnect.servers"/></sj:tab>
  <%--sj:tab forward="JonasMqConnectForm" selected="true"><bean:message key="tab.jonasmqconnect.server"/></sj:tab--%>
  <sj:tab forward="JonasMqConnectStartAction" selected="true"><bean:write name="mqconnector" /></sj:tab>
  <sj:tab forward="JonasMqConnectDestinationsAction"><bean:message key="tab.jonasmqconnect.destinations"/></sj:tab>
  <sj:tab forward="JonasMqConnectMdbsAction"><bean:message key="tab.jonasmqconnect.mdbs"/></sj:tab>
  <sj:panel>
    <sj:jonasgrid>
      <sj:jgRowTitle level="2">
        <sj:jgColTitle><bean:message key="title.joansmqconnect.action"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow changeStyle="true">
      	<bean:define id="operationEdit" value="edit"/>
      	<bean:define id="operationSaveDestinationConfig" value="saveDestinationConfig"/>
      	<bean:define id="operationLoadDestinationConfig" value="loadDestinationConfig"/>
      	<bean:define id="operationRefresh" value="refresh"/>
        <sj:gridcol>
          <sj:grid cellPadding="10">
            <sj:gridrow>
              <sj:gridcol>
                <logic:equal name="JonasMqConnectForm" property="operation" value="view">
                    <sj:jonasbutton forward="JonasMqConnectStartAction" paramId="operation" paramName="operationEdit">
                        <bean:message key="button.joansmqconnect.editconnectorproperties"/>
                    </sj:jonasbutton>
                </logic:equal>
                <logic:equal name="JonasMqConnectForm" property="operation" value="edit">
                    <sj:jonasbutton href="javascript:submitForm('JonasMqConnectForm')">
                        <bean:message key="button.apply"/>
                    </sj:jonasbutton>
                </logic:equal>
                <logic:equal name="JonasMqConnectForm" property="operation" value="apply">
                    <sj:jonasbutton href="javascript:submitForm('JonasMqConnectForm')">
                        <bean:message key="button.apply"/>
                    </sj:jonasbutton>
                </logic:equal>
              </sj:gridcol>
              <logic:equal name="JonasMqConnectForm" property="operation" value="view">
                <sj:gridcol>
                    <sj:jonasbutton forward="JonasMqConnectStartAction" paramId="operation" paramName="operationSaveDestinationConfig">
                        <bean:message key="button.joansmqconnect.savedestinationconfig"/>
                    </sj:jonasbutton>
                </sj:gridcol>
                <sj:gridcol>
                    <sj:jonasbutton forward="JonasMqConnectStartAction" paramId="operation" paramName="operationLoadDestinationConfig">
                        <bean:message key="button.joansmqconnect.loaddestinationconfig"/>
                    </sj:jonasbutton>
                </sj:gridcol>
                <sj:gridcol>
                    <sj:jonasbutton forward="JonasMqConnectStartAction" paramId="operation" paramName="operationRefresh">
                        <bean:message key="button.joansmqconnect.refresh"/>
                    </sj:jonasbutton>
                </sj:gridcol>
              </logic:equal>

            </sj:gridrow>
          </sj:grid>
        </sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>

    <sj:panelSeparator/>

    <sj:jonasgrid>
        <sj:gridrow>
          <sj:jgName><bean:message key="label.joansmqconnect.release"/></sj:jgName>
          <sj:jgValue><bean:write name="JonasMqConnectForm" property="version"/></sj:jgValue>
        </sj:gridrow>
    </sj:jonasgrid>

    <sj:panelSeparator/>

    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.joansmqconnect.server"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>

    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joansmqconnect.hostname"/></sj:jgName>
        <sj:jgValue>
            <logic:equal name="JonasMqConnectForm" property="operation" value="view">
                <bean:write name="JonasMqConnectForm" property="hostname"/>
            </logic:equal>
            <logic:notEqual name="JonasMqConnectForm" property="operation" value="view">
                <input type="text" style="width: 100%" name="hostname" value="<bean:write name="JonasMqConnectForm" property="hostname"/>">
            </logic:notEqual>
        </sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joansmqconnect.channel"/></sj:jgName>
        <sj:jgValue>
            <logic:equal name="JonasMqConnectForm" property="operation" value="view">
                <bean:write name="JonasMqConnectForm" property="channel"/>
            </logic:equal>
            <logic:notEqual name="JonasMqConnectForm" property="operation" value="view">
                <input type="text" style="width: 100%" name="channel" value="<bean:write name="JonasMqConnectForm" property="channel"/>">
            </logic:notEqual>
        </sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joansmqconnect.port"/></sj:jgName>
        <sj:jgValue>
            <logic:equal name="JonasMqConnectForm" property="operation" value="view">
                <bean:write name="JonasMqConnectForm" property="port"/>
            </logic:equal>
            <logic:notEqual name="JonasMqConnectForm" property="operation" value="view">
                <input type="text" style="width: 100%" name="port" value="<bean:write name="JonasMqConnectForm" property="port"/>">
            </logic:notEqual>
        </sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joansmqconnect.queuemanager"/></sj:jgName>
        <sj:jgValue>
            <logic:equal name="JonasMqConnectForm" property="operation" value="view">
                <bean:write name="JonasMqConnectForm" property="queueManager"/>
            </logic:equal>
            <logic:notEqual name="JonasMqConnectForm" property="operation" value="view">
                <input type="text" style="width: 100%" name="queueManager" value="<bean:write name="JonasMqConnectForm" property="queueManager"/>">
            </logic:notEqual>
        </sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.joansmqconnect.transporttype"/></sj:jgName>
        <sj:jgValue>
            <logic:equal name="JonasMqConnectForm" property="operation" value="view">
                <bean:write name="JonasMqConnectForm" property="transportType"/>
            </logic:equal>
            <logic:notEqual name="JonasMqConnectForm" property="operation" value="view">
                <input type="text" style="width: 100%" name="transportType" value="<bean:write name="JonasMqConnectForm" property="transportType"/>">
            </logic:notEqual>
        </sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>

    <sj:panelSeparator/>

    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.joansmqconnect.connectionfactory"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>

    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName>&nbsp;</sj:jgName>
        <sj:jgValue>
            <html:link action="/JonasMqConnectConnectionFactoryEdit.do?type=CF&operation=view" styleClass="panel">
              <bean:message key="label.joansmqconnect.connectionfactory.cf"/>
            </html:link>
        </sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName>&nbsp;</sj:jgName>
        <sj:jgValue>
            <html:link action="/JonasMqConnectConnectionFactoryEdit.do?type=TCF&operation=view" styleClass="panel">
              <bean:message key="label.joansmqconnect.connectionfactory.tcf"/>
            </html:link>
        </sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName>&nbsp;</sj:jgName>
        <sj:jgValue>
            <html:link action="/JonasMqConnectConnectionFactoryEdit.do?type=QCF&operation=view" styleClass="panel">
              <bean:message key="label.joansmqconnect.connectionfactory.qcf"/>
            </html:link>
        </sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>
</html:form>
</body>
<%@ include file="/common/end.jsp" %>
</html:html>