<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj"%>

<html:html locale="true">
<%@ include file="../common/begin.jsp"%>
<body class="content">
  <html:form action="/CmiObject" method="post" enctype="multipart/form-data">
    <html:hidden property="action" />
    <sj:titleContent usingWhere="true" tomThumb="true" />
    <sj:tabs usingWhere="true" heightTab="20">
      <sj:tab forwardControl="ActionEditJonasServer">
        <bean:message key="tab.server.jonas" />
      </sj:tab>
      <sj:tab forward="ActionEditJmxServer">
        <bean:message key="tab.server.jmx" />
      </sj:tab>
      <sj:tab forward="ActionDisplayCmi"><bean:message key="tab.server.services.cmi"/></sj:tab>
      <sj:tab forward="ActionCmiCluster">
        <bean:message key="tab.server.services.cmi.cluster" />
     </sj:tab>
      <sj:tab forward="ActionCmiObject" selected="true"><bean:message key="tab.server.services.cmi.object.infos"/></sj:tab>
       <sj:tab forward="ActionListRegistry"><bean:message key="tab.server.registry"/></sj:tab>
      <sj:panel>
        <sj:jonasgrid>
          <sj:jgRowTitle>
            <sj:jgColTitle>
            <bean:message key="title.global" />
          </sj:jgColTitle>
          </sj:jgRowTitle>
        </sj:jonasgrid>

        <sj:jonasgrid>
          <sj:gridrow>
            <sj:gridcol width="15%">
                <div class="boldText">
                <bean:message key="label.domain.name"/>
                </div>
            </sj:gridcol>
            <sj:gridcol width="100%">
                <bean:write name="cmiObjectForm" property="name" />
            </sj:gridcol>
          </sj:gridrow>

          <sj:gridrow>
            <sj:gridcol width="15%">
                <div class="boldText">
                <bean:message key="label.domain.clusterName"/>
                </div>
            </sj:gridcol>
            <sj:gridcol width="100%">
                <bean:write name="cmiObjectForm" property="clusterName"/>
            </sj:gridcol>
          </sj:gridrow>


           <sj:gridrow>
            <sj:gridcol width="15%">
                <div class="boldText">
                <bean:message key="label.domain.interface"/>
                </div>
            </sj:gridcol>
            <sj:gridcol width="100%">
                <bean:write name="cmiObjectForm" property="itfName" />
            </sj:gridcol>
          </sj:gridrow>

        </sj:jonasgrid>

        <sj:jonasgrid>
          <sj:jgRowTitle>
            <sj:jgColTitle>
            <bean:message key="tab.server.services.cmi.object.servers"/>
          </sj:jgColTitle>
          </sj:jgRowTitle>
        </sj:jonasgrid>

        <sj:jonasgrid>
                <sj:gridrow>
                    <sj:gridcol width="100%">
                        <logic:iterate id="server" name="cmiObjectForm" property="serverRefs">
                           <bean:write name="server"/>&nbsp;&nbsp;&nbsp;
                        </logic:iterate>
                    </sj:gridcol>
                </sj:gridrow>

      </sj:jonasgrid>

      <sj:jonasgrid>
                <sj:jgRowTitle>
                    <sj:jgColTitle>
                        <bean:message key="tab.server.services.cmi.object.LB.infos"/>
                    </sj:jgColTitle>
                </sj:jgRowTitle>
        </sj:jonasgrid>

    <sj:jonasgrid>
                <sj:gridrow>
                    <sj:gridcol width="15%">
                    <div class="boldText">
                            <bean:message key="tab.server.services.cmi.object.LB.policy.class"/>
                    </div>
                    </sj:gridcol>
                    <sj:gridcol width="100%">
                    <html:select property="currentLBPolicySelect" styleClass='<%=(String)request.getAttribute("htmlTextStyleLbPolicy")%>' onchange="javascript:submitHidden('cmiObjectForm','action','changeLBPolicy')">
                            <bean:define id="lbPolicies" name="cmiForm" property="availableLBPolicies"/>
                            <bean:define id="selectedLBPolicy" name="cmiObjectForm" property="currentLBPolicy"/>
                            <option selected value='<bean:write name="selectedLBPolicy" property="value"/>'>
                                <bean:write name="selectedLBPolicy" property="key"/>
                            </option>
                            <html:options collection="lbPolicies" property="key" labelProperty="value"/>
                     </html:select>
                    </sj:gridcol>
                </sj:gridrow>
                <sj:gridrow>
                    <sj:gridcol width="15%">
                    <div class="boldText">
                        <bean:message key="tab.server.services.cmi.object.LB.policy.strategy"/>&nbsp;&nbsp;&nbsp;
                    </div>
                    </sj:gridcol>
                    <sj:gridcol width="100%">
                     <html:select property="currentLBStrategySelect" styleClass='<%=(String)request.getAttribute("htmlTextStyleLbStrategy")%>' onchange="javascript:submitHidden('cmiObjectForm','action','changeLBStrategy')">
                            <bean:define id="lbStrategies" name="cmiForm" property="availableLBStrategies"/>
                            <bean:define id="selectedLBStrategy" name="cmiObjectForm" property="currentLBStrategy"/>
                            <option selected value='<bean:write name="selectedLBStrategy" property="value"/>'>
                                <bean:write name="selectedLBStrategy" property="key"/>
                            </option>
                            <html:options collection="lbStrategies" property="key" labelProperty="value"/>
                     </html:select>
                    </sj:gridcol>
                </sj:gridrow>
        </sj:jonasgrid>
        <sj:panelSeparator/>
        <bean:size id="simplePropertiesSize" name="cmiObjectForm" property="simpleProperties"/>
        <logic:notEqual name="simplePropertiesSize" value="0">
           <sj:jonasgrid>
              <!-- LB infos -->
              <sj:jgRowTitle level="2">
                <sj:jgColTitle>
                     <bean:message key="tab.server.services.cmi.object.LB.policy.properties.simple"/>
                </sj:jgColTitle>
             </sj:jgRowTitle>
           </sj:jonasgrid>
           <sj:jonasgrid>
           <sj:gridrow>
               <sj:gridcol width="15%">
                  <bean:define id="proper" name="cmiObjectForm" property="simpleProperties"/>
                  <html:select property="currentSimpPropertySelect" styleClass='<%=(String)request.getAttribute("htmlTextStyleLbStrategy")%>'
                     onchange="javascript:submitHidden('cmiObjectForm','action','updateCurrentSimpleProperty')">
                      <html:options collection="proper" property="name" labelProperty="name"/>
                  </html:select>
               </sj:gridcol>
               <sj:gridcol>
                   <html:text property="currentSimpPropertyValue"
                      styleClass='<%=(String)request.getAttribute("htmlTextStyleMaxPoolSize")%>' styleId="maxPoolSize">
                      <bean:write name="cmiObjectForm" property="currentSimpPropertyValue"/>
                   </html:text>
               </sj:gridcol>
               <sj:gridcol>
                    <button type="button" onclick="javascript:submitHidden('cmiObjectForm','action','updateSimpleProperty')" class="button">
                        <bean:message key="title.modify" />
                    </button>
               </sj:gridcol>
           </sj:gridrow>
          </sj:jonasgrid>
        </logic:notEqual>


  <!-- Pool infos -->

      <sj:jonasgrid>
          <sj:jgRowTitle>
            <sj:jgColTitle>
                 <bean:message key="tab.server.services.cmi.object.pool.infos"/>
            </sj:jgColTitle>
          </sj:jgRowTitle>
        </sj:jonasgrid>

    <sj:jonasgrid>
        <!-- TODO: enable this when pool management will evolve. -->
        <!--
        <sj:gridrow>
            <sj:gridcol width="15%">
                <div class="boldText">
                    <bean:message key="tab.server.services.cmi.object.pool.size.min"/>
                </div>
            </sj:gridcol>
            <sj:gridcol width="100%">
            <html:text name="cmiObjectForm" property="minPoolSize"
                styleClass='<%=(String)request.getAttribute("htmlTextStyleMinPoolSize")%>' styleId="minPoolSize">
                <bean:write name="cmiObjectForm" property="minPoolSize" />
            </html:text>
            <button type="button" onclick="javascript:submitHidden('cmiObjectForm','action','minPoolSize')" class="button">
                <bean:message key="title.modify" />
            </button>
            </sj:gridcol>
        </sj:gridrow>-->
         <sj:gridrow>
             <sj:gridcol width="15%">
                <div class="boldText">
                    <bean:message key="tab.server.services.cmi.object.pool.size.max"/>
                </div>
             </sj:gridcol>
             <sj:gridcol width="100%">
                    <bean:write name="cmiObjectForm" property="maxPoolSize" />
                    <!--<html:text name="cmiObjectForm" property="maxPoolSize" readonly="readonly"
                    styleClass='<%=(String)request.getAttribute("htmlTextStyleMaxPoolSize")%>' styleId="maxPoolSize">
                        <bean:write name="cmiObjectForm" property="maxPoolSize" />
                    </html:text>
                    <button type="button" onclick="javascript:submitHidden('cmiObjectForm','action','maxPoolSize')" class="button" disabled="disabled">
                        <bean:message key="title.modify" />
                    </button> -->
            </sj:gridcol>
        </sj:gridrow>

        <sj:gridrow>
            <sj:gridcol width="15%">
                <div class="boldText">
                    <bean:message key="tab.server.services.cmi.object.pool.maxwaiters"/>
                </div>
            </sj:gridcol>
            <sj:gridcol width="100%">
            <bean:write name="cmiObjectForm" property="maxPoolWaiters" />
            <!--<html:text name="cmiObjectForm" property="maxPoolWaiters"
                styleClass='<%=(String)request.getAttribute("htmlTextStyleMinPoolSize")%>' styleId="minPoolSize">
                <bean:write name="cmiObjectForm" property="maxPoolWaiters" />
            </html:text>
            <button type="button" onclick="javascript:submitHidden('cmiObjectForm','action','maxPoolWaiters')" class="button">
                <bean:message key="title.modify" />
            </button>-->
            </sj:gridcol>
        </sj:gridrow>

        <sj:gridrow>
            <sj:gridcol width="15%">
                <div class="boldText">
                    <bean:message key="tab.server.services.cmi.object.pool.timeout"/>
                </div>
            </sj:gridcol>
            <sj:gridcol width="100%">
            <bean:write name="cmiObjectForm" property="poolTimeout" />
            <!--<html:text name="cmiObjectForm" property="poolTimeout"
                styleClass='<%=(String)request.getAttribute("htmlTextStyleMinPoolSize")%>' styleId="minPoolSize">
                <bean:write name="cmiObjectForm" property="poolTimeout" />
            </html:text>
            <button type="button" onclick="javascript:submitHidden('cmiObjectForm','action','poolTimeout')" class="button">
                <bean:message key="title.modify" />
            </button>-->
            </sj:gridcol>
        </sj:gridrow>
        </sj:jonasgrid>
        <logic:present name="<%=Globals.ERROR_KEY%>">
          <sj:jonasgrid>
            <sj:gridrow styleClass="errors">
              <sj:gridcol styleClass="errors">
                <html:errors />
              </sj:gridcol>
            </sj:gridrow>
          </sj:jonasgrid>
          <sj:panelSeparator />
        </logic:present>
      </sj:panel>
    </sj:tabs>
  </html:form>
  <%@ include file="../common/end.jsp"%>
</body>
</html:html>
