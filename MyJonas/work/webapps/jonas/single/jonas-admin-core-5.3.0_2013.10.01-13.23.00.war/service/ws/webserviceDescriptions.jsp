<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../../common/begin.jsp" %>

<body class="content">
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionListWebService" selected="true"><bean:message key="tab.service.webservice.details.title"/></sj:tab>
  <sj:panel>
    <sj:jonasgrid>
      <bean:size id="listSize" name="listWebServiceDescription"/>
      <logic:equal name="listSize" value="0">
        <sj:gridrow>
          <sj:gridcol><bean:message key="message.service.webservice.nowebservice"/></sj:gridcol>
        </sj:gridrow>
      </logic:equal>
      <logic:notEqual name="listSize" value="0">
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="label.service.webservice.descriptions.name"/></sj:jgColTitle>
          <sj:jgColTitle><bean:message key="label.service.webservice.descriptions.wsdlurl"/></sj:jgColTitle>
          <sj:jgColTitle><bean:message key="label.service.webservice.descriptions.portcomponents"/></sj:jgColTitle>
          <!-- Not using wsdl file to save space on the page. -->
            <!--   <sj:jgColTitle><bean:message key="label.service.webservice.descriptions.wsdlfilename"/></sj:jgColTitle> -->
        </sj:jgRowTitle>
        <logic:iterate id="item" name="listWebServiceDescription">
          <sj:gridrow valign="top">
            <sj:gridcol>
              <html:link forward="ActionWebServiceDetails" styleClass="panel"
                paramId="select" paramName="item" paramProperty="name">
                <bean:write name="item" property="webServiceDescriptionName"/>
              </html:link>
            </sj:gridcol>
            <bean:define id="wsdlUrl" name="item" property="wsdlUrl" type="java.lang.String" />
            <sj:gridcol> <a href="<%=wsdlUrl %>" class="panel"> <%=wsdlUrl %> </a> </sj:gridcol>
            <sj:gridcol>
              <html:link forward="ActionViewPortComponents" styleClass="panel"
                paramId="select" paramName="item" paramProperty="name">
                <i> <bean:message key="message.service.webservice.descriptions.portcomponents.link"/> </i>
              </html:link>
            </sj:gridcol>
            <!-- Not using wsdl file to save space on the page. -->
            <!--   <sj:gridcol><bean:write name="item" property="wsdlFile"/></sj:gridcol> -->
          </sj:gridrow>
        </logic:iterate>
      </logic:notEqual>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>

<%@ include file="../../common/end.jsp" %>
</body>
</html:html>

