<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>

<body class="content">
<html:form action="/resourceAdapterForm">
<html:hidden property="action"/>

<sj:titleContent usingWhere="true" tomThumb="true"/>
<sj:tabs usingWhere="true" heightTab="20">
  <sj:tab forward="ActionListResourceAdapters"><bean:message key="tab.resourceadapters"/></sj:tab>
  <sj:tab forward="ActionEditResourceAdapter" selected="true">
    <bean:write name="resourceAdapterForm" property="name"/>
  </sj:tab>
  <sj:tab forward="ActionEditResourceAdapterStat"><bean:message key="tab.resourceadapter.rar.statistics"/></sj:tab>
  <bean:size id="listSize" name="resourceAdapterForm" property="listUsedByEjb"/>
  <logic:notEqual name="listSize" value="0">
    <sj:tab forward="ResourceAdapter Used By1.0"><bean:message key="tab.resourceadapter.rar.usedby"/></sj:tab>
  </logic:notEqual>

  <sj:panel>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.resourceadapter"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.name"/></sj:jgName>
        <sj:jgValue><bean:write name="resourceAdapterForm" property="name"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.jndiname"/></sj:jgName>
        <sj:jgValue><bean:write name="resourceAdapterForm" property="jndiName"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.file"/></sj:jgName>
        <sj:jgValue><bean:write name="resourceAdapterForm" property="file"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.path"/></sj:jgName>
        <sj:jgValue><bean:write name="resourceAdapterForm" property="path"/></sj:jgValue>
      </sj:gridrow>
      <logic:notEmpty name="resourceAdapterForm" property="rarLink">
        <sj:gridrow>
          <sj:jgName><bean:message key="label.resourceadapter.rarlink"/></sj:jgName>
          <sj:jgValue><bean:write name="resourceAdapterForm" property="rarLink"/></sj:jgValue>
        </sj:gridrow>
      </logic:notEmpty>
    </sj:jonasgrid>

    <logic:equal name="resourceAdapterForm" property="inEar" value="true">
      <sj:panelSeparator/>
      <sj:jonasgrid>
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="title.resourceadapter.ear"/></sj:jgColTitle>
        </sj:jgRowTitle>
      </sj:jonasgrid>
      <sj:jonasgrid>
        <sj:gridrow>
          <sj:jgName>
              <html:link forward="ActionEditEar" styleClass="panel"
                paramId="select" paramName="resourceAdapterForm" paramProperty="earON">
                <bean:write name="resourceAdapterForm" property="earFilename"/>
              </html:link>
          </sj:jgName>
          <sj:jgValue><bean:write name="resourceAdapterForm" property="earPath"/></sj:jgValue>
        </sj:gridrow>
      </sj:jonasgrid>
    </logic:equal>

    <bean:size id="lSize" name="resourceAdapterForm" property="listProperties"/>
    <logic:notEqual name="lSize" value="0">
      <sj:panelSeparator/>
      <sj:jonasgrid>
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="title.resourceadapter.properties"/></sj:jgColTitle>
        </sj:jgRowTitle>
      </sj:jonasgrid>
      <sj:jonasgrid>
        <logic:iterate id="item" name="resourceAdapterForm" property="listProperties">
          <sj:gridrow>
            <sj:jgName><bean:write name="item" property="label"/></sj:jgName>
            <sj:jgValue><bean:write name="item" property="value"/></sj:jgValue>
          </sj:gridrow>
        </logic:iterate>
      </sj:jonasgrid>
    </logic:notEqual>

    <sj:panelSeparator/>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.resourceadapter.pooling"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <logic:present name="<%=Globals.ERROR_KEY%>">
      <sj:jonasgrid>
        <sj:gridrow styleClass="errors">
          <sj:gridcol styleClass="errors"><html:errors/></sj:gridcol>
        </sj:gridrow>
      </sj:jonasgrid>
      <sj:panelSeparator/>
    </logic:present>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.connMaxAge"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="connMaxAge"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.connMaxAge"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.maxOpentime"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="maxOpentime"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.maxOpentime"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.initConnPool"/></sj:jgName>
        <sj:gridcol valign="top"><bean:write name="resourceAdapterForm" property="initSize"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.initConnPool"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.minConnPool"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="minSize"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.minConnPool"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.maxConnPool"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="maxSize"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.maxConnPool"/></sj:gridcol>
      </sj:gridrow>
      <logic:equal name="resourceAdapterForm" property="jdbcConnSetUp" value="true">
        <sj:gridrow>
          <sj:jgName><bean:message key="label.resourceadapter.pstmtMax"/></sj:jgName>
          <sj:gridcol valign="top"><html:text property="pstmtMax"/></sj:gridcol>
          <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.pstmtMax"/></sj:gridcol>
        </sj:gridrow>
      </logic:equal>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.maxWaitTime"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="maxWaitTime"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.maxWaitTime"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.maxWaiters"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="maxWaiters"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.maxWaiters"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.samplingPeriod"/></sj:jgName>
        <sj:gridcol valign="top"><html:text property="samplingPeriod"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.samplingPeriod"/></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>
    
    <logic:equal name="resourceAdapterForm" property="jdbcConnSetUp" value="true">
      <sj:panelSeparator/>
      <sj:jonasgrid>
        <sj:jgRowTitle>
          <sj:jgColTitle><bean:message key="title.resourceadapter.jdbcConnection"/></sj:jgColTitle>
        </sj:jgRowTitle>
      </sj:jonasgrid>
      <sj:jonasgrid>
        <sj:gridrow>
        </sj:gridrow>
        <sj:gridrow>
          <sj:jgName><bean:message key="label.resourceadapter.jdbcConnCheckLevel"/></sj:jgName>
          <sj:gridcol valign="top">
            <html:select property="jdbcConnCheckLevel">
              <bean:define id="listCheckingLevels" name="resourceAdapterForm" property="checkingLevels"/>
              <html:options collection="listCheckingLevels" property="value" labelProperty="label"/>
            </html:select>
          </sj:gridcol>
          <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.jdbcConnCheckLevel"/></sj:gridcol>
        </sj:gridrow>
        <sj:gridrow>
          <sj:jgName><bean:message key="label.resourceadapter.jdbcTestStatement"/></sj:jgName>
          <sj:gridcol valign="top"><html:text property="jdbcTestStatement"/></sj:gridcol>
          <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.jdbcTestStatement"/></sj:gridcol>
        </sj:gridrow>
      </sj:jonasgrid>
    </logic:equal>
    
    <sj:panelSeparator/>
    <sj:jonasgrid globalRowStyleClass="panel">
      <sj:gridrow>
        <sj:jgName></sj:jgName>
        <sj:gridcol>
          <html:button property="btn_apply" styleClass="button"
            onclick="submitHidden('resourceAdapterForm','action','apply')">
            <bean:message key="button.apply"/>
          </html:button>
          &nbsp;&nbsp;
          <html:reset styleClass="button"><bean:message key="button.reset"/></html:reset>
          &nbsp;&nbsp;
          <html:button property="btn_save" styleClass="button"
            onclick="submitHidden('resourceAdapterForm','action','save')">
            <bean:message key="button.save"/>
          </html:button>
        </sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>
</html:form>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

