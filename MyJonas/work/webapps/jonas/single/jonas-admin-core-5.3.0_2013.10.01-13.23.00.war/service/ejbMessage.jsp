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
  <sj:tab forward="ActionViewContainerEjbs"><bean:message key="tab.container.ejbs"/></sj:tab>
  <sj:tab forward="Ejb Message" selected="true"><bean:write name="ejbForm" property="name"/></sj:tab>
  <logic:equal name="ejbForm" property="dependency" value="true">
    <sj:tab forward="Ejb Dependency"><bean:message key="tab.ejb.dependency"/></sj:tab>
  </logic:equal>
  <sj:panel>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:write name="ejbForm" property="type"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.ejb.name"/></sj:jgName>
        <sj:jgValue><bean:write name="ejbForm" property="name"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.ejb.file"/></sj:jgName>
        <sj:jgValue><bean:write name="ejbForm" property="file"/></sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>

    <sj:panelSeparator/>
    <!-- General attributes -->
      <logic:notEmpty name="ejbForm" property="generalAttributes">
        <bean:define id="generalAttributes" name="ejbForm"
          property="generalAttributes" />
        <sj:panelSeparator />
        <sj:jonasgrid cellSpacing="2">
          <logic:iterate id="gattribute" name="generalAttributes">
            <sj:gridrow>
              <sj:jgName>
                <bean:write name="gattribute" property="label" />
              </sj:jgName>
              <!-- The attribute is not writable -->
              <sj:gridcol width="40%">
                <bean:write name="gattribute" property="value" />
              </sj:gridcol>
              <sj:gridcol>
              <logic:notEmpty name="gattribute" property="description">
              <bean:define id="description" name="gattribute" property="description"/>
              <html:img src="../images/icon/info.png"
                        title="<%=description.toString()%>" />
              </logic:notEmpty>
              </sj:gridcol>
              <sj:gridcol></sj:gridcol>
            </sj:gridrow>
          </logic:iterate>
        </sj:jonasgrid>
      </logic:notEmpty>

      <logic:notEmpty name="ejbForm" property="namingAttributes">
        <bean:define id="namingAttributes" name="ejbForm"
          property="namingAttributes" />
        <sj:panelSeparator />
        <sj:jonasgrid>
          <sj:jgRowTitle >
            <sj:jgColTitle>
              <bean:message key="title.ejb.naming" />
            </sj:jgColTitle>
          </sj:jgRowTitle>
        </sj:jonasgrid>
        <sj:jonasgrid cellSpacing="2">
          <logic:iterate id="nattribute" name="namingAttributes">
            <sj:gridrow>
              <sj:jgName>
                <bean:write name="nattribute" property="label" />
              </sj:jgName>
              <!-- The attribute is not writable -->
              <sj:gridcol width="40%">
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
      <logic:notEmpty name="ejbForm" property="monitoringAttributes">
    <bean:define id="monitoringAttributes" name="ejbForm" property="monitoringAttributes"/>
    <sj:panelSeparator />
      <sj:jonasgrid>
        <sj:jgRowTitle >
          <sj:jgColTitle>
            <bean:message key="title.ejb.monitoring" />
          </sj:jgColTitle>
        </sj:jgRowTitle>
      </sj:jonasgrid>
      <sj:jonasgrid cellSpacing="2">
      <logic:iterate id="mattribute" name="monitoringAttributes">
       <sj:gridrow>
        <sj:jgName>
            <bean:write name="mattribute" property="label"/>
        </sj:jgName>
        <logic:equal property="writable" name="mattribute" value="true">
        <!-- FIXME: Is there really Nothing writeable for entity Bean ???-->
        </logic:equal>
        <logic:notEqual property="writable" name="mattribute" value="true">
          <!-- The attribute is not writable -->
          <sj:gridcol width="30%"><bean:write name="mattribute" property="value" /></sj:gridcol>
        </logic:notEqual>
        <sj:gridcol width="30%">
         <logic:notEmpty name="mattribute" property="description">
           <bean:define id="description" name="mattribute" property="description"/>
              <html:img src="../images/icon/info.png"
                        title="<%=description.toString()%>" />
         </logic:notEmpty>
        </sj:gridcol>
      </sj:gridrow>
      </logic:iterate>
    </sj:jonasgrid>
    </logic:notEmpty>
    <sj:panelSeparator />


  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

