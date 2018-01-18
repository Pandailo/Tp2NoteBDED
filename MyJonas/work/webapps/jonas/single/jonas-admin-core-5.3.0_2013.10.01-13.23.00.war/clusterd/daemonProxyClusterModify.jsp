<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/DaemonProxyClusterApplyModif">
<meta http-equiv="refresh" content="10"; URL="DaemonProxyClusterInfo.do">
<!--html:hidden property="action"/-->
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
<sj:tab forward="ActionEditDomain"><bean:message key="tab.domain"/></sj:tab>
<sj:tab forward="ActionDaemonProxyClusterInfo"><bean:message key="label.domain.serverCld"/></sj:tab>
<sj:panel>
<!-- domain properties -->
<sj:jonasgrid>
<sj:jgRowTitle>
<sj:jgColTitle>
<bean:write name="daemonProxyClusterForm" property="name"/>
<bean:message key="label.domain.properties"/>
<bean:define id="cdName" name="daemonProxyClusterForm" property="name"/>
</sj:jgColTitle>
</sj:jgRowTitle>
</sj:jonasgrid>


<sj:jonasgrid>
<sj:gridrow>
<!--label.domain.name==name-->
<sj:jgName><bean:message key="label.domain.name"/></sj:jgName>

<sj:jgValue><html:text name="daemonProxyClusterForm" property="name" size="20"/></sj:jgValue>
</sj:gridrow>
</sj:jonasgrid>


<!-- servers action zone -->
<sj:panelSeparator/>

<!--The Servers List-->
<sj:jonasgrid>
<sj:jgRowTitle level="2">
<!-- title.domain.action==action -->
<sj:jgColTitle>
	<bean:message key="label.domain.servers"/>
</sj:jgColTitle>
</sj:jgRowTitle>
</sj:jonasgrid>

<sj:panelSeparator/>
<bean:size id="listSize" name="listServers"/>
    <!-- servers list -->
    <sj:jonasgrid>
      <logic:equal name="listSize" value="0">
      	<bean:message key="message.domain.servers.none"/>
      </logic:equal>
      <logic:notEqual name="listSize" value="0">
        <logic:iterate id="item" name="listServers">
          <sj:gridrow>
            <sj:gridcol width="5%">

           	<html:link forward="ActionEditJonasServer" styleClass="panel"
                paramId="select" paramName="item" paramProperty="objectName">
                  <bean:write name="item" property="name"/>
             </html:link>

            </sj:gridcol>

            <sj:gridcol>
            </sj:gridcol>
            <sj:gridcol>
              <bean:write name="item" property="state"/>
            </sj:gridcol>
          </sj:gridrow>
        </logic:iterate>
      </logic:notEqual>
      <sj:gridrow>
        <sj:gridcol>
          <html:submit property="btn_apply" styleClass="button"><bean:message key="button.apply"/></html:submit>
        </sj:gridcol>
     </sj:gridrow>

    </sj:jonasgrid>

</sj:panel>
</sj:tabs>
</html:form>
<%@ include file="../common/end.jsp" %>
</body>
</html:html>
