<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="${i18n.chanxz }">
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>

</head>
<t:page i18n="i18n.ckx.paicfj.i18n_shengcxlingj">

		<t:grid id="grid_ckx_shengcx_lingj"
			caption="${i18n.shengcx }-${i18n.lingj }"
			idKeys="usercenter,lingjbh,shengcxbh"
			src="/paicfj/queryCkx_shengcx_lingj.ajax"
			saveRowsSrcs="/paicfj/saveCkx_shengcx_lingj.ajax"
			dataFormId="form_shengcx_lingj" showNum="true"
			 load="false" editable="true"
			 showEditorAddName="editorAdd" showEditorRemoveName="editorRemove"
			 afterSaveRowsEvent="afterSaveRows"
			 >
			<t:fieldLayout id="kehbs" prefix="khbs" columns="2">
				<t:fieldSelect property="usercenter" caption="${i18n.usercenter }" 
					convert="queryUserCenterMap" defaultValue="${loginUsercenter }"/>
				<t:fieldText property="shengcxbh" caption="${i18n.shengcxbh }" maxLength="5" minLength="5" dataType="text"/>
				<t:fieldText property="lingjbh" caption="${i18n.lingjbh }" maxLength="10"  dataType="text"/>
				<t:fieldSelect property="shifqyjjpl" caption="${i18n.qiyjjpl }"
					convert="shifqyjjpl"  />
			</t:fieldLayout>
			<t:gridCol property="usercenter" caption="${i18n.usercenter }" editor="fieldSelect" 
				convert="queryUserCenterMap" defaultValue="${loginUsercenter }"></t:gridCol>
			<t:gridCol property="shengcxbh" caption="${i18n.shengcxbh }" editor="fieldText"
			editorOptions="{'maxLength':'5','minLength':'5','notNull':true,'dataType':'text'}"
			></t:gridCol>
			<t:gridCol property="lingjbh" caption="${i18n.lingjbh }" editor="fieldText"
			editorOptions="{'notNull':true,'maxLength':'10'}"
			></t:gridCol>
				<t:gridCol property="zhizlx" caption="${i18n.zhizlx }" editor="fieldSelect" 
			 convert="queryZZLX"
			></t:gridCol>
			<t:gridCol property="cangkbh" caption="${i18n.cangkbh }" editor="fieldText" 
			editorOptions="{'maxLength':'3','notNull':true,'dataType':'text'}"
			></t:gridCol>  
			<t:gridCol property="zhuxfx" caption="${i18n.chanxyxj}"  editor="fieldSelect" editorOptions="{'notNull':true}" convert="zhuxfx"></t:gridCol>
			<%-- <t:gridCol property="shengcbl" caption="${i18n.shengcbl }%" editor="fieldText" 
			editorOptions="{'notNull':true,'expression':'^([1-9][0-9]?|100)$','expressionMessage':'0-100之间的整数'}"
			></t:gridCol> --%>
			<%-- <t:gridCol property="shengcjp" caption="${i18n.shengcjp }" editor="fieldText" 
			editorOptions="{'dataType':'integer','maxLength':'3'}"></t:gridCol> --%>
			<t:gridCol property="shifqyjjpl" width="125" caption="${i18n.shifqyjjpl }"
				convert="shifqyjjpl" editor="fieldSelect" editorOptions="{'notNull':true}"></t:gridCol>
			<t:gridCol property="jingjpl" caption="${i18n.jingjpl }" editor="fieldText" 
			editorOptions="{'expression':'^(0|[1-9][0-9]{0,8})$','expressionMessage':'请输入正整数类型',notNull:true}"
			></t:gridCol>
			<t:gridCol property="youxbc" caption="${i18n.youxbc }"
				convert="youxbc" editor="fieldSelect" editorOptions="{'notNull':true}"></t:gridCol>
			<t:gridCol property="lingjlx" caption="${i18n.lingjlx }"
			convert="lingjlx" editor="fieldSelect"></t:gridCol>
			<t:gridCol property="shengcbl" caption="${i18n.shengcbl }" editor="fieldText" 
			editorOptions="{'expression':'^(0|100|[1-9][0-9]?)$','expressionMessage':'只能输入0-100之间的整数'}">
			</t:gridCol>
			<t:gridCol property="a" caption="   "></t:gridCol>
				
			<t:button caption="${i18n.mobxz }" name="mobxz" active="0"/>
		</t:grid>
		<t:file action="shengcx_lingj_upload.do" >
			<t:fileparam sheet="shengcx_lingj" keys="usercenter,lingjbh,shengcxbh" table="{dbSchemal3}ckx_shengcx_lingj" datasourceId="1" ></t:fileparam>
		</t:file>
<%-- 		<t:form id="form_d" action="/paicfj/FileUpload.do" method="post" reset="NOT" submit="NOT" --%>
<!-- 			caption="数据导入"> -->
<%-- 			<t:fieldLayout> --%>
<%-- 				<t:fieldFile property="file" caption="请选择文件"></t:fieldFile> --%>
<%-- 			</t:fieldLayout> --%>
			
<%-- 			<t:button caption="模板下载" name="btn"></t:button> --%>
<!-- 			<input type="submit" value="上传"  name="btnss" /> -->
<!-- 						<input type="button" value="模板下载"  onclick="down()" /> -->
<%-- 		</t:form> --%>



<%-- 	<t:form dialog="true" caption="${i18n.shengcx }-${i18n.lingj }" --%>
<!-- 		id="form_shengcx_lingj" action="/paicfj/saveCkx_shengcx_lingj.ajax" -->
<!-- 		height="250" width="600"> -->
<%-- 		<t:fieldLayout prefix="shengcx_lingj" columns="2"> --%>
<%-- 			<t:fieldSelect property="usercenter" caption="${i18n.usercenter }" --%>
<!-- 				notNull="true" convert="queryUserCenterMap" /> -->
<%-- 			<t:fieldSelect property="shengcxbh" caption="${i18n.shengcxbh }" --%>
<!-- 				src="/paicfj/listCkx_shengcx.ajax" code="shengcxbh" show="shengcxbh" -->
<!-- 				parents="usercenter" parentsAlias="usercenter" notNull="true" /> -->
<%-- 			<t:fieldSelect property="lingjbh" caption="${i18n.lingjbh }" --%>
<!-- 				notNull="true" src="../xuqjs/listCkx_lingj.ajax" show="zhongwmc" -->
<!-- 				code="lingjbh" parents="usercenter" /> -->
<%-- 			<t:fieldText property="shengcbl" caption="${i18n.shengcbl }%" --%>
<!-- 				expression="^([1-9][0-9]?|100|0)$" expressionMessage="0-100之间的整数" /> -->
<%-- 			<t:fieldText property="shengcjp" caption="${i18n.shengcjp }" --%>
<!-- 				maxLength="3" dataType="integer" /> -->
<%-- 			<t:fieldSelect property="shifqyjjpl" caption="${i18n.shifqyjjpl }" --%>
<!-- 				convert="shifqyjjpl" /> -->
<%-- 			<t:fieldText property="jingjpl" caption="${i18n.jingjpl }" --%>
<!-- 				maxLength="9" dataType="integer" /> -->
<%-- 			<t:fieldSelect property="youxbc" caption="${i18n.youxbc }" --%>
<!-- 				convert="youxbc" /> -->
<%-- 		</t:fieldLayout> --%>
<%-- 	</t:form> --%>

</t:page>
</t:html>
<script type="text/javascript">
	$.sdcui.serverConfig.convertArray['shifqyjjpl'] = {
		'0' : '${i18n.n }',
		'1' : '${i18n.y }'  
	};
	$.sdcui.serverConfig.convertArray['zhuxfx'] = {
			'0' : '${i18n.youxj}0',
			'1' : '${i18n.youxj}1',
			'2' : '${i18n.youxj}2',
			'3' : '${i18n.youxj}3',
			'4' : '${i18n.youxj}4',
			'5' : '${i18n.youxj}5'
		};
	
	$.sdcui.serverConfig.convertArray['youxbc'] = {
// 		'A' : 'A${i18n.ban }',
		'B' : 'B${i18n.ban }',
		'C' : 'C${i18n.ban }'
	};
	$.sdcui.serverConfig.convertArray['lingjlx'] = {
		'L' : '${i18n.L }',
		'R' : '${i18n.R }'
	};
	$(document).ready(function() {
		// 		$("#form_shengcx_lingj").find("input[name='shengcxbh']").bind("click",function (){
		// 				if(""==$("#shengcx_lingj_usercenter").fieldValue()){
		// 					alert("请先选择用户中心");
		// 				}
		// 			});

	});

// 	function func_button_edit() {
// 		$('#form_shengcx_lingj').removeClass('operant-add');
// 		var record = $("#grid_ckx_shengcx_lingj").grid("getSelectedRecords")[0];
// 		$('#form_shengcx_lingj').form('fillRecord', $.extend({}, record));
// 		$("#form_shengcx_lingj").form("open");
// 	}
	function func_button_save() {
		$("#grid_ckx_shengcx_lingj").grid("saveRows");
	}
// 	function func_button_btn() {
// 		window.location = "${ctx}/paicfj/FileUpload.do?method=doGet&fileName=产线-零件.xls";
// 	}
	//导出模板
	function func_button_mobxz(){	
		var usercenter = trim($('#khbs_usercenter').fieldValue());
		var shengcxbh = trim($('#khbs_shengcxbh').fieldValue());
		var lingjbh = trim($('#khbs_lingjbh').fieldValue());
		var shifqyjjpl= trim($('#khbs_shifqyjjpl').fieldValue());
		var record = {'usercenter':usercenter,'lingjbh':lingjbh,'shengcxbh':shengcxbh,'shifqyjjpl':shifqyjjpl};
		
		$.sdcui.pageUtils.goPage({
			url : '../paicfj/downloadMob_shengcx.do',
			mode : 'form',
			record : record,
			beforeSubmit : function(){
				return true;
			}
	   });
	}
	
</script>
