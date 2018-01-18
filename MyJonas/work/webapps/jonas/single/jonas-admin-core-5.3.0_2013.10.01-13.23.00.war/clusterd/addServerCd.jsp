<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj"%>

<html:html locale="true">
<%@ include file="../common/begin.jsp"%>
<%
String cdName = (String) request.getAttribute("clusterdName");
%>
<body class="content">
<html:form action="/ApplyJonasServersClusterDaemon">
<html:hidden property="action"/>
<bean:define id="clusterdName" value="cdName"/>
  <sj:titleContent usingWhere="true" tomThumb="true" />
  <sj:tabs usingWhere="true" heightTab="20">
    <sj:tab forward="ActionDaemonProxyClusterInfo">
      <%=cdName%> infos
    </sj:tab>
    <sj:tab forward="ActionCreateJonasServer" selected="true">
      <bean:message key="tab.cd.server.add" />
    </sj:tab>
    <input name="action" type="hidden" value="add" />
    <bean:size id="listSize" name="freeServersList" />
    <sj:panel>
      <logic:equal name="listSize" value="0">
        <bean:message key="message.domain.clds.free.none" />
      </logic:equal>
      <logic:notEqual name="listSize" value="0">
      <sj:jonasgrid>
            <sj:gridrow changeStyle="true">
              <sj:gridcol>
                <sj:grid cellPadding="10">
                <sj:gridrow>
                <sj:gridcol>
                <sj:jonasbutton
                  href="javascript:submitHidden('itemsServersForm','action','add')"
                  disabled="false" styleClass="button">
                  Add Server
                </sj:jonasbutton>
                </sj:gridcol>

                 <sj:gridcol>
                <sj:jonasbutton
                  href="javascript:submitHidden('itemsServersForm','action','addAndSave')"
                  disabled="false" styleClass="button">
                  Add Server & Save
                </sj:jonasbutton>
                </sj:gridcol>
                <sj:gridcol>
                <sj:jonasbutton
                  href="javascript:submitHidden('itemsServersForm','action','removeFromView')"
                  disabled="false" styleClass="button">
                  Remove from view
                </sj:jonasbutton>
                </sj:gridcol>

                </sj:gridrow>


                </sj:grid>
              </sj:gridcol>
            </sj:gridrow>
      </sj:jonasgrid>



        <sj:jonasgrid>
          <logic:iterate id="item" name="freeServersList">
           <sj:gridrow>
            <bean:define id="serverName" name="item" property="name"></bean:define>
              <logic:equal name="item" property="isConfiguredForClusterd" value="true">
             <sj:gridcol width="5%">
                <html:multibox property="selectedItems" disabled="false">
                  <bean:write name="item" property="name" />
                </html:multibox>
              </sj:gridcol>
              </logic:equal>
              <logic:notEqual name="item" property="isConfiguredForClusterd" value="true">
              <sj:gridcol width="5%">
                <html:multibox property="selectedItems" disabled="true">
                  <bean:write name="item" property="name" />
                </html:multibox>
              </sj:gridcol>
              </logic:notEqual>
              <sj:gridcol width="5%">
                <!-- here we write the server name -->
                <bean:write name="item" property="name" />
              </sj:gridcol>
              <!--Writting the server state-->
              <sj:gridcol width="5%">
                <bean:write name="item" property="state" />
              </sj:gridcol>
              <logic:notEqual name="item" property="isConfiguredForClusterd" value="true">
                <!--if the server is not yet configuered for clusterd control-->
                <sj:gridcol width="5%">
          <logic:equal name="item" property="state" value="RUNNING">
            <html:img src="../images/icon/caution.png" title="Server is partially configured"/>
            <html:link forward="ActionDaemonProxyClusterConfigureServer"
                    styleClass="panel" paramId="server" paramName="serverName">
                    Configure
                  </html:link>

          </logic:equal>
          <logic:notEqual name="item" property="state" value="RUNNING">
                  <!--link to the server configuration page-->
                  <html:img src="../images/icon/info.png" title="Server is not yet configured"/>
                  <html:link forward="ActionDaemonProxyClusterConfigureServer"
                    styleClass="panel" paramId="server" paramName="serverName" >
                   Configure
                  </html:link>
                  </logic:notEqual>
                </sj:gridcol>
               </logic:notEqual>
               <logic:equal name="item" property="isConfiguredForClusterd" value="true">
               <!--server is configured for clusterd affectation-->
                 <sj:gridcol width="5%">
                  </sj:gridcol>
               </logic:equal>
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
      </logic:notEqual>
    </sj:panel>
  </sj:tabs>
</html:form>
<%@ include file="../common/end.jsp"%>
</body>
</html:html>
