<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="/common/begin.jsp" %>
<body class="content">
<html:form action="/JonasMqConnectDestinationDelete">
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">

  <sj:tab forward="JonasMqConnectPlatformAction"><bean:message key="tab.jonasmqconnect.servers"/></sj:tab>
  <sj:tab forward="JonasMqConnectStartAction"><bean:write name="mqconnector" /></sj:tab>
  <sj:tab forward="JonasMqConnectDestinationsAction"><bean:message key="tab.jonasmqconnect.destinations"/></sj:tab>
  <sj:tab forward="JonasMqConnectMdbsAction" selected="true"><bean:message key="tab.jonasmqconnect.mdbs"/></sj:tab>
  <sj:panel>
    <bean:size id="listSize" name="mqmdbs"/>
    <sj:jonasgrid>
      <logic:equal name="listSize" value="0">
        <sj:gridrow>
          <sj:gridcol>
            <bean:message key="message.joansmqconnect.none"/>
          </sj:gridcol>
        </sj:gridrow>
      </logic:equal>
      <logic:notEqual name="listSize" value="0">
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="label.joansmqconnect.mdb.name"/></sj:jgColTitle>
          <sj:jgColTitle><bean:message key="label.joansmqconnect.mdb.destinationname"/></sj:jgColTitle>
          <sj:jgColTitle><bean:message key="label.joansmqconnect.mdb.numbermsg"/></sj:jgColTitle>
        </sj:jgRowTitle>

        <logic:iterate id="item" name="mqmdbs">
          <sj:gridrow>
            <sj:gridcol width="17%">
                <html:link action="/JonasMqConnectMdbEdit.do" styleClass="panel" paramId="name" paramName="item" paramProperty="name">
                  <bean:write name="item" property="name"/>
                </html:link>
            </sj:gridcol>
            <sj:gridcol>
              <bean:write name="item" property="mqDestination"/>
            </sj:gridcol>
            <sj:gridcol>
              <bean:write name="item" property="numberMsg"/>
            </sj:gridcol>
          </sj:gridrow>
        </logic:iterate>
      </logic:notEqual>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>
</html:form>
</body>
<%@ include file="/common/end.jsp" %>
</html:html>