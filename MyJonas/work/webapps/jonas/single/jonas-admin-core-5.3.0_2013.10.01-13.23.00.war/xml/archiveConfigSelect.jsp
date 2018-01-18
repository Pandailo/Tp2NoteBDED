<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ArchiveConfig">
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <bean:define id="isDomain" name="archiveConfigForm" property="isDomain"/>
  <logic:equal name="isDomain" value="false">
    <sj:tab forward="ActionEditDeploy"><bean:message key="tab.deployment"/></sj:tab>
   </logic:equal>
      
  <logic:equal name="isDomain" value="true">
    <sj:tab forward="ActionEditDomainDeploy"><bean:message key="tab.deployment.domain"/></sj:tab>
  </logic:equal>
  <sj:tab forward="ActionEditUpload"><bean:message key="tab.deployment.upload"/></sj:tab>
  <sj:tab forward="ActionEditRemove"><bean:message key="tab.deployment.remove"/></sj:tab>
  <sj:tab forward="ActionArchiveConfigSelect" selected="true"><bean:message key="tab.configure"/></sj:tab>
   
   <sj:panel>
     <sj:jonasgrid>
      <sj:jgRowTitle level="2">
        <sj:jgColTitle><bean:message key="title.resource.datasources.action"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow changeStyle="true">
        <sj:jgName>
          <sj:jonasbutton forward="ActionCreateResourceAdapter">
            <bean:message key="button.rar.action.create"/>
          </sj:jonasbutton>
        </sj:jgName>
        <sj:jgValue><bean:message key="comment.rar.action.create"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
      </sj:gridrow>
    </sj:jonasgrid>
    <sj:grid cellPadding="2" width="100%">
      <bean:size id="deployableSize" name="archiveConfigForm" property="deployable"/>
      <logic:notEqual name="deployableSize" value="0">
        <sj:gridrow>
          <sj:gridcol><b><bean:message key="message.config.selectArchive"/></b></sj:gridcol>
        </sj:gridrow>
        <sj:gridrow>
          <sj:gridcol>
		    <html:select property="archiveName" styleClass="deploy" style="width:100%" size="10">
		       <html:options property="deployable"/>
		    </html:select>
          </sj:gridcol>
        </sj:gridrow>
        <sj:gridrow>
          <sj:gridcol>
		    <html:radio property="pathName" value="META-INF/ra.xml"/>META-INF/ra.xml <br/>
		    <html:radio property="pathName" value="META-INF/jonas-ra.xml"/>META-INF/jonas-ra.xml <br/>
          </sj:gridcol>
        </sj:gridrow>        
        <sj:gridrow>
          <sj:gridcol><html:submit styleClass="button"><bean:message key="button.config.configure"/></html:submit></sj:gridcol>
        </sj:gridrow>
      </logic:notEqual>
      <logic:equal name="deployableSize" value="0">
        <sj:gridrow styleClass="errors">
          <sj:gridcol><bean:message key="message.config.none"/></sj:gridcol>
        </sj:gridrow>
      </logic:equal>
    </sj:grid>   
       
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

