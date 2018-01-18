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
  <sj:tab forward="ActionEditJonasServer"><bean:message key="tab.server.jonas"/></sj:tab>
  <sj:tab forward="ActionEditJmxServer"><bean:message key="tab.server.jmx"/></sj:tab>
  <%if("true".equals(cmi) || "true".equals(master)){%>
  <sj:tab forward="ActionDisplayCmi"><bean:message key="tab.server.services.cmi"/></sj:tab>
  <%}%>
  <sj:tab forward="ActionListRegistry"><bean:message key="tab.server.registry"/></sj:tab>
  <sj:tab forward="ActionEditRegistry" selected="true"><bean:write name="jndiResourceForm" property="registryProtocol"/></sj:tab>
  <logic:equal name="jndiResourceForm" property="presentServletContainer" value="true">
    <sj:tab forward="ActionEditServletServer"><bean:message key="tab.server.servlet"/></sj:tab>
  </logic:equal>
  <sj:tab forward="ActionEditJvm"><bean:message key="tab.server.jvm"/></sj:tab>
  <sj:panel>
    <bean:size id="listSize" name="jndiResourceForm" property="listNames"/>
    <bean:size id="cmiSize" name="jndiResourceForm" property="vector"/>
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
                    <sj:gridcol width="20%">&nbsp;</sj:gridcol>
                    <sj:gridcol width="20%"><bean:write name="item" property="name"/></sj:gridcol>
                    <logic:equal name="item" property="isLocal" value="true">
                        <sj:gridcol width="20%">&nbsp;</sj:gridcol>
                    </logic:equal>
                    <logic:notEqual name="item" property="isLocal" value="true">
                        <sj:gridcol width="40%"><bean:message key="title.global"/></sj:gridcol>
                    </logic:notEqual>
              </sj:gridrow>
            </logic:iterate>
            </sj:jonasgrid>
          </logic:notEqual>
      </logic:equal>

    <!-- other protocol -->
    <logic:notEqual name="jndiResourceForm" property="registryProtocol" value="cmi">
      <sj:jonasgrid>
        <sj:jgRowTitle>
          <sj:jgColTitle>
            <bean:message key="title.server.registry.jndi.names"/>
            (<bean:write name="listSize"/>)
          </sj:jgColTitle>
        </sj:jgRowTitle>
      </sj:jonasgrid>
      <sj:jonasgrid>
        <logic:equal name="listSize" value="0">
          <sj:gridrow>
            <sj:gridcol><bean:message key="message.server.registry.none"/></sj:gridcol>
          </sj:gridrow>
        </logic:equal>
        <logic:notEqual name="listSize" value="0">
          <logic:iterate id="item" name="jndiResourceForm" property="listNames" indexId="index">
            <sj:gridrow>
              <sj:jgName><bean:write name="index"/></sj:jgName>
              <sj:jgValue><bean:write name="item"/></sj:jgValue>
            </sj:gridrow>
          </logic:iterate>
        </logic:notEqual>
      </sj:jonasgrid>
    </logic:notEqual>

  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

