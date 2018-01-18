<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>
<%@ page import="java.util.Map"%>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>
<script>
function changedPolicy(self) {
  if(self.value == "Default") {
    for(var i in document.forms) {
      var form = document.forms[i]
      for(var j in form.elements) {
        var element = form.elements[j]
        if(element.type == "select-one") {
          if(element != self && element.value == "Default") {
            element.value = "Disabled"
          }
        }
      }
    }
  }
}
</script>

<body class="content">
<html:form action="/ApplyWebAppVirtualCatalina">
  <input type="hidden" name="on" value="<bean:write name='objectName'/>"/>

  <sj:titleContent usingWhere="true" tomThumb="true"/>
  <sj:tabs usingWhere="true" heightTab="20">
    <sj:tab forward="ActionListWebContainers"><bean:message key="tab.webcontainers"/></sj:tab>
    <sj:tab forward="ActionEditWebApp" selected="true"><bean:write name="webAppVirtualCatalinaForm" property="labelPathContext"/></sj:tab>
    <sj:panel>
      <sj:jonasgrid>
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="label.virtual.version"/></sj:jgColTitle>
          <sj:jgColTitle><bean:message key="label.virtual.policy"/></sj:jgColTitle>
          <sj:jgColTitle><bean:message key="label.virtual.sessions"/></sj:jgColTitle>
          <sj:jgColTitle><bean:message key="label.virtual.setAs"/></sj:jgColTitle>
          <sj:jgColTitle/>
        </sj:jgRowTitle>
        <logic:iterate id="context" name="contexts">
          <sj:gridrow valign="top">
            <sj:gridcol>
              <%
                request.setAttribute("tempON", ((String)
                    (
                        ((Map)(request.getAttribute("objectNames"))).get(
                            ((Map.Entry)context).getKey()
                        )
                    )));
              %>
              <html:link forward="ActionEditWebApp" paramId="on" paramName="tempON" styleClass="panel"><bean:write name="context" property="key"/></html:link>
            </sj:gridcol>
            <sj:gridcol>
              <bean:write name="context" property="value"/>
            </sj:gridcol>
            <sj:gridcol>
              <%=((Integer)(((Map)(request.getAttribute("nbSessions"))).get(((Map.Entry)context).getKey())))%>
            </sj:gridcol>
            <sj:gridcol>
              <select name="<bean:write name='context' property='key'/>" onChange="changedPolicy(this)">
                <logic:iterate id="policy" name="policies">
                  <option name="<bean:write name='policy'/>"
                  <logic:equal name="context" property="value" value="<%=((String)policy)%>">
                     selected="selected"
                  </logic:equal>
                  ><bean:write name="policy"/></option>
                </logic:iterate>
              </select>
            </sj:gridcol>
            <sj:gridcol>
              <html:submit property="btn_apply" styleClass="button"><bean:message key="button.apply"/></html:submit>       
            </sj:gridcol>
          </sj:gridrow>
        </logic:iterate>
      </sj:jonasgrid>
      <sj:panelSeparator/>
 
    
      <sj:jonasgrid globalRowStyleClass="panel">
        <sj:gridrow>
         <sj:gridcol align="center">
            <sj:jonasbutton forward="ActionEditWebAppCatalina" paramId="on" paramName="objectName">
              <bean:message key="action.button.services.refresh"/>
            </sj:jonasbutton>
         </sj:gridcol>
        </sj:gridrow>
      </sj:jonasgrid>
    </sj:panel>
  </sj:tabs>
</html:form>
<%@ include file="../common/end.jsp" %>
</body>
</html:html>