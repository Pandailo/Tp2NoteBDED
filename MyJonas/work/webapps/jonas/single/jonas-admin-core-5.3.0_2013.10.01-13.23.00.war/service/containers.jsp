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
  <sj:tab forward="ActionListContainers" selected="true"><bean:message key="tab.ejbcontainers"/></sj:tab>
  <sj:tab forward="ActionEditEjbContainersStatistic"><bean:message key="tab.ejbcontainers.statistic"/></sj:tab>
  <sj:panel>
    <sj:jonasgrid>
      <bean:size id="listSize" name="listContainers"/>
      <logic:equal name="listSize" value="0">
        <sj:gridrow>
          <sj:gridcol><bean:message key="message.ejbcontainers.none"/></sj:gridcol>
        </sj:gridrow>
      </logic:equal>
      <logic:notEqual name="listSize" value="0">
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="label.ejbcontainers.file"/></sj:jgColTitle>
          <sj:jgColTitle><bean:message key="label.ejbcontainers.name"/></sj:jgColTitle>
          <sj:jgColTitle><bean:message key="label.ejbcontainers.path"/></sj:jgColTitle>
        </sj:jgRowTitle>
        <logic:iterate id="item" name="listContainers">
          <sj:gridrow valign="top">
            <sj:gridcol>
              <html:link forward="ActionEditContainer" styleClass="panel"
                paramId="select" paramName="item" paramProperty="objectName">
                <bean:write name="item" property="file"/>
              </html:link>
            </sj:gridcol>
            <sj:gridcol><bean:write name="item" property="name"/></sj:gridcol>
            <sj:gridcol><bean:write name="item" property="path"/></sj:gridcol>
          </sj:gridrow>
        </logic:iterate>
      </logic:notEqual>
    </sj:jonasgrid>
    <sj:panelSeparator/>

    <sj:jonasgrid globalRowStyleClass="panel">
      <sj:gridrow>
         <sj:gridcol align="center">
          <sj:jonasbutton forward="ActionListContainersRefresh">
            <bean:message key="action.button.services.refresh"/>
          </sj:jonasbutton>
         </sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

