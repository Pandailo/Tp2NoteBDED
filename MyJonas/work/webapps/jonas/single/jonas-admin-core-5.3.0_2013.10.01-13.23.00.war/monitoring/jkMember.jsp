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
  <sj:tab forward="ActionJkMemberInfo" selected="true">
    <bean:write name="jkMemberForm" property="name"/>
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
          <bean:write name="jkMemberForm" property="host"/>
        </sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName>
          State
        </sj:jgName>
        <sj:jgValue>
          <bean:write name="jkMemberForm" property="state"/>
        </sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>

    <logic:equal name="jkMemberForm" property="state" value="RUNNING">

    <sj:panelSeparator/>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle>Jk worker info</sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName>
          Load balance factor
        </sj:jgName>
        <sj:jgValue>
          <bean:write name="jkMemberForm" property="lbfactor"/>
        </sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName>
          Type
        </sj:jgName>
        <sj:jgValue>
          <bean:write name="jkMemberForm" property="type"/>
        </sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName>
          Port
        </sj:jgName>
        <sj:jgValue>
          <bean:write name="jkMemberForm" property="port"/>
        </sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>
    </logic:equal>

  </sj:panel>
</sj:tabs>
<%@ include file="../common/end.jsp" %>
</body>
</html:html>