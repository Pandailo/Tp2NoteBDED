<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/xml;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<ajax-response>
	<response>
	    <bean:size id="responseSize" name="archiveConfigForm" property="children"/>
	    <logic:notEqual name="responseSize" value="0">
			<logic:iterate id="child" name="archiveConfigForm" property="children">
				<item>
					<name><bean:write name="child" property="key"/></name>
					<value><bean:write name="child" property="value"/></value>
				</item>
			</logic:iterate>
		</logic:notEqual>
        <logic:equal name="responseSize" value="0">
        	<error/>
        </logic:equal>
	</response>
</ajax-response>