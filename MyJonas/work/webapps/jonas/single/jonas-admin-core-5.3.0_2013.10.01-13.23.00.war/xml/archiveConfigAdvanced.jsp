<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>
<script language="Javascript">
function confirmNoSave(oldFileName) {
    var confirm = window.confirm('Are you sure you want to switch files?\n All modifications to ' 
    + oldFileName + ' will be lost.');
	  return confirm;
}
</script>
<html:html locale="true">
<%@ include file="../common/begin.jsp" %>
<body class="content">
<html:form action="/ApplyArchiveConfig">
<sj:titleContent usingWhere="true" tomThumb="true"/>
<bean:define id="ra" name="archiveConfigForm" property="values(raXmlFileName)" type="String" />
<bean:define id="jonasra" name="archiveConfigForm" property="values(jonasRaXmlFileName)" type="String" />

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
  
  <sj:grid cellPadding="2" width="100%">
  	<sj:jgRowTitle>
  		<sj:jgColTitle><bean:message key="message.config.archiveConfig"/></sj:jgColTitle>
  		<sj:jgColTitle> </sj:jgColTitle>  		
  	</sj:jgRowTitle>
  	<sj:gridrow>
  		<sj:gridcol><bean:message key="message.config.archiveName"/></sj:gridcol>
  		<sj:gridcol><bean:write name="archiveConfigForm" property="archiveName" /></sj:gridcol>  		
  	</sj:gridrow>
  	<sj:gridrow>
  		<sj:gridcol><bean:message key="message.config.fileName"/></sj:gridcol>
  		<sj:gridcol><bean:write name="archiveConfigForm" property="pathName" /></sj:gridcol>  		
  	</sj:gridrow>
  </sj:grid>     
 
  <logic:present name="<%=Globals.ERROR_KEY%>">
      <sj:jonasgrid>
        <sj:gridrow styleClass="errors">
          <sj:gridcol styleClass="errors"><html:errors/></sj:gridcol>
        </sj:gridrow>
      </sj:jonasgrid>
    </logic:present>
  
  <html:hidden property="configType" value="1"/>  

	<sj:grid width="100%">    
	   	<sj:gridrow>
  			<sj:gridcol>
			    <html:submit styleClass="button" property="submit"><bean:message key="button.apply"/></html:submit>  
			    <html:submit styleClass="button" property="cancel"><bean:message key="button.cancel"/></html:submit>  
			</sj:gridcol>
			<sj:gridcol align="right">
		 		<bean:message key="label.config.switchTo"/>
 				<logic:equal name="archiveConfigForm" property="pathName" value="META-INF/ra.xml">
		 			<html:link forward="ActionArchiveConfigAdvanced" paramId="file"  onclick="return confirmNoSave('META-INF/ra.xml')" paramName="jonasra">jonas-ra.xml</html:link><br/>
 				</logic:equal>
		 		<logic:equal name="archiveConfigForm" property="pathName" value="META-INF/jonas-ra.xml">
 					<html:link forward="ActionArchiveConfigAdvanced" paramId="file"  onclick="return confirmNoSave('META-INF/jonas-ra.xml')" paramName="ra">ra.xml</html:link><br/>
		 		</logic:equal> 		  						
			</sj:gridcol>					
			<sj:gridcol align="right">
			    <html:submit styleClass="longButton" property="switchTo"><bean:message key="button.config.switchToForm"/></html:submit>    			
			</sj:gridcol>  		
	  	</sj:gridrow> 
  	</sj:grid>
  <sj:panelSeparator/>
  
  <html:textarea name="archiveConfigForm" property="xml" cols="100" rows="50" />
  
  <sj:panelSeparator/>
  
 	<sj:grid width="100%">  
	   	<sj:gridrow>
  			<sj:gridcol>
			    <html:submit styleClass="button" property="submit"><bean:message key="button.apply"/></html:submit>  
			    <html:submit styleClass="button" property="cancel"><bean:message key="button.cancel"/></html:submit>  
			</sj:gridcol>
  			<sj:gridcol align="right">
			    <html:submit styleClass="longButton" property="switchTo"><bean:message key="button.config.switchToForm"/></html:submit>    			
			</sj:gridcol>  		
	  	</sj:gridrow> 
  	</sj:grid>
  	
  </sj:panel>
</sj:tabs>



</html:form>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>
