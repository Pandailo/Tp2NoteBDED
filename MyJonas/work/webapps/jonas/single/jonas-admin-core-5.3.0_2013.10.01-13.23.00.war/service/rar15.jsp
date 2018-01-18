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
  <sj:tab forward="ActionListResourceAdapters"><bean:message key="tab.resourceadapters"/></sj:tab>
  <sj:tab forward="ActionEditResourceAdapter" selected="true">
    <bean:write name="resourceAdapterForm" property="name"/>
  </sj:tab>
 <bean:size id="listCFSize" name="resourceAdapterForm" property="CF"/>
  <logic:notEqual name="listCFSize" value="0">
    <sj:tab forward="Rar ConnectionFactories"><bean:message key="tab.rar.cf"/></sj:tab>
  </logic:notEqual>
  <bean:size id="listASSize" name="resourceAdapterForm" property="AS"/>
  <logic:notEqual name="listASSize" value="0">
    <sj:tab forward="Rar ActivationSpecs"><bean:message key="tab.rar.as"/></sj:tab>
  </logic:notEqual>
  <bean:size id="listAOSize" name="resourceAdapterForm" property="AO"/>
  <logic:notEqual name="listAOSize" value="0">
    <sj:tab forward="Rar AdminObjects"><bean:message key="tab.rar.ao"/></sj:tab>
  </logic:notEqual>

  <sj:panel>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.resourceadapter"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.name"/></sj:jgName>
        <sj:jgValue><bean:write name="resourceAdapterForm" property="name"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.file"/></sj:jgName>
        <sj:jgValue><bean:write name="resourceAdapterForm" property="file"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.path"/></sj:jgName>
        <sj:jgValue><bean:write name="resourceAdapterForm" property="path"/></sj:jgValue>
      </sj:gridrow>
      <logic:notEmpty name="resourceAdapterForm" property="rarLink">
        <sj:gridrow>
          <sj:jgName><bean:message key="label.resourceadapter.rarlink"/></sj:jgName>
          <sj:jgValue><bean:write name="resourceAdapterForm" property="rarLink"/></sj:jgValue>
        </sj:gridrow>
      </logic:notEmpty>
    </sj:jonasgrid>

    <logic:equal name="resourceAdapterForm" property="inEar" value="true">
      <sj:panelSeparator/>
      <sj:jonasgrid>
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="title.resourceadapter.ear"/></sj:jgColTitle>
        </sj:jgRowTitle>
      </sj:jonasgrid>
      <sj:jonasgrid>
        <sj:gridrow>
          <sj:jgName>
              <html:link forward="ActionEditEar" styleClass="panel"
                paramId="select" paramName="resourceAdapterForm" paramProperty="earON">
                <bean:write name="resourceAdapterForm" property="earFilename"/>
              </html:link>
          </sj:jgName>
          <sj:jgValue><bean:write name="resourceAdapterForm" property="earPath"/></sj:jgValue>
        </sj:gridrow>
      </sj:jonasgrid>
    </logic:equal>

    <bean:size id="listSize" name="resourceAdapterForm" property="listProperties"/>
    <logic:notEqual name="listSize" value="0">
      <sj:panelSeparator/>
      <sj:jonasgrid>
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="title.resourceadapter.properties"/></sj:jgColTitle>
        </sj:jgRowTitle>
      </sj:jonasgrid>
      <sj:jonasgrid>
        <logic:iterate id="item" name="resourceAdapterForm" property="listProperties">
          <sj:gridrow>
            <sj:jgName><bean:write name="item" property="label"/></sj:jgName>
            <sj:jgValue><bean:write name="item" property="value"/></sj:jgValue>
          </sj:gridrow>
        </logic:iterate>
      </sj:jonasgrid>
    </logic:notEqual>

    <logic:equal name="resourceAdapterForm" property="joramAdapter" value="true">
      <sj:panelSeparator/>
      <sj:jonasgrid>
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="title.resourceadapter.joram.server"/></sj:jgColTitle>
        </sj:jgRowTitle>
      </sj:jonasgrid>
      <sj:jonasgrid>
        <sj:gridrow>
          <sj:jgName><bean:message key="title.resourceadapter.joram.server"/></sj:jgName>
          <sj:jgValue>
          <html:link forward="ActionEditJoramServer" styleClass="panel"
                    paramId="id" paramName="resourceAdapterForm" paramProperty="joramServerId">
            <bean:write name="resourceAdapterForm" property="joramServerName"/>
          </html:link>
          </sj:jgValue>
        </sj:gridrow>
      </sj:jonasgrid>
    </logic:equal>
  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

