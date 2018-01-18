<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">

<html:form action="/ApplyStackDump">
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20" height="500" >
   <sj:tab forward="ActionEditMonitoring"><bean:message key="tab.monitoring.general"/></sj:tab>
    <sj:tab forward="ActionEditMemory"><bean:message key="tab.monitoring.memory"/></sj:tab>
    <sj:tab forward="ActionEditStackDump" selected="true"><bean:message key="tab.monitoring.stackdump"/></sj:tab>
    <sj:panel>
    <object width="100%" height="100%">
    <param name="movie" value="../swf-server-stackdump.swf">
    <embed src="../swf-server-stackdump.swf" width="100%" height="100%">
    </embed>
  </object>
    </sj:panel>
</sj:tabs>
</html:form>

<%@ include file="../common/end.jsp"%>
</body>
</html:html>