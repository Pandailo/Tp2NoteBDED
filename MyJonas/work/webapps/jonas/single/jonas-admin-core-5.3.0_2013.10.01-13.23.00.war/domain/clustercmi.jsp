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
  <logic:equal name="domainForm" property="cluster" value="false">
    <sj:tab forward="ActionEditDomain" selected="true"><bean:message key="tab.domain"/></sj:tab>
  </logic:equal>
  <logic:equal name="domainForm" property="cluster" value="true">
    <sj:tab forward="ActionEditDomain"><bean:message key="tab.domain"/></sj:tab>
    <sj:tab forward="ActionEditDomain" selected="true"><bean:write  name="domainForm" property="name"/></sj:tab>
  </logic:equal>
  <sj:panel>
    <!-- cluster properties -->
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle>
          <bean:write name="domainForm" property="type"/>
          <bean:message key="label.domain.properties"/>
        </sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>

    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.domain.name"/></sj:jgName>
        <sj:jgValue><bean:write name="domainForm" property="name"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.cluster.type"/></sj:jgName>
        <sj:jgValue><bean:write name="domainForm" property="clusterType"/></sj:jgValue>
      </sj:gridrow>
      <logic:present name="domainForm" property="description">
        <sj:jgName><bean:message key="label.domain.description"/></sj:jgName>
        <sj:jgValue><bean:write name="domainForm" property="description"/></sj:jgValue>
      </logic:present>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.domain.domainName"/></sj:jgName>
        <sj:jgValue><bean:write name="domainForm" property="domainName"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.domain.master"/></sj:jgName>
        <sj:jgValue>
          <html:link forward="ActionEditJonasServer" styleClass="panel"
            paramId="select" paramName="domainForm" paramProperty="masterON">
            <bean:write name="domainForm" property="masterName"/>
          </html:link>
        </sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>

    <sj:panelSeparator/>

    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle>
          <bean:message key="label.domain.servers"/>
        </sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>

    <bean:size id="listSize" name="listServers"/>

    <sj:panelSeparator/>

    <!-- servers list -->
    <sj:jonasgrid>
      <logic:notEqual name="listSize" value="0">
        <logic:iterate id="item" name="listServers">
          <sj:gridrow>
            <sj:gridcol>
              <logic:equal name="item" property="state" value="RUNNING">
                <html:link forward="ActionEditJonasServer" styleClass="panel"
                  paramId="select" paramName="item" paramProperty="objectName">
                  <bean:write name="item" property="name"/>
                </html:link>
              </logic:equal>
              <logic:notEqual name="item" property="state" value="RUNNING">
                <bean:write name="item" property="name"/>
              </logic:notEqual>
            </sj:gridcol>
            <sj:gridcol>
              <bean:write name="item" property="state"/>
            </sj:gridcol>
            <sj:gridcol>
              <logic:empty name="item" property="clusterDaemonName">
                no cluster daemon
              </logic:empty>
              <logic:notEmpty name="item" property="clusterDaemonName">
                <bean:write name="item" property="clusterDaemonName"/>
              </logic:notEmpty>
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
