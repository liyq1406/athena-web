<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%
String welcome = (String)request.getSession().getAttribute("zbcZxc");
%>
<c:set var="role" value="<%=welcome %>"/>
<t:html title="${i18n.lingjxhd}">

<!-- 
	同步信息
	 @author CSY
	 @date 2016-03-18
 -->

<head>
	<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 100px; } </style>
</head>
<t:page i18n="i18n.ckx.xuqjs.i18n_lingjxhd" >
	<t:grid id="grid_tongbxx" caption="同步信息" 
		src="/xuqjs/queryTongbxx.ajax"
		idKeys="usercenter,lingjbh,xiaohdbh"  
		load="false" 
		dataFormId="form_tongbxx"
		back="NOT"
		editable="NOT" 
		showNum="true"
		add="NOT"
		remove="NOT"
		afterSaveRowsEvent="afterSaveRows"
		scrollHeight="335" 
		pageSize="15"
		>
		<t:fieldLayout id="tongbxx" prefix="tongbxx" columns="3">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${usercenter}" width="140" />
			<t:fieldText property="lingjbh" caption="${i18n.lingjbh}" dataType="text" maxLength="10" minLength="10" width="140" />
			<t:fieldText property="xiaohdbh" caption="消耗点编号" dataType="text" maxLength="9" minLength="9"  width="140"/>
			<t:fieldText property="peislxbh" caption="配送类型" dataType="text" maxLength="4" minLength="4"  width="140"/>
			<t:fieldText property="shengcxbh" caption="生产线编号" dataType="text" maxLength="5" minLength="5"  width="140"/>
			<t:fieldText property="fenpqbh" caption="分配循环编号" dataType="text" maxLength="5" minLength="5"  width="140"/>
			<t:fieldSelect property="biaos" caption="${i18n.biaos}" convert="biaos"  defaultValue="1" width="140"/>
		</t:fieldLayout>
		
		<t:button caption="${i18n.mobxz}" name="mobxz" active="0"/>
		
		<t:gridCol property="usercenter" caption="${i18n.usercenter}"  convert="queryUserCenterMap"  editorOptions="{'notNull':true}"/>
		<t:gridCol property="lingjbh" caption="${i18n.lingjbh}"  editorOptions="{'maxLength':'10','minLength':'10','dataType':'text','notNull':true}"/>
		<t:gridCol property="xiaohdbh" caption="${i18n.xiaohdbh}" editorOptions="{'maxLength':'9','minLength':'9','dataType':'text','notNull':true}"/>
		<t:gridCol property="peislxbh" caption="配送类型" width="90" editorOptions="{'maxLength':'4','minLength':'4','dataType':'text'}"/>
		<t:gridCol property="qianhcbs" caption="前后车标识" convert="qianhcbs"/>	
		<t:gridCol property="jipbzwz" caption="集配包装位置" width="100"  editorOptions="{'maxLength':'2','minLength':'2','dataType':'text'}"/>
		<t:gridCol property="pdsbz" caption="${i18n.pdsbz}" convert="pdsbz"/>
		<t:gridCol property="shengcxbh" caption="生产线编号" width="100"  editorOptions="{'maxLength':'5','dataType':'text'}"/>
		<t:gridCol property="fenpqbh" caption="分配循环编号" width="100"  editorOptions="{'maxLength':'10','dataType':'text'}"/>
		<t:gridCol property="biaos" caption="${i18n.biaos}" convert="biaos" editorOptions="{'notNull':true}" width="53"/>
		<t:gridCol property="" caption="" width="15"></t:gridCol>
   </t:grid>	
   
   <t:form dialog="true" id="form_tongbxx" caption="同步信息" action="/xuqjs/saveTongbxx.ajax" width="660" 
		idKeys="usercenter,lingjbh,xiaohdbh" reset="NOT">
		<t:fieldLayout id="ljxhd" prefix="record" columns="3">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${usercenter}" notNull="true" width="120"/>
			<t:fieldText property="lingjbh" caption="${i18n.lingjbh}" dataType="text" maxLength="10" minLength="10" notNull="true" width="120"/>
			<t:fieldText property="xiaohdbh" caption="${i18n.xiaohdbh}" dataType="text" maxLength="9" minLength="9" notNull="true" width="120"/>
			<t:fieldText property="peislxbh" caption="${i18n.peislxbh}" dataType="text" maxLength="4" minLength="4"  width="120" />
			<t:fieldSelect property="qianhcbs" caption="${i18n.qianhcbs}" convert="qianhcbs" width="120" />
			<t:fieldText property="jipbzwz" caption="${i18n.jipbzwz}" dataType="text" maxLength="2" width="120" />
			<t:fieldSelect property="pdsbz" caption="${i18n.pdsbz}" convert="pdsbz" readonly="true" width="120"/>
		</t:fieldLayout>
	</t:form>
	<c:if test="${ 'ZBC' == role }">
		<t:file action="/xuqjs/importAth_uploadTongbxx.do" size="50">
			<t:fileparam sheet="jipxx" keys="USERCENTER,LINGJBH,XIAOHDBH"
				table="{dbSchemal3}CKX_LINGJXHD" datasourceId="1" />
		</t:file>
	</c:if>
</t:page>


<script type="text/javascript">
		function initPage(){
			$("#record_peislxbh input").blur(function() {
				var peislxbh = trim($("#record_peislxbh").fieldValue());
				if("" != peislxbh && undefined != peislxbh && null != peislxbh){
					$("#record_pdsbz").fieldValue("1");
				}else{
					$("#record_pdsbz").fieldValue("");
				}
				return true;
			});
		}
		
		//空格查询
		function grid_tongbxx_beforeSubmit() {
			$("#tongbxx_lingjbh").fieldValue(trim($("#tongbxx_lingjbh").fieldValue()));
			$("#tongbxx_xiaohdbh").fieldValue(trim($("#tongbxx_xiaohdbh").fieldValue()));
			$("#tongbxx_peislxbh").fieldValue(trim($("#tongbxx_peislxbh").fieldValue()));
		}
		
		
		//前后车标识
		$.sdcui.serverConfig.convertArray['qianhcbs'] = {
			'-1' : '${i18n.qianc}',
			'0' : '${i18n.dangqc}'
		};
		
		//PDS拆分标志
		$.sdcui.serverConfig.convertArray['pdsbz'] = {
			'1' : '${i18n.tongb}',
			'2' : '${i18n.jip}',
			'3' : '${i18n.anx}'
		};
		
		//标识
		$.sdcui.serverConfig.convertArray['biaos'] = {
			'1' : '${i18n.youx}',
			'0' : '${i18n.wux}',
			'2' : '${i18n.xinj}'
		};
		
		
		//修改按钮
		function func_button_edit() {
			
			$('#form_tongbxx').form("clear");//清除弹出窗口的数据
			
			$('#form_tongbxx').removeClass('operant-add');//增加的operant为1，修改的operant为2
			
			var record = $("#grid_tongbxx").grid("getSelectedRecords")[0];//选中的行的数据
			//var param = jQuery.param(record);   //转化成//a[one]=1&a[two]=2&a[three]=3&b[]=1&b[]=2&b[]=3格式
// 			$.sdcui.ajaxUtil.ajax({
// 				url : "../xuqjs/getLingjxhd.ajax",
// 				data:param,
// 				success : function(result) {
// 					var record = {} ;
// 					record.usercenter = '${usercenter}';   
// 					$('#form_tongbxx').form('fillRecord', $.extend({}, record));
// 					var r = result.result ;
// 					$('#form_tongbxx').form('fillRecord', $.extend({}, r));
// 					$("#form_tongbxx").form("open","修改");
// 				}
// 			});
 					$('#form_tongbxx').form('fillRecord', $.extend({}, record));
 					$("#form_tongbxx").form("open","修改");
		}
		//保存按钮
		function func_button_save() {
			if($("#grid_tongbxx").grid("isEditedCell")){
				$('#grid_tongbxx').grid('saveRows');
			}
		}
		
		//行编辑保存后的方法
		function afterSaveRows(result){
			if(false == result.success){
				return false;
			}
			return true;
		}
		
		//导出模板
		function func_button_mobxz(){
			
			$.sdcui.pageUtils.goPage({
				url : '../xuqjs/downloadJipxxdMob.do',
				mode : 'form',
				beforeSubmit : function(){
					return true;
				}
		   });
		}
	</script>
</t:html>