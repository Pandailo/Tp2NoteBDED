<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj"%>

<html:html locale="true">
<%@ include file="../common/begin.jsp"%>
<body class="content">
<script type="text/javascript">
var displayUserClusterTitle = 0;
</script>
  <html:form action="/DisplayCmi">
    <html:hidden property="action" />
    <html:hidden property="serverUrl" />
    <sj:titleContent usingWhere="true" tomThumb="true" />
    <sj:tabs usingWhere="true" heightTab="20">
      <sj:tab forwardControl="ActionEditJonasServer">
        <bean:message key="tab.server.jonas" />
      </sj:tab>
      <sj:tab forward="ActionEditJmxServer">
        <bean:message key="tab.server.jmx" />
      </sj:tab>
      <sj:tab forward="ActionDisplayCmi" selected="true"><bean:message key="tab.server.services.cmi"/></sj:tab>
      <sj:tab forward="ActionListRegistry"><bean:message key="tab.server.registry"/></sj:tab>
      <logic:present name="newcmi">
        <sj:panel>
          <sj:jonasgrid>
            <sj:gridrow>
              <sj:gridcol>
              <bean:message key="title.global"/>
       </sj:gridcol>
            </sj:gridrow>
          </sj:jonasgrid>
        </sj:panel>
      </logic:present>
      <logic:notPresent name="newcmi">
        <sj:panel>
          <sj:jonasgrid>
            <sj:jgRowTitle>
              <sj:jgColTitle>
            CMI Global Properties
          </sj:jgColTitle>
            </sj:jgRowTitle>
          </sj:jonasgrid>
          <sj:jonasgrid>
            <sj:gridrow>
              <sj:gridcol width="15%">
                <div class="boldText"><bean:message key="tab.server.services.cmi.refreshTime" /> </div>&nbsp;&nbsp;&nbsp;
              </sj:gridcol>
              <sj:gridcol width="100%">
                <html:text name="cmiForm" property="delayToRefresh"  styleClass='<%=(String)request.getAttribute("htmlTextStyle")%>' styleId="delayToRefresh">
                  <bean:write name="cmiForm" property="delayToRefresh" />
                </html:text>&nbsp;&nbsp;&nbsp;
                <button type="button" onclick="javascript:submitHidden('cmiForm','action','refresh')" class="button">
                <bean:message key="title.modify" />
                </button>
              </sj:gridcol>
            </sj:gridrow>
          </sj:jonasgrid>
          <!-- protocols -->
          <sj:jonasgrid>
            <sj:jgRowTitle>
              <sj:jgColTitle>
            <bean:message key="tab.server.services.cmi.protocols" />
          </sj:jgColTitle>
            </sj:jgRowTitle>
          </sj:jonasgrid>

          <sj:jonasgrid>
            <logic:iterate id="protocol" name="cmiForm" property="protocols">
              <sj:gridrow>
                <sj:gridcol width="100%">
                <html:link
                          forward="ActionDisplayCmiProtocol" styleClass="panel"
                          paramId="protocol" paramName="protocol" paramProperty="name">
                <bean:write name="protocol" property="name" /> </html:link>&nbsp;&nbsp;&nbsp;
                </sj:gridcol>
              </sj:gridrow>
            </logic:iterate>
          </sj:jonasgrid>

           <!-- All servers Servers -->
          <sj:jonasgrid>
          <sj:jgRowTitle>
                <sj:jgColTitle><bean:message key="title.server.registry.providersUrl"/></sj:jgColTitle>
                <sj:jgColTitle><bean:message key="label.domain.name"/></sj:jgColTitle>
                <sj:jgColTitle><bean:message key="title.server.servlet.catalina.action"/></sj:jgColTitle>
            </sj:jgRowTitle>
          </sj:jonasgrid>
          <sj:jonasgrid>
            <logic:iterate id="protocol" name="cmiForm" property="protocols">
              <logic:iterate id="server" name="protocol" property="providers">
                 <sj:gridrow>
                  <sj:gridcol width="20%"><bean:write name="server" property="url"/></sj:gridcol>
                  <sj:gridcol width="20%"><bean:write name="server" property="name"/></sj:gridcol>
                  <sj:gridcol width="20%">
                  <bean:define id="srvUrl" name="server" property="url"/>
                    <logic:equal name="server" property="isBlackListed" value="false">
                    <button type="button" onclick="javascript:applyCmiServerAction('cmiForm','action','blacklist','serverUrl','<%=srvUrl%>')" class="button">
                           <bean:message key="tab.server.services.cmi.server.blacklist"/>
                    </button>
                    </logic:equal>
                    <logic:equal name="server" property="isBlackListed" value="true">
                    <button type="button" onclick="javascript:applyCmiServerAction('cmiForm','action','unblacklist','serverUrl','<%=srvUrl%>')" class="button">
                           <bean:message key="tab.server.services.cmi.server.unblacklist"/>
                    </button>
                    </logic:equal>
                  </sj:gridcol>
              </sj:gridrow>
              </logic:iterate>
            </logic:iterate>
          </sj:jonasgrid>



          <sj:jonasgrid globalRowStyleClass="panelTitle">
            <sj:jgRowTitle>
                <sj:jgColTitle>
                        <bean:message key="label.domain.clusters"/>
                </sj:jgColTitle>
            </sj:jgRowTitle>
          </sj:jonasgrid>
          <sj:jonasgrid>
            <logic:iterate id="clusterItem" name="cmiForm"
              property="cmiClusterList">
                <sj:gridrow>
                  <!-- Write the cluster name here -->
                  <sj:gridcol width="10%">
                     <html:link  forward="ActionCmiCluster" styleClass="panel" paramId="clusterItem" paramName="clusterItem" paramProperty="name">
                        <strong>
                            <bean:write name="clusterItem" property="name" />
                        </strong>
                    </html:link>
                    <logic:equal name="clusterItem" property="name" value="System">
                        &nbsp;&nbsp;&nbsp;<bean:message key="tab.server.services.cmi.cluster.system.comment"/>
                    </logic:equal>
                  </sj:gridcol>
                </sj:gridrow>
            </logic:iterate>
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
      </logic:notPresent>
    </sj:tabs>
  </html:form>
  <%@ include file="../common/end.jsp"%>
</body>
</html:html>
