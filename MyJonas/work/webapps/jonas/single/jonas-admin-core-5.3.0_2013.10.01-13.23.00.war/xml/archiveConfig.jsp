       <%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.struts.Globals"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/sj.tld" prefix="sj" %>

<html:html locale="true">
<%@ include file="../common/begin.jsp" %>
<script language="Javascript">
function showHide(id) {

       var elementOpen = document.getElementById(id + "-content");
       var elementClosed = document.getElementById(id + "-closed");
       var elementBtns = document.getElementById(id + "-buttons");
       var elementTop = document.getElementById(id + "-top");
       if(elementOpen.style.display == "none") {
               elementOpen.style.display = "block";
               elementBtns.style.display = "block";
               elementTop.style.display = "block";
               elementClosed.style.display = "none";
       }
       else {
               elementOpen.style.display = "none";
               elementBtns.style.display = "none";
               elementTop.style.display = "none";
               elementClosed.style.display = "inline";
       }
}

function removeElement(num) {

	   var confirm = window.confirm('Are you sure you want to remove this element?');
	   if(!confirm) {
	   		return;
	   }
	   
	   var childNum = num - 1;

       var elementToRemove = document.getElementById(num + "-element");
  
       elementToRemove.style.display = "none";
	   
	   var parent = elementToRemove.parentNode;
	   
	   var elementParentTag = document.getElementById(childNum + "-parent");
	   var elementNameTag = document.getElementById(childNum + "-name");

	   if (elementParentTag == null && elementNameTag == null) {
	   
       var hidden = document.createElement("input");
       hidden.setAttribute("type", "hidden");
       hidden.setAttribute("name", "values("+ num +"-removed)");
       hidden.setAttribute("value", "true");

       var element = document.createElement("input");
       element.setAttribute("type", "hidden");
       element.setAttribute("name", "values("+ num +")");
       element.setAttribute("value", "removed");
       
       parent.appendChild(hidden);
       parent.appendChild(element);
       } else {
        elementToRemove.removeChild(elementParentTag);
        elementToRemove.removeChild(elementNameTag);
       }
}

function addElement(num, children) {
       var select = document.getElementById(num + "-select");
       var newElementName = select.options[select.selectedIndex].text;
       
       if(newElementName == 0)
               return;
               
       var precedingElementName = select.options[select.selectedIndex].value;
       var parentNode = document.getElementById(num + "-content"); 
       
       var newElement = buildNewElement(newElementName, num);
       
       // if we need to place this element in a specific order
       if(precedingElementName != "-1") {
	        var elIndex = getElementPosition(children, newElementName);
	        if(parentNode.childNodes.length == 0 || elIndex == children.length) {
	        	parentNode.appendChild(newElement);
	        }
	        else {
	        	var insertionIndex = findInsertionIndex(children, parentNode.childNodes, newElementName);
	        	if(insertionIndex < 0) {
	        		parentNode.appendChild(newElement);
	        	}
	        	else {	
					var insertBefore = children[insertionIndex];
	        		for(var j = 0; j < parentNode.childNodes.length; j++) {
		                    var current = parentNode.childNodes[j];
                    if (current.tagName == "DIV" 
					&& findElementNameById(current.getAttribute("id")) == insertBefore) {
	                    	parentNode.insertBefore(newElement, current);
	                    	break;
	                    }
	        		}
	        	}
	        }
                
       }
       // not a sequence so we can just append the new element to the end
       else {
               parent.appendChild(newElement);       
       }
}

function sortNumber(a, b)
{
	return a - b;
}

function getElementPosition(children, elementName) {
	for(var i = 0; i < children.length; i++) {
	
		if(children[i] == elementName) {
			return i;
		}
	}
}

// given an ID returns the name of the element that the ID stands for
function findElementNameById(id) {
	var element = document.getElementById(id.substring(0, id.indexOf("-")));
	if (element != null) {
		return element.getAttribute("value");
	}
	else {
		return 0;
	}
}

function findInsertionIndex(children, list, newElementName) {
	var counter = 0;
	// find out how many child elements there are
	for(var i = 0; i < list.length; i++) {
       if(list[i].tagName == "DIV") {
			counter++;
       }   
	}
	var a = new Array(counter+1);
	
	var j = 0;
	for(var m = 0; m < list.length; m++) {
        if(list[m].tagName == "DIV") {
        	var name = findElementNameById(list[m].getAttribute("id"));
			a[j] = getElementPosition(children, name);
			j++;
		}	
	}
	a[j] = getElementPosition(children, newElementName);
	
	a.sort(sortNumber);
	// now find where the new element is supposed to be after sorting
	var result = -1;
	for(var i = 0; i < a.length; i++) {
		if(a[i] == getElementPosition(children, newElementName)) {
			result = i;
			break;
		}
	}
	if(result == a.length-1)
		return -1;
	else
		return a[result+1];
}

// The OPTGROUP element into which the callback function inserts
// the possible options retrieved from the server
var elementOptionGroup;

var addButtonGlobal;
var newIDGlobal;

function parseAllowedChildren() {
	var xml = "";

	if (http_request.readyState == 4) {
		if(http_request.status == 200) {
			xml = http_request.responseXML;
			
			var arrayString = "";
		 			
			var items = xml.getElementsByTagName("item");
			for(var i = 0; i < items.length; i++) {
	       		var option = document.createElement("option");
	       		var item = items[i];
	       		var name = item.getElementsByTagName("name")[0].childNodes[0].nodeValue;
				option.appendChild(document.createTextNode(name));
				elementOptionGroup.appendChild(option);
				
				// add to the array str
				if(arrayString == "") {
					arrayString = "'" + name + "'";
				}
				else {
					arrayString += ", '" + name + "'";
				}
			}
			elementOptionGroup = null;	
			
			// update the array of allow children for the addButton
    		addButtonGlobal.setAttribute("onClick", "addElement('" + newIDGlobal + "', new Array("+ arrayString +"))");
    		
    		addButtonGlobal = null;
    		newIDGlobal = null;
		}
	}

}
function buildNewElement(name, parentID) {
       var newID = getNewId();
       var newParentID = getNewId();
       var div = document.createElement("div");
       
       
       
       // remove the "Empty.." message
       var empty = document.getElementById(parentID + "-empty");
       if (empty != null) {
          empty.parentNode.removeChild(empty);
       }
       var complex = document.getElementById(name);
       if (complex == null) {
          div.setAttribute("id", newParentID + "-element");
          div.setAttribute("class", "element2-new");
          div.appendChild(document.createTextNode("<" + name + ">"));

          // create the input field
          var input = document.createElement("input");
          input.setAttribute("name", "values(" + newID + ")");
          input.setAttribute("type", "text");
          input.setAttribute("size", "20");
          input.setAttribute("class", "textElement");
          input.setAttribute("value", "");
          div.appendChild(input);
       }
       else {
          div.setAttribute("id", newID + "-element");
          div.setAttribute("class", "element1-new");
          
          var complexInput = document.createElement("input");
          complexInput.setAttribute("name", "values(" + newID + ")");
          complexInput.setAttribute("type", "hidden");
          complexInput.setAttribute("value", "");
          div.appendChild(complexInput);
       
          var buttonDiv = document.createElement("div");
          buttonDiv.setAttribute("id", newID + "-buttons");
          buttonDiv.setAttribute("class", "buttons");
          
          var select = document.createElement("select");
          select.setAttribute("class", "elementSelect");
          select.setAttribute("id", newID + "-select");
          select.appendChild(document.createElement("option"));
          
          var attrOptGroup = document.createElement("optgroup");
          attrOptGroup.setAttribute("label", "Attributes");
          // Use AJAX to find the valid attributes.
          
          // removing for now
          //select.appendChild(attrOptGroup);
          
          var eleOptGroup = document.createElement("optgroup");
          eleOptGroup.setAttribute("label", "Elements");
          
          // make this OPTGROUP globally available for the callback function
          elementOptionGroup = eleOptGroup;
          
          // Use AJAX to find valid elements
          if (window.XMLHttpRequest) { // Mozilla, Safari, ...
	            http_request = new XMLHttpRequest();
	       } else if (window.ActiveXObject) { // IE
	            http_request = new ActiveXObject("Microsoft.XMLHTTP");
	       }
	       http_request.onreadystatechange = parseAllowedChildren;
	       http_request.open('GET', '/jonasAdmin/ArchiveUtil.do?elementName=' + name, true);
	       http_request.send(null);
	       
	       select.appendChild(eleOptGroup);
	       
         
		  buttonDiv.appendChild(select);
		  
		  var addButton = document.createElement("input");
  		  // make this button globally available for the callback function
		  addButtonGlobal = addButton;
		  newIDGlobal = newID;

		  addButton.setAttribute("type", "button");
		  addButton.setAttribute("class", "actionButton");
		  // the array of children is empty for now, until it is updated by the callback function
		  addButton.setAttribute("onClick", "addElement('" + newID + "', new Array())");
		  addButton.setAttribute("value", "Add");
		  
		  buttonDiv.appendChild(addButton); 
		  
		  var removeButton = document.createElement("input");
		  removeButton.setAttribute("type", "button");
		  removeButton.setAttribute("class", "actionButton");
		  removeButton.setAttribute("onClick", "removeElement('" + newID + "')");
		  removeButton.setAttribute("value", "Remove");
		  
		  buttonDiv.appendChild(removeButton); 

          div.appendChild(buttonDiv);
       }

       // create the hidden field that will let us identify the parent of the new element
       var hidden = document.createElement("input");
       hidden.setAttribute("type", "hidden");
       hidden.setAttribute("id", newID + "-parent");
       hidden.setAttribute("name", "values(" + newID + "-parent)");
       hidden.setAttribute("value", parentID);
       
       // create the hidden field that will let us identify the name of the new element.
       var hiddenName = document.createElement("input");
       hiddenName.setAttribute("type", "hidden");
       hiddenName.setAttribute("id", newID + "-name");
       hiddenName.setAttribute("name", "values(" + newID + "-name)");
       hiddenName.setAttribute("value", name);

       var hiddenValue = document.createElement("input");
       hiddenValue.setAttribute("type", "hidden");
       hiddenValue.setAttribute("id", newParentID);
       hiddenValue.setAttribute("value", name);
       
       div.appendChild(hidden);
       div.appendChild(hiddenName);
       div.appendChild(hiddenValue);

       if (complex == null) {
          div.appendChild(document.createTextNode("</" + name + ">"));
       
          var button = document.createElement("input");
          button.setAttribute("type", "button");
          button.setAttribute("class", "removeButton");
          button.setAttribute("onClick", "removeElement('" + newParentID + "')");
          button.setAttribute("value", " X ");

          div.appendChild(button);
       } else {
          var showSpan = document.createElement("span");
          showSpan.setAttribute("onClick", "showHide('" + newID + "')");
          showSpan.setAttribute("id", newID + "-top");
          showSpan.setAttribute("class", "elementName");
          showSpan.appendChild(document.createTextNode("- <" + name + ">"));
          
          var hideSpan = document.createElement("span");
          hideSpan.setAttribute("onClick", "showHide('" + newID + "')");
          hideSpan.setAttribute("id", newID + "-closed");
          hideSpan.setAttribute("class", "elementName");
          hideSpan.setAttribute("style", "display: none");
          hideSpan.appendChild(document.createTextNode("+ <" + name + "> ..."));
          
          div.appendChild(showSpan);
          div.appendChild(hideSpan);
          
          var contentDiv = document.createElement("div");
          contentDiv.setAttribute("id", newID + "-content");
          
          var span = document.createElement("span");
          span.setAttribute("id", newID + "-empty");
          span.appendChild(document.createTextNode("Empty.  Add a child from the dropdown"));
          
          contentDiv.appendChild(span);
          
          div.appendChild(contentDiv);
          div.appendChild(document.createTextNode("</" + name + ">"));
       }       
       
       return div;


}

function confirmNoSave(oldFileName) {
    var confirm = window.confirm('Are you sure you want to switch files?\n All modifications to ' 
    + oldFileName + ' will be lost.');
	  return confirm;
}

</script>
<body class="content">
<html:form action="/ApplyArchiveConfig">
<sj:titleContent usingWhere="true" tomThumb="true"/>

<bean:define id="ra" name="archiveConfigForm" property="values(raXmlFileName)" type="String" />
<bean:define id="jonasra" name="archiveConfigForm" property="values(jonasRaXmlFileName)" type="String" />


<sj:tabs usingWhere="true" heightTab="20">  
  <bean:define id="isDomain" name="archiveConfigForm" property="isDomain"/>
  <logic:equal name="isDomain" value="false">
    <sj:tab forward="ActionEditDeploy"><bean:message key="tab.deployment"/></sj:tab>
   </logic:equal>
      
  <logic:equal name="isDomain" value="true">
    <sj:tab forward="ActionEditDomainDeploy"><bean:message key="tab.deployment.domain"/></sj:tab>
  </logic:equal>
  <sj:tab forward="ActionEditUpload"><bean:message key="tab.deployment.upload"/></sj:tab>
  <sj:tab forward="ActionEditRemove"><bean:message key="tab.deployment.remove"/></sj:tab>
  <sj:tab forward="ActionArchiveConfigSelect" selected="true"><bean:message key="tab.configure"/></sj:tab>

  <sj:panel>

  <sj:grid cellPadding="2" width="100%">
  	<sj:jgRowTitle>
  		<sj:jgColTitle><bean:message key="message.config.archiveConfig"/></sj:jgColTitle>
  		<sj:jgColTitle> </sj:jgColTitle>  		
  	</sj:jgRowTitle>
  	<sj:gridrow>
 		<sj:gridcol><bean:message key="message.config.archiveName"/></sj:gridcol>
  		<sj:gridcol><bean:write name="archiveConfigForm" property="archiveName" /></sj:gridcol>  		
  	</sj:gridrow>
  	<sj:gridrow>
  		<sj:gridcol><bean:message key="message.config.fileName"/></sj:gridcol>
  		<sj:gridcol><bean:write name="archiveConfigForm" property="pathName" /></sj:gridcol>  		
  	</sj:gridrow> 		  	
  </sj:grid>   
   
    <logic:present name="<%=Globals.ERROR_KEY%>">
      <sj:jonasgrid>
        <sj:gridrow styleClass="errors">
          <sj:gridcol styleClass="errors"><html:errors/></sj:gridcol>
        </sj:gridrow>
      </sj:jonasgrid>
    </logic:present>
  
    <html:hidden property="configType" value="0"/>  

 	<sj:grid width="100%">   
	   	<sj:gridrow>
  			<sj:gridcol>
			    <html:submit styleClass="button" property="submit"><bean:message key="button.apply"/></html:submit>  
			    <html:submit styleClass="button" property="cancel"><bean:message key="button.cancel"/></html:submit>  
			</sj:gridcol>
			<sj:gridcol align="right">
		 		<bean:message key="label.config.switchTo"/>
 				<logic:equal name="archiveConfigForm" property="pathName" value="META-INF/ra.xml">
		 			<html:link forward="ActionArchiveConfig" paramId="file" onclick="return confirmNoSave('META-INF/ra.xml')" paramName="jonasra">jonas-ra.xml</html:link><br/>
 				</logic:equal>
		 		<logic:equal name="archiveConfigForm" property="pathName" value="META-INF/jonas-ra.xml">
		 		    <html:link forward="ActionArchiveConfig" paramId="file" onclick="return confirmNoSave('META-INF/jonas-ra.xml')" paramName="ra">ra.xml</html:link><br/>
 					
		 		</logic:equal> 		  						
			</sj:gridcol>		
  			<sj:gridcol align="right">
			    <html:submit styleClass="longButton" property="switchTo"><bean:message key="button.config.switchToAdvanced"/></html:submit>    			
			</sj:gridcol>  
	  	</sj:gridrow> 
  	</sj:grid>
     
    <sj:panelSeparator/>
  
    <bean:define id="doc" name="archiveConfigForm" property="document" type="org.w3c.dom.Document" />
    <bean:define id="map" name="archiveConfigForm" property="mapping" type="java.util.Map" />
    <bean:define id="file" name="archiveConfigForm" property="archiveName" type="String" />
    <bean:define id="path" name="archiveConfigForm" property="pathName" type="String" />
    <sj:xmlEditor fileName="<%= file %>" pathName="<%= path %>" document="<%= doc %>" mapping="<%= map %>"/>
 
    <sj:panelSeparator/> 
    
 	<sj:grid width="100%">    
	   	<sj:gridrow>
  			<sj:gridcol>
			    <html:submit styleClass="button" property="submit"><bean:message key="button.apply"/></html:submit>  
			    <html:submit styleClass="button" property="cancel"><bean:message key="button.cancel"/></html:submit>  
			</sj:gridcol>
  			<sj:gridcol align="right">
			    <html:submit styleClass="longButton" property="switchTo"><bean:message key="button.config.switchToAdvanced"/></html:submit>    			
			</sj:gridcol>  		
	  	</sj:gridrow> 
  	</sj:grid>
  	 
  </sj:panel>
</sj:tabs>

<script language="JavaScript">

var lastId = <%= pageContext.getAttribute("lastNum") %>;

function getNewId() {
       lastId += 1;
       return lastId;
}



</script>
</html:form>
<%@ include file="../common/end.jsp" %>
</body>
</html:html>
