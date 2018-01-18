<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
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
    <sj:tab forward="ActionWebServiceDetails" paramId="select" paramName="selectedWebServiceDescription" paramProperty="name">
      <bean:write name="selectedWebServiceDescription" property="name"/>
    </sj:tab>
    <sj:tab forward="ActionViewPortComponents" paramId="select" paramName="selectedWebServiceDescription" paramProperty="name">
        <bean:message key="tab.service.webservice.portcomponents.title"/>
    </sj:tab>
    <sj:tab forward="ActionPortComponentsDetails" selected="true"><bean:write name="selectedPortComponent" property="name"/></sj:tab>




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
        <sj:jgColTitle><bean:message key="title.service.webservice.portcomponents.details"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.service.webservice.portcomponents.details.name"/></sj:jgName>
        <sj:jgValue>
          <bean:write name="selectedPortComponent" property="name"/>
        </sj:jgValue>
      </sj:gridrow>

      <sj:gridrow>
        <sj:jgName><bean:message key="label.service.webservice.portcomponents.details.wsdlport"/></sj:jgName>
        <sj:jgValue>
          <bean:write name="selectedPortComponent" property="wsdlPort"/>
        </sj:jgValue>
      </sj:gridrow>

      <sj:gridrow>
        <sj:jgName><bean:message key="label.service.webservice.portcomponents.details.sei"/></sj:jgName>
        <sj:jgValue>
          <bean:write name="selectedPortComponent" property="serviceEndpointInterface"/>
        </sj:jgValue>
      </sj:gridrow>

      <bean:define id="portUrl" name="selectedPortComponent" property="portUrl" type="java.lang.String" />
      <sj:gridrow>
        <sj:jgName><bean:message key="label.service.webservice.portcomponents.details.endpoint"/></sj:jgName>
        <sj:jgValue>
          <a href="<%=portUrl %>" class="panel"> <%=portUrl %> </a>
        </sj:jgValue>
      </sj:gridrow>

      <sj:gridrow>
        <sj:jgName><bean:message key="label.service.webservice.portcomponents.details.handlers"/></sj:jgName>
        <sj:jgValue>
          <html:link forward="ActionViewHandlers" styleClass="panel" name="paramMap">
                <i> <bean:message key="message.service.webservice.portcomponents.details.handlers.link"/> </i>
          </html:link>
        </sj:jgValue>
      </sj:gridrow>


        <sj:gridrow>
          <sj:jgName><bean:message key="label.service.webservice.portcomponents.details.implbean"/></sj:jgName>
          <sj:jgValue>
          <logic:equal name="implBean" property="ejbBean" value="true">
              <html:link forward="ActionEditEjbSbl" styleClass="panel" paramId ="select" paramName="implBean" paramProperty="implBeanLink">
                <i> <bean:message key="message.service.webservice.portcomponents.details.implbean.link"/> </i>
              </html:link>
          </logic:equal>
          <logic:notEqual name="implBean" property="ejbBean" value="true">
              <bean:write name="implBean" property="implBeanLink"/>
          </logic:notEqual>
          </sj:jgValue>
        </sj:gridrow>

      </sj:jonasgrid>

    <sj:panelSeparator/>
   </sj:panel>
</sj:tabs>

<%@ include file="../../common/end.jsp" %>
</body>
</html:html>
