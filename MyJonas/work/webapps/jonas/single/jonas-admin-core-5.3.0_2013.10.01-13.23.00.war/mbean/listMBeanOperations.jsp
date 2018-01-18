<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ApplyMbeanFiltering">
<html:hidden property="forward" value="ActionListMBeanOperations"/>
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionListMBeans"><bean:message key="tab.mbeans"/></sj:tab>
  <logic:equal name="MBean" property="textFamily" value="j2ee">
    <sj:tab forward="ActionListJ2eeMBeans"><bean:message key="tab.mbeans.j2ee"/></sj:tab>
  </logic:equal>
  <logic:equal name="MBean" property="textFamily" value="owner">
    <sj:tab forward="ActionListOwnerMBeans"><bean:message key="tab.mbeans.owner"/></sj:tab>
  </logic:equal>
  <logic:equal name="MBean" property="textFamily" value="unknown">
    <sj:tab forward="ActionListUnknownMBeans"><bean:message key="tab.mbeans.unknown"/></sj:tab>
  </logic:equal>
  <sj:tab forwardControl="ActionListMBeanProperties"><bean:message key="tab.mbean.properties"/></sj:tab>
  <sj:tab forwardControl="ActionListMBeanAttributes"><bean:message key="tab.mbean.attributes"/></sj:tab>
  <sj:tab forwardControl="ActionListMBeanOperations" selected="true"><bean:message key="tab.mbean.operations"/></sj:tab>
  <sj:panel>
    <bean:size id="listSize" name="MBeanOperations"/>
    <logic:notEqual name="listSize" value="0">
      <sj:jonasgrid>
        <sj:jgRowTitle level="2">
          <sj:jgColTitle><bean:message key="title.mbean.operations.filtering"/></sj:jgColTitle>
        </sj:jgRowTitle>
      </sj:jonasgrid>
      <sj:jonasgrid>
        <sj:gridrow changeStyle="true">
          <sj:gridcol><bean:message key="label.mbean.operations.descriptions"/><html:checkbox property="description" onclick="submitForm('mbeanFilteringForm')"/></sj:gridcol>
        </sj:gridrow>
      </sj:jonasgrid>
      <sj:panelSeparator/>
    </logic:notEqual>
    <logic:equal name="listSize" value="0">
      <sj:jonasgrid>
        <sj:gridrow>
          <sj:gridcol><bean:message key="message.mbean.operations.none"/></sj:gridcol>
        </sj:gridrow>
      </sj:jonasgrid>
    </logic:equal>
    <logic:notEqual name="listSize" value="0">
      <sj:jonasgrid>
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="title.mbean.operations.list"/></sj:jgColTitle>
        </sj:jgRowTitle>
      </sj:jonasgrid>
      <bean:define id="periodDefine" name="mbeanFilteringForm" property="periodRow" type="java.lang.String"/>
      <sj:jonasgrid periodRow="<%=periodDefine%>">
        <logic:iterate id="Ope" name="MBeanOperations">
          <sj:gridrow>
            <sj:jgName bold="false"><bean:write name="Ope" property="returnType"/></sj:jgName>
            <sj:jgValue>
              <b><bean:write name="Ope" property="name"/></b>
              (<bean:write name="Ope" property="parameters"/>)
            </sj:jgValue>
          </sj:gridrow>
          <logic:equal name="mbeanFilteringForm" property="description" value="false">
            <sj:gridrow>
              <sj:jgName bold="false"><bean:write name="Ope" property="impact"/></sj:jgName>
              <sj:jgValue><bean:write name="Ope" property="description"/></sj:jgValue>
            </sj:gridrow>
          </logic:equal>
        </logic:iterate>
      </sj:jonasgrid>
    </logic:notEqual>
  </sj:panel>
</sj:tabs>
</html:form>
</body>
<%@ include file="../common/end.jsp" %>
</html:html>
