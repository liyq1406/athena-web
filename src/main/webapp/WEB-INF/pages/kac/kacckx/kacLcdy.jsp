<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="${i18n.kaclcdy_title }">
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> 
#grid_kac_liucdy .youi-fieldLayout table td.contral.label-col { width: 75px; } 
#form_ckx_keh_chengpk .youi-fieldLayout table td.contral.label-col { width: 100px; }
#redWarm {color:red;}
</style>
</head>
<t:page i18n="i18n.kac.kacckx">
	<t:grid id="grid_kac_liucdy" caption="${i18n.kaclcdy_title }"
		idKeys="usercenter,quybh,liucbh" src="/kac/queryLiucdy.ajax" removeSrc="/kac/removeKac.ajax"
		dataFormId="form_kacLcdy" load="false" showNum="true" remove="NOT">
		<t:fieldLayout id="liucdy" prefix="liucdy" columns="3">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter }" convert="queryUserCenterMap" 
			              defaultValue="${usercenter }" width="120" />
			<t:fieldSelect property="quybh" width="120" caption="${i18n.quybh }" parents="usercenter" parentsAlias="usercenter" 
			               src="/kac/queryPostDengdqy.ajax" show="quybh" code="quybh" notNull="true"></t:fieldSelect>
		    <t:fieldSelect property="daztbh" width="120" caption="${i18n.daztbh }" parents="quybh,usercenter" parentsAlias="quybh" 
		                   src="/kac/queryPostDazt.ajax" code="daztbh" show="daztbh"></t:fieldSelect>
			<t:fieldText property="liucbh" caption="${i18n.liucbh }" dataType="text" maxLength="3" width="120"></t:fieldText>
			<t:fieldSelect property="liucbs" caption="${i18n.liucbs }" convert="liucbs" width="120" />
			<t:fieldSelect property="biaos" caption="${i18n.biaos }" convert="biaos" defaultValue="1" width="120" />
		</t:fieldLayout>
		<t:gridCol property="usercenter" caption="${i18n.usercenter }"convert="queryUserCenterMap" width="120" ></t:gridCol>
		<t:gridCol property="quybh" caption="${i18n.quybh }" width="100" ></t:gridCol>
		<t:gridCol property="daztbh" caption="${i18n.daztbh }" width="100" ></t:gridCol>
		<t:gridCol property="liucbh" caption="${i18n.liucbh }" width="100" ></t:gridCol>
		<t:gridCol property="liucmc" caption="${i18n.liucmc }" width="120" ></t:gridCol>
		<t:gridCol property="liucbs" caption="${i18n.liucbs }" convert="liucbs" width="100" ></t:gridCol>
		<t:gridCol property="biaozsj" caption="${i18n.liucbzsj}" width="150" ></t:gridCol>
		<t:gridCol property="biaos" caption="${i18n.biaos }"  convert="biaos" defaultValue="1"></t:gridCol>
	    <t:button caption="失效" name="shixLC" active="1"></t:button>
	</t:grid>
	
	<t:form id="form_kacLcdy" caption="${i18n.kaclcdy_title }" idKeys="usercenter,quybh,liucbh,daztbh,liucbs"
		action="/kac/saveKac.ajax" dialog="true" reset="NOT"   width="600" >
	 	
		<t:fieldLayout columns="2" prefix="f_liucdy">
		 <t:fieldHidden property="morliucbh"  defaultValue="${morliucbh}"  />
		 <t:fieldHidden property="morliucmc"  defaultValue="${morliucmc}"  />
		 <t:fieldHidden property="flag"  defaultValue=" " caption="大站台编号" />
		<t:fieldSelect property="usercenter" caption="${i18n.usercenter }" convert="queryUserCenterMap" 
		                defaultValue="${usercenter }" notNull="true" width="150" />
		    <t:fieldSelect property="quybh" width="150" caption="${i18n.quybh }" parents="usercenter" parentsAlias="usercenter"  
		                   src="/kac/queryPostDengdqy.ajax" show="quybh" code="quybh" notNull="true"></t:fieldSelect>
		    <t:fieldSelect property="daztbh" width="150" caption="${i18n.daztbh }" parents="usercenter,flag,quybh" 
		                   src="/kac/queryDaztbh.ajax" code="daztbh" show="daztbh" notNull="true"></t:fieldSelect>
			<t:fieldText property="biaozsj" width="150" caption="${i18n.liucbzsj }" expression="^[1-9][0-9]{0,2}$" notNull="true" expressionMessage="只能填2位数字" maxLength="2" ></t:fieldText>
		    <t:fieldSelect property="liucbs" width="150" caption="${i18n.liucbs }" convert="liucbsZDY" notNull="true" ></t:fieldSelect>
			<t:fieldSelect property="biaos" width="150" caption="${i18n.biaos }" convert="biaos" defaultValue="1" notNull="true"></t:fieldSelect>
		 </t:fieldLayout>
		<div id="div_inputLiucbh" > 
		       <t:fieldLayout prefix="f_liucdy1" >
		          <t:fieldText property="liucbh" width="150" caption="${i18n.liucbh }"   maxLength="10"  readonly="true"></t:fieldText>
		          <t:fieldText property="liucmc" width="150" caption="${i18n.liucmc }"   readonly="true"></t:fieldText>
		      </t:fieldLayout>
		</div>
		<div id="div_selectLiucbh" > 
			<t:fieldLayout prefix="f_liucdy2" >
		     <t:fieldSelect property="liucbh" width="150"  caption="${i18n.liucbh }" parents="liucbs" parentsAlias="liucbs" 
		                   src="/kac/queryLiucbh.ajax" code="ZIDBM" show="ZIDBM" ></t:fieldSelect>
		      <t:fieldText property="liucmc" width="150" caption="${i18n.liucmc }"   readonly="true"></t:fieldText>
			</t:fieldLayout>
		</div> 
	</t:form>
<br/>	<br/>	
<div id="redWarm">
<p>说明：（1）默认流程：1申报、2排队、3准入、8放空、9出厂，在增加大站台时自动添加， 不能失效；</p>
<p>（2）自定义流程为：4开始卸货、5结束卸货 、6开始返空 、7结束返空，可失效或修改为生效；</p>


</div>
</t:page>
</t:html>
<script type="text/javascript">
	$.sdcui.serverConfig.convertArray['biaos'] = {
		'1' : '${i18n.youx}',
		'0' : '${i18n.shix}'
	};
	
	$.sdcui.serverConfig.convertArray['liucbs'] = {
			'0' : '${i18n.mor}',
			'1' : '${i18n.zidy}'
		};

	$.sdcui.serverConfig.convertArray['liucbsZDY'] = {
			'1' : '${i18n.zidy}'
		};
	
	$(document).ready(function(){
		$("#div_selectLiucbh").hide();
	});
	
	
	//增加
	
	
	
	/**
	*流程标识判断
	*/
    function f_liucdy_liucbs_change(){
    	var liucbs = trim($("#f_liucdy_liucbs").fieldValue());
    	if("0"==liucbs){//默认流程
    		$("#div_selectLiucbh").hide();
    		$("#div_inputLiucbh").show();
    		$("#f_liucdy1_liucbh").fieldValue($("#f_liucdy_morliucbh").fieldValue());
    		$("#f_liucdy1_liucmc").fieldValue($("#f_liucdy_morliucmc").fieldValue());
    		$("#f_liucdy2_liucbh").fieldValue("");
			$("#f_liucdy2_liucmc").fieldValue("");
    	}else if("1"==liucbs){//自定义流程,验证是否大站台下有默认流程，如果不存在默认流程则自动添加默认流程
    		//AJAX查询区域大站台下是否存在默认流程
    		  $("#div_inputLiucbh").hide();
    		  $("#div_selectLiucbh").show();
			  $("#f_liucdy1_liucbh").fieldValue("");
			  $("#f_liucdy1_liucmc").fieldValue("");
    	}
    }
    
  
    

	
    function f_liucdy2_liucbh_change(){
    	var liucbh = trim($("#f_liucdy2_liucbh").fieldValue());
    	if("4"==liucbh){
    		$("#f_liucdy2_liucmc").fieldValue("开始卸货");
    	}else if("5"==liucbh){
    		$("#f_liucdy2_liucmc").fieldValue("结束卸货");
    	}else if("6"==liucbh){
    		$("#f_liucdy2_liucmc").fieldValue("开始返空");
    	}else if("7"==liucbh){
    		$("#f_liucdy2_liucmc").fieldValue("结束返空");
    	}
    	
    }
	
	function func_button_edit(){
		$("#form_kacLcdy").form('clear');
		$('#form_kacLcdy').removeClass('operant-add');
		var record = $("#grid_kac_liucdy").grid("getSelectedRecords")[0];
		$("#form_kacLcdy").form('fillRecord', $.extend({}, record));
		$("#f_liucdy_flag").fieldValue(record.daztbh);	
		$("#form_kacLcdy").form("open","${i18n.update }");
		$("#f_liucdy_daztbh").fieldValue(record.daztbh);
		$("#f_liucdy_flag").fieldValue(record.daztbh);
		var obj = $("#f_liucdy_liucbs").find("input").first();
		obj.attr("value",record.liucbs==0?"${i18n.mor}":"${i18n.zidy}");
	}
	
	
	
	
	function f_liucdy_biaos_change(){
		if('0'== $("#f_liucdy_biaos").fieldValue()){
			$("#f_liucdy_biaos").removeClass('disabled');
			$("#f_liucdy_biaos input").attr("disabled",false);
		}else{
			$("#f_liucdy_biaos").addClass('disabled');
			$("#f_liucdy_biaos input").attr("disabled",true);
		}
	}
	
	 //失效按钮 
	function func_button_shixLC(){
		var record = $("#grid_kac_liucdy").grid("getSelectedRecords")[0];
		if('0'== record.liucbs){
			alert("默认流程不允许失效");
			return false;
		}else{
			if ( '1' == record.biaos ) {
				if(confirm("确认失效选中的1条记录！")){
					var params = [];
					params.push("usercenter="+record.usercenter);	//用户中心
					params.push("quybh="+record.quybh);		//区域编号
					params.push("liucbh="+record.liucbh);	//流程编号
					params.push("daztbh="+record.daztbh);	//大站台编号
					$.sdcui.ajaxUtil.ajax({
						url : "${ctx}/kac/removeKac.ajax",
						data:params.join('&'),
						success : function() {
							$("#grid_kac_liucdy").grid("reload");
						}
					});
					}
			}else{
				alert("数据已失效");
			}
		}
		
	}
	
	
</script>
