﻿﻿
/**
 * 生成省车牌下拉框
 * @returns
 */
var parseStateOfOptions = function() {
	
	var _state = ['鄂','京','津','沪','渝','黑','吉','辽','冀','晋','青','鲁','豫','苏','皖','浙','闽','赣','粤','琼','甘','陕','川','贵','云','新','藏','宁','桂']

	var htmls = [];
	$.each(_state,function(i,n){
		var s = '<option value="'+n+'">'+n+'</option>';
		htmls.push(s);
	});
	return htmls.join('');
}

function funcHidden(){
	var str = $('#hiddenId').val();
	var strs = str.split(',');
	for(var i = 0;i< strs.length;i++){
		$('#'+strs[i]).attr("style","display:none");
	}
}

/**
 * 比较时间,格式:YYYY-MM-DD HH:mm
 * @param beginTime 开始时间
 * @param endTime 结束时间
 * @returns {Boolean} 开始时间大于结束时间:true,开始时间小于结束时间:false
 */
function compareTime(beginTime,endTime){ 
    var beginDate= beginTime.substring(0,10).split('-');
    var endDate= endTime.substring(0,10).split('-');
	var beginTimes = beginTime.substring(10).split(':');
	var endTimes = endTime.substring(10).split(':');
	var date1 = new Date(beginDate[0],beginDate[1],beginDate[2],beginTimes[0],beginTimes[1]);
	var date2 = new Date(endDate[0],endDate[1],endDate[2],endTimes[0],endTimes[1]);
	return date1 > date2;
}

/**
 * 删除页面元素
 */
function removeHidden(){
	//获取要删除的元素ID
	var str = $('#removeId').val();
	var strs = str.split(',');
	for(var i = 0;i< strs.length;i++){
		$('#'+strs[i]).remove();
	}
}

/*验证两个日期的大小*/
function compareDate(startDate, endDate) {
	if("" == startDate || undefined == startDate || null == startDate || "" == endDate || undefined == endDate || null == endDate){
		return true;
	}else{
		var start = startDate.split("-");
		var end = endDate.split("-");
		var s = new Date(start[0],start[1],start[2]);
		var e = new Date(end[0],end[1],end[2]);
		if(s.getTime()>=e.getTime()){
			return false;
		}
		return true;
	}
}
/*验证字符串的长度*/ 
function checkCH(length, srcName) { 	
	if(undefined == srcName || "" == srcName || null == srcName){
		return true; 	
	} 	
	var CHNReg = /[\u4e00-\u9fa5]/;//汉字的正则表达式; 	
	var len = 0; 	
	for ( var i = 0; i < srcName.length; i++) { 		
		if (CHNReg.test(srcName.substring(i,i+1))) { 			
			len += 2; 		
		} else { 			
			len++; 		
		} 	
	} 	
	
	if (len > length) { 		
		return false; 	
	} else { 		
		return true; 	
	} 
}

/**  * 将数据转换成obj{length，name，chineseName}  *   */ 
function zobj(length,name,chineseName){ 	
	var obj = {}; 	
	obj.name = name; 	
	obj.chineseName = chineseName; 	
	obj.length = length; 	return obj; 
} 

/**  * 验证所有的需要验证的中文  * @param param  * @returns {Boolean}  */ 
function checkAllChina(param){ 	
	var flag =true; 	
	var mes =""; 	
	for(var i=0;i<param.length;i++){ 		
		o = param[i]; 		
		if(!checkCH(o.length,o.name,o.chineseName)){ 			 
			mes += "【"+o.chineseName+"】长度不能超过"+o.length+"位字符"; 			 
			mes += "\n"; 			 flag = false; 		
		} 	
	} 	
	
	if(!flag){ 		
		alert(mes); 	
	} 	
	
	return flag;
}


/*
*根据登陆人的角色判断栏位置灰
*params 格式  var params = [{'name':'record_usercenter',	'roles':'root,ZBCPOA,JIHUAY,WULGYY,ZXCPOA,ZHIJIA,WULIUY,PCJIHY,PZJIHY,YCJIHY'},
*			              {'name':'record_lingjbh',		'roles':'root,ZBCPOA,JIHUAY,WULGYY,ZXCPOA,ZHIJIA,WULIUY,PCJIHY,PZJIHY,YCJIHY'}];
*name:字段名称  layout_property
*roles：需要置灰的角色，"逗号"分隔
*role：当前登陆人的角色
*/
function setDisabled(params,role){
	$.each(params,function(i,n){
		$.each(n.roles.split(','),function(i,value){
			if( value == role){
				$('#'+n.name).addClass("disabled").find(".textInput").attr("disabled","disabled");
				$('#'+n.name).addClass("disabled").addClass('readonly');
				return false;
			}
		});
	});
}

/**
用途：锁定下拉框为只读模式
编写：zhangl
*/


function selectReadOnly(selectedId){


	var obj = document.getElementById(selectedId);
	
	obj.onmouseover = function(){
		obj.setCapture();
	}
	
	obj.onmouseout = function(){
		obj.releaseCapture();
	}
	
	obj.onfocus = function(){
		obj.blur();
	}
	
	obj.onbeforeactivate = function(){
		return false;
	}
}

/**
用途：解除下拉框为只读模式
编写：zhangl
*/
function selectReadRelease(selectedId){

	var obj = document.getElementById(selectedId);
	
	obj.onmouseover = function(){
		obj.releaseCapture();
	}
	
	obj.onmouseout = function(){
		obj.releaseCapture();
	}
	
	obj.onfocus = function(){
		//obj.blur();
	}
	
	obj.onbeforeactivate = function(){
		return true;
	}
}


/** EUIS 项目 公用操作函数文件
函数清单

function trim(sString)      切除字符串前后空格
String.prototype.replaceAll = function(reallyDo, replaceWith, ignoreCase)  replaceAll的js版替换函数
function lockPage()         锁定forms[0]中所有控件
function lockObj(inputObj)  锁定某一控件

*/



/**
用途：切除字符串前后空格
编写：zhangl
*/
function trim(str){
	return $.trim(str);
}

/**
用途：replaceAll的js版替换函数
编写：zhangl
用法：str = str.replaceAll("","");

string：字符串表达式包含要替代的子字符串。
reallyDo：被搜索的子字符串。
replaceWith：用于替换的子字符串。
*/
String.prototype.replaceAll = function(reallyDo, replaceWith, ignoreCase) {   
    if (!RegExp.prototype.isPrototypeOf(reallyDo)) {   
        return this.replace(new RegExp(reallyDo, (ignoreCase ? "gi": "g")), replaceWith);   
    } else {   
        return this.replace(reallyDo, replaceWith);   
    }   
} 

/**
用途：检查字符串是否为整数
编写：zhangl
*/
function isInteger(s) {
    if (isEmpty(s)) return true;
    for (var i = 0; i < s.length; i++){
		if (validDigit.indexOf(s.charAt(i)) == - 1) return false;
    }
    return true;
}

/**
用途：锁定forms[0]中所有控件
编写：zhangl
*/

function lockPage(){  
  var inputObj = null; 
  var objAll = document.forms[0].elements;
    
  for (var i = 0;i < objAll.length; i++){
      inputObj = objAll[i];

      if ( inputObj == null || inputObj.type == null ) continue;      
      lockObj(inputObj);
   }
}

/**
用途：锁定某一控件
编写：zhangl
*/

function lockObj(inputObj){
	if (inputObj == null ) return false;   
    if (inputObj.type == null ) return false;
    
    if (inputObj.type.toLowerCase() == "text") {       //控件类型为text
        inputObj.readOnly = true;
        //inputObj.className = "readonly_input";
    }
    else if (inputObj.type.toLowerCase().indexOf("select") >=0){ //控件类型为select
       inputObj.disabled = true;
    }
    else if(inputObj.type.toLowerCase() == "checkbox"){  //控件类型为checkbox
        inputObj.disabled = true;
     }
     else if(inputObj.type.toLowerCase() == "radio"){     //控件类型radio
       inputObj.disabled = true;
     }
     
     else if(inputObj.type.toLowerCase() == "button"){     //控件类型button
       inputObj.disabled = true;
     }
     else if(inputObj.type.toLowerCase() == "submit"){     //控件类型submit
       inputObj.disabled = true;
     }
     else if(inputObj.type.toLowerCase() == "reset"){     //控件类型reset
       inputObj.disabled = true;
     }
     
     else if (inputObj.type.toLowerCase().indexOf("textarea") >=0){ //控件类型为textarea
       inputObj.readOnly = true;
    }      
}

/**
用途：解锁某一控件
编写：zhangl
*/

function unLockObj(inputObj){//解锁某一控件

	if (inputObj == null ) return false;
	
	if (!isArray(inputObj)){
	
  		if (inputObj.type == null ) return false;
	    if (inputObj.type.toLowerCase() == "text") {       //控件类型为text
	        inputObj.readOnly = false;
	        //inputObj.className = "";
	    }
	    else if (inputObj.type.toLowerCase().indexOf("select") >=0){ //控件类型为select
	       inputObj.disabled = false;
	    }
	    else if(inputObj.type.toLowerCase() == "checkbox"){  //控件类型为checkbox
	        inputObj.disabled = false;
	    }
	    else if(inputObj.type.toLowerCase() == "radio"){     //控件类型radio
	       inputObj.disabled = false;
	    }
	    else if(inputObj.type.toLowerCase() == "button"){     //控件类型button
	       inputObj.disabled = false;
	    }
	    else if(inputObj.type.toLowerCase() == "submit"){     //控件类型submit
	       inputObj.disabled = false;
	    }
	    else if(inputObj.type.toLowerCase() == "reset"){     //控件类型reset
	       inputObj.disabled = false;
	    }
	    else if (inputObj.type.toLowerCase().indexOf("textarea") >=0){ //控件类型为textarea
	       inputObj.readOnly = false;
	    }
	}else{
	    for (var j = 0; j < inputObj.length; j++){
	      	unLockObj(inputObj[j]);
	    }
	}       
}

/**
用途：锁定某一按钮
编写：zhangl
*/

function lockButton(sButtonName){
     var oButton = document.all.item(sButtonName);
     if(oButton != null)oButton.disabled = true;
}

/**
用途：解锁某一按钮
编写：zhangl
*/
function unLockButton(sButtonName){
    var oButton = document.all.item(sButtonName);
    if(oButton != null)oButton.disabled = false;
}


/**
用途：隐藏表
编写：zhangl
*/
function hiddeTable(tableId){
   var objTab = document.all(tableId);
   if (objTab != null)objTab.style.display='none'; 

}

/**
用途：显示表
编写：zhangl
*/
function showHideTable(tableId){
  var tableId = document.all(tableId);
  if (tableId == null) return false;
  if (tableId.style.display == "none") {//如果为隐藏状态
  
  tableId.style.display="";//切换为显示状态
  }
  else{//否则
  
  tableId.style.display="none";//切换为隐藏状态
  }

}

function showTable(tableId){
 var objTab = document.all(tableId);
 objTab.style.display=''; 

}

/**
用途：隐藏按钮
编写：zhangl
*/
function hiddeButton(sButtonName){
  var oButton = document.all.item(sButtonName);
  if (oButton != null){
    if (!isArray(oButton)){//单个控件
      oButton.style.display='none';
    }else{//oButton为控件数组
      for (var j = 0; j < oButton.length; j++){
        
          oButton[j].style.display='none';
        }
    }  
  }
}



/**
用途：隐藏对象
编写：zhangl
*/
function hideObj(obj){
  if (obj == null) return(false);
  if (obj.style == null)return(false);
  if (obj.style.display == null)return(false);
  
  obj.style.display='none';
}

/**
用途：显示对象
编写：zhangl
*/
function showObj(obj){
  if (obj == null) return(false);
  if (obj.style == null)return(false);
  if (obj.style.display == null)return(false);
  
  obj.style.display='';
}


/**
用途：锁定table内容
编写：zhangl
*/
function lockTable(tableId){
  lockTableInput(tableId,"input");
  lockTableInput(tableId,"select");
  lockTableInput(tableId,"textarea");

}

/**
用途：锁定table内容
编写：zhangl
*/
function lockTableInput(tableId,inputType){
  var oTable = document.all(tableId);
  var aObjInput = oTable.getElementsByTagName(inputType);
  //alert(aObjInput.length);
  for (var i = 0;i < aObjInput.length; i++){
      inputObj = aObjInput[i];
      
      if ( inputObj == null || inputObj.type == null ) continue;
      lockObj(inputObj);
    
   }

}



function HTMLEncode( text )
{
	text = text.replace(/&/g, "&amp;") ;
	text = text.replace(/"/g, "&quot;") ;
	text = text.replace(/</g, "&lt;") ;
	text = text.replace(/>/g, "&gt;") ;
	text = text.replace(/'/g, "&#39;") ;

	return text ;
}
//是否数组
function isArray(a) {
    //return isObject(a) && a.constructor == Array && a.length != null;
    return isObject(a) && a.length != null;
}
function isObject(a) {
    return (a && typeof a == 'object') || isFunction(a);
}
function isFunction(a) {
    return typeof a == 'function';
}
function isEmpty(o) {
    var i, v;
    if (isObject(o)) {
        for (i in o) {
            v = o[i];
            if (isUndefined(v) && isFunction(v)) {
                return false;
            }
        }
    }
    return true;
}
function isBoolean(a) {
    return typeof a == 'boolean';
}
function isNull(a) {
    return a === null;
}
function isNumber(a) {
    return typeof a == 'number' && isFinite(a);
}
function isString(a) {
    return typeof a == 'string';
}
function isUndefined(a) {
    return typeof a == 'undefined';
}




/**
用途：清空Form中元素的值
传入参数：form的名字
*/
function clearForm(formName) {
	//var form = document.all(formName);
	var form = document.getElementById(formName);
	if(form ==null) {
		return;
	}
	for(var i = 0;i <form.length; i++) {
		if(form[i].tagName == "INPUT") {
			if(form[i].type == "text" || form[i].type == "password" ) {
				form[i].value = "";
			} else if (form[i].type == "checkbox" || form[i].type == "radio") {
				if(form[i].checked) {
					form[i].checked = false;
				}
			} 
		} else if (form[i].tagName == "TEXTAREA") {
			form[i].value = "";
		} else if (form[i].tagName == "SELECT" ) {
			var _options = form[i].options;
			if(_options.length > 0) {
				_options[0].selected = true;
			}
		} 
	}
}

/**
用途：清空Table中元素的值
传入参数：Table的id
add by liqb
*/
function clearTable(tableId) {
    //alert("a");
    //debugger;
	var table = document.getElementById(tableId);
	if(table == null || table == undefined) {
		return;
	}
	var rows = table.rows;
	for(var i = 0;i<rows.length;i++) {
		for( var j = 0;j<rows[i].cells.length;j++) {
			var childs = rows[i].cells[j].childNodes;
			for(var k = 0 ;k<childs.length;k++) {
				if(childs[k].tagName == "INPUT") {
					if(childs[k].type == "text" || childs[k].type == "password" ) {
						childs[k].value = "";
					} else if (childs[k].type == "checkbox" || childs[k].type == "radio") {
						if(childs[k].checked) {
							childs[k].checked = false;
						}
					} 
				} else if (childs[k].tagName == "TEXTAREA") {
					childs[k].value = "";
				} else if (childs[k].tagName == "SELECT" ) {
					var _options = childs[k].options;
					if(_options.length > 0) {
						_options[0].selected = true;
					}
				} 
			}
		}
	}
}

/**
*通过ID，改变控件的value值
参数 id：要改变值的控件ID
参数 v:改变的值
**/
function updatePageById(id,v) {
	var obj = getObject(id);
	if (obj.tagName == "SELECT") {
		var _option = obj.options;
		for (var i = 0; i < _option.length; i++) {
			if (_option[i].value == v) {
				_option[i].selected = true;
			}
		}
   } else if ( obj.tagName == "INPUT" ) {
		if (obj.type == "text" || obj.type =="hidden" ) {
			obj.value = v;
		}		
	} else if ( obj.tagName == "TEXTAREA") {
		obj.innerHTML = v;
	} else {
		alert("注意！有标签没定"); //注意！有标签没定
	}	
}


/**
用途：8位数字日期校验
编写：zhangl

v-值
msg-中文解释

*/

function dateNumberTest(v,msg){

	if(v==null || v==""){
		alert(msg+"空值!");
		return false;
	}
		
	if(v.length!=8){
		alert(msg+"不足8位!");
		return false;
	}	
	
	var yyyy = v.substring(0,4);	
	var mm = v.substring(4,6);
	var dd = v.substring(6,8);	
	
	//yyyy = Number(yyyy);
	//mm = Number(mm);
	//dd = Number(dd);
	if( mm.indexOf("0") != -1 )  mm = mm.substring(1,2);
	if( dd.indexOf("0") != -1 )  dd = dd.substring(1,2);
	
	var sBirthday = yyyy+"/"+mm+"/"+dd;
	var d=new Date(sBirthday);
		
	if(  sBirthday!=( d.getFullYear()+"/"+ (d.getMonth()+1) + "/" + d.getDate() )  ){
		alert(msg+"Error:非法日期");
		return false;
	}
	
	return true;
}


/**
*用途：全角转换为半角
 传入全角字符串，返回半角字符串
 编写：liqb
**/ 
function ToCDB(str) { 
	var tmp = ""; 
	for(var i=0;i<str.length;i++) { 
		if(str.charCodeAt(i)>65248&&str.charCodeAt(i)<65375) { 
			tmp += String.fromCharCode(str.charCodeAt(i)-65248); 
		} else { 
			tmp += String.fromCharCode(str.charCodeAt(i)); 
		} 
	} 
	return tmp 
}

/**
	用途：半角转换为全角
	传入半角字符串，返回全角字符串
	编写：liqb
**/
function ToDBC(txtstring) { 
	var tmp = ""; 
    for(var i=0;i<txtstring.length;i++) { 
		if(txtstring.charCodeAt(i)==32) { 
			tmp= tmp+ String.fromCharCode(12288); 
		} 
		if(txtstring.charCodeAt(i)<127) { 
			tmp=tmp+String.fromCharCode(txtstring.charCodeAt(i)+65248); 
		} else { 
			tmp += String.fromCharCode(txtstring.charCodeAt(i)); 
		}

	} 
	return tmp; 
}


//验证是否为汉字,提示不能输入中文
function IsChinese(obj,msg){
	var CHNReg=/[\u4e00-\u9fa5]/;//汉字的正则表达式
	
	if( obj != null || obj!="" ){
		if( obj.value != null || obj.value !="" ){
			if(obj.value.match(CHNReg)){
				alert(msg+"不能输入中文！");
				obj.focus();
				return true;
			}
		}	
	}
	
	
	return false;
} 

function setReadOnly(objectId){
	var object = document.getElementById(objectId);
	object.removeAttribute("readOnly");
	object.setAttribute("readOnly",true);
}

function setReadAndWrite(objectId){
	var object = document.getElementById(objectId);
	object.removeAttribute("readOnly");
	object.setAttribute("readOnly",false);
}

/**
* 获得对象
* id:对象的id
* oWindow:window对象
* Banglu
*/
function getObject(id, oWindow){
  var obj;
  if(oWindow==null){
    obj = window.document.getElementById(id);
  }
  else{
    obj = oWindow.document.getElementById(id);
  }
  return obj;
}

/**
 * 单击鼠标选中表格中的一行
 */
function  selectThis(obj,tableId){

var actionTable = getObject(tableId);
  for(var i=1;i<actionTable.rows.length;i++){
    actionTable.rows[i].className="";
  }
   obj.className= "bg2";
}


 
  /**
 *通过表格ID 使一个表格的所有控件变成可编辑状态
 * Banglu
 */
function unLockTable(tableID){
    var actionTable=getObject(tableID);
    if(actionTable==null){
   alert("表格不存在");
return false;
  }
    var row=actionTable.rows;
    var rowLen=row.length;
  for(var i=0;i<rowLen;i++){
    var cell=row[i].cells;
     var cellLen=cell.length;
       for(var j=0;j<cellLen;j++){
       var child=cell[j].children;
        var childLen=child.length;
           for(var k=0;k<childLen;k++){
           child[k].disabled="";     
         }
    }
  }
 }
 

 
/*
* 获取当前动作所在的Table
* Banglu
*/
function getEvenTable(){
  var obj = event.srcElement;
  for(var i = 0; i < 10; i++){
    if (obj.tagName == "TABLE") {
      return(obj);
    }else{
      obj = obj.parentElement;
      if (obj == null) return(null);
    }    
  }  
}

/*
*删除一行
*/
function delRow(obj,myTable){
  var actionTable = getObject(myTable);
    actionTable.deleteRow(obj.parentElement.parentElement.rowIndex); 
}


/*
 * id:对象的id
 * oWindow:window对象
 * 获得对象并去除对象值的左右空格
 */
function getTrimObject(id,oWindow){
	return trim(getObject(id, oWindow).value);
}

/*关闭弹出窗口*/
function closeDialog(){
	var dialog = window.parent.toft.dialogRef;  
	dialog.close();
}

function getGridHeight(){
	var pageHeight = document.body.clientHeight;
	var gridHeight = pageHeight - 386;
	$('.youi-grid .grid-content .grid-fixed').css('height', function(index) {
	  return gridHeight;
	});
	$('.youi-grid .grid-content .grid-scroll').css('height', function(index) {
		  return gridHeight;
		});
}
/**
 * grid行选
 * @param selectedIds 
 * @param rowTr
 * @param selectedrecords
 * @param selectedrecord
 * @param cell
 * @param cols
 * @returns {Boolean}
 */
function xqjsRowSelect(selectedIds,rowTr,selectedrecords,selectedrecord,cell,cols) {
	var checkbox = $(cell)[0];
	if(checkbox.type == 'checkbox'){
		return true;
	}else if(checkbox.type == 'radio'){
		return true;
	}
	return false;
}
//行编辑保存后的方法
function afterSaveRows(result){
	if(false == result.success){
		return false;
	}
	return true;
}

/**
 * 功能：返回不为undefined或null的值
 * 作者：hezhiguo
 * 日期：2012-8-16
 */
function isUndefinedOrNull(val){
	var result = "";
	if(val==undefined||null == val){
		result = "";
	}else{
		result = val;
	}
	return result;
}

/**
 * 功能：隐藏按钮
 * 作者：gswang
 * 日期：2012-11-05
 */
function buttonConsole(sButtonName){
	var str= new Array();
	str=sButtonName.split(",");
	for (i=0;i<str.length ;i++ ) {
		$("#"+str[i]).css('display','none');
	}
}


/**
 * 功能：调用loading 显示
 * 作者：gswang
 * 日期：2012-11-05
 */
function down_showLoading(){
	var id = 'youi_loading';
	var loading = $('#'+id);
	if(!loading.length){
		loading = $('<div class="youi-loading" id="'+id+'"/>').appendTo($('body',document));
	}
	title =$.sdcui.resourceUtils.get('loading');
	$('body',document).addClass('show-loading');
	loading.show().text(title).css({
		height:Math.max($(window).height(),$('body',document).height())
	});
}

/**
 * 功能：调用loading 隐藏
 * 作者：gswang
 * 日期：2012-11-05
 */
function down_hideLoading(){
	var id = 'youi_loading';
	$('#'+id).hide('slow');
	$('body',document).removeClass('show-loading');
}