<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<link type="text/css" rel="stylesheet" 
			href="<c:url value="/styles/authority/role.css"/>"/>
	</head>
	<t:page  i18n="i18n.xqjs.laxjh.lingjbaojin">
	
		<t:grid id="grid_lingjbaojin" 
			idKeys="usercenter,lingjh"
			dataFormId="form_lingjbaojin"
			caption="${i18n.title_index }" 
			src="queryLingjbj.ajax"
			add="NOT"
			edit="NOT"
			editable="true" saveRowsSrcs="editLinsxuq.ajax"  showNum="true" exportXls="true" showEditorAdd="false" showEditorRemove="false">
			<t:fieldLayout prefix="al">
				<t:fieldText property="lingjh" caption="${i18n.lingjh }" maxLength="10"></t:fieldText>
				<t:fieldSelect property="jihy" caption="${i18n.jihy }"  convert="getJihz"></t:fieldSelect>
				<t:fieldHidden property="xuqbc" defaultValue="${xuqbc}"></t:fieldHidden>
				<t:fieldHidden property="laxjx" defaultValue="${laxjx}"></t:fieldHidden>
				<t:fieldHidden property="anqkc" defaultValue="${anqkc}"></t:fieldHidden>
				<t:fieldHidden property="usercenter" defaultValue="${usercenter}"></t:fieldHidden>
				<t:fieldHidden property="suanfcl" defaultValue="${suanfcl}"></t:fieldHidden>
				<t:fieldHidden property="wuldgk" defaultValue="${wuldgk}"></t:fieldHidden>
				<t:fieldHidden property="laxbs" defaultValue="${laxbs }"></t:fieldHidden>
				<t:fieldHidden property="ziyts" defaultValue="${ziyts }"></t:fieldHidden>
				<t:fieldHidden property="kyljdm"  defaultValue="${kyljdm }"></t:fieldHidden>
				<t:button caption="${i18n.addLinsxuq }" name="addLinsxuq"  icon="addRecord"></t:button>
				<t:button caption="${i18n.beginjs }" name="beginjs"></t:button>
				<t:button name="removeSelected" active="1" caption="${i18n.removeRecord }" icon="removeRecord"></t:button>
			</t:fieldLayout>
			
			<t:gridCol property="maoxqbc" width="100" caption="${i18n.maoxqbc }" />
			<t:gridCol property="lingjh" width="100" caption="${i18n.lingjh }" />
			<t:gridCol property="usercenter" caption="${i18n.usercenter }" />
			<t:gridCol property="cangkkc" caption="${i18n.cangkkc }" />
			<t:gridCol property="zhongxqkc" caption="${i18n.zhongxqkc } "/>
			<t:gridCol property="cmj" caption="cmj" />
			<t:gridCol property="anqkc" caption="${i18n.anqkc }" />
			<t:gridCol property="laxjx" caption="${i18n.laxjx }" />
			<t:gridCol property="laxbs" caption="${i18n.laxbs }" convert="laxbs"/>
			<t:gridCol property="ziyts" caption="${i18n.ziyts }" />
			<t:gridCol property="kyljdm" caption="${i18n.kyljdm }"/>
			<t:gridCol property="duandsj" caption="${i18n.duansj }"/>
			<t:gridCol property="xuqsl" caption="${i18n.xuqsl }" editor="fieldText" editorOptions="{'maxLength':'8','expression':'^(([1-9]+[0-9]*.{1}[0-9]+)|([0].{1}[1-9]+[0-9]*)|([1-9][0-9]*)|([0][.][0-9]+[1-9]*))$','expressionMessage':'请输入正整数或小数!','notNull':true}"/>
			<t:gridCol property="jihydm" caption="${i18n.jihydm }" convert="getJihz"/>
		</t:grid>
		<t:form dialog="true" id="form_lins_xuq" caption="${i18n.formLinsxuq }" action="saveLinsXuq.ajax" reset="NOT">
		<t:fieldLayout prefix="linsxuq">
			    <t:fieldText property="lingjh" caption="${i18n.lingjh }" notNull="true" maxLength="10"/>
			    <t:fieldHidden property="maoxqbc"/>
			    <t:fieldHidden property="flag" defaultValue="1"/>
			    <t:fieldHidden property="daohl" />
			    <t:fieldSelect property="usercenter" caption="${i18n.usercenter }" notNull="true" convert="queryUserCenterMap"  />
				<t:fieldText property="jihydm" caption="${i18n.jihydm }"  notNull="true" readonly="true"/>
				<t:fieldText property="zhongxqkc" caption="${i18n.zhongxqkc }"   maxLength="8" notNull="true" expression="^(([0-9]+[0-9]*.{1}[0-9]+)|([0].{1}[0-9]+[0-9]*)|([0-9][0-9]*)|([0][.][0-9]+[1-9]*))$" expressionMessage="请输入正整数或小数!"/>
				<t:fieldText property="cangkkc" caption="${i18n.cangkkc }" maxLength="8"  notNull="true"  expression="^(([0-9]+[0-9]*.{1}[0-9]+)|([0].{1}[0-9]+[0-9]*)|([0-9][0-9]*)|([0][.][0-9]+[0-9]*))$" expressionMessage="请输入正整数或小数!"/>
				<t:fieldText property="cmj" caption="cmj"  maxLength="8"  notNull="true" expression="^(([0-9]+[0-9]*.{1}[0-9]+)|([0].{1}[0-9]+[0-9]*)|([0-9][0-9]*)|([0][.][0-9]+[1-9]*))$" expressionMessage="请输入正整数或小数!"/>
				<t:fieldText property="xuqsl" caption="${i18n.xuqsl }"  maxLength="8"  notNull="true"  expression="^(([0-9]+[0-9]*.{1}[0-9]+)|([0].{1}[0-9]+[0-9]*)|([0-9][0-9]*)|([0][.][0-9]+[0-9]*))$" expressionMessage="请输入正整数或小数!"/>
		</t:fieldLayout>
	</t:form>
	</t:page>
	<script type="text/javascript">
			$.sdcui.serverConfig.convertArray['laxbs']={'1':'${i18n.laxjhbs}','2':'${i18n.kayjhbs}'};
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
								return false;
							}else{
								$("#linsxuq_flag").fieldValue("1");
							}
						}
						});
					}else if(lingjh==''){
						alert("${i18n.lingjhinwkerror}");
					}
				});
			}
			
			//修改
			function func_button_addLinsxuq(){
				$('#form_lins_xuq').form('clear');
				$('#form_lins_xuq').form('open','');
			}
			
			
			
			//开始计算
			function func_button_beginjs(){
				//需求版权次
				var xuqbc = $('#al_xuqbc').fieldValue();
				//拉箱界限
			   	var laxjx = $('#al_laxjx').fieldValue();
			   	//安全库存
			   	var anqkc = $('#al_anqkc').fieldValue();
			   	//用户中心
			   	var usercenter = $('#al_usercenter').fieldValue();
			   	//物理点港口
			   	var wuldgk = $('#al_wuldgk').fieldValue();
			   	//计算算法策略
			   	var suanfcl = $('#al_suanfcl').fieldValue();
			   	//拉箱标识
			   	var laxbs = $('#al_laxbs').fieldValue();
			   	//资源天数
			   	var ziyts = $('#al_ziyts').fieldValue();
			   	//卡运路径代码
			   	var kyljdm = $('#al_kyljdm').fieldValue();
				$.sdcui.ajaxUtil.ajax({
					url:'jsLaxjh.ajax?xuqbc='+xuqbc+'&laxjx='+laxjx+'&anqkc='+anqkc+'&usercenter='+usercenter+'&suanfcl='+suanfcl+'&wuldgk='+wuldgk+'&laxbs='+laxbs+'&ziyts='+ziyts+'&kyljdm='+kyljdm,
					success:function(result){
						if(result.result=="1"){
							alert("${i18n.jissuccess}");
						}else if(result.result=="0"){
							alert("${i18n.wdqljerror}");
						}else if(result.result=="2"){
							alert("${i18n.fzxqwkyljerror}");
						}else if(result.result=="3"){
							alert("${i18n.syljzdqjssjerror}");
						}else if(result.result=="6"){
							alert("${i18n.yjszzjxerror}");
						}
					}
				});
			}
			
			function linsxuq_usercenter_change(){
				var lingjh = $('#linsxuq_lingjh').fieldValue();
				var usercenter = $('#linsxuq_usercenter').fieldValue();
				var ziyts = $('#al_ziyts').fieldValue();
				if(ziyts==''){
					ziyts = $('#al_laxjx').fieldValue();
				}
				var laxbs =  $('#al_laxbs').fieldValue(); 
				if(lingjh!=''&&usercenter!=''){
					$.sdcui.ajaxUtil.ajax({
					url:'getLingjh.ajax?lingjh='+lingjh+"&usercenter="+usercenter+"&ziyts="+ziyts+"&laxbs="+laxbs,
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
			
			function form_lins_xuq_beforeSubmit(){
				var maoxqbc = $('#field_xuqbc').fieldValue();
				$('#linsxuq_maoxqbc').fieldValue(maoxqbc);
				var flag = $('#linsxuq_flag').fieldValue();
				if(flag==0){
					alert("${i18n.gljhbczerror}");
					return false;
				}
				var jihydm = $('linsxuq_jihydm').fieldValue();
				if(jihydm==''){
					alert("${i18n.jihyzwkerror}");
					return false;
				}
				return true;
			}
			 function form_lins_xuq_afterSubmit(result){
				if(result.result=="1"){
					$('#grid_lingjbaojin').grid('reload');
					$('#form_lins_xuq').form('clear');
					$('#form_lins_xuq').form('close');
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