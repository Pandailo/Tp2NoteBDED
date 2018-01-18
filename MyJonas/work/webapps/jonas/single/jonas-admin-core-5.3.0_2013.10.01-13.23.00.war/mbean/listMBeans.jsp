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
  <sj:tab forward="ActionListMBeans" selected="true"><bean:message key="tab.mbeans"/></sj:tab>
  <sj:panel>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.mbeans.domain"/></sj:jgColTitle>
        <sj:jgColTitle><bean:message key="title.mbeans.family"/></sj:jgColTitle>
        <sj:jgColTitle><bean:message key="title.mbeans.objectname"/></sj:jgColTitle>
      </sj:jgRowTitle>
      <logic:iterate id="item" name="MBeans">
        <sj:gridrow>
          <sj:gridcol><bean:write name="item" property="domain"/>&nbsp;</sj:gridcol>
          <sj:gridcol>
            <logic:equal name="item" property="textFamily" value="j2ee">
              <html:link forward="ActionListJ2eeMBeans" styleClass="panel2">
                <bean:message key="label.mbeans.j2ee"/>
              </html:link>
            </logic:equal>
            <logic:equal name="item" property="textFamily" value="owner">
              <html:link forward="ActionListOwnerMBeans" styleClass="panel2">
                <bean:message key="label.mbeans.owner"/>
              </html:link>
            </logic:equal>
            <logic:equal name="item" property="textFamily" value="unknown">
              <html:link forward="ActionListUnknownMBeans" styleClass="panel2">
                <bean:message key="label.mbeans.unknown"/>
              </html:link>
            </logic:equal>
          </sj:gridcol>
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
