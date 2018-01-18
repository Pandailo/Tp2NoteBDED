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
  <sj:tab forward="ActionListRegistry"><bean:message key="tab.server.registry"/></sj:tab>
  <logic:equal name="jonasServerForm" property="presentServletContainer" value="true">
    <sj:tab forward="ActionEditServletServer"><bean:message key="tab.server.servlet"/></sj:tab>
  </logic:equal>
  <sj:tab forward="ActionEditJvm"><bean:message key="tab.server.jvm"/></sj:tab>
  <sj:tab forward="Versions" selected="true"><bean:message key="tab.server.versions"/></sj:tab>
  <sj:panel>

    <sj:jonasgrid>
      <sj:gridrow>
        <sj:gridcol>
          <pre>
            <bean:write name="jonasServerForm" property="versions"/>
          </pre>
        </sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>

  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

