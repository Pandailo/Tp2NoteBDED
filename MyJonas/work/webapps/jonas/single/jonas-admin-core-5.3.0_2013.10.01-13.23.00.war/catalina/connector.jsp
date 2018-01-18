<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ApplyCatalinaConnector">
  <html:hidden property="action"/>
  <html:hidden property="objectName"/>
  <html:hidden property="connectorType"/>
  <html:hidden property="save"/>

<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionListCatalinaConnectors"><bean:message key="tab.catalina.connectors"/></sj:tab>
  <logic:notEqual name="catalinaConnectorForm" property="action" value="create">
    <sj:tab forward="ActionEditCatalinaConnector" selected="true">
      <bean:message key="tab.catalina.connector"/>
      <bean:write name="catalinaConnectorForm" property="label"/>
    </sj:tab>
  </logic:notEqual>
  <logic:equal name="catalinaConnectorForm" property="action" value="create">
    <logic:equal name="catalinaConnectorForm" property="connectorType" value="HTTP">
      <sj:tab forward="ActionEditCatalinaConnector" selected="true">
        <bean:message key="tab.catalina.connector.new.http"/>
      </sj:tab>
    </logic:equal>
    <logic:equal name="catalinaConnectorForm" property="connectorType" value="HTTPS">
      <sj:tab forward="ActionEditCatalinaConnector" selected="true">
        <bean:message key="tab.catalina.connector.new.https"/>
      </sj:tab>
    </logic:equal>
    <logic:equal name="catalinaConnectorForm" property="connectorType" value="AJP">
      <sj:tab forward="ActionEditCatalinaConnector" selected="true">
        <bean:message key="tab.catalina.connector.new.ajp"/>
      </sj:tab>
    </logic:equal>
  </logic:equal>
  <sj:panel>
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
        <sj:jgColTitle><bean:message key="title.catalina.connector.general"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.catalina.connector.type"/></sj:jgName>
        <sj:jgValue>
          <logic:equal name="catalinaConnectorForm" property="connectorType" value="HTTP">
            <bean:message key="label.catalina.connector.type.http"/>
          </logic:equal>
          <logic:equal name="catalinaConnectorForm" property="connectorType" value="HTTPS">
            <bean:message key="label.catalina.connector.type.https"/>
          </logic:equal>
          <logic:equal name="catalinaConnectorForm" property="connectorType" value="AJP">
            <bean:message key="label.catalina.connector.type.ajp"/>
          </logic:equal>
        </sj:jgValue>
      </sj:gridrow>
      <%-- do not show scheme while creating a new connector --%>
      <logic:notEqual name="catalinaConnectorForm" property="action" value="create">
        <sj:gridrow>
          <sj:jgName><bean:message key="label.catalina.connector.scheme"/></sj:jgName>
          <sj:jgValue><bean:write name="catalinaConnectorForm" property="scheme"/></sj:jgValue>
        </sj:gridrow>
      </logic:notEqual>

      <sj:gridrow>
        <sj:jgName><bean:message key="label.catalina.connector.protocol"/></sj:jgName>
        <sj:jgValue><bean:write name="catalinaConnectorForm" property="protocol"/></sj:jgValue>
      </sj:gridrow>


      <%-- do not show scheme while creating a new connector --%>
      <logic:notEqual name="catalinaConnectorForm" property="action" value="create">
        <sj:gridrow>
          <sj:jgName><bean:message key="label.catalina.connector.secure"/></sj:jgName>
          <sj:jgValue><bean:write name="catalinaConnectorForm" property="secure"/></sj:jgValue>
        </sj:gridrow>
      </logic:notEqual>
      <logic:equal name="catalinaConnectorForm" property="action" value="create">
      <sj:gridrow>
        <sj:jgName><bean:message key="label.catalina.connector.secure"/></sj:jgName>
        <sj:jgValue><html:text property="secure" size="10"/></sj:jgValue>
      </sj:gridrow>
      </logic:equal>

      <sj:gridrow>
        <sj:jgName><bean:message key="label.catalina.connector.accept.count"/></sj:jgName>
        <sj:jgValue><html:text property="acceptCountText" size="10"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.catalina.connector.allow.trace"/></sj:jgName>
        <sj:jgValue>
          <html:select property="allowTrace">
            <bean:define id="booleanVals" name="catalinaConnectorForm" property="booleanVals"/>
            <html:options collection="booleanVals" property="value" labelProperty="label"/>
          </html:select>
        </sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.catalina.connector.empty.sessionpath"/></sj:jgName>
        <sj:jgValue>
          <html:select property="emptySessionPath">
            <bean:define id="booleanVals" name="catalinaConnectorForm" property="booleanVals"/>
            <html:options collection="booleanVals" property="value" labelProperty="label"/>
          </html:select>
        </sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.catalina.connector.enable.dns"/></sj:jgName>
        <sj:jgValue>
          <html:select property="enableLookups">
            <bean:define id="booleanVals" name="catalinaConnectorForm" property="booleanVals"/>
            <html:options collection="booleanVals" property="value" labelProperty="label"/>
          </html:select>
        </sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.catalina.connector.max.post.size"/></sj:jgName>
        <sj:jgValue><html:text property="maxPostSizeText" size="10"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.catalina.connector.connection.timeout"/></sj:jgName>
        <sj:jgValue><html:text property="connTimeOutText" size="10"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.catalina.connector.uri.encoding"/></sj:jgName>
        <sj:jgValue><html:text property="URIEncoding" size="10"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.catalina.connector.use.bodyencoding.for.uri"/></sj:jgName>
        <sj:jgValue>
          <html:select property="useBodyEncodingForURI">
            <bean:define id="booleanVals" name="catalinaConnectorForm" property="booleanVals"/>
            <html:options collection="booleanVals" property="value" labelProperty="label"/>
          </html:select>
        </sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.catalina.connector.xpoweredby"/></sj:jgName>
        <sj:jgValue>
          <html:select property="xpoweredBy">
            <bean:define id="booleanVals" name="catalinaConnectorForm" property="booleanVals"/>
            <html:options collection="booleanVals" property="value" labelProperty="label"/>
          </html:select>
        </sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.catalina.connector.tcp.nodelay"/></sj:jgName>
        <sj:jgValue>
          <html:select property="tcpNoDelay">
            <bean:define id="booleanVals" name="catalinaConnectorForm" property="booleanVals"/>
            <html:options collection="booleanVals" property="value" labelProperty="label"/>
          </html:select>
        </sj:jgValue>
      </sj:gridrow>
      <!--
      <logic:equal name="catalinaConnectorForm" property="connectorType" value="AJP">
      <sj:gridrow>
        <sj:jgName><bean:message key="label.catalina.connector.output.buffer"/></sj:jgName>
        <sj:jgValue><html:text property="outputBufferSizeText" size="5"/></sj:jgValue>
      </sj:gridrow>
      </logic:equal>
      <logic:notEqual name="catalinaConnectorForm" property="connectorType" value="AJP">
      <sj:gridrow>
        <sj:jgName><bean:message key="label.catalina.connector.input.buffer"/></sj:jgName>
        <sj:jgValue><html:text property="bufferSizeText" size="5"/></sj:jgValue>
      </sj:gridrow>
      </logic:notEqual>
      -->
      <sj:gridrow>
        <sj:jgName><bean:message key="label.catalina.connector.buffer"/></sj:jgName>
        <sj:jgValue><html:text property="bufferSizeText" size="5"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.catalina.connector.address.ip"/></sj:jgName>
        <sj:jgValue>
          <html:text property="address" size="20"/>
        </sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>

    <sj:panelSeparator/>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.catalina.connector.port"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <%-- Input only allowed on create transaction --%>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.catalina.connector.portnumber"/></sj:jgName>
        <sj:jgValue>
          <logic:equal name="catalinaConnectorForm" property="action" value="create">
            <html:text property="portText" size="5"/>
          </logic:equal>
          <logic:equal name="catalinaConnectorForm" property="action" value="edit">
            <bean:write name="catalinaConnectorForm" property="portText"/>
            <html:hidden property="portText"/>
          </logic:equal>
        </sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.catalina.connector.redirect.portnumber"/></sj:jgName>
        <sj:jgValue><html:text property="redirectPortText" size="5"/></sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>

    <sj:panelSeparator/>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.catalina.connector.threads"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.catalina.connector.max"/></sj:jgName>
        <sj:jgValue><html:text property="maxThreadsText" size="5"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.catalina.connector.minSpare"/></sj:jgName>
        <sj:jgValue><html:text property="minSpareThreadsText" size="5"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.catalina.connector.maxSpare"/></sj:jgName>
        <sj:jgValue><html:text property="maxSpareThreadsText" size="5"/></sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>
    <%--
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.catalina.connector.max"/></sj:jgName>
        <logic:equal name="catalinaConnectorForm" property="action" value="create">
          <sj:jgValue><html:text property="maxThreadsText" size="5"/></sj:jgValue>
        </logic:equal>
        <logic:notEqual name="catalinaConnectorForm" property="action" value="create">
          <sj:jgValue><bean:write name="catalinaConnectorForm" property="maxThreadsText"/></sj:jgValue>
        </logic:notEqual>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.catalina.connector.minSpare"/></sj:jgName>
        <logic:equal name="catalinaConnectorForm" property="action" value="create">
          <sj:jgValue><html:text property="minSpareThreadsText" size="5"/></sj:jgValue>
        </logic:equal>
        <logic:notEqual name="catalinaConnectorForm" property="action" value="create">
          <sj:jgValue><bean:write name="catalinaConnectorForm" property="minSpareThreadsText"/></sj:jgValue>
        </logic:notEqual>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.catalina.connector.maxSpare"/></sj:jgName>
        <logic:equal name="catalinaConnectorForm" property="action" value="create">
          <sj:jgValue><html:text property="maxSpareThreadsText" size="5"/></sj:jgValue>
        </logic:equal>
        <logic:notEqual name="catalinaConnectorForm" property="action" value="create">
          <sj:jgValue><bean:write name="catalinaConnectorForm" property="maxSpareThreadsText"/></sj:jgValue>
        </logic:notEqual>
      </sj:gridrow>
    </sj:jonasgrid>
    --%>

    <%-- The following properties are deprecated--%>
    <sj:panelSeparator/>
<%-- The following properties are supported only for Coyote HTTP/S 1.1 Connectors --%>
    <logic:notEqual name="catalinaConnectorForm" property="connectorType" value="AJP">
      <sj:panelSeparator/>
      <sj:jonasgrid>
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="title.catalina.connector.proxy"/></sj:jgColTitle>
        </sj:jgRowTitle>
      </sj:jonasgrid>
      <sj:jonasgrid>
        <sj:gridrow>
          <sj:jgName><bean:message key="label.catalina.connector.proxy.name"/></sj:jgName>
          <sj:jgValue><html:text property="proxyName" size="30"/></sj:jgValue>
        </sj:gridrow>
        <sj:gridrow>
          <sj:jgName><bean:message key="label.catalina.connector.proxy.portnumber"/></sj:jgName>
          <sj:jgValue><html:text property="proxyPortText" size="5"/></sj:jgValue>
        </sj:gridrow>
      </sj:jonasgrid>
    </logic:notEqual>

<%-- The following properties are supported only on HTTPS Connector --%>
    <logic:equal name="catalinaConnectorForm" property="scheme" value="https">
      <sj:panelSeparator/>
      <sj:jonasgrid>
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="title.catalina.connector.factory"/></sj:jgColTitle>
        </sj:jgRowTitle>
      </sj:jonasgrid>
      <sj:jonasgrid>
        <sj:gridrow>
          <sj:jgName><bean:message key="label.catalina.connector.algorithm"/></sj:jgName>
          <sj:jgValue>
            <logic:equal name="catalinaConnectorForm" property="action" value="create">
              <html:text property="algorithm" size="30"/>
            </logic:equal>
            <logic:equal name="catalinaConnectorForm" property="action" value="edit">
              <bean:write name="catalinaConnectorForm" property="algorithm"/>
            </logic:equal>
          </sj:jgValue>
        </sj:gridrow>
        <sj:gridrow>
          <sj:jgName><bean:message key="label.catalina.connector.client.auth"/></sj:jgName>
          <sj:jgValue>
            <html:select property="clientAuth">
              <bean:define id="booleanVals" name="catalinaConnectorForm" property="booleanVals"/>
              <html:options collection="booleanVals" property="value" labelProperty="label"/>
            </html:select>
          </sj:jgValue>
        </sj:gridrow>
        <%-- Input allowed only on create --%>
        <sj:gridrow>
          <sj:jgName><bean:message key="label.catalina.connector.keystore.filename"/></sj:jgName>
          <sj:jgValue>
            <logic:equal name="catalinaConnectorForm" property="action" value="create">
              <html:text property="keystoreFile" size="30"/>
            </logic:equal>
            <logic:equal name="catalinaConnectorForm" property="action" value="edit">
              <bean:write name="catalinaConnectorForm" property="keystoreFile"/>
            </logic:equal>
          </sj:jgValue>
        </sj:gridrow>
        <sj:gridrow>
          <sj:jgName><bean:message key="label.catalina.connector.keystore.password"/></sj:jgName>
          <sj:jgValue>
            <logic:equal name="catalinaConnectorForm" property="action" value="create">
              <html:text property="keystorePass" size="30"/>
            </logic:equal>
            <logic:equal name="catalinaConnectorForm" property="action" value="edit">
              <bean:write name="catalinaConnectorForm" property="keystorePass"/>
            </logic:equal>
          </sj:jgValue>
        </sj:gridrow>
        <sj:gridrow>
          <sj:jgName><bean:message key="label.catalina.connector.keystore.type"/></sj:jgName>
          <sj:jgValue>
            <logic:equal name="catalinaConnectorForm" property="action" value="create">
              <html:text property="keystoreType" size="30"/>
            </logic:equal>
            <logic:equal name="catalinaConnectorForm" property="action" value="edit">
              <bean:write name="catalinaConnectorForm" property="keystoreType"/>
            </logic:equal>
          </sj:jgValue>
        </sj:gridrow>
        <sj:gridrow>
          <sj:jgName><bean:message key="label.catalina.connector.sslprotocol"/></sj:jgName>
          <sj:jgValue>
            <logic:equal name="catalinaConnectorForm" property="action" value="create">
              <html:text property="sslProtocol" size="30"/>
            </logic:equal>
            <logic:equal name="catalinaConnectorForm" property="action" value="edit">
              <bean:write name="catalinaConnectorForm" property="sslProtocol"/>
            </logic:equal>
          </sj:jgValue>
        </sj:gridrow>
        <sj:gridrow>
          <sj:jgName><bean:message key="label.catalina.connector.ciphers"/></sj:jgName>
          <sj:jgValue>
            <logic:equal name="catalinaConnectorForm" property="action" value="create">
              <html:text property="ciphers" size="30"/>
            </logic:equal>
            <logic:equal name="catalinaConnectorForm" property="action" value="edit">
              <bean:write name="catalinaConnectorForm" property="ciphers"/>
            </logic:equal>
          </sj:jgValue>
        </sj:gridrow>
      </sj:jonasgrid>
    </logic:equal>

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
            onclick="submitHidden('catalinaConnectorForm','save','true')">
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
