<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="java.util.HashMap" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../../common/begin.jsp" %>

<body class="content">
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
<sj:tab forward="ActionListWebService"><bean:message key="tab.service.webservice.details.title"/></sj:tab>
    <sj:tab forward="ActionWebServiceDetails" paramId="select" paramName="webServiceDescription" paramProperty="name">
      <bean:write name="webServiceDescription" property="name"/>
    </sj:tab>
    <sj:tab forward="ActionViewPortComponents" paramId="select" paramName="webServiceDescription" paramProperty="name">
        <bean:message key="tab.service.webservice.portcomponents.title"/>
    </sj:tab>
  <sj:tab forward="ActionPortComponentsDetails" name="paramMap"> <bean:write name="portComponent" property="name"/></sj:tab>
  <sj:tab forward="ActionViewHandlers" selected="true"> <bean:message key="tab.service.webservice.portcomponents.handlers.title"/></sj:tab>
  <sj:panel>
    <sj:jonasgrid>
      <bean:size id="listSize" name="handlers"/>
      <logic:equal name="listSize" value="0">
        <sj:gridrow>
          <sj:gridcol><bean:message key="message.service.webservice.portcomponents.handlers.none"/></sj:gridcol>
        </sj:gridrow>
      </logic:equal>
      <logic:notEqual name="listSize" value="0">
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="label.service.webservice.portcomponents.handlers.details.name"/></sj:jgColTitle>
          <sj:jgColTitle><bean:message key="label.service.webservice.portcomponents.handlers.details.classname"/></sj:jgColTitle>
        </sj:jgRowTitle>
        <logic:iterate id="item" name="handlers">
          <sj:gridrow valign="top">
            <sj:gridcol>
              <bean:define id="wsdId" name="webServiceDescription" property="name"/>
              <bean:define id="pcId" name="portComponent" property="name"/>
              <bean:define id="handlerId" name="item" property="name"/>
              <%
                HashMap handlerDetailsMap = new HashMap();
                handlerDetailsMap.put("wsdselect", wsdId);
                handlerDetailsMap.put("pcselect", pcId);
                handlerDetailsMap.put("handlerselect", handlerId);
                request.setAttribute("handlerDetailsMap", handlerDetailsMap);
               %>

              <html:link forward="ActionHandlersDetails" name="handlerDetailsMap" styleClass="panel">
                <bean:write name="item" property="handlerName"/>
              </html:link>
            </sj:gridcol>

            <sj:gridcol><bean:write name="item" property="handlerClass"/></sj:gridcol>
          </sj:gridrow>
        </logic:iterate>
      </logic:notEqual>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>

<%@ include file="../../common/end.jsp" %>
</body>
</html:html>

