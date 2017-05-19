<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.kd_title}">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>



<t:page i18n="i18n.xqjs.kdmulubidui">

	<div  class="youi-panel">
    <div class="panel-header">
        <div>"${i18n.divTitle}"</div>
    </div>
    </div>
     <form id="upload" action="${ctx}/kdorder/insertMulu.do" method="post" enctype='multipart/form-data' style="background-color: white;" target="hiddenUp">
     		<div class="youi-field">
			<input name="file" type="file" id="file"/>
			</div>
			
			 <div class="youi-buttons" align="left">
				
			<table>
				<tbody>
				<!-- xss 0013156 -->
					<tr>
					<td>
							<div class="youi-button active-0" id = "button_mobxz">
								<div class="left">
									<div class="center">
										<a href="#" onclick="return mobxz()"> ${i18n.mobxz}  </a>
									</div>
								</div>
					    	</div>
					  </td>
					
					<td>
							<div class="youi-button active-0" id="button_insertMulu">
								<div class="right">
									<div class="center">
										<a href="#" onclick="return insertMulu()"> ${i18n.daoru} </a>
									</div>
								</div>
							</div></td>
							<td>
							<div class="youi-button active-0" id = "button_expert">
								<div class="right">
									<div class="center">
										<a href="#" onclick="return expert()"> ${i18n.daochu}  </a>
									</div>
								</div>
							</div></td>
							<td>
							<div class="youi-button active-0" id="button_equals">
								<div class="right">
									<div class="center">
										<a href="#" onclick="return equals()"> ${i18n.duibi}  </a>
									</div>
								</div>
							</div></td>
					</tr>
				</tbody>
			</table>
		</div>
		</form>
		<iframe name = "hiddenUp"  id = "hiddenUp" style="display: none;"></iframe>

	
	
	<t:fieldLayout id="res_select" prefix="kd" columns="4">
		<t:grid id="grid_chayiliebiao" caption="${i18n.chayiliebiao}"
			showNum="true" src="/kdorder/queryMuluRes.ajax" usePager="true" idKeys="usercenter,lingjbh"
			add="NOT" remove="NOT" edit="NOT" submit="NOT" reset="NOT"
			load="false" back="NOT" multiple="true"  scrollHeight="295">

			<t:gridCol property="usercenter" width="60" type="text" caption="${i18n.usercenter}"></t:gridCol>
			<t:gridCol property="lingjbh" type="text" caption="${i18n.lingjbh}"></t:gridCol>
			<!-- xss-v4_018 -->
			<t:gridCol property="xiehd" width="120" type="text" caption="${i18n.xiehd}"></t:gridCol>
			<t:gridCol property="ckxXiehd" width="120" type="text" caption="${i18n.ckxXiehd}"></t:gridCol>
			
			<t:gridCol property="uclx" caption="${i18n.ucleix}"></t:gridCol>
			<t:gridCol property="ucrl" type="text" caption="${i18n.ucrl}"></t:gridCol>
			<t:gridCol property="ualx" type="text" caption="${i18n.ualeix}"></t:gridCol>
			<t:gridCol property="uarl" width="60" type="text" caption="${i18n.uarl}"></t:gridCol>
			<t:gridCol width="120" property="ckxuclx" caption="${i18n.ckxucleix}"></t:gridCol>
			<t:gridCol width="100" property="ckxucrl" type="text" caption="${i18n.ckxucrl}"></t:gridCol>
			<t:gridCol width="120" property="ckxualx" type="text"
				caption="${i18n.ckxualeix}"></t:gridCol>
			<t:gridCol width="100" property="ckxuarl" type="text" caption="${i18n.ckxuarl}"></t:gridCol>
		
			<t:gridCol width="400" property="chayi" type="text" caption="${i18n.chayi}"></t:gridCol>
		
		</t:grid>
	</t:fieldLayout>
</t:page>
<script type="text/javascript">
	function insertMulu() {
		var form = document.forms["upload"];
		var file = form["file"];
		var fvalue = file.value;
		
		if (fvalue.length > 0) {
			// 寻找表单域中的 <input type="file" ... /> 标签
			if (fvalue.lastIndexOf('xls')==-1) {
				alert("${i18n.geshits}");
				return false;
			}
			form.submit();
		} else {
			alert("${i18n.wenjts}");
			return false;
		}

	}
		
	function callback(msg)

	{
		
     		alert(msg);
	}
	
	function expert(){
	$.sdcui.pageUtils.goPage({
					url:'muluDownLoadFile.do',//url,
					mode:'form',
					beforeSubmit:function(){
						//
						return true;
					}
				});
	  			return false;
	
	}
	
	
	function  equals(){
		 $.sdcui.ajaxUtil.ajax({
		         url:"${ctx}/kdorder/MuluCompared.ajax",
		 	 	   
		 	       success:function (result){
		 	        
		 	        	
		 	        	$('#grid_chayiliebiao').grid('reload');
		 	        	alert(result.result);
		 	        	}
		 	           
		           });

	}
	
	 //导出模板
		function mobxz(){
			$.sdcui.pageUtils.goPage({
				url : '../kdorder/downloadKdorderMob.do',
				mode : 'form',
				beforeSubmit : function(){
					return true;
				}
		   });
		}	
</script>
</t:html>