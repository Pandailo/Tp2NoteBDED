<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="/common/begin.jsp" %>
<body class="content">
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="JonasMqConnectPlatformForm" selected="true"><bean:message key="tab.jonasmqconnect.servers"/></sj:tab>
  <sj:panel>
    <bean:size id="listSize" name="mqconnectors"/>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.joansmqconnect.servers"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>

    <sj:panelSeparator/>

    <sj:jonasgrid>
      <logic:equal name="listSize" value="0">
        <sj:gridrow>
          <sj:gridcol>
            <bean:message key="message.joansmqconnect.server.none"/>
          </sj:gridcol>
        </sj:gridrow>
      </logic:equal>
      <logic:notEqual name="listSize" value="0">
        <logic:iterate id="item" name="mqconnectors">
          <sj:gridrow>
            <sj:gridcol>
                <html:link action="/JonasMqConnect.do?operation=view" styleClass="panel" paramId="connector" paramName="item" paramProperty="value">
                  <bean:write name="item" property="value"/>
                </html:link>
            </sj:gridcol>
          </sj:gridrow>
        </logic:iterate>
      </logic:notEqual>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>
</body>
<%@ include file="/common/end.jsp" %>
</html:html>