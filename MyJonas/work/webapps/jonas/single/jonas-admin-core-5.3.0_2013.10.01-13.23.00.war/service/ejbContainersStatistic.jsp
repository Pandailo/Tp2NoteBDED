<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj"%>

<html:html locale="true">
<%@ include file="../common/begin.jsp"%>

<body class="content">
<html:form action="/ApplyEjbContainersStatistic">
  <sj:titleContent usingWhere="true" tomThumb="true" />
  <sj:tabs usingWhere="true" heightTab="20">
    <sj:tab forward="ActionListContainers">
      <bean:message key="tab.ejbcontainers" />
    </sj:tab>
    <sj:tab forward="ActionEditEjbContainersStatistic" selected="true">
      <bean:message key="tab.ejbcontainers.statistic" />
    </sj:tab>
    <sj:panel>
      <sj:jonasgrid>
        <sj:jgRowTitle>
          <sj:jgColTitle>
            <bean:message key="title.ejbcontainers.statistic" />
          </sj:jgColTitle>
        </sj:jgRowTitle>
      </sj:jonasgrid>
      <sj:jonasgrid>
        <sj:gridrow>
          <sj:jgName>
            <bean:message
              key="label.ejbcontainers.statistic.totalCurrentNumberOfBeanType" />
          </sj:jgName>
          <sj:jgValue>
            <bean:write name="ejbContainersStatisticForm"
              property="totalCurrentNumberOfBeanType" />
          </sj:jgValue>
        </sj:gridrow>
        <sj:gridrow>
          <sj:jgName>
            <bean:message
              key="label.ejbcontainers.statistic.totalCurrentNumberOfBMPType" />
          </sj:jgName>
          <sj:jgValue>
            <bean:write name="ejbContainersStatisticForm"
              property="totalCurrentNumberOfBMPType" />
          </sj:jgValue>
        </sj:gridrow>
        <sj:gridrow>
          <sj:jgName>
            <bean:message
              key="label.ejbcontainers.statistic.totalCurrentNumberOfCMPType" />
          </sj:jgName>
          <sj:jgValue>
            <bean:write name="ejbContainersStatisticForm"
              property="totalCurrentNumberOfCMPType" />
          </sj:jgValue>
        </sj:gridrow>
        <sj:gridrow>
          <sj:jgName>
            <bean:message
              key="label.ejbcontainers.statistic.totalCurrentNumberOfSBFType" />
          </sj:jgName>
          <sj:jgValue>
            <bean:write name="ejbContainersStatisticForm"
              property="totalCurrentNumberOfSBFType" />
          </sj:jgValue>
        </sj:gridrow>
        <sj:gridrow>
          <sj:jgName>
            <bean:message
              key="label.ejbcontainers.statistic.totalCurrentNumberOfSBLType" />
          </sj:jgName>
          <sj:jgValue>
            <bean:write name="ejbContainersStatisticForm"
              property="totalCurrentNumberOfSBLType" />
          </sj:jgValue>
        </sj:gridrow>
        <sj:gridrow>
          <sj:jgName>
            <bean:message
              key="label.ejbcontainers.statistic.totalCurrentNumberOfMDBType" />
          </sj:jgName>
          <sj:jgValue>
            <bean:write name="ejbContainersStatisticForm"
              property="totalCurrentNumberOfMDBType" />
          </sj:jgValue>
        </sj:gridrow>
      </sj:jonasgrid>

      <logic:notEmpty name="ejbContainersStatisticForm"
        property="namingAttributes">
        <bean:define id="namingAttributes" name="ejbContainersStatisticForm"
          property="namingAttributes" />
        <sj:panelSeparator />
        <sj:jonasgrid>
          <sj:jgRowTitle>
            <sj:jgColTitle>
              <bean:message key="title.ejb.naming" />
            </sj:jgColTitle>
          </sj:jgRowTitle>
        </sj:jonasgrid>
        <sj:jonasgrid cellSpacing="2">
          <logic:iterate id="nattribute" name="namingAttributes">
            <sj:gridrow>
              <sj:jgName>
                <bean:write name="nattribute" property="name" />
              </sj:jgName>
              <!-- The attribute is not writable -->
              <sj:gridcol>
                <bean:write name="nattribute" property="value" />
              </sj:gridcol>
              <sj:gridcol>
                <bean:write name="nattribute" property="description" />
              </sj:gridcol>
              <sj:gridcol></sj:gridcol>
            </sj:gridrow>
          </logic:iterate>
        </sj:jonasgrid>
      </logic:notEmpty>


      <logic:notEmpty name="ejbContainersStatisticForm"
        property="monitoringAttributes">
        <sj:panelSeparator />
        <bean:define id="mattributes" name="ejbContainersStatisticForm"
          property="monitoringAttributes" />
        <sj:jonasgrid>
          <sj:jgRowTitle>
            <sj:jgColTitle>
              <bean:message key="title.ejb.monitoring" />
            </sj:jgColTitle>
          </sj:jgRowTitle>
        </sj:jonasgrid>
        <sj:jonasgrid cellSpacing="2">
          <logic:iterate id="mattribute" name="mattributes">
            <sj:gridrow>
              <sj:jgName>
                <bean:write name="mattribute" property="name" />
              </sj:jgName>
              <logic:equal property="writable" name="mattribute" value="true">
                <!-- The attribute is writable -->
                <logic:equal property="type" name="mattribute" value="boolean">
                  <sj:gridcol>
                    <!-- FIXME: monitoringEnabled is the only writable boolean attribute, but this should change -->
                    <bean:define id="monitoringEnabled"
                      name="ejbContainersStatisticForm"
                      property="monitoringEnabled" />
                    <html:select name="ejbContainersStatisticForm"
                      property="monitoringEnabled">
                      <bean:define id="colBooleanValues"
                        name="ejbContainersStatisticForm" property="booleanValues" />
                      <html:options collection="colBooleanValues" property="value"
                        labelProperty="label" />
                    </html:select>
                  </sj:gridcol>
                </logic:equal>
                <logic:notEqual property="type" name="mattribute"
                  value="boolean">
                  <!-- Text attribute -->
                  <bean:define id="atrValue" name="mattribute" property="value" />
                  <!-- FIXME: warningThreshold is the only writable non boolean attribute, but this should change -->
                  <sj:gridcol>
                    <html:text name="ejbContainersStatisticForm"
                      property="warningThreshold"
                      value="<%= atrValue.toString() %>" />
                  </sj:gridcol>
                </logic:notEqual>
              </logic:equal>
              <logic:notEqual property="writable" name="mattribute"
                value="true">
                <!-- The attribute is not writable -->
                <sj:gridcol width="2%">
                  <bean:write name="mattribute" property="value" />
                </sj:gridcol>
              </logic:notEqual>
              <sj:gridcol><bean:write name="mattribute" property="description" /></sj:gridcol>
              <sj:gridcol></sj:gridcol>
            </sj:gridrow>
          </logic:iterate>
        </sj:jonasgrid>
      </logic:notEmpty>
      <logic:equal name="ejbContainersStatisticForm" property="writable"
        value="true">
        <sj:panelSeparator />
        <sj:jonasgrid globalRowStyleClass="panel">
          <sj:gridrow>
            <sj:jgName></sj:jgName>
            <sj:gridcol>
              <html:button property="btn_apply" styleClass="button"
                onclick="submitForm('ejbContainersStatisticForm')">
                <bean:message key="button.apply" />
              </html:button>
          &nbsp;&nbsp;
          <html:reset styleClass="button">
                <bean:message key="button.reset" />
              </html:reset>
            </sj:gridcol>
          </sj:gridrow>
        </sj:jonasgrid>
      </logic:equal>
    </sj:panel>
  </sj:tabs>
</html:form>
<%@ include file="../common/end.jsp"%>
</body>
</html:html>

