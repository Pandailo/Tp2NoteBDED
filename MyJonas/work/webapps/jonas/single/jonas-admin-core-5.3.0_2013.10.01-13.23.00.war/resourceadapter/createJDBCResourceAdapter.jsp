<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ApplyCreateJDBCResourceAdapter">
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
    </sj:jonasgrid>
    
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.resourceadapter.jdbc"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.jndiname"/></sj:jgName>
        <sj:gridcol valign="top">
            <html:text name="createResourceAdapterForm" property="jndiName"/>
        </sj:gridcol>
      </sj:gridrow>
      
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.nativelib"/></sj:jgName>
        <sj:gridcol valign="top">
            <html:text name="createResourceAdapterForm" property="nativeLib"/>
        </sj:gridcol>
      </sj:gridrow>
      
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.logenabled"/></sj:jgName>
        <sj:gridcol valign="top">
             <html:select property="logEnabled" name="createResourceAdapterForm">
            <bean:define id="listBooleanValues" name="createResourceAdapterForm" property="booleanValues"/>
            <html:options collection="listBooleanValues" property="value" labelProperty="label"/>
            </html:select>
        </sj:gridcol>
      </sj:gridrow>
      
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.logtopic"/></sj:jgName>
        <sj:gridcol valign="top">
            <html:text name="createResourceAdapterForm" property="logTopic"/>
        </sj:gridcol>
      </sj:gridrow>
      </sj:jonasgrid>
      
          <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="label.resourceadapter.poolparams"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
      
      <sj:jonasgrid>
      
       <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.poolinit"/></sj:jgName>
        <sj:gridcol valign="top">
            <html:text name="createResourceAdapterForm" property="poolInit"/>
        </sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.poolinit"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.poolmin"/></sj:jgName>
        <sj:gridcol valign="top">
            <html:text name="createResourceAdapterForm" property="poolMin"/>
        </sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.poolmin"/></sj:gridcol>
      </sj:gridrow>
      
       <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.poolmax"/></sj:jgName>
        <sj:gridcol valign="top">
            <html:text name="createResourceAdapterForm" property="poolMax"/>
        </sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.poolmax"/></sj:gridcol>
      </sj:gridrow>
      
       <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.poolmaxage"/></sj:jgName>
        <sj:gridcol valign="top">
            <html:text name="createResourceAdapterForm" property="poolMaxAge"/>
        </sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.poolmaxage"/></sj:gridcol>
      </sj:gridrow>
      
       <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.pstmtmax"/></sj:jgName>
        <sj:gridcol valign="top">
            <html:text name="createResourceAdapterForm" property="pstmtMax"/>
        </sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.pstmtmax"/></sj:gridcol>
      </sj:gridrow>
      
       <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.poolmaxopentime"/></sj:jgName>
        <sj:gridcol valign="top">
            <html:text name="createResourceAdapterForm" property="poolMaxOpenTime"/>
        </sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.poolmaxopentime"/></sj:gridcol>
      </sj:gridrow>
      
       <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.poolmaxwaiters"/></sj:jgName>
        <sj:gridcol valign="top">
            <html:text name="createResourceAdapterForm" property="poolMaxWaiters"/>
        </sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.poolmaxwaiters"/></sj:gridcol>
      </sj:gridrow>
      
       <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.poolmaxwaittime"/></sj:jgName>
        <sj:gridcol valign="top">
            <html:text name="createResourceAdapterForm" property="poolMaxWaittime"/>
        </sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.poolmaxwaittime"/></sj:gridcol>
      </sj:gridrow>
      
       <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.poolsamplingperiod"/></sj:jgName>
        <sj:gridcol valign="top">
            <html:text name="createResourceAdapterForm" property="poolSamplingPeriod"/>
        </sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.poolsamplingperiod"/></sj:gridcol>
      </sj:gridrow>
       <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.poolsamplingperiod"/></sj:jgName>
        <sj:gridcol valign="top">
            <html:text name="createResourceAdapterForm" property="poolSamplingPeriod"/>
        </sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.poolsamplingperiod"/></sj:gridcol>
      </sj:gridrow>
      </sj:jonasgrid>
      
      
      <sj:jonasgrid>
       <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="label.resourceadapter.jdbcconparam"/></sj:jgColTitle>
      </sj:jgRowTitle>
      </sj:jonasgrid>
      
      <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.checklevel"/></sj:jgName>
        <sj:gridcol valign="top">
             <html:select property="checkLevel" name="createResourceAdapterForm">
            <bean:define id="listCheckingLevels" name="createResourceAdapterForm" property="checkingLevels"/>
            <html:options collection="listCheckingLevels" property="value" labelProperty="label"/>
          </html:select>
        </sj:gridcol>
        
       
        
        
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.checklevel"/></sj:gridcol>
      </sj:gridrow>
      </sj:jonasgrid>
      
      
      
      <sj:jonasgrid>
       <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="label.resourceadapter.jonasconfigproperties"/></sj:jgColTitle>
      </sj:jgRowTitle>
      </sj:jonasgrid>
      
      <sj:jonasgrid>
       <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.dsclass"/></sj:jgName>
        <sj:gridcol valign="top">
            <html:text name="createResourceAdapterForm" property="dsClass"/>
        </sj:gridcol>
      </sj:gridrow>
      
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.url"/></sj:jgName>
        <sj:gridcol valign="top">
            <html:text name="createResourceAdapterForm" property="URL"/>
        </sj:gridcol>
      </sj:gridrow>
      
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.user"/></sj:jgName>
        <sj:gridcol valign="top">
            <html:text name="createResourceAdapterForm" property="user"/>
        </sj:gridcol>
      </sj:gridrow>
      
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.password"/></sj:jgName>
        <sj:gridcol valign="top">
            <html:text name="createResourceAdapterForm" property="password"/>
        </sj:gridcol>
      </sj:gridrow>
      
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.logintimeout"/></sj:jgName>
        <sj:gridcol valign="top">
            <html:text name="createResourceAdapterForm" property="loginTimeout"/>
        </sj:gridcol>
      </sj:gridrow>
      
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.isolationlevel"/></sj:jgName>
        <sj:gridcol valign="top">
            <html:text name="createResourceAdapterForm" property="isolationLevel"/>
        </sj:gridcol>
      </sj:gridrow>
      
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.mappername"/></sj:jgName>
        <sj:gridcol valign="top">
            <html:text name="createResourceAdapterForm" property="mapperName"/>
        </sj:gridcol>
      </sj:gridrow>
      
      
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.configlogtopic"/></sj:jgName>
        <sj:gridcol valign="top">
            <html:text name="createResourceAdapterForm" property="configLogTopic"/>
        </sj:gridcol>
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

