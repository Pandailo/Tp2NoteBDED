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
  <sj:tab forward="ActionListContainers"><bean:message key="tab.ejbcontainers"/></sj:tab>
  <sj:tab forward="ActionViewContainer"><bean:write name="containerForm" property="filename"/></sj:tab>
  <sj:tab forward="ActionEditContainerStatistic"><bean:message key="tab.container.statistic"/></sj:tab>
  <sj:tab forward="ActionViewContainerEjbs" selected="true"><bean:message key="tab.container.ejbs"/></sj:tab>
  <sj:panel>
    <sj:jonasgrid>
      <bean:size id="listSize" name="containerForm" property="ejbs"/>
      <logic:equal name="listSize" value="0">
        <sj:gridrow>
          <sj:gridcol><bean:message key="message.container.ejbs.none"/></sj:gridcol>
        </sj:gridrow>
      </logic:equal>
      <logic:notEqual name="listSize" value="0">
        <sj:jgRowTitle>
          <sj:jgNameTitle><bean:message key="label.container.ejbs.name"/></sj:jgNameTitle>
          <sj:jgValueTitle><bean:message key="label.container.ejbs.type"/></sj:jgValueTitle>
        </sj:jgRowTitle>
        <logic:iterate id="item" name="containerForm" property="ejbs">
          <sj:gridrow>
            <sj:jgName>
              <logic:equal name="item" property="typeString" value="Ent">
                <html:link forward="ActionEditEjbEntity" styleClass="panel"
                  paramId="select" paramName="item" paramProperty="objectName">
                  <bean:write name="item" property="name"/>
                </html:link>
              </logic:equal>
              <logic:equal name="item" property="typeString" value="Sbf">
                <html:link forward="ActionEditEjbSbf" styleClass="panel"
                  paramId="select" paramName="item" paramProperty="objectName">
                  <bean:write name="item" property="name"/>
                </html:link>
              </logic:equal>
              <logic:equal name="item" property="typeString" value="Sbl">
                <html:link forward="ActionEditEjbSbl" styleClass="panel"
                  paramId="select" paramName="item" paramProperty="objectName">
                  <bean:write name="item" property="name"/>
                </html:link>
              </logic:equal>
              <logic:equal name="item" property="typeString" value="Mdb">
                <html:link forward="ActionEditEjbMdb" styleClass="panel"
                  paramId="select" paramName="item" paramProperty="objectName">
                  <bean:write name="item" property="name"/>
                </html:link>
              </logic:equal>
            </sj:jgName>
            <sj:jgValue><bean:write name="item" property="type"/></sj:jgValue>
          </sj:gridrow>
        </logic:iterate>
      </logic:notEqual>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

