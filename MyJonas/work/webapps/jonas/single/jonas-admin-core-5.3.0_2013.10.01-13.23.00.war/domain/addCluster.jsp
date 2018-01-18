<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ApplyCluster">
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionEditDomain"><bean:message key="tab.domain"/></sj:tab>
  <sj:tab forward="ActionCreateCluster" selected="true"><bean:message key="tab.domain.cluster.create"/></sj:tab>
  <sj:panel>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName>
          <logic:equal name="domainForm" property="cluster" value="false">
            <bean:message key="label.domain.domainName"/>
          </logic:equal>
          <logic:equal name="domainForm" property="cluster" value="true">
            <bean:message key="label.domain.parentClusterName"/>
          </logic:equal>
        </sj:jgName>
        <sj:jgValue><bean:write name="domainForm" property="name"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.domain.clusterName"/></sj:jgName>
        <sj:jgValue><html:text name="newClusterForm" property="clusterName" size="20"/></sj:jgValue>
        <sj:gridcol><bean:message key="comment.domain.create.clusterName"/></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>
    <sj:panelSeparator/>

    <sj:jonasgrid globalRowStyleClass="panel">
      <sj:gridrow>
        <sj:jgName></sj:jgName>
        <sj:gridcol>
          <html:submit property="btn_apply" styleClass="button"><bean:message key="button.apply"/></html:submit>
        </sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>
</html:form>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>