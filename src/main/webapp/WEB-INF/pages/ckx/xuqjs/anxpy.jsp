<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.baoz}">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 65px; } </style>
</head>
	<t:page i18n="i18n.ckx.xuqjs.i18n_anxpy">
	  <div><font color="red">维护操作必须在停线后和按需计算之前！</font></div>
	  <div><font color="red">平移时间是按照工作时间进行平移！</font></div>
		<t:grid id="grid_Anxpy" 
			idKeys="usercenter,chanx,txsj,flag" caption="${i18n.anxpy}" 
			src="queryAnxpy.ajax" editable="true"
			insertAlias="addList" editAlias="editList" afterSaveRowsEvent="afterSaveRows"

			delAlias="delList" saveRowsSrcs="saveAnxpy.ajax" load="false" showNum="true"
			showEditorAddName="editorAdd" showEditorRemoveName="editorRemove">
			<t:fieldLayout prefix="record0" >
				<t:fieldSelect property="usercenter"  caption="${i18n.usercenter}"  convert="queryUserCenterMap" defaultValue="${loginusercenter}" width="150"></t:fieldSelect>	                 
				<t:fieldSelect property="flag" caption="${i18n.flag}" convert="biaos" />	
				<t:fieldCalendar property="beginDate" caption="${i18n.kaissj}" format="yyyy-MM-dd HH:mm" />
				<t:fieldCalendar property="endDate" caption="${i18n.jiezsj}" format="yyyy-MM-dd HH:mm" />

			</t:fieldLayout>
			<t:button  caption="${i18n.delete}"  name="delete_anxpy"/>
			<t:gridCol property="usercenter" editor="fieldSelect" caption="${i18n.usercenter}" defaultValue="${loginusercenter}" convert="queryUserCenterMap" width="70" editorOptions="{'notNull':true}"/>
			<t:gridCol editor="fieldCalendar" width="150"  property="txsj" editorOptions="{'dataType':'text','notNull':true,'format':'yyyy-MM-dd HH:mm:ss'}" caption="${i18n.txsj}"/>
			
			<t:gridCol editor="fieldText" width="100"  property="pysj" caption="${i18n.pysj}" editorOptions="{'expression':'^([0-9]|[1-9][0-9]{0,3})$','expressionMessage':'只能输入0-999之间的整数','dataType':'integer','notNull':true,'maxLength':'3'}"/>
			
			<t:gridCol editor="fieldText" property="chanx" caption="${i18n.chanx}" editorOptions="{'notNull':true,'maxLength':'5','minLength':'5'}"/>
			
			<t:gridCol convert="biaos"  property="flag" caption="${i18n.flag}" defaultValue="0"/>
			
			<t:gridCol property="editor" caption="${i18n.editor}" />
			
			<t:gridCol property="editTime" width="150" caption="${i18n.edit_time}" />

			<t:gridCol property="a" caption="   " ></t:gridCol>
		</t:grid>
	</t:page>
	<script type="text/javascript">
			function initPage(){ //页面初始化
			
			}
			
			$(function(){
				$('#editorRemove').remove();
			});
			
			$.sdcui.serverConfig.convertArray['biaos'] = {
				'0' : '未生效',
				'1' : '已生效',
				'2' : '已删除'
		     };
		
		
			//保存按钮
			function func_button_save() {
				var params = $("#grid_Anxpy").grid("getBatchRecords");//获取修改的数据
				//params[0]:editList[0].usercenter=UL
				if(params){
					for(var i = 0; i < params.length; i++){
						//arr=editList[0].usercenter,UL
						var arr = params[i].split('=');
						//验证标识
						if(arr.length == 2 && arr[0].indexOf("flag") != -1 && arr[1] != 0){
							alert("${i18n.anxpy_01}");
							return false;
						}
					}
					$('#grid_Anxpy').grid('saveRows');
				}
				/* if($("#grid_Anxpy").grid("getSelectedRecords").length <1){
					//alert("请选中一条记录再保存");	
					$('#grid_Anxpy').grid('saveRows');		
				}else{				
					var record = $("#grid_Anxpy").grid("getSelectedRecords")[0];//选中的行的数据			
					
					var flag = record.flag;
					if(flag == "1"){
						alert("${i18n.anxpy_01}");
						return false;
					}else {
						$('#grid_Anxpy').grid('saveRows');
					}
				} */
			}
			
			function afterSaveRows(result){
				if(false == result.success){
					return false;
				}
				return true;
			}
			
			//删除
			function func_button_delete_anxpy(){
				
				var row = $("#grid_Anxpy").grid("getSelectedRecords")[0];
				if(typeof(row) == 'undefined'){
					alert("${i18n.anxpy_02}");
					return;
				}
				if(window.confirm('是否确认删除？')){
					var params = 'delList[0].usercenter='+row.usercenter+'&delList[0].chanx='+row.chanx+'&delList[0].txsj='+row.txsj+'&delList[0].flag='+row.flag;
					$.ajax({ 
						url : '../xuqjs/saveAnxpy.do?'+params,
					    type:'post', //数据发送方式 
					    dataType:'json', //接受数据格式 
					    data: false , 
					    success: function(data){ 
					    	alert(data.result.message);
					    	$('#grid_Anxpy').grid('reload');
					    }
					  });
				}
			}
	
		
		</script>
</t:html>