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

  <sj:tab forward="ActionViewPortComponents" selected="true"><bean:message key="tab.service.webservice.portcomponents.title"/></sj:tab>
  <sj:panel>
    <sj:jonasgrid>
      <bean:size id="listSize" name="listPortComponents"/>
      <logic:equal name="listSize" value="0">
        <sj:gridrow>
          <sj:gridcol><bean:message key="message.service.webservice.portcomponents.none"/></sj:gridcol>
        </sj:gridrow>
      </logic:equal>
      <logic:notEqual name="listSize" value="0">
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="label.service.webservice.portcomponents.name"/></sj:jgColTitle>
          <sj:jgColTitle><bean:message key="label.service.webservice.portcomponents.endpoint"/></sj:jgColTitle>
        </sj:jgRowTitle>
        <logic:iterate id="pc" name="listPortComponents">
          <sj:gridrow valign="top">
            <sj:gridcol>
            <bean:define id="wsdId" name="webServiceDescription" property="name"/>
              <bean:define id="pcId" name="pc" property="name"/>
              <%
                HashMap paramMap = new HashMap();
                paramMap.put("wsdselect", wsdId);
                paramMap.put("pcselect", pcId);
                request.setAttribute("paramMap", paramMap);
               %>

              <html:link forward="ActionPortComponentsDetails" name="paramMap" styleClass="panel">
                <bean:write name="pc" property="portComponentName"/>
              </html:link>
            </sj:gridcol>
            <bean:define id="portUrl" name="pc" property="portUrl" type="java.lang.String" />

            <sj:gridcol><a href="<%=portUrl %>" class="panel"> <%=portUrl %> </a></sj:gridcol>
          </sj:gridrow>
        </logic:iterate>
      </logic:notEqual>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>

<%@ include file="../../common/end.jsp" %>
</body>
</html:html>

