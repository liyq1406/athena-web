<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.lingjqh}">

<!-- 
	BOM零件切换
	@author CSY
	@date 2016-05-04
 -->

<head>
	<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	<style type="text/css">

	#left {
	 float: left;
	 height: auto;
	 width: 70%;
	}
	#right {
	 float: right;
	 height: auto;
	 width: 28%;
	}
	#fieldText-lingjqh_banbh{
		color: red;
	}
	#fieldSelect-lingjqh_banbh2{
		color: red;
	}
	#fieldText-lingjqhLCDV_banbh{
		color: red;
	}
	</style>
	<script type="text/javascript">
		function load(){
			var mess = document.getElementById("mess").value;
			if(mess!=""){
				alert(mess);
			}
		}
	</script>
</head>
<body onload="load()">
<t:page i18n="i18n.ckx.xuqjs.i18n_lingjqh">
	<input type="hidden" name="mess" id="mess" value = "${requestScope.mess }"> 
	<div id = 'left'>
		<t:grid id="grid_lingjqh" caption="${i18n.lingjqhmx}" idKeys="banbh" load="false" add='NOT' edit='NOT' remove="NOT" dataFormId="form_lingjqh" back="NOT"
			src="/xuqjs/queryDFPVLingjqh.ajax" showNum="true" showCheckbox="true" pageSize="50" scrollHeight="290" >
			<t:fieldLayout id="lingjqh" prefix="lingjqh" columns="3">
				<t:fieldText property="banbh" caption="${i18n.banbh}" dataType="text" maxLength="11" minLength="11" width="140"/>
				<t:fieldSelect property="banbh2" caption="${i18n.zuijbbh}" src="/xuqjs/getDFPVLingjqhBBH.ajax"
				show="banbh" code="banbh" width="140"/> 
				<t:fieldCalendar property="ecom" caption="${i18n.ecom}" format="yyyy-MM-dd" width="140"/>
				
				<t:fieldText property="qiehqslsh" caption="${i18n.qislsh}" dataType="text" maxLength="9" minLength="9"  width="140"/>
				<t:fieldText property="touflwjh" caption="${i18n.touflwjh}" dataType="text" maxLength="11" minLength="11" width="140" />
				<t:fieldCalendar property="shijqhrq" caption="${i18n.toucrq}" format="yyyy-MM-dd" width="140"/>
				
				<t:fieldText property="lingjbh" caption="${i18n.yuanljh}" dataType="text" maxLength="10" minLength="10" width="140" />
				<t:fieldText property="xlingjbh" caption="${i18n.xlingjbh}" dataType="text" maxLength="10" minLength="10" width="140" />
				<t:fieldText property="chanx" caption="${i18n.shengcxbh}" dataType="text" maxLength="5" minLength="5" width="140" />
				
				<t:fieldSelect property="leix" caption="${i18n.qiehlx}" convert="flag"  width="140"/>
				<t:fieldSelect property="active" caption="${i18n.biaoz}" convert="biaoz"  width="80"/>
				
			</t:fieldLayout>
			
			<t:button caption="${i18n.mobxz}" name="mobxz" active="0"/>
			<t:button caption="${i18n.mobxz2}" name="mobxz2" active="0"/>
			<t:button caption="${i18n.shengx}" name="shengx" />
	        <t:button caption="${i18n.shix}" name="shix" />
	        
	        <t:gridCol property="banbh" caption="${i18n.banbh}" width="100"/>
	        
			<t:gridCol property="lingjbh" caption="${i18n.yuanljh}" width="100"/>
			<t:gridCol property="xlingjbh" caption="${i18n.xlingjbh}" width="100"/>
			<t:gridCol property="lingjmc" caption="${i18n.ylingjmc}" width="200"/>
			<t:gridCol property="xlingjmc" caption="${i18n.xlingjmc}" width="200"/>
			<t:gridCol property="yshul" caption="${i18n.yshul}" width="80"/>
			<t:gridCol property="xshul" caption="${i18n.xshul}" width="80"/>
			<t:gridCol property="chanx" caption="${i18n.shengcxbh}"/>
			<t:gridCol property="ygongysdm" caption="${i18n.ygongysdm}" width="100"/>
			<t:gridCol property="xgongysdm" caption="${i18n.xgongysdm}" width="100"/>
			<t:gridCol property="ecom" caption="${i18n.ecom}" width="100"/>
			<t:gridCol property="shijqhrq" caption="${i18n.toucrq}" width="100"/>
			<t:gridCol property="touflwjh" caption="${i18n.touflwjh}" width="100"/>
			<t:gridCol property="qiehqslsh" caption="${i18n.qislsh}" width="100"/>
			<t:gridCol property="creator" caption="${i18n.creator}" width="50"/>
			<t:gridCol property="create_time" caption="${i18n.create_time}" width="140"/>
			<t:gridCol property="editor" caption="${i18n.editor}" width="50"/>
			<t:gridCol property="edit_time" caption="${i18n.edit_time}" width="140"/>
			<t:gridCol property="active" caption="${i18n.biaoz}" convert="biaoz" width="50"/>
			
			<t:gridCol property="" caption=""/>
			
		</t:grid>
		
		<form id="upload" action="/athena/xuqjs/importAth_uploadLingjqhLCDV.do" method="post" enctype="multipart/form-data">  
           <table>
				<tbody>
					<tr>
						<td>
							<input type="file" name="importExcel" id="importExcel" size="50"> 
						</td>
						<td>
							<div class="youi-button active-0">
								<div class="right">
									<div class="center">
										<a class="submit" id="importExcel_button" onclick="return form_subimt()" href="#"> 导 入 </a>
									</div>
								</div>
							</div>
						</td>
				   </tr>
				</tbody>
			</table>
       	</form>  
		
	</div>
	
	<div id = 'right'>
		<t:grid id="grid_lingjqhLCDV" caption="${i18n.qiehtj}" idKeys="banbh" load="false" add='NOT' edit='NOT' remove="NOT" dataFormId="form_lingjqh" back="NOT"
			src="/xuqjs/queryDFPVLingjqhLCDV.ajax" showNum="true"  showCheckbox="false"
			pageSize="50" scrollHeight="290" >
			<t:fieldLayout id="lingjqhLCDV" prefix="lingjqhLCDV" columns="1">
				<t:fieldText property="banbh" caption="${i18n.banbh}" dataType="text" maxLength="11" minLength="11" width="210" />
			</t:fieldLayout>
	        
	        <t:gridCol property="banbh" caption="${i18n.banbh}" width="100"/>
	        
			<t:gridCol property="tiaoj" caption="${i18n.qiehtj}" width="200"/>
			
			<t:gridCol property="" caption=""/>
			
		</t:grid>
	
	</div>
	
</t:page>


<script type="text/javascript">
		function form_subimt(){ 
			var formEle = document.getElementById("upload"); 
			if($("#importExcel").val()==null || ""==$("#importExcel").val())
			{ 
				alert("上传文件不能为空."); 
				return false; 
			}else{ 
			window.down_showLoading();
			formEle.submit(); 
	} 
		} 

		//查询前执行方法
		function grid_lingjqh_beforeSubmit() {
			var babbh = $("#lingjqh_banbh").fieldValue();
			var babbh2 = $("#lingjqh_banbh2").fieldValue();
			if(babbh!="" && babbh2!=""){
				alert("零件切换明细中\"版本号\"和\"最近版本号\"不能同时有值！");
				return false;
			}else if(babbh=="" && babbh2==""){
				alert("零件切换明细中\"版本号\"或\"最近版本号\"为必填项！");
				return false;
			}else if(babbh!=""){
				$("#lingjqhLCDV_banbh").fieldValue(babbh);
			}else if(babbh2!=""){
				$("#lingjqhLCDV_banbh").fieldValue(babbh2);
			}
		}
		
		//查询前执行方法
		function grid_lingjqhLCDV_beforeSubmit() {
			var babbh = $("#lingjqhLCDV_banbh").fieldValue();
			if(babbh==""){
				alert("零件切换条件中\"版本号\"为必填项！");
				return false;
			}
		}
		
		//点击失效触发的函数
		function func_button_shix(){
			 var roles = $('#grid_lingjqh').grid('getSelectedRecords');
			 if(roles.length==0){
			 		alert("请至少选择一条记录");
			 		return false;
			 }
			 var params = [];
			 for(var i = 0 ; i < roles.length ; i++ ){
				 params.push("list["+i+"].banbh="+roles[i].banbh);
				 params.push("list["+i+"].lingjbh="+roles[i].lingjbh);
				 params.push("list["+i+"].xlingjbh="+roles[i].xlingjbh);
				 params.push("list["+i+"].yshul="+roles[i].yshul);
				 params.push("list["+i+"].xshul="+roles[i].xshul);
				 params.push("list["+i+"].chanx="+roles[i].chanx);
				 params.push("list["+i+"].ygongysdm="+roles[i].ygongysdm);
				 params.push("list["+i+"].xgongysdm="+roles[i].xgongysdm);
				 params.push("list["+i+"].ecom="+roles[i].ecom);
				 params.push("list["+i+"].shijqhrq="+roles[i].shijqhrq);
				 params.push("list["+i+"].touflwjh="+roles[i].touflwjh);
				 params.push("list["+i+"].qiehqslsh="+roles[i].qiehqslsh);
				 params.push("list["+i+"].active="+roles[i].active);
			 }
			 $.sdcui.ajaxUtil.ajax({
				url:'lingjqhshix.ajax',
				data:params.join('&'),
				success:function(result){
					if(typeof result.success=="undefined"||result.success!==false){
						alert("已将所选数据中“新建”和“生效”的数据状态更新为“失效”！");
						$("#grid_lingjqh").grid('reload');
					}else{
						alert("失效操作失败");
						$("#grid_lingjqh").grid('reload');
					}
				}
			});
		}
		
		//生效按钮
		function func_button_shengx(){
			var roles = $('#grid_lingjqh').grid('getSelectedRecords');
			 if(roles.length==0){
			 		alert("请至少选择一条记录");
			 		return false;
			 }
			 var params = [];
			 for(var i = 0 ; i < roles.length ; i++ ){
				 params.push("list["+i+"].banbh="+roles[i].banbh);
				 params.push("list["+i+"].lingjbh="+roles[i].lingjbh);
				 params.push("list["+i+"].xlingjbh="+roles[i].xlingjbh);
				 params.push("list["+i+"].yshul="+roles[i].yshul);
				 params.push("list["+i+"].xshul="+roles[i].xshul);
				 params.push("list["+i+"].chanx="+roles[i].chanx);
				 params.push("list["+i+"].ygongysdm="+roles[i].ygongysdm);
				 params.push("list["+i+"].xgongysdm="+roles[i].xgongysdm);
				 params.push("list["+i+"].ecom="+roles[i].ecom);
				 params.push("list["+i+"].shijqhrq="+roles[i].shijqhrq);
				 params.push("list["+i+"].touflwjh="+roles[i].touflwjh);
				 params.push("list["+i+"].qiehqslsh="+roles[i].qiehqslsh);
				 params.push("list["+i+"].active="+roles[i].active);
			 }
			 $.sdcui.ajaxUtil.ajax({
				url:'lingjqhshengx.ajax',
				data:params.join('&'),
				success:function(result){
					if(typeof result.success=="undefined"||result.success!==false){
						alert("已将所选数据中“新建”的数据状态更新为“生效”！");
						$("#grid_lingjqh").grid('reload');
					}else{
						alert("生效操作失败");
						$("#grid_lingjqh").grid('reload');
					}
				}
			});
		}
		
		//标识
		$.sdcui.serverConfig.convertArray['biaoz'] = {
			'3' : '${i18n.wanc}',
			'2' : '${i18n.xinj}',
			'1' : '${i18n.shengx}',
			'0' : '${i18n.shix}'
		};
		
		//切换类型
		$.sdcui.serverConfig.convertArray['flag'] = {
			'A' : '${i18n.anchexqh}',
			'B' : '${i18n.anddhqh}'
		};
		
		//导出模板
		function func_button_mobxz(){
			$.sdcui.pageUtils.goPage({
				url : '../xuqjs/downloadDFPVLingjqhMob.do',
				mode : 'form',
				beforeSubmit : function(){
					return true;
				}
		   });
		}
		
		//导出模板
		function func_button_mobxz2(){
			$.sdcui.pageUtils.goPage({
				url : '../xuqjs/downloadDFPVLingjqhLSMob.do',
				mode : 'form',
				beforeSubmit : function(){
					return true;
				}
		   });
		}
	</script>
	</body>
</t:html>