<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ApplyCreateOtherResourceAdapter">

<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <bean:define id="isDomain" name="createResourceAdapterForm" property="isDomain"/>
  <logic:equal name="isDomain" value="false">
    <sj:tab forward="ActionEditDeploy"><bean:message key="tab.deployment"/></sj:tab>
   </logic:equal>
      
  <logic:equal name="isDomain" value="true">
    <sj:tab forward="ActionEditDomainDeploy"><bean:message key="tab.deployment.domain"/></sj:tab>
  </logic:equal>
  <sj:tab forward="ActionEditUpload"><bean:message key="tab.deployment.upload"/></sj:tab>
  <sj:tab forward="ActionEditRemove"><bean:message key="tab.deployment.remove"/></sj:tab>
  <sj:tab forward="ActionArchiveConfigSelect"><bean:message key="tab.configure"/></sj:tab>
  <sj:tab forward="ActionCreateResourceAdapter" selected="true">
      <bean:message key="tab.resourceadapter.create"/>
  </sj:tab>
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
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.resourceadapter.resourceadapter"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.rarname"/></sj:jgName>
        <sj:gridcol valign="top">
            <html:text name="createResourceAdapterForm" property="rarName"/>
            <bean:message key="label.resourceadapter.extention"/>
        </sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.rarname"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.displayname"/></sj:jgName>
        <sj:gridcol valign="top">
            <html:text name="createResourceAdapterForm" property="displayName"/>
        </sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.displayname"/></sj:gridcol>
      </sj:gridrow>
       <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.description"/></sj:jgName>
        <sj:gridcol valign="top">
            <html:text name="createResourceAdapterForm" property="description"/>
        </sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.description"/></sj:gridcol>
      </sj:gridrow>
            <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.vendorname"/></sj:jgName>
        <sj:gridcol valign="top">
            <html:text name="createResourceAdapterForm" property="vendorName"/>
        </sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.vendorname"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.specversion"/></sj:jgName>
        <sj:gridcol valign="top">
            <html:select property="specVersion" name="createResourceAdapterForm">
            <bean:define id="listSpecVersions" name="createResourceAdapterForm" property="specVersions"/>
            <html:options collection="listSpecVersions" property="value" labelProperty="label"/>
            </html:select>
        </sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.specversion"/></sj:gridcol>
      </sj:gridrow>
            <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.eistype"/></sj:jgName>
        <sj:gridcol valign="top">
            <html:text name="createResourceAdapterForm" property="eisType"/>
        </sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.eistype"/></sj:gridcol>
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

