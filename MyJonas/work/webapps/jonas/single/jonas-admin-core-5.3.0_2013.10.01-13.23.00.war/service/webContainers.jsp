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
  <sj:tab forward="ActionListWebContainers" selected="true"><bean:message key="tab.webcontainers"/></sj:tab>
  <sj:panel>

    <sj:jonasgrid>
      <bean:size id="listSize" name="listWebContainers"/>
      <logic:equal name="listSize" value="0">
        <sj:gridrow>
          <sj:gridcol><bean:message key="message.webcontainers.none"/></sj:gridcol>
        </sj:gridrow>
      </logic:equal>
      <logic:notEqual name="listSize" value="0">
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="label.webcontainers.context"/></sj:jgColTitle>
          <sj:jgColTitle><bean:message key="label.webcontainers.file"/></sj:jgColTitle>
          <sj:jgColTitle><bean:message key="label.webcontainers.path"/></sj:jgColTitle>
        </sj:jgRowTitle>
        <logic:iterate id="item" name="listWebContainers">
          <sj:gridrow valign="top">
            <sj:gridcol>
              <html:link forward="ActionEditWebApp" styleClass="panel"
                paramId="on" paramName="item" paramProperty="objectName">
                <bean:write name="item" property="labelPathContext"/>
              </html:link>
            </sj:gridcol>
            <sj:gridcol><bean:write name="item" property="file"/></sj:gridcol>
            <sj:gridcol><bean:write name="item" property="path"/></sj:gridcol>
          </sj:gridrow>
        </logic:iterate>
      </logic:notEqual>
    </sj:jonasgrid>
    <sj:panelSeparator/>

    <sj:jonasgrid globalRowStyleClass="panel">
      <sj:gridrow>
         <sj:gridcol align="center">
          <sj:jonasbutton forward="ActionListWebContainersRefresh">
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


