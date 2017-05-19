<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html title="">
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css">
  #form_sgjs{
  	overflow-y: scroll;
  }
</style>
</head>
<t:page i18n="i18n.ckx.transTime.i18n_yunssjmbTemp">

	<t:grid id="grid_ckx_yunssjmb" caption="${i18n.yunssjmbjs }" idKeys="xuh"
		src="/transTime/queryYunssjmbTemp.ajax" showNum="true"
		dataFormId="form_jismb" afterSaveRowsEvent="afterSaveRows"
		saveRowsSrcs="/transTime/saveYunssjmbTemp.ajax" editable="false" 		
		editModel="true" load="false" add="NOT" remove="NOT" edit="NOT"
		scrollHeight="285" pageSize="15">
		<t:fieldLayout prefix="yunssjmb" columns="2">
			<t:fieldText property="xiehztbh" caption="${i18n.xiehztbz }" dataType="text" maxLength="6" width="110"
				 />
			<t:fieldText property="gcbh" caption="${i18n.gcbh }"  dataType="text" maxLength="10" width="110"/>

		</t:fieldLayout>
		<t:gridCol property="usercenter" caption="${i18n.usercenter }"  convert="queryUserCenterMap"
			></t:gridCol>
		<t:gridCol property="xiehztbh" caption="${i18n.xiehztbz }" width="100"
			></t:gridCol>
		<t:gridCol property="gcbh" caption="${i18n.gcbh }" 
			  ></t:gridCol>
		<t:gridCol property="daohsj" caption="${i18n.daohsjpl }" editor="fieldText" width="100"
			editorOptions="{'notNull':true,'expression':'^[1-9][0-9]{0,2}$|^1[0-3][0-9]{2}$|^14[0-3][0-9]$|^0$','expressionMessage':'${i18n.qingsr }0~1440${i18n.zhijdsz }'}"></t:gridCol>
		<t:gridCol property="facsj" caption="${i18n.facsjpl }" editor="fieldText" width="100"
			editorOptions="{'notNull':true,'expression':'^-?[1-9][0-9]{0,2}$|^-?1[0-3][0-9]{2}$|^-?14[0-3][0-9]$|^0$','expressionMessage':'${i18n.qingsr }-1440~1440${i18n.zhijdsz }'}"></t:gridCol>
		<t:gridCol property="" caption="" width="5"></t:gridCol>
		<t:button caption="${i18n.sgjs }" name="sgjs"></t:button>
		<t:button caption="${i18n.daoc }xls" name="daocxls"></t:button>
		<t:button caption="${i18n.dingssx }" name="dingssx"></t:button>
		<t:button caption="${i18n.jismb }" name="jismb"></t:button>
		<t:button caption="${i18n.shengxmb }" name="effect"></t:button>
		<t:button caption="${i18n.baoc }" name="saves"></t:button>
	</t:grid>
<!-- 		<form id="form_d" action="/transTime/importYunssjmbTemp.do" method="post" target="hiddenUp" -->
<!-- 			> -->
<%-- 			<t:fieldLayout> --%>
<%-- 				<t:fieldFile property="file" caption="请选择文件"></t:fieldFile> --%>
<%-- 			</t:fieldLayout> --%>
<!-- 		</form> -->
<t:file action="/transTime/importAth_importYunssjmbTemp.do" >
			<t:fileparam sheet="Sheet1" keys="usercenter,xiehztbh,gcbh,xuh" table="{dbSchemal3}CKX_YUNSSJMB_TEMP" datasourceId="1" ></t:fileparam>
		</t:file>
		<!--  
		<form id="form_daorsj" name="form_daorsj" 
		action="${ctx}/transTime/importYunssjmbTemp.do" 
		enctype='multipart/form-data' method="post" 
		style="background-color: white;" target="hiddenUp">
			
			<div>
				${i18n.daorwj }：<input type="file" name="file" id="file" width="150"/> 
			</div>
			<div class="youi-buttons"  align="center">
			<table>
				<tbody>
					<tr>
						<td>
							<div class="youi-button active-0" >
								<div align="center">
									<div class="center">
										<a href="#" onclick="return impFrExc()"> ${i18n.daor} </a>
									</div>
								</div>
							</div></td>
					
					</tr>
				</tbody>
			</table>
		</div>
	
	</form>
	<iframe name="hiddenUp" id="hiddenUp" style="display: none;"></iframe>
	-->
	<t:form id="form_jismb" caption="${i18n.monjs}" action="saveTempMon.ajax" reset="NOT"
		idKeys="xiehztbh" dialog="true">
		<t:fieldLayout prefix="jismb" columns="1" showLabel="false">
			${i18n.jisfs}：<input type="radio" id="jisjsfs" value="2" name="jisfses" onclick="clickJisfs(this)"  />${i18n.jis }
			        <t:fieldHidden property="jisfs" ></t:fieldHidden>
			<t:fieldGrid property="mon" width="580"  mode="reload" >
				<t:grid id="temp_mon" load="false" src="/transTime/queryTempMon.ajax" caption="${i18n.monjs }" submit="NOT" reset="NOT"
					editable="true" editModel="true" idKeys="xiehztbh,usercenter" panel="false" 
					showEditorAddName="editorAdd" showEditorRemoveName="editorRemove"
					showNum="true">
					<t:fieldLayout prefix="jf">
					<t:fieldHidden property="dingszt"></t:fieldHidden>
					</t:fieldLayout>
					<t:gridCol property="usercenter"  caption="${i18n.usercenter }"  convert="queryUserCenterMap" defaultValue="${loginUsercenter }"></t:gridCol>
					<t:gridCol property="xiehztbh" caption="${i18n.xiehztbz }" editor="fieldText"
						editorOptions="{'maxLength':'4','minLength':'4','notNull':true}"></t:gridCol>
					
				</t:grid>
			</t:fieldGrid>
		</t:fieldLayout>
	</t:form>
	
	<t:form id="form_dingssx" caption="${i18n.dingssx}" action="saveDingssx.ajax" reset="NOT"
		idKeys="usercenter,xiehztbzh" dialog="true">
		<t:fieldLayout prefix="dingssx" columns="1" showLabel="false">
			<t:fieldGrid property="dssx" width="580"  mode="reload" >
				<t:grid id="dsx" load="false" src="/transTime/queryDingssx.ajax" caption="${i18n.monjs }" submit="NOT" reset="NOT"
					editable="true" editModel="true" idKeys="usercenter,xiehztbzh" panel="false" add="NOT" edit="NOT"  showEditorAdd="false" showEditorRemove="false" 
					showNum="true">
					<t:fieldLayout prefix="sx">
					</t:fieldLayout>
					<t:gridCol property="usercenter"  caption="${i18n.usercenter }"  convert="queryUserCenterMap" defaultValue="${loginUsercenter }"></t:gridCol>
					<t:gridCol property="xiehztbzh" caption="${i18n.xiehztbzh }" width="120"></t:gridCol>
					<t:gridCol property="shengxsj" caption="${i18n.shengxsj }" editor="fieldCalendar"
						editorOptions="{'format':'yyyy-MM-dd'}" width="90"></t:gridCol>
					<t:gridCol property="editor" caption="${i18n.editor }" ></t:gridCol>
					<t:gridCol property="edit_time" caption="${i18n.edit_time }" ></t:gridCol>
				</t:grid>
			</t:fieldGrid>
		</t:fieldLayout>
	</t:form>
	
	
		<t:form dialog="true" action="/transTime/sgjsYunssjmbTemp.ajax"  id="form_sgjs2" submit="NOT" reset="NOT" width="410"  height="250"
		 caption="计算">
		 	<iframe scrolling="no"  style="text-align:center;" id="evaluation" name="evaluation" border="0"   frameborder="0" src="" width="99%" height="230"></iframe>
	 	<t:button name="tijiao" caption="提交"></t:button>
		</t:form>


	<t:form dialog="true" action="/transTime/sgjsYunssjmbTemp.ajax"  id="form_sgjs" submit="NOT" reset="NOT" width="410"  height="300"
		 caption="">
	
		 <table id="jisuan" width="99%" height="280">
		 
		 </table>
	
	 	<t:button name="tijiao" caption="提交"></t:button>
	 	
		</t:form>


</t:page>
</t:html>
<script type="text/javascript">
//xss-0011489


	function func_form_tijiao(){
	//	parent.frames['evaluation'].window.submitbutt();
		//parent.frames['evaluation'].document.body.innerHTML='';
	//	$("#form_sgjs").submit();
	
		var xiehztbhlist=document.getElementsByName("xiehztbhA");
		var gongzrllist=document.getElementsByName("gongzrl");
		var gongzsjbzlist=document.getElementsByName("gongzsjbz");

		 var params = [];
		 var j=0;
		 for(var i = 0 ; i < xiehztbhlist.length ; i++ ){
			 params.push("list["+i+"].xiehztbh="+xiehztbhlist[i].value);
			 params.push("list["+i+"].gongzrl="+gongzrllist[i].value);
			 params.push("list["+i+"].gongzsjbz="+gongzsjbzlist[i].value);
			 if(gongzrllist[i].value!="" && gongzsjbzlist[i].value!=""){
				 j=1;
			 }
		 }
		 if(j==0){
			 alert("请至少选择一组数据进行手工计算")
			 return;
		 }
	/*	for(var i=0;i<xiehztbhlist.length;i++){
			xiehztbh+=xiehztbhlist[i].value+",";
			gongzrl+=gongzrllist[i].value+",";
			gongzsjbz+=gongzsjbzlist[i].value+",";
		}*/
	
		 $.sdcui.ajaxUtil.ajax({
				url:'../transTime/sgjsYunssjmbTemp.ajax',
				data:params.join('&'),
				success:function(result){
					if(typeof result.success=="undefined"||result.success!==false){
						$("#form_sgjs").form("close");
					}
				}
			});
		
/*		$.sdcui.ajaxUtil.ajax({
			url : '../transTime/sgjsYunssjmbTemp.ajax?xiehztbh='+xiehztbh+'&gongzrl='+gongzrl+'&gongzsjbz='+gongzsjbz,
			success : function(result) {
				$("#form_sgjs").form("close");
			}
	   });*/
					
					 }
	function func_button_sgjs() {	
	
	//	parent.frames['evaluation'].document.body.innerHTML='';
	//	$('#form_sgjs').form('open','');
			
	//	 document.getElementById("evaluation").src="../transTime/tosgjsPageYunssjmbTemp.do";
		$("#form_sgjs").form("clear");
		$("#form_sgjs").form("open","手工计算");
		$("#jisuan").html("");
		
		  $.sdcui.ajaxUtil.ajax({
			url : '../transTime/tosgjsPageYunssjmbTemp.ajax.do',
			success : function(result) {
			
		
			
				$("#jisuan").append(" <tr ><td>卸货站台编组</td><td>工作日历</td><td>工作时间编组</td></tr>");
				for (var y=0;y<result.result.length;y++)
				{
					
					var gongzrl="<option value=''>请选择</option>";
					for (var x=0;x<result.gongzrl.length;x++)
					{
					
						gongzrl += "<option";
				
						
						if(result.result[y].gongzrl==result.gongzrl[x].banc ){
						
							gongzrl += " selected='selected' ";
						}
						gongzrl += "  value='"+result.gongzrl[x].banc+"'>"+result.gongzrl[x].banc+"</option>"
					
					}
				
					var gongzsjbz="<option value=''>请选择</option>";
					for (var i=0;i<result.gongzsjbz.length;i++)
					{		
					
						gongzsjbz += "<option";
					
						if(result.result[y].gongzsjbz==result.gongzsjbz[i].bianzh ){
						gongzsjbz += " selected='selected'";
						}
						 gongzsjbz += " value='"+result.gongzsjbz[i].bianzh+"'>"+result.gongzsjbz[i].bianzh+"</option>"
							
					}
				
				
					
			$("#jisuan").append("<tr > <td>	<input name='xiehztbhA' type='hidden' value="+result.result[y].xiehztbh+">"+result.result[y].xiehztbh+"</td>"
			+"<td><select  name='gongzrl'>"+gongzrl+" </select></td><td><select name='gongzsjbz' >"+gongzsjbz+"</select></td></tr>");
				
			
				}
			}
		});
	}
	

	function func_button_saves() {
		$("#grid_ckx_yunssjmb").grid("saveRows");
	}
	function func_button_effect() {		
		$.sdcui.ajaxUtil.ajax({
			url : "../transTime/effectYunssjmbTemp.ajax",
			success : function() {
// 				$("#grid_ckx_gongys").grid("reload");
			}
		});
	}
	function grid_ckx_yunssjmb_beforeSubmit() {
		$("#yunssjmb_xiehztbh").fieldValue(trim($("#yunssjmb_xiehztbh").fieldValue()));
		$("#yunssjmb_gcbh").fieldValue(trim($("#yunssjmb_gcbh").fieldValue()));
	}
	//选择计算方式
	function clickJisfs(obj){
		if(1==obj.value){
			$("#jf_dingszt").fieldValue("1");
			$("#temp_mon").grid("reload");			
		}else{
			$("#form_jismb").form("clear");
			$("#jf_dingszt").fieldValue("2");
		}
		$("#jismb_jisfs").fieldValue(obj.value);
	}
	function func_button_jismb() {
		$("#form_jismb").form("clear");
		$("#form_jismb").form("open");
		$("#jismb_jisfs").fieldValue("2");
		$("#jf_dingszt").fieldValue("2");
		$("#jisjsfs").attr("checked",true);
// 		$("#temp_mon").grid("reload");
	}
	
	function func_button_dingssx() {
		$("#form_dingssx").form("clear");
		$("#form_dingssx").form("open");
		$("#dsx").grid("reload");	
	}

	function form_dingssx_afterSubmit(){
 		$("#form_dingssx").form("close");		
	}
	
	function form_jismb_afterSubmit(){
// 		$("#form_jismb").form("close");		
	}
	function func_button_daocxls(){
// 		window.location.href = "${ctx}/transTime/derivedYunssjmbTemp.do?fileName=ckx\\运输时间计算.xls";
		var xiehztbh = trim($("#yunssjmb_xiehztbh").fieldValue());
		var gcbh = trim($("#yunssjmb_gcbh").fieldValue());
		var record = {'xiehztbh':xiehztbh,'gcbh':gcbh,'type':'_Temp'};
		
		$.sdcui.pageUtils.goPage({
			url : '../transTime/derivedYunssjmbTemp.do',
			mode : 'form',
			record : record,
			beforeSubmit : function(){
				return true;
			}
	   });
	}
	
	function callback(msg){
     	alert(msg);
	}
	function impFrExc() {
		var form = document.forms["form_daorsj"];
		var file = form["file"];
		var fvalue = file.value;
		if (fvalue.length > 0) {
			// 寻找表单域中的 <input type="file" ... /> 标签
			if (fvalue.lastIndexOf('xls')==-1) {
				alert("${i18n.qingqddrwjdgsw }excel!");
				return false;
			}
			form.submit();
		} else {
			alert("${i18n.qingxzydrdwj }.");
			return false;
		}

	}
</script>
