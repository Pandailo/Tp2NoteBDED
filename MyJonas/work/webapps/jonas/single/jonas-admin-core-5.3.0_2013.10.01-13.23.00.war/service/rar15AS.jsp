<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/resourceAdapterCFForm">
<html:hidden property="action"/>

<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionListResourceAdapters"><bean:message key="tab.resourceadapters"/></sj:tab>
  <sj:tab forward="ActionEditResourceAdapter"><bean:write name="resourceAdapterForm" property="name"/></sj:tab>
 <bean:size id="listCFSize" name="resourceAdapterForm" property="CF"/>
  <logic:notEqual name="listCFSize" value="0">
    <sj:tab forward="Rar ConnectionFactories"><bean:message key="tab.rar.cf"/></sj:tab>
  </logic:notEqual>
  <bean:size id="listASSize" name="resourceAdapterForm" property="AS"/>
  <logic:notEqual name="listASSize" value="0">
    <sj:tab forward="Rar ActivationSpecs"><bean:message key="tab.rar.as"/></sj:tab>
  </logic:notEqual>
  <bean:size id="listAOSize" name="resourceAdapterForm" property="AO"/>
  <logic:notEqual name="listAOSize" value="0">
    <sj:tab forward="Rar AdminObjects"><bean:message key="tab.rar.ao"/></sj:tab>
  </logic:notEqual>
  <sj:tab forward="ActionEditResourceAdapterAS" selected="true">
    <bean:write name="resourceAdapterASForm" property="name"/>
  </sj:tab>
  <bean:size id="listSize" name="resourceAdapterForm" property="listUsedByEjb"/>
  <logic:notEqual name="listSize" value="0">
    <sj:tab forward="ResourceAdapter Used By1.5"><bean:message key="tab.resourceadapter.rar.usedby"/></sj:tab>
  </logic:notEqual>

  <sj:panel>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.resourceadapter.as"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.name"/></sj:jgName>
        <sj:jgValue><bean:write name="resourceAdapterASForm" property="name"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.description"/></sj:jgName>
        <sj:jgValue><bean:write name="resourceAdapterASForm" property="description"/></sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>

    <bean:size id="listSize" name="resourceAdapterASForm" property="listProperties"/>
    <logic:notEqual name="listSize" value="0">
      <sj:panelSeparator/>
      <sj:jonasgrid>
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="title.resourceadapter.reqProperties"/></sj:jgColTitle>
        </sj:jgRowTitle>
      </sj:jonasgrid>
      <sj:jonasgrid>
        <logic:iterate id="item" name="resourceAdapterASForm" property="listProperties">
          <sj:gridrow>
            <sj:jgName><bean:message key="label.resourceadapter.space"/></sj:jgName>
            <sj:jgValue><bean:write name="item"/></sj:jgValue>
          </sj:gridrow>
        </logic:iterate>
      </sj:jonasgrid>
    </logic:notEqual>
  </sj:panel>
</sj:tabs>
</html:form>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

