<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.tongbjplj}">

<!-- 
	   同步集配零件分类
	 @author qizhongtao
	 @date 2012-4-11
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 70px; } </style>

</head>
	<t:page i18n="i18n.ckx.xuqjs.i18n_tongbjplj">
		<t:grid id="grid_tongbjplj" caption="${i18n.tongbjplj}" idKeys="usercenter,lingjbh,shengcxbh,nclass" load="false" remove="NOT" back="NOT"  scrollHeight="318" pageSize="15"
			src="/xuqjs/queryTongbjplj.ajax"  editable="true" showNum="true" saveRowsSrcs="/xuqjs/saveTongbjplj.ajax" 
			showEditorAddName="editorAdd" showEditorRemoveName="editorRemove" afterSaveRowsEvent="afterSaveRows" exportXls="true">
			<t:fieldLayout id="fl_tongbjplj" prefix="tongbjplj" columns="4">
				<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${usercenter}" width="110"/>
				<t:fieldText property="lingjbh" caption="${i18n.lingjbh}" dataType="text" maxLength="10" minLength="10" width="110"/>
				<t:fieldText property="shengcxbh" caption="${i18n.shengcxbh}" dataType="text" maxLength="5" minLength="5" width="110"/>
				<t:fieldText property="peislx" caption="${i18n.peislx}" dataType="text" maxLength="4" width="110"/>
			</t:fieldLayout>
			<t:button caption="下载模板" name="mobxz" ></t:button>
			<t:gridCol property="usercenter"  caption="${i18n.usercenter}"  convert="queryUserCenterMap" defaultValue="${usercenter}" editor="fieldSelect" editorOptions="{'notNull':true}"></t:gridCol>
			<t:gridCol property="lingjbh"  caption="${i18n.lingjbh}" editor="fieldText" editorOptions="{'notNull':true,'maxLength':'10','minLength':'10','dataType':'text',closeEvent:searchLjmc}" ></t:gridCol>
			<t:gridCol property="lingjmc" caption="${i18n.lingjmc}" ></t:gridCol>
			<t:gridCol property="shengcxbh"  caption="${i18n.shengcxbh}" editor="fieldText" editorOptions="{'notNull':true,'maxLength':'5','minLength':'5','dataType':'text'}"></t:gridCol>
			<t:gridCol property="nclass" caption="${i18n.nclass}" editor="fieldText" editorOptions="{'notNull':true,'maxLength':'4','dataType':'text'}"></t:gridCol>
			<t:gridCol property="nvalue" caption="${i18n.nvalue}" editor="fieldText" editorOptions="{'maxLength':'3','dataType':'text'}"></t:gridCol>
			<t:gridCol property="peislx" caption="${i18n.peislx}" editor="fieldText" editorOptions="{'maxLength':'4','dataType':'text','notNull':true}"></t:gridCol>
			<t:gridCol property="qianhcbs" caption="${i18n.qianhcbs}" editor="fieldSelect" convert="qianhcbs"></t:gridCol>
			<t:gridCol property="jipbzwz" caption="${i18n.jipbzwz}" editor="fieldText" editorOptions="{'maxLength':'2','dataType':'text'}" width="120"></t:gridCol>
			<t:gridCol property="" caption=""/>
		</t:grid>
		<t:file action="/xuqjs/uploadCkxctongbjplj.do" size="50">
		<t:fileparam sheet="tongbjplj" keys="USERCENTER,LINGJBH,SHENGCXBH,NCLASS" table="{dbSchemal3}CKX_TONGBJPLJ" datasourceId="1"/>
	    </t:file>
	    <div><font color="red">导入结果不能大于5000条,否则为空</font></div>
	</t:page>
	

	<script type="text/javascript">
		
		//标识
		$.sdcui.serverConfig.convertArray['biaos'] = {
			'1' : '${i18n.youx}',
			'0' : '${i18n.wux}'
		};
		
		
		//前后车标识
		$.sdcui.serverConfig.convertArray['qianhcbs'] = {
			'-1' : '${i18n.qianc}',
			'0' : '${i18n.dangqc}'
		};
		
		//空格查询
		function grid_tongbjplj_beforeSubmit() {
			$("#tongbjplj_lingjbh").fieldValue(trim($("#tongbjplj_lingjbh").fieldValue()));
			$("#tongbjplj_shengcxbh").fieldValue(trim($("#tongbjplj_shengcxbh").fieldValue()));
			$("#tongbjplj_peislx").fieldValue(trim($("#tongbjplj_peislx").fieldValue()));
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
				url : '../xuqjs/downloadTongbjpljMob.do',
				mode : 'form',
				beforeSubmit : function(){
					return true;
				}
		   });
		}
		
		//导出数据
		function func_button_download(){
			
			var usercenter = trim($('#tongbjplj_usercenter').fieldValue());
			var lingjbh = trim($("#tongbjplj_lingjbh").fieldValue());
			var shengcxbh = trim($('#tongbjplj_shengcxbh').fieldValue());
			var peislx = $('#tongbjplj_peislx').fieldValue();
			
			var record = {'usercenter':usercenter,'lingjbh':lingjbh,'shengcxbh':shengcxbh,'peislx':peislx};
			
			$.sdcui.pageUtils.goPage({
				url : '../xuqjs/downloadTongbjplj.do',
				record : record,
				mode : 'form',
				beforeSubmit : function(){
					return true;
				}
		   });
		}
		
		
   /*
	*查询零件名称
	*/
	function searchLjmc(){
		var  cell = this.col.cell;//获取当前列
		var rowElement = cell.parent('tr:first');
		var usercenterIndex = $('td.usercenter:first').prevAll().length;//遍历用户中心下标
		var lingjbhIndex = $('td.lingjbh:first').prevAll().length;//遍历零件编号下标
		var lingjmcIndex = $('td.lingjmc:first').prevAll().length;//遍历零件名称下标
		var lingjbh = rowElement.find('td:eq('+lingjbhIndex+')').text();//获取零件编号输入值
		var usercenter = rowElement.find('td:eq('+usercenterIndex+')').text();//获取用户中心输入值
		//拼接数据
		var params = [];
		params.push('lingjbh='+lingjbh);
		params.push('usercenter='+usercenter);
		//请求后台
		$.sdcui.ajaxUtil.ajax({ 
             url:"${ctx}/xuqjs/getLingjmc.ajax",//请求url
             data:params.join('&'),
            	success:function (result){
            		rowElement.find('td:eq('+lingjmcIndex+')').text(result.lingjmc);//为零件名称赋值
            		
             }
     	});
	}
	</script>
</t:html>











