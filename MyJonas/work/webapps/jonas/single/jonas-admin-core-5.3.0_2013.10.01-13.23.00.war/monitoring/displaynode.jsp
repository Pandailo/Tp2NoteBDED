<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj"%>


<html:html locale="true">
<%@ include file="../common/begin.jsp"%>
<body class="content">
<html:form action="/ServerGraph" target="_blank">
<meta http-equiv="refresh" content="15"
    ; URL="DisplayNodeInfo.do">
  <html:hidden property="action" value="default" />
  <sj:titleContent usingWhere="true" tomThumb="true" />
  <sj:tabs usingWhere="true" heightTab="20">
    <sj:tab forward="ActionDisplayNodeInfo" selected="true">
      <bean:write name="nodeInfoForm" property="serverName" /> Infos
    </sj:tab>
    <sj:panel>
      <bean:define id="state" name="nodeInfoForm" property="state" />
      <logic:equal name="state" value="RUNNING">
        <sj:jonasgrid>
          <sj:jgRowTitle>
            <sj:jgColTitle>Global</sj:jgColTitle>
          </sj:jgRowTitle>
        </sj:jonasgrid>
        <sj:jonasgrid>
        <sj:gridrow>
                    <sj:gridcol width="20%">State</sj:gridcol>
                        <sj:gridcol width="35%">
                            <bean:write name="nodeInfoForm" property="state" />
                        </sj:gridcol>
                        <sj:gridcol width="20%">
                        </sj:gridcol>
                    </sj:gridrow>
          <sj:gridrow>
            <sj:gridcol width="20%">Threads Count</sj:gridcol>
            <sj:gridcol width="35%">
              <bean:write name="nodeInfoForm" property="allThreadsCount" />
            </sj:gridcol>
            <sj:gridcol width="20%">
              <sj:jonasbutton
                href="javascript:submitHidden('ServerGraphForm','action','currentThreadCount')"
                styleClass="graphButton">
               </sj:jonasbutton>
            </sj:gridcol>
          </sj:gridrow>
          <sj:gridrow>
            <sj:gridcol width="20%">Memory Load</sj:gridcol>
            <sj:gridcol width="35%">
              <bean:write name="nodeInfoForm" property="currentUsedMemory" />
            </sj:gridcol>
            <sj:gridcol width="20%">
              <sj:jonasbutton
                href="javascript:submitHidden('ServerGraphForm','action','currentUsedMemory')"
                styleClass="graphButton">
               </sj:jonasbutton>
            </sj:gridcol>
          </sj:gridrow>
          <sj:gridrow>
            <sj:gridcol width="5%">Total Memory</sj:gridcol>
            <sj:gridcol width="5%">
              <bean:write name="nodeInfoForm" property="currentTotalMemory" />
            </sj:gridcol>
            <sj:gridcol width="5%">
                        </sj:gridcol>
          </sj:gridrow>
          <sj:gridrow>
            <sj:gridcol width="5%">JOnAS Version</sj:gridcol>
            <sj:gridcol width="5%">
              <bean:write name="nodeInfoForm" property="JOnASVersion" />
            </sj:gridcol>
            <sj:gridcol width="5%">
                        </sj:gridcol>
          </sj:gridrow>
          <sj:gridrow>
            <sj:gridcol width="5%">JVM Version</sj:gridcol>
            <sj:gridcol width="5%">
              <bean:write name="nodeInfoForm" property="javaVersion" />
            </sj:gridcol>
            <sj:gridcol width="5%">
                        </sj:gridcol>
          </sj:gridrow>
          <sj:gridrow>
            <sj:gridcol width="5%">JVM Vendor</sj:gridcol>
            <sj:gridcol width="5%">
              <bean:write name="nodeInfoForm" property="javaVendor" />
            </sj:gridcol>
            <sj:gridcol width="5%">
                        </sj:gridcol>
          </sj:gridrow>
          <sj:gridrow>
            <sj:gridcol width="5%">Protocols</sj:gridcol>
            <sj:gridcol width="5%">
              <bean:write name="nodeInfoForm" property="protocols" />
            </sj:gridcol>
            <sj:gridcol width="5%">
                        </sj:gridcol>
          </sj:gridrow>
          <sj:gridrow>
            <sj:gridcol width="5%">Jmx Connection URL</sj:gridcol>
            <sj:gridcol width="5%">
              <bean:write name="nodeInfoForm" property="connectionUrl" />
            </sj:gridcol>
            <sj:gridcol width="5%">
                        </sj:gridcol>
          </sj:gridrow>
        </sj:jonasgrid>
        <!--
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle>Infos JDK5</sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
-->

        <logic:equal name="nodeInfoForm" property="transaction" value="true">
          <sj:jonasgrid>
            <sj:jgRowTitle>
              <sj:jgColTitle>Transactions</sj:jgColTitle>
            </sj:jgRowTitle>
          </sj:jonasgrid>
          <sj:jonasgrid>
            <sj:gridrow>
              <sj:gridcol width="19%">Begun Transactions</sj:gridcol>
              <sj:gridcol width="39%">
                <bean:write name="nodeInfoForm"
                  property="totalBegunTransactions" />
              </sj:gridcol>
              <sj:gridcol width="20%">
                <sj:jonasbutton
                  href="javascript:submitHidden('ServerGraphForm','action','totalBegunTransactions')"
                  styleClass="graphButton">
               </sj:jonasbutton>
              </sj:gridcol>
            </sj:gridrow>
            <sj:gridrow>
              <sj:gridcol width="18%">Committed Transactions</sj:gridcol>
              <sj:gridcol width="39%">
                <bean:write name="nodeInfoForm"
                  property="totalCommittedTransactions" />
              </sj:gridcol>
              <sj:gridcol width="20%">
                <sj:jonasbutton
                  href="javascript:submitHidden('ServerGraphForm','action','totalCommittedTransactions')"
                  styleClass="graphButton">
               </sj:jonasbutton>
              </sj:gridcol>
            </sj:gridrow>
            <sj:gridrow>
              <sj:gridcol width="19%">Current Transactions</sj:gridcol>
              <sj:gridcol width="39%">
                <bean:write name="nodeInfoForm"
                  property="totalCurrentTransactions" />
              </sj:gridcol>
              <sj:gridcol width="20%">
                <sj:jonasbutton
                  href="javascript:submitHidden('ServerGraphForm','action','totalCurrentTransactions')"
                  styleClass="graphButton">
               </sj:jonasbutton>
              </sj:gridcol>
            </sj:gridrow>
            <sj:gridrow>
              <sj:gridcol width="19%">Expired Transactions</sj:gridcol>
              <sj:gridcol width="39%">
                <bean:write name="nodeInfoForm"
                  property="totalExpiredTransactions" />
              </sj:gridcol>
              <sj:gridcol width="20%">
                <sj:jonasbutton
                  href="javascript:submitHidden('ServerGraphForm','action','totalExpiredTransactions')"
                  styleClass="graphButton">
               </sj:jonasbutton>
              </sj:gridcol>
            </sj:gridrow>
            <sj:gridrow>
              <sj:gridcol width="19%">Rolled Back Transactions</sj:gridcol>
              <sj:gridcol width="39%">
                <bean:write name="nodeInfoForm"
                  property="totalRolledbackTransactions" />
              </sj:gridcol>
              <sj:gridcol width="20%">
                <sj:jonasbutton
                  href="javascript:submitHidden('ServerGraphForm','action','totalRolledbackTransactions')"
                  styleClass="graphButton">
               </sj:jonasbutton>
              </sj:gridcol>
            </sj:gridrow>
          </sj:jonasgrid>
        </logic:equal>

        <logic:equal name="nodeInfoForm" property="workers" value="true">
          <sj:jonasgrid>
            <sj:jgRowTitle>
              <sj:jgColTitle>JOnAS Worker Pool</sj:jgColTitle>
            </sj:jgRowTitle>
          </sj:jonasgrid>
          <sj:jonasgrid>
            <sj:gridrow>
              <sj:gridcol width="19%">Current Pool Size</sj:gridcol>
              <sj:gridcol width="39%">
                <bean:write name="nodeInfoForm" property="currentWorkerPoolSize" />
              </sj:gridcol>
              <sj:gridcol width="20%">
                            </sj:gridcol>
            </sj:gridrow>
            <sj:gridrow>
              <sj:gridcol width="19%">Max Pool Size</sj:gridcol>
              <sj:gridcol width="39%">
                <bean:write name="nodeInfoForm" property="maxWorkerPoolSize" />
              </sj:gridcol>
              <sj:gridcol width="20%">
                            </sj:gridcol>
            </sj:gridrow>
            <sj:gridrow>
              <sj:gridcol width="19%">Min Pool Size</sj:gridcol>
              <sj:gridcol width="39%">
                <bean:write name="nodeInfoForm" property="minWorkerPoolSize" />
              </sj:gridcol>
              <sj:gridcol width="20%">
                        </sj:gridcol>
            </sj:gridrow>
          </sj:jonasgrid>
        </logic:equal>

        <logic:equal name="nodeInfoForm" property="tomcat" value="true">
          <sj:jonasgrid>
            <sj:jgRowTitle>
              <sj:jgColTitle>Tomcat</sj:jgColTitle>
            </sj:jgRowTitle>
          </sj:jonasgrid>
          <sj:jonasgrid>
            <sj:gridrow>
              <sj:gridcol width="19%">Total Max Threads</sj:gridcol>
              <sj:gridcol width="39%">
                <bean:write name="nodeInfoForm"
                  property="maxThreadsByConnectorTomcat" />
              </sj:gridcol>
              <sj:gridcol width="20%">
                        </sj:gridcol>
            </sj:gridrow>
            <sj:gridrow>
              <sj:gridcol width="5%">Total Threads Number</sj:gridcol>
              <sj:gridcol width="5%">
                <bean:write name="nodeInfoForm"
                  property="currentThreadCountByConnectorTomcat" />
              </sj:gridcol>
              <sj:gridcol width="5%">
                        </sj:gridcol>
            </sj:gridrow>
            <sj:gridrow>
              <sj:gridcol width="5%">Total Threads Busy</sj:gridcol>
              <sj:gridcol width="5%">
                <bean:write name="nodeInfoForm"
                  property="currentThreadBusyByConnectorTomcat" />
              </sj:gridcol>
              <sj:gridcol width="5%">
                <sj:jonasbutton
                  href="javascript:submitHidden('ServerGraphForm','action','currentThreadBusyByConnectorTomcat')"
                  styleClass="graphButton">
               </sj:jonasbutton>
              </sj:gridcol>
            </sj:gridrow>
            <sj:gridrow>
              <sj:gridcol width="5%">Total Bytes Received</sj:gridcol>
              <sj:gridcol width="5%">
                <bean:write name="nodeInfoForm"
                  property="bytesReceivedByConnectorTomcat" />
              </sj:gridcol>
              <sj:gridcol width="5%">
                <sj:jonasbutton
                  href="javascript:submitHidden('ServerGraphForm','action','bytesReceivedByConnectorTomcat')"
                  styleClass="graphButton">
               </sj:jonasbutton>
              </sj:gridcol>
            </sj:gridrow>
            <sj:gridrow>
              <sj:gridcol width="5%">Total Bytes Sent</sj:gridcol>
              <sj:gridcol width="5%">
                <bean:write name="nodeInfoForm"
                  property="bytesSentByConnectorTomcat" />
              </sj:gridcol>
              <sj:gridcol width="5%">
                <sj:jonasbutton
                  href="javascript:submitHidden('ServerGraphForm','action','bytesSentByConnectorTomcat')"
                  styleClass="graphButton">
               </sj:jonasbutton>
              </sj:gridcol>
            </sj:gridrow>
            <sj:gridrow>
              <sj:gridcol width="5%">Total Error Count</sj:gridcol>
              <sj:gridcol width="5%">
                <bean:write name="nodeInfoForm"
                  property="errorCountByConnectorTomcat" />
              </sj:gridcol>
              <sj:gridcol width="5%">
                <sj:jonasbutton
                  href="javascript:submitHidden('ServerGraphForm','action','errorCountByConnectorTomcat')"
                  styleClass="graphButton">
               </sj:jonasbutton>
              </sj:gridcol>
            </sj:gridrow>
            <sj:gridrow>
              <sj:gridcol width="5%">Total Processing Time</sj:gridcol>
              <sj:gridcol width="5%">
                <bean:write name="nodeInfoForm"
                  property="processingTimeByConnectorTomcat" />
              </sj:gridcol>
              <sj:gridcol width="5%">
                <sj:jonasbutton
                  href="javascript:submitHidden('ServerGraphForm','action','processingTimeByConnectorTomcat')"
                  styleClass="graphButton">
               </sj:jonasbutton>
              </sj:gridcol>
            </sj:gridrow>
            <sj:gridrow>
              <sj:gridcol width="5%">Total Request Count</sj:gridcol>
              <sj:gridcol width="5%">
                <bean:write name="nodeInfoForm"
                  property="requestCountByConnectorTomcat" />
              </sj:gridcol>
              <sj:gridcol width="5%">
                <sj:jonasbutton
                  href="javascript:submitHidden('ServerGraphForm','action','requestCountByConnectorTomcat')"
                  styleClass="graphButton">
               </sj:jonasbutton>
              </sj:gridcol>
            </sj:gridrow>
          </sj:jonasgrid>
        </logic:equal>

        <logic:equal name="nodeInfoForm" property="jcaConnection"
          value="true">
          <sj:jonasgrid>
            <sj:jgRowTitle>
              <sj:jgColTitle>JCA</sj:jgColTitle>
            </sj:jgRowTitle>
          </sj:jonasgrid>
          <sj:jonasgrid>
            <sj:gridrow>
              <sj:gridcol width="19%">Total Opened Connections</sj:gridcol>
              <sj:gridcol width="39%">
                <bean:write name="nodeInfoForm"
                  property="currentOpenedJCAConnection" />
              </sj:gridcol>
              <sj:gridcol width="20%">
                        </sj:gridcol>
            </sj:gridrow>

            <sj:gridrow>
              <sj:gridcol width="5%">Total Busy Connections</sj:gridcol>
              <sj:gridcol width="5%">
                <bean:write name="nodeInfoForm"
                  property="currentBusyJCAConnection" />
              </sj:gridcol>
              <sj:gridcol width="5%">
                <sj:jonasbutton
                  href="javascript:submitHidden('ServerGraphForm','action','currentBusyJCAConnection')"
                  styleClass="graphButton">
               </sj:jonasbutton>
              </sj:gridcol>
            </sj:gridrow>
            <sj:gridrow>
              <sj:gridcol width="5%">Total Connection Failures</sj:gridcol>
              <sj:gridcol width="5%">
                <bean:write name="nodeInfoForm"
                  property="connectionFailuresJCAConnection" />
              </sj:gridcol>
              <sj:gridcol width="5%">
                <sj:jonasbutton
                  href="javascript:submitHidden('ServerGraphForm','action','connectionFailuresJCAConnection')"
                  styleClass="graphButton">
               </sj:jonasbutton>
              </sj:gridcol>
            </sj:gridrow>
            <sj:gridrow>
              <sj:gridcol width="5%">Total Connection Leaks</sj:gridcol>
              <sj:gridcol width="5%">
                <bean:write name="nodeInfoForm"
                  property="connectionLeaksJCAConnection" />
              </sj:gridcol>
              <sj:gridcol width="5%">
                <sj:jonasbutton
                  href="javascript:submitHidden('ServerGraphForm','action','connectionLeaksJCAConnection')"
                  styleClass="graphButton">
               </sj:jonasbutton>
              </sj:gridcol>
            </sj:gridrow>
            <sj:gridrow>
              <sj:gridcol width="5%">Total Rejected 'open' calls</sj:gridcol>
              <sj:gridcol width="5%">
                <bean:write name="nodeInfoForm"
                  property="rejectedOpenJCAConnection" />
              </sj:gridcol>
              <sj:gridcol width="5%">
                <sj:jonasbutton
                  href="javascript:submitHidden('ServerGraphForm','action','rejectedOpenJCAConnection')"
                  styleClass="graphButton">
               </sj:jonasbutton>
              </sj:gridcol>
            </sj:gridrow>
            <sj:gridrow>
              <sj:gridcol width="5%">Total served XA connections</sj:gridcol>
              <sj:gridcol width="5%">
                <bean:write name="nodeInfoForm"
                  property="servedOpenJCAConnection" />
              </sj:gridcol>
              <sj:gridcol width="5%">
                <sj:jonasbutton
                  href="javascript:submitHidden('ServerGraphForm','action','servedOpenJCAConnection')"
                  styleClass="graphButton">
               </sj:jonasbutton>
              </sj:gridcol>
            </sj:gridrow>
            <sj:gridrow>
              <sj:gridcol width="5%">Total Waiters</sj:gridcol>
              <sj:gridcol width="5%">
                <bean:write name="nodeInfoForm"
                  property="waiterCountJCAConnection" />
              </sj:gridcol>
              <sj:gridcol width="5%">
                <sj:jonasbutton
                  href="javascript:submitHidden('ServerGraphForm','action','waiterCountJCAConnection')"
                  styleClass="graphButton">
               </sj:jonasbutton>
              </sj:gridcol>
            </sj:gridrow>
            <sj:gridrow>
              <sj:gridcol width="5%">Total Waiting Time</sj:gridcol>
              <sj:gridcol width="5%">
                <bean:write name="nodeInfoForm"
                  property="waitingTimeJCAConnection" />
              </sj:gridcol>
              <sj:gridcol width="5%">
                        </sj:gridcol>
            </sj:gridrow>
          </sj:jonasgrid>
        </logic:equal>


        <logic:equal name="nodeInfoForm" property="jdbcDatasource"
          value="true">
          <sj:jonasgrid>
            <sj:jgRowTitle>
              <sj:jgColTitle>JDBC</sj:jgColTitle>
            </sj:jgRowTitle>
          </sj:jonasgrid>
          <sj:jonasgrid>
            <sj:gridrow>
              <sj:gridcol width="19%">Total Opened Connections</sj:gridcol>
              <sj:gridcol width="39%">
                <bean:write name="nodeInfoForm"
                  property="currentOpenedJDBCDatasource" />
              </sj:gridcol>
              <sj:gridcol width="20%">
                        </sj:gridcol>
            </sj:gridrow>
            <sj:gridrow>
              <sj:gridcol width="5%">Total Busy Connections</sj:gridcol>
              <sj:gridcol width="5%">
                <bean:write name="nodeInfoForm"
                  property="currentBusyJDBCDatasource" />
              </sj:gridcol>
              <sj:gridcol width="5%">
                <sj:jonasbutton
                  href="javascript:submitHidden('ServerGraphForm','action','currentBusyJDBCDatasource')"
                  styleClass="graphButton">
               </sj:jonasbutton>
              </sj:gridcol>
            </sj:gridrow>
            <sj:gridrow>
              <sj:gridcol width="5%">Total Connection Failures</sj:gridcol>
              <sj:gridcol width="5%">
                <bean:write name="nodeInfoForm"
                  property="connectionFailuresJDBCDatasource" />
              </sj:gridcol>
              <sj:gridcol width="5%">
                <sj:jonasbutton
                  href="javascript:submitHidden('ServerGraphForm','action','connectionFailuresJDBCDatasource')"
                  styleClass="graphButton">
               </sj:jonasbutton>
              </sj:gridcol>
            </sj:gridrow>
            <sj:gridrow>
              <sj:gridcol width="5%">Total Connection Leaks</sj:gridcol>
              <sj:gridcol width="5%">
                <bean:write name="nodeInfoForm"
                  property="connectionLeaksJDBCDatasource" />
              </sj:gridcol>
              <sj:gridcol width="5%">
                <sj:jonasbutton
                  href="javascript:submitHidden('ServerGraphForm','action','connectionLeaksJDBCDatasource')"
                  styleClass="graphButton">
               </sj:jonasbutton>
              </sj:gridcol>
            </sj:gridrow>
            <sj:gridrow>
              <sj:gridcol width="5%">Total Rejected 'open' calls</sj:gridcol>
              <sj:gridcol width="5%">
                <bean:write name="nodeInfoForm"
                  property="rejectedOpenJDBCDatasource" />
              </sj:gridcol>
              <sj:gridcol width="5%">
                <sj:jonasbutton
                  href="javascript:submitHidden('ServerGraphForm','action','rejectedOpenJDBCDatasource')"
                  styleClass="graphButton">
               </sj:jonasbutton>
              </sj:gridcol>
            </sj:gridrow>
            <sj:gridrow>
              <sj:gridcol width="5%">Total served XA connections</sj:gridcol>
              <sj:gridcol width="5%">
                <bean:write name="nodeInfoForm"
                  property="servedOpenJDBCDatasource" />
              </sj:gridcol>
              <sj:gridcol width="5%">
                <sj:jonasbutton
                  href="javascript:submitHidden('ServerGraphForm','action','servedOpenJDBCDatasource')"
                  styleClass="graphButton">
               </sj:jonasbutton>
              </sj:gridcol>
            </sj:gridrow>
            <sj:gridrow>
              <sj:gridcol width="5%">Total Waiters</sj:gridcol>
              <sj:gridcol width="5%">
                <bean:write name="nodeInfoForm"
                  property="waiterCountJDBCDatasource" />
              </sj:gridcol>
              <sj:gridcol width="5%">
                <sj:jonasbutton
                  href="javascript:submitHidden('ServerGraphForm','action','waiterCountJDBCDatasource')"
                  styleClass="graphButton">
               </sj:jonasbutton>
              </sj:gridcol>
            </sj:gridrow>
            <sj:gridrow>
              <sj:gridcol width="5%">Total Waiting Time</sj:gridcol>
              <sj:gridcol width="5%">
                <bean:write name="nodeInfoForm"
                  property="waitingTimeJDBCDatasource" />
              </sj:gridcol>
              <sj:gridcol width="5%"></sj:gridcol>
            </sj:gridrow>
          </sj:jonasgrid>

        </logic:equal>
        <logic:equal name="nodeInfoForm" property="jcaConnection"
          value="true">
          <sj:jonasgrid>
            <sj:jgRowTitle>
              <sj:jgColTitle>JMS</sj:jgColTitle>
            </sj:jgRowTitle>
          </sj:jonasgrid>
          <sj:jonasgrid>
            <sj:gridrow>
              <sj:gridcol width="19%">Total Messages Received in Queues</sj:gridcol>
              <sj:gridcol width="39%">
                <bean:write name="nodeInfoForm"
                  property="jmsQueuesNbMsgsReceiveSinceCreation" />
              </sj:gridcol>
              <sj:gridcol width="20%">
                <sj:jonasbutton
                  href="javascript:submitHidden('ServerGraphForm','action','jmsQueuesNbMsgsReceiveSinceCreation')"
                  styleClass="graphButton">
               </sj:jonasbutton>
              </sj:gridcol>
            </sj:gridrow>
            <sj:gridrow>
              <sj:gridcol width="5%">Total Messages Delivered from Queues</sj:gridcol>
              <sj:gridcol width="5%">
                <bean:write name="nodeInfoForm"
                  property="jmsQueuesNbMsgsDeliverSinceCreation" />
              </sj:gridcol>
              <sj:gridcol width="5%">
                <sj:jonasbutton
                  href="javascript:submitHidden('ServerGraphForm','action','jmsQueuesNbMsgsDeliverSinceCreation')"
                  styleClass="graphButton">
               </sj:jonasbutton>
              </sj:gridcol>
            </sj:gridrow>
            <sj:gridrow>
              <sj:gridcol width="5%">Total Messages Received in Topics</sj:gridcol>
              <sj:gridcol width="5%">
                <bean:write name="nodeInfoForm"
                  property="jmsTopicsNbMsgsReceiveSinceCreation" />
              </sj:gridcol>
              <sj:gridcol width="5%">
                <sj:jonasbutton
                  href="javascript:submitHidden('ServerGraphForm','action','jmsTopicsNbMsgsReceiveSinceCreation')"
                  styleClass="graphButton">
               </sj:jonasbutton>
              </sj:gridcol>
            </sj:gridrow>
            <sj:gridrow>
              <sj:gridcol width="5%">Total Messages Delivered from Topics</sj:gridcol>
              <sj:gridcol width="5%">
                <bean:write name="nodeInfoForm"
                  property="jmsTopicsNbMsgsDeliverSinceCreation" />
              </sj:gridcol>
              <sj:gridcol width="5%">
                <sj:jonasbutton
                  href="javascript:submitHidden('ServerGraphForm','action','jmsTopicsNbMsgsDeliverSinceCreation')"
                  styleClass="graphButton">
               </sj:jonasbutton>
              </sj:gridcol>
            </sj:gridrow>
            <sj:gridrow>
              <sj:gridcol width="5%">Total Messages Sent to DMQ</sj:gridcol>
              <sj:gridcol width="5%">
                <bean:write name="nodeInfoForm"
                  property="jmsNbMsgsSendToDMQSinceCreation" />
              </sj:gridcol>
              <sj:gridcol width="5%">
                        </sj:gridcol>
            </sj:gridrow>
          </sj:jonasgrid>
        </logic:equal>

        <sj:jonasgrid>
          <sj:jgRowTitle>
            <sj:jgColTitle>EJBs</sj:jgColTitle>
          </sj:jgRowTitle>
        </sj:jonasgrid>
        <sj:jonasgrid>
          <sj:gridrow>
            <sj:gridcol width="19%">Number Of EJB</sj:gridcol>
            <sj:gridcol width="39%">
              <bean:write name="nodeInfoForm" property="currentNumberOfEJB" />
            </sj:gridcol>
            <sj:gridcol width="20%">
              <sj:jonasbutton
                href="javascript:submitHidden('ServerGraphForm','action','currentNumberOfEJB')"
                styleClass="graphButton">
               </sj:jonasbutton>
            </sj:gridcol>
          </sj:gridrow>
          <sj:gridrow>
            <sj:gridcol width="5%">Number Of EntityBean</sj:gridcol>
            <sj:gridcol width="5%">
              <bean:write name="nodeInfoForm" property="currentNumberOfEntity" />
            </sj:gridcol>
            <sj:gridcol width="5%">
              <sj:jonasbutton
                href="javascript:submitHidden('ServerGraphForm','action','currentNumberOfEntity')"
                styleClass="graphButton">
               </sj:jonasbutton>
            </sj:gridcol>
          </sj:gridrow>
          <sj:gridrow>
            <sj:gridcol width="5%">Number Of Stateful SessionBean</sj:gridcol>
            <sj:gridcol width="5%">
              <bean:write name="nodeInfoForm" property="currentNumberOfSBF" />
            </sj:gridcol>
            <sj:gridcol width="5%">
              <sj:jonasbutton
                href="javascript:submitHidden('ServerGraphForm','action','currentNumberOfSBF')"
                styleClass="graphButton">
               </sj:jonasbutton>
            </sj:gridcol>
          </sj:gridrow>
          <sj:gridrow>
            <sj:gridcol width="5%">Number Of Stateless SessionBean</sj:gridcol>
            <sj:gridcol width="5%">
              <bean:write name="nodeInfoForm" property="currentNumberOfSBL" />
            </sj:gridcol>
            <sj:gridcol width="5%">
              <sj:jonasbutton
                href="javascript:submitHidden('ServerGraphForm','action','currentNumberOfSBL')"
                styleClass="graphButton">
               </sj:jonasbutton>
            </sj:gridcol>
          </sj:gridrow>
          <sj:gridrow>
            <sj:gridcol width="5%">Number Of MessageDrivenBean</sj:gridcol>
            <sj:gridcol width="5%">
              <bean:write name="nodeInfoForm" property="currentNumberOfMDB" />
            </sj:gridcol>
            <sj:gridcol width="5%">
              <sj:jonasbutton
                href="javascript:submitHidden('ServerGraphForm','action','currentNumberOfMDB')"
                styleClass="graphButton">
               </sj:jonasbutton>
            </sj:gridcol>
          </sj:gridrow>
        </sj:jonasgrid>
      </logic:equal>


      <logic:notEqual name="state" value="RUNNING">
        <sj:jonasgrid>
          <sj:jgRowTitle>
            <sj:jgColTitle>Global</sj:jgColTitle>
          </sj:jgRowTitle>
        </sj:jonasgrid>
        <sj:jonasgrid>
          <sj:gridrow>
            <sj:jgName>
          State
        </sj:jgName>
            <sj:jgValue>
              <bean:write name="nodeInfoForm" property="state" />
            </sj:jgValue>
          </sj:gridrow>
        </sj:jonasgrid>
      </logic:notEqual>
    </sj:panel>
  </sj:tabs>


  <%@ include file="../common/end.jsp"%>
</html:form>
</body>
</html:html>