<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj"%>
<html:html locale="true">
<%@ include file="../common/begin.jsp"%>
<body class="content">
<html:form action="/ApplyJonasServersClusterDaemon">
  <meta HTTP-EQUIV="Page-Enter" CONTENT="revealtrans(duration=4.0, transition=4)">
  <meta HTTP-EQUIV="Page-Exit" CONTENT="revealtrans(duration=4.0, transition=5)">
  <html:hidden property="action" />
  <bean:define id="cdName" name="daemonProxyClusterForm" property="name" />
  <sj:titleContent usingWhere="true" tomThumb="true" />
  <sj:tabs usingWhere="true" heightTab="20">
    <logic:equal name="isNotMonitoring" value="true">
      <!-- Configuration mode: display domain tab -->
      <sj:tab forward="ActionEditDomain">
        <bean:message key="tab.domain" />
      </sj:tab>
    </logic:equal>
    <sj:tab forward="ActionDaemonProxyClusterInfo" selected="true">
      <!--Write the clusterd name as tab title-->
      <bean:write name="cdName" /> <bean:message key="label.cd.infos" />
    </sj:tab>
    <sj:panel>
      <!-- cluster daemon properties -->
      <sj:jonasgrid>
        <sj:jgRowTitle>
          <sj:jgColTitle>
            <bean:message key="title.global" />
          </sj:jgColTitle>
        </sj:jgRowTitle>
      </sj:jonasgrid>
      <logic:equal name="daemonProxyClusterForm" property="state"
        value="RUNNING">
        <sj:jonasgrid>
          <!--Writting the title named "Global"-->
          <sj:gridrow>
            <!--label.domain.name==name-->
            <sj:gridcol width="27%">
              <bean:message key="label.domain.name" />
            </sj:gridcol>
            <sj:gridcol width="37%">
              <bean:write name="daemonProxyClusterForm" property="name" />
            </sj:gridcol>
            <sj:gridcol width="10%">
            </sj:gridcol>
          </sj:gridrow>
          <!-- The clusterd state -->
          <sj:gridrow>
            <!--label.service.jtm.moni.state==State-->
            <sj:gridcol width="27%">
              <bean:message key="label.service.jtm.moni.state" />
            </sj:gridcol>
            <sj:gridcol width="37%">
              <bean:write name="daemonProxyClusterForm" property="state" />
            </sj:gridcol>
            <sj:gridcol width="10%">
            </sj:gridcol>
          </sj:gridrow>
        </sj:jonasgrid>
        <!-- monitoring case -->
        <logic:notEqual name="isNotMonitoring" value="true">
          <!-- The clusterd jmx url-->
          <sj:jonasgrid>
            <sj:gridrow>
              <!--label.url==JMX Url-->
              <sj:gridcol width="27%">
                <bean:message key="label.url" />
              </sj:gridcol>
              <sj:gridcol width="37%">
                <bean:write name="daemonProxyClusterForm" property="jmxUrl" />
              </sj:gridcol>
              <sj:gridcol width="10%">
              </sj:gridcol>
            </sj:gridrow>
            <!--Runtime informations-->
            <sj:gridrow>
              <sj:gridcol width="25%"><bean:message key="label.server.jmx.SpecificationVendor" /></sj:gridcol>
              <sj:gridcol width="5%">
                <bean:write name="daemonProxyClusterForm"
                  property="runTimeSpecVendor" />
              </sj:gridcol>
              <sj:gridcol width="5%">
              </sj:gridcol>
            </sj:gridrow>
            <!-- Spec Version-->
            <sj:gridrow>
              <sj:gridcol width="5%"><bean:message key="label.server.jmx.SpecificationVersion" /></sj:gridcol>
              <sj:gridcol width="5%">
                <bean:write name="daemonProxyClusterForm"
                  property="runTimeSpecVersion" />
              </sj:gridcol>
              <sj:gridcol width="5%">
              </sj:gridcol>
            </sj:gridrow>
            <sj:gridrow>
              <!-- Vm Name-->
              <sj:gridcol width="5%"><bean:message key="tab.server.jvm" /></sj:gridcol>
              <sj:gridcol width="5%">
                <bean:write name="daemonProxyClusterForm"
                  property="runTimeVmName" />
              </sj:gridcol>
              <sj:gridcol width="5%">
              </sj:gridcol>
            </sj:gridrow>
            <!-- Vm Vendor-->
            <sj:gridrow>
              <sj:gridcol width="5%"><bean:message key="label.server.jvm.Vendor" /></sj:gridcol>
              <sj:gridcol width="5%">
                <bean:write name="daemonProxyClusterForm"
                  property="runTimeVmVendor" />
              </sj:gridcol>
              <sj:gridcol width="5%">
              </sj:gridcol>
            </sj:gridrow>
            <!-- Vm Version-->
            <sj:gridrow>
              <sj:gridcol width="5%"> <bean:message key="label.server.jvm.Version" /></sj:gridcol>
              <sj:gridcol width="5%">
                <bean:write name="daemonProxyClusterForm"
                  property="runTimeVmVersion" />
              </sj:gridcol>
              <sj:gridcol width="5%">
              </sj:gridcol>
            </sj:gridrow>
            <!-- Writting VM threading Infos -->
            <logic:iterate id="thDynAttribute" name="daemonProxyClusterForm"
              property="dynThread">
              <sj:gridrow>
                <sj:gridcol width="5%">
                  <bean:write name="thDynAttribute" property="name" />
                </sj:gridcol>
                <sj:gridcol width="5%">
                  <bean:write name="thDynAttribute" property="value" />
                </sj:gridcol>
                <sj:gridcol width="5%">
                </sj:gridcol>
              </sj:gridrow>
            </logic:iterate>

            <!-- Writting VM Loading Infos -->
            <logic:iterate id="loDynAttribute" name="daemonProxyClusterForm"
              property="dynLoading">
              <sj:gridrow>
                <sj:gridcol width="5%">
                  <bean:write name="loDynAttribute" property="name" />
                </sj:gridcol>
                <sj:gridcol width="5%">
                  <bean:write name="loDynAttribute" property="value" />
                </sj:gridcol>
                <sj:gridcol width="5%">
                </sj:gridcol>
              </sj:gridrow>
            </logic:iterate>

          </sj:jonasgrid>
          <!--OS infos-->
          <sj:jonasgrid>
            <sj:jgRowTitle>
              <sj:jgColTitle><bean:message key="label.cd.monitoring.os.infos" /></sj:jgColTitle>
            </sj:jgRowTitle>
          </sj:jonasgrid>
          <!-- Available Processors-->
          <sj:jonasgrid>
            <sj:gridrow>
              <sj:gridcol width="27%%"><bean:message key="label.cd.monitoring.os.name" /></sj:gridcol>
              <sj:gridcol width="37%%">
                <bean:write name="daemonProxyClusterForm"
                  property="operatingSystemName" />
              </sj:gridcol>
              <sj:gridcol width="10%">
              </sj:gridcol>
            </sj:gridrow>
            <sj:gridrow>
              <sj:gridcol width="5%"><bean:message key="label.cd.monitoring.os.architecture" /></sj:gridcol>
              <sj:gridcol width="5%">
                <bean:write name="daemonProxyClusterForm"
                  property="operatingSystemArch" />
              </sj:gridcol>
              <sj:gridcol width="5%">
              </sj:gridcol>
            </sj:gridrow>
            <sj:gridrow>
              <sj:gridcol width="5%"><bean:message key="label.cd.monitoring.os.availableprocessors" /></sj:gridcol>
              <sj:gridcol width="5%">
                <bean:write name="daemonProxyClusterForm"
                  property="operatingSystemAvailableProcessors" />
              </sj:gridcol>
              <sj:gridcol width="5%">
              </sj:gridcol>
            </sj:gridrow>
            <!-- OS version-->
            <sj:gridrow>
              <sj:gridcol width="5%"><bean:message key="label.cd.monitoring.os.version" /></sj:gridcol>
              <sj:gridcol width="5%">
                <bean:write name="daemonProxyClusterForm"
                  property="operatingSystemVersion" />
              </sj:gridcol>
              <sj:gridcol width="5%">
              </sj:gridcol>
            </sj:gridrow>
            <!-- Writting operating System dynamic attributes -->
            <logic:iterate id="osDynAttribute" name="daemonProxyClusterForm"
              property="osDynMemory">
              <sj:gridrow>
                <sj:gridcol width="5%">
                  <bean:write name="osDynAttribute" property="name" />
                </sj:gridcol>
                <sj:gridcol width="5%">
                  <bean:write name="osDynAttribute" property="value" />&nbsp;
                    <bean:write name="osDynAttribute" property="unit" />

                </sj:gridcol>
                <sj:gridcol width="5%">
                </sj:gridcol>
              </sj:gridrow>
            </logic:iterate>

          </sj:jonasgrid>
          <sj:jonasgrid>
            <sj:jgRowTitle>
              <sj:jgColTitle><bean:message key="label.cd.monitoring.vm.memory.infos" /></sj:jgColTitle>
            </sj:jgRowTitle>
          </sj:jonasgrid>
          <sj:jonasgrid>
            <logic:iterate id="dynAttribute" name="daemonProxyClusterForm"
              property="vmDynMemory">
              <sj:gridrow>
                <sj:gridcol width="27%">
                  <bean:write name="dynAttribute" property="name" />
                </sj:gridcol>
                <sj:gridcol width="37%">
                  <bean:write name="dynAttribute" property="value" />&nbsp;
                   <bean:write name="dynAttribute" property="unit" />
                </sj:gridcol>
                <sj:gridcol width="10%">
                </sj:gridcol>
              </sj:gridrow>
            </logic:iterate>
            <sj:gridrow>
              <sj:gridcol width="5%"><bean:message key="label.cd.monitoring.vm.memory.used.graph" /></sj:gridcol>
              <sj:gridcol width="5%">
                <sj:jonasbutton forward="ActionEditMemory"
                  paramId="clusterdName" paramName="cdName"
                  styleClass="graphButton" target="_blank">
                </sj:jonasbutton>
              </sj:gridcol>
              <sj:gridcol width="5%">
              </sj:gridcol>
            </sj:gridrow>
          </sj:jonasgrid>
        </logic:notEqual>
        <!-- servers action zone -->
        <!-- it's not monitoring case -->
        <logic:equal name="isNotMonitoring" value="true">

          <sj:jonasgrid>
            <sj:jgRowTitle>
              <!-- title.domain.action==action -->
              <sj:jgColTitle>
                <bean:message key="title.domain.action" />
              </sj:jgColTitle>
            </sj:jgRowTitle>
          </sj:jonasgrid>
          <sj:panelSeparator />
          <sj:jonasgrid>
            <sj:gridrow changeStyle="true">
              <sj:gridcol>
                <sj:grid cellPadding="10">
                  <sj:gridrow>
                  <sj:gridcol>
                      <!-- action.button.domain.add.server==Adserver -->
                      <sj:jonasbutton forward="ActionDaemonProxyClusterInfoFromDomain"
                        disabled="false" paramId="node" paramName="cdName"
                        styleClass="button" styleClass="button">
                        <bean:message key="button.refresh" />
                      </sj:jonasbutton>
                    </sj:gridcol>
                    <sj:gridcol>
                      <!-- action.button.domain.add.server==Adserver -->
                      <sj:jonasbutton forward="ActionCreateJonasServer"
                        disabled="false" paramId="CdName" paramName="cdName"
                        styleClass="button" styleClass="button">
                        <bean:message key="action.button.domain.add.server" />
                      </sj:jonasbutton>
                    </sj:gridcol>
                    <sj:gridcol>
                      <!-- action.button.domain.remove.server==RemoveServer -->
                      <sj:jonasbutton
                        href="javascript:submitHiddenWithConfirm('itemsServersForm','action','remove','Remove selected server(s) ?')"
                        disabled="false" styleClass="button">
                        <bean:message key="action.button.domain.remove.server" />
                      </sj:jonasbutton>
                    </sj:gridcol>
                    <sj:gridcol>
                      <!-- action.button.domain.remove.server==RemoveServer -->
                      <sj:jonasbutton
                        href="javascript:submitHiddenWithConfirm('itemsServersForm','action','removeAndSave','Remove selected server(s) from clusterd.xml ?')"
                        disabled="false" styleClass="button"><bean:message key="button.removeandsave" /></sj:jonasbutton>
                    </sj:gridcol>
                    <sj:gridcol>
                      <!-- action.button.domain.start.cluster==Start All -->
                      <logic:equal name="allStarted" value="true">
                        <sj:jonasbutton forward="ActionStartAllJonasServers"
                          disabled="true" styleClass="button" styleClass="button">
                          <bean:message key="action.button.domain.start.cluster" />
                        </sj:jonasbutton>
                      </logic:equal>
                      <logic:notEqual name="allStarted" value="true">
                        <sj:jonasbutton forward="ActionStartAllJonasServers"
                          disabled="false" paramId="node" paramName="cdName"
                          styleClass="button">
                          <bean:message key="action.button.domain.start.cluster" />
                        </sj:jonasbutton>
                      </logic:notEqual>
                    </sj:gridcol>
                    <sj:gridcol>
                      <!-- action.button.domain.stop.cluster==Stop All -->
                      <logic:equal name="noneStarted" value="true">
                        <sj:jonasbutton forward="ActionStopAllJonasServers"
                          disabled="true" paramId="node" paramName="cdName"
                          styleClass="button">
                          <bean:message key="action.button.domain.stop.cluster" />
                        </sj:jonasbutton>
                      </logic:equal>
                      <!--disable stop all when no server is started-->
                      <logic:notEqual name="noneStarted" value="true">
                        <sj:jonasbutton forward="ActionStopAllJonasServers"
                          disabled="false" paramId="node" paramName="cdName"
                          styleClass="button">
                          <bean:message key="action.button.domain.stop.cluster" />
                        </sj:jonasbutton>
                      </logic:notEqual>
                    </sj:gridcol>
                    <sj:gridcol>
                      <!-- action.button.domain.ping.cluster==Ping All -->
                      <sj:jonasbutton forward="ActionPingAllJonasServers"
                        disabled="false" paramId="node" paramName="cdName"
                        disabled="true" styleClass="button">
                        <bean:message key="action.button.domain.ping.cluster" />
                      </sj:jonasbutton>
                    </sj:gridcol>
                  </sj:gridrow>
                </sj:grid>
              </sj:gridcol>
            </sj:gridrow>
          </sj:jonasgrid>
          <sj:jonasgrid>
          </sj:jonasgrid>
        </logic:equal>
        <!--The Servers List-->
        <sj:jonasgrid>
          <sj:jgRowTitle>
            <sj:jgColTitle>
              <bean:message key="label.domain.servers" />
            </sj:jgColTitle>
          </sj:jgRowTitle>
        </sj:jonasgrid>
        <sj:panelSeparator />
        <bean:size id="listSize" name="listServers" />
        <!-- servers list -->
        <sj:jonasgrid>
          <logic:equal name="listSize" value="0">
            <bean:message key="message.clusterd.server.none" />
          </logic:equal>
          <logic:notEqual name="listSize" value="0">
            <logic:iterate id="item" name="listServers">
              <!-- Action mode -->
              <logic:equal name="isNotMonitoring" value="true">
                <sj:gridrow>
                  <!-- display multibox if the server is not running-->
                  <logic:notEqual name="item" property="state" value="RUNNING">
                    <sj:gridcol width="5%">
                      <html:multibox property="selectedItems">
                        <bean:write name="item" property="name" />
                      </html:multibox>
                    </sj:gridcol>
                  </logic:notEqual>
                  <!-- display empty column if the server is running -->
                  <logic:equal name="item" property="state" value="RUNNING">
                    <sj:gridcol width="5%">
                    </sj:gridcol>
                  </logic:equal>
                  <!-- server name-->
                  <sj:gridcol width="5%">
                    <bean:write name="item" property="name" />
                  </sj:gridcol>
                  <!-- server state-->
                  <sj:gridcol >
                    <bean:write name="item" property="state" />
                  </sj:gridcol>
                  <!--display icon if server is in clusterd.xml-->
                  <logic:equal name="item" property="isInCdConfig" value="true">
                    <sj:gridcol >
                      <html:img src="../images/icon/info.png"
                        title="Server is in clusterd.xml" />
                    </sj:gridcol>
                  </logic:equal>
                  <!--display empty column if server is not in clusterd.xml-->
                  <logic:notEqual name="item" property="isInCdConfig"
                    value="true">
                    <sj:gridcol >
                    </sj:gridcol>
                  </logic:notEqual>
                  <bean:define id="serverName" name="item" property="name" />
                  <logic:equal name="item" property="state" value="RUNNING">
                    <sj:gridcol >
                      <!-- Stop and standby -->
                      <sj:jonasbutton forward="ActionStopJonasServerCd"
                        paramId="name" paramName="serverName" styleClass="button">
                        <bean:message key="action.button.domain.stopstandby.server" />
                      </sj:jonasbutton>
                    </sj:gridcol>
                    <sj:gridcol >
                      <!-- stop and kill the jvm -->
                      <sj:jonasbutton forward="ActionHaltJonasServerCd"
                        paramId="name" paramName="serverName" styleClass="button">
                        <bean:message key="action.button.domain.stop.server" />
                      </sj:jonasbutton>
                    </sj:gridcol>
                    <!-- Uniformize column display -->
                    <sj:gridcol></sj:gridcol>
                    <sj:gridcol></sj:gridcol>
                    <sj:gridcol></sj:gridcol>
                  </logic:equal>
                  <logic:equal name="item" property="state" value="STOPPED">
                    <sj:gridcol >
                      <sj:jonasbutton forward="ActionStartJonasServerCd"
                        paramId="name" paramName="serverName" styleClass="button">
                        <bean:message key="action.button.domain.start.server" />
                      </sj:jonasbutton>
                    </sj:gridcol>
                    <sj:gridcol >
                      <sj:jonasbutton forward="ActionStartStandbyJonasServerCd"
                        paramId="name" paramName="serverName" styleClass="button">
                        <bean:message key="action.button.domain.startstandby.server" />
                      </sj:jonasbutton>
                    </sj:gridcol>
                    <!-- Uniformize column display -->
                    <sj:gridcol></sj:gridcol>
                    <sj:gridcol></sj:gridcol>
                    <sj:gridcol></sj:gridcol>
                  </logic:equal>
                  <logic:equal name="item" property="state" value="FAILED">
                    <sj:gridcol >
                      <sj:jonasbutton forward="ActionStartJonasServerCd"
                        paramId="name" paramName="serverName" styleClass="button">
                        <bean:message key="action.button.domain.start.server" />
                      </sj:jonasbutton>
                    </sj:gridcol>
                    <sj:gridcol >
                      <sj:jonasbutton forward="ActionStartStandbyJonasServerCd"
                        paramId="name" paramName="serverName" styleClass="button">
                        <bean:message key="action.button.domain.startstandby.server" />
                      </sj:jonasbutton>
                    </sj:gridcol>
                    <sj:gridcol >
                      <!-- Stop and standby -->
                      <sj:jonasbutton forward="ActionStopJonasServerCd"
                        paramId="name" paramName="serverName" styleClass="button">
                        <bean:message key="action.button.domain.stopstandby.server" />
                      </sj:jonasbutton>
                    </sj:gridcol>
                    <sj:gridcol >
                      <!-- Stop and kill the jvm -->
                      <sj:jonasbutton forward="ActionHaltJonasServerCd"
                        paramId="name" paramName="serverName" styleClass="button">
                        <bean:message key="action.button.domain.stop.server" />
                      </sj:jonasbutton>
                    </sj:gridcol>
                    <sj:gridcol></sj:gridcol>
                  </logic:equal>
                  <logic:equal name="item" property="state" value="STANDBY">
                    <sj:gridcol >
                      <sj:jonasbutton forward="ActionStartJonasServerCd"
                        paramId="name" paramName="serverName" styleClass="button">
                        <bean:message key="action.button.domain.start.server" />
                      </sj:jonasbutton>
                    </sj:gridcol>
                    <sj:gridcol >
                      <!-- Stop and kill the jvm -->
                      <sj:jonasbutton forward="ActionHaltJonasServerCd"
                        paramId="name" paramName="serverName" styleClass="button">
                        <bean:message key="action.button.domain.stop.server" />
                      </sj:jonasbutton>
                    </sj:gridcol>
                    <!-- Uniformize column display -->
                    <sj:gridcol></sj:gridcol>
                    <sj:gridcol></sj:gridcol>
                    <sj:gridcol></sj:gridcol>
                  </logic:equal>
                  <!-- Nothing to be done, this may not be a JOnAS server -->
                  <logic:equal name="item" property="state" value="UNKNOWN">
                    <sj:gridcol></sj:gridcol>
                    <sj:gridcol></sj:gridcol>
                    <sj:gridcol></sj:gridcol>
                    <sj:gridcol></sj:gridcol>
                    <sj:gridcol></sj:gridcol>
                  </logic:equal>
                  <logic:equal name="item" property="state" value="UNREACHABLE">
                    <sj:gridcol >
                      <sj:jonasbutton forward="ActionStartJonasServerCd"
                        paramId="name" paramName="serverName" styleClass="button">
                        <bean:message key="action.button.domain.start.server" />
                      </sj:jonasbutton>
                    </sj:gridcol>
                    <sj:gridcol >
                      <sj:jonasbutton forward="ActionStartStandbyJonasServerCd"
                        paramId="name" paramName="serverName" styleClass="button">
                        <bean:message key="action.button.domain.startstandby.server" />
                      </sj:jonasbutton>
                    </sj:gridcol>
                    <sj:gridcol >
                      <!-- Stop and standby -->
                      <sj:jonasbutton forward="ActionStopJonasServerCd"
                        paramId="name" paramName="serverName" styleClass="button">
                        <bean:message key="action.button.domain.stopstandby.server" />
                      </sj:jonasbutton>
                    </sj:gridcol>
                    <sj:gridcol >
                      <!-- Stop and kill the jvm -->
                      <sj:jonasbutton forward="ActionHaltJonasServerCd"
                        paramId="name" paramName="serverName" styleClass="button">
                        <bean:message key="action.button.domain.stop.server" />
                      </sj:jonasbutton>
                    </sj:gridcol>
                    <sj:gridcol></sj:gridcol>
                  </logic:equal>
                  <logic:equal name="item" property="state" value="STARTING">
                    <!-- Avoid empty rows -->
                    <sj:gridcol></sj:gridcol>
                    <sj:gridcol></sj:gridcol>
                    <sj:gridcol></sj:gridcol>
                    <sj:gridcol></sj:gridcol>
                    <sj:gridcol></sj:gridcol>
                  </logic:equal>
                  <logic:equal name="item" property="state" value="STOPPING">
                    <!-- Uniformize column display -->
                    <sj:gridcol></sj:gridcol>
                    <sj:gridcol></sj:gridcol>
                    <sj:gridcol></sj:gridcol>
                    <sj:gridcol></sj:gridcol>
                    <sj:gridcol></sj:gridcol>
                  </logic:equal>

                </sj:gridrow>

              </logic:equal>
              <!-- Monitoring mode -->
              <logic:notEqual name="isNotMonitoring" value="true">
              <sj:jonasgrid>
            <sj:jgRowTitle>
              <!-- title.domain.action==action -->
              <sj:jgColTitle>
                <bean:message key="title.domain.action" />
              </sj:jgColTitle>
            </sj:jgRowTitle>
          </sj:jonasgrid>
          <sj:panelSeparator />
                <sj:jonasgrid>
                  <sj:gridrow changeStyle="true">
                    <sj:gridcol>
                      <sj:grid cellPadding="10">
                        <sj:gridrow>
                          <sj:gridcol>
                            <!-- action.button.domain.add.server==Adserver -->
                            <sj:jonasbutton
                              forward="ActionDaemonProxyClusterInfoFromDomain"
                              disabled="false" paramId="node" paramName="cdName"
                              styleClass="button" styleClass="button">
                              <bean:message key="button.refresh" />
                            </sj:jonasbutton>
                          </sj:gridcol>
                        </sj:gridrow>
                      </sj:grid>
                    </sj:gridcol>
                  </sj:gridrow>
                </sj:jonasgrid>
                <sj:gridrow>
                  <!-- server name-->
                  <sj:gridcol width="5%">
                    <bean:write name="item" property="name" />
                  </sj:gridcol>
                  <!-- server state-->
                  <sj:gridcol >
                    <bean:write name="item" property="state" />
                  </sj:gridcol>
                  <!--display icon if server is in clusterd.xml-->
                  <logic:equal name="item" property="isInCdConfig" value="true">
                    <sj:gridcol >
                      <html:img src="../images/icon/info.png"
                        title="Server is in clusterd.xml" />
                    </sj:gridcol>
                  </logic:equal>
                  <!--display empty column if server is not in clusterd.xml-->
                  <logic:notEqual name="item" property="isInCdConfig"
                    value="true">
                    <sj:gridcol >
                    </sj:gridcol>
                  </logic:notEqual>
                  <bean:define id="serverName" name="item" property="name" />
                  <logic:equal name="item" property="state" value="RUNNING">
                    <sj:gridcol >
                      <!-- Stop and standby -->
                      <sj:jonasbutton forward="ActionStopJonasServerCd"
                        paramId="name" paramName="serverName" styleClass="button">
                        <bean:message key="action.button.domain.stopstandby.server" />
                      </sj:jonasbutton>
                    </sj:gridcol>
                    <sj:gridcol >
                      <!-- stop and kill the jvm -->
                      <sj:jonasbutton forward="ActionHaltJonasServerCd"
                        paramId="name" paramName="serverName" styleClass="button">
                        <bean:message key="action.button.domain.stop.server" />
                      </sj:jonasbutton>
                    </sj:gridcol>
                    <!-- Uniformize column display -->
                    <sj:gridcol></sj:gridcol>
                    <sj:gridcol></sj:gridcol>
                    <sj:gridcol></sj:gridcol>
                  </logic:equal>
                  <logic:equal name="item" property="state" value="STOPPED">
                    <sj:gridcol >
                      <sj:jonasbutton forward="ActionStartJonasServerCd"
                        paramId="name" paramName="serverName" styleClass="button">
                        <bean:message key="action.button.domain.start.server" />
                      </sj:jonasbutton>
                    </sj:gridcol>
                    <sj:gridcol >
                      <sj:jonasbutton forward="ActionStartStandbyJonasServerCd"
                        paramId="name" paramName="serverName" styleClass="button">
                        <bean:message key="action.button.domain.startstandby.server" />
                      </sj:jonasbutton>
                    </sj:gridcol>
                    <!-- Uniformize column display -->
                    <sj:gridcol></sj:gridcol>
                    <sj:gridcol></sj:gridcol>
                    <sj:gridcol></sj:gridcol>
                  </logic:equal>
                  <logic:equal name="item" property="state" value="FAILED">
                    <sj:gridcol >
                      <sj:jonasbutton forward="ActionStartJonasServerCd"
                        paramId="name" paramName="serverName" styleClass="button">
                        <bean:message key="action.button.domain.start.server" />
                      </sj:jonasbutton>
                    </sj:gridcol>
                    <sj:gridcol >
                      <sj:jonasbutton forward="ActionStartStandbyJonasServerCd"
                        paramId="name" paramName="serverName" styleClass="button">
                        <bean:message key="action.button.domain.startstandby.server" />
                      </sj:jonasbutton>
                    </sj:gridcol>
                    <sj:gridcol >
                      <!-- Stop and standby -->
                      <sj:jonasbutton forward="ActionStopJonasServerCd"
                        paramId="name" paramName="serverName" styleClass="button">
                        <bean:message key="action.button.domain.stopstandby.server" />
                      </sj:jonasbutton>
                    </sj:gridcol>
                    <sj:gridcol >
                      <!-- Stop and kill the jvm -->
                      <sj:jonasbutton forward="ActionHaltJonasServerCd"
                        paramId="name" paramName="serverName" styleClass="button">
                        <bean:message key="action.button.domain.stop.server" />
                      </sj:jonasbutton>
                    </sj:gridcol>
                    <sj:gridcol></sj:gridcol>
                  </logic:equal>
                  <logic:equal name="item" property="state" value="STANDBY">
                    <sj:gridcol >
                      <sj:jonasbutton forward="ActionStartJonasServerCd"
                        paramId="name" paramName="serverName" styleClass="button">
                        <bean:message key="action.button.domain.start.server" />
                      </sj:jonasbutton>
                    </sj:gridcol>
                    <sj:gridcol >
                      <!-- Stop and kill the jvm -->
                      <sj:jonasbutton forward="ActionHaltJonasServerCd"
                        paramId="name" paramName="serverName" styleClass="button">
                        <bean:message key="action.button.domain.stop.server" />
                      </sj:jonasbutton>
                    </sj:gridcol>
                    <!-- Uniformize column display -->
                    <sj:gridcol></sj:gridcol>
                    <sj:gridcol></sj:gridcol>
                    <sj:gridcol></sj:gridcol>
                  </logic:equal>
                  <!-- Nothing to be done, this may not be a JOnAS server -->
                  <logic:equal name="item" property="state" value="UNKNOWN">
                     <!-- Uniformize column display -->
                    <sj:gridcol></sj:gridcol>
                    <sj:gridcol></sj:gridcol>
                    <sj:gridcol></sj:gridcol>
                    <sj:gridcol></sj:gridcol>
                    <sj:gridcol></sj:gridcol>
                  </logic:equal>
                  <logic:equal name="item" property="state" value="UNREACHABLE">
                    <sj:gridcol >
                      <sj:jonasbutton forward="ActionStartJonasServerCd"
                        paramId="name" paramName="serverName" styleClass="button">
                        <bean:message key="action.button.domain.start.server" />
                      </sj:jonasbutton>
                    </sj:gridcol>
                    <sj:gridcol >
                      <sj:jonasbutton forward="ActionStartStandbyJonasServerCd"
                        paramId="name" paramName="serverName" styleClass="button">
                        <bean:message key="action.button.domain.startstandby.server" />
                      </sj:jonasbutton>
                    </sj:gridcol>
                    <sj:gridcol >
                      <!-- Stop and standby -->
                      <sj:jonasbutton forward="ActionStopJonasServerCd"
                        paramId="name" paramName="serverName" styleClass="button">
                        <bean:message key="action.button.domain.stopstandby.server" />
                      </sj:jonasbutton>
                    </sj:gridcol>
                    <sj:gridcol >
                      <!-- Stop and kill the jvm -->
                      <sj:jonasbutton forward="ActionHaltJonasServerCd"
                        paramId="name" paramName="serverName" styleClass="button">
                        <bean:message key="action.button.domain.stop.server" />
                      </sj:jonasbutton>
                    </sj:gridcol>
                    <sj:gridcol></sj:gridcol>
                  </logic:equal>
                  <logic:equal name="item" property="state" value="STARTING">
                    <!-- Avoid empty rows -->
                    <sj:gridcol></sj:gridcol>
                    <sj:gridcol></sj:gridcol>
                    <!-- Uniformize column display -->
                    <sj:gridcol></sj:gridcol>
                    <sj:gridcol></sj:gridcol>
                    <sj:gridcol></sj:gridcol>
                  </logic:equal>
                  <logic:equal name="item" property="state" value="STOPPING">
                    <!-- Avoid empty rows -->
                    <sj:gridcol></sj:gridcol>
                    <sj:gridcol></sj:gridcol>
                    <!-- Uniformize column display -->
                    <sj:gridcol></sj:gridcol>
                    <sj:gridcol></sj:gridcol>
                    <sj:gridcol></sj:gridcol>
                  </logic:equal>

                </sj:gridrow>

              </logic:notEqual>

            </logic:iterate>
          </logic:notEqual>
        </sj:jonasgrid>
        <!-- end logic equal clusterd state RUNNING-->
      </logic:equal>
      <logic:notEqual name="daemonProxyClusterForm" property="state"
        value="RUNNING">
        <!--label.service.jtm.moni.state==State-->
        <sj:jonasgrid>
          <sj:gridrow>
            <sj:jgName>
              <bean:message key="label.service.jtm.moni.state" />
            </sj:jgName>
            <sj:jgValue>
              <bean:write name="daemonProxyClusterForm" property="state" />
            </sj:jgValue>
          </sj:gridrow>
        </sj:jonasgrid>
      </logic:notEqual>
    </sj:panel>
  </sj:tabs>
</html:form>
<%@ include file="../common/end.jsp"%>
</body>
</html:html>
