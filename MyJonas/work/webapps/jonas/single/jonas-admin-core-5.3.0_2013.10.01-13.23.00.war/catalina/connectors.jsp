<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ApplyCatalinaConnectors">
<html:hidden property="action"/>
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionListCatalinaConnectors" selected="true"><bean:message key="tab.catalina.connectors"/></sj:tab>
  <sj:panel>
    <sj:jonasgrid>
      <sj:jgRowTitle level="2">
        <sj:jgColTitle><bean:message key="title.catalina.connectors.action"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow changeStyle="true">
        <sj:gridcol>
          <sj:grid cellPadding="10">
            <sj:gridrow>
              <sj:gridcol>
                <bean:define id="typeHttp" value="http"/>
                <sj:jonasbutton forward="ActionCreateCatalinaConnector" paramId="type" paramName="typeHttp">
                  <bean:message key="button.catalina.connectors.create.http"/>
                </sj:jonasbutton>
              </sj:gridcol>
              <sj:gridcol>
                <bean:define id="typeHttps" value="https"/>
                <sj:jonasbutton forward="ActionCreateCatalinaConnector" paramId="type" paramName="typeHttps">
                  <bean:message key="button.catalina.connectors.create.https"/>
                </sj:jonasbutton>
              </sj:gridcol>
              <sj:gridcol>
                <bean:define id="typeAjp" value="ajp"/>
                <sj:jonasbutton forward="ActionCreateCatalinaConnector" paramId="type" paramName="typeAjp">
                  <bean:message key="button.catalina.connectors.create.ajp"/>
                </sj:jonasbutton>
              </sj:gridcol>
              <sj:gridcol>
                <bean:define id="forwardAfterSave" value="ActionListCatalinaConnectors"/>
                <sj:jonasbutton forward="ActionEditServletServer" paramId="forward" paramName="forwardAfterSave">
                  <bean:message key="button.save"/>
                </sj:jonasbutton>
              </sj:gridcol>
              <sj:gridcol>
                <sj:jonasbutton href="javascript:submitHidden('itemsConnectorsForm','action','remove')"><bean:message key="button.catalina.connectors.remove"/></sj:jonasbutton>
              </sj:gridcol>
            </sj:gridrow>
          </sj:grid>
        </sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>

    <sj:panelSeparator/>

    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle>&nbsp;</sj:jgColTitle>
        <sj:jgColTitle><bean:message key="label.catalina.connectors.port"/></sj:jgColTitle>
        <sj:jgColTitle><bean:message key="label.catalina.connectors.address"/></sj:jgColTitle>
        <sj:jgColTitle><bean:message key="label.catalina.connectors.type"/></sj:jgColTitle>
      </sj:jgRowTitle>
      <logic:iterate id="item" name="listConnectors">
        <sj:gridrow>
          <logic:equal name="item" property="applicationServerPort" value="true">
            <sj:gridcol width="5%">&nbsp;</sj:gridcol>
          </logic:equal>
          <logic:notEqual name="item" property="applicationServerPort" value="true">
            <sj:gridcol width="5%">
              <html:multibox property="selectedItems">
                <bean:write name="item" property="objectName"/>
              </html:multibox>
            </sj:gridcol>
          </logic:notEqual>
          <sj:gridcol width="10%">
            <html:link forward="ActionEditCatalinaConnector" styleClass="panel"
              paramId="select" paramName="item" paramProperty="objectName">
              <bean:write name="item" property="port"/>
            </html:link>
          </sj:gridcol>
          <sj:gridcol width="20%"><bean:write name="item" property="address"/></sj:gridcol>
          <sj:gridcol><bean:write name="item" property="connectorType"/></sj:gridcol>
        </sj:gridrow>
      </logic:iterate>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>
</html:form>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

