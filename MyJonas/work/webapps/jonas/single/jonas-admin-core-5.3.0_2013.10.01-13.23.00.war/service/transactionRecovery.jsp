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
  <sj:tab forward="ActionEditJtmService"><bean:message key="tab.jtmservice"/></sj:tab>
  <sj:tab forward="ActionEditTransactionStatistic"><bean:message key="tab.jtmservice.stat"/></sj:tab>
  <sj:tab forward="ActionEditTransactionMonitor"><bean:message key="tab.jtmservice.moni"/></sj:tab>
  <sj:tab forward="ActionEditTransactionRecovery" selected="true"><bean:message key="tab.jtmservice.reco"/></sj:tab>
  <sj:panel>
    <sj:jonasgrid>
      <bean:size id="listSize" name="listRecoveryEntries"/>
      <logic:equal name="listSize" value="0">
        <sj:gridrow>
          <sj:gridcol><bean:message key="message.recoveryentries.none"/></sj:gridcol>
        </sj:gridrow>
      </logic:equal>
      <logic:notEqual name="listSize" value="0">
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="label.service.jtm.reco.transaction"/></sj:jgColTitle>
          <sj:jgColTitle><bean:message key="label.service.jtm.reco.date"/></sj:jgColTitle>
          <sj:jgColTitle><bean:message key="label.service.jtm.reco.xidcount"/></sj:jgColTitle>
        </sj:jgRowTitle>
        <logic:iterate id="item" name="listRecoveryEntries">
          <sj:gridrow valign="top">
            <sj:gridcol>
              <html:link forward="ActionListXaResource" styleClass="panel"
                paramId="fulltrans" paramName="item" paramProperty="fulltrans">
                <bean:write name="item" property="transaction"/>
              </html:link>
            </sj:gridcol>
            <sj:gridcol><bean:write name="item" property="date"/></sj:gridcol>
            <sj:gridcol><bean:write name="item" property="xidcount"/></sj:gridcol>
          </sj:gridrow>
        </logic:iterate>
      </logic:notEqual>
    </sj:jonasgrid>

    <sj:panelSeparator/>

    <sj:jonasgrid globalRowStyleClass="panel">
      <sj:gridrow>
        <sj:jgName></sj:jgName>
         <sj:gridcol>
          <sj:jonasbutton forward="ActionResetRecovery">
            <bean:message key="button.service.jtm.refreshtx"/>
          </sj:jonasbutton>
         </sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>