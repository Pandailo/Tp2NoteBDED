<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/ApplyDestinations">
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionListJmsResources" selected="true"><bean:message key="tab.resource.destinations"/></sj:tab>
  <sj:panel>
    <sj:jonasgrid>
      <sj:jgRowTitle level="2">
        <sj:jgColTitle><bean:message key="title.resource.jmsResources.action"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow changeStyle="true">
        <sj:gridcol>
          <sj:grid cellPadding="10">
            <sj:gridrow>
              <sj:gridcol>
                <sj:jonasbutton forward="ActionEditDestination">
                  <bean:message key="button.resource.jmsResources.action.create"/>
                </sj:jonasbutton>
              </sj:gridcol>
              <sj:gridcol>
                <sj:jonasbutton href="javascript:submitForm('itemsDestinationsForm')">
                  <bean:message key="button.resource.jmsResources.action.remove"/>
                </sj:jonasbutton>
              </sj:gridcol>
              <sj:gridcol>
                <sj:jonasbutton forward="ActionSaveDestination">
                  <bean:message key="button.resource.jmsResources.action.save"/>
                </sj:jonasbutton>
              </sj:gridcol>
            </sj:gridrow>
          </sj:grid>
        </sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>

    <sj:panelSeparator/>

    <sj:jonasgrid>
      <bean:size id="listSize" name="destinationsList"/>
      <logic:equal name="listSize" value="0">
        <sj:gridrow>
          <sj:gridcol><bean:message key="message.resource.destinations.none"/></sj:gridcol>
        </sj:gridrow>
      </logic:equal>
      <logic:notEqual name="listSize" value="0">
        <sj:jgRowTitle>
          <sj:jgColTitle>&nbsp;</sj:jgColTitle>
          <sj:jgColTitle><bean:message key="label.resource.destinations.name"/></sj:jgColTitle>
          <sj:jgColTitle><bean:message key="label.resource.destinations.type"/></sj:jgColTitle>
        </sj:jgRowTitle>

        <logic:iterate id="item" name="destinationsList">
          <sj:gridrow>
            <sj:gridcol width="5%">
              <logic:equal name="item" property="used" value="false">
                <html:multibox property="selectedItems">
                  <bean:write name="item" property="name"/>
                </html:multibox>
              </logic:equal>
            </sj:gridcol>
            <sj:gridcol width="17%">
              <logic:equal name="item" property="type" value="queue">
                <html:link forward="ActionPresentQueue" styleClass="panel" paramId="name"  paramName="item" paramProperty="name">
                  <bean:write name="item" property="name"/>
                </html:link>
              </logic:equal>
              <logic:equal name="item" property="type" value="topic">
                <html:link forward="ActionPresentTopic" styleClass="panel" paramId="name"  paramName="item" paramProperty="name">
                  <bean:write name="item" property="name"/>
                </html:link>
              </logic:equal>
            </sj:gridcol>
            <sj:gridcol>
              <bean:write name="item" property="type"/>
            </sj:gridcol>
          </sj:gridrow>
        </logic:iterate>
      </logic:notEqual>
    </sj:jonasgrid>

  </sj:panel>
</sj:tabs>
</html:form>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>
