<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj"%>

<html:html locale="true">
<%@ include file="../common/begin.jsp"%>
<body class="content">
<html:form action="/DisplayCmiProtocolInfo">
<bean:define id="currentProtocol" name="cmiProtocolForm" property="protocol"/>
<html:hidden property="action" value="display"/>
  <sj:titleContent usingWhere="true" tomThumb="true" />
  <sj:tabs usingWhere="true" heightTab="20">
      <sj:tab forwardControl="ActionEditJonasServer">
        <bean:message key="tab.server.jonas" />
      </sj:tab>
      <sj:tab forward="ActionEditJmxServer">
        <bean:message key="tab.server.jmx" />
      </sj:tab>
      <sj:tab forward="ActionDisplayCmi"><bean:message key="tab.server.services.cmi"/></sj:tab>
    <sj:tab forward="ActionDisplayCmiProtocol" selected="true">
        <bean:message key="tab.server.services.cmi.protocol" />
    </sj:tab>
    <sj:tab forward="ActionListRegistry"><bean:message key="tab.server.registry"/></sj:tab>
    <sj:panel>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle>
          <bean:message key="title.global"/>
        </sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
    <sj:gridrow>
        <sj:gridcol width="15%">
            <div class="boldText"><bean:message key="label.domain.name"/></div>
        </sj:gridcol>
        <sj:gridcol width="100%">
             <bean:write name="currentProtocol" property="name"/>
        </sj:gridcol>
    </sj:gridrow>
    </sj:jonasgrid>
     <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle>
          <bean:message key="tab.server.services.cmi.cluster.servers"/>
        </sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
        <logic:iterate id="provider" name="currentProtocol" property="providers">
           <sj:gridrow>
                      <sj:gridcol width="100%">
                        <html:img src="../images/icon/bullet.png" title="Cluster object" />&nbsp;<html:link
                          forward="ActionCmiServer" styleClass="panel"
                          paramId="providerUrl" paramName="provider" paramProperty="url">
                          <bean:write name="provider" property="url" />
                        </html:link>
                      </sj:gridcol>
           </sj:gridrow>
         </logic:iterate>
      </sj:jonasgrid>
    </sj:panel>
  </sj:tabs>
</html:form>
<%@ include file="../common/end.jsp"%>
</body>
</html:html>
