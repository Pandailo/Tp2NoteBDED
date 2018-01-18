function ListOption(content, id)
{
    this.content = content;
    this.id = id;
}
function copySelected(p_FormName, p_ListNameSource, p_ListNameDestination)
{
    var oSelectSrc = eval("document." + p_FormName + "." + p_ListNameSource + "Selected");
    var oSelectDst = eval("document." + p_FormName + "." + p_ListNameDestination + "Selected");
    var len, i, cpt, cptSel;
    var tab = new Array();
    var tabSel = new Array();
    cpt = 0;
    cptSel = 0;
    oSelectDst.selectedIndex = -1;
    for (i = 0; i < oSelectSrc.options.length; i++)
    {
        if (oSelectSrc.options[i].selected)
        {
            oSelectDst.options[oSelectDst.options.length] = new Option(oSelectSrc.options[i].text,oSelectSrc.options[i].value);
            tabSel[cptSel++] = oSelectDst.options[oSelectDst.options.length - 1];
        }
        else
            tab[cpt++] = new ListOption(oSelectSrc.options[i].text, oSelectSrc.options[i].value);
    }
    // we recontruct the select options, otherwise, IE5 crashes when you affect null value to a select option
    oSelectSrc.selectedIndex = -1;
    oSelectSrc.options.length = 0;
    for (i = 0; i < tab.length; i++)
        oSelectSrc.options[i] = new Option(tab[i].content, tab[i].id);
    // we reselected the item which have just been moved
    for (i = 0; i < tabSel.length; i++)
        tabSel[i].selected = true;
    // Update the corresponding Hidden field
    updateHiddenSelect(p_FormName, p_ListNameSource);
    updateHiddenSelect(p_FormName, p_ListNameDestination);
    return false;
}


function selectToString(p_Select)
{
    var len = p_Select.length;
    var i;
    var res;
    res = "";
    for (i = 0; i < len; i++)
    {
        res += p_Select.options[i].value;
        if (i < len - 1)
            res += ",";
    }
    return res;
}


function updateHiddenSelect(p_FormName, p_ListName)
{
    var oSelect = eval("document." + p_FormName + "." + p_ListName + "Selected");
    var oHidden = eval("document." + p_FormName + "." + p_ListName);
    oHidden.value = selectToString(oSelect);
}

function submitHiddenSimple(p_FormName, p_HiddenName, p_HiddenValue)
{
    var oForm = eval("document." + p_FormName);
    var oHidden = eval("document." + p_FormName + "." + p_HiddenName);
    oHidden.value = p_HiddenValue;
    oForm.submit();
}


function submitHidden()
{
    var oHidden;
    var oForm = eval("document." + arguments[0]);
    for (i=1; i < arguments.length; i+=2)
    {
        oHidden = eval("document." + arguments[0] + "." + arguments[i]);
        oHidden.value = arguments[i+1];
    }
    oForm.submit();
}


function submitForm()
{
    var oForm = eval("document." + arguments[0]);
    oForm.submit();
}


function refreshTree()
{
    if (arguments.length > 0)
    {
        var sHref = arguments[0];
        if (sHref.length > 0)
        {
            top.tree.location.href = sHref;
            return;
        }
    }
    top.tree.location.reload();
}

function selAll(p_FormName, p_Servers, _v)
{
var oForm = eval("document." + p_FormName + "." + p_Servers);
for(var i=0;i< oForm.length ;i++)

oForm[i].selected=_v;
}
function enableReplace(p_FormName)
{
  var checkBox = eval("document." + p_FormName + ".replaceOnTarget");
  checkBox.disabled = false;
}
function disableReplace(p_FormName)
{
  var checkBox = eval("document." + p_FormName + ".replaceOnTarget");
  checkBox.disabled = true;
}

function setHidden(p_FormName, p_HiddenName, p_HiddenValue) {
   var oForm = eval("document." + p_FormName);
    var oHidden = eval("document." + p_FormName + "." + p_HiddenName);
    oHidden.value = p_HiddenValue;
   }


   /**

   **/
   function checkNotEmpty(eltId) {
   var elt;
   if (document.getElementById) {
        //try to use DOM
        elt = document.getElementById(eltId);
        alert('DOM not activated');
   } else {
        elt = document.forms[0].elements[eltId];
        alert('DOM not activated');
   }

    var elt = document.getElementById(eltId);
    if (elt.value == "") {
        alert('the field cannot be empty');
        elt.focus();
    }
   }


//confirm operation before submitting.usefull when removing.
/**
  arguments[0] the form name
  arguments[1]..arguments[argument.length-2]: actioName;actionValue
  arguments[argument.length-1]: the confirm message
**/
function submitHiddenWithConfirm() {
    var oHidden;
    var oForm = eval("document." + arguments[0]);
    for (i=1; i < arguments.length-1; i+=2)
    {
        oHidden = eval("document." + arguments[0] + "." + arguments[i]);
        oHidden.value = arguments[i+1];
    }
    //argument[length -1] == message to display
    var response = confirm(arguments[i]);
    if(response == true) {
    //response is "yes"
      oForm.submit();
    }else {
      return;
    }
}
/**
  formName: the form name
  actionElt: the action element
  actionToApply: action to Apply (blacklist/unblacklist)
  serverElt: form element that will contain a server value
  serverValue: The value to set in serverElt
**/
function applyCmiServerAction(formName, actionElt, actionToApply, serverElt, serverValue) {
    var oForm = document.forms[formName];
    var action = oForm.elements[actionElt];
    action.value = actionToApply;
    var server = oForm.elements[serverElt];
    server.value = serverValue;
    oForm.submit();
    return;
}

/**
 * Diplay the url of a given deployable.
 * @param selectables : set of selectable deployables.
 * @param where2display : html text where to display the url.
 */
function displayDeployable(selectable, where2display) {
    var dispDest;
    var selectElement;
    if (document.getElementById) {
         //try to use DOM
         dispDest = document.getElementById(where2display);
         //selectElement = document.getElementById(selectable.id);
    } else {
         dispDest = document.forms[0].elements[where2display];
         //selectElement = document.forms[0].elements[selectable.id];
    }
    dispDest.value = selectable.value;
    dispDest.size = selectable.value.length + 5;
    selectable.title = selectable.value;
}

