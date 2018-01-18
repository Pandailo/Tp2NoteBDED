<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ApplyMimePartMailFactory">
<html:hidden property="action"/>
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionEditMailService"><bean:message key="tab.mailservice"/></sj:tab>
  <sj:tab forward="ActionListSessionMailFactories"><bean:message key="tab.mailservice.sessions"/></sj:tab>
  <sj:tab forward="ActionListMimePartMailFactories"><bean:message key="tab.mailservice.mimeparts"/></sj:tab>
  <sj:tab forward="ActionEditMimePartMailFactory" selected="true"><bean:write name="mailFactoryForm" property="mailFactoryName"/></sj:tab>
  <bean:size id="listSize" name="mailFactoryForm" property="listUsedByEjb"/>
  <logic:notEqual name="listSize" value="0">
    <sj:tab forward="MimePart Mail Factory Used By"><bean:message key="tab.mailservice.mailfactory.usedby"/></sj:tab>
  </logic:notEqual>

  <sj:panel>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.mailservice.mailfactory.configuration"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
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
        <sj:jgName><bean:message key="label.mailservice.mailfactory.type"/></sj:jgName>
        <sj:gridcol><bean:message key="message.mailservice.mailfactory.mimepart"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.mailservice.mailfactory.jndiname"/></sj:jgName>
        <sj:gridcol><bean:write name="mailFactoryForm" property="jndiName"/></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>

    <sj:panelSeparator/>

    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.mailservice.mailfactory.authentication.configuration"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.mailservice.mailfactory.authentication.username"/></sj:jgName>
        <sj:gridcol><html:text name="mailFactoryForm" property="username"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.mailservice.mailfactory.authentication.password"/></sj:jgName>
        <sj:gridcol><html:text name="mailFactoryForm" property="password"/></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>

    <sj:panelSeparator/>

    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.mailservice.mailfactory.session.configuration"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName></sj:jgName>
        <sj:gridcol><html:textarea name="mailFactoryForm" property="sessionProps" rows="5" cols="50"/></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>

    <sj:panelSeparator/>

    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.mailservice.mailfactory.mimepart.configuration"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.mailservice.mailfactory.mimepart.to"/></sj:jgName>
        <sj:gridcol><html:text name="mailFactoryForm" property="to"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.mailservice.mailfactory.mailfactory.subject"/></sj:jgName>
        <sj:gridcol><html:text name="mailFactoryForm" property="subject"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.mailservice.mailfactory.mimepart.cc"/></sj:jgName>
        <sj:gridcol><html:text name="mailFactoryForm" property="cc"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.mailservice.mailfactory.mimepart.bcc"/></sj:jgName>
        <sj:gridcol><html:text name="mailFactoryForm" property="bcc"/></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>

    <sj:panelSeparator/>

    <sj:jonasgrid globalRowStyleClass="panel">
      <sj:gridrow>
        <sj:jgName></sj:jgName>
        <sj:gridcol>
          <html:button property="btn_apply" styleClass="button"
            onclick="submitHidden('mailFactoryForm','action','apply')">
            <bean:message key="button.apply"/>
          </html:button>
          &nbsp;&nbsp;
          <html:reset styleClass="button"><bean:message key="button.reset"/></html:reset>
          &nbsp;&nbsp;
          <html:button property="btn_save" styleClass="button"
            onclick="submitHidden('mailFactoryForm','action','save')">
            <bean:message key="button.save"/>
          </html:button>
        </sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>
</html:form>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>