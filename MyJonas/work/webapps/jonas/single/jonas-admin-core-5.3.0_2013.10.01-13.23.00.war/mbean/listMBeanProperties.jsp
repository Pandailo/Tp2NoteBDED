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
  <sj:tab forward="ActionListMBeans"><bean:message key="tab.mbeans"/></sj:tab>
  <logic:equal name="MBean" property="textFamily" value="j2ee">
    <sj:tab forward="ActionListJ2eeMBeans"><bean:message key="tab.mbeans.j2ee"/></sj:tab>
  </logic:equal>
  <logic:equal name="MBean" property="textFamily" value="owner">
    <sj:tab forward="ActionListOwnerMBeans"><bean:message key="tab.mbeans.owner"/></sj:tab>
  </logic:equal>
  <logic:equal name="MBean" property="textFamily" value="unknown">
    <sj:tab forward="ActionListUnknownMBeans"><bean:message key="tab.mbeans.unknown"/></sj:tab>
  </logic:equal>
  <sj:tab forwardControl="ActionListMBeanProperties" selected="true"><bean:message key="tab.mbean.properties"/></sj:tab>
  <sj:tab forwardControl="ActionListMBeanAttributes"><bean:message key="tab.mbean.attributes"/></sj:tab>
  <sj:tab forwardControl="ActionListMBeanOperations"><bean:message key="tab.mbean.operations"/></sj:tab>
  <sj:panel>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName>domain</sj:jgName>
        <sj:jgValue><bean:write name="MBean" property="domain"/></sj:jgValue>
      </sj:gridrow>
      <logic:iterate id="prop" name="MBeanProperties">
        <sj:gridrow>
          <sj:jgName><bean:write name="prop" property="key"/></sj:jgName>
          <sj:jgValue><bean:write name="prop" property="value"/></sj:jgValue>
        </sj:gridrow>
      </logic:iterate>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>
</body>
<%@ include file="../common/end.jsp" %>
</html:html>
