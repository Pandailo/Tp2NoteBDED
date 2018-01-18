<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/JonasMqConnectConnectionFactoryEdit">
<input type="hidden" name="operation" value="apply">
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="JonasMqConnectStartAction"><bean:message key="tab.jonasmqconnect.server"/></sj:tab>
  <sj:tab forward="JonasMqConnectDestinationsAction"><bean:message key="tab.jonasmqconnect.destinations"/></sj:tab>
  <sj:tab forward="JonasMqConnectMdbsAction"><bean:message key="tab.jonasmqconnect.mdbs"/></sj:tab>
  <sj:tab forward="JonasMqConnectConnectionFactoryEditAction" selected="true"><bean:message key="tab.jonasmqconnect.connectionfactory"/></sj:tab>

<sj:panel>
    <sj:jonasgrid>
      <sj:jgRowTitle level="2">
        <sj:jgColTitle><bean:message key="title.joansmqconnect.action"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow changeStyle="true">
      	<bean:define id="operationEdit" value="edit"/>
        <sj:gridcol>
          <sj:grid cellPadding="10">
            <sj:gridrow>
              <sj:gridcol>
                <logic:equal name="JonasMqConnectConnectionFactoryEditForm" property="operation" value="edit">
                    <sj:jonasbutton href="javascript:submitForm('JonasMqConnectConnectionFactoryEditForm')">
                        <bean:message key="button.apply"/>
                    </sj:jonasbutton>
                </logic:equal>
                <logic:notEqual name="JonasMqConnectConnectionFactoryEditForm" property="operation" value="edit">
                    <sj:jonasbutton forward="JonasMqConnectConnectionFactoryEditAction" paramId="operation" paramName="operationEdit">
                        <bean:message key="button.joansmqconnect.editconnectionfactory"/>
                    </sj:jonasbutton>
                </logic:notEqual>
              </sj:gridcol>
            </sj:gridrow>
          </sj:grid>
        </sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>

    <sj:panelSeparator/>

    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle>
            <logic:equal name="JonasMqConnectConnectionFactoryEditForm" property="type" value="CF">
                <bean:message key="label.joansmqconnect.connectionfactory.cf"/>
            </logic:equal>
            <logic:equal name="JonasMqConnectConnectionFactoryEditForm" property="type" value="TCF">
                <bean:message key="label.joansmqconnect.connectionfactory.tcf"/>
            </logic:equal>
            <logic:equal name="JonasMqConnectConnectionFactoryEditForm" property="type" value="QCF">
                <bean:message key="label.joansmqconnect.connectionfactory.qcf"/>
            </logic:equal>
        </sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>

    <sj:jonasgrid>
        <logic:iterate id="item" name="JonasMqConnectConnectionFactoryEditForm" property="properties">
          <sj:gridrow>
            <sj:gridcol width="40%">
                <bean:write name="item" property="text"/>
            </sj:gridcol>
            <sj:gridcol>
                <logic:notEqual name="JonasMqConnectConnectionFactoryEditForm" property="operation" value="edit">
                    <bean:write name="item" property="value"/>
                </logic:notEqual>
                <logic:equal name="JonasMqConnectConnectionFactoryEditForm" property="operation" value="edit">
                    <input type="text" style="width: 100%" name="<bean:write name="item" property="name"/>" value="<bean:write name="item" property="value"/>">
                </logic:equal>
            </sj:gridcol>
          </sj:gridrow>
        </logic:iterate>
    </sj:jonasgrid>

  </sj:panel>
</sj:tabs>
</html:form>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>
