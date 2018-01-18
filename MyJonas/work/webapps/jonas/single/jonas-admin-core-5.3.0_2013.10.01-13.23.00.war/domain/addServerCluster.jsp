<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ApplyJonasServer">
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionEditDomain"><bean:message key="tab.domain"/></sj:tab>
  <sj:tab forward="ActionCreateJonasServer" selected="true"><bean:message key="tab.domain.server.add"/></sj:tab>
  <sj:panel>

    <bean:size id="listSize" name="newServerForm" property="serverNames"/>

    <logic:equal name="listSize" value="0">
      <sj:jonasgrid>
        <sj:gridrow>
          <sj:gridcol>No servers to add</sj:gridcol>
        </sj:gridrow>
      </sj:jonasgrid>
    </logic:equal>
    <logic:notEqual name="listSize" value="0">
      <sj:jonasgrid>
          <sj:gridrow>
            <sj:jgName>Cluster name</sj:jgName>
            <sj:jgValue><bean:write name="domainForm" property="name"/></sj:jgValue>
        </sj:gridrow>
          <sj:gridrow>
            <sj:jgName></sj:jgName>
            <sj:jgValue></sj:jgValue>
        </sj:gridrow>
      </sj:jonasgrid>

      <sj:panelSeparator/>

      <sj:jonasgrid>
        <logic:iterate id="item" name="newServerForm" property="serverNames">
        <sj:gridrow>
          <sj:gridcol width="5%">
            <html:multibox name="newServerForm" property="selectedItems">
              <bean:write name="item"/>
            </html:multibox>
          </sj:gridcol>
          <sj:gridcol>
            <bean:write name="item"/>
          </sj:gridcol>
        </sj:gridrow>
        </logic:iterate>
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
    </logic:notEqual>

    <logic:present name="<%=Globals.ERROR_KEY%>">
      <sj:jonasgrid>
        <sj:gridrow styleClass="errors">
          <sj:gridcol styleClass="errors"><html:errors/></sj:gridcol>
        </sj:gridrow>
      </sj:jonasgrid>
      <sj:panelSeparator/>
    </logic:present>
  </sj:panel>
</sj:tabs>
</html:form>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>