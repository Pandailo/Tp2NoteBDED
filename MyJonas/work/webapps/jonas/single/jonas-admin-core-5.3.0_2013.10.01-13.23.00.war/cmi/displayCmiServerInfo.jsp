<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj"%>

<html:html locale="true">
<%@ include file="../common/begin.jsp"%>
<body class="content">
<html:form action="/CmiServer">
<html:hidden property="action"/>
  <sj:titleContent usingWhere="true" tomThumb="true" />
  <sj:tabs usingWhere="true" heightTab="20">
      <sj:tab forwardControl="ActionEditJonasServer">
        <bean:message key="tab.server.jonas" />
      </sj:tab>
      <sj:tab forward="ActionEditJmxServer">
        <bean:message key="tab.server.jmx" />
      </sj:tab>
      <sj:tab forward="ActionDisplayCmi"><bean:message key="tab.server.services.cmi"/></sj:tab>
    <sj:tab forward="ActionDisplayCmiProtocol">
        <bean:message key="tab.server.services.cmi.protocol" />
    </sj:tab>
    <sj:tab forward="ActionCmiServer" selected="true">
        <bean:message key="tab.server.services.cmi.server" />
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
                <div class="boldText"><bean:message key="title.server.registry.providerUrl"/></div>
            </sj:gridcol>
            <sj:gridcol width="100%">
                <bean:write name="cmiServerForm" property="url"/>
            </sj:gridcol>
        </sj:gridrow>

        <sj:gridrow>
            <sj:gridcol width="15%">
                <div class="boldText"><bean:message key="label.server.jonas.protocols"/></div>
            </sj:gridcol>
            <sj:gridcol width="100%">
                <bean:write name="cmiServerForm" property="protocol"/>
            </sj:gridcol>
        </sj:gridrow>

        <sj:gridrow>
              <sj:gridcol width="15%">
                <div class="boldText"><bean:message key="tab.server.services.cmi.server.loadfactor" /> </div>&nbsp;&nbsp;&nbsp;
              </sj:gridcol>
              <sj:gridcol width="100%">
                <html:text name="cmiServerForm" property="loadFactor"  styleClass='<%=(String)request.getAttribute("htmlTextLoadFactor")%>' styleId="loadFactor">
                  <bean:write name="cmiServerForm" property="loadFactor" />
                </html:text>&nbsp;&nbsp;&nbsp;
                <button type="button" onclick="javascript:submitHidden('cmiServerForm','action','loadfactor')" class="button">
                <bean:message key="title.modify" />
                </button>
              </sj:gridcol>
            </sj:gridrow>
       </sj:jonasgrid>
        <logic:present name="<%=Globals.ERROR_KEY%>">
          <sj:jonasgrid>
            <sj:gridrow styleClass="errors">
              <sj:gridcol styleClass="errors">
                <html:errors />
              </sj:gridcol>
            </sj:gridrow>
          </sj:jonasgrid>
          <sj:panelSeparator />
        </logic:present>
    </sj:panel>
  </sj:tabs>
</html:form>
<%@ include file="../common/end.jsp"%>
</body>
</html:html>
