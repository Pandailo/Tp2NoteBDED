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
  <sj:tab forwardControl="ActionEditJonasServer" selected="true"><bean:message key="tab.server.jonas"/></sj:tab>
  <sj:tab forward="ActionEditJmxServer"><bean:message key="tab.server.jmx"/></sj:tab>
  <%if("true".equals(cmi) || "true".equals(master)){%>
  <sj:tab forward="ActionDisplayCmi"><bean:message key="tab.server.services.cmi"/></sj:tab>
  <%}%>
  <sj:tab forward="ActionListRegistry"><bean:message key="tab.server.registry"/></sj:tab>
  <logic:equal name="jonasServerForm" property="presentServletContainer" value="true">
    <sj:tab forward="ActionEditServletServer"><bean:message key="tab.server.servlet"/></sj:tab>
  </logic:equal>
  <sj:tab forward="ActionEditJvm"><bean:message key="tab.server.jvm"/></sj:tab>
  <sj:panel>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.server.jonas.jonasName"/></sj:jgName>
        <sj:jgValue><bean:write name="jonasServerForm" property="jonasName"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.server.jonas.jonasVersion"/></sj:jgName>
        <sj:jgValue><bean:write name="jonasServerForm" property="jonasVersion"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.server.jonas.protocols"/></sj:jgName>
        <sj:jgValue><bean:write name="jonasServerForm" property="protocols"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.server.jonas.state"/></sj:jgName>
        <sj:jgValue><bean:write name="jonasServerForm" property="state"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.server.jonas.versions"/></sj:jgName>
        <sj:jgValue>
          <html:link forward="Versions" styleClass="panel">
          versions
          </html:link>
        </sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>
    <sj:panelSeparator/>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="action.title.server.jonas"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><sj:jonasbutton forward="ActionJonasServerRunGC"><bean:message key="action.button.server.jonas.rungc"/></sj:jonasbutton></sj:jgName>
        <sj:jgValue><bean:message key="action.comment.server.jonas.rungc"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
      <!--  Stop server authorized  -->
      <logic:equal name="WhereAreYou" property="currentJonasServerName" value="false">
        <sj:jgName>
          <sj:jonasbutton forward="ActionJonasServerStop"><bean:message key="action.button.server.jonas.stop"/></sj:jonasbutton>
        </sj:jgName>
        <sj:jgValue><bean:message key="action.comment.server.jonas.stop"/></sj:jgValue>
      </logic:equal>
      <!--  Stop server forbidden  -->
      <logic:equal name="WhereAreYou" property="currentJonasServerName" value="true">
        <sj:jgName>
          <sj:jonasbutton forward="ActionJonasServerStop" disabled="true"><bean:message key="action.button.server.jonas.stop"/></sj:jonasbutton>
        </sj:jgName>
        <sj:jgValue><bean:message key="action.comment.server.jonas.stop"/></sj:jgValue>
      </logic:equal>
      </sj:gridrow>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

