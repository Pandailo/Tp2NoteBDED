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
  <logic:equal name="ejbForm" property="type" value="EntityBean">
    <sj:tab forward="Ejb Entity" selected="true"><bean:write name="ejbForm" property="name"/></sj:tab>
  </logic:equal>
  <logic:equal name="ejbForm" property="dependency" value="true">
    <sj:tab forward="Ejb Dependency"><bean:message key="tab.ejb.dependency"/></sj:tab>
  </logic:equal>
  <sj:panel>
    <sj:jonasgrid>
      <sj:jgRowTitle level="2">
        <sj:jgColTitle><bean:message key="title.ejb.action"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow changeStyle="true">
        <sj:gridcol>
          <sj:grid cellPadding="10">
            <sj:gridrow>
              <sj:gridcol>
                <bean:define id="actionSynchronize" value="synchronize"/>
                <sj:jonasbutton forward="ActionExecuteEjb" paramId="action" paramName="actionSynchronize">
                  <bean:message key="button.ejb.type.entity.synchronize"/>
                </sj:jonasbutton>
              </sj:gridcol>
              <sj:gridcol>
                <bean:define id="actionReduceCache" value="reduceCache"/>
                <sj:jonasbutton forward="ActionExecuteEjb" paramId="action" paramName="actionReduceCache">
                  <bean:message key="button.ejb.type.entity.reduceCache"/>
                </sj:jonasbutton>
              </sj:gridcol>
            </sj:gridrow>
          </sj:grid>
        </sj:gridcol>
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


   <logic:equal name="ejbForm" property="writable" value="true">
    <sj:jonasgrid globalRowStyleClass="panel">
      <sj:gridrow>
        <sj:jgName></sj:jgName>
        <sj:gridcol>
          <html:button property="btn_apply" styleClass="button"
            onclick="submitHidden('ejbForm','action','apply')">
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

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

