<!-- Standard Struts Entries -->

<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">

<!-- Standard Content -->
<%@ include file="begin.jsp" %>

<logic:present name="anchorToGo">
<script language="JavaScript" type="text/javascript">
function GotoAnchor()
{
  //top.defaultStatus = "<bean:write name="anchorToGo"/>";
  document.location.hash = "<bean:write name="anchorToGo"/>";
}
</script>
</logic:present>
<logic:notPresent name="anchorToGo">
<script language="JavaScript" type="text/javascript">
function GotoAnchor()
{
}
</script>
</logic:notPresent>

<body class="tree" onload="GotoAnchor()" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<!-- Tree Component -->
<sj:tree   tree="treeControl"
         action="viewTree.do?tree=${name}"
          style="tree-control"
  styleSelected="tree-control-selected"
styleUnselected="tree-control-unselected"
/>

</body>

<!-- Standard Footer -->

<%@ include file="end.jsp" %>

</html:html>
