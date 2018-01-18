<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionEditDeploy"><bean:message key="tab.deployment"/></sj:tab>
  <sj:tab forward="ActionListMailFactories" selected="true"><bean:message key="tab.resource.mailfactories"/></sj:tab>
  <sj:panel>
    <sj:jonasgrid>
      <sj:jgRowTitle level="2">
        <sj:jgColTitle><bean:message key="title.resource.mailfactories.action"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow changeStyle="true">
        <sj:jgName>
          <bean:define id="action" value="create"/>
          <sj:jonasbutton forward="ActionEditMailFactoryProperties" paramId="action" paramName="action">
            <bean:message key="button.resource.mailfactories.action.create"/>
          </sj:jonasbutton>
        </sj:jgName>
        <sj:jgValue><bean:message key="comment.resource.mailfactories.action.create"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
      </sj:gridrow>
    </sj:jonasgrid>

    <sj:panelSeparator/>

    <sj:jonasgrid>
      <bean:size id="listSize" name="listMailFactories"/>
      <logic:equal name="listSize" value="0">
        <sj:gridrow>
          <sj:gridcol><bean:message key="message.resource.mailfactories.none"/></sj:gridcol>
        </sj:gridrow>
      </logic:equal>
      <logic:notEqual name="listSize" value="0">
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="label.resource.mailfactories.deployed"/></sj:jgColTitle>
          <sj:jgColTitle><bean:message key="label.resource.mailfactories.name"/></sj:jgColTitle>
        </sj:jgRowTitle>
        <logic:iterate id="item" name="listMailFactories">
          <sj:gridrow>
            <!-- DEPLOYED -->
            <logic:equal name="item" property="deployed" value="true">
              <sj:gridcol width="5%" align="right"><html:img src="../images/icon/deployed.gif"/>&nbsp;</sj:gridcol>
              <logic:equal name="item" property="type" value="session">
                <sj:gridcol>
                  <html:link forward="ActionEditSessionMailFactory" styleClass="panel"
                    paramId="name" paramName="item" paramProperty="name">
                    <bean:write name="item" property="name"/>
                  </html:link>
                </sj:gridcol>
              </logic:equal>
              <logic:equal name="item" property="type" value="mimepart">
                <sj:gridcol>
                  <html:link forward="ActionEditMimePartMailFactory" styleClass="panel"
                    paramId="name" paramName="item" paramProperty="name">
                    <bean:write name="item" property="name"/>
                  </html:link>
                </sj:gridcol>
              </logic:equal>
            </logic:equal>
            <!-- NOT DEPLOYED -->
            <logic:equal name="item" property="deployed" value="false">
              <sj:gridcol width="5%">&nbsp;</sj:gridcol>
              <logic:equal name="item" property="type" value="session">
                <sj:gridcol>
                  <html:link forward="ActionEditSessionMailFactoryProperties" styleClass="panel"
                    paramId="name" paramName="item" paramProperty="name">
                    <bean:write name="item" property="name"/>
                  </html:link>
                </sj:gridcol>
              </logic:equal>
              <logic:equal name="item" property="type" value="mimepart">
                <sj:gridcol>
                  <html:link forward="ActionEditMimePartMailFactoryProperties" styleClass="panel"
                    paramId="name" paramName="item" paramProperty="name">
                    <bean:write name="item" property="name"/>
                  </html:link>
                </sj:gridcol>
              </logic:equal>
            </logic:equal>
          </sj:gridrow>
        </logic:iterate>
      </logic:notEqual>
    </sj:jonasgrid>

  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>
