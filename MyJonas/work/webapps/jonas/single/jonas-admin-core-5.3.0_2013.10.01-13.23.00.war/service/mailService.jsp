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
  <sj:tab forward="ActionEditMailService" selected="true"><bean:message key="tab.mailservice"/></sj:tab>
  <sj:tab forward="ActionListSessionMailFactories"><bean:message key="tab.mailservice.sessions"/></sj:tab>
  <sj:tab forward="ActionListMimePartMailFactories"><bean:message key="tab.mailservice.mimeparts"/></sj:tab>
  <sj:panel>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.mailservice.factories"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.mailservice.nbfact.session"/></sj:jgName>
        <sj:gridcol><bean:write name="mailServiceForm" property="nbSessionFactories"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.mailservice.nbfact.mimepart"/></sj:jgName>
        <sj:gridcol><bean:write name="mailServiceForm" property="nbMimePartDatasourceFactories"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.mailservice.nbfact.total"/></sj:jgName>
        <sj:gridcol><bean:write name="mailServiceForm" property="nbFactories"/></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>