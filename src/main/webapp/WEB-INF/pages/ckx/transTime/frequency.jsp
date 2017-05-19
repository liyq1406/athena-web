<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		
		<style type="text/css">
			#grid_CkxSonghpc  .grid-footer   .pAddRow,
			#grid_CkxSonghpc  .grid-footer   .pRemoveRow{
				display: none;
			}
		</style>
	</head>
	<t:page i18n="i18n.ckx.transTime.i18n_frequency">
		<t:grid id="grid_CkxSonghpc" 
			idKeys="gcbh,xiehztbh,songhzdpc,songhzxpc"
			exportXls="true"
			caption="${i18n.songhpc }" 
			src="queryFrequency.ajax"
			editAlias="editList" load="false"
			saveRowsSrcs="saveFrequency.ajax"
editable="true" showNum="true"
            dataFormId="form_xiehztbz"
			scrollHeight="345" pageSize="15">
			<t:fieldLayout prefix="record2" columns="4">
				<t:fieldSelect  property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap"  defaultValue="${loginUser.usercenter}"  width="100"/>
				<t:fieldText  property="gcbh" caption="${i18n.gcbh }" maxLength="10" width="100"/>
				<t:fieldText property="xiehztbh" caption="${i18n.xiehztbz }" maxLength="6" width="100"/>
				<t:fieldSelect property="biaos" caption="${i18n.biaos}" convert="biaos" width="100"/>

			
			
			</t:fieldLayout>
			
			<t:button name="addxiehztbz"  caption="${i18n.add }"></t:button>
			<t:button name="delxiehztbz"  caption="${i18n.del}" active="1" ></t:button>
			<t:button name="compute"  caption="${i18n.jisshpc }"></t:button>
			<t:gridCol property="usercenter" convert="queryUserCenterMap" caption="${i18n.usercenter}"/>
			<t:gridCol property="gcbh"  caption="${i18n.gcbh }"/>
			<t:gridCol property="xiehztbh" caption="${i18n.xiehztbz }"/>
			<t:gridCol property="ches" caption="${i18n.ches }" editor="fieldText" editorOptions="{'notNull':true,'dataType':'integer' ,'maxLength':'3'}"/>
			<t:gridCol property="jispc" caption="${i18n.jispc }"/>
			<t:gridCol property="shengxpc" editor="fieldText" editorOptions="{'notNull':true,'dataType':'integer' ,'maxLength':'2'}"  caption="${i18n.shengxpc }"/>
			<t:gridCol property="shijpc" caption="${i18n.shijpc }"/>
			<t:gridCol property="jisrq" caption="${i18n.jisrq }"/>
			<t:gridCol property="gongzsj" caption="${i18n.gongzsj }"/>
			<t:gridCol property="editor" caption="修改人"/>
			<t:gridCol property="edit_time" caption="修改时间"/>
			<t:gridCol convert="biaos"  property="biaos" editor="fieldSelect"  editorOptions="{'notNull':true}" caption="${i18n.biaos}"/>
		</t:grid>
		<t:form id="form_xiehztbz" caption="${i18n.add}" action="addFrequency.ajax" reset="NOT"
		idKeys="xiehztbh,usercenter,gcbh" dialog="true">
		<t:fieldLayout prefix="xiehztbz" columns="2" >
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter }" notNull="true" convert="queryUserCenterMap" defaultValue="${loginUsercenter }"/>
			<t:fieldText property="xiehztbh" caption="${i18n.xiehztbz }" maxLength="4" minLength="4" notNull="true" dataType="text"/>
			<t:fieldText property="gcbh" caption="${i18n.gcbh }" maxLength="10" notNull="true" expression="^[0-9A-Z]{6}[\\s0-9A-Z]{2}[0-9A-Z]{2}$" expressionMessage="请填写10位编号" />
		
		    <t:fieldText property="ches" caption="${i18n.ches }" notNull="true" maxLength="2" dataType="integer"></t:fieldText>
		    <t:fieldText property="jispc" caption="${i18n.jispc }" notNull="true" maxLength="2" dataType="integer"></t:fieldText>
		    <t:fieldText property="shengxpc" caption="${i18n.shengxpc }" notNull="true" maxLength="2" dataType="integer"></t:fieldText>
		    <t:fieldText property="shijpc" caption="${i18n.shijpc }" notNull="true" maxLength="2" dataType="integer"></t:fieldText>
		    <t:fieldText property="gongzsj" caption="${i18n.gongzsj }" notNull="true" maxLength="4" dataType="integer"></t:fieldText>
		</t:fieldLayout>
	</t:form>
	</t:page>
	<script type="text/javascript">
	$.sdcui.serverConfig.convertArray['biaos'] = {'1':'${i18n.available}','0':'${i18n.unavailable}'};
			function initPage(){
				//页面初始化
			}
			
			
			//自定义按钮触发事件:计算送货频次
			function func_grid_compute(){
				var usercenter = $("#record2_usercenter").fieldValue();
				if(usercenter==""||usercenter==null){
					alert("${i18n.qingxzyhzx }");
				}
				if (!confirm("${i18n.bencjsjfgscjg }")){
					return;
				}
				$.sdcui.ajaxUtil.ajax({
		            url:"compute.ajax?usercenter="+usercenter,//请求url
		            data:null,
		           	success:function (result){
						$('#grid_CkxSonghpc').grid('reload');//刷新表格数据	
					}
		     	});
				//$('#grid_CkxXiehztxqgj').grid('reload');//刷新表格数据	
				//$('#form_sreachCkxXiehztxqgj').form('open','计算 - ');
			}
				//增加
			function func_grid_addxiehztbz(){
				$('#form_xiehztbz').form("clear");
				$('#form_xiehztbz').addClass('operant-add');
				$("#form_xiehztbz").form("open");
			}
				//删除
			function  func_grid_delxiehztbz(){
				var record = $('#grid_CkxSonghpc').grid('getSelectedRecords')[0];	
				if(confirm('${i18n.niqdsc}')){
					$.sdcui.ajaxUtil.ajax({
			            url:"daleteFrequency.ajax?usercenter="+record.usercenter+"&xiehztbh="+record.xiehztbh+"&gcbh="+record.gcbh,//请求url
			           	success:function (result){			           	
							$('#grid_CkxSonghpc').grid('reload');//刷新表格数据	
						}
			     	});
				}	
			}
			//提交
			function func_button_addSubmitPath(){
				
				var record = $('#grid_CkxXiehztxqgj').grid('getSelectedRecords');
				if(record.length == 0){
					alert('${i18n.qingxzxqgj }!');
					return false;
				} 
				
				var params = [];
				for(var i=0;i<record.length;i++){
					params.push('list['+i+'].xiehztbh='+record[i].xiehztbh);
					params.push('list['+i+'].chengysbh='+record[i].chengysbh);
					params.push('list['+i+'].lingjbh='+record[i].lingjbh);
					params.push('list['+i+'].xuqsl='+record[i].xuqsl);
					params.push('list['+i+'].usercenter='+record[i].usercenter);
					params.push('list['+i+'].kaissj='+record[i].kaissj);
					params.push('list['+i+'].jiessj='+record[i].jiessj);
				}
				
				$.sdcui.ajaxUtil.ajax({
		            url:"compute.ajax",//请求url
		            data:params.join('&'),
		           	success:function (result){
		           		$('#form_sreachCkxXiehztxqgj').dialog('close');
						$('#form_sreachCkxXiehztxqgj').form('clear');
						$('#grid_CkxSonghpc').grid('reload');//刷新表格数据	
					}
		     	});
			}
			
		</script>
</t:html>