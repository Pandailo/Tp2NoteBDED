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
  <sj:tab forward="ActionEditServletServer" selected="true"><bean:message key="tab.server.servlet"/></sj:tab>
  <sj:tab forward="ActionEditJvm"><bean:message key="tab.server.jvm"/></sj:tab>
  <sj:panel>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.server.servlet.name"/></sj:jgName>
        <sj:jgValue><bean:write name="servletServerForm" property="serverName"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.server.servlet.version"/></sj:jgName>
        <sj:jgValue><bean:write name="servletServerForm" property="serverVersion"/></sj:jgValue>
      </sj:gridrow>
      <logic:equal name="servletServerForm" property="serverCatalina" value="true">
        <sj:gridrow>
          <sj:jgName><bean:message key="label.server.servlet.catalina.service"/></sj:jgName>
          <sj:jgValue><bean:write name="servletServerForm" property="serverCatalinaService"/></sj:jgValue>
        </sj:gridrow>
        <sj:gridrow>
          <sj:jgName><bean:message key="label.server.servlet.catalina.engine"/></sj:jgName>
          <sj:jgValue><bean:write name="servletServerForm" property="serverCatalinaEngine"/></sj:jgValue>
        </sj:gridrow>
        <sj:gridrow>
          <sj:jgName><bean:message key="label.server.servlet.catalina.default.host"/></sj:jgName>
          <sj:jgValue><bean:write name="servletServerForm" property="serverCatalinaDefaultHost"/></sj:jgValue>
        </sj:gridrow>
      </logic:equal>
    </sj:jonasgrid>

    <logic:equal name="servletServerForm" property="serverCatalina" value="true">
      <sj:panelSeparator/>

      <sj:jonasgrid>
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="title.server.servlet.catalina.action"/></sj:jgColTitle>
        </sj:jgRowTitle>
        <sj:jgRowTitle level="2">
          <sj:jgColTitle align="center"><bean:message key="title.server.servlet.catalina.action.save.warning"/></sj:jgColTitle>
        </sj:jgRowTitle>
        <sj:gridrow styleClass="panel">
          <sj:gridcol><bean:message key="message.server.servlet.catalina.action.save.explanation"/></sj:gridcol>
        </sj:gridrow>
        <sj:gridrow styleClass="panel">
          <sj:gridcol><bean:message key="message.server.servlet.catalina.action.save.explanation.list"/></sj:gridcol>
        </sj:gridrow>
        <sj:gridrow styleClass="panel">
          <sj:gridcol><bean:message key="message.server.servlet.catalina.action.save.verify"/></sj:gridcol>
        </sj:gridrow>
        <logic:present name="servletServerForm" property="forwardAfter">
          <sj:gridrow styleClass="panel">
            <sj:gridcol><bean:message key="message.server.servlet.catalina.action.save.cancel"/></sj:gridcol>
          </sj:gridrow>
        </logic:present>
        <sj:gridrow changeStyle="true">
          <sj:gridcol align="center">
            <sj:grid cellPadding="10">
              <sj:gridrow>
                <logic:present name="servletServerForm" property="forwardAfter">
                  <sj:gridcol>
                    <sj:jonasbutton forward="ActionSaveCatalina" paramId="forward" paramName="servletServerForm" paramProperty="forwardAfter">
                      <bean:message key="button.save.all"/>
                    </sj:jonasbutton>
                  </sj:gridcol>
                  <sj:gridcol>
                    <bean:define id="returnAction" name="servletServerForm" property="forwardAfter" type="java.lang.String"/>
                    <sj:jonasbutton forward="<%=returnAction%>">
                      <bean:message key="button.cancel"/>
                    </sj:jonasbutton>
                  </sj:gridcol>
                </logic:present>
                <logic:notPresent name="servletServerForm" property="forwardAfter">
                  <sj:gridcol>
                    <sj:jonasbutton forward="ActionSaveCatalina">
                      <bean:message key="button.save.all"/>
                    </sj:jonasbutton>
                  </sj:gridcol>
                </logic:notPresent>
              </sj:gridrow>
            </sj:grid>
          </sj:gridcol>
        </sj:gridrow>
      </sj:jonasgrid>
    </logic:equal>

  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

