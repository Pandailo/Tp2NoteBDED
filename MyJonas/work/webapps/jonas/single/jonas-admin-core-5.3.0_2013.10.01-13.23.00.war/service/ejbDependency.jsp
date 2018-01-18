<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.action.Action"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionListContainers"><bean:message key="tab.ejbcontainers"/></sj:tab>
  <sj:tab forward="ActionViewContainer"><bean:write name="containerForm" property="filename"/></sj:tab>
  <sj:tab forward="ActionEditContainerStatistic"><bean:message key="tab.container.statistic"/></sj:tab>
  <sj:tab forward="ActionViewContainerEjbs"><bean:message key="tab.container.ejbs"/></sj:tab>
  <logic:equal name="ejbForm" property="type" value="EntityBean">
    <sj:tab forward="Ejb Entity"><bean:write name="ejbForm" property="name"/></sj:tab>
  </logic:equal>
  <logic:equal name="ejbForm" property="type" value="StatefulSessionBean">
    <sj:tab forward="Ejb Session"><bean:write name="ejbForm" property="name"/></sj:tab>
  </logic:equal>
  <logic:equal name="ejbForm" property="type" value="StatelessSessionBean">
    <sj:tab forward="Ejb Session"><bean:write name="ejbForm" property="name"/></sj:tab>
  </logic:equal>
  <logic:equal name="ejbForm" property="type" value="MessageDrivenBean">
    <sj:tab forward="Ejb Message"><bean:write name="ejbForm" property="name"/></sj:tab>
  </logic:equal>
  <logic:equal name="ejbForm" property="dependency" value="true">
    <sj:tab forward="Ejb Dependency" selected="true"><bean:message key="tab.ejb.dependency"/></sj:tab>
  </logic:equal>
  <sj:panel>
<!-- Datasource -->
    <logic:equal name="ejbForm" property="dataSource" value="true">
      <sj:jonasgrid>
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="title.ejb.dependency.datasource"/></sj:jgColTitle>
        </sj:jgRowTitle>
      </sj:jonasgrid>
      <logic:equal name="ejbForm" property="resourceServiceActivated" value="true">
        <sj:jonasgrid>
        <logic:iterate id="map" name="ejbForm" property="jdbcRas">
          <sj:gridrow>
            <sj:jgName></sj:jgName>
            <sj:jgValue>
              <html:link forward="ActionEditResourceAdapter" styleClass="panel"
                paramId="select" paramName="map" paramProperty="value">
                <bean:write name="map" property="key"/>
              </html:link>
            </sj:jgValue>
          </sj:gridrow>
        </logic:iterate>
        </sj:jonasgrid>
      </logic:equal>
      <logic:equal name="ejbForm" property="databaseServiceActivated" value="true">
        <sj:jonasgrid>
        <logic:iterate id="map" name="ejbForm" property="dataSources">
          <sj:gridrow>
            <sj:jgName><bean:write name="map" property="key"/></sj:jgName>
            <sj:jgValue>
              <html:link forward="ActionEditDatasource" styleClass="panel"
                paramId="name" paramName="map" paramProperty="value">
                <bean:write name="map" property="value"/>
              </html:link>
            </sj:jgValue>
          </sj:gridrow>
        </logic:iterate>
        </sj:jonasgrid>
      </logic:equal>
    <sj:panelSeparator/>
    </logic:equal>

<!-- JMS Connection-->
    <logic:equal name="ejbForm" property="jmsConnection" value="true">
      <sj:jonasgrid>
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="title.ejb.dependency.jms.connection"/></sj:jgColTitle>
        </sj:jgRowTitle>
      </sj:jonasgrid>
      <logic:equal name="ejbForm" property="jmsServiceActivated" value="false">
        <logic:equal name="ejbForm" property="joramResourceLoaded" value="false">
        	<sj:jonasgrid>
          	<sj:gridrow styleClass="errors">
            	<sj:gridcol styleClass="errors"><bean:message key="warning.jonas.jms.notActivated"/></sj:gridcol>
          	</sj:gridrow>
        	</sj:jonasgrid>
      	</logic:equal>
      </logic:equal>
      <sj:jonasgrid>
        <logic:iterate id="list" name="ejbForm" property="jmsConnections">
          <sj:gridrow>
            <sj:jgName></sj:jgName>
            <sj:jgValue><bean:write name="list"/></sj:jgValue>
          </sj:gridrow>
        </logic:iterate>
      </sj:jonasgrid>
    <sj:panelSeparator/>
    </logic:equal>

<!-- JMS Destination-->
    <logic:equal name="ejbForm" property="jmsDestination" value="true">
      <sj:jonasgrid>
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="title.ejb.dependency.jms.destination"/></sj:jgColTitle>
        </sj:jgRowTitle>
      </sj:jonasgrid>
      <logic:equal name="ejbForm" property="jmsServiceActivated" value="false">
        <logic:equal name="ejbForm" property="joramResourceLoaded" value="false">
         <sj:jonasgrid>
           <sj:gridrow styleClass="errors">
             <sj:gridcol styleClass="errors"><bean:message key="warning.jonas.jms.notActivated"/></sj:gridcol>
           </sj:gridrow>
         </sj:jonasgrid>
        </logic:equal>
      </logic:equal>

      <logic:equal name="ejbForm" property="jmsServiceActivated" value="true">
      <sj:jonasgrid>
        <logic:iterate id="list" name="ejbForm" property="jmsDestinations">
          <sj:gridrow>
            <sj:jgName></sj:jgName>
            <sj:jgValue><bean:write name="list"/></sj:jgValue>
          </sj:gridrow>
        </logic:iterate>
      </sj:jonasgrid>
      </logic:equal>

      <logic:equal name="ejbForm" property="joramResourceLoaded" value="true">
      <sj:jonasgrid>
        <logic:iterate id="element" name="ejbForm" property="jmsDestinations">
          <logic:present name="element" property="type">
            <bean:define id="param1" name="element" property="name"/>
            <bean:define id="param2" name="element" property="serverId"/>
            <%
              java.util.HashMap params = new java.util.HashMap();
		      params.put("name", param1);
              params.put("id", param2);
              pageContext.setAttribute("paramsName", params);
            %>
            <logic:equal name="element" property="type" value="topic">
              <sj:gridrow>
                <sj:jgName>
                  <!--
                  <html:link forward="ActionEditJoramTopic" styleClass="panel"
                    paramId="name" paramName="element" paramProperty="name">
                    <bean:write name="element" property="name"/>
                  </html:link>
                  -->
                  <html:link forward="ActionEditJoramTopic" styleClass="panel" name="paramsName">
                    <bean:write name="element" property="name"/>
                  </html:link>
                </sj:jgName>
                <sj:jgValue></sj:jgValue>
              </sj:gridrow>
            </logic:equal>
            <logic:equal name="element" property="type" value="queue">
              <sj:gridrow>
                <sj:jgName>
                  <html:link forward="ActionEditJoramQueue" styleClass="panel" name="paramsName">
                    <bean:write name="element" property="name"/>
                  </html:link>
                </sj:jgName>
                <sj:jgValue></sj:jgValue>
              </sj:gridrow>
            </logic:equal>
          </logic:present>
          <logic:notPresent name="element" property="type">
          <sj:gridrow>
            <sj:jgName><bean:write name="element" property="name"/></sj:jgName>
            <sj:jgValue></sj:jgValue>
          </sj:gridrow>
          </logic:notPresent>
        </logic:iterate>
      </sj:jonasgrid>
      </logic:equal>
    <sj:panelSeparator/>
    </logic:equal>

<!-- Mail Session -->
    <logic:equal name="ejbForm" property="mailSession" value="true">
      <sj:jonasgrid>
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="title.ejb.dependency.mail.session"/></sj:jgColTitle>
        </sj:jgRowTitle>
      </sj:jonasgrid>
      <logic:equal name="ejbForm" property="mailServiceActivated" value="false">
        <sj:jonasgrid>
          <sj:gridrow styleClass="errors">
            <sj:gridcol styleClass="errors"><bean:message key="warning.jonas.service.mail.notActivated"/></sj:gridcol>
          </sj:gridrow>
        </sj:jonasgrid>
      </logic:equal>
      <sj:jonasgrid>
        <logic:iterate id="map" name="ejbForm" property="mailSessions">
          <sj:gridrow>
            <logic:equal name="map" property="value" value="">
              <sj:jgName><bean:write name="map" property="key"/></sj:jgName>
              <sj:jgValue>
                <html:img src="../images/icon/deployed_not.gif"/>
              </sj:jgValue>
            </logic:equal>
            <logic:notEqual name="map" property="value" value="">
              <sj:jgName></sj:jgName>
              <sj:jgValue>
                <html:link forward="ActionEditSessionMailFactory" styleClass="panel"
                  paramId="name" paramName="map" paramProperty="value">
                  <bean:write name="map" property="key"/>
                </html:link>
              </sj:jgValue>
            </logic:notEqual>
          </sj:gridrow>
        </logic:iterate>
      </sj:jonasgrid>
    <sj:panelSeparator/>
    </logic:equal>

<!-- MimePartMail -->
    <logic:equal name="ejbForm" property="mailMime" value="true">
      <sj:jonasgrid>
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="title.ejb.dependency.mail.mime"/></sj:jgColTitle>
        </sj:jgRowTitle>
      </sj:jonasgrid>
      <logic:equal name="ejbForm" property="mailServiceActivated" value="false">
        <sj:jonasgrid>
          <sj:gridrow styleClass="errors">
            <sj:gridcol styleClass="errors"><bean:message key="warning.jonas.service.mail.notActivated"/></sj:gridcol>
          </sj:gridrow>
        </sj:jonasgrid>
      </logic:equal>
      <sj:jonasgrid>
        <logic:iterate id="map" name="ejbForm" property="mailMimes">
          <sj:gridrow>
            <logic:equal name="map" property="value" value="">
              <sj:jgName><bean:write name="map" property="key"/></sj:jgName>
              <sj:jgValue>
                <html:img src="../images/icon/deployed_not.gif"/>
              </sj:jgValue>
            </logic:equal>
            <logic:notEqual name="map" property="value" value="">
              <sj:jgName></sj:jgName>
              <sj:jgValue>
                <html:link forward="ActionEditMimePartMailFactory" styleClass="panel"
                  paramId="name" paramName="map" paramProperty="value">
                  <bean:write name="map" property="key"/>
                </html:link>
              </sj:jgValue>
            </logic:notEqual>
          </sj:gridrow>
        </logic:iterate>
      </sj:jonasgrid>
    <sj:panelSeparator/>
    </logic:equal>
  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>