<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="biaos" value="1" />
<t:html title="${i18n.gongyxhd}">
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<!-- 
	 工艺消耗点
	 @author denggq
	 @date 2012-3-26
 -->
 
<head>
	
	<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 95px; } 
	
/* 	#grid_gongyxhd  .grid-footer   .pRemoveRow{ */
/* 				display: none; */
/* 			} */
	</style>
</head>

<t:page i18n="i18n.ckx.xuqjs.i18n_gongyxhd" >
	<t:grid id="grid_gongyxhd" caption="${i18n.gongyxhd}" 
		idKeys="gongyxhd" 
		src="/xuqjs/queryGongyxhd.ajax"
		saveRowsSrcs="/xuqjs/saveGongyxhd.ajax"
		load="false"  add="NOT"  edit="NOT"  remove="NOT" editable="true"  showNum="true" back="NOT"
		showEditorAddName="editorAdd" showEditorRemoveName="editorRemove"
	    afterSaveRowsEvent="afterSaveRows" scrollHeight="335" pageSize="15">
		 
		<t:fieldLayout id="layout" prefix="gongyxhd" columns="4">
			<t:fieldText property="gongyxhd" caption="${i18n.gongyxhd}" dataType="text" maxLength="9" width="100"/>
			<t:fieldText property="shengcxbh" caption="生产线编号" dataType="text" maxLength="5" width="100"/>
			<t:fieldSelect property="gongybs" caption="${i18n.gongybs}" convert="gongybs"  width="100"/>
			<t:fieldSelect property="biaos" caption="${i18n.biaos}" convert="biaos"  width="100"/>
		</t:fieldLayout>
		
		<t:button caption="${i18n.invalidate}" name="shix" active="1" ></t:button>
		<t:button caption="导出" name="download" ></t:button>
		<%-- <t:button caption="${i18n.save }" name="save" ></t:button> --%>
		<t:button caption="下载模板" name="mobxz" ></t:button>
		
		<t:gridCol property="gongyxhd" editor="fieldText" caption="${i18n.gongyxhd}" width="85" 
			editorOptions="{'maxLength':'9','minLength':'9','dataType':'text','notNull':true}"/>
		<t:gridCol property="chessl" editor="fieldText" caption="${i18n.chessl}" width="145" 
			editorOptions="{'expression':'^[1-9][0-9]{0,2}$|^0$','expressionMessage':'${i18n.chessl_ex_mes}','notNull':true}"/>
		<t:gridCol property="pianysj" caption="${i18n.pianysj}" width="130" 
			editorOptions="{'expression':'^[1-9][0-9]{0,3}$|^0$','expressionMessage':'${i18n.pianysj_ex_mes}','notNull':true}"/>
		
		<t:gridCol property="gongybs" caption="${i18n.gongybs}" convert="gongybs" />
		<t:gridCol property="shengcxbh" caption="生产线编号" width="100" 
		editorOptions="{'dataType':'text','maxLength':'5','minLength':'5','notNull':true}"/>
		<t:gridCol property="biaos"  caption="${i18n.biaos}" convert="biaos"  width="200" defaultValue="1"/>
		<t:gridCol property="liush" caption="${i18n.liush}" width="150" />
		<t:gridCol property="ycbiaos" caption="隐藏标识" convert="biaos" hidden="true" width="10"/>
		<t:gridCol property="jiep" caption="隐藏产线节拍"  hidden="true" width="10"/>
		<t:gridCol property="" caption="" width="20"/>	
	</t:grid>
<!-- 	<form id="form_daorwj" name="form_daorwj"  enctype='multipart/form-data' method="post"  target="hiddenUp"> -->
<!-- 			<table> -->
<!-- 					<tr> -->
<!-- 					    <td style="text-align:right;"> -->
<!-- 					    	导入文件： -->
<!-- 					    </td> -->
<!-- 					    <td width="310px"> -->
<%-- 					        <t:fieldLayout columns="1" id="drdbsq" prefix="drdbsq"  showLabel="导入文件："> --%>
<%-- 					            <t:fieldFile property="file" caption="${i18n.drwj}"  > --%>
<%-- 					            </t:fieldFile> --%>
<%-- 				            </t:fieldLayout> --%>
<!-- 					    </td> -->
<!-- 						<td> -->
<%-- 							<t:buttons id="excel_submits"> --%>
<%-- 								<t:button caption="导入" name="importExcel"></t:button> --%>
<%-- 								<t:button caption="重置" name="resetExcel"></t:button> --%>
<%-- 								<t:button caption="下载模板" name="mobxz" ></t:button> --%>
<%-- 							</t:buttons> --%>
<!-- 						</td> -->
						
<!-- 					</tr> -->
<!-- 			</table> -->
     
<!-- 	</form> -->
<!-- 	<iframe name="hiddenUp" id="hiddenUp" style="display: none;"></iframe> -->
    <t:file action="/xuqjs/importAth_uploadGongyxhd.do" size="50">
		<t:fileparam sheet="gongyxhd" keys="GONGYXHD" table="{dbSchemal3}CKX_GONGYXHD" datasourceId="1"/>
	</t:file>
	<div><font color="red">导入结果不能大于5000条,否则为空</font></div>
</t:page>

<script type="text/javascript">

	//标识
	$.sdcui.serverConfig.convertArray['biaos'] = {
		'1' : '${i18n.youx}',
		'0' : '${i18n.wux}',
		'2' : '${i18n.xinj}'
	};
	
	//工艺标识
	$.sdcui.serverConfig.convertArray['gongybs'] = {
		'1' : '${i18n.youx}',
		'0' : '${i18n.wux}'
	};

	//空格查询
	function grid_gongyxhd_beforeSubmit() {
		$("#gongyxhd_gongyxhd").fieldValue(trim($("#gongyxhd_gongyxhd").fieldValue()));
		$("#gongyxhd_liush").fieldValue(trim($("#gongyxhd_liush").fieldValue()));
	}
	
	
	//保存按钮
	/* function func_button_save() {
		$('#grid_gongyxhd').grid('saveRows');
	} */
	
	//行编辑保存后的方法
	function afterSaveRows(result){
// 		if(typeof result.success=="undefined"||result.success!==false){
// 			$('#grid_gongyxhd').grid('reload');//刷新表格数据
// 		}
		 if(false == result.success && typeof result.success !="undefined"){
			return false;
		}
		return true; 
	}
	
	//失效按钮
	function func_button_shix() {
		if(confirm("${i18n.quersx}")){
			
			var record = $("#grid_gongyxhd").grid("getSelectedRecords")[0];//选中的行的数据
			
			var params = [];
			params.push("gongyxhd="+record.gongyxhd);	//用户中心
			
			if ( '0' == record.biaos ) {
				alert("${i18n.shujysx}");
			} else {
				
// 				if('1' == record.gongybs){//工艺标识有效,不能失效
// 					alert("${i18n.bunsx}");
// 				}else{
					$.sdcui.ajaxUtil.ajax({
						url : "../xuqjs/removeGongyxhd.ajax",
						data : params.join('&'),
						success : function(result) {
				 	    	$("#grid_gongyxhd").grid("reload");
						}
					});
// 				}
			}
			
		}
	}
	
	//导出按钮
	function func_button_download(){
		var gongyxhd = trim($('#gongyxhd_gongyxhd').fieldValue());
		var liush = trim($("#gongyxhd_liush").fieldValue());
		var gongybs = trim($('#gongyxhd_gongybs').fieldValue());
		var biaos = $('#gongyxhd_biaos').fieldValue();
		
		var record = {'gongyxhd':gongyxhd,'liush':liush,'gongybs':gongybs,'biaos':biaos};
		
		$.sdcui.pageUtils.goPage({
			url : '../xuqjs/downloadGongyxhd.do',
			record : record,
			mode : 'form',
			beforeSubmit : function(){
				return true;
			}
	   });
	}
	
	
	//导出模板
	function func_button_mobxz(){
		
		$.sdcui.pageUtils.goPage({
			url : '../xuqjs/downloadGongyxhdMob.do',
			mode : 'form',
			beforeSubmit : function(){
				return true;
			}
	   });
	}
	
	
	//导入excel
	function func_button_importExcel()
	{
		var form = document.forms["form_daorwj"];
		var file = form["file"];
		var fvalue = file.value;
		if (fvalue.length > 0) 
		{
			// 寻找表单域中的 <input type="file" ... /> 标签
			if (fvalue.lastIndexOf('xls')!= (fvalue.length - 3)) 
			{
				alert("只能导入excel文件,后缀名为:xls!");
				return false;
			}
            form.action = '../xuqjs/uploadGongyxhd.do';
			form.submit();
            $("#button_importExcel").addClass("disabled");
		} 
		else 
		{
			alert("请选择导入文件!");
			return false;
		}
	}
	
	 
	//重置    
	function func_button_resetExcel()
	{
		var objFile=document.getElementsByName('file')[0]; 
		objFile.outerHTML=objFile.outerHTML.replace(/(value=\").+\"/i,"$1\"");
	} 
	
	//提示语句
	function callback(msg) 
	{
		alert(msg);
		$("#button_importExcel").removeClass("disabled");
	}
	
			//提示语句
	function callbackdow(msg,name) 
	{
		alert(msg);
		$.sdcui.pageUtils.goPage({
			url : '../xuqjs/errdownLoad.do?name='+name,
			mode : 'form',
			beforeSubmit : function(){
				return true;
			}
	   });
	}
	//标识有效时获取产线及产线的节拍
	/* function func_set_biaos() {
		var  cell = this.col.cell;
		var rowElement = cell.parent('tr:first');
		
		var gongyxhdIndex = $('td.gongyxhd:first').prevAll().length;
		var biaosIndex = $('td.biaos:first').prevAll().length;
		var ycbiaosIndex = $('td.ycbiaos:first').prevAll().length;
		var shengcxbhIndex = $('td.shengcxbh:first').prevAll().length;
		var jiepIndex = $('td.jiep:first').prevAll().length;
		
		var gongyxhdStr = rowElement.find('td:eq('+gongyxhdIndex+')').text();//消耗点编号
		var biaosStr = rowElement.find('td:eq('+biaosIndex+')').text();//标识
		var ycbiaosStr = rowElement.find('td:eq('+ycbiaosIndex+')').text();//隐藏标识
		
	    	
	      if(ycbiaosStr!=biaosStr&&'有效'==biaosStr){
	    	  if(gongyxhdStr==null||gongyxhdStr==""||gongyxhdStr.length<9){
		    		alert("请正确填写消耗点编号");
		    		return;
		    	}
	    	  
	    	  $.sdcui.ajaxUtil.ajax({
		 	 	   url:"${ctx}/xuqjs/yanzscxbh.ajax?gongyxhd="+gongyxhdStr,
		 	       success:function (result){
		 	           if(result.messages == undefined){
		 	        	  if(result.result== null){
			 	        	 	alert("不存在生产线编号或已失效");
			 	        	 	rowElement.find('td:eq('+biaosIndex+')').text(ycbiaosStr);
			 	        	 	return false;
			 	            }else{
			 	        	 	rowElement.find('td:eq('+shengcxbhIndex+')').text(result.result.shengcxbh);//生产线编号
			 	        	 	rowElement.find('td:eq('+jiepIndex+')').text(result.result.shengcjp);//生产节拍(隐藏)
			 	        	 	alert(result.result.shengcjp);
			 	            }
			 	 	      
		 	           }else{
		 	        	   alert(result.messages);
		 	        	   rowElement.find('td:eq('+biaosIndex+')').text(ycbiaosStr);
		 	        	   return false;
		 	           }
	    	  }
		           });
	      }
	} */
	
</script>

</t:html>