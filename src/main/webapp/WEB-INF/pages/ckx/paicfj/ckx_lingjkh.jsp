<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="${i18n.chanxz }">
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css">
#grid_ckx_lingjkh .youi-fieldLayout table td.contral.label-col {
	width: 70px;
}

#form_lingjkh .youi-fieldLayout table td.contral.label-col {
	width: 90px;
}
</style>
</head>
<t:page i18n="i18n.ckx.paicfj.i18n_lingjkh">

	<t:grid id="grid_ckx_lingjkh" caption="${i18n.lingjkh }"
		idKeys="usercenter,lingjbh,kehbh,chengysbh,shengxrq,shixrq,kehljmc,ucljsl"
		removeSrc="/paicfj/removeCkx_lingjkh.ajax"
		src="/paicfj/queryCkx_lingjkh.ajax" dataFormId="form_lingjkh"
		load="false" showNum="true">
		<t:fieldLayout id="lingjkh" prefix="lingjkh" columns="3">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter }"
				convert="queryUserCenterMap" defaultValue="${loginUsercenter }" />
			<t:fieldText property="lingjbh" caption="${i18n.lingjbh }"
				maxLength="10" />
			<t:fieldText property="kehbh" caption="${i18n.kehbh }" maxLength="10" />
			<t:fieldText property="kehljh" caption="${i18n.kehljh }"
				maxLength="20" dataType="text"></t:fieldText>
			<t:fieldText property="fahzt" caption="${i18n.fahzt }" maxLength="10" />
		</t:fieldLayout>
		<t:gridCol property="usercenter" caption="${i18n.usercenter }"
			convert="queryUserCenterMap" defaultValue="${loginUsercenter }"></t:gridCol>
		<t:gridCol property="lingjbh" caption="${i18n.lingjbh }"></t:gridCol>

		<t:gridCol property="kehbh" caption="${i18n.kehbh }"></t:gridCol>

		<t:gridCol property="kehljh" caption="${i18n.kehljh }"></t:gridCol>
		<%-- 			<t:gridCol property="kehljmc" caption="${i18n.kehljmc }"></t:gridCol> --%>
		<t:gridCol property="fahzt" caption="${i18n.fahzt }"></t:gridCol>
		<t:gridCol property="uabaoz" caption="${i18n.lingjbzua }"></t:gridCol>
		<t:gridCol property="ualjsl" caption="${i18n.ualingjsl }"></t:gridCol>
		<t:gridCol property="ucbaoz" caption="${i18n.lingjbzuc }"></t:gridCol>
		<%-- 			<t:gridCol property="ucljsl" caption="${i18n.uclingjsl }"></t:gridCol> --%>

		<t:button caption="${i18n.mobxz }" name="mobxz" active="0" />

	</t:grid>
	<t:file action="../paicfj/lingjkh_upload.do">
		<t:fileparam sheet="lingjkh" keys="usercenter,lingjbh,kehbh"
			table="{dbSchemal3}ckx_lingjkh" dateColumns="shengxrq,shixrq"
			dateFormats="yyyy-MM-dd,yyyy-MM-dd" datasourceId="1"></t:fileparam>
	</t:file>
	<%-- 		<t:form id="form_s" action="/paicfj/FileUpload.do" method="post" reset="NOT" submit="NOT" --%>
	<!-- 			caption="数据导入"> -->
	<%-- 			<t:fieldLayout> --%>
	<%-- 				<t:fieldFile property="file" caption="请选择文件"></t:fieldFile> --%>
	<%-- 			</t:fieldLayout> --%>
	<%-- 			<t:button caption="模板下载" name="btn"></t:button> --%>
	<!-- 			<input type="submit" value="上传"   /> -->
	<!-- 						<input type="button" value="模板下载"  onclick="down()" /> -->
	<%-- 		</t:form> --%>

	<t:form id="form_lingjkh" dialog="true" caption="${i18n.lingjkh }"
		reset="NOT" action="/paicfj/saveCkx_lingjkh.ajax"
		idKeys="usercenter,kehbh,chengysbh,lingjbh">
		<t:fieldLayout columns="2" prefix="ljkh">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter }"
				readonly="true" convert="queryUserCenterMap"
				defaultValue="${loginUsercenter }" />
			<t:fieldText property="kehbh" caption="${i18n.kehbh }" notNull="true"
				maxLength="10" dataType="text"></t:fieldText>
			<t:fieldText property="lingjbh" caption="${i18n.lingjbh }"
				maxLength="10" dataType="text" notNull="true"></t:fieldText>
			<t:fieldText property="zhongwmc" caption="${i18n.zhongwmc }"
				readonly="true"></t:fieldText>
			<t:fieldText property="fawmc" caption="${i18n.fawmc }"
				readonly="true"></t:fieldText>
			<t:fieldText property="kehljh" caption="${i18n.kehljh }"
				notNull="true" maxLength="20" dataType="text"></t:fieldText>
			<t:fieldText property="kehljmc" caption="${i18n.kehljmc }"
				maxLength="20"></t:fieldText>
			<t:fieldText property="danw" caption="${i18n.danw }" readonly="true"></t:fieldText>
			<t:fieldText property="fahzt" caption="${i18n.fahzt }" maxLength="10"
				dataType="text"></t:fieldText>
			<t:fieldText property="uabaoz" maxLength="10" dataType="text"
				caption="${i18n.lingjbzua }"></t:fieldText>
			<t:fieldText property="ualjsl" caption="${i18n.ualingjsl }"
				maxLength="5" dataType="integer"></t:fieldText>
			<t:fieldText property="ucbaoz" caption="${i18n.lingjbzuc }"
				maxLength="10" dataType="text"></t:fieldText>
			<t:fieldText property="ucljsl" caption="${i18n.uclingjsl }"
				maxLength="5" dataType="integer"></t:fieldText>
			<t:fieldCalendar property="shengxrq" format="yyyy-MM-dd"
				caption="${i18n.shengxrq }" notNull="true"></t:fieldCalendar>
			<t:fieldCalendar property="shixrq" format="yyyy-MM-dd"
				caption="${i18n.shixrq }" notNull="true"></t:fieldCalendar>
		</t:fieldLayout>
	</t:form>



</t:page>
</t:html>
<script type="text/javascript">
	function func_button_save() {
		$("#grid_ckx_lingjkh").grid("saveRows");
	}
	function func_button_btn() {
		window.location = "${ctx}/paicfj/FileUpload.do?method=doGet&fileName=零件客户关系.xls";
	}
	function func_button_edit(){
		$("#form_lingjkh").form('clear');
		$('#form_lingjkh').removeClass('operant-add');
		var record = $("#grid_ckx_lingjkh").grid("getSelectedRecords")[0];
		$("#form_lingjkh").form('fillRecord', $.extend({}, record));
		$("#form_lingjkh").form("open","${i18n.update }");
		ljkh_lingjbh_func();
	}
	var flag=false;
	function ljkh_lingjbh_func(){
		if($("#ljkh_lingjbh").fieldValue()== undefined ||$("#ljkh_lingjbh").fieldValue()==null ||$("#ljkh_lingjbh").fieldValue()==""){
			alert("${i18n.qingtxljbh }");
			return false;
		}
		$.sdcui.ajaxUtil.ajax({
			url : "../xuqjs/getLingj.ajax?usercenter="+$("#ljkh_usercenter").fieldValue()+"&biaos=1&lingjbh="+$("#ljkh_lingjbh").fieldValue(),
// 			data : {
// 				usercenter : $("#ljkh_usercenter").fieldValue(),
// 				lingjbh : $("#ljkh_lingjbh").fieldValue()
// 			},
			success : function(result) {
				var lingj=result.result;
				if(null != lingj){
					$("#ljkh_zhongwmc").fieldValue(lingj.zhongwmc);
					$("#ljkh_fawmc").fieldValue(lingj.fawmc);
					$("#ljkh_danw").fieldValue(lingj.danw);
					flag=true;
				}else{
					alert("${i18n.bczlj }"+$("#ljkh_lingjbh").fieldValue());
				}
			}
		});
	}
	function form_lingjkh_beforeSubmit(){
		if(!flag){
			alert("${i18n.buczcljbh }");
		}
		return flag;
	}
	function initPage(){
		$("#ljkh_kehljmc input").blur(function() {
			var srcName = $("#ljkh_kehljmc").fieldValue();
			if (!checkCH(40, srcName)) {
				alert("${i18n.zuidcdw }40");
			}
		});
		$("#ljkh_lingjbh input").blur(function() {
			ljkh_lingjbh_func();
		});
	}
// 	$(document).ready(function() {
// 		$("#ljkh_kehljmc input").blur(function() {
// 			var srcName = $("#ljkh_kehljmc").fieldValue();
// 			if (!checkCH(40, srcName)) {
// 				alert("${i18n.zuidcdw }40");
// 			}
// 		});
// 		$("#ljkh_lingjbh input").blur(function() {
// 			ljkh_lingjbh_func();
// 		});
// 	});
	//导出模板
	function func_button_mobxz(){	
		var usercenter = trim($('#lingjkh_usercenter').fieldValue());
		var kehbh = trim($('#lingjkh_kehbh').fieldValue());
		var lingjbh = trim($('#lingjkh_lingjbh').fieldValue());
		var kehljh= trim($('#lingjkh_kehljh').fieldValue());
		var fahzt= trim($('#lingjkh_fahzt').fieldValue());
		var record = {'usercenter':usercenter,'lingjbh':lingjbh,'kehbh':kehbh,'fahzt':fahzt,'kehljh':kehljh};	
		$.sdcui.pageUtils.goPage({
			url : '../paicfj/downloadMob.do',
			mode : 'form',
			record : record,
			beforeSubmit : function(){
				return true;
			}
	   });
	}
</script>
