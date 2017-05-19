<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="${i18n.chanxz }">
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<head>
	<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 125px; } </style>
</head>
<t:page i18n="i18n.ckx.xuqjs.i18n_gc">
	<t:grid id="grid_gongys" caption="${i18n.gcy }" showNum="true"  back="NOT"
		idKeys="usercenter,gcbh" src="/xuqjs/queryGongys.ajax" 
		add="NOT" load="false" remove="NOT" save="NOT" scrollHeight="290" pageSize="15">
		<t:fieldLayout id="gongys" prefix="gongys" columns="3">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter }"convert="queryUserCenterMap" defaultValue="${usercenter }" width="135"/>
			<t:fieldText property="gcbh" caption="${i18n.gcbh }" maxLength="10" minLength="10"  width="135"/>
			<t:fieldSelect property="leix" caption="${i18n.leix }"convert="queryGslx"  width="135"/>
			<t:fieldSelect property="gonghlx" caption="${i18n.gonghlx }" convert="queryDinghlx" width="135"/>
			<t:fieldSelect property="biaos" caption="${i18n.biaos }"convert="biaos" defaultValue="1"  width="135"/>
		</t:fieldLayout>
		
		<t:button caption="${i18n.export}" name="download"></t:button>
		<t:button caption="${i18n.neibgys}" name="neibgys" />
		<t:button caption="${i18n.waibgys}" name="waibgys" />
		<t:button caption="${i18n.chengys}" name="chengys" />
		<t:button caption="${i18n.validate}" name="youx" active="1" />
		<t:button caption="${i18n.invalidate}" name="shix" active="1" />
		
		<t:gridCol property="usercenter" caption="${i18n.usercenter }" convert="queryUserCenterMap" width="70"/>
		<t:gridCol property="gcbh" caption="${i18n.gcbh }" />
		<t:gridCol property="leix" caption="${i18n.leix }" convert="queryGslx"/>
		<t:gridCol property="gonghlx" caption="${i18n.gonghlx }" width="60" convert="queryDinghlx"/>
		<t:gridCol property="gongsmc" caption="${i18n.gongsmc }" width="210"/>
		<t:gridCol property="diz" caption="${i18n.diz }" width="220"/>
		<t:gridCol property="youb" caption="ISO" width="60"/>
		<t:gridCol property="lianxr" caption="${i18n.lianxr }" width="60"/>
		<t:gridCol property="dianh" caption="${i18n.dianh }" width="85"/>
		<t:gridCol property="chuanz" caption="DUNS" width="85"/>
		<t:gridCol property="beihzq" caption="${i18n.beihzq }" width="70"/>
		<t:gridCol property="fayzq" caption="${i18n.fayzq }" width="70"/>
		<t:gridCol property="kacbztj" caption="${i18n.kacbztj }" width="90"/>
		<t:gridCol property="songhzdpc" caption="${i18n.songhzdpc }" width="115"/>
		<t:gridCol property="songhzxpc" caption="${i18n.songhzxpc }" width="115"/>
		<t:gridCol property="neibyhzx" caption="${i18n.neibyhzx }" width="140" convert="queryUserCenterMap"/>
		<t:gridCol property="neibgys_cangkbh" caption="${i18n.neibgys_cangkbh }" width="160"/>
		<t:gridCol property="edzzl" caption="${i18n.edzzl }" width="75"/>
		<t:gridCol property="bodfdxs" caption="${i18n.bodfdxs }" width="90"/>
		<t:gridCol property="fayd" caption="${i18n.fayd }"/>
		<t:gridCol property="biaos" caption="${i18n.biaos }" convert="biaos"/>
		<t:gridCol property="" caption="" width="15"/>
	</t:grid>
	
	<t:form id="form_neibgys" caption="${i18n.neibgys}" idKeys="gcbh" action="/xuqjs/saveGongys.ajax" dialog="true" reset="NOT" width="900">
		<t:fieldLayout columns="3" prefix="neibgys">
			<t:fieldSelect property="usercenter" width="150"  caption="${i18n.usercenter }" defaultValue="${usercenter }" convert="queryUserCenterMap" notNull="true"/>
			<t:fieldText property="gcbh" width="150" caption="${i18n.gcbh }" notNull="true" expression="^[0-9A-Z]{6}[\\s0-9A-Z]{2}[0-9A-Z]{2}$" expressionMessage="请填写10位编号" />
			<t:fieldSelect property="leix" width="150" caption="${i18n.leix }" convert="queryGslx" defaultValue="1" readonly="true"/>
			<t:fieldText property="gongsmc" width="150" caption="${i18n.gongsmc }"/>
			<t:fieldText property="diz" width="150" caption="${i18n.diz }" />
			<t:fieldText property="youb" width="150" caption="ISO" dataType="text" maxLength="20"/>
			<t:fieldText property="lianxr" width="150" caption="${i18n.lianxr }" />
			<t:fieldText property="dianh" width="150" caption="${i18n.dianh }" />
			<t:fieldText property="chuanz" width="150" caption="DUNS"  maxLength="20" />
			<t:fieldSelect property="gonghlx" width="150" caption="${i18n.gonghlx }" convert="queryDinghlx" notNull="true"/>
			<t:fieldSelect property="neibyhzx" width="150" caption="${i18n.neibyhzx }" convert="queryUserCenterMap" notNull="true"/>
			<t:fieldText property="neibgys_cangkbh" width="150" caption="${i18n.neibgys_cangkbh }" dataType="text" maxLength="3" minLength="3" notNull="true"/>
			<t:fieldText property="fayd" width="150" caption="${i18n.fayd }" dataType="text" maxLength="6" notNull="true"/>
		</t:fieldLayout>
	</t:form>
	
	<t:form id="form_waibgys" caption="${i18n.waibgys}" idKeys="gcbh" action="/xuqjs/saveGongys.ajax" dialog="true" reset="NOT" width="900">
		<t:fieldLayout columns="3" prefix="waibgys">
			<t:fieldSelect property="usercenter" width="150" caption="${i18n.usercenter }" defaultValue="${usercenter }" convert="queryUserCenterMap" notNull="true"/>
			<t:fieldText property="gcbh" width="150" caption="${i18n.gcbh }" notNull="true" expression="^[0-9A-Z]{6}[\\s0-9A-Z]{2}[0-9A-Z]{2}$" expressionMessage="请填写10位编号"/>
			<t:fieldSelect property="leix" width="150" caption="${i18n.leix }" convert="queryGslx" defaultValue="2" readonly="true"/>
			<t:fieldText property="gongsmc" width="150" caption="${i18n.gongsmc }"/>
			<t:fieldText property="diz" width="150" caption="${i18n.diz }" />
			<t:fieldText property="youb" width="150" caption="ISO" dataType="text" maxLength="20"/>
			<t:fieldText property="lianxr" width="150" caption="${i18n.lianxr }" />
			<t:fieldText property="dianh" width="150" caption="${i18n.dianh }" />
			<t:fieldText property="chuanz" width="150" caption="DUNS"  maxLength="20" />
			<t:fieldSelect property="gonghlx" width="150" caption="${i18n.gonghlx }" convert="queryDinghlx" notNull="true"/>
			<t:fieldText property="beihzq" width="150" caption="${i18n.beihzq }" expression="^[1-9][0-9]{0,5}(?:\.[0-9]{1,3})?$|0\.[0-9]{1,3}$|^0$"
				expressionMessage="${i18n.beihzq_ex_mes }" notNull="true"/>
			<t:fieldText property="fayzq" width="150" caption="${i18n.fayzq }" expression="^[1-9][0-9]{0,5}(?:\.[0-9]{1,3})?$|0\.[0-9]{1,3}$|^0$"
				expressionMessage="${i18n.fayzq_ex_mes}" notNull="true"/>
			<t:fieldText property="kacbztj" width="150" caption="${i18n.kacbztj }" expression="^[1-9][0-9]{0,5}(?:\.[0-9]{1,3})?$|0\.[0-9]{1,3}$|^0$"
				expressionMessage="${i18n.kacbztj_ex_mes}" notNull="true"/>
			<t:fieldText property="songhzdpc" width="150" caption="${i18n.songhzdpc }" expression="^[1-9][0-9]?$|^0$"
				expressionMessage="${i18n.songhzdpc_ex_mes}" notNull="true"/>
			<t:fieldText property="songhzxpc" width="150" caption="${i18n.songhzxpc }" expression="^[1-9][0-9]?$|^0$"
				expressionMessage="${i18n.songhzxpc_ex_mes}" notNull="true"/>
			<t:fieldText property="edzzl" width="150" caption="${i18n.edzzl }" expression="^[1-9][0-9]{0,2}(?:\.[0-9]{1,2})?$|0\.[0-9]{1,2}$|^0$"
				expressionMessage="${i18n.edzzl_ex_mes}" notNull="true"/>
			<t:fieldText property="bodfdxs" width="150" caption="${i18n.bodfdxs }" expression="^[1-9][0-9]{0,2}(?:\.[0-9]{1,2})?$|0\.[0-9]{1,2}$|^0$"
				expressionMessage="${i18n.bodfdxs_ex_mes}" notNull="true"/>
			<t:fieldText property="fayd" width="150" caption="${i18n.fayd }" dataType="text" maxLength="6" notNull="true"/>
		</t:fieldLayout>
	</t:form>
	
	<t:form id="form_chengys" caption="${i18n.chengys}" idKeys="gcbh" action="/xuqjs/saveGongys.ajax" dialog="true" reset="NOT" width="900">
		<t:fieldLayout columns="3" prefix="chengys">
			<t:fieldSelect property="usercenter" width="150" caption="${i18n.usercenter }" defaultValue="${usercenter }" convert="queryUserCenterMap" notNull="true"/>
			<t:fieldText property="gcbh" width="150" caption="${i18n.gcbh }" expression="^[0-9A-Z]{6}[\\s0-9A-Z]{2}[0-9A-Z]{2}$" expressionMessage="请填写10位编号" notNull="true"/>
			<t:fieldSelect property="leix" width="150" caption="${i18n.leix }" convert="queryGslx" defaultValue="3" readonly="true"/>
			<t:fieldText property="gongsmc" width="150" caption="${i18n.gongsmc }"/>
			<t:fieldText property="diz" width="150" caption="${i18n.diz }" />
			<t:fieldText property="youb" width="150" caption="ISO" dataType="text" maxLength="20"/>
			<t:fieldText property="lianxr" width="150" caption="${i18n.lianxr }" />
			<t:fieldText property="dianh" width="150" caption="${i18n.dianh }" />
			<t:fieldText property="chuanz" width="150" caption="DUNS"  maxLength="20"/>
			<t:fieldText property="kacbztj" width="150" caption="${i18n.kacbztj }" expression="^[1-9][0-9]{0,5}(?:\.[0-9]{1,3})?$|0\.[0-9]{1,3}$|^0$"
				expressionMessage="${i18n.kacbztj_ex_mes}" notNull="true"/>
			<t:fieldText property="songhzdpc" width="150" caption="${i18n.songhzdpc }" expression="^[1-9][0-9]?$|^0$"
				expressionMessage="${i18n.songhzdpc_ex_mes}" notNull="true"/>
			<t:fieldText property="songhzxpc" width="150" caption="${i18n.songhzxpc }" expression="^[1-9][0-9]?$|^0$"
				expressionMessage="${i18n.songhzxpc_ex_mes}" notNull="true"/>
			<t:fieldText property="edzzl" width="150" caption="${i18n.edzzl }" expression="^[1-9][0-9]{0,2}(?:\.[0-9]{1,2})?$|0\.[0-9]{1,2}$|^0$"
				expressionMessage="${i18n.edzzl_ex_mes}" notNull="true"/>
			<t:fieldText property="bodfdxs" width="150" caption="${i18n.bodfdxs }" expression="^[1-9][0-9]{0,2}(?:\.[0-9]{1,2})?$|0\.[0-9]{1,2}$|^0$"
				expressionMessage="${i18n.bodfdxs_ex_mes}" notNull="true"/>
		</t:fieldLayout>
	</t:form>
	
</t:page>
</t:html>
<script type="text/javascript">
	var exp = '^[0-9A-Z]{6}[\\s0-9A-Z]{2}[0-9A-Z]{2}$';
	//标识
	$.sdcui.serverConfig.convertArray['biaos'] = {
		'1' : '${i18n.youx}',
		'0' : '${i18n.wux}'
	};
	
	
	//空格查询
	function grid_ckx_gongys_beforeSubmit() {
		$("#gongys_gcbh").fieldValue(trim($("#gongys_gcbh").fieldValue()));
	}
	
	
	//失效按钮
	function func_button_shix() {
		if(confirm("${i18n.quersx}")){
			var record = $("#grid_gongys").grid("getSelectedRecords");
			
			var params = [];
			params.push("usercenter="+record[0].usercenter);	//用户中心
			params.push("gcbh="+record[0].gcbh);		//生产线编号
			params.push("biaos=0");		//标识
			
			if('0' == record[0].biaos){
				alert("${i18n.shujysx}");
			}else{
				 $.sdcui.ajaxUtil.ajax({
			 	 	   data:params.join('&'),
			 	 	   url:"../xuqjs/removeGongys.ajax",
			 	       success:function (result){
			 	    	  $("#grid_gongys").grid("reload");
// 			 	    	  alert("{i18n.shixcg}");
			 	       }
			     });
			}
		}
	}
	
	//有效按钮
	function func_button_youx() {
		var record = $("#grid_gongys").grid("getSelectedRecords");
		var params = [];
		params.push("usercenter="+record[0].usercenter);	//用户中心
		params.push("gcbh="+record[0].gcbh);		//生产线编号
		params.push("biaos=1");		//标识
		
		if('1' == record[0].biaos){
			alert("${i18n.shujyyx}");
		}else{
			$.sdcui.ajaxUtil.ajax({
		 	 	   data:params.join('&'),
		 	 	   url:"../xuqjs/removeGongys.ajax",
		 	       success:function (result){
		 	    	  $("#grid_gongys").grid("reload");
// 		 	    	 alert("i18n.youxcg");
		 	       }
		     });
		}
	}
	
	//增加内部供应商
	function func_button_neibgys(){
		$('#form_neibgys').form("clear");
		$('#form_neibgys').addClass('operant-add');
		$("#neibgys_usercenter").removeClass('youi-field fieldSelect readonly');
		$("#neibgys_usercenter").addClass('youi-field fieldSelect');
		$('#neibgys_gcbh input:first').removeAttr("disabled");
		$('#neibgys_usercenter').fieldValue('${usercenter}');
		$('#neibgys_leix').fieldValue('1');
		$("#form_neibgys").form("open");
		
	}
	
	//增加外部供应商
	function func_button_waibgys(){
		$('#form_waibgys').form("clear");
		$('#form_waibgys').addClass('operant-add');
		$("#waibgys_usercenter").removeClass('youi-field fieldSelect readonly');
		$("#waibgys_usercenter").addClass('youi-field fieldSelect');
		$('#waibgys_gcbh input:first').removeAttr("disabled");
		$('#waibgys_usercenter').fieldValue('${usercenter}');
		$('#waibgys_leix').fieldValue('2');
		$("#form_waibgys").form("open");
	}
	
	//增加承运商
	function func_button_chengys(){
		$('#form_chengys').form("clear");
		$('#form_chengys').addClass('operant-add');
		$("#chengys_usercenter").removeClass('youi-field fieldSelect readonly');
		$("#chengys_usercenter").addClass('youi-field fieldSelect');
		$('#chengys_gcbh input:first').removeAttr("disabled");
		$('#chengys_usercenter').fieldValue('${usercenter}');
		$('#chengys_leix').fieldValue('3');
		$("#form_chengys").form("open");
	}
	
	//修改按钮
	function func_button_edit(){
		
		var record = $("#grid_gongys").grid("getSelectedRecords")[0];//选中的行的数据
		
		if('1' == record.leix){//内部供应商
			$('#form_neibgys').form("clear");
			$('#form_neibgys').removeClass('operant-add');
// 			$("#neibgys_usercenter").removeClass('youi-field fieldSelect readonly');
			$("#neibgys_usercenter").addClass('youi-field fieldSelect readonly');
			$('#form_neibgys').form('fillRecord', $.extend({}, record));
			$("#form_neibgys").form("open","${i18n.update}");
		}else if('2' == record.leix){//外部供应商
			$('#form_waibgys').removeClass('operant-add');
			$('#form_waibgys').form("clear");
			$("#waibgys_usercenter").addClass('youi-field fieldSelect readonly');
			$('#form_waibgys').form('fillRecord', $.extend({}, record));
			$("#form_waibgys").form("open","${i18n.update}");
		}else if('3' == record.leix){//承运商
			$('#form_chengys').removeClass('operant-add');
			$('#form_chengys').form("clear");
			$("#chengys_usercenter").addClass('youi-field fieldSelect readonly');
			$('#form_chengys').form('fillRecord', $.extend({}, record));
			$("#form_chengys").form("open","${i18n.update}");
		}
		
	}
	
	function form_neibgys_afterSubmit(result) {
		if(typeof result.success=="undefined"||result.success!==false){
			$("#form_neibgys").form("close");
			$("#grid_gongys").grid("reload");
		}
		return false;	
	}
	function form_waibgys_afterSubmit(result) {
		if(typeof result.success=="undefined"||result.success!==false){
			$("#form_waibgys").form("close");
			$("#grid_gongys").grid("reload");
		}
		return false;		
	}
	function form_chengys_afterSubmit(result) {
		if(typeof result.success=="undefined"||result.success!==false){
			$("#form_chengys").form("close");
			$("#grid_gongys").grid("reload");
		}
		return false;		
	}
	
	//增加form提交前验证
	function form_gongys_beforeSubmit() {
		var gongsmc = $("#gcy_gongsmc").fieldValue();
		if(undefined != gongsmc && null != gongsmc){
			if (!checkCH(70, gongsmc)) {
				alert("${i18n.gongsmccd}");
				return false;
			}
		}
		
		var lianxr = $("#gcy_lianxr").fieldValue();
		if(undefined != lianxr && null != lianxr){
			if (!checkCH(40, lianxr)) {
				alert("${i18n.lianxrcd}");
				return false;
			}
		}
		
		var diz = $("#gcy_diz").fieldValue();
		if(undefined != diz && null != diz){
			if (!checkCH(106, diz)) {
				alert("${i18n.dizcd}");
				return false;
			}
		}
		return true;
	}
	
	//内部供应商修改form提交前验证
	function form_neibgys_beforeSubmit() {
		var gongsmc = $("#neibgys_gongsmc").fieldValue();
		if(undefined != gongsmc && null != gongsmc){
			if (!checkCH(70, gongsmc)) {
				alert("${i18n.gongsmccd}");
				return false;
			}
		}
		
		var lianxr = $("#neibgys_lianxr").fieldValue();
		if(undefined != lianxr && null != lianxr){
			if (!checkCH(40, lianxr)) {
				alert("${i18n.lianxrcd}");
				return false;
			}
		}
		
		var diz = $("#neibgys_diz").fieldValue();
		if(undefined != diz && null != diz){
			if (!checkCH(106, diz)) {
				alert("${i18n.dizcd}");
				return false;
			}
		}
		return true;
	}
	
	//外部供应商修改form提交前验证
	function form_waibgys_beforeSubmit() {
		var gongsmc = $("#waibgys_gongsmc").fieldValue();
		if(undefined != gongsmc && null != gongsmc){
			if (!checkCH(70, gongsmc)) {
				alert("${i18n.gongsmccd}");
				return false;
			}
		}
		
		var lianxr = $("#waibgys_lianxr").fieldValue();
		if(undefined != lianxr && null != lianxr){
			if (!checkCH(40, lianxr)) {
				alert("${i18n.lianxrcd}");
				return false;
			}
		}
		
		var diz = $("#waibgys_diz").fieldValue();
		if(undefined != diz && null != diz){
			if (!checkCH(106, diz)) {
				alert("${i18n.dizcd}");
				return false;
			}
		}
		return true;
	}
	
	//承运商修改form提交前验证
	function form_chengys_beforeSubmit() {
		var gongsmc = $("#chengys_gongsmc").fieldValue();
		if(undefined != gongsmc && null != gongsmc){
			if (!checkCH(70, gongsmc)) {
				alert("${i18n.gongsmccd}");
				return false;
			}
		}
		
		var lianxr = $("#chengys_lianxr").fieldValue();
		if(undefined != lianxr && null != lianxr){
			if (!checkCH(40, lianxr)) {
				alert("${i18n.lianxrcd}");
				return false;
			}
		}
		
		var diz = $("#chengys_diz").fieldValue();
		if(undefined != diz && null != diz){
			if (!checkCH(106, diz)) {
				alert("${i18n.dizcd}");
				return false;
			}
		}
		return true;
	}
	
	
	//页面初始化
	function initPage(){
		//增加
		$("#gcy_lianxr input").blur(function() {
			var lianxr = $("#gcy_lianxr").fieldValue();
			if(undefined != lianxr && null != lianxr){
				if (!checkCH(40, lianxr)) {
					alert("${i18n.lianxrcd}");
					return false;
				}
			}
			return true;
		});
		$("#gcy_gongsmc input").blur(function() {
			var gongsmc = $("#gcy_gongsmc").fieldValue();
			if(undefined != gongsmc && null != gongsmc){
				if (!checkCH(70, gongsmc)) {
					alert("${i18n.gongsmccd}");
					return false;
				}
			}
			return true;
		});
		$("#gcy_diz input").blur(function() {
			var diz = $("#gcy_diz").fieldValue();
			if(undefined != diz && null != diz){
				if (!checkCH(106, diz)) {
					alert("${i18n.dizcd}");
					return false;
				}
			}
			return true;
		});
		
		//修改内部供应商
		$("#neibgys_lianxr input").blur(function() {
			var lianxr = $("#neibgys_lianxr").fieldValue();
			if(undefined != lianxr && null != lianxr){
				if (!checkCH(40, lianxr)) {
					alert("${i18n.lianxrcd}");
					return false;
				}
			}
			return true;
		});
		$("#neibgys_gongsmc input").blur(function() {
			var gongsmc = $("#neibgys_gongsmc").fieldValue();
			if(undefined != gongsmc && null != gongsmc){
				if (!checkCH(70, gongsmc)) {
					alert("${i18n.gongsmccd}");
					return false;
				}
			}
			return true;
		});
		$("#neibgys_diz input").blur(function() {
			var diz = $("#neibgys_diz").fieldValue();
			if(undefined != diz && null != diz){
				if (!checkCH(106, diz)) {
					alert("${i18n.dizcd}");
					return false;
				}
			}
			return true;
		});
		
		//修改外部供应商
		$("#waibgys_lianxr input").blur(function() {
			var lianxr = $("#waibgys_lianxr").fieldValue();
			if(undefined != lianxr && null != lianxr){
				if (!checkCH(40, lianxr)) {
					alert("${i18n.lianxrcd}");
					return false;
				}
			}
			return true;
		});
		$("#waibgys_gongsmc input").blur(function() {
			var gongsmc = $("#waibgys_gongsmc").fieldValue();
			if(undefined != gongsmc && null != gongsmc){
				if (!checkCH(70, gongsmc)) {
					alert("${i18n.gongsmccd}");
					return false;
				}
			}
			return true;
		});
		$("#waibgys_diz input").blur(function() {
			var diz = $("#waibgys_diz").fieldValue();
			if(undefined != diz && null != diz){
				if (!checkCH(106, diz)) {
					alert("${i18n.dizcd}");
					return false;
				}
			}
			return true;
		});
		
		//修改承运商
		$("#chengys_lianxr input").blur(function() {
			var lianxr = $("#chengys_lianxr").fieldValue();
			if(undefined != lianxr && null != lianxr){
				if (!checkCH(40, lianxr)) {
					alert("${i18n.lianxrcd}");
					return false;
				}
			}
			return true;
		});
		$("#chengys_gongsmc input").blur(function() {
			var gongsmc = $("#chengys_gongsmc").fieldValue();
			if(undefined != gongsmc && null != gongsmc){
				if (!checkCH(70, gongsmc)) {
					alert("${i18n.gongsmccd}");
					return false;
				}
			}
			return true;
		});
		$("#chengys_diz input").blur(function() {
			var diz = $("#chengys_diz").fieldValue();
			if(undefined != diz && null != diz){
				if (!checkCH(106, diz)) {
					alert("${i18n.dizcd}");
					return false;
				}
			}
			return true;
		});
		
		//修改运输商
		$("#yunss_lianxr input").blur(function() {
			var lianxr = $("#yunss_lianxr").fieldValue();
			if(undefined != lianxr && null != lianxr){
				if (!checkCH(40, lianxr)) {
					alert("${i18n.lianxrcd}");
					return false;
				}
			}
			return true;
		});
		$("#yunss_gongsmc input").blur(function() {
			var gongsmc = $("#yunss_gongsmc").fieldValue();
			if(undefined != gongsmc && null != gongsmc){
				if (!checkCH(70, gongsmc)) {
					alert("${i18n.gongsmccd}");
					return false;
				}
			}
			return true;
		});
		$("#yunss_diz input").blur(function() {
			var diz = $("#yunss_diz").fieldValue();
			if(undefined != diz && null != diz){
				if (!checkCH(106, diz)) {
					alert("${i18n.dizcd}");
					return false;
				}
			}
			return true;
		});
	}
	
	//导出数据
	function func_button_download(){
		
		var usercenter = trim($('#gongys_usercenter').fieldValue());
		var gcbh = trim($("#gongys_gcbh").fieldValue());
		var leix = $('#gongys_leix').fieldValue();
		var gonghlx = $('#gongys_gonghlx').fieldValue();
		var biaos = $('#gongys_biaos').fieldValue();
		
		var record = {'usercenter':usercenter,'gcbh':gcbh,'leix':leix,'gonghlx':gonghlx,'biaos':biaos};
		
		$.sdcui.pageUtils.goPage({
			url : '../xuqjs/downloadGongys.do',
			record : record,
			mode : 'form',
			beforeSubmit : function(){
				return true;
			}
	   });
	}
</script>
