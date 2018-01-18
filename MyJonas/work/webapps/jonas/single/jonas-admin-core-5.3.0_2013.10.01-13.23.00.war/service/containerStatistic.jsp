<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ApplyContainersStatistic">
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionListContainers"><bean:message key="tab.ejbcontainers"/></sj:tab>
  <sj:tab forward="Container"><bean:write name="containerForm" property="filename"/></sj:tab>
  <sj:tab forward="Container Statistic" selected="true"><bean:message key="tab.container.statistic"/></sj:tab>
  <sj:tab forward="Container Ejbs"><bean:message key="tab.container.ejbs"/></sj:tab>
  <sj:panel>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <bean:define id="filenameJar" name="containerForm" property="filename"/>
        <sj:jgColTitle><bean:message key="title.container.statistic" arg0="<%=(String)filenameJar %>"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.container.statistic.currentNumberOfBeanType"/></sj:jgName>
        <sj:jgValue><bean:write name="containerForm" property="currentNumberOfBeanType"/></sj:jgValue>
      </sj:gridrow>

      <sj:gridrow>
        <sj:jgName><bean:message key="label.container.statistic.currentNumberOfEntityType"/></sj:jgName>
        <sj:jgValue><bean:write name="containerForm" property="currentNumberOfEntityType"/></sj:jgValue>
      </sj:gridrow>

      <sj:gridrow>
        <sj:jgName><bean:message key="label.container.statistic.currentNumberOfSBFType"/></sj:jgName>
        <sj:jgValue><bean:write name="containerForm" property="currentNumberOfSBFType"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.container.statistic.currentNumberOfSBLType"/></sj:jgName>
        <sj:jgValue><bean:write name="containerForm" property="currentNumberOfSBLType"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.container.statistic.currentNumberOfMDBType"/></sj:jgName>
        <sj:jgValue><bean:write name="containerForm" property="currentNumberOfMDBType"/></sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>

    <logic:notEmpty name="ejbContainersStatisticForm"
        property="namingAttributes">
        <bean:define id="namingAttributes" name="ejbContainersStatisticForm"
          property="namingAttributes" />
        <sj:panelSeparator />
        <sj:jonasgrid>
          <sj:jgRowTitle>
            <sj:jgColTitle>
              <bean:message key="title.ejb.naming" />
            </sj:jgColTitle>
          </sj:jgRowTitle>
        </sj:jonasgrid>
        <sj:jonasgrid>
          <logic:iterate id="nattribute" name="namingAttributes">
            <sj:gridrow>
              <sj:jgName>
                <bean:write name="nattribute" property="name" />
              </sj:jgName>
              <!-- The attribute is not writable -->
              <sj:gridcol>
                <bean:write name="nattribute" property="value" />
              </sj:gridcol>
              <sj:gridcol>
              <logic:notEmpty name="nattribute" property="description">
                <bean:define id="description" name="nattribute" property="description"/>
                <html:img src="../images/icon/info.png"
                        title="<%=description.toString()%>" />
              </logic:notEmpty>
              </sj:gridcol>
              <sj:gridcol></sj:gridcol>
            </sj:gridrow>
          </logic:iterate>
        </sj:jonasgrid>
      </logic:notEmpty>
    <logic:notEmpty name="ejbContainersStatisticForm" property="monitoringAttributes">
    <bean:define id="mattributes" name="ejbContainersStatisticForm" property="monitoringAttributes"/>
    <sj:panelSeparator />
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.ejb.monitoring"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
    <logic:iterate id="mattribute" name="mattributes">
       <sj:gridrow>
        <sj:jgName><bean:write name="mattribute" property="name"/></sj:jgName>
        <logic:equal property="writable" name="mattribute" value="true">
        <!-- The attribute is writable -->
        <logic:equal property="type" name="mattribute" value="boolean">
        <sj:gridcol>
        <!-- monitoringEnabled is the only writable boolean attribute -->
          <bean:define id="monitoringEnabled" name="mattribute" property="value"/>
          <html:select property="monitoringEnabled" name="ejbContainersStatisticForm" value="<%= monitoringEnabled.toString() %>">
            <bean:define id="colBooleanValues" name="ejbContainersStatisticForm" property="booleanValues"/>
            <html:options collection="colBooleanValues" property="value" labelProperty="label"/>
          </html:select>
        </sj:gridcol>
        </logic:equal>
        <logic:notEqual property="type" name="mattribute" value="boolean">
        <!-- Processing warningThreshold -->
        <bean:define id="atrValue" name="mattribute" property="value"/>
        <bean:define id="atrName" name="mattribute" property="name"/>
        <!-- Text attribute -->
          <sj:gridcol><html:text name="ejbContainersStatisticForm" property="<%= atrName.toString() %>" value="<%= atrValue.toString() %>"/></sj:gridcol>
        <!-- Processing other writable non boolean attribute here -->
        </logic:notEqual>
        </logic:equal>
        <logic:notEqual property="writable" name="mattribute" value="true">
          <!-- The attribute is not writable -->
          <sj:gridcol><bean:write name="mattribute" property="value"/></sj:gridcol>
        </logic:notEqual>
        <sj:gridcol>
              <logic:notEmpty name="mattribute" property="description">
                <bean:define id="description" name="mattribute" property="description"/>
                <html:img src="../images/icon/info.png"
                        title="<%=description.toString()%>" />
              </logic:notEmpty>
        </sj:gridcol>
        <sj:gridcol></sj:gridcol>
        </sj:gridrow>
      </logic:iterate>
    </sj:jonasgrid>
    <sj:panelSeparator/>
    </logic:notEmpty>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.ejbcontainers.statistic"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.ejbcontainers.statistic.totalCurrentNumberOfBeanType"/></sj:jgName>
        <sj:jgValue><bean:write name="ejbContainersStatisticForm" property="totalCurrentNumberOfBeanType"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.ejbcontainers.statistic.totalCurrentNumberOfEntityType"/></sj:jgName>
        <sj:jgValue><bean:write name="ejbContainersStatisticForm" property="totalCurrentNumberOfEntityType"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.ejbcontainers.statistic.totalCurrentNumberOfSBFType"/></sj:jgName>
        <sj:jgValue><bean:write name="ejbContainersStatisticForm" property="totalCurrentNumberOfSBFType"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.ejbcontainers.statistic.totalCurrentNumberOfSBLType"/></sj:jgName>
        <sj:jgValue><bean:write name="ejbContainersStatisticForm" property="totalCurrentNumberOfSBLType"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.ejbcontainers.statistic.totalCurrentNumberOfMDBType"/></sj:jgName>
        <sj:jgValue><bean:write name="ejbContainersStatisticForm" property="totalCurrentNumberOfMDBType"/></sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>
    <logic:equal name="ejbContainersStatisticForm" property="writable" value="true">
    <sj:panelSeparator/>
    <sj:jonasgrid globalRowStyleClass="panel">
      <sj:gridrow>
        <sj:jgName></sj:jgName>
        <sj:gridcol>
          <html:button property="btn_apply" styleClass="button"
            onclick="submitForm('containerForm')">
            <bean:message key="button.apply"/>
          </html:button>
          &nbsp;&nbsp;
          <html:reset styleClass="button"><bean:message key="button.reset"/></html:reset>
        </sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>
    </logic:equal>
  </sj:panel>
</sj:tabs>
</html:form>
<%@ include file="../common/end.jsp" %>
</body>
</html:html>



