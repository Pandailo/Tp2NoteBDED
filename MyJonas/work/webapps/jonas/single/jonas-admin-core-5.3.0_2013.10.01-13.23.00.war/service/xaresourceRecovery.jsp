<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ConfirmActionXaResource">
<html:hidden property="action"/>
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionEditTransactionRecovery"><bean:message key="tab.jtmservice.reco"/></sj:tab>
  <sj:tab forward="ActionListXaResource" selected="true"><bean:message key="tab.jtmservice.xars"/></sj:tab>
  <sj:panel>
    <sj:jonasgrid>
      <bean:size id="listSize" name="listXaResourceEntries"/>
      <logic:equal name="listSize" value="0">
        <sj:gridrow>
          <sj:gridcol><bean:message key="message.recoveryentries.none"/></sj:gridcol>
        </sj:gridrow>
      </logic:equal>
      <logic:notEqual name="listSize" value="0">
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="label.service.jtm.reco.nolabel"/></sj:jgColTitle>
          <sj:jgColTitle><bean:message key="label.service.jtm.reco.resmgr"/></sj:jgColTitle>
          <sj:jgColTitle><bean:message key="label.service.jtm.reco.xares"/></sj:jgColTitle>
          <sj:jgColTitle><bean:message key="label.service.jtm.reco.xid"/></sj:jgColTitle>
          <sj:jgColTitle><bean:message key="label.service.jtm.reco.xidstate"/></sj:jgColTitle>
        </sj:jgRowTitle>
        <logic:iterate id="item" name="listXaResourceEntries">
          <sj:gridrow valign="top">
            <sj:gridcol width="5%">
                <logic:notEqual name="item" property="resmgr" value="NotFound">
                <logic:notEqual name="item" property="xares" value="NotRegistered">
                <logic:notEqual name="item" property="xares" value="IsNull">
                <logic:notEqual name="item" property="xidstate" value="STATUS_COMMITTED">
                   <html:multibox property="selectedItems">
                      <bean:write name="item" property="sindex"/>
                   </html:multibox>
                </logic:notEqual>
                </logic:notEqual>
                </logic:notEqual>
                </logic:notEqual>
            </sj:gridcol>
            <sj:gridcol><bean:write name="item" property="resmgr"/></sj:gridcol>
            <sj:gridcol><bean:write name="item" property="xares"/></sj:gridcol>
            <sj:gridcol><bean:write name="item" property="xid"/></sj:gridcol>
            <sj:gridcol><bean:write name="item" property="xidstate"/></sj:gridcol>
          </sj:gridrow>
        </logic:iterate>
      </logic:notEqual>
    </sj:jonasgrid>

    <sj:panelSeparator/>

    <sj:jonasgrid globalRowStyleClass="panel">
      <sj:gridrow>
        <sj:jgName></sj:jgName>
        <sj:gridcol>
          <sj:jonasbutton href="javascript:submitHidden('itemsXaResourceForm','action','commit')"><bean:message key="button.service.jtm.heurcommit"/></sj:jonasbutton>
        </sj:gridcol>
        <sj:gridcol>
          <sj:jonasbutton href="javascript:submitHidden('itemsXaResourceForm','action','rollback')"><bean:message key="button.service.jtm.heurrollback"/></sj:jonasbutton>
        </sj:gridcol>
        <sj:gridcol>
          <sj:jonasbutton href="javascript:submitHidden('itemsXaResourceForm','action','forget')"><bean:message key="button.service.jtm.heurforget"/></sj:jonasbutton>
         </sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>
</html:form>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>