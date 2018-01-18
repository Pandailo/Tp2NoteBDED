<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ApplyMimePartMailFactoryProperties">
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionEditDeploy"><bean:message key="tab.deployment"/></sj:tab>
  <sj:tab forward="ActionListMailFactories"><bean:message key="tab.resource.mailfactories"/></sj:tab>
  <sj:tab forward="ActionEditMimePartMailFactoryProperties" selected="true"><bean:message key="tab.resource.mimepart.mailfactory.properties"/></sj:tab>

  <sj:panel>
    <logic:present name="<%=Globals.ERROR_KEY%>">
      <sj:jonasgrid>
        <sj:gridrow styleClass="errors">
          <sj:gridcol styleClass="errors"><html:errors/></sj:gridcol>
        </sj:gridrow>
      </sj:jonasgrid>
      <sj:panelSeparator/>
    </logic:present>

    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resource.mailfactory.properties.name"/></sj:jgName>
        <sj:gridcol valign="top"><bean:write name="mailFactoryPropertiesForm" property="mailFactoryName"/></sj:gridcol>
        <sj:gridcol width="60%"></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>

    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.resource.mailfactory.configuration"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resource.mailfactory.type"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="type" size="40"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resource.mailfactory.properties.type"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resource.mailfactory.jndiname"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="jndiName" size="40"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resource.mailfactory.properties.jndiname"/></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>

    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.resource.mailfactory.authentication"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resource.mailfactory.authentication.username"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="username"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resource.mailfactory.properties.username"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resource.mailfactory.authentication.password"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="password"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resource.mailfactory.properties.password"/></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>

    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.resource.mailfactory.session"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName></sj:jgName>
        <sj:gridcol valign="top"><html:textarea property="sessionProps" rows="5" cols="50"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resource.mailfactory.properties.session"/></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>

    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.resource.mailfactory.mimepart"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resource.mailfactory.to"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="to"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resource.mailfactory.properties.to"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resource.mailfactory.subject"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="subject"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resource.mailfactory.properties.subject"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resource.mailfactory.cc"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="cc"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resource.mailfactory.properties.cc"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resource.mailfactory.bcc"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="bcc"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resource.mailfactory.properties.bcc"/></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>

    <sj:panelSeparator/>

    <sj:jonasgrid globalRowStyleClass="panel">
      <sj:gridrow>
        <sj:jgName></sj:jgName>
        <sj:gridcol>
          <html:submit styleClass="button"><bean:message key="button.apply"/></html:submit>
          &nbsp;&nbsp;
          <html:reset styleClass="button"><bean:message key="button.reset"/></html:reset>
      </sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>

  </sj:panel>
</sj:tabs>
</html:form>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>