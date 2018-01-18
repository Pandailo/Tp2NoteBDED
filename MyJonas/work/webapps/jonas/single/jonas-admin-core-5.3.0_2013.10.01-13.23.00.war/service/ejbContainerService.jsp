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
  <sj:tab forward="ActionListContainers"><bean:message key="tab.ejbcontainers"/></sj:tab>
  <sj:tab forward="ActionEditEjbContainerService" selected="true"><bean:message key="tab.ejbContainerService"/></sj:tab>
  <sj:panel>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.ejbContainerService.totalCurrentNumberOfBeanType"/></sj:jgName>
        <sj:jgValue><bean:write name="ejbContainerServiceForm" property="totalCurrentNumberOfBeanType"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.ejbContainerService.totalCurrentNumberOfBMPType"/></sj:jgName>
        <sj:jgValue><bean:write name="ejbContainerServiceForm" property="totalCurrentNumberOfBMPType"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.ejbContainerService.totalCurrentNumberOfCMPType"/></sj:jgName>
        <sj:jgValue><bean:write name="ejbContainerServiceForm" property="totalCurrentNumberOfCMPType"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.ejbContainerService.totalCurrentNumberOfSBFType"/></sj:jgName>
        <sj:jgValue><bean:write name="ejbContainerServiceForm" property="totalCurrentNumberOfSBFType"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.ejbContainerService.totalCurrentNumberOfSBLType"/></sj:jgName>
        <sj:jgValue><bean:write name="ejbContainerServiceForm" property="totalCurrentNumberOfSBLType"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.ejbContainerService.totalCurrentNumberOfMDBType"/></sj:jgName>
        <sj:jgValue><bean:write name="ejbContainerServiceForm" property="totalCurrentNumberOfMDBType"/></sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

