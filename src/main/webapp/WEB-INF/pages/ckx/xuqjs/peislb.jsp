<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.peislb}">

<!-- 
	配送类别
	 @author qizhongtao
	 @date 2012-4-10
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>
	<t:page i18n="i18n.ckx.xuqjs.i18n_peislb">
		<t:grid id="grid_peislb" caption="${i18n.peislb}" idKeys="peislx" load="false" 
			remove="NOT" back="NOT" afterSaveRowsEvent="afterSaveRows"
			src="/xuqjs/queryPeislb.ajax"  editable="true" showNum="true" 
			saveRowsSrcs="/xuqjs/savePeislb.ajax"  scrollHeight="290" pageSize="15"
			showCheckbox="true"
			showEditorAddName="editorAdd" showEditorRemoveName="editorRemove">
			
			<t:fieldLayout id="fl_peislb" prefix="peislb" columns="3">
				<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" defaultValue="${usercenter}" convert="queryUserCenterMap" width="150"/>
				<t:fieldText property="peislx" caption="${i18n.peislx}" maxLength="4" minLength="4" dataType="text" width="150"/>
				<t:fieldText property="peislxmc" caption="${i18n.peislxmc}" maxLength="50" width="150"/>
				<t:fieldText property="baozlx" caption="${i18n.baozlx}" dataType="text" maxLength="5" minLength="5" width="150"/>
				<t:fieldText property="shangxd" caption="${i18n.shangxd}" dataType="text" maxLength="13" minLength="13" width="150"/>
				<t:fieldHidden property="wlgyy" caption="${i18n.wlgyy}" defaultValue="${WULGYY}" />
				<t:fieldSelect property="biaos" caption="${i18n.biaos}"  convert="biaos" defaultValue="1" width="150"/>
			</t:fieldLayout>
			<t:button caption="${i18n.guanlxjy}" name="guanlxjy"/>
			<t:gridCol editable="${edit_usercenter}" property="usercenter" caption="${i18n.usercenter}" editor="fieldSelect" convert="queryUserCenterMap" defaultValue="${usercenter}"  
				editorOptions="{'notNull':true}"/>
			<t:gridCol editable="${edit_peislx}" property="peislx" caption="${i18n.peislx}" editor="fieldText"  
				editorOptions="{'notNull':true,'maxLength':'4','minLength':'4','dataType':'text'}"/>
			<t:gridCol editable="${edit_peislxmc}" property="peislxmc" caption="${i18n.peislxmc}" editor="fieldText" width="85" 
				editorOptions="{closeEvent:func_set_peislxmc}"/>
			<t:gridCol editable="${edit_baozlx}" property="baozlx" caption="${i18n.baozlx}" editor="fieldText" width="80" 
				editorOptions="{'maxLength':'5','minLength':'5','dataType':'text','notNull':true}"/>
			<t:gridCol editable="${edit_baozsl}" property="baozsl" caption="${i18n.baozsl}" editor="fieldText" width="180" 
				editorOptions="{'expression':'^([1-9][0-9]{0,4})$','expressionMessage':'${i18n.baozsl_ex_mes}','notNull':true}"/>
			<!-- 最长等待车位数 mantis:0006585   date:2013-03-01  kong-->
			<t:gridCol editable="${edit_zuicddcws}" property="zuicddcws" caption="${i18n.zuicddcws}" editor="fieldText" width="100" 
				editorOptions="{'expression':'^([0-9]|[1-9][0-9]{0,4})$','expressionMessage':'只能输入0-99999之间的整数','notNull':true}" />
			<t:gridCol editable="${edit_tongbjpbs}" property="tongbjpbs" caption="${i18n.tongbjpbs}" editor="fieldSelect" convert="queryPeisbz"
				editorOptions="{closeEvent:func_set_tongbjpbs}"/>
			<t:gridCol editable="${edit_shangxd}" property="shangxd" caption="${i18n.shangxd}" editor="fieldText" width="100" 
				editorOptions="{'maxLength':'13','minLength':'13','dataType':'text'}"/>
			<t:gridCol editable="${edit_peitsxbs}" property="peitsxbs" caption="${i18n.peitsxbs}" editor="fieldText" width="100" 
				editorOptions="{'maxLength':'1','minLength':'1','dataType':'text'}" defaultValue="0"/>
			<t:gridCol editable="${edit_beihtqq}" property="beihtqq" caption="${i18n.beihtqq}" editor="fieldText" width="120" 
				editorOptions="{'expression':'^(([0-9]{1,2}\.[0-9]{1,3})|([0-9]{1,2}))$','expressionMessage':'${i18n.beihtqq_ex_mes}'}"/>
			<t:gridCol editable="${edit_xiaohccxc}" property="xiaohccxc" caption="${i18n.xiaohccxc}" editor="fieldText" width="100" 
				editorOptions="{'maxLength':'4'}"/>
			<t:gridCol editable="${edit_shifgj}" property="shifgj" caption="${i18n.shifgj}" editor="fieldSelect" width="140" convert="shifgj"
				editorOptions="{openEvent:qickcEditAble}"/>
			<t:gridCol editable="${edit_beiz}" property="beiz" caption="${i18n.beiz}" editor="fieldText" width="150" 
				editorOptions="{'maxLength':'25'}"/>
			<t:gridCol editable="${edit_shifbhd}" property="shifbhd" caption="${i18n.shifbhd}" editor="fieldSelect" convert="shifbhd" width="100"/>
			<t:gridCol editable="${edit_cangkbh}" property="cangkbh" caption="${i18n.cangkbh}" editor="fieldText"  
				editorOptions="{'maxLength':'3','minLength':'3','dataType':'text','notNull':true}"/>
			<t:gridCol editable="${edit_zickbh}" property="zickbh" caption="${i18n.zickbh}" editor="fieldText" 
				editorOptions="{'maxLength':'3','minLength':'3','dataType':'text','notNull':true}"/>
<%-- 			<t:gridCol hidden="${hidden_wlgyy}" property="wlgyy" caption="${i18n.wlgyy}" editor="fieldSelect" width="100"  --%>
<%-- 				editorOptions="{'show':'VALUE','code':'KEY','src':'../xuqjs/getZudmByAthority.ajax?role=WULGYY'}" defaultValue="${WULGYY}"/> --%>
			<t:gridCol editable="${edit_biaos}" property="biaos" caption="${i18n.biaos}" editor="fieldSelect" convert="biaos" defaultValue="1"/>
		</t:grid>
	</t:page>
	

	<script type="text/javascript">
	
		//空格查询
		function grid_peislb_beforeSubmit() {
			$("#peislb_peislx").fieldValue(trim($("#peislb_peislx").fieldValue()));
			$("#peislb_peislxmc").fieldValue(trim($("#peislb_peislxmc").fieldValue()));
			$("#peislb_baozlx").fieldValue(trim($("#peislb_baozlx").fieldValue()));
			$("#peislb_shangxd").fieldValue(trim($("#peislb_shangxd").fieldValue()));
		}
		//是否归集(按零件)
		$.sdcui.serverConfig.convertArray['shifgj']={
			'1':'${i18n.shi}',
			'0':'${i18n.fou}'
		}
		
		//标识
		$.sdcui.serverConfig.convertArray['biaos']={
			'1':'${i18n.youx}','0':'${i18n.wux}'
		}
		
		//是否生成备货清单
		$.sdcui.serverConfig.convertArray['shifbhd']={
			'1':'${i18n.shi}',
			'0':'${i18n.fou}'
		}
		
		//包装同步，是否归集标识自动带出
		function func_set_tongbjpbs(){
			var cell = this.col.cell;
			var rowElement = cell.parent("tr:first");
			var shifgjIndex = $('td.shifgj:first').prevAll().length;
			var tongbjpbsIndex = $('td.tongbjpbs:first').prevAll().length;
			var tongbjpbsmc = trim(rowElement.find('td:eq(' + tongbjpbsIndex + ')').text());
			if("包装同步"==tongbjpbsmc){
				rowElement.find('td:eq(' + shifgjIndex + ')').text("${i18n.shi}");
			}else{
				rowElement.find('td:eq(' + shifgjIndex + ')').text("").attr('value','');
			}
		}
		
		//配送标识为  包装同步    同时锁定是否归集编辑框
		function qickcEditAble(){
			var tongbjpbsIndex = $('td.tongbjpbs:first').prevAll().length;
			var event = window.event || arguments.callee.caller.arguments[2];
			var td = event.srcElement || event;
			//编辑单元格所在TD的tr
			var tr;
			if (event.srcElement) {
				tr = $(td).parent('tr:first');
			} else {
				tr = $(td.cell).parent('tr:first');
			}
			var tongbjpbsmcs = $(tr).find('td:eq('+tongbjpbsIndex+')').text();
			
			if("包装同步"==tongbjpbsmcs){
				return false;
			}
			return true;
		}
		
		//配送类型名称长度为50
		function func_set_peislxmc() {
			var cell = this.col.cell;
			var rowElement = cell.parent("tr:first");

			var peislxmcIndex = $('td.peislxmc:first').prevAll().length;
			var peislxmc = trim(rowElement.find('td:eq(' + peislxmcIndex + ')').text());
			
			if (!checkCH(50, peislxmc)) {
				alert("${i18n.peislxmccd}");
				return false;
			}
			return true;
		}
		
		//行编辑保存后的方法
		function afterSaveRows(result){
			if(false == result.success){
				return false;
			}
			return true;
		}
		
		//关联项校验
		function func_button_guanlxjy(){
			 var rows = $('#grid_peislb').grid('getSelectedRecords');
			 var params = [];
			 if(rows.length != 0){
				 for(var i = 0 ; i < rows.length ; i++ ){
					 params.push("list["+i+"]="+rows[i].usercenter+"_"+rows[i].peislx);
				 }
			 }else{
				 params.push("peislb.usercenter="+$("#peislb_usercenter").fieldValue());
				 params.push("peislb.peislx="+$("#peislb_peislx").fieldValue());
				 params.push("peislb.peislxmc="+$("#peislb_peislxmc").fieldValue());
				 params.push("peislb.baozlx="+$("#peislb_baozlx").fieldValue());
				 params.push("peislb.shangxd="+$("#peislb_shangxd").fieldValue());
				 params.push("peislb.biaos="+$("#peislb_biaos").fieldValue());
			 }
			 $.sdcui.ajaxUtil.ajax({
					url:'guanlxjy.ajax',
					data:params.join('&'),
					success:function(result){
						if(result.success===true){	//关联项验证成功，弹出消息提示
							alert("${i18n.success}");
						}else{	//关联项验证失败，弹出消息提示，并下载错误信息的excel
							alert("${i18n.fail}");
							$.sdcui.pageUtils.goPage({
								url : '../xuqjs/downloadErrorList.do?'+params.join('&'),
								mode : 'form',
								beforeSubmit : function(){
									return true;
								}
						   });
						}
					}
				});
		}
	</script>
</t:html>











