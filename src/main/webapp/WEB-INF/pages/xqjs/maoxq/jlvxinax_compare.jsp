<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.mxqcxbj}" >
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<script type="text/javascript">
		</script>
	</head>
	<t:page  i18n="i18n.xqjs.maoxq.ddbhclv_compare">
	<t:grid id="grid_XINAXJLV_compare"  caption="${i18n.zqmxq}"     
			src="/maoxq/queryjlvxinax.ajax"  idKeys="bijrq,usercenter,chanx,lingjbh"   showNum="true" remove="NOT"  edit="NOT"  add="NOT"
			usePager="true"   save="NOT"  load="false" scrollHeight="340"  pageSize="15">
	            <t:fieldLayout id="layout" prefix="record"  columns="3">
	              <t:fieldCalendar property="bijrq" format="yyyy-MM-dd" caption="比较日期" width="120" notNull="true"></t:fieldCalendar>
                  <t:fieldSelect property="usercenter"  caption="${i18n.usercenter}" defaultValue="${usercenter}" convert="queryUserCenterMap" width="120" notNull="true"></t:fieldSelect>
                  <t:fieldText   property="chanx" caption="${i18n.chanx}"      width="100"  maxLength="5" notNull="true"></t:fieldText>
                  <t:fieldText   property="lingjbh" caption="${i18n.lingjbh}"      width="120" maxLength="10"></t:fieldText>
                  <t:fieldText   property="jlvxinaxchae" caption="${i18n.clvddhbchae}"  dataType="number" expression="^[1-9][0-9]{0,4}$|^0$"  expressionMessage="0-999的整数" width="120" maxLength="3"></t:fieldText>
				</t:fieldLayout>
			<div id="kaisrq">日需求(J0-J8:${kaisrq})</div>
			<t:gridCol  property="usercenter" type="text" caption="${i18n.usercenter}"  ></t:gridCol>
			<t:gridCol  property="lingjbh"    type="text" caption="${i18n.lingjbh}" ></t:gridCol>
			<t:gridCol  property="chanx"      type="text" caption="${i18n.chanx}"  ></t:gridCol>
			<t:gridCol  property="jlvj0"    type="text" caption="JLV J0"  ></t:gridCol>
		    <t:gridCol  property="xinaxj0"    type="text" caption="DDBH J0"  ></t:gridCol>
		    <t:gridCol  property="marginj0"    type="text" caption="J0${i18n.ce}" ></t:gridCol>
		    
		    <t:gridCol  property="jlvj1"    type="text" caption="JLV J1"  ></t:gridCol>
		    <t:gridCol  property="xinaxj1"    type="text" caption="DDBH J1" ></t:gridCol>
		    <t:gridCol  property="marginj1"    type="text" caption="J1${i18n.ce}"  ></t:gridCol>
		    
		    <t:gridCol  property="jlvj2"    type="text" caption="JLV J2" ></t:gridCol>
		    <t:gridCol  property="xinaxj2"    type="text" caption="DDBH J2" ></t:gridCol>
		    <t:gridCol  property="marginj2"    type="text" caption="J2${i18n.ce}"  ></t:gridCol>
		    
		    <t:gridCol  property="jlvj3"    type="text" caption="JLV J3"  ></t:gridCol>
		    <t:gridCol  property="xinaxj3"    type="text" caption="DDBH J3"  ></t:gridCol>
		    <t:gridCol  property="marginj3"    type="text" caption="J3${i18n.ce}"  ></t:gridCol>
		    
		    <t:gridCol  property="jlvj4"    type="text" caption="JLV J4"  ></t:gridCol>
		    <t:gridCol  property="xinaxj4"    type="text" caption="DDBH J4"  ></t:gridCol>
		    <t:gridCol  property="marginj4"    type="text" caption="J4${i18n.ce}"  ></t:gridCol>
		    
		    <t:gridCol  property="jlvj5"    type="text" caption="JLV J5"  ></t:gridCol>
		    <t:gridCol  property="xinaxj5"    type="text" caption="DDBH J5"  ></t:gridCol>
		    <t:gridCol  property="marginj5"    type="text" caption="J5${i18n.ce}"  ></t:gridCol>
		    
		    <t:gridCol  property="jlvj6"    type="text" caption="JLV J6"  ></t:gridCol>
		    <t:gridCol  property="xinaxj6"    type="text" caption="DDBH J6"  ></t:gridCol>
		    <t:gridCol  property="marginj6"    type="text" caption="J6${i18n.ce}"  ></t:gridCol>
		    
		    <t:gridCol  property="jlvj7"    type="text" caption="JLV J7"  ></t:gridCol>
		    <t:gridCol  property="xinaxj7"    type="text" caption="DDBH J7"  ></t:gridCol>
		    <t:gridCol  property="marginj7"    type="text" caption="J7${i18n.ce}"  ></t:gridCol>
		    
		    <t:gridCol  property="jlvj8"    type="text" caption="JLV J8"  ></t:gridCol>
		    <t:gridCol  property="xinaxj8"    type="text" caption="DDBH J8"  ></t:gridCol>
		    <t:gridCol  property="marginj8"    type="text" caption="J8${i18n.ce}"  ></t:gridCol>
			<t:gridCol  property="lingjmc"    type="text" caption="${i18n.lingjmc}"   ></t:gridCol>
			<t:gridCol  property="bijrq"    type="text" caption="${i18n.bijrq}"   ></t:gridCol>
			<t:gridCol  property=""    type="text" caption=" "  width="40" ></t:gridCol>
			</t:grid>
			<div id="ck_dataItems_selectedValues" style="display: none;">
		        <div class="youi-button active-3" id="button_expxls">
					<div class="right">
					<div class="center">
					  <a class="expxls" href="#">${i18n.exldaoc}</a>
			       </div>
			       </div>
			    </div>
	   		 </div>
	</t:page>
	<script type="text/javascript">
	$(function(){ 
		var htmls =[];
		htmls.push($('#ck_dataItems_selectedValues').html());
		$('div.grid-formButtons table tr').append('<td>'+htmls.join('')+'</td>');
		 $('#ck_dataItems_selectedValues').empty();
		$('#button_expxls').click(func_grid_expxls);
	});
	//查询前执行方法
	function grid_XINAXJLV_compare_beforeSubmit() {
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/maoxq/showXinaxDate.ajax",
			data : "bijrq=" + $("#record_bijrq").fieldValue()+ "&usercenter="+ $("#record_usercenter").fieldValue()+"&chanx=" + $("#record_chanx").fieldValue(),
			success : function(result) {
				var rq = '日需求(J0-J8:' + result.kaisrq + ')';
				$('#kaisrq').text(rq);
			}
		});
	}
		
		function func_grid_expxls(){
				var usercenter = $('#record_usercenter').fieldValue();
				var lingjbh = $('#record_lingjbh').fieldValue();
				var chanx = $('#record_chanx').fieldValue();
				var bijrq = $('#record_bijrq').fieldValue(); 
				var jlvxinaxchae = $('#record_jlvxinaxchae').fieldValue(); 
				if(bijrq == null  || bijrq ==""){
					alert("【比较日期】不能为空");
					return false;
				} else if(usercenter == null || usercenter == ""){
					alert("【用户中心】不能为空");
					return false;
				}else if(chanx == null || chanx == ""){
					alert("【产线】不能为空");
					return false;
				}
				
				if(jlvxinaxchae!=null && jlvxinaxchae!=""){
					var patrn=/^[1-9][0-9]{0,4}$|^0$/;
					if (!patrn.exec(jlvxinaxchae)) {
						alert("【正负差异比】只能输入0-999的整数");
						return false
					}
				}
				$.sdcui.pageUtils.goPage({
					url:'/maoxq/downLoadJlvXinaxCompare.do?usercenter='+usercenter+'&lingjbh='+lingjbh+'&chanx='+chanx+'&bijrq='+bijrq+'&jlvxinaxchae='+jlvxinaxchae,//url
					mode:'form',
					beforeSubmit:function(){
						//
						return true;
					}
				});
			}
	
	</script>
	<style type="text/css">
	
	</style>
</t:html>