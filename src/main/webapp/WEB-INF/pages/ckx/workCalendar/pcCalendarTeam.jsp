<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		
		<style type="text/css">
			#grid_CkxCalendarTeam  .grid-footer  .pAddRow,#grid_CkxCalendarTeam  .grid-footer  .pRemoveRow
			{display: none;}
			.youi-fieldLayout table td.contral.label-col {     width: 70px; } 
		</style>
		
	</head>
	<t:page i18n="i18n.ckx.workCalendar.i18n_workCalendar">
		<t:grid id="grid_CkxCalendarTeam" 
			idKeys="bianzh,xingq,xh"
			caption="${i18n.gongzsj}" 
			src="/PCcalendar/queryCkxCalendarTeam.ajax"
			editAlias="editList"
			delAlias="delList"
			saveRowsSrcs="/PCcalendar/saveCkxCalendarTeam.ajax"
			load="false"
scrollHeight="310" pageSize="15"
			editable="true" showNum="true">
			<t:fieldLayout prefix="record0">
			<t:fieldSelect src="/PCcalendar/getSelectTeamCode.ajax" show="bianzh" code="bianzh"  property="bianzh"  caption="${i18n.bianzh}" />
				<t:fieldSelect property="xingqxh" caption="${i18n.xingqxh}" convert="queryXQ" />
				<t:fieldText property="xuh" caption="${i18n.xuhao}" maxLength="2"/>
				<t:fieldText property="kaissj" expression="^(0[0-9]{1}|1[0-9]{1}|2[0-3]):[0-5][0-9]{1}:([0-5][0-9]{1})$" maxLength="8" minLength="8" expressionMessage="${i18n.qingtx8wsjgs}" caption="${i18n.kaissj}"/>
				<t:fieldText property="jiezsj" expression="^(0[0-9]{1}|1[0-9]{1}|2[0-3]):[0-5][0-9]{1}:([0-5][0-9]{1})$" maxLength="8" minLength="8" expressionMessage="${i18n.qingtx8wsjgs}" caption="${i18n.jiezsj}"/>
				<t:fieldText property="ban" dataType="text" maxLength="1"  minLength="1" caption="${i18n.ban}"/>
					<t:fieldSelect property="biaos" caption="${i18n.biaos}"
				convert="biaos" defaultValue="1"></t:fieldSelect>

		
			</t:fieldLayout>

			<t:button name="addCalendarTeam" caption="${i18n.add}"></t:button>
			<t:button name="copyCalendarTeam" caption="${i18n.copy}"></t:button>
			<t:button name="delCalendarTeam" caption="${i18n.shix}"></t:button>

		
			<!--  begin mantis12 0002695 -->
			<t:button name="physicalCalendarTeam" caption="${i18n.delete}" active="1" icon="removeRecord"></t:button>
			<!--  end mantis12 0002695 -->
			<t:gridCol property="bianzh" caption="${i18n.bianzh}"/>
			<t:gridCol convert="queryXQ" property="xingqxh" caption="${i18n.xingqxh}"/>
			<t:gridCol property="xuh" caption="${i18n.xuhao}"/>
			<t:gridCol editor="fieldText"  property="kaissj" caption="${i18n.kaissj}" 
				editorOptions="{'notNull':true,'expression':'^(0[0-9]{1}|1[0-9]{1}|2[0-3]):[0-5][0-9]{1}:([0-5][0-9]{1})$','expressionMessage':'${i18n.qingtx8wsjgs}'}"/>
			<t:gridCol editor="fieldText" property="jiezsj" caption="${i18n.jiezsj}"
				editorOptions="{'notNull':true,'expression':'^(0[0-9]{1}|1[0-9]{1}|2[0-3]):[0-5][0-9]{1}:([0-5][0-9]{1})$','expressionMessage':'${i18n.qingtx8wsjgs}'}"/>
			<t:gridCol editor="fieldText"  property="ban" caption="${i18n.ban}" 
				editorOptions="{'notNull':true,'expression':'^[a-zA-Z]$','expressionMessage':'${i18n.qingtxywzm}'}"/>
			<t:gridCol editor="fieldText"  property="tiaozsj" caption="${i18n.tiaozsj}" editorOptions="{'notNull':true,'expression':'^[0-1]$','expressionMessage':'${i18n.qingtx0h1}'}"/>
			<t:gridCol convert="biaos"  property="biaos" caption="${i18n.biaos}"/>
		</t:grid>
	
		
		
		<!-- 添加form -->
		<t:form dialog="true" id="form_addCkxCalendarTeam" reset="NOT" caption="${i18n.gongzsj}" action="/PCcalendar/addTeam.ajax">
			<t:fieldLayout prefix="record1">
				${i18n.xinbz}：<input type="checkbox" id="checkbox" onclick="changeGroup(this)"/>
				<t:fieldText property="usercode" caption="${i18n.userCode}"  dataType="text" maxLength="4" minLength="4"/>
				<t:fieldSelect src="getSelectTeamCode.ajax" show="bianzh" code="bianzh"  property="bianzh"  caption="${i18n.bianzh}" />
				<t:fieldSelect property="xingqxh" caption="${i18n.xingqxh}" convert="xingq" notNull="true"/>
				<t:fieldText property="kaissj" caption="${i18n.kaissj}" expression="^(0[0-9]{1}|1[0-9]{1}|2[0-3]):[0-5][0-9]{1}:([0-5][0-9]{1})$" expressionMessage="${i18n.qingtx8wsjgs}" notNull="true" maxLength="8" minLength="8"/>
				<t:fieldText property="jiezsj" caption="${i18n.jiezsj}" expression="^(0[0-9]{1}|1[0-9]{1}|2[0-3]):[0-5][0-9]{1}:([0-5][0-9]{1})$" expressionMessage="${i18n.qingtx8wsjgs}" notNull="true" maxLength="8" minLength="8"/>
				<t:fieldText property="ban" caption="${i18n.ban}" notNull="true" expression="^[a-zA-Z]$" expressionMessage="${i18n.qingtxywzm}"/>
				<t:fieldText property="tiaozsj" caption="${i18n.tiaozsj}" notNull="true" defaultValue="0" expression="^[0-1]$" expressionMessage="${i18n.qingtx0h1}"/>
			</t:fieldLayout>
		</t:form>
		<!-- 复制form -->
		<t:form dialog="true" id="form_copyCkxCalendarTeam" reset="NOT" caption="${i18n.gongzsj}" action="/PCcalendar/copyTeam.ajax">
			<t:fieldLayout prefix="record2">
				<t:fieldText property="teamcode" caption="${i18n.copybianzh}" notNull="true" dataType="text" maxLength="8" minLength="8"></t:fieldText>
				<t:fieldText property="usercode" caption="${i18n.userCode}" notNull="true" dataType="text" maxLength="4" minLength="4"/>
			</t:fieldLayout>
		</t:form>
		<!-- 删除form -->
		<t:form dialog="true"  id="form_delCkxCalendarTeam" reset="NOT" caption="${i18n.gongzsj}" action="/PCcalendar/delTeam.ajax">
			<t:fieldLayout prefix="record4">
				<t:fieldText property="teamcode" caption="${i18n.bianzh}" notNull="true" dataType="text" maxLength="8" minLength="8"></t:fieldText>
			</t:fieldLayout>
		</t:form>
	</t:page>
	<script type="text/javascript">
			function initPage(){
				//页面初始化
				var  codetd=$("#record1_usercode").parent("td:first");
				codetd.hide();
				codetd.prev().hide();
			}
			$.sdcui.serverConfig.convertArray['biaos'] = {'1':'${i18n.available}','0':'${i18n.unavailable}'};
			$.sdcui.serverConfig.convertArray['xingq'] = {'1':'${i18n.mon}','2':'${i18n.tues}','3':'${i18n.wed}','4':'${i18n.thurs}','5':'${i18n.friday}','6':'${i18n.sat}','7':'${i18n.sun}'};
			//自定义按钮触发事件
			
			function func_grid_addCalendarTeam(){
				$('#form_addCkxCalendarTeam').form('clear');
				var record = $('#grid_CkxCalendarTeam').grid('getSelectedRecords')[0];
				if(record!=null){
					$("#record1_bianzh").fieldValue(record.bianzh);
				}
				$('#form_addCkxCalendarTeam').form('open','${i18n.add} - ');
			}
			function func_grid_copyCalendarTeam(){
				var record = $('#grid_CkxCalendarTeam').grid('getSelectedRecords')[0];
				if(record!=null){
					$("#form_copyCkxCalendarTeam").find("input[name='teamcode']").val(record.bianzh);
				}
				$('#form_copyCkxCalendarTeam').form('open','${i18n.copy} - ');
			}
			function func_grid_delCalendarTeam(){
				var record = $('#grid_CkxCalendarTeam').grid('getSelectedRecords')[0];
				if(record!=null){
					$("#form_delCkxCalendarTeam").find("input[name='teamcode']").val(record.bianzh);
				}
				$('#form_delCkxCalendarTeam').form('open','${i18n.delete} - ');
			}
			// begin mantis12 0002695
			function func_grid_physicalCalendarTeam(){
				var record = $('#grid_CkxCalendarTeam').grid('getSelectedRecords')[0];
				if(confirm("${i18n.niqdysc}")){					
					$.sdcui.ajaxUtil.ajax({
						url : "../PCcalendar/removeCkxCalendarTeam.ajax?bianzh="+record.bianzh+"&xingqxh="+record.xingqxh+"&xuh="+record.xuh,
						success : function() {
							$("#grid_CkxCalendarTeam").grid("reload");
							$('#field-pop-record0_bianzh').removeClass("loaded");//刷新表格数据
						}
					});
				}				
			}// end mantis12 0002695
			//添加按钮回调函数
			function form_addCkxCalendarTeam_afterSubmit(result){
				//$('#form_addCkxCalendarTeam').dialog('close');
				//$('#form_addCkxCalendarTeam').find('input').val("");
				$('#grid_CkxCalendarTeam').grid('reload');//刷新表格数据
				// begin mantis 0002529
				if("checked" == $("#checkbox").attr("checked")){
					$("#checkbox").attr("checked",false);
					changeGroup("#checkbox");
					var option ="<div class='option-item' value='"+result.bianzh+"'>"+result.bianzh+"</div>";
					var options = $("#field-pop-record1_bianzh").html();
					var optionsAll = options.replace(/\"/g,",");					
					if(optionsAll.indexOf("value=,"+result.bianzh+",")<=0){					
						$("#field-pop-record1_bianzh").html(options+option);		
					}	
					$("#record1_bianzh").fieldValue(result.bianzh);
				}
				$('#field-pop-record0_bianzh').removeClass("loaded");//刷新表格数据
				//end mantis 0002529
			}
			
			//删除按钮回调函数
			function form_delCkxCalendarTeam_afterSubmit(result){
				$('#form_delCkxCalendarTeam').dialog('close');
				$('#form_delCkxCalendarTeam').find('input').val("");
				$('#grid_CkxCalendarTeam').grid('reload');//刷新表格数据
				$('#field-pop-record0_bianzh').removeClass("loaded");//刷新表格数据
			}
			
			//复制按钮回调函数
			function form_copyCkxCalendarTeam_afterSubmit(result){
				$('#form_copyCkxCalendarTeam').dialog('close');
				$('#form_copyCkxCalendarTeam').find('input').val("");
				$('#grid_CkxCalendarTeam').grid('reload');//刷新表格数据
				$('#field-pop-record0_bianzh').removeClass("loaded");//刷新表格数据
			}
			
			
			///function func_button_save(){
			//	$('#grid_CkxCalendarTeam').grid('saveRows');
			//}
			
			
			//新旧编组切换录入
			function changeGroup(obj){
				if($(obj).attr("checked")=="checked"){
					var codetd=$("#record1_usercode").parent("td:first");
					var bianzhtd=$("#record1_bianzh").parent("td:first");
					bianzhtd.hide();
					bianzhtd.prev().hide();
					bianzhtd.find("input").val("");
					codetd.show();
					codetd.prev().show();					
				}else{
					var codetd=$("#record1_usercode").parent("td:first");
					var bianzhtd=$("#record1_bianzh").parent("td:first");
					bianzhtd.show();
					bianzhtd.prev().show();
					codetd.hide();
					codetd.prev().hide();
					codetd.find("input").val("");
					
				}
			}
		</script>
</t:html>