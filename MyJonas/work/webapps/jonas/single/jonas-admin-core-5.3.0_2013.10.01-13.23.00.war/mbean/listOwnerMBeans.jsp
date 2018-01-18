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
  <sj:tab forward="ActionListOwnerMBeans" selected="true"><bean:message key="tab.mbeans.owner"/></sj:tab>
  <sj:panel>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.mbeans.domain"/></sj:jgColTitle>
        <sj:jgColTitle><bean:message key="title.mbeans.owner.type"/></sj:jgColTitle>
        <sj:jgColTitle><bean:message key="title.mbeans.objectname"/></sj:jgColTitle>
      </sj:jgRowTitle>
      <logic:iterate id="item" name="OwnerMBeans">
        <sj:gridrow>
          <sj:gridcol><bean:write name="item" property="domain"/>&nbsp;</sj:gridcol>
          <sj:gridcol><bean:write name="item" property="type"/></sj:gridcol>
          <sj:gridcol>
            <html:link forward="ActionListMBeanDetails" styleClass="panel"
              paramId="select" paramName="item" paramProperty="objectName">
              <bean:write name="item" property="objectName"/>
            </html:link>
          </sj:gridcol>
        </sj:gridrow>
      </logic:iterate>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>

</body>
<%@ include file="../common/end.jsp" %>
</html:html>
