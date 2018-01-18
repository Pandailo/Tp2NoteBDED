<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ApplyJtmConfiguration">
<html:hidden property="action"/>

<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionEditJtmService" selected="true"><bean:message key="tab.jtmservice"/></sj:tab>
  <sj:tab forward="ActionEditTransactionStatistic"><bean:message key="tab.jtmservice.stat"/></sj:tab>
  <sj:tab forward="ActionEditTransactionMonitor"><bean:message key="tab.jtmservice.moni"/></sj:tab>
  <sj:tab forward="ActionEditTransactionRecovery"><bean:message key="tab.jtmservice.reco"/></sj:tab>
  <sj:panel>
    <logic:present name="<%=Globals.ERROR_KEY%>">
      <sj:jonasgrid>
        <sj:gridrow styleClass="errors">
          <sj:gridcol styleClass="errors"><html:errors/></sj:gridcol>
        </sj:gridrow>
      </sj:jonasgrid>
      <sj:panelSeparator/>
    </logic:present>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.service.jtm.location"/></sj:jgName>
        <sj:jgValue><bean:write name="jtmServiceForm" property="jtmLocation"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.service.jtm.host"/></sj:jgName>
        <sj:jgValue><bean:write name="jtmServiceForm" property="jtmHost"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.service.jtm.port"/></sj:jgName>
        <sj:jgValue><bean:write name="jtmServiceForm" property="jtmPort"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.service.jtm.timeout"/></sj:jgName>
        <sj:jgValue><html:text property="timeOutText"/></sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>
    <sj:panelSeparator/>
    <sj:jonasgrid globalRowStyleClass="panel">
      <sj:gridrow>
        <sj:jgName></sj:jgName>
        <sj:gridcol>
          <html:button property="btn_apply" styleClass="button"
            onclick="submitHidden('jtmServiceForm','action','apply')">
            <bean:message key="button.apply"/>
          </html:button>
          &nbsp;&nbsp;
          <html:reset styleClass="button"><bean:message key="button.reset"/></html:reset>
          &nbsp;&nbsp;
          <html:button property="btn_save" styleClass="button"
            onclick="submitHidden('jtmServiceForm','action','save')">
            <bean:message key="button.save"/>
          </html:button>
        </sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>
</html:form>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>