<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ApplyWebAppCatalina">
  <html:hidden property="action"/>
  <html:hidden property="objectName"/>
  <html:hidden property="save"/>

<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionListWebContainers"><bean:message key="tab.webcontainers"/></sj:tab>
  <sj:tab forward="ActionEditWebApp" selected="true">
    <logic:notEqual name="webAppCatalinaForm" property="action" value="create">
      <bean:write name="webAppCatalinaForm" property="labelPathContext"/>
    </logic:notEqual>
    <logic:equal name="webAppCatalinaForm" property="action" value="create">
      <bean:message key="tab.webapp.create"/>
    </logic:equal>
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
      <logic:notEqual name="webAppCatalinaForm" property="action" value="create">
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
                    <sj:jonasbutton href="javascript:submitHidden('webAppCatalinaForm','action','reload')"
                       disabledName="webAppCatalinaForm" disabledProperty="state" disabledValueEqual="0">
                      <bean:message key="button.webapp.reload"/>
                    </sj:jonasbutton>
                  </sj:gridcol>
                  <sj:gridcol>
                    <sj:jonasbutton href="javascript:submitHidden('webAppCatalinaForm','action','start')"
                         disabledName="webAppCatalinaForm" disabledProperty="state" disabledValueEqual="1">
                      <bean:message key="button.webapp.start"/>
                    </sj:jonasbutton>
                  </sj:gridcol>
                  <sj:gridcol>
                    <sj:jonasbutton href="javascript:submitHidden('webAppCatalinaForm','action','stop')"
                         disabledName="webAppCatalinaForm" disabledProperty="state" disabledValueEqual="0">
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
          <logic:notEqual name="webAppCatalinaForm" property="action" value="create">
            <bean:write name="webAppCatalinaForm" property="pathContext"/>
          </logic:notEqual>
          <logic:equal name="webAppCatalinaForm" property="action" value="create">
            <html:text property="pathContext" size="20"/>
          </logic:equal>
        </sj:gridcol>
      </sj:gridrow>
      <logic:notEqual name="webAppCatalinaForm" property="action" value="create">
        <sj:gridrow>
          <sj:jgName><bean:message key="label.webapp.context.host"/></sj:jgName>
          <sj:gridcol valign="top"><bean:write name="webAppCatalinaForm" property="host"/></sj:gridcol>
        </sj:gridrow>
      </logic:notEqual>
    </sj:jonasgrid>
    <sj:panelSeparator/>

      <sj:jonasgrid>
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="title.webapp.setting"/></sj:jgColTitle>
        </sj:jgRowTitle>
      </sj:jonasgrid>
      <sj:jonasgrid>
        <sj:gridrow>
          <sj:jgName><bean:message key="label.webapp.setting.cookies"/></sj:jgName>
          <sj:gridcol valign="top">
            <html:select property="cookies">
              <bean:define id="colBooleanValues" name="webAppCatalinaForm" property="booleanValues"/>
              <html:options collection="colBooleanValues" property="value" labelProperty="label"/>
            </html:select>
            </sj:gridcol>
          <sj:gridcol><bean:message key="comment.webapp.setting.cookies"/></sj:gridcol>
        </sj:gridrow>
        <sj:gridrow>
          <sj:jgName><bean:message key="label.webapp.setting.reloadable"/></sj:jgName>
          <sj:gridcol valign="top">
            <html:select property="reloadable">
              <bean:define id="colBooleanValues" name="webAppCatalinaForm" property="booleanValues"/>
              <html:options collection="colBooleanValues" property="value" labelProperty="label"/>
            </html:select>
          </sj:gridcol>
          <sj:gridcol><bean:message key="comment.webapp.setting.reloadable"/></sj:gridcol>
        </sj:gridrow>
        <sj:gridrow>
          <sj:jgName><bean:message key="label.webapp.setting.swallowOutput"/></sj:jgName>
          <sj:gridcol valign="top">
            <html:select property="swallowOutput">
              <bean:define id="colBooleanValues" name="webAppCatalinaForm" property="booleanValues"/>
              <html:options collection="colBooleanValues" property="value" labelProperty="label"/>
            </html:select>
          </sj:gridcol>
          <sj:gridcol><bean:message key="comment.webapp.setting.swallowOutput"/></sj:gridcol>
        </sj:gridrow>
        <logic:present name="webAppCatalinaForm" property="existSessionTimeout">
          <logic:equal name="webAppCatalinaForm" property="existSessionTimeout" value="true">
            <sj:gridrow>
              <sj:jgName><bean:message key="label.webapp.setting.sessionTimeout"/></sj:jgName>
              <sj:gridcol valign="top">
                <html:text property="sessionTimeout" size="6"/>
              </sj:gridcol>
              <sj:gridcol><bean:message key="comment.webapp.setting.sessionTimeout"/></sj:gridcol>
            </sj:gridrow>
          </logic:equal>
        </logic:present>
      </sj:jonasgrid>
      <sj:panelSeparator/>
      <sj:jonasgrid globalRowStyleClass="panel">
        <sj:gridrow>
          <sj:jgName></sj:jgName>
          <sj:gridcol>
            <html:submit property="btn_apply" styleClass="button"><bean:message key="button.apply"/></html:submit>
            &nbsp;&nbsp;
            <html:reset styleClass="button"><bean:message key="button.reset"/></html:reset>
            &nbsp;&nbsp;
            <html:button styleClass="button" property="btnSave"
              onclick="submitHidden('webAppCatalinaForm','save','true')">
              <bean:message key="button.save"/>
            </html:button>
          </sj:gridcol>
        </sj:gridrow>
      </sj:jonasgrid>

  </sj:panel>
</sj:tabs>
</html:form>
<%@ include file="../common/end.jsp" %>
</body>
</html:html>

