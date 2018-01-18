<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ApplyDomainDeploy">
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionEditDeploy"><bean:message key="tab.deployment.domain"/></sj:tab>
  <sj:tab forward="ActionEditUpload"><bean:message key="tab.deployment.upload"/></sj:tab>
  <sj:tab forward="ActionEditRemove"><bean:message key="tab.deployment.remove"/></sj:tab>

  <bean:define id="isConfig" name="domainDeployForm" property="isConfigurable"/>
  <logic:equal name="isConfig" value="true">
    <sj:tab forward="ActionArchiveConfigSelect"><bean:message key="tab.configure"/></sj:tab>
  </logic:equal>
  <sj:panel>

    <sj:grid cellPadding="2" style="width:100%">
      <sj:gridrow>
        <sj:gridcol align="center" style="width:45%">
          <b><bean:message key="label.deployment.apps"/></b>
        </sj:gridcol>
        <sj:gridcol style="width:10%">&nbsp;</sj:gridcol>
        <sj:gridcol align="center" style="width:45%">
          <b><bean:message key="label.deployment.targets"/></b>
        </sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:gridcol align="center">
          <html:select property="deploySelected" onchange="displayDeployable(this, 'dispSelectedItem');"
                       styleClass="deploy"
                       style="width:100%"
                       multiple="false"
                       size="10">
            <html:options property="listDeployable"/>
          </html:select>
        </sj:gridcol>
        <sj:gridcol style="width:10%">&nbsp;</sj:gridcol>
        <sj:gridcol align="center">
          <html:select property="targetSelected"
                       styleClass="deploy"
                       style="width:100%"
                       multiple="true"
                       size="10">
            <html:options property="listTargets" labelProperty="listTargetNames"/>
          </html:select>
        </sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:gridcol>&nbsp;</sj:gridcol>
        <sj:gridcol>&nbsp;</sj:gridcol>
        <sj:gridcol align="center">
          <html:button styleClass="buttonSelect"
                       property="selAllBtn"
                       onclick="selAll('domainDeployForm', 'targetSelected', true)">
            <bean:message key="message.deployment.domain.selAll"/>
          </html:button>
          <html:button styleClass="buttonSelect"
                       property="selNoneBtn"
                       onclick="selAll('domainDeployForm', 'targetSelected', false)">
            <bean:message key="message.deployment.domain.selNone"/>
          </html:button>
        </sj:gridcol>
      </sj:gridrow>
    </sj:grid>

    <sj:panelSeparator/>
      <sj:jonasgrid>
        <sj:gridrow>
          <sj:jgName><bean:message key="title.deployment.item.selected"/></sj:jgName>
          <sj:jgValue>
            <input type="text" id="dispSelectedItem" />
          </sj:jgValue>
        </sj:gridrow>
      </sj:jonasgrid>

    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle>
          <bean:message key="title.deployment.domain.deployOptions"/>
        </sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:gridcol>
          <label>
            <html:radio property="selectedOption"
                        value="deploy"
                        onclick="disableReplace('domainDeployForm')">
              <bean:message key="message.deployment.domain.deployOnly"/>
            </html:radio>
          </label>
          <br/>
          <label>
            <html:radio property="selectedOption"
                        value="upload"
                        onclick="enableReplace('domainDeployForm')">
              <bean:message key="message.deployment.domain.uploadOnly"/>
            </html:radio>
          </label>
          <br/>
          <label>
            <html:radio property="selectedOption"
                        value="uploadDeploy"
                        onclick="enableReplace('domainDeployForm')">
              <bean:message key="message.deployment.domain.uploadDeploy"/>
            </html:radio>
          </label>
          <br/>
          <label>
            <html:radio property="selectedOption"
                        value="undeploy"
                        onclick="disableReplace('domainDeployForm')">
              <bean:message key="message.deployment.domain.undeploy"/>
            </html:radio>
          </label>
        </sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:gridcol>
          <label><bean:message key="message.deployment.note"/></label>
        </sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:gridcol>
          <label>
            <html:checkbox property="replaceOnTarget" value="true" disabled="true">
              <bean:message key="message.deployment.domain.replace"/>
            </html:checkbox>
          </label>
        </sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:gridcol align="center">
          <html:submit styleClass="button"><bean:message key="button.apply"/></html:submit>
        </sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>

    <sj:panelSeparator/>

    <logic:present name="<%=Globals.ERROR_KEY%>">
      <sj:jonasgrid>
        <sj:gridrow styleClass="errors">
          <sj:gridcol styleClass="errors"><html:errors/></sj:gridcol>
        </sj:gridrow>
      </sj:jonasgrid>
    </logic:present>

  </sj:panel>
</sj:tabs>
</html:form>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>
