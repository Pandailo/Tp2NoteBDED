<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ApplyLoggers">
<html:hidden property="action"/>
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionListLoggers" selected="true"><bean:message key="tab.loggers"/></sj:tab>
  <sj:panel>
    <bean:size id="listSize" name="listLoggers"/>
    <logic:equal name="WhereAreYou" property="catalinaServer" value="true">
      <sj:jonasgrid>
        <sj:jgRowTitle level="2">
          <sj:jgColTitle><bean:message key="title.loggers.action"/></sj:jgColTitle>
        </sj:jgRowTitle>
      </sj:jonasgrid>
      <sj:jonasgrid>
        <sj:gridrow changeStyle="true">
          <sj:gridcol>
            <sj:grid cellPadding="10">
              <sj:gridrow>
                <sj:gridcol>
                  <bean:define id="typeAction" value="create"/>
                  <sj:jonasbutton forward="ActionEditCatalinaAccessLogger" paramId="action" paramName="typeAction">
                    <bean:message key="button.loggers.catalina.access.create"/>
                  </sj:jonasbutton>
                </sj:gridcol>
                <!-- several loggers -->
                <logic:greaterThan name="listSize" value="1">
                  <sj:gridcol>
                    <sj:jonasbutton href="javascript:submitHidden('itemsLoggersForm','action','remove')"><bean:message key="button.remove"/></sj:jonasbutton>
                  </sj:gridcol>
                </logic:greaterThan>
              </sj:gridrow>
            </sj:grid>
          </sj:gridcol>
        </sj:gridrow>
      </sj:jonasgrid>
      <sj:panelSeparator/>
    </logic:equal>

    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle>&nbsp;</sj:jgColTitle>
        <sj:jgColTitle><bean:message key="title.loggers.name"/></sj:jgColTitle>
        <sj:jgColTitle><bean:message key="title.loggers.container"/></sj:jgColTitle>
        <sj:jgColTitle><bean:message key="title.loggers.container.name"/></sj:jgColTitle>
      </sj:jgRowTitle>
      <logic:iterate id="item" name="listLoggers">
        <sj:gridrow>
          <logic:notPresent name="item" property="objectName">
            <sj:gridcol width="5%">&nbsp;</sj:gridcol>
          </logic:notPresent>
          <logic:present name="item" property="objectName">
            <sj:gridcol width="5%">
              <html:multibox property="selectedItemsArray">
                <bean:write name="item" property="objectName"/>
              </html:multibox>
            </sj:gridcol>
          </logic:present>
          <sj:gridcol>
            <bean:define id="dataForward" name="item" property="forward" type="java.lang.String"/>
            <html:link forward="<%=dataForward%>" styleClass="panel" paramId="select" paramName="item" paramProperty="objectName">
              <bean:write name="item" property="name"/>
            </html:link>
          </sj:gridcol>
          <sj:gridcol>
            <bean:write name="item" property="containerType"/>
          </sj:gridcol>
          <sj:gridcol>
            <bean:write name="item" property="containerName"/>
          </sj:gridcol>
        </sj:gridrow>
      </logic:iterate>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>
</html:form>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

