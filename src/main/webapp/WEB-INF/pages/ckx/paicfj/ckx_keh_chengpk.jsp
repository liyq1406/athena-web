<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="${i18n.chanxz }">
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css">
#form_ckx_keh_chengpk .youi-fieldLayout table td.contral.label-col { width: 110px; }
#grid_ckx_keh_chengpk .youi-fieldLayout table td.contral.label-col {width: 70px; }
</style>
</head>
<t:page i18n="i18n.ckx.paicfj.i18n_kehchengpk">

		<t:grid id="grid_ckx_keh_chengpk" caption="${i18n.kehchengpk }"
			idKeys="usercenter,cangkbh,kehbh,chengysbh"  dataFormId="form_ckx_keh_chengpk"
			src="/paicfj/queryCkx_keh_chengpk.ajax" removeSrc="/paicfj/removeCkx_keh_chengpk.ajax"
			showNum="true" load="false">
			<t:fieldLayout id="chengpk" prefix="keh_chengpk" columns="3">
				<t:fieldSelect property="usercenter" caption="${i18n.usercenter }"
					convert="queryUserCenterMap" defaultValue="${loginUsercenter }" notNull="true"/>
				<t:fieldText property="cangkbh" caption="${i18n.cangkbh }"
					maxLength="3" />
				<t:fieldText property="kehbh" caption="${i18n.kehbh }"
					 maxLength="10"/>
				<t:fieldText property="chengysbh" caption="${i18n.chengysbh }"
					maxLength="10" />
			</t:fieldLayout>
			<t:gridCol property="usercenter" caption="${i18n.usercenter }" convert="queryUserCenterMap" ></t:gridCol>
			<t:gridCol property="cangkbh" caption="${i18n.cangkbh }"></t:gridCol>
			<t:gridCol property="kehbh" caption="${i18n.kehbh }"></t:gridCol>
			<t:gridCol property="chengysbh" caption="${i18n.chengysbh }"></t:gridCol>
			<t:gridCol property="yunslxbh" caption="${i18n.yunslxbh }" width="90"></t:gridCol>		
			<t:gridCol property="yaoctqq" caption="${i18n.yaoctqq }" ></t:gridCol>						
			<t:gridCol property="kehtqq" caption="${i18n.kehtqq }(${i18n.minutes})" width="120"></t:gridCol>
			<t:gridCol property="shifpz" caption="${i18n.shifxypz }" convert="shifpz" width="120"></t:gridCol>
			<t:gridCol property="beihlx" caption="${i18n.beihlx }" convert="queryBHLX"></t:gridCol>
			<t:gridCol property="dingdtqq" caption="${i18n.dingdtqq }"></t:gridCol>
		</t:grid>
		
		<t:form dialog="true" id="form_ckx_keh_chengpk" width="650" caption="${i18n.kehchengpk }"  action="/paicfj/saveCkx_keh_chengpk.ajax" idKeys="usercenter,cangkbh,kehbh,chengysbh" submit="NOT" reset="NOT" >
			<t:fieldLayout prefix="record">
				<t:fieldSelect property="usercenter" caption="${i18n.usercenter }"  convert="queryUserCenterMap" defaultValue="${loginUsercenter }" notNull="true"/>
				<t:fieldText property="cangkbh" caption="${i18n.cangkbh }" maxLength="6" notNull="true" dataType="text"/>
				<t:fieldText property="kehbh" caption="${i18n.kehbh }" maxLength="10" notNull="true" dataType="text"/>
				<t:fieldText property="chengysbh" caption="${i18n.chengysbh }" maxLength="10" notNull="true" dataType="text"/>
				<t:fieldText property="yunslxbh" caption="${i18n.yunslxbh }" maxLength="10" dataType="text"/>
				<t:fieldText property="yaoctqq" caption="${i18n.yaoctqq }(${i18n.fenz })" expression="^([1-9][0-9]{0,4})$|0$"
				expressionMessage="${i18n.zhinsr }[0-99999)${i18n.zhijdsz }"/>
				<t:fieldText property="kehtqq" caption="${i18n.kehtqq }(${i18n.fenz })" expression="^([1-9][0-9]{0,4})$|0$"
				expressionMessage="${i18n.zhinsr }[0-99999)${i18n.zhijdsz }"/>
				<t:fieldSelect property="shifpz" caption="${i18n.shifxypz }" convert="shifpz" notNull="true"/>
				<t:fieldSelect property="beihlx" caption="${i18n.beihlx }" convert="queryBHLX" notNull="true"/>
				<t:fieldText property="dingdtqq" caption="${i18n.dingdtqq }(${i18n.tian })" maxLength="1" expression="^[0-9]$"
				expressionMessage="${i18n.zhinsr }[0-9)${i18n.zhijdsz }"/>
				<t:fieldHidden property="shifupdate" caption="是否批量更新"></t:fieldHidden>
			</t:fieldLayout>
			<t:button caption="${i18n.tij }" name="submit_zdy"></t:button>
		</t:form>

</t:page>
</t:html>
<script type="text/javascript">
	$.sdcui.serverConfig.convertArray['shifpz'] = {
		'1' : '${i18n.y}',
		'0' : '${i18n.n}'
	};
	function func_button_save() {
		$("#grid_ckx_keh_chengpk").grid("saveRows");
	}
	function func_button_edit() {
		
		$('#form_ckx_keh_chengpk').form("clear");//清除弹出窗口的数据
		
		$('#form_ckx_keh_chengpk').removeClass('operant-add');//增加的operant为1，修改的operant为2
		
		var record = $("#grid_ckx_keh_chengpk").grid("getSelectedRecords")[0];//选中的行的数据
		
		$('#form_ckx_keh_chengpk').form('fillRecord', $.extend({}, record));
		
		$("#form_ckx_keh_chengpk").form("open","${i18n.update}");
		
	}
	function form_ckx_keh_chengpk_beforeSubmit(){
		return true;
	}
	function func_button_submit_zdy(){	
		check();
	}
	function check(){
		
		var record_usercenter = $('#record_usercenter').fieldValue();
		var record_cangkbh = $('#record_cangkbh').fieldValue();
		var record_kehbh = $('#record_kehbh').fieldValue();	
		var record_chengysbh = $('#record_chengysbh').fieldValue();	
		
		//更新的字段
		//运输路线编号
		var record_yunslxbh = $('#record_yunslxbh').fieldValue();	
		//客户提前期
		var record_kehtqq = $('#record_kehtqq').fieldValue();	
		//是否配载
		var record_shifpz = $('#record_shifpz').fieldValue();	
		//备货类型
		var record_beihlx = $('#record_beihlx').fieldValue();	
		//订单提前期
		var record_dingdtqq = $('#record_dingdtqq').fieldValue();	
		
		if(record_usercenter == null ||record_usercenter == ""){
			alert("${i18n.qingtxyhzx }");return false;
		}
		if(record_cangkbh == null ||record_cangkbh == ""){
			alert("${i18n.qingtxckbh }");return false;
		}
		if(record_kehbh == null ||record_kehbh == ""){
			alert("${i18n.qingtxkhbh }");return false;
		}
		$.sdcui.ajaxUtil.ajax({
			url:"${ctx}/paicfj/queryCkx_keh_chengpk.ajax?usercenter="+record_usercenter+"&cangkbh="+record_cangkbh+"&kehbh="+record_kehbh,
			success:function(result){			
				var count = result.result.total;				
				if(0 != count){
					var record = result.result.rows;
					var message = "";
					var param = $.grep(record,function(obj,i){
// 						alert(obj.yunslxbh +"," + obj.kehtqq +","+ obj.shifpz +"," +  obj.beihlx +","+obj.dingdtqq); 
						if(record_chengysbh == obj.chengysbh){
							return false;
						}
						if(record_yunslxbh == obj.yunslxbh 
								   && record_kehtqq == obj.kehtqq 
								   && record_shifpz == obj.shifpz
								   && record_beihlx == obj.beihlx
								   && record_dingdtqq == obj.dingdtqq	  ){
							return false;
						}else{
							message += "承运商:"+obj.chengysbh+
							",运输路线编号:"+obj.yunslxbh +
							",客户提前期:"+ obj.kehtqq +
							",是否需要配载:"+ obj.shifpz +
							",备货类型:"	+ obj.beihlx +
							",订单提前期:"+obj.dingdtqq+"\n";
						}
						return true;
					});
// 					if(!$('#form_ckx_keh_chengpk').hasClass('operant-add')){
// 						count = count-1;
// 					}
					if(param.length > 0 ){
						message += "共有"+param.length+"条数据受影响，其中“运输路线编号”,“客户提前期”,“是否需要配载”,“备货类型”,“订单提前期”将被覆盖,是否继续?";
						
						if(confirm(message)){
							//是否更新 ，1：是|0：否
							$('#record_shifupdate').fieldValue("1");	
							$('#form_ckx_keh_chengpk').form('submit');
						}
					}else{
						$('#record_shifupdate').fieldValue("0");
						$('#form_ckx_keh_chengpk').form('submit');
					}
					return false;
				}else{
					$('#record_shifupdate').fieldValue("0");
					$('#form_ckx_keh_chengpk').form('submit');
				}	
			} 
		});	
		
		return true;
	}
	
	
	
</script>
