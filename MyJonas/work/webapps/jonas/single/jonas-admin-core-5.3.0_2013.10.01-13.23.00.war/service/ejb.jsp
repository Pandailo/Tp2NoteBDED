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
  <sj:panel>
    <sj:jonasgrid>
      <sj:gridrow>
        <sj:jgName>Type</sj:jgName>
        <sj:jgValue><bean:write name="ejbForm" property="type"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName>Name</sj:jgName>
        <sj:jgValue><bean:write name="ejbForm" property="name"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName>File</sj:jgName>
        <sj:jgValue><bean:write name="ejbForm" property="file"/></sj:jgValue>
      </sj:gridrow>
      <sj:gridrow>
        <sj:jgName>Node</sj:jgName>
        <sj:jgValue><bean:write name="ejbForm" property="node"/></sj:jgValue>
      </sj:gridrow>
    </sj:jonasgrid>
  </sj:panel>
</sj:tabs>

<%@ include file="../common/end.jsp" %>
</body>
</html:html>

