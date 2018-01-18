<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/JonasMqConnectDestinationEdit">
<input type="hidden" name="operation" value="apply">
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">


  <sj:tab forward="JonasMqConnectPlatformAction"><bean:message key="tab.jonasmqconnect.servers"/></sj:tab>
  <sj:tab forward="JonasMqConnectStartAction"><bean:write name="mqconnector" /></sj:tab>
  <sj:tab forward="JonasMqConnectDestinationsAction"><bean:message key="tab.jonasmqconnect.destinations"/></sj:tab>
  <%--sj:tab forward="JonasMqConnectDestinationEditAction" selected="true"><bean:message key="tab.jonasmqconnect.editdestination"/></sj:tab--%>
  <sj:tab forward="JonasMqConnectDestinationEditAction" selected="true">
    <bean:message key="tab.jonasmqconnect.editdestination"/>
    <bean:write name="JonasMqConnectDestinationEditForm" property="jndiName"/>
  </sj:tab>
  

<sj:panel>
    <sj:jonasgrid>
      <sj:jgRowTitle level="2">
        <sj:jgColTitle><bean:message key="title.joansmqconnect.action"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow changeStyle="true">
      	<bean:define id="operationEdit" value="edit"/>
      	<bean:define id="operationClearQueue" value="clearQueue"/>
        <sj:gridcol>
          <sj:grid cellPadding="10">
            <sj:gridrow>
                <logic:equal name="JonasMqConnectDestinationEditForm" property="operation" value="view">
                  <sj:gridcol>
                    <sj:jonasbutton forward="JonasMqConnectDestinationEditAction" paramId="operation" paramName="operationEdit">
                        <bean:message key="button.joansmqconnect.editdestination"/>
                    </sj:jonasbutton>
                  </sj:gridcol>
                  <logic:equal name="JonasMqConnectDestinationEditForm" property="isTopic" value="false">
                      <sj:gridcol>
                        <sj:jonasbutton forward="JonasMqConnectDestinationEditAction" paramId="operation" paramName="operationClearQueue">
                            <bean:message key="button.joansmqconnect.clearqueue"/>
                        </sj:jonasbutton>
                      </sj:gridcol>
                  </logic:equal>
                </logic:equal>
                <logic:equal name="JonasMqConnectDestinationEditForm" property="operation" value="edit">
                  <sj:gridcol>
                    <sj:jonasbutton href="javascript:submitForm('JonasMqConnectDestinationEditForm')">
                        <bean:message key="button.apply"/>
                    </sj:jonasbutton>
                  </sj:gridcol>  
                </logic:equal>
                <logic:equal name="JonasMqConnectDestinationEditForm" property="operation" value="apply">
                  <sj:gridcol>
                    <sj:jonasbutton href="javascript:submitForm('JonasMqConnectDestinationEditForm')">
                        <bean:message key="button.apply"/>
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
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.joansmqconnect.propetriesdestination"/> : <bean:write name="JonasMqConnectDestinationEditForm" property="jndiName"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>

    <sj:jonasgrid>
        <logic:iterate id="item" name="JonasMqConnectDestinationEditForm" property="properties">
          <sj:gridrow>
            <sj:gridcol width="40%">
                <bean:write name="item" property="text"/>
            </sj:gridcol>
            <sj:gridcol>
                <logic:equal name="JonasMqConnectDestinationEditForm" property="operation" value="view">
                    <bean:write name="item" property="value"/>
                </logic:equal>
                <logic:notEqual name="JonasMqConnectDestinationEditForm" property="operation" value="view">
                    <input type="text" style="width: 100%" name="<bean:write name="item" property="name"/>" value="<bean:write name="item" property="value"/>">
                </logic:notEqual>
            </sj:gridcol>
          </sj:gridrow>
        </logic:iterate>
    </sj:jonasgrid>

    <logic:equal name="JonasMqConnectDestinationEditForm" property="operation" value="view">
        <logic:equal name="JonasMqConnectDestinationEditForm" property="isTopic" value="false">
            <sj:jonasgrid>
              <sj:jgRowTitle>
                <sj:jgColTitle><bean:message key="title.joansmqconnect.statpropetriesdestination"/> : <bean:write name="JonasMqConnectDestinationEditForm" property="jndiName"/></sj:jgColTitle>
            </sj:jgRowTitle>
            </sj:jonasgrid>

            <sj:jonasgrid>
                <logic:iterate id="item" name="JonasMqConnectDestinationEditForm" property="statProperties">
                <sj:gridrow>
                    <sj:gridcol width="40%">
                        <bean:write name="item" property="text"/>
                    </sj:gridcol>
                    <sj:gridcol>
                        <bean:write name="item" property="value"/>
                    </sj:gridcol>
                </sj:gridrow>
                </logic:iterate>
            </sj:jonasgrid>
        </logic:equal>
    </logic:equal>


</sj:panel>
<sj:tab forward="JonasMqConnectMdbsAction"><bean:message key="tab.jonasmqconnect.mdbs"/></sj:tab>
</sj:tabs>
</html:form>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>
