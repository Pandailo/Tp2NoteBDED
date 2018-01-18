<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ApplyJonasServers">
<meta HTTP-EQUIV="Page-Enter" CONTENT="revealtrans(duration=4.0, transition=4)">
<meta HTTP-EQUIV="Page-Exit" CONTENT="revealtrans(duration=4.0, transition=5)">
<meta http-equiv="refresh" content="15"; URL="EditDomain.do">
<html:hidden property="action"/>
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <logic:equal name="domainForm" property="cluster" value="false">
    <sj:tab forward="ActionEditDomain" selected="true"><bean:message key="tab.domain"/></sj:tab>
  </logic:equal>
  <logic:equal name="domainForm" property="cluster" value="true">
    <sj:tab forward="ActionEditDomain"><bean:message key="tab.domain"/></sj:tab>
    <sj:tab forward="ActionEditDomain" selected="true"><bean:write  name="domainForm" property="name"/></sj:tab>
  </logic:equal>
  <sj:panel>
    <!-- domain properties -->
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle>
          <bean:write name="domainForm" property="type"/>
          <bean:message key="label.domain.properties"/>
        </sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.domain.name"/></sj:jgName>
        <sj:jgValue><bean:write name="domainForm" property="name"/></sj:jgValue>
      </sj:gridrow>
      <logic:equal name="domainForm" property="cluster" value="true">
        <sj:gridrow>
          <sj:jgName><bean:message key="label.cluster.type"/></sj:jgName>
          <sj:jgValue><bean:write name="domainForm" property="clusterType"/></sj:jgValue>
        </sj:gridrow>
      </logic:equal>
    <logic:present name="domainForm" property="description">
        <sj:jgName><bean:message key="label.domain.description"/></sj:jgName>
        <sj:jgValue><bean:write name="domainForm" property="description"/></sj:jgValue>
      </logic:present>
      <logic:equal name="domainForm" property="cluster" value="true">
        <sj:gridrow>
          <sj:jgName><bean:message key="label.domain.domainName"/></sj:jgName>
          <sj:jgValue><bean:write name="domainForm" property="domainName"/></sj:jgValue>
        </sj:gridrow>
      </logic:equal>
      <logic:equal name="domainForm" property="master" value="true">
        <sj:gridrow>
          <sj:jgName><bean:message key="label.domain.master"/></sj:jgName>
          <sj:jgValue>
            <html:link forward="ActionEditJonasServer" styleClass="panel"
              paramId="select" paramName="domainForm" paramProperty="masterON">
                <bean:write name="domainForm" property="masterName"/>
            </html:link>
          </sj:jgValue>
        </sj:gridrow>
      </logic:equal>
      <logic:equal name="domainForm" property="master" value="false">
        <sj:gridrow>
          <sj:jgName><bean:message key="label.domain.currentServer"/></sj:jgName>
          <sj:jgValue>
            <bean:write name="domainForm" property="masterName"/>
          </sj:jgValue>
        </sj:gridrow>
      </logic:equal>
    </sj:jonasgrid>

   <logic:equal name="domainForm" property="master" value="true">

    <sj:panelSeparator/>

    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle>
          <bean:message key="label.domain.servers"/>
        </sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>

    <bean:size id="clustListSize" name="listClusters"/>
    <bean:size id="cdpListSize" name="listCdps"/>
    <bean:size id="listSize" name="listServers"/>

    <!-- servers action zone -->
    <logic:notEqual name="domainForm" property="cluster" value="true">
    <sj:jonasgrid>
      <sj:jgRowTitle level="2">
        <sj:jgColTitle><bean:message key="title.domain.action"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow changeStyle="true">
        <sj:gridcol>
          <sj:grid cellPadding="10">
            <sj:gridrow>
              <sj:gridcol>
                <sj:jonasbutton forward="ActionCreateJonasServer">
                  <bean:message key="action.button.domain.add.server"/>
                </sj:jonasbutton>
              </sj:gridcol>
              <sj:gridcol>
                <sj:jonasbutton href="javascript:submitHidden('itemsServersForm','action','remove')">
                  <bean:message key="action.button.domain.remove.server"/>
                </sj:jonasbutton>
              </sj:gridcol>
            </sj:gridrow>
          </sj:grid>
        </sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>

    <sj:panelSeparator/>
    </logic:notEqual>
    <logic:equal name="domainForm" property="cluster" value="true">
      <logic:equal name="domainForm" property="clusterType" value="LogicalCluster">
        <sj:jonasgrid>
      <sj:jgRowTitle level="2">
        <sj:jgColTitle><bean:message key="title.domain.action"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow changeStyle="true">
        <sj:gridcol>
          <sj:grid cellPadding="10">
            <sj:gridrow>
              <sj:gridcol>
                <sj:jonasbutton forward="ActionCreateJonasServer">
                  <bean:message key="action.button.domain.add.server"/>
                </sj:jonasbutton>
              </sj:gridcol>
              <sj:gridcol>
                <sj:jonasbutton href="javascript:submitHidden('itemsServersForm','action','remove')">
                  <bean:message key="action.button.domain.remove.server"/>
                </sj:jonasbutton>
              </sj:gridcol>
            </sj:gridrow>
          </sj:grid>
        </sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>

    <sj:panelSeparator/>
      </logic:equal>
    </logic:equal>

    <!-- servers list -->
    <sj:jonasgrid>
      <logic:equal name="listSize" value="0">
        <sj:gridrow>
          <logic:equal name="domainForm" property="cluster" value="false">
            <sj:gridcol><bean:message key="message.domain.servers.none"/></sj:gridcol>
          </logic:equal>
           <logic:equal name="domainForm" property="cluster" value="true">
            <sj:gridcol><bean:message key="message.domain.apply.servers.none"/></sj:gridcol>
           </logic:equal>
        </sj:gridrow>
      </logic:equal>
      <logic:notEqual name="listSize" value="0">
        <logic:iterate id="item" name="listServers">
          <sj:gridrow>
            <sj:gridcol width="5%">
            <logic:notEqual name="item" property="state" value="RUNNING">
                <html:multibox property="selectedItems">
                  <bean:write name="item" property="name"/>
                </html:multibox>
            </logic:notEqual>
            </sj:gridcol>
            <sj:gridcol>
              <logic:equal name="item" property="state" value="RUNNING">
                <html:link forward="ActionEditJonasServer" styleClass="panel"
                paramId="select" paramName="item" paramProperty="objectName">
                  <bean:write name="item" property="name"/>
                </html:link>
              </logic:equal>
              <logic:equal name="item" property="state" value="STOPPED">
                <bean:write name="item" property="name"/>
              </logic:equal>
              <logic:equal name="item" property="state" value="STARTING">
                <bean:write name="item" property="name"/>
              </logic:equal>
              <logic:equal name="item" property="state" value="STOPPING">
                <bean:write name="item" property="name"/>
              </logic:equal>
              <logic:equal name="item" property="state" value="UNKNOWN">
                <bean:write name="item" property="name"/>
              </logic:equal>
              <logic:equal name="item" property="state" value="INITIAL">
                <bean:write name="item" property="name"/>
              </logic:equal>
              <logic:equal name="item" property="state" value="FAILED">
                <bean:write name="item" property="name"/>
              </logic:equal>
              <logic:equal name="item" property="state" value="STANDBY">
                <html:link forward="ActionEditJonasServer" styleClass="panel"
                paramId="select" paramName="item" paramProperty="objectName">
                  <bean:write name="item" property="name"/>
                </html:link>
              </logic:equal>
              <logic:equal name="item" property="state" value="UNREACHABLE">
                <bean:write name="item" property="name"/>
              </logic:equal>
            </sj:gridcol>
            <sj:gridcol>
              <bean:write name="item" property="state"/>
            </sj:gridcol>
            <sj:gridcol>
              <logic:empty name="item" property="clusterDaemonName">
                <bean:message key="message.clusterd.none"/>
              </logic:empty>
              <logic:notEmpty name="item" property="clusterDaemonName">
                <bean:write name="item" property="clusterDaemonName"/>
              </logic:notEmpty>
            </sj:gridcol>
            <bean:define id ="serverName" name="item" property="name"/>
            <logic:notEmpty name="item" property="clusterDaemonName">
              <logic:equal name="item" property="state" value="RUNNING">
              <sj:gridcol>
                <sj:jonasbutton forward="ActionStopJonasServer" paramId="name" paramName="serverName">
                  <bean:message key="action.button.domain.stop.server"/>
                </sj:jonasbutton>
              </sj:gridcol>
              <sj:gridcol>
                <sj:jonasbutton forward="ActionStopStandbyJonasServer" paramId="name" paramName="serverName">
                  <bean:message key="action.button.domain.stopstandby.server"/>
                </sj:jonasbutton>
              </sj:gridcol>
              <!-- Uniformize column display -->
              <sj:gridcol></sj:gridcol>
              <sj:gridcol></sj:gridcol>
              </logic:equal>
              <logic:equal name="item" property="state" value="STOPPED">
              <sj:gridcol>
                <sj:jonasbutton forward="ActionStartJonasServer" paramId="name" paramName="serverName">
                  <bean:message key="action.button.domain.start.server"/>
                </sj:jonasbutton>
              </sj:gridcol>
              <sj:gridcol>
                <sj:jonasbutton forward="ActionStartStandbyJonasServer" paramId="name" paramName="serverName">
                  <bean:message key="action.button.domain.startstandby.server"/>
                </sj:jonasbutton>
              </sj:gridcol>
              <!-- Uniformize column display -->
              <sj:gridcol></sj:gridcol>
              <sj:gridcol></sj:gridcol>
              </logic:equal>
              <logic:equal name="item" property="state" value="FAILED">
              <sj:gridcol>
                <sj:jonasbutton forward="ActionStartJonasServer" paramId="name" paramName="serverName">
                  <bean:message key="action.button.domain.start.server"/>
                </sj:jonasbutton>
              </sj:gridcol>
              <sj:gridcol>
                <sj:jonasbutton forward="ActionStartStandbyJonasServer" paramId="name" paramName="serverName">
                  <bean:message key="action.button.domain.startstandby.server"/>
                </sj:jonasbutton>
              </sj:gridcol>
              <sj:gridcol>
                <sj:jonasbutton forward="ActionStopJonasServer" paramId="name" paramName="serverName">
                  <bean:message key="action.button.domain.stop.server"/>
                </sj:jonasbutton>
              </sj:gridcol>
              <sj:gridcol>
                <sj:jonasbutton forward="ActionStopStandbyJonasServer" paramId="name" paramName="serverName">
                  <bean:message key="action.button.domain.stopstandby.server"/>
                </sj:jonasbutton>
              </sj:gridcol>
              </logic:equal>
              <logic:equal name="item" property="state" value="STANDBY">
              <sj:gridcol>
                <sj:jonasbutton forward="ActionStartJonasServer" paramId="name" paramName="serverName">
                  <bean:message key="action.button.domain.start.server"/>
                </sj:jonasbutton>
              </sj:gridcol>
              <sj:gridcol>
                <sj:jonasbutton forward="ActionStopJonasServer" paramId="name" paramName="serverName">
                  <bean:message key="action.button.domain.stop.server"/>
                </sj:jonasbutton>
              </sj:gridcol>
              <!-- Uniformize column display -->
              <sj:gridcol></sj:gridcol>
              <sj:gridcol></sj:gridcol>
              </logic:equal>
              <!-- Nothing to be done, this may not be a JOnAS server -->
              <logic:equal name="item" property="state" value="UNKNOWN">
                <sj:gridcol>
                </sj:gridcol>
                <sj:gridcol>
                </sj:gridcol>
                <!-- Uniformize column display -->
                <sj:gridcol></sj:gridcol>
                <sj:gridcol></sj:gridcol>
             </logic:equal>
              <logic:equal name="item" property="state" value="UNREACHABLE">
                <sj:gridcol>
                <sj:jonasbutton forward="ActionStartJonasServer" paramId="name" paramName="serverName">
                  <bean:message key="action.button.domain.start.server"/>
                </sj:jonasbutton>
              </sj:gridcol>
              <sj:gridcol>
                <sj:jonasbutton forward="ActionStartStandbyJonasServer" paramId="name" paramName="serverName">
                  <bean:message key="action.button.domain.startstandby.server"/>
                </sj:jonasbutton>
              </sj:gridcol>
              <sj:gridcol>
                <sj:jonasbutton forward="ActionStopJonasServer" paramId="name" paramName="serverName">
                  <bean:message key="action.button.domain.stop.server"/>
                </sj:jonasbutton>
              </sj:gridcol>
              <sj:gridcol>
                <sj:jonasbutton forward="ActionStopStandbyJonasServer" paramId="name" paramName="serverName">
                  <bean:message key="action.button.domain.stopstandby.server"/>
                </sj:jonasbutton>
              </sj:gridcol>
              </logic:equal>
              <logic:equal name="item" property="state" value="STARTING">
              <!-- Avoid empty rows -->
                <sj:gridcol></sj:gridcol>
                <sj:gridcol></sj:gridcol>
                <!-- Uniformize column display -->
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
              </logic:equal>
            </logic:notEmpty>

            <!-- No cluster daemon associated to the server. -->
            <logic:empty name="item" property="clusterDaemonName">
              <logic:equal name="item" property="state" value="RUNNING">
              <sj:gridcol>
                <sj:jonasbutton forward="ActionStopJonasServer" paramId="name" paramName="serverName">
                  <bean:message key="action.button.domain.stop.server"/>
                </sj:jonasbutton>
              </sj:gridcol>
              <sj:gridcol>
                <sj:jonasbutton forward="ActionStopStandbyJonasServer" paramId="name" paramName="serverName">
                  <bean:message key="action.button.domain.stopstandby.server"/>
                </sj:jonasbutton>
              </sj:gridcol>
              <!-- Uniformize column display -->
                <sj:gridcol></sj:gridcol>
                <sj:gridcol></sj:gridcol>
              </logic:equal>
              <logic:equal name="item" property="state" value="STOPPED">
              <sj:gridcol>
              </sj:gridcol>
              <sj:gridcol>
              </sj:gridcol>
              <!-- Uniformize column display -->
              <sj:gridcol></sj:gridcol>
              <sj:gridcol></sj:gridcol>
              </logic:equal>
              <logic:equal name="item" property="state" value="STANDBY">
              <sj:gridcol>
                <sj:jonasbutton forward="ActionStartJonasServer" paramId="name" paramName="serverName">
                  <bean:message key="action.button.domain.start.server"/>
                </sj:jonasbutton>
              </sj:gridcol>
              <sj:gridcol>
                <sj:jonasbutton forward="ActionStopJonasServer" paramId="name" paramName="serverName">
                  <bean:message key="action.button.domain.stop.server"/>
                </sj:jonasbutton>
              </sj:gridcol>
              <!-- Uniformize column display -->
              <sj:gridcol></sj:gridcol>
              <sj:gridcol></sj:gridcol>
              </logic:equal>
              <logic:equal name="item" property="state" value="STARTING">
              <!-- Avoid empty rows -->
                <sj:gridcol></sj:gridcol>
                <sj:gridcol></sj:gridcol>
                <!-- Uniformize column display -->
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
              </logic:equal>
              <logic:equal name="item" property="state" value="FAILED">
              <sj:gridcol>
                <sj:jonasbutton forward="ActionStartJonasServer" paramId="name" paramName="serverName">
                  <bean:message key="action.button.domain.start.server"/>
                </sj:jonasbutton>
              </sj:gridcol>
              <sj:gridcol>
                <sj:jonasbutton forward="ActionStartStandbyJonasServer" paramId="name" paramName="serverName">
                  <bean:message key="action.button.domain.startstandby.server"/>
                </sj:jonasbutton>
              </sj:gridcol>
              <sj:gridcol>
                <sj:jonasbutton forward="ActionStopJonasServer" paramId="name" paramName="serverName">
                  <bean:message key="action.button.domain.stop.server"/>
                </sj:jonasbutton>
              </sj:gridcol>
              <sj:gridcol>
                <sj:jonasbutton forward="ActionStopStandbyJonasServer" paramId="name" paramName="serverName">
                  <bean:message key="action.button.domain.stopstandby.server"/>
                </sj:jonasbutton>
              </sj:gridcol>
              </logic:equal>
              <!-- Nothing to be done, it may not be a JOnAS server -->
              <logic:equal name="item" property="state" value="UNKNOWN">
                <sj:gridcol></sj:gridcol>
                <sj:gridcol></sj:gridcol>
                <!-- Uniformize column display -->
                <sj:gridcol></sj:gridcol>
                <sj:gridcol></sj:gridcol>
              </logic:equal>
              <!-- Nothing to be done, no cluster daemon associated -->
               <logic:equal name="item" property="state" value="UNREACHABLE">
                <sj:gridcol></sj:gridcol>
                <sj:gridcol></sj:gridcol>
                <!-- Uniformize column display -->
                <sj:gridcol></sj:gridcol>
                <sj:gridcol></sj:gridcol>
              </logic:equal>
            </logic:empty>
          </sj:gridrow>
        </logic:iterate>
      </logic:notEqual>
    </sj:jonasgrid>

    <logic:equal name="domainForm" property="cluster" value="false">

    <!-- clusters list -->
    <sj:panelSeparator/>

      <sj:jonasgrid>
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="label.domain.clusters"/></sj:jgColTitle>
        </sj:jgRowTitle>
    </sj:jonasgrid>

    <sj:jonasgrid>
      <sj:jgRowTitle level="2">
        <sj:jgColTitle><bean:message key="title.domain.action"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>

    <sj:jonasgrid>
      <sj:gridrow changeStyle="true">
        <sj:gridcol>
          <sj:grid cellPadding="10">
            <sj:gridrow>
              <sj:gridcol>
                <sj:jonasbutton forward="ActionCreateCluster">
                  <bean:message key="action.button.domain.create.cluster"/>
                </sj:jonasbutton>
              </sj:gridcol>
            </sj:gridrow>
          </sj:grid>
        </sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>

    <sj:panelSeparator/>

    <sj:jonasgrid>
      <logic:equal name="clustListSize" value="0">
        <sj:gridrow>
          <sj:gridcol><bean:message key="message.domain.clusters.none"/></sj:gridcol>
        </sj:gridrow>
      </logic:equal>
      <logic:notEqual name="clustListSize" value="0">
        <logic:iterate id="itemClust" name="listClusters">
          <bean:define id="obj" name="itemClust" property="objectName"/>
          <sj:gridrow>
            <sj:gridcol width="20%">
              <html:link forward="ActionEditDomain" styleClass="panel"
                paramId="select" paramName="itemClust" paramProperty="name">
                <bean:write name="itemClust" property="name"/>
              </html:link>
            </sj:gridcol>
            <sj:gridcol>
              <bean:write name="itemClust" property="state"/>
            </sj:gridcol>
            <sj:gridcol>
              <sj:jonasbutton forward="ActionStartCluster" paramId="on" paramName="obj">
                <bean:message key="action.button.domain.start.cluster"/>
              </sj:jonasbutton>
            </sj:gridcol>
            <sj:gridcol>
              <sj:jonasbutton forward="ActionStopCluster" paramId="on" paramName="obj">
                <bean:message key="action.button.domain.stop.cluster"/>
              </sj:jonasbutton>
            </sj:gridcol>
          </sj:gridrow>
        </logic:iterate>
      </logic:notEqual>
    </sj:jonasgrid>


    <!-- cluster daemons list -->
    <sj:panelSeparator/>

    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="label.domain.cdps"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>

    <sj:jonasgrid>
      <logic:equal name="cdpListSize" value="0">
        <sj:gridrow>
          <sj:gridcol><bean:message key="message.domain.clds.none"/></sj:gridcol>
        </sj:gridrow>
      </logic:equal>

      <logic:notEqual name="cdpListSize" value="0">
        <logic:iterate id="item" name="listCdps">
          <bean:define id="obj" name="item" property="objectName"/>
          <sj:gridrow>
            <sj:gridcol width="20%">
              <logic:equal name="item" property="state" value="RUNNING">
                <html:link forward="ActionDaemonProxyClusterInfoFromDomain" styleClass="panel"
                  paramId="node" paramName="item" paramProperty="name">
                  <bean:write name="item" property="name"/>
                </html:link>
              </logic:equal>
              <logic:notEqual name="item" property="state" value="RUNNING">
                <bean:write name="item" property="name"/>
              </logic:notEqual>
            </sj:gridcol>
            <sj:gridcol>
              <bean:write name="item" property="state"/>
            </sj:gridcol>
          </sj:gridrow>
        </logic:iterate>
      </logic:notEqual>

    </sj:jonasgrid>


    </logic:equal>
   </logic:equal>
  </sj:panel>
</sj:tabs>

</html:form>
<%@ include file="../common/end.jsp" %>
</body>
</html:html>
