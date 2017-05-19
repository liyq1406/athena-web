<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<link type="text/css" rel="stylesheet" 
			href="<c:url value="/styles/authority/role.css"/>"/>
	</head>
	<t:page i18n="i18n.xqjs.laxjh.kaixlingjbaojin">
		<t:grid id="grid_lingjbaojin" 
			idKeys="usercenter,lingjh"
			dataFormId="form_lingjbaojin"
			caption="${i18n.title_index }" 
			src="queryKaixLingjbj.ajax"
			add="NOT"
			edit="NOT"
			remove="NOT" editable="true" saveRowsSrcs="editKaixLinsxuq.ajax"  showNum="true" exportXls="true"  showEditorAdd="false" showEditorRemove="false">
			<t:fieldLayout prefix="al">
				<t:fieldText property="lingjh" caption="${i18n.lingjh }" maxLength="10"></t:fieldText>
				<t:fieldSelect property="jihy" caption="${i18n.jihy }" convert="getJihz"></t:fieldSelect>
				<t:fieldHidden property="xuqbc" defaultValue="${xuqbc}"></t:fieldHidden>
				<t:fieldHidden property="kaixjx" defaultValue="${kaixjx}"></t:fieldHidden>
				<t:fieldHidden property="anqkc" defaultValue="${anqkc}"></t:fieldHidden>
				<t:fieldHidden property="usercenter" defaultValue="${usercenter}"></t:fieldHidden>
				<t:fieldHidden property="suanfcl" defaultValue="${suanfcl}"></t:fieldHidden>
				<t:fieldHidden property="wuldgk" defaultValue="${wuldgk}"></t:fieldHidden>
				<t:button caption="${i18n.addFormlinsxuq }" name="addFormlinsxuq"  icon="addRecord"></t:button>
				<t:button caption="${i18n.beginjs }" name="beginjs"></t:button>
				<t:button name="removeSelected" active="1" caption="${i18n.removeRecord }" icon="removeRecord"></t:button>
			</t:fieldLayout>
			<t:gridCol property="maoxqbc" width="100" caption="${i18n.maoxqbc } "/>
			<t:gridCol property="lingjh" width="100" caption="${i18n.lingjh }" />
			<t:gridCol property="usercenter" caption="${i18n.usercenter }" />
			<t:gridCol property="cangkkc" caption="${i18n.cangkkc }" />
			<t:gridCol property="zhongxqkc" caption="${i18n.zhongxqkc }"/>
			<t:gridCol property="cmj" caption="cmj" />
			<t:gridCol property="anqkc" caption="${i18n.anqkc }" />
			<t:gridCol property="kaixjx" caption="${i18n.kaixjx }" />
			<t:gridCol property="duandsj" caption="${i18n.duansj }"/>
			<t:gridCol property="xuqsl" caption="${i18n.xuqsl }"  editor="fieldText" editorOptions="{'maxLength':'8','expression':'^(([1-9]+[0-9]*.{1}[0-9]+)|([0].{1}[1-9]+[0-9]*)|([1-9][0-9]*)|([0][.][0-9]+[1-9]*))$','expressionMessage':'请输入正整数或小数!','notNull':true}"/>
			<t:gridCol property="jihydm" caption="${i18n.jihydm }" convert="getJihz"/>
		</t:grid>
		<t:form dialog="true" id="form_kaix_lins_xuq" caption="${i18n.kaixljdq }" action="saveKaixLinsXuq.ajax" reset="NOT">
		<t:fieldLayout prefix="linsxuq">
			    <t:fieldText property="lingjh" caption="${i18n.lingjh }" notNull="true"/>
			    <t:fieldHidden property="maoxqbc"/>
			    <t:fieldHidden property="flag" defaultValue="1"/>
			    <t:fieldHidden property="daohl" />
			    <t:fieldSelect defaultValue="" property="usercenter" caption="${i18n.usercenter }" notNull="true" convert="queryUserCenterMap"  />
				<t:fieldText property="jihydm" caption="${i18n.jihydm }"  notNull="true" readonly="true"/>
				<t:fieldText property="zhongxqkc" maxLength="8"  caption="${i18n.zhongxqkc }"   notNull="true" expression="^(([0-9]+[0-9]*.{1}[0-9]+)|([0].{1}[0-9]+[0-9]*)|([0-9][0-9]*)|([0][.][0-9]+[1-9]*))$" expressionMessage="请输入正整数或小数!"/>
				<t:fieldText property="cangkkc" maxLength="8"  caption="${i18n.cangkkc }"  notNull="true"  expression="^(([0-9]+[0-9]*.{1}[0-9]+)|([0].{1}[0-9]+[0-9]*)|([0-9][0-9]*)|([0][.][0-9]+[1-9]*))$" expressionMessage="请输入正整数或小数!"/>
				<t:fieldText property="cmj" maxLength="8"  caption="cmj"   notNull="true" expression="^(([0-9]+[0-9]*.{1}[0-9]+)|([0].{1}[0-9]+[0-9]*)|([0-9][0-9]*)|([0][.][0-9]+[1-9]*))$" expressionMessage="请输入正整数或小数!"/>
				<t:fieldText property="xuqsl" maxLength="8"  caption="${i18n.xuqsl }"  notNull="true"  expression="^(([0-9]+[0-9]*.{1}[0-9]+)|([0].{1}[0-9]+[0-9]*)|([0-9][0-9]*)|([0][.][0-9]+[1-9]*))$" expressionMessage="请输入正整数或小数!"/>
		</t:fieldLayout>
	</t:form>
	</t:page>
	<script type="text/javascript">
			function initPage(){
				getGridHeight();
				$('#linsxuq_lingjh').bind('focusout',function(){
					var lingjh = $("#linsxuq_lingjh").fieldValue();
					if(lingjh!=''){
				  	$.sdcui.ajaxUtil.ajax({
					url:'validateLingjh.ajax?lingjh='+lingjh,
					success:function(result){
						if(result.result=="1"){
							alert("${i18n.lingjhbczerror}");
							$("#linsxuq_flag").fieldValue("0");
						}else{
							$("#linsxuq_flag").fieldValue("1");
						}
					}
					});
					}else{
						alert("${i18n.lingjhinwkerror}");
					}
				});
			}
			
			function func_button_addFormlinsxuq(){
				$('#form_kaix_lins_xuq').form('open','');
			}
			//开始计算
			function func_button_beginjs(){
				//需求版权次
				var xuqbc = $('#al_xuqbc').fieldValue();
				//拉箱界限
			   	var kaixjx = $('#al_kaixjx').fieldValue();
			   	//安全库存
			   	var anqkc = $('#al_anqkc').fieldValue();
			   	//用户中心
			   	var usercenter = $('#al_usercenter').fieldValue();
			   	//计算算法策略
			   		//物理点港口
			   	var wuldgk = $('#al_wuldgk').fieldValue();
			   	var suanfcl = $('#al_suanfcl').fieldValue();
				$.sdcui.ajaxUtil.ajax({
					url:'jsKaixjh.ajax?xuqbc='+xuqbc+'&kaixjx='+kaixjx+'&anqkc='+anqkc+'&usercenter='+usercenter+'&suanfcl='+suanfcl+'&wuldgk='+wuldgk,
					success:function(result){
						if(result.result=="1"){
							alert("${i18n.jissuccess}");
						}else if(result.result=="0"){
							alert("${i18n.wdqljerror}");
						}else if(result.result="2"){
							alert("${i18n.fzxqwkyljerror}");
						}else if(result.result=="6"){
							alert("${i18n.yjszzjxerror}");
						}
					}
				});
			}
			function linsxuq_usercenter_change(){
				var lingjh = $('#linsxuq_lingjh').fieldValue();
				var usercenter = $('#linsxuq_usercenter').fieldValue();
				var ziyts = $('#al_kaixjx').fieldValue();
				if(lingjh!=''&&usercenter!=''){
					$.sdcui.ajaxUtil.ajax({
					url:'getLingjh.ajax?lingjh='+lingjh+"&usercenter="+usercenter+"&ziyts="+ziyts,
					success:function(result){
						//
						var jihydm = result.result.jihydm;
						var zhongxqkc = result.result.zhongxqkc;
						var cangkkc = result.result.cangkkc;
						var daohl = result.result.daohl;
						if(jihydm!=''){
							$('#linsxuq_jihydm').fieldValue(jihydm);
							$('#linsxuq_zhongxqkc').fieldValue(zhongxqkc);
							$('#linsxuq_cangkkc').fieldValue(cangkkc);
							$('#linsxuq_daohl').fieldValue(daohl);
							$.sdcui.ajaxUtil.ajax({
							url:'validateLinsxuqLingjh.ajax?lingjh='+lingjh+'&usercenter='+usercenter+'&jihydm='+jihydm,
							success:function(result){
								if(result.result=="0"){
									alert("${i18n.gljhyzljdqzerror}");
									$("#linsxuq_flag").fieldValue("0");
									return false;
								}else{
									$("#linsxuq_flag").fieldValue("1");
								}
							}
							});	
							
						}else{
							alert("${i18n.jihzwkerror}");						
						}
					}
					});
				}
			}
			function form_kaix_lins_xuq_beforeSubmit(){
				var maoxqbc = $('#field_xuqbc').fieldValue();
				$('#linsxuq_maoxqbc').fieldValue(maoxqbc);
				var flag = $('#linsxuq_flag').fieldValue();
				if(flag==0){
					alert("${i18n.lingjhbczerror}");
					return false;
				}
				var jihydm = $('linsxuq_jihydm').fieldValue();
				if(jihydm==''){
					alert("${i18n.jihyzwkerror}");
					return false;
				}
				return true;
			}
			 function form_kaix_lins_xuq_afterSubmit(result){
				if(result.result=="1"){
					$('#grid_lingjbaojin').grid('reload');
					$('#form_kaix_lins_xuq').form('clear');
					$('#form_kaix_lins_xuq').form('close');
		   		}
			 }
			/**
			*自定义删除
			*/
			function func_grid_removeSelected(){
				var lingjbj = $('#grid_lingjbaojin').grid('getSelectedRecords');
				var usercenter = lingjbj[0].usercenter;
				var jihydm = lingjbj[0].jihydm;
				var lingjh = lingjbj[0].lingjh;
				 $.sdcui.ajaxUtil.ajax({
					url:'delLingjbj.ajax?jihydm='+jihydm+'&usercenter='+usercenter+'&lingjh='+lingjh,
					success:function(result){
							alert("${i18n.delsuccess}");
							$('#grid_lingjbaojin').grid("reload");
					}
				});
			}
		</script>
</t:html>