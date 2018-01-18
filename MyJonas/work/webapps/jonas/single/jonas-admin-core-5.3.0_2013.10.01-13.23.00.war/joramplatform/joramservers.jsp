
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
  <sj:tab forward="ActionEditJoramPlatform"><bean:message key="tab.joramplatform"/></sj:tab>
  <sj:tab forward="JoramServers" selected="true"><bean:message key="tab.joramservers"/></sj:tab>
  <sj:tab forward="JoramXml"><bean:message key="tab.joramxml"/></sj:tab>
  <sj:panel>
     
     <bean:size id="listSize" name="joramPlatformForm" property="remoteServers"/>
     
     <sj:jonasgrid>
       <sj:jgRowTitle>
             <sj:jgColTitle><bean:message key="label.joramplatform.joramserver.serverId"/></sj:jgColTitle>
             <sj:jgColTitle><bean:message key="label.joramplatform.joramserver.serverDmq"/></sj:jgColTitle>
             <sj:jgColTitle><bean:message key="label.joramplatform.joramserver.serverThreshold"/></sj:jgColTitle>
        </sj:jgRowTitle>
        <sj:gridrow>
     	   <sj:gridcol>
     		<html:link forward="ActionEditJoramServer" styleClass="panel"
     		    paramId="id" paramName="joramPlatformForm" paramProperty="localServer">
     		    <logic:equal name="collocatedServer" value="true">
                    <bean:message key="title.joramservers.localserver"/>
                </logic:equal>
                <logic:notEqual name="collocatedServer" value="true">
                    <bean:message key="title.joramservers.currentserver"/>
                </logic:notEqual>
            	<bean:write name="joramPlatformForm" property="localServer"/>
            </html:link>
     	   </sj:gridcol>
           <sj:gridcol>
                 <logic:present name="joramPlatformForm" property="defaultDMQ">
                     <bean:write name="joramPlatformForm"  property="defaultDMQ"/>
              	 </logic:present>  
                 <logic:notPresent name="joramPlatformForm" property="defaultDMQ">
              		  <bean:message key="label.joramadmin.dmq.notset"/>
              	 </logic:notPresent>    
           </sj:gridcol>
           <sj:gridcol>
                 <logic:equal name="joramPlatformForm" property="defaultThreshold" value="-1">
                     <bean:message key="label.joramadmin.dmq.notset"/>
                 </logic:equal>
                 <logic:notEqual name="joramPlatformForm" property="defaultThreshold" value="-1">
                     <bean:write name="joramPlatformForm"  property="defaultThreshold"/>
                 </logic:notEqual>
           </sj:gridcol>
     	</sj:gridrow>
     	
        <logic:iterate id="item" name="joramPlatformForm" property="remoteItemServers">
            <sj:gridrow>
                <sj:gridcol>
     					<html:link forward="ActionEditJoramServer" styleClass="panel" paramId="id" paramName="item" paramProperty="id">
     						<bean:message key="message.remoteservers.server"/>
            				<bean:write name="item"  property="id"/>
            			</html:link>
                 </sj:gridcol>
                 <sj:gridcol>
                 <logic:present name="item" property="defaultDMQ">
              		    <bean:write name="item"  property="defaultDMQ"/>
              	 </logic:present>  
                 <logic:notPresent name="item" property="defaultDMQ">
              		    <bean:message key="label.joramadmin.dmq.notset"/>
              	 </logic:notPresent>    
              	 </sj:gridcol>
                 <sj:gridcol>
                 <logic:equal name="item" property="defaultThreshold" value="-1">
                     <bean:message key="label.joramadmin.dmq.notset"/>
                 </logic:equal>
                 <logic:notEqual name="item" property="defaultThreshold" value="-1">
                     <bean:write name="item"  property="defaultThreshold"/>
                 </logic:notEqual>
                 </sj:gridcol>
             </sj:gridrow>
         </logic:iterate>
     </sj:jonasgrid>

  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>


