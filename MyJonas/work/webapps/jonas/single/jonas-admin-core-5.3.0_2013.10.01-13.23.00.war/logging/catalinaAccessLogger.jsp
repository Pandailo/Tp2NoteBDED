<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ApplyCatalinaAccessLogger">
  <html:hidden property="action"/>
  <html:hidden property="objectName"/>
  <html:hidden property="save"/>
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionListLoggers"><bean:message key="tab.loggers"/></sj:tab>
  <logic:equal name="catalinaAccessLoggerForm" property="action" value="create">
    <sj:tab forward="ActionEditCatalinaAccessLogger" selected="true"><bean:message key="button.loggers.catalina.access.create"/></sj:tab>
  </logic:equal>
  <logic:notEqual name="catalinaAccessLoggerForm" property="action" value="create">
    <sj:tab forward="ActionEditCatalinaAccessLogger" selected="true"><bean:message key="tab.logger.catalina.access"/></sj:tab>
  </logic:notEqual>
  <sj:panel>
    <logic:present name="<%=Globals.ERROR_KEY%>">
      <sj:jonasgrid>
        <sj:gridrow styleClass="errors">
          <sj:gridcol styleClass="errors"><html:errors/></sj:gridcol>
        </sj:gridrow>
      </sj:jonasgrid>
      <sj:panelSeparator/>
    </logic:present>
    <logic:equal name="catalinaAccessLoggerForm" property="action" value="create">
    <sj:jonasgrid globalRowStyleClass="panel">
      <sj:gridrow>
        <sj:jgName><bean:message key="label.logger.catalina.access.containerType"/></sj:jgName>
        <sj:jgValue>
          <html:select property="containerType">
            <html:options property="containerTypes"/>
          </html:select>
        </sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.logger.catalina.access.containerName"/></sj:jgName>
        <sj:jgValue>
          <html:select property="containerName">
            <html:options property="containerNames"/>
          </html:select>
        </sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>
    </logic:equal>
    <sj:jonasgrid>
      <logic:notEqual name="catalinaAccessLoggerForm" property="action" value="create">
        <sj:gridrow>
          <sj:jgName><bean:message key="label.logger.catalina.access.containerName"/></sj:jgName>
          <sj:gridcol valign="top">
            <bean:write name="catalinaAccessLoggerForm" property="containerName"/>
          </sj:gridcol>
          <sj:gridcol><bean:message key="comment.logger.catalina.access.containerName"/></sj:gridcol>
        </sj:gridrow>
        <sj:gridrow>
          <sj:jgName><bean:message key="label.logger.catalina.access.containerType"/></sj:jgName>
          <sj:gridcol valign="top">
            <bean:write name="catalinaAccessLoggerForm" property="containerType"/>
          </sj:gridcol>
          <sj:gridcol><bean:message key="comment.logger.catalina.access.containerType"/></sj:gridcol>
        </sj:gridrow>
      </logic:notEqual>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.logger.catalina.access.directory"/></sj:jgName>
        <sj:gridcol valign="top">
          <!--
          <bean:write name="catalinaAccessLoggerForm" property="directory"/>
          -->
          <html:text property="directory" size="20"/>
        </sj:gridcol>
        <sj:gridcol><bean:message key="comment.logger.catalina.access.directory"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.logger.catalina.access.prefix"/></sj:jgName>
        <sj:gridcol valign="top">
          <html:text property="prefix" size="20"/>
        </sj:gridcol>
        <sj:gridcol><bean:message key="label.logger.catalina.access.prefix"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.logger.catalina.access.suffix"/></sj:jgName>
        <sj:gridcol valign="top">
          <html:text property="suffix" size="20"/>
        </sj:gridcol>
        <sj:gridcol><bean:message key="comment.logger.catalina.access.suffix"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.logger.catalina.access.resolveHosts"/></sj:jgName>
        <sj:gridcol valign="top">
          <html:select property="resolveHosts">
            <bean:define id="colBooleanValues" name="catalinaAccessLoggerForm" property="booleanValues"/>
            <html:options collection="colBooleanValues" property="value" labelProperty="label"/>
          </html:select>
        </sj:gridcol>
        <sj:gridcol><bean:message key="comment.logger.catalina.access.resolveHosts"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.logger.catalina.access.rotatable"/></sj:jgName>
        <sj:gridcol valign="top">
          <html:select property="rotatable">
            <bean:define id="colBooleanValues" name="catalinaAccessLoggerForm" property="booleanValues"/>
            <html:options collection="colBooleanValues" property="value" labelProperty="label"/>
          </html:select>
        </sj:gridcol>
        <sj:gridcol><bean:message key="comment.logger.catalina.access.rotatable"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.logger.catalina.access.pattern"/></sj:jgName>
        <sj:gridcol valign="top">
          <html:text property="pattern" size="30"/>
        </sj:gridcol>
        <sj:gridcol><bean:message key="comment.logger.catalina.access.pattern"/></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>

    <sj:panelSeparator/>

    <sj:jonasgrid globalRowStyleClass="panel">
      <sj:gridrow>
        <sj:jgName></sj:jgName>
        <logic:notEqual name="catalinaAccessLoggerForm" property="containerType" value="Web module">
        <sj:gridcol>
          <html:submit property="btn_apply" styleClass="button"><bean:message key="button.apply"/></html:submit>
          &nbsp;&nbsp;
          <html:reset styleClass="button"><bean:message key="button.reset"/></html:reset>
          &nbsp;&nbsp;
          <html:button styleClass="button" property="btnSave"
            onclick="submitHidden('catalinaAccessLoggerForm','save','true')">
            <bean:message key="button.save"/>
          </html:button>
        </sj:gridcol>
        </logic:notEqual>
        <!-- If the modified logger is associated to a conext (label.loggers.container.context in ApplicationResources files)
        don't know how to save -->
        <logic:equal name="catalinaAccessLoggerForm" property="containerType" value="Web module">
        <sj:gridcol>
          <html:submit property="btn_apply" styleClass="button"><bean:message key="button.apply"/></html:submit>
          &nbsp;&nbsp;
          <html:reset styleClass="button"><bean:message key="button.reset"/></html:reset>
          &nbsp;&nbsp;
        </sj:gridcol>
        </logic:equal>
      </sj:gridrow>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>
</html:form>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>