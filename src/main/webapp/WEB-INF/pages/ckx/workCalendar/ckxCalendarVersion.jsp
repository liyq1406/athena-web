<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		
		<style type="text/css">
			#grid_CkxCalendarVersion  .grid-footer   .pAddRow,
			#grid_CkxCalendarVersion  .grid-footer   .pRemoveRow{
				display: none;
			}
			.youi-fieldLayout table td.contral.label-col {     width: 70px; } 
			#form_copyCkxCalendarVersion .youi-fieldLayout table td.contral.label-col { width: 100px; }
		</style>
		
	</head>
	<t:page i18n="i18n.ckx.workCalendar.i18n_workCalendar">
		<t:grid id="grid_CkxCalendarVersion" 
			idKeys="usercenter,riq,banc"
			caption="${i18n.rilbc}" 
			src="queryCkxCalendarVersion.ajax"
			editAlias="editList"
			saveRowsSrcs="saveCkxCalendarVersion.ajax"
			load="false"
scrollHeight="335" pageSize="15"
			editable="true" showNum="true">
			<t:fieldLayout prefix="record0" columns="4">
				<t:fieldSelect  property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap"  defaultValue="${loginUser.usercenter}" width="110"/>
				<t:fieldSelect property="banc" caption="${i18n.banch}" src="getVersionNo.ajax" show="banc" code="banc" parents="usercenter" width="110"/>
				<t:fieldSelect property="shifjfr" caption="${i18n.shifjfr}" convert="shifgzr" width="110"/>
				<t:fieldSelect property="shifgzr" caption="${i18n.shifgzr}" convert="shifgzr" width="110"/>
				<t:fieldCalendar property="beginDate" caption="${i18n.kaissj}" format="yyyy-MM-dd" width="110"/>
				<t:fieldCalendar property="endDate" caption="${i18n.jiezsj}" format="yyyy-MM-dd" width="110"/>
				<t:fieldSelect property="biaos" caption="${i18n.biaos}" convert="biaos" width="110"/>
				
			</t:fieldLayout>
			<t:button name="addCalendarVersion" caption="${i18n.add}${i18n.banc}" icon="addRecord"></t:button>
			<t:button name="copyCalendarVersion" caption="${i18n.copy}${i18n.banc}" icon="addRecord" active="1"></t:button>
			<t:button name="addCalendarDay" caption="${i18n.add}${i18n.ril}" icon="addRecord" active="1"></t:button>
			<t:button name="delCalendarVersion" caption="${i18n.delete}${i18n.banc}" icon="removeRecord" active="1"></t:button>
			<t:button name="editCalendarVersionNianzx" caption="${i18n.update}${i18n.nianzx}" icon="editRecord" active="1"></t:button>
			
			<t:gridCol  property="banc" caption="${i18n.banc}"/>
			<t:gridCol  property="usercenter" convert="queryUserCenterMap" caption="${i18n.usercenter}"/>
			<t:gridCol editorOptions="{'format':'yyyy-MM-dd'}" property="riq" caption="${i18n.riq}"/>
			<t:gridCol  convert="queryXQ" property="xingq" caption="${i18n.xingq}"/>
			<t:gridCol  property="nianzq" caption="${i18n.nianzq}"/>
			<t:gridCol  hidden="false" property="nianzqTemp" caption="${i18n.yuan}${i18n.nianzq}"/>
			<t:gridCol  property="zhoux" caption="${i18n.zx}"/>
			<t:gridCol  hidden="false" property="zhouxTemp" caption="${i18n.yuan}${i18n.zx}"/>
			<t:gridCol  property="nianzx" caption="${i18n.nianzx}"/>
			<t:gridCol hidden="false" property="nianzxTemp" caption="${i18n.yuan}${i18n.nianzx}"></t:gridCol>
			<t:gridCol property="ynianzx" caption="原年周序" hidden="true"></t:gridCol>
			<t:gridCol editor="fieldText"  property="xis" caption="${i18n.xis}" editorOptions="{'notNull':true,'expression':'^1$|^0.[0-9]{1,2}$','expressionMessage':'${i18n.qingsrbdy }'}"/>
			<t:gridCol editor="fieldSelect"  convert="shifjfr" property="shifjfr" caption="${i18n.shifjfr}" editorOptions="{'notNull':true}"/>
			<t:gridCol editor="fieldSelect" convert="shifgzr" property="shifgzr" caption="${i18n.shifgzr}" editorOptions="{'notNull':true}"/>
			<t:gridCol  convert="biaos"  property="biaos" caption="${i18n.biaos}"/>
		</t:grid>
	
		
		
		<!-- 添加版次form -->
		<t:form dialog="true" reset="NOT" id="form_addCkxCalendarVersion" caption="${i18n.rilbc}" action="addVersion.ajax" >
			<t:fieldLayout prefix="record1">
				<t:fieldSelect convert="queryUserCenterMap"  property="center" caption="${i18n.usercenter}" notNull="true" defaultValue="${loginUser.usercenter}" />
				<t:fieldText property="year" caption="${i18n.year}" notNull="true" expression='(\b[0-9]{4}\b\,)+(\b[0-9]{4}\b)$|^[0-9]{4}$' expressionMessage="${i18n.qingsr4wsznf}"  />
				<t:fieldText property="usercode" caption="${i18n.userCode}" notNull="true" dataType="text" maxLength="4" minLength="4"/>
			</t:fieldLayout>
		</t:form>
		<!-- 复制版次form -->
		<t:form dialog="true" reset="NOT" id="form_copyCkxCalendarVersion" caption="${i18n.rilbc}" action="copyVersion.ajax">
			<t:fieldLayout prefix="record2">
				<t:fieldText property="versionCode" readonly="true" caption="${i18n.copybanch }" notNull="true" dataType="text" maxLength="8" minLength="8"></t:fieldText>
				<t:fieldText property="usercode" caption="${i18n.userCode}" notNull="true" dataType="text" maxLength="4" minLength="4"/>
			</t:fieldLayout>
		</t:form>
		<!-- 添加日历form -->
		<t:form dialog="true" reset="NOT" id="form_addCkxCalendarDay" caption="${i18n.ril}" action="addDay.ajax">
			<t:fieldLayout prefix="record3">
				<t:fieldText property="versionCode" readonly="true" caption="${i18n.banch}" notNull="true" dataType="text" maxLength="8" minLength="8"></t:fieldText>
				<t:fieldText property="year" caption="${i18n.year}" notNull="true" expression='(\b[0-9]{4}\b\,)+(\b[0-9]{4}\b)$|^[0-9]{4}$' expressionMessage="${i18n.qingsr4wsznf}"  />
			</t:fieldLayout>
		</t:form>
		<!-- 删除版次form -->
		<t:form dialog="true" reset="NOT" id="form_delCkxCalendarVersion" caption="${i18n.rilbc}" action="delVersion.ajax">
			<t:fieldLayout prefix="record4">
				<t:fieldText property="versionCode" readonly="true" caption="${i18n.banch}" notNull="true" dataType="text" maxLength="8" minLength="8"></t:fieldText>
			</t:fieldLayout>
		</t:form>
			<!--修改版次年周序form -->
		<t:form dialog="true" reset="NOT" id="form_editCalendarVersionNianzx" caption="${i18n.nianzx}" action="editCalendarVersionNianzx.ajax">
			<t:fieldLayout prefix="record5" >
			<t:fieldSelect  property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap"  defaultValue="${loginUser.usercenter}"  readonly="true"/>
			<t:fieldText property="banc" caption="${i18n.banch}" readonly="true"></t:fieldText>
			<t:fieldText property="riq" caption="${i18n.riq}" readonly="true"></t:fieldText>
			<t:fieldText property="zhoux" caption="${i18n.zx}" readonly="true"></t:fieldText>
			<t:fieldText property="ynianzx" caption="原${i18n.nianzx}" readonly="true" ></t:fieldText>
			<t:fieldText property="nianzx" caption="${i18n.nianzx}" dataType="Integer" maxLength="6" minLength="6" notNull="true"></t:fieldText>
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
			
			
			
			//自定义按钮触发事件
			//增加版次
			function func_grid_addCalendarVersion(){
				$('#form_addCkxCalendarVersion').form('clear');
				$("#record1_center").fieldValue('${loginUser.usercenter}');
				$('#form_addCkxCalendarVersion').form('open','${i18n.add} - ');
			}
			//复制版次
			function func_grid_copyCalendarVersion(){
				$('#form_copyCkxCalendarVersion').form('clear');
				var record = $('#grid_CkxCalendarVersion').grid('getSelectedRecords')[0];
				
				if(record.biaos == '0'){
					alert("版次已失效，不能操作");return false;
				}
				if(record!=null){
					$("#form_copyCkxCalendarVersion").find("input[name='versionCode']").val(record.banc);
				}
				$('#form_copyCkxCalendarVersion').form('open','${i18n.copy} - ');
			}
			//增加日历
			function func_grid_addCalendarDay(){
				$('#form_addCkxCalendarDay').form('clear');
				var record = $('#grid_CkxCalendarVersion').grid('getSelectedRecords')[0];
				
				if(record.biaos == '0'){
					alert("版次已失效，不能操作");return false;
				}
				if(record!=null){
					$("#form_addCkxCalendarDay").find("input[name='versionCode']").val(record.banc);
				}
				$('#form_addCkxCalendarDay').form('open','${i18n.add} - ');
			}
			//删除版次
			function func_grid_delCalendarVersion(){
				$('#form_delCkxCalendarVersion').form('clear');
				var record = $('#grid_CkxCalendarVersion').grid('getSelectedRecords')[0];
				if(record.biaos == '0'){
					alert("版次已失效");return false;
				}
				if(record!=null){
					$("#form_delCkxCalendarVersion").find("input[name='versionCode']").val(record.banc);
				}
				$('#form_delCkxCalendarVersion').form('open','${i18n.delete} - ');
			}
			//修改年周序
			function func_grid_editCalendarVersionNianzx(){
				$('#form_editCalendarVersionNianzx').form('clear');
				var record = $('#grid_CkxCalendarVersion').grid('getSelectedRecords')[0];
				if(record.biaos == '0'){
					alert("版次已失效，不能操作");return false;
				}
				$("#form_editCalendarVersionNianzx").form('fillRecord', $.extend({}, record));
				$('#form_editCalendarVersionNianzx').form('open','${i18n.update} - ');
			}
			//修改年周序回调函数
			function form_editCalendarVersionNianzx_afterSubmit(result){
				if (typeof (result.success) != "undefined" && result.success == false) {
					return ;
				}
				$('#form_editCalendarVersionNianzx').dialog('close');		
				$('#grid_CkxCalendarVersion').grid('reload');//刷新表格数据
			}
			//添加版次按钮回调函数
			function form_addCkxCalendarVersion_afterSubmit(result){
				$('#form_addCkxCalendarVersion').dialog('close');
				$('#form_addCkxCalendarVersion').find('input').val("");
				$('#grid_CkxCalendarVersion').grid('reload');//刷新表格数据
				
				$('#field-pop-record0_banc').removeClass("loaded");//刷新表格数据
			}
			
			//删除按钮回调函数
			function form_delCkxCalendarVersion_afterSubmit(result){
				$('#form_delCkxCalendarVersion').dialog('close');
				$('#form_delCkxCalendarVersion').find('input').val("");
				$('#grid_CkxCalendarVersion').grid('reload');//刷新表格数据
				$('#field-pop-record0_banc').removeClass("loaded");//刷新表格数据
			}
			
			//复制按钮回调函数
			function form_copyCkxCalendarVersion_afterSubmit(result){
				$('#form_copyCkxCalendarVersion').dialog('close');
				$('#form_copyCkxCalendarVersion').find('input').val("");
				$('#grid_CkxCalendarVersion').grid('reload');//刷新表格数据
				$('#field-pop-record0_banc').removeClass("loaded");//刷新表格数据
			}
			
			//添加日历按钮回调函数
			function form_addCkxCalendarDay_afterSubmit(result){
				$('#form_addCkxCalendarDay').dialog('close');
				$('#form_addCkxCalendarDay').find('input').val("");
				$('#grid_CkxCalendarVersion').grid('reload');//刷新表格数据
// 				$('#field-pop-record0_banc').removeClass("loaded");//刷新表格数据
			}
			
		</script>
</t:html>