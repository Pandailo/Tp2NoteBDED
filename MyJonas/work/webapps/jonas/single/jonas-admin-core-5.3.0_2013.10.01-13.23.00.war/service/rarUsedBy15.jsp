<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.action.Action"%>
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
  <sj:tab forward="ActionEditResourceAdapterCF"><bean:write name="resourceAdapterCFForm" property="name"/></sj:tab>
  <sj:tab forward="ActionEditResourceAdapterCFStat"><bean:message key="tab.resourceadapter.rar.statistics"/></sj:tab>
  <sj:tab forward="ResourceAdapter Used By1.5" selected="true"><bean:message key="tab.resourceadapter.rar.usedby"/></sj:tab>

  <sj:panel>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.resourceadapter.rar.usedby.ejb"/></sj:jgColTitle>
        <sj:jgColTitle><bean:message key="title.resourceadapter.rar.usedby.type"/></sj:jgColTitle>
      </sj:jgRowTitle>
      <logic:iterate id="item" name="resourceAdapterCFForm" property="listUsedByEjb">
        <sj:gridrow>
          <sj:gridcol>
            <logic:equal name="item" property="typeString" value="Ent">
              <html:link forward="ActionEditEjbEntity" styleClass="panel"
               paramId="select" paramName="item" paramProperty="objectName">
                <bean:write name="item" property="name"/>
              </html:link>
            </logic:equal>
            <logic:equal name="item" property="typeString" value="Sbf">
              <html:link forward="ActionEditEjbSbf" styleClass="panel"
               paramId="select" paramName="item" paramProperty="objectName">
                <bean:write name="item" property="name"/>
              </html:link>
            </logic:equal>
            <logic:equal name="item" property="typeString" value="Sbl">
              <html:link forward="ActionEditEjbSbl" styleClass="panel"
               paramId="select" paramName="item" paramProperty="objectName">
                <bean:write name="item" property="name"/>
              </html:link>
            </logic:equal>
            <logic:equal name="item" property="typeString" value="Mdb">
              <html:link forward="ActionEditEjbMdb" styleClass="panel"
               paramId="select" paramName="item" paramProperty="objectName">
                <bean:write name="item" property="name"/>
              </html:link>
            </logic:equal>
          </sj:gridcol>
          <sj:gridcol><bean:write name="item" property="type"/></sj:gridcol>
        </sj:gridrow>
      </logic:iterate>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

