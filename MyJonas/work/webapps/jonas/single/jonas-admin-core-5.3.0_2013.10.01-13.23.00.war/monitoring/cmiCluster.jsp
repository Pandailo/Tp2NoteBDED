<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>
<body class="content">
<html:form action="/ApplyCmiClusterConfiguration">
<meta HTTP-EQUIV="Page-Enter" CONTENT="revealtrans(duration=4.0, transition=4)">
<meta HTTP-EQUIV="Page-Exit" CONTENT="revealtrans(duration=4.0, transition=5)">
<meta http-equiv="refresh" content="15"; URL="CmiClusterInfo.do">
<html:hidden property="action"/>

<sj:titleContent usingWhere="true" tomThumb="true"/>

<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionCmiClusterInfo" selected="true">
    <bean:write name="cmiClusterForm" property="name"/>
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
          State
        </sj:jgName>
        <sj:jgValue>
          <bean:write name="cmiClusterForm" property="state"/>
        </sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>
    <sj:panelSeparator/>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle>Configuration</sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName>
          McastAddr
        </sj:jgName>
        <sj:jgValue>
          <bean:write name="cmiClusterForm" property="mcastAddr"/>
        </sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName>
          McastPort
        </sj:jgName>
        <sj:jgValue>
          <bean:write name="cmiClusterForm" property="mcastPort"/>
        </sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName>
          Protocol
        </sj:jgName>
        <sj:jgValue>
          <bean:write name="cmiClusterForm" property="protocol"/>
        </sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName>
          DelayToRefresh
        </sj:jgName>
        <sj:jgValue>
          <html:text name="cmiClusterForm" property="delayToRefresh"/>
        </sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>

    <sj:panelSeparator/>

    <sj:jonasgrid globalRowStyleClass="panel">
      <sj:gridrow>
        <sj:jgName></sj:jgName>
        <sj:gridcol>
          <sj:jonasbutton href="javascript:submitHidden('cmiClusterForm','action','apply')">
            <bean:message key="button.apply"/>
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

