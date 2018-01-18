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
    <sj:tab forward="ActionWebServiceDetails" selected="true">
      <bean:write name="selectedWebServiceDescription" property="name"/>
    </sj:tab>


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
        <sj:jgColTitle><bean:message key="title.service.webservice.details"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.service.webservice.details.name"/></sj:jgName>
        <sj:jgValue>
          <bean:write name="selectedWebServiceDescription" property="webServiceDescriptionName"/>
        </sj:jgValue>
      </sj:gridrow>

      <bean:define id="wsdlUrl" name="selectedWebServiceDescription" property="wsdlUrl" type="java.lang.String" />
        <sj:gridrow>
          <sj:jgName><bean:message key="label.service.webservice.details.wsdlurl"/></sj:jgName>
          <sj:jgValue>
            <a href="<%=wsdlUrl %>" class="panel"> <%=wsdlUrl %> </a>
          </sj:jgValue>
        </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.service.webservice.details.wsdlfilename"/></sj:jgName>
        <sj:jgValue><bean:write name="selectedWebServiceDescription" property="wsdlFile"/></sj:jgValue>
      </sj:gridrow>


        <sj:gridrow>
          <sj:jgName><bean:message key="label.service.webservice.details.mappingfilename"/></sj:jgName>
          <sj:jgValue><bean:write name="selectedWebServiceDescription" property="jaxRpcMappingFile"/></sj:jgValue>
        </sj:gridrow>

        <sj:gridrow>
          <sj:jgName><bean:message key="label.service.webservice.details.portcomponents"/></sj:jgName>
          <sj:jgValue>
              <html:link forward="ActionViewPortComponents" styleClass="panel"
                paramId="select" paramName="selectedWebServiceDescription" paramProperty="name">
                <i> <bean:message key="message.service.webservice.details.portcomponents.link"/> </i>
              </html:link>
          </sj:jgValue>
        </sj:gridrow>
      </sj:jonasgrid>

    <sj:panelSeparator/>
   </sj:panel>
</sj:tabs>

<%@ include file="../../common/end.jsp" %>
</body>
</html:html>
