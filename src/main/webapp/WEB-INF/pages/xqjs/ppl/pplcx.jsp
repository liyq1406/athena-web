<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.ndpplyg}" >
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	</head>
	<script type="text/javascript">
	

	</script>
	<t:page i18n="i18n.xqjs.ppl.pplbjjs">
	<t:grid id="grid_niandppl" caption="${i18n.ndpplyg}"  showNum="true" idKeys="pplbc,zhuangt,jisnf,ppllx,editor,edit_time" back="NOT"
	src="/ppl/searchNdPpl.ajax" add="NOT" edit="NOT" remove="NOT"  multiple="true" selectRowEvent="selectRow" scrollHeight="330">
	<t:fieldLayout columns="3">
				<t:fieldText  property="pplbc" caption="${i18n.pplbc}" width="150" maxLength="15"></t:fieldText>
				<t:fieldText  property="maoxqbc"  caption="${i18n.maoxqbc}" width="150" maxLength="20"></t:fieldText>
				<t:fieldCalendar property="jissj" caption="${i18n.jissj}" format="yyyy-MM-dd" width="165"></t:fieldCalendar>
	</t:fieldLayout>
	<t:gridCol property="chkbox" align="center" renderer="createCheckbox" caption="${i18n.xuanz}" ></t:gridCol>
	<t:gridCol property="jiz" align="center" renderer="createRadio" caption="${i18n.jiz}" ></t:gridCol>
	<t:gridCol width="130" property="pplbc" type="link" caption="${i18n.pplbc}"></t:gridCol>
	<t:gridCol width="100" property="maoxqbc"  caption="${i18n.maoxqbc}"></t:gridCol>
	<t:gridCol  property="jissj"  caption="${i18n.jissj}"></t:gridCol>
	<t:gridCol  property="zhuangt" convert="zhuangt"  caption="${i18n.zhuangt}"></t:gridCol>
	<t:gridCol  property="jisnf"   caption="${i18n.jsnf}"></t:gridCol>
	<t:gridCol  property="beiz" caption="${i18n.beiz}"></t:gridCol>

	</t:grid>
	<div style="width: 500px"> 
	<table>
	<tr><td>
	${i18n.beiz}:<input id="beiz" name="beiz" type="text"/><input type="hidden" id="jizValue"></td>
	<td>
	<div class="youi-button active-0">
	<div class="right" style="width: 40px">
	<div class="center">
	<a onclick="saveBeiz()">${i18n.save}</a>
	</div></div></div>
	</td>
	</table>
	</div>
	<t:buttons id="button_form">
	<t:button caption="${i18n.shengx}" name="shengx"></t:button>
	<t:button caption="${i18n.bij}" name="bij"></t:button>
	</t:buttons>
	</t:page>
	<script type="text/javascript">

    $.sdcui.serverConfig.convertArray['zhuangt'] = {'1':'${i18n.yshengx}','0':'${i18n.unshengx}'};
	/*
	*获取参数方法
	*/
	function getParam(){
		var param = $('#grid_niandppl').grid('getSelectedRecords');//获取选中的调拨申请明细,仅可为一条
		if(param.length ==0){
			alert("${i18n.selectOneBeizSave}");
			return false;
		}
		else if(param.length > 1){
			alert('${i18n.onlySelectOneRowBeizSave}');
			return false;
		}
		return param;
	}
	/*
	*保存备注方法
	*/
	function saveBeiz(){
		var param = getParam();
		var params = [];
		var beiz = $('#beiz').val();
		var len = beiz.match(/[^ -~]/g) == null ? beiz.length : beiz.length + beiz.match(/[^ -~]/g).length 
		if(len>200){
		   alert("${i18n.beizLengthMessage}");
		   return false;
		}
		params.push('ndyg.pplbc='+param[0].pplbc);//PPL版次
		params.push('ndyg.beiz='+beiz);//备注
		params.push('ndyg.editor='+param[0].editor);
		params.push('ndyg.edit_time='+param[0].edit_time);
		 $.sdcui.ajaxUtil.ajax({
             url:"saveBeiz.ajax",//请求url
             data:params.join('&'),//传递参数
            	success:function (result){//回调函数
            		alert(result.result);//弹出提示结果
            		$('#grid_niandppl').grid('reload');//刷新grid
             }
     	});
	}
	
	/*
	*生效方法
	*/
	function func_button_shengx(){
		var param = getParam();
		var params = [];
		params.push('ndyg.pplbc='+param[0].pplbc);//PPL版次
		params.push('ndyg.beiz='+$('#beiz').val());//备注
		params.push('ndyg.editor='+param[0].editor);
		params.push('ndyg.edit_time='+param[0].edit_time);
		var zhuangt = param[0].zhuangt==='${i18n.unshengx}'?'0':'1';
		params.push('ndyg.zhuangt='+zhuangt);
		 $.sdcui.ajaxUtil.ajax({
             url:"shengX.ajax",//请求url
             data:params.join('&'),//传递参数
            	success:function (result){//回调函数
            		alert(result.result);//弹出提示结果
            		$('#grid_niandppl').grid('reload');//刷新grid
             }
     	});
	}
	
	/*
	*比较方法
	*/
	function func_button_bij(){
		var param = $('#grid_niandppl').grid('getSelectedRecords');//获取选中的调拨申请明细,仅可为一条
		var jizValue = radioClick();
		if(jizValue==null||typeof(jizValue)===undefined||jizValue.length==0){
		    alert('${i18n.bjErrorMessage1}');
			return false;
		}
		var first = param[0];
		var second = param[1];
		if(param.length != 2 ||(jizValue[0].pplbc!=first.pplbc&&jizValue[0].pplbc!=second.pplbc)){
			alert('${i18n.bjErrorMessage2}');
			return false;
		}else if(first.ppllx!==second.ppllx){
		    alert('${i18n.bjErrorMessage3}');
			return false;
		
		}else if(first.jisnf!=second.jisnf){
		    alert('${i18n.bjErrorMessage4}');
		    return false;
		}
		var record = $('#grid_niandppl').grid('getSelectedRecords');//获取当选择行记录
		var params = [];
		params.push("pplbc1="+jizValue[0].pplbc);
		var bc2=record[1].pplbc==jizValue[0].pplbc?record[0].pplbc:record[1].pplbc;
		params.push("pplbc2="+bc2);
		var data = params.join('&');
		/**
		 * form跳转模式提交

		$.sdcui.pageUtils.goPage({
			url:'biJ.do',//url
			record:params,//
			mode:'form',
			beforeSubmit:function(){
				return true;
			}
		});		 */
		winOpen = window.open ('${ctx}/ppl/biJ.do?removeId=layout-north,layout-west,layout-south&'+data,
		'${i18n.bj}',
		'height=500,width=800,top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no, status=no');
         winOpen.resizeTo(screen.availWidth,screen.availHeight);
        return false;
	}
	
	
	
	function radioClick(){
		var radios = document.getElementsByName("jiz");
		var params = [];
		var param = {};
		for ( var i = 0; i < radios.length; i++) {
			if (radios[i].checked == true) {
				//alert(radios[i]);
				var rowElemt = $(radios[i]).parent('td:first').parent('tr:first');
				var pplbc = rowElemt.find('td:eq(2)').text();
				param.pplbc = pplbc;
				params[0]=param;
			}
		}
		//$(rowElemt).find('< td').addClass('selected');
		return params;
	}
	
	/**
	*列渲染事件,创建Radio	
	*/
	function createRadio(){
		return "<input  name='jiz' onclick='radioClick()' type='radio' value='1'/>";
	}
	
	/**
	*列渲染事件,创建checkbox	
	*/
	function createCheckbox(){
		return "<input  name='chkbox'  type='checkbox' value='1'/>";
	}
	
	function selectRow(selectedIds,rowTr,selectedrecords,selectedrecord,cell,cols) {
		var checkbox = $(cell)[0];
		//var chk = $(rowTr).find("input[type='checkbox']");
		//var red = $(rowTr).find("input[type='radio']");
        if(checkbox.type == 'checkbox'){
			return true;
		}
		return false;
   }
	
	/**
	*链接点击事件
	*/
	function link_pplbc(event){
		var event = event||window.event;//原生态的事件处理 
		var element = event.srcElement||event.target;
		var rowDoc = $(element).parents('tr:first')[0];
		var record = $('#grid_niandppl').grid('getRecord',rowDoc);//获取当前行对应的记录
		var zhuangt = record.zhuangt=='${i18n.unshengx}'?'0':'1';
		record.zhuangt = zhuangt;
		var param = [];
		param.push("pplbc="+record.pplbc);
		param.push("zhuangt="+zhuangt);
		param.push("jisnf="+record.jisnf);
		var data = param.join('&');
		/**
		 * form跳转模式提交
		$.sdcui.pageUtils.goPage({
			url:'/ppl/initNdppl.do',//url
			record:record,//
			mode:'form',
			beforeSubmit:function(){
				return true;
			}
		});
		//element.stopPropagation();//阻止事件冒泡
		return false;		 */
		winOpen =window.open ('${ctx}/ppl/initNdppl.do?removeId=layout-north,layout-west,layout-south&'+data,
		'${i18n.ndpplyg}',
		'height=500,width=800,top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no, status=no');
         winOpen.resizeTo(screen.availWidth,screen.availHeight);
        return false;

	}
	</script>
	<style type="text/css"></style>
</t:html>