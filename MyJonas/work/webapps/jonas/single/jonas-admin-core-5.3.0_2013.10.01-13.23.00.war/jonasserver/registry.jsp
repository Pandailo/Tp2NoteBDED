<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>
<% String cmi = (String)request.getAttribute("cmi");
   String master = (String)request.getAttribute("master");
%>

<body class="content">
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forwardControl="ActionEditJonasServer"><bean:message key="tab.server.jonas"/></sj:tab>
  <sj:tab forward="ActionEditJmxServer"><bean:message key="tab.server.jmx"/></sj:tab>
  <%if("true".equals(cmi) || "true".equals(master)){%>
  <sj:tab forward="ActionDisplayCmi"><bean:message key="tab.server.services.cmi"/></sj:tab>
  <%}%>
  <sj:tab forward="ActionListRegistry" selected="true"><bean:message key="tab.server.registry"/></sj:tab>
  <logic:equal name="jndiResourcesForm" property="presentServletContainer" value="true">
    <sj:tab forward="ActionEditServletServer"><bean:message key="tab.server.servlet"/></sj:tab>
  </logic:equal>
  <sj:tab forward="ActionEditJvm"><bean:message key="tab.server.jvm"/></sj:tab>
  <sj:panel>

    <bean:size id="providersSize" name="jndiResourcesForm" property="providers"/>

    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.server.registry.protocol"/></sj:jgColTitle>
        <sj:jgColTitle><bean:message key="title.server.registry.providerUrl"/></sj:jgColTitle>
      </sj:jgRowTitle>
      <logic:iterate id="item" name="jndiResourcesForm" property="providers">
      <sj:gridrow valign="top">
        <sj:gridcol><bean:write name="item" property="protocol"/></sj:gridcol>
        <logic:equal name="providersSize" value="1">
          <sj:gridcol><bean:write name="item" property="providerUrl"/></sj:gridcol>
        </logic:equal>
        <logic:notEqual name="providersSize" value="1">

        <sj:gridcol>
          <html:link forward="ActionEditRegistry" styleClass="panel"
                paramId="select" paramName="item" paramProperty="resourceON">
            <bean:write name="item" property="providerUrl"/>
          </html:link>
        </sj:gridcol>

        </logic:notEqual>
      </sj:gridrow>
      </logic:iterate>
    </sj:jonasgrid>

    <sj:panelSeparator/>
    <logic:equal name="providersSize" value="1">
      <!-- one protocol -->
      <bean:size id="namesSize" name="jndiResourcesForm" property="listNames"/>
      <bean:size id="cmiSize" name="jndiResourcesForm" property="vector"/>

     <!-- cmi -->
       <logic:equal name="jndiResourcesForm" property="registryProtocol" value="cmi">
        <sj:jonasgrid>
          <sj:jgRowTitle>
            <sj:jgColTitle>
              <bean:message key="title.server.registry.jndi.names"/>
              (<bean:write name="cmiSize"/>)
            </sj:jgColTitle>
          </sj:jgRowTitle>
        </sj:jonasgrid>
          <logic:equal name="cmiSize" value="0">
            <sj:jonasgrid>
                 <sj:gridrow>
                    <sj:gridcol><bean:message key="message.server.registry.cmi.none"/></sj:gridcol>
                </sj:gridrow>
            </sj:jonasgrid>
          </logic:equal>
          <logic:notEqual name="cmiSize" value="0">
          <sj:jonasgrid>
          <sj:jgRowTitle>
            <sj:jgColTitle>&nbsp;</sj:jgColTitle>
                <sj:jgColTitle><bean:message key="label.domain.name"/></sj:jgColTitle>
                <sj:jgColTitle><bean:message key="label.domain.range"/></sj:jgColTitle>
            </sj:jgRowTitle>
          </sj:jonasgrid>
          <sj:jonasgrid>
            <logic:iterate id="item" name="jndiResourcesForm" property="vector" indexId="index">
              <sj:gridrow>
                    <sj:gridcol width="8%">&nbsp;</sj:gridcol>
                    <sj:gridcol width="42%"><bean:write name="item" property="name"/></sj:gridcol>
                    <logic:equal name="item" property="isLocal" value="true">
                        <sj:gridcol>&nbsp;</sj:gridcol>
                    </logic:equal>
                    <logic:notEqual name="item" property="isLocal" value="true">
                        <sj:gridcol width="60%"><bean:message key="title.global"/></sj:gridcol>
                    </logic:notEqual>
              </sj:gridrow>
            </logic:iterate>
            </sj:jonasgrid>
          </logic:notEqual>
      </logic:equal>

      <!-- other protocol -->
      <logic:notEqual name="jndiResourcesForm" property="registryProtocol" value="cmi">
        <sj:jonasgrid>
          <sj:jgRowTitle>
            <sj:jgColTitle>
              <bean:message key="title.server.registry.jndi.names"/>
              (<bean:write name="namesSize"/>)
            </sj:jgColTitle>
          </sj:jgRowTitle>
        </sj:jonasgrid>
        <sj:jonasgrid>
          <logic:equal name="namesSize" value="0">
            <sj:gridrow>
              <sj:gridcol><bean:message key="message.server.registry.none"/></sj:gridcol>
            </sj:gridrow>
          </logic:equal>
          <logic:notEqual name="namesSize" value="0">
            <logic:iterate id="item" name="jndiResourcesForm" property="listNames" indexId="index">
              <sj:gridrow>
                <sj:jgName><bean:write name="index"/></sj:jgName>
                <sj:jgValue><bean:write name="item"/></sj:jgValue>
              </sj:gridrow>
            </logic:iterate>
          </logic:notEqual>
        </sj:jonasgrid>
      </logic:notEqual>
    </logic:equal>
  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

