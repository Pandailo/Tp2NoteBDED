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
  <%--sj:tab forward="JonasMqConnectStartAction"><bean:message key="tab.jonasmqconnect.server"/></sj:tab>
  <sj:tab forward="JonasMqConnectDestinationsAction"><bean:message key="tab.jonasmqconnect.destinations"/></sj:tab--%>
  <sj:tab forward="JonasMqConnectMdbsAction"><bean:message key="tab.jonasmqconnect.mdbs"/></sj:tab>
  <sj:tab forward="JonasMqConnectMdbEditAction" selected="true">
     <bean:message key="tab.jonasmqconnect.editmdb"/>
     <bean:write name="JonasMqConnectMdbEditForm" property="name"/>
  </sj:tab>

<sj:panel>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.joansmqconnect.propetriesmdb"/> : <bean:write name="JonasMqConnectMdbEditForm" property="name"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>

    <sj:jonasgrid>
        <logic:iterate id="item" name="JonasMqConnectMdbEditForm" property="properties">
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

</sj:panel>
</sj:tabs>
</html:form>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>
