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
  <sj:tab forward="ActionListJ2eeMBeans" selected="true"><bean:message key="tab.mbeans.j2ee"/></sj:tab>
  <sj:panel>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.mbeans.domain"/></sj:jgColTitle>
        <sj:jgColTitle><bean:message key="title.mbeans.j2ee.type"/></sj:jgColTitle>
        <sj:jgColTitle><bean:message key="title.mbeans.j2ee.name"/></sj:jgColTitle>
        <sj:jgColTitle><bean:message key="title.mbeans.objectname"/></sj:jgColTitle>
      </sj:jgRowTitle>
      <logic:iterate id="item" name="J2eeMBeans">
        <sj:gridrow>
          <sj:gridcol><bean:write name="item" property="domain"/>&nbsp;</sj:gridcol>
          <sj:gridcol><bean:write name="item" property="j2eeType"/></sj:gridcol>
          <sj:gridcol>
            <html:link forward="ActionListMBeanDetails" styleClass="panel"
              paramId="select" paramName="item" paramProperty="objectName">
              <bean:write name="item" property="name"/>
            </html:link>
          </sj:gridcol>
          <sj:gridcol><bean:write name="item" property="objectName"/></sj:gridcol>
        </sj:gridrow>
      </logic:iterate>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>

</body>
<%@ include file="../common/end.jsp" %>
</html:html>
