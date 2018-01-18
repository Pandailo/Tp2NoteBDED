<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>
<body class="content">
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionTomcatMemberInfo" selected="true">
    <bean:write name="tomcatMemberForm" property="name"/>
  </sj:tab>
  <sj:panel>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle>Info</sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName>
          Host
        </sj:jgName>
        <sj:jgValue>
          <bean:write name="tomcatMemberForm" property="host"/>
        </sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName>
          State
        </sj:jgName>
        <sj:jgValue>
          <bean:write name="tomcatMemberForm" property="state"/>
        </sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>

    <logic:equal name="tomcatMemberForm" property="state" value="RUNNING">

    <sj:panelSeparator/>

    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle>Receiver info</sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName>
          Version info
        </sj:jgName>
        <sj:jgValue>
          <bean:write name="tomcatMemberForm" property="receiverInfo"/>
        </sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName>
          TCP listener address
        </sj:jgName>
        <sj:jgValue>
          <bean:write name="tomcatMemberForm" property="tcpListenAddress"/>
        </sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName>
          TCP listener port
        </sj:jgName>
        <sj:jgValue>
          <bean:write name="tomcatMemberForm" property="tcpListenPort"/>
        </sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName>
          Number of TCP listener worker threads
        </sj:jgName>
        <sj:jgValue>
          <bean:write name="tomcatMemberForm" property="tcpThreadCount"/>
        </sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>

    <sj:panelSeparator/>

    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle>Sender info</sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName>
          Version info
        </sj:jgName>
        <sj:jgValue>
          <bean:write name="tomcatMemberForm" property="senderInfo"/>
        </sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName>
          Replication mode
        </sj:jgName>
        <sj:jgValue>
          <bean:write name="tomcatMemberForm" property="replicationMode"/>
        </sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName>
          Acknowledge timeout
        </sj:jgName>
        <sj:jgValue>
          <bean:write name="tomcatMemberForm" property="ackTimeout"/>
        </sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName>
          AutoConnect
        </sj:jgName>
        <sj:jgValue>
          <bean:write name="tomcatMemberForm" property="autoConnect"/>
        </sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName>
          Create processing time stats
        </sj:jgName>
        <sj:jgValue>
          <bean:write name="tomcatMemberForm" property="doTransmitterProcessingStats"/>
        </sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName>
          Wait for ack after data send
        </sj:jgName>
        <sj:jgValue>
          <bean:write name="tomcatMemberForm" property="waitForAck"/>
        </sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>
    </logic:equal>

  </sj:panel>
</sj:tabs>
<%@ include file="../common/end.jsp" %>
</body>
</html:html>