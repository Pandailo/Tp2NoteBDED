<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
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
    <sj:tab forward="ActionViewPortComponents" paramId="select" paramName="webServiceDescription" paramProperty="name"> <bean:message key="tab.service.webservice.portcomponents.title"/></sj:tab>
    <sj:tab forward="ActionPortComponentsDetails" name="paramMap"><bean:write name="portComponent" property="name"/></sj:tab>
    <sj:tab forward="ActionHandlersDetails" selected="true"><bean:write name="handler" property="name"/></sj:tab>

    <logic:present name="<%=Globals.ERROR_KEY%>">
      <sj:jonasgrid>
        <sj:gridrow styleClass="errors">
          <sj:gridcol styleClass="errors"><html:errors/></sj:gridcol>
        </sj:gridrow>
      </sj:jonasgrid>
      <sj:panelSeparator/>
    </logic:present>

    <sj:panel>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.service.webservice.portcomponents.handlers.details"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.service.webservice.portcomponents.handlers.details.name"/></sj:jgName>
        <sj:jgValue>
          <bean:write name="handler" property="handlerName"/>
        </sj:jgValue>
      </sj:gridrow>

      <sj:gridrow>
        <sj:jgName><bean:message key="label.service.webservice.portcomponents.handlers.details.classname"/></sj:jgName>
        <sj:jgValue>
          <bean:write name="handler" property="handlerClass"/>
        </sj:jgValue>
      </sj:gridrow>

      <sj:gridrow>
        <sj:jgName><bean:message key="label.service.webservice.portcomponents.handlers.details.soapheaders"/></sj:jgName>
        <sj:jgValue>
          <ul>
              <logic:iterate id="itemHeaders" name="soapHeaders">
                <li>
                  <bean:write name="itemHeaders"/>
                </li>
                </logic:iterate>
            </ul>
        </sj:jgValue>
      </sj:gridrow>

      <sj:gridrow>
        <sj:jgName><bean:message key="label.service.webservice.portcomponents.handlers.details.soaproles"/></sj:jgName>
        <sj:jgValue>
          <ul>
              <logic:iterate id="itemRoles" name="soapRoles">
                <li>
                  <bean:write name="itemRoles"/>
                </li>
                </logic:iterate>
            </ul>
        </sj:jgValue>
      </sj:gridrow>

      <sj:gridrow>
        <sj:jgName><bean:message key="label.service.webservice.portcomponents.handlers.details.initParams"/></sj:jgName>
        <sj:jgValue>
          <ul>
              <logic:iterate id="itemInitParams" name="initParams">
                <li>
                  <bean:write name="itemInitParams" property="name"/> = <bean:write name="itemInitParams" property="value"/>
                </li>
                </logic:iterate>
            </ul>
        </sj:jgValue>
      </sj:gridrow>
      </sj:jonasgrid>

    <sj:panelSeparator/>
   </sj:panel>
</sj:tabs>

<%@ include file="../../common/end.jsp" %>
</body>
</html:html>
