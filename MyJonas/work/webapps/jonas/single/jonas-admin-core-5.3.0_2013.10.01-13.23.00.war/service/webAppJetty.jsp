<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ApplyWebAppJetty">
  <html:hidden property="action"/>
  <html:hidden property="objectName"/>
  <html:hidden property="save"/>

<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionListWebContainers"><bean:message key="tab.webcontainers"/></sj:tab>
  <sj:tab forward="ActionEditWebApp" selected="true">
    <bean:write name="webAppJettyForm" property="labelPathContext"/>
  </sj:tab>
  <logic:present name="warForm">
    <sj:tab forward="ActionEditWar">
      <logic:present name="warForm"  property="filename">
        <bean:write name="warForm" property="filename"/>
      </logic:present>
      <logic:notPresent name="warForm"  property="filename">
        <bean:message key="tab.war"/>
      </logic:notPresent>
    </sj:tab>
    <bean:size id="listServletsSize" name="warForm" property="listServlets"/>
    <logic:notEqual name="listServletsSize" value="0">
      <sj:tab forward="War Servlets">
        <bean:message key="tab.war.servlets"/>
      </sj:tab>
    </logic:notEqual>
    <logic:notEqual name="warForm" property="xmlContent" value="">
      <sj:tab forward="War Web Xml"><bean:message key="tab.war.xmlContent"/></sj:tab>
    </logic:notEqual>
    <logic:notEqual name="warForm" property="jonasXmlContent" value="">
      <sj:tab forward="War Jonas Xml"><bean:message key="tab.war.jonasXmlContent"/></sj:tab>
    </logic:notEqual>
  </logic:present>
  <sj:panel>
    <logic:present name="warForm">
<!--
      <logic:notEqual name="webAppJettyForm" property="action" value="create">
        <sj:jonasgrid>
          <sj:jgRowTitle level="2">
            <sj:jgColTitle><bean:message key="title.webapp.action"/></sj:jgColTitle>
          </sj:jgRowTitle>
        </sj:jonasgrid>
        <sj:jonasgrid>
          <sj:gridrow changeStyle="true">
            <sj:gridcol>
              <sj:grid cellPadding="10">
                <sj:gridrow>
                  <sj:gridcol>
                    <sj:jonasbutton href="javascript:submitHidden('webAppJettyForm','action','start')">
                      <bean:message key="button.webapp.start"/>
                    </sj:jonasbutton>
                  </sj:gridcol>
                  <sj:gridcol>
                    <sj:jonasbutton href="javascript:submitHidden('webAppJettyForm','action','stop')">
                      <bean:message key="button.webapp.stop"/>
                    </sj:jonasbutton>
                  </sj:gridcol>
                </sj:gridrow>
              </sj:grid>
            </sj:gridcol>
          </sj:gridrow>
        </sj:jonasgrid>
        <sj:panelSeparator/>
      </logic:notEqual>
-->
    </logic:present>

    <logic:present name="<%=Globals.ERROR_KEY%>">
      <sj:jonasgrid>
        <sj:gridrow styleClass="errors">
          <sj:gridcol styleClass="errors"><html:errors/></sj:gridcol>
        </sj:gridrow>
      </sj:jonasgrid>
      <sj:panelSeparator/>
    </logic:present>

    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.webapp.context"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.webapp.context.path"/></sj:jgName>
        <sj:gridcol valign="top">
          <bean:write name="webAppJettyForm" property="pathContext"/>
        </sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.webapp.context.name"/></sj:jgName>
        <sj:gridcol valign="top"><bean:write name="webAppJettyForm" property="displayName"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.webapp.context.started"/></sj:jgName>
        <sj:gridcol valign="top"><bean:write name="webAppJettyForm" property="started"/></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>
</html:form>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

