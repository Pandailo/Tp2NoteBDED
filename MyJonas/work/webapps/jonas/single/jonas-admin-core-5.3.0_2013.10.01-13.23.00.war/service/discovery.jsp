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
  <sj:tab selected="true"><bean:message key="tab.service.discovery"/></sj:tab>
  <sj:panel>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.service.discovery.multicastaddress"/></sj:jgName>
        <sj:jgValue><bean:write name="discoveryServiceForm" property="multicastAddress"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.service.discovery.multicastport"/></sj:jgName>
        <sj:jgValue><bean:write name="discoveryServiceForm" property="multicastPort"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.service.discovery.multicastttl"/></sj:jgName>
        <sj:jgValue><bean:write name="discoveryServiceForm" property="multicastTtl"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.service.discovery.ismaster"/></sj:jgName>
        <sj:jgValue><bean:write name="discoveryServiceForm" property="master"/></sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>
    <sj:panelSeparator/>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="action.title.discovery"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
      	<!--  Start master authorized  -->
      	<logic:equal name="discoveryServiceForm" property="master" value="false">
        <sj:jgName>
          <sj:jonasbutton forward="ActionDiscoveryServiceStartMaster">
            <bean:message key="action.button.service.discovery.start"/>
          </sj:jonasbutton>
        </sj:jgName>
        <sj:jgValue><bean:message key="action.comment.service.discovery.start"/></sj:jgValue>
        </logic:equal>
        <!--  Start master forbidden  -->
      	<logic:equal name="discoveryServiceForm" property="master" value="true">
        <sj:jgName>
          <sj:jonasbutton forward="ActionDiscoveryServiceStartMaster" disabled="true">
            <bean:message key="action.button.service.discovery.start"/>
          </sj:jonasbutton>
        </sj:jgName>
        <sj:jgValue><bean:message key="action.comment.service.discovery.start"/></sj:jgValue>
        </logic:equal>
      </sj:gridrow>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>