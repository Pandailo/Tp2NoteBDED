<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../../common/begin.jsp" %>

<script type="text/javascript">
function refresh()
{
  rfsh = new Date() ;
  rfsh = "?"+rfsh.getTime();
  document.images["memory"].src = "<%=response.encodeURL("/jonasAdmin/ServerCurrentTxServlet")%>"+rfsh;
  setTimeout("refresh()", 7000);
}
</script>


<body class="content">
<html:form action="/ApplyMemory" focus="numberOfMeasures">
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionDisplayNodeInfo">Server's infos</sj:tab>
  <sj:tab forward="ActionSeverTransactionsCount" selected="true">Tx Graph</sj:tab>
  <sj:panel>
    <logic:notPresent name="<%=Globals.ERROR_KEY%>">
    <sj:jonasgrid globalRowStyleClass="panel">
      <sj:gridrow>
        <sj:gridcol>
          <img src="<%=response.encodeURL("/jonasAdmin/ServerCurrentTxServlet")%>" name="memory">
          <script type="text/javaScript">
            if (document.images) { setTimeout("refresh()", 100); }
          </script>
        </sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>
    </logic:notPresent>
    <sj:panelSeparator/>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="get.title.monitoring.memory"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <logic:present name="<%=Globals.ERROR_KEY%>">
      <sj:jonasgrid>
        <sj:gridrow styleClass="errors">
          <sj:gridcol styleClass="errors"><html:errors/></sj:gridcol>
        </sj:gridrow>
      </sj:jonasgrid>
    </logic:present>
    <sj:jonasgrid globalRowStyleClass="panel">
      <sj:gridrow>
        <sj:jgName><bean:message key="get.label.monitoring.memory.numberOfMeasures"/></sj:jgName>
        <sj:jgValue><html:text property="numberOfMeasures"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="get.label.monitoring.memory.range"/></sj:jgName>
        <sj:jgValue><html:text property="range"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName></sj:jgName>
        <sj:jgValue><html:submit styleClass="button" disabled="true"><bean:message key="button.apply"/></html:submit></sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>
</html:form>

<%@ include file="../../common/end.jsp" %>
</body>
</html:html>

