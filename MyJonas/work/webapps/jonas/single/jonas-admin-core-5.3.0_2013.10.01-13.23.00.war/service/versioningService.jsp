<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ApplyVersioningConfiguration">
<html:hidden property="action"/>

<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionEditVersioningService" selected="true"><bean:message key="tab.versioningservice"/></sj:tab>
  <sj:panel>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.versioningservice.enabled"/></sj:jgName>
        <sj:jgValue><bean:write name="versioningServiceForm" property="versioningEnabled"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.versioningservice.defaultpolicy"/></sj:jgName>
        <sj:jgValue>
          <html:select property="defaultPolicy">
            <bean:define id="policies" name="versioningServiceForm" property="policyList"/>
            <html:options collection="policies" property="value" labelProperty="label"/>
          </html:select>
        </sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>
    <sj:panelSeparator/>
    <sj:jonasgrid globalRowStyleClass="panel">
      <sj:gridrow>
        <sj:jgName></sj:jgName>
        <sj:gridcol>
          <html:button property="btn_apply" styleClass="button"
            onclick="submitHidden('versioningServiceForm','action','apply')">
            <bean:message key="button.apply"/>
          </html:button>
          &nbsp;&nbsp;
          <html:reset styleClass="button"><bean:message key="button.reset"/></html:reset>
          &nbsp;&nbsp;
        </sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>
</html:form>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

