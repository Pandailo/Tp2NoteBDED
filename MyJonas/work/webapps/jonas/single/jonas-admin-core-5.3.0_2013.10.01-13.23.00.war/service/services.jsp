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
  <sj:tab forward="ActionListServices" selected="true"><bean:message key="tab.services"/></sj:tab>
  <sj:panel>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle>Mandatory services</sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle>&nbsp;</sj:jgColTitle>
        <sj:jgColTitle>&nbsp;</sj:jgColTitle>
        <sj:jgColTitle>&nbsp;</sj:jgColTitle>
      </sj:jgRowTitle>
      <logic:iterate id="item" indexId="index" name="mandServices">
        <sj:gridrow>
          <!-- DEPLOYED -->
          <logic:equal name="item" property="deployed" value="true">
            <sj:gridcol align="center" width="5%"><html:img src="../images/icon/deployed.gif"/></sj:gridcol>
          </logic:equal>
          <logic:notEqual name="item" property="deployed" value="true">
            <sj:gridcol width="5%">&nbsp;</sj:gridcol>
          </logic:notEqual>
          <sj:gridcol>
            <!-- NAME and Link -->
            <logic:present name="item" property="forward">
              <bean:define id="dataForward" name="item" property="forward" type="java.lang.String"/>
              <html:link forward="<%=dataForward%>" styleClass="panel">
                <bean:write name="item" property="name"/>
              </html:link>
            </logic:present>
            <logic:notPresent name="item" property="forward">
              <bean:write name="item" property="name"/>
            </logic:notPresent>
          </sj:gridcol>
          <sj:gridcol>
            <bean:write name="item" property="propName"/>
          </sj:gridcol>
        </sj:gridrow>
      </logic:iterate>
    </sj:jonasgrid>
    <sj:panelSeparator/>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle>Container services</sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle>&nbsp;</sj:jgColTitle>
        <sj:jgColTitle>&nbsp;</sj:jgColTitle>
        <sj:jgColTitle>&nbsp;</sj:jgColTitle>
      </sj:jgRowTitle>
      <logic:iterate id="item" indexId="index" name="contServices">
        <sj:gridrow>
          <bean:define id="serviceName" name="item" property="propName"/>
          <!-- DEPLOYED -->
          <logic:equal name="item" property="deployed" value="true">
            <sj:gridcol align="center" width="5%"><html:img src="../images/icon/deployed.gif"/></sj:gridcol>
          </logic:equal>
          <logic:notEqual name="item" property="deployed" value="true">
            <sj:gridcol width="5%">&nbsp;</sj:gridcol>
          </logic:notEqual>
          <sj:gridcol>
            <!-- NAME and Link -->
            <logic:present name="item" property="forward">
              <bean:define id="dataForward" name="item" property="forward" type="java.lang.String"/>
              <html:link forward="<%=dataForward%>" styleClass="panel">
                <bean:write name="item" property="name"/>
              </html:link>
            </logic:present>
            <logic:notPresent name="item" property="forward">
              <bean:write name="item" property="name"/>
            </logic:notPresent>
          </sj:gridcol>
          <sj:gridcol>
            <bean:write name="item" property="propName"/>
          </sj:gridcol>
          <logic:equal name="item" property="deployed" value="true">
            <sj:gridcol>
              <sj:jonasbutton forward="ActionStopJonasService" paramId="name" paramName="serviceName">
                <bean:message key="action.button.service.stop"/>
              </sj:jonasbutton>
            </sj:gridcol>
          </logic:equal>
          <logic:notEqual name="item" property="deployed" value="true">
            <sj:gridcol>
              <sj:jonasbutton forward="ActionStartJonasService" paramId="name" paramName="serviceName">
                <bean:message key="action.button.service.start"/>
              </sj:jonasbutton>
            </sj:gridcol>
          </logic:notEqual>
        </sj:gridrow>
      </logic:iterate>
    </sj:jonasgrid>
    <sj:panelSeparator/>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle>Webservices services</sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle>&nbsp;</sj:jgColTitle>
        <sj:jgColTitle>&nbsp;</sj:jgColTitle>
        <sj:jgColTitle>&nbsp;</sj:jgColTitle>
      </sj:jgRowTitle>
      <logic:iterate id="item" indexId="index" name="wsServices">
        <sj:gridrow>
          <bean:define id="serviceName" name="item" property="propName"/>
          <!-- DEPLOYED -->
          <logic:equal name="item" property="deployed" value="true">
            <sj:gridcol align="center" width="5%"><html:img src="../images/icon/deployed.gif"/></sj:gridcol>
          </logic:equal>
          <logic:notEqual name="item" property="deployed" value="true">
            <sj:gridcol width="5%">&nbsp;</sj:gridcol>
          </logic:notEqual>
          <sj:gridcol>
            <!-- NAME and Link -->
            <logic:present name="item" property="forward">
              <bean:define id="dataForward" name="item" property="forward" type="java.lang.String"/>
              <html:link forward="<%=dataForward%>" styleClass="panel">
                <bean:write name="item" property="name"/>
              </html:link>
            </logic:present>
            <logic:notPresent name="item" property="forward">
              <bean:write name="item" property="name"/>
            </logic:notPresent>
          </sj:gridcol>
          <sj:gridcol>
            <bean:write name="item" property="propName"/>
          </sj:gridcol>
          <logic:equal name="item" property="deployed" value="true">
            <sj:gridcol>
              <sj:jonasbutton forward="ActionStopJonasService" paramId="name" paramName="serviceName">
                <bean:message key="action.button.service.stop"/>
              </sj:jonasbutton>
            </sj:gridcol>
          </logic:equal>
          <logic:notEqual name="item" property="deployed" value="true">
            <sj:gridcol>
              <sj:jonasbutton forward="ActionStartJonasService" paramId="name" paramName="serviceName">
                <bean:message key="action.button.service.start"/>
              </sj:jonasbutton>
            </sj:gridcol>
          </logic:notEqual>
        </sj:gridrow>
      </logic:iterate>
    </sj:jonasgrid>
    <sj:panelSeparator/>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle>Other services</sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle>&nbsp;</sj:jgColTitle>
        <sj:jgColTitle>&nbsp;</sj:jgColTitle>
        <sj:jgColTitle>&nbsp;</sj:jgColTitle>
      </sj:jgRowTitle>
      <logic:iterate id="item" indexId="index" name="listServices">
        <sj:gridrow>
          <bean:define id="serviceName" name="item" property="propName"/>
          <!-- DEPLOYED -->
          <logic:equal name="item" property="deployed" value="true">
            <sj:gridcol align="center" width="5%"><html:img src="../images/icon/deployed.gif"/></sj:gridcol>
          </logic:equal>
          <logic:notEqual name="item" property="deployed" value="true">
            <sj:gridcol width="5%">&nbsp;</sj:gridcol>
          </logic:notEqual>
          <sj:gridcol>
            <!-- NAME and Link -->
            <logic:present name="item" property="forward">
              <bean:define id="dataForward" name="item" property="forward" type="java.lang.String"/>
              <html:link forward="<%=dataForward%>" styleClass="panel">
                <bean:write name="item" property="name"/>
              </html:link>
            </logic:present>
            <logic:notPresent name="item" property="forward">
              <bean:write name="item" property="name"/>
            </logic:notPresent>
          </sj:gridcol>
          <sj:gridcol>
            <bean:write name="item" property="propName"/>
          </sj:gridcol>
          <logic:equal name="item" property="deployed" value="true">
            <sj:gridcol>
              <sj:jonasbutton forward="ActionStopJonasService" paramId="name" paramName="serviceName">
                <bean:message key="action.button.service.stop"/>
              </sj:jonasbutton>
            </sj:gridcol>
          </logic:equal>
          <logic:notEqual name="item" property="deployed" value="true">
            <sj:gridcol>
              <sj:jonasbutton forward="ActionStartJonasService" paramId="name" paramName="serviceName">
                <bean:message key="action.button.service.start"/>
              </sj:jonasbutton>
            </sj:gridcol>
          </logic:notEqual>
        </sj:gridrow>
      </logic:iterate>
    </sj:jonasgrid>

    <sj:panelSeparator/>

    <sj:jonasgrid globalRowStyleClass="panel">
      <sj:gridrow>
         <sj:gridcol align="center">
          <sj:jonasbutton forward="ActionListServices">
            <bean:message key="action.button.services.refresh"/>
          </sj:jonasbutton>
         </sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

