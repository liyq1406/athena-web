<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 70px; } </style>
		
		<style type="text/css">
			#grid_CkxCalendarCenter  .grid-footer   .pAddRow,
			#grid_CkxCalendarCenter  .grid-footer   .pRemoveRow{
				display: none;
			}
		</style>
	</head>
	<t:page i18n="i18n.ckx.workCalendar.i18n_workCalendar">
		<t:grid id="grid_CkxCalendarCenter" 
			idKeys="usercenter,riq"
			caption="${i18n.calendar}" 
			src="queryCkxCalendarCenter.ajax"
			editAlias="editList" load="false"
			saveRowsSrcs="saveCkxCalendarCenter.ajax"
scrollHeight="290" pageSize="15"
			editable="true" showNum="true">
			<t:fieldLayout prefix="record2" columns="3">
				<t:fieldSelect  property="usercenter" caption="${i18n.usercenter}"  defaultValue="${loginUser.usercenter}" convert="queryUserCenterMap" />
				<t:fieldSelect property="shifjfr" caption="${i18n.shifjfr}" convert="shifgzr" />
				<t:fieldSelect property="shifgzr" caption="${i18n.shifgzr}" convert="shifgzr" />
				<t:fieldCalendar property="beginDate" caption="${i18n.kaissj}" format="yyyy-MM-dd" />
				<t:fieldCalendar property="endDate" caption="${i18n.jiezsj}" format="yyyy-MM-dd" />

			
			
			</t:fieldLayout>
			
			<t:button name="addCalendarCenter"  caption="${i18n.btnAddCalendar}" icon="addRecord"></t:button>
			<t:button caption="${i18n.btnDelCalendar}" name="delCalendarCenter" icon="removeRecord"></t:button>
			
			<t:gridCol property="usercenter" convert="queryUserCenterMap"  caption="${i18n.usercenter}"/>
			<t:gridCol editorOptions="{'format':'yyyy-MM-dd'}" property="riq" caption="${i18n.riq}"/>
			<t:gridCol editor="fieldHidden" convert="queryXQ" property="xingq" caption="${i18n.xingq}"/>
			<t:gridCol property="nianzq" caption="${i18n.nianzq}"/>
			<t:gridCol property="zhoux" caption="${i18n.zx}"/>
			<t:gridCol property="nianzx" caption="${i18n.nianzx}"/>
			<t:gridCol editor="fieldText"  property="xis" editorOptions="{'notNull':true,'expression':'^1$|^0.[0-9]{1,2}$','expressionMessage':'请输入不大于1的正整数或2位小数'}" caption="${i18n.xis}"/>
			<t:gridCol editor="fieldSelect" convert="shifjfr" property="shifjfr" editorOptions="{'notNull':true}" caption="${i18n.shifjfr}"/>
			<t:gridCol editor="fieldSelect"  convert="shifgzr" property="shifgzr" editorOptions="{'notNull':true}" caption="${i18n.shifgzr}"/>
		<t:gridCol property="a" caption="   "
				></t:gridCol>
		</t:grid>
	
		
		
		<!-- 添加form -->
		<t:form dialog="true" reset="NOT" id="form_addCkxCalendarCenter" caption="${i18n.calendar}" action="addYear.ajax">
			<t:fieldLayout prefix="record3">
				<t:fieldSelect  convert="queryUserCenterMap"  property="center" caption="${i18n.usercenter}" notNull="true"  defaultValue="${loginUser.usercenter}"/>
				<t:fieldText property="year" caption="${i18n.year}" notNull="true" dataType="integer" maxLength="4" minLength="4"/>
			</t:fieldLayout>
		</t:form>
		<!-- 删除form -->
		<t:form dialog="true" reset="NOT" id="form_delCkxCalendarCenter" caption="${i18n.calendar}" action="delYear.ajax">
			<t:fieldLayout prefix="record1">
				<t:fieldSelect convert="queryUserCenterMap"   property="center" caption="${i18n.usercenter}" notNull="true" />
				<t:fieldText property="year" notNull="true"  caption="${i18n.year}" dataType="integer"  maxLength="4" minLength="4"/>
			</t:fieldLayout>
		</t:form>
	</t:page>
	<script type="text/javascript">
			function initPage(){
				//页面初始化
			
			}
			
			
			$.sdcui.serverConfig.convertArray['biaos'] = {'1':'${i18n.available}','0':'${i18n.unavailable}'};
			$.sdcui.serverConfig.convertArray['shifgzr'] = {'1':'${i18n.yes}','0':'${i18n.no}'};
			$.sdcui.serverConfig.convertArray['shifjfr'] = {'1':'${i18n.yes}','0':'${i18n.no}'};
			//自定义按钮触发事件:增加
			function func_grid_addCalendarCenter(){
				$('#form_addCkxCalendarCenter').form('clear');
				$("#record3_center").fieldValue('${loginUser.usercenter}');
				$('#form_addCkxCalendarCenter').form('open','${i18n.add}- ');
			}
			//自定义按钮触发事件:删除
			function func_grid_delCalendarCenter(){
				
				$("#record1_center").fieldValue('${loginUser.usercenter}');
				var record = $('#grid_CkxCalendarCenter').grid('getSelectedRecords')[0];
				if(record!=null){
					$("#record1_center").fieldValue(record.usercenter);
					$("#record1_year").fieldValue(record.riq.substr(0,4));
					$("#form_delCkxCalendarCenter").find("input[name='year']").val(record.riq.substr(0,4));
				}
				$('#form_delCkxCalendarCenter').form('open','${i18n.delete} - ');
			}
			
			//添加按钮回调函数
			function form_addCkxCalendarCenter_afterSubmit(result){
				$('#form_addCkxCalendarCenter').dialog('close');
				$('#form_addCkxCalendarCenter').find('input').val("");
				$('#grid_CkxCalendarCenter').grid('reload');//刷新表格数据
			}
			
			//删除按钮回调函数
			function form_delCkxCalendarCenter_afterSubmit(result){
				$('#form_delCkxCalendarCenter').dialog('close');
				$('#form_delCkxCalendarCenter').find('input').val("");
				$('#grid_CkxCalendarCenter').grid('reload');//刷新表格数据
			}
		</script>
</t:html>