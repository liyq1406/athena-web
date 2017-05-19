<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="手工配载" >
	<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<script type="text/javascript" src="${ctx}/athena/js/util.js"></script>

<script src="<%=request.getContextPath()%>/scripts/lib/jquery.validate.js" type="text/javascript"></script>
	</head>
	<script type="text/javascript">
	//拼下拉框组件
	$(document).ready(function(){
		chepInit();	
	});
	
	//keyup事件，将小写字母转换成大写字母，打印时
	function UpCaseAchep(){
		obj=document.getElementById("achep");
		obj.value=( obj.value.toUpperCase());
	}
	
	function chepInit(){
		var pzElement = $('#sgpz_chep');
		if(!pzElement.hasClass('loaded')){
			$('#sgpz_chep').html('<select>'+parseStateOfOptions()+'</select><input maxlength="6" id="achep" onkeyup="UpCaseAchep();"/>');
			
			$('#sgpz_chep').addClass('loaded').fieldCustom({
				property:'chep',
				setValue:function(value){
					 
				},
				getValue:function(){
					var value = this.element.find('select').val()+this.element.find('input').val();
					return value;
				},
				clear:function(){
					this.element.find('select,input').val('');
				}
			});
		}
		return true;
	}
	</script>
	<t:page i18n="i18n.fj.fj">
		<t:grid id="shougpzYaohlGrid" idKeys="YAOHLH" src="/fj/queryYaohlOfkh.ajax" caption="要货令归集"  load="false"
		usePager="false" showCheckbox="true" add="NOT" edit="NOT" remove="NOT"  >
			<t:fieldLayout id="sgpz_select" prefix="sgpzcx" columns="3">
				<t:fieldHidden property="usercenter" defaultValue="${usercenter }"></t:fieldHidden>
				<t:fieldSelect property="kehbm" caption="${i18n.keh }" src="/fj/queryKeh.ajax" code="KEHBH" show="KEHMC" notNull="true"></t:fieldSelect>
				<t:fieldCalendar property="kaissj" format="yyyy-MM-dd HH:mm" caption="${i18n.peizjh_fromDaocsj }" notNull="true"></t:fieldCalendar>
				<t:fieldCalendar property="jiessj" format="yyyy-MM-dd HH:mm" caption="${i18n.peizjh_toDaocsj }" notNull="true"></t:fieldCalendar>
			</t:fieldLayout>
			<t:gridCol property="YAOHLH" caption="${i18n.yaohlbh }"></t:gridCol>
			<t:gridCol property="LINGJBH" caption="${i18n.lingjh }"></t:gridCol>
			<t:gridCol property="BAOZXH" caption="${i18n.baozxh }"></t:gridCol>
			<t:gridCol property="YAOHSL" caption="${i18n.lingjsl }"></t:gridCol>
			<t:gridCol property="XIEHD" caption="${i18n.xiehd }"></t:gridCol>
			<t:gridCol property="JIAOFJ" caption="${i18n.jiaofsj }"></t:gridCol>
		</t:grid>
		<div class="grid-scroll" >
			<table id="tab" cellspacing="1" cellpadding="0" class="grid-table" style="width:300px;" >
				
			</table>
		</div>
		<t:form id="shougpzForm" submit="NOT" reset="NOT" >
			<t:fieldLayout columns="3" prefix="sgpz">
				<t:fieldSelect property="yunssbm" caption="${i18n.yunss }" src="/fj/queryYunss.ajax" show="GONGSMC" code="GCBH" notNull="true"></t:fieldSelect>
				<t:fieldSelect property="jihcx" caption="${i18n.chex }" src="/fj/queryChex.ajax" show="CHEXMC" code="CHEXBH" notNull="true"></t:fieldSelect>
				<t:fieldCustom property="chep" caption="${i18n.chep }"></t:fieldCustom>
			</t:fieldLayout>
		</t:form>
		
		
<!-- 是否继续配载 -->
	<t:form dialog="true" reset="NOT" submit="NOT"  id="form_surePeiz" caption="仓库资源不足是否继续配载" >
		<t:fieldLayout prefix="peizSure"> 
			<t:fieldHidden property="kehbm" />
			<t:fieldHidden property="bhdList" />
			<t:fieldHidden property="yaohlList" />
		    <t:fieldLabel property="peizdh" caption="${i18n.peizdh}"/>
			<t:fieldLabel property="jihcx" caption="${i18n.chex }" />
			<t:fieldLabel property="chep" caption="${i18n.chep }" />
			<t:fieldLabel property="yunssbm" caption="${i18n.yunssbm }" />
			<t:fieldLabel property="usercenter" caption="${i18n.usercenter }"  />
         	<t:fieldGrid property="noMatchYaohlList" mode="aa" caption="未备货要货令"  parents="peizdh" column="6" width="600" parentsAlias="peizdh">
				<t:grid id="form_grid_NoMatchYaohl" load="false"  submit="NOT" usePager="false"  reset="NOT" add="NOT"
					edit="NOT" remove="NOT"  width="500" >
					<t:gridCol property="YAOHLH" caption="${i18n.yaohlbh }" ></t:gridCol>
					<t:gridCol property="LINGJBH" caption="${i18n.lingjh } "></t:gridCol>
					<t:gridCol property="LINGJSL" caption="${i18n.lingjsl }"></t:gridCol>
					<t:gridCol property="BAOZXH" caption="${i18n.baozxh }"></t:gridCol>
					<t:gridCol property="XIEHD" caption="${i18n.xiehd }"></t:gridCol>
					<t:gridCol property="JIAOFJ" caption="${i18n.jiaofsj } "></t:gridCol>
				</t:grid>
			</t:fieldGrid>
			<t:button caption="继续配载" name="surePeiz"></t:button>
			<t:button caption="取消配载" name="cancelPeiz"></t:button>
		</t:fieldLayout>
	</t:form>	
	
<!-- 是否推荐配载 -->
	<t:form dialog="true" reset="NOT" submit="NOT"  id="form_tuij" caption="推荐配载" >
		<t:fieldLayout prefix="peizSure">  
		<table id="tuij_table" border="1">
			<tr id="tr" bgcolor="gray">
				<th>车辆型号</th>
				<th>零件/包装</th>
				<th>数量</th>
				<th>操作</th>
			</tr>
			
		</table>
		</t:fieldLayout>
	</t:form>	
	

		
<!-- 按钮居中 -->
	<table align="center">
		<tr align="center">
			<td align="center">
				<div class="youi-button active-0" id="button_saveMn">
				<div class="right"><div class="center"><a class="saveMn" href="javascript:onclick=func_button_sure();">确认</a>	</div></div>
				</div>
			</td>
			<td align="center">
				<div class="youi-button active-0" id="button_cancel">
				<div class="right"><div class="center"><a class="cancel" href="javascript:onclick=func_button_recommend();">推荐配载</a></div></div>
				</div>
			</td>
		</tr>
		</table>
		
		
	</t:page>

<script type="text/javascript">
function shougpzYaohlGrid_change(r) {
	var records = $("#shougpzYaohlGrid").grid('getSelectedRecords');
	var map = {};
	$.each(records, function(i, n){  
		var count = map[n['LINGJBH']+',零件']||0;
		map[n['LINGJBH']+',零件']= count + parseInt(n['YAOHSL']);
		var shul = map[n['BAOZXH']+',包装']||0;
		map[n['BAOZXH']+',包装']=shul+1;
	});
	$("#tab tr").remove();
	$.each(map, function(k,v){ 
		var trHTML = "<tr><td>" + k.split(',')[1] + "</td><td>" + k.split(',')[0] +"</td><td>" + v +"</td></tr>";
		$("#tab").append(trHTML); 		
	});	
 
}
//确认手工配载
	function func_button_sure(){
		$("#shougpzForm").form('submit');//调用系统的表单验证
		if($("#shougpzForm").form('validate')==true){//验证通过
			if($("#field_chep input").val()==""){
				alert("【车牌号】不能为空");
				return;
			}
			var records = $("#shougpzYaohlGrid").grid('getSelectedRecords');
			if(records.length==0){
				alert("请选择要货令");
				return;
			}
			var formRecords =  $("#shougpzForm").form("getFormRecord");
			var rowData = [];
			rowData['jihcx'] = formRecords.jihcx;
			rowData['chep'] = formRecords.chep;
			rowData['yunssbm'] = formRecords.yunssbm;
			rowData['kehbm'] = formRecords.kehbm;
			var params = [];
			$.each(records,function(i,n){
				 params.push("yaohlList["+i+"]=" + n.YAOHLH);
			}); 
			
			params.push("gongsmc="+formRecords.gongsmc);
			params.push("kehbm="+formRecords.kehbm);
			params.push("yaocmxh="+formRecords.yaocmxh);
			params.push("yunssbm="+formRecords.yunssbm);
			params.push("jihcx="+formRecords.jihcx);
			params.push("chep="+formRecords.chep);
			 $.sdcui.ajaxUtil.ajax({
	             url:"${ctx}/fj/updatePeizjh.ajax",//请求url
	             data:params.join("&"),
	             success:function (rep){
	            		 if (rep.result.success=='true'){ 
			 	            	$("#shougpzYaohlGrid").grid("reload",false);
			 	            } else if (rep.result.success=='false'){
			 	            	if(rep.noYaohl=='0'){
			 	            		alert('仓库没有该配载单的要货令资源');
			 	            		return;
			 	            	}
			 	            	rowData['noMatchYaohlList'] = rep.notMatchSG;
			 	            	rowData['bhdList']= rep.result.bhdList;
			 	            	rowData['yaohlList']= rep.result.yaohlList;
			 	            	rowData['peizdh']=rep.peizdhSG;
			 	            	$('#form_surePeiz').form('fillRecord',$.extend(rowData)); 
			 	            	$("#form_surePeiz").form("open");  
			 	            }  
	             }
	     	});
		}
		
	}
	
	/**
	*确认继续配载
	*/
	function func_button_surePeiz(){
		var formRecord = $("#form_surePeiz").form('getFormRecord'); 
		var records = $("#form_grid_NoMatchYaohl").grid('getRecords',false); 
		$.each($("#form_grid_NoMatchYaohl").grid('getRecords',true),function(i, n){
			records.push(n);
		}); 
		
		var params = [];
		$.each(records,function(i,n){
			 params.push("noMatchYaohlList["+i+"]=" + n.YAOHLH);
		}); 
		params.push("peizdh="+formRecord.peizdh);
		params.push("jihcx="+formRecord.jihcx);
		params.push("chep="+formRecord.chep);
		params.push("yunssbm="+formRecord.yunssbm);
		params.push("kehbm="+formRecord.kehbm);
		params.push("usercenter="+formRecord.usercenter);
		params.push("bhdList="+formRecord.bhdList);
		params.push("yaohlList="+formRecord.yaohlList);
		
		 $.sdcui.ajaxUtil.ajax({
 	 	        url:"${ctx}/fj/surePeiz.ajax",
 	 	      	data:params.join("&"),
 	            success:function (result){
 	            	$("#form_surePeiz").form("close"); 
 	            	//刷新手工配载Grid列表
 	            	$("#shougpzYaohlGrid").grid("reload",false);
 	            	//刷新表单
 	            	$("#shougpzForm").form("clear");
 	            	
 	 	        }
 	       });	
		
	}
	
	/**
	*取消配载
	*/
	function func_button_cancelPeiz(){
		var formRecord = $("#form_surePeiz").form('getFormRecord'); 
		 $.sdcui.ajaxUtil.ajax({
 	 	        url:"${ctx}/fj/cancelPeiz.ajax",
 	 	        data:"peizdh="+$("#peizSure_peizdh").fieldValue(),
 	            success:function (result){
 	            	$("#form_surePeiz").form("close"); 
 	 	        }
 	       });	
		
	}
	
 	//验证开始时间与结束时间
 	function shougpzYaohlGrid_beforeSubmit(){
 		var startTime = $("#sgpzcx_kaissj").fieldValue();
 		var endTime = $("#sgpzcx_jiessj").fieldValue();
 		var start = new Date(startTime.replace("-","/"));
 		var end = new Date(endTime.replace("-","/"));
 		var n = end.getTime() - start.getTime();
 		if(n<0){
 			alert("${i18n.js_dateCompare}");
 			return false;
 		}
 		
 	} 
 	
	
 	//推荐配载	
	function func_button_recommend(){
 		//清空table
		$("#tuij_table tr").remove();
 		//通过ajax得到list
 		var params = [];
		params.push("KSSJ="+$("#sgpzcx_kaissj").fieldValue());
		params.push("JSSJ="+$("#sgpzcx_jiessj").fieldValue());
		params.push("KEH="+$("#sgpzcx_kehbm").fieldValue());
		
		
		 $.sdcui.ajaxUtil.ajax({
 	 	        url:"${ctx}/fj/tuiJanPeiZ.ajax",
 	 	      	data:params.join("&"),
 	            success:function (result){
 	            	rederTable(result);
	            	$("#form_tuij").form("open");
 	 	        }
 	       });	
	}
 	
 	
	//设置要贷令
 	function setYaohl(yaoHl,cx){
 		var hls = yaoHl.split(",")
 		alert(hls);
		$(hls).each(function(i,n){ 
			$("div").find(">.grid-content tr.row[id='" + n + "']").toggleClass('selected');
		});
 		$("#sgpz_jihcx").fieldValue(cx);
 		$("#form_tuij").form("close");

 	}
 	//渲染table
 	function rederTable(o)
 	{
 		var result = o.result;
 		$("#tuij_table").append("<tr bgcolor='gray'><th>车辆型号</th><th>零件/包装</th><th>数量</th><th>操作</th></tr>");
 		var html = [];
 		$.each(result, function(i,n){
 			
 			var row = 0;
 			var list = []; 
 			$.each(n.linj,function(k,v){
 				list.push('<td>零件:' + k + '</td>' + '<td>' + v + '</td>');
 				row++;
 			});
 			$.each(n.bzbh,function(k,v){
 				list.push('<td>包装:' + k + '</td>' + '<td>' + v + '</td>');
 				row++;
 			});
 			for (var index = 0; index < row; index++) {
 				var tds = [];
 				if(index == 0) {
 					tds.push('<td rowspan="' + row + '">' + n.clName + '</td>');
 					tds.push(list[index]);
 					tds.push('<td rowspan="' + row + '"><a href="javascript:setYaohl(\''+ n.yhlbh.join(',') +'\',\''+n.cllx+'\')">选择</a></td>');
 				} else {
 					tds.push(list[index]);
 				}
 				html.push('<tr>'+tds.join('') + '</tr>');
 			}
 		});
 		
 		$("#tuij_table").append(html.join(''));
 		
 	}



</script>
</t:html>