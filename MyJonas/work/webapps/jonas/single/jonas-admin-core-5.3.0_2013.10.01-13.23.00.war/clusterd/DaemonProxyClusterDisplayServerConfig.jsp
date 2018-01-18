<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj"%>
<html:html locale="true">
<%@ include file="../common/begin.jsp"%>
<body class="content">
<html:form action="/ServerConfigModified">
  <sj:titleContent usingWhere="true" tomThumb="true" />
  <sj:tabs usingWhere="true" heightTab="20">
    <sj:tab forward="ActionDaemonProxyClusterInfo">
     <bean:write name="clusterdServerForm" property="cdName" /> infos
    </sj:tab>
    <sj:tab forward="ActionCreateJonasServer">
      <bean:message key="tab.cd.server.add" />
    </sj:tab>
    <sj:tab forward="ActionDaemonProxyClusterConfigureServer"
      selected="true">
      <bean:write name="clusterdServerForm" property="name" /> Config.
    </sj:tab>
    <sj:panel>
    <sj:jonasgrid>
        <!--Server name-->
        <sj:gridrow>
          <sj:jgName>Name</sj:jgName>
          <sj:jgValue>
            <bean:write name="clusterdServerForm" property="name"/>
          </sj:jgValue>
        </sj:gridrow>
      <!--Server state-->
      <sj:gridrow>
        <sj:jgName>State</sj:jgName>
        <sj:jgValue>
          <bean:write name="clusterdServerForm" property="state" />
        </sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName>Description</sj:jgName>
        <sj:jgValue>
          <html:text name="clusterdServerForm" property="description"
            maxlength="100" style=" width : 251px;" />
        </sj:jgValue>
      </sj:gridrow>

      <logic:equal name="clusterdServerForm" property="state" value="RUNNING">
      <!-- Some configurations have already been set -->
      <sj:gridrow>
        <sj:jgName>java Home</sj:jgName>
        <sj:jgValue>
          <html:text name="clusterdServerForm" property="javaHome" maxlength="50" style=" width : 251px;" disabled="false">
          </html:text>
        </sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName>Jonas Root</sj:jgName>
        <sj:jgValue>
          <html:text name="clusterdServerForm" property="jonasRoot" maxlength="50" style=" width : 251px;" disabled="false">
          </html:text>
        </sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName>Jonas Base</sj:jgName>
        <sj:jgValue>
          <html:text name="clusterdServerForm" property="jonasBase" maxlength="50" style=" width : 251px;" disabled="false">
          </html:text>
        </sj:jgValue>
      </sj:gridrow>
      </logic:equal>

       <logic:notEqual name="clusterdServerForm" property="state" value="RUNNING">
      <!-- Some configurations have already been set -->
      <sj:gridrow>
        <sj:jgName>java Home</sj:jgName>
        <sj:jgValue>
          <html:text name="clusterdServerForm" property="javaHome" maxlength="50" style=" width : 251px;" disabled="false" onblur="checkNotEmpty(this.id)" >
          </html:text>
        </sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName>Jonas Root</sj:jgName>
        <sj:jgValue>
          <html:text name="clusterdServerForm" property="jonasRoot" maxlength="50" style=" width : 251px;" disabled="false" onblur="checkNotEmpty(this.id)" >
          </html:text>
        </sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName>Jonas Base</sj:jgName>
        <sj:jgValue>
          <html:text name="clusterdServerForm" property="jonasBase" maxlength="50" style=" width : 251px;" disabled="false" onblur="checkNotEmpty(this.id)" >
          </html:text>
        </sj:jgValue>
      </sj:gridrow>
      </logic:notEqual>

      <sj:gridrow>
        <sj:jgName>Extra parameter</sj:jgName>
        <sj:jgValue>
          <html:text name="clusterdServerForm" property="xprem" maxlength="50" style=" width : 251px;"/>
        </sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName>Auto Boot</sj:jgName>
        <sj:jgValue>
          <html:text name="clusterdServerForm" property="autoBoot" maxlength="6" />
        </sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>
    <sj:panelSeparator />
        <sj:jonasgrid globalRowStyleClass="panel">
          <sj:gridrow>
            <sj:gridcol>
              <sj:gridcol>
                <!--Adding the checked servers-->
                <sj:jonasbutton
                  href="javascript:submitForm('clusterdServerForm')"
                  disabled="false" styleClass="button">
                  Confirm configuration
                </sj:jonasbutton>
              </sj:gridcol>
            </sj:gridcol>
          </sj:gridrow>
        </sj:jonasgrid>
    </sj:panel>
  </sj:tabs>
</html:form>
<%@ include file="../common/end.jsp"%>
</body>
</html:html>
