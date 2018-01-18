<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionListResourceAdapters"><bean:message key="tab.resourceadapters"/></sj:tab>
  <sj:tab forward="ActionEditResourceAdapter">
    <bean:write name="resourceAdapterForm" property="name"/>
  </sj:tab>
 <bean:size id="listCFSize" name="resourceAdapterForm" property="CF"/>
  <logic:notEqual name="listCFSize" value="0">
    <sj:tab forward="Rar ConnectionFactories"><bean:message key="tab.rar.cf"/></sj:tab>
  </logic:notEqual>
  <bean:size id="listASSize" name="resourceAdapterForm" property="AS"/>
  <logic:notEqual name="listASSize" value="0">
    <sj:tab forward="Rar ActivationSpecs" selected="true"><bean:message key="tab.rar.as"/></sj:tab>
  </logic:notEqual>
  <bean:size id="listAOSize" name="resourceAdapterForm" property="AO"/>
  <logic:notEqual name="listAOSize" value="0">
    <sj:tab forward="Rar AdminObjects"><bean:message key="tab.rar.ao"/></sj:tab>
  </logic:notEqual>

  <sj:panel>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.rar.as.name"/></sj:jgColTitle>
      </sj:jgRowTitle>
      <logic:iterate id="item" name="resourceAdapterForm" property="AS">
        <sj:gridrow valign="top">
          <sj:gridcol>            
            <html:link forward="ActionEditResourceAdapterAS" styleClass="panel"
              paramId="select" paramName="item" paramProperty="objectName">
              <bean:write name="item" property="name"/>
            </html:link>
          </sj:gridcol>
        </sj:gridrow>
      </logic:iterate>
    </sj:jonasgrid>
  </sj:panel>

</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

