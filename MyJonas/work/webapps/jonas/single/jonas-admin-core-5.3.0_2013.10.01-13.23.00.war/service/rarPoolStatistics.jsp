  <sj:panel>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.resourceadapter.poolState"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.currentOpened"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="currentOpened"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.currentOpened"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.currentBusy"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="currentBusy"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.currentBusy"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.currentInTx"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="currentInTx"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.currentInTx"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.busyMin"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="busyMinRecent"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.busyMin"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.busyMax"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="busyMaxRecent"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.busyMax"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.connectionLeaks"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="connectionLeaks"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.connectionLeaks"/></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>  
     
    <sj:panelSeparator/>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.resourceadapter.getConnectionStat"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.servedOpen"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="servedOpen"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.servedOpen"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.rejectedOpen"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="rejectedOpen"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.rejectedOpen"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.rejectedFull"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="rejectedFull"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.rejectedFull"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.rejectedTimeout"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="rejectedTimeout"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.rejectedTimeout"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.rejectedOther"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="rejectedOther"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.rejectedOther"/></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>
         
    <sj:panelSeparator/>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.resourceadapter.waitersStat"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.currentWaiters"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="currentWaiters"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.currentWaiters"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.waitersHigh"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="waitersHigh"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.waitersHigh"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.waitersHighRecent"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="waitersHighRecent"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.waitersHighRecent"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.waiterCount"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="waiterCount"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.waiterCount"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.waitingHigh"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="waitingHigh"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.waitingHigh"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.waitingHighRecent"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="waitingHighRecent"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.waitingHighRecent"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.waitingTime"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="waitingTime"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.waitingTime"/></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>  
         
    <sj:panelSeparator/>
    <sj:jonasgrid>
      <sj:jgRowTitle>
        <sj:jgColTitle><bean:message key="title.resourceadapter.openPhysConn"/></sj:jgColTitle>
      </sj:jgRowTitle>
    </sj:jonasgrid>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.openedCount"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="openedCount"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.openedCount"/></sj:gridcol>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName><bean:message key="label.resourceadapter.connectionFailures"/></sj:jgName>
        <sj:gridcol><bean:write name="datasourceForm" property="connectionFailures"/></sj:gridcol>
        <sj:gridcol width="60%"><bean:message key="comment.resourceadapter.connectionFailures"/></sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>
    
    <sj:panelSeparator/>
    <sj:jonasgrid globalRowStyleClass="panel">
      <sj:gridrow>
        <sj:jgName></sj:jgName>
        <sj:gridcol>
          <html:button property="btn_apply" styleClass="button"
            onclick="submitHidden('datasourceForm','action','apply')">
            <bean:message key="button.refresh"/>
          </html:button>
        </sj:gridcol>
      </sj:gridrow>
    </sj:jonasgrid>
  </sj:panel>
