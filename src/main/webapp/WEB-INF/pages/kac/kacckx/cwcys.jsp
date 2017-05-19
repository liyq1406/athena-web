<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="车位-供应商" >
<!-- 
	 车位承运商
	 @author wangliang
	 @date 2015-01-24
 -->
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 125px; } </style>
	</head>
	<t:page i18n="">
	<t:grid id="grid_chew" caption="车位"  showNum="true"  load="false" scrollHeight="230" 
			src="/kac/queryChewxx.ajax" remove="NOT" back="NOT"  dataFormId="form_chew" 
			idKeys="usercenter,chewbh" clickRowEvent="grid_chew_click">
		<t:fieldLayout  columns="4" prefix="chew">
			<t:fieldSelect property="usercenter" caption="用户中心" defaultValue="${usercenter}" convert="queryUserCenterMap" width="120" notNull="true"></t:fieldSelect>
			<t:fieldSelect property="quybh"  caption="区域编号" src="/kac/queryPostDengdqy.ajax" notNull="true" parents="usercenter" code="quybh" show="quybh"  width="120"  ></t:fieldSelect>
			<t:fieldSelect property="daztbh"   caption="大站台编号" width="120" src="/kac/queryPostDazt.ajax"  parents="usercenter,quybh" code="daztbh" show="daztbh"/>
			<t:fieldText property="chewbh" caption="车位编号" maxLength="10" width="120" dataType="text"></t:fieldText>
			<t:fieldSelect property="chewsx" caption="车位属性"  convert="chewsx"  width="120"></t:fieldSelect>
			<t:fieldText property="chengysbh" caption="承运商编号" width="120" expression="^[0-9A-Z]{6}[\\s0-9A-Z]{2}[0-9A-Z]{2}$" expressionMessage="请填写10位编号" ></t:fieldText>
			<t:fieldSelect property="biaos" caption="标识"  convert="biaos"  width="120" defaultValue="1"></t:fieldSelect>
			<t:button caption="失效" name="del" active="1" />
		</t:fieldLayout>
		
		<t:gridCol property="usercenter" convert="usercenter" caption="用户中心" width="150"></t:gridCol>
		<t:gridCol property="daztbh" caption="大站台编号" width="150"></t:gridCol>
		<t:gridCol property="chewbh" caption="车位编号" width="150"></t:gridCol>
		<t:gridCol property="chewmc" caption="车位名称" width="150"></t:gridCol>
		<t:gridCol property="chewxh" caption="车位序列" width="150"></t:gridCol>
		<t:gridCol property="chewsx" caption="车位属性" width="150" convert="chewsx" ></t:gridCol>
		<t:gridCol property="chewzt" caption="车位使用状态" width="100"  convert="chewzt"></t:gridCol>
		<t:gridCol property="biaos" caption="标识" width="100" convert="biaos"></t:gridCol>
		<t:gridCol property="" caption="" width="10"></t:gridCol>
	</t:grid>
	
	
	<t:grid id="grid_chengys" caption="承运商关系"  showNum="true"  scrollHeight="100"  load="false"
				src="/kac/queryChewChengys.ajax" add="NOT" edit="NOT" remove="NOT" back="NOT" idKeys="usercenter,chewbh,chengysbh" 
				submit="NOT" reset="NOT" >
		<t:fieldLayout id="chengys" prefix="chengys">
			<t:fieldHidden property="usercenter" caption="用户中心" />
			<t:fieldHidden property="chewbh" caption="车位编号"  />
			<t:fieldHidden property="chewsx" caption="车位属性"  />
			<t:fieldHidden property="daztbh" caption="大站台编号"  />
			<t:fieldHidden property="quybh" caption="区域编号"  />
			<t:fieldHidden property="chengysbh" caption="承运商编号"  />
			<t:fieldHidden property="biaos" caption="标识" defaultValue="1" />
		</t:fieldLayout>
			<t:gridCol property="chewbh" caption="车位编号" width="300"></t:gridCol>
			<t:gridCol property="chengysbh" caption="承运商编号" width="300"></t:gridCol>
			<t:gridCol property="" caption="" width="200"></t:gridCol>
	</t:grid>
	
	<t:form dialog="true" id="form_chew" action="/kac/saveChewChengys.ajax" width="600" idKeys="usercenter,chewbh,daztbh" reset="NOT" submit="NOT" >
		<t:fieldLayout prefix="record1">
		     <t:fieldHidden property="flag"  defaultValue=" " caption="大站台编号" />
			<t:grid id="chew" caption="车位" submit="NOT" reset="NOT" add="NOT" edit="NOT" remove="NOT" load="false" save="NOT"  back="NOT">
				<t:fieldSelect width="140" property="usercenter" caption="用户中心"  convert="queryUserCenterMap"  notNull="true"/>
				<t:fieldText width="140" property="chewbh" caption="车位编号"  maxLength="10"  notNull="true" dataType="text"  />
				<t:fieldText width="140" property="chewmc" caption="车位名称"  maxLength="32"  notNull="true" />
				<t:fieldText width="140" property="chewxh" caption="车位序列"  maxLength="3"  notNull="true"  dataType="text" expression="^([1-9][0-9]{0,2})$"
						  expressionMessage="只能输入整数数字,首位不能为零"  />
				<t:fieldSelect width="140" property="chewsx" caption="车位属性" convert="chewsx"  notNull="true" defaultValue="1"/>

				<t:fieldSelect property="daztbh"   caption="大站台编号" width="140" src="/kac/queryChewDaztbh.ajax" notNull="true" parents="usercenter,flag" code="daztbh" show="daztbh"/>
								
				<t:fieldSelect width="140" property="chewzt" caption="车位使用状态"   convert="chewzt"  notNull="true" defaultValue="0"/>
				<t:fieldSelect width="140" property="biaos" caption="标识"  convert="biaos" defaultValue="1" notNull="true"/>
			</t:grid>
		</t:fieldLayout>
		<t:fieldLayout prefix="record2" showLabel="false" columns="1" >
			<t:fieldGrid parents="usercenter,chewbh,chengysbh" width="550" property="guanlcys" caption="关联承运商" >
				<t:grid id="grid_guanlcys" caption="关联承运商"  scrollHeight="100" 
				src="/kac/queryChewChengys.ajax"  idKeys="chengysbh" showNum="true" back="NOT"
				submit="NOT" reset="NOT" add="NOT" edit="NOT" load="false"  
				editable="true" preSaveRowsEvent="preSaveEvent" showEditorAddName="editorAdd" showEditorRemoveName="editorRemove">
					<t:fieldLayout id="chengys2" prefix="chengys">
						<t:fieldHidden property="usercenter" caption="用户中心" />
						<t:fieldHidden property="chewbh" caption="车位编号"  />
						<t:fieldHidden property="daztbh" caption="大站台编号编号"  />
					</t:fieldLayout>
					<t:gridCol property="chengysbh" caption="承运商编号" width="140" editor="fieldText"  editorOptions="{ 'dataType':'^[0-9A-Z]{6}[\\s0-9A-Z]{2}[0-9A-Z]{2}$','minLength':'10','maxLength':'10',
						'notNull':true, closeEvent:func_set_gongysbh , 'expressionMessage':'承运商编号只能为10位' }"></t:gridCol>
					<t:gridCol property="gongsmc" caption="承运商名称" width="300"  editor="Text" ></t:gridCol>
					<t:gridCol property="" caption="" width="200"></t:gridCol>
				</t:grid>
			</t:fieldGrid>
		</t:fieldLayout>
		<t:button caption="提交" name="submit_zdy" ></t:button>
	</t:form>
	
	
	
	</t:page>
	
<script type="text/javascript">
	var src='';
	//标识
	$.sdcui.serverConfig.convertArray['biaos'] = {
		'1' : '有效',
		'0' : '无效'
	};
	
	//车位使用状态
	$.sdcui.serverConfig.convertArray['chewzt'] = {
		'1' : '占用',
		'0' : '空闲'
	};
	//车位属性
	$.sdcui.serverConfig.convertArray['chewsx'] = {
		'4' : '急件车位',
		'3' : '通用车位 ',
		'2' : '专用车位',
		'1' : '非专用车位'
	};
	
	//关联承运商的隐藏
	function record1_chewsx_change(){
		$('#record1_chewzt').removeClass('disabled');
		if("1" == $('#record1_chewsx').fieldValue() || "3" == $('#record1_chewsx').fieldValue() || '4'== $('#record1_chewsx').fieldValue()){
			$('#grid_guanlcys').hide();
		}
		if("2" == $('#record1_chewsx').fieldValue()){
			$('#grid_guanlcys').show();
		}
		
				//急件车位时，默认为空闲状态且 不能修改
	
		if('4'== $('#record1_chewsx').fieldValue()){
			$('#record1_chewzt').fieldValue('0');
			$('#record1_chewzt').addClass('disabled');
		}
		
	}

	//根据承运商编号显示承运商名称
	
	function func_set_gongysbh(){
		var  cell = this.col.cell;
		var rowElement = cell.parent('tr:first');
	
		var gongsmcIndex = $('td.gongsmc:first').prevAll().length;
		var lingjbhStr = rowElement.find('td:eq(0)').text();
		var params = [];
		params.push("usercenter="+$("#record1_usercenter").fieldValue());		//用户中心
		params.push("chengysbh="+lingjbhStr);		 //供应商编号
		$.sdcui.ajaxUtil.ajax({
					url : "../kac/queryGongys.ajax",
					data:params.join('&'),
					success : function(result) {
					var  obj = result.result;
					if("" == obj){
					
						cell.parent('tr:last').find('td:eq(1)').text("");
					}else{
						if(""==lingjbhStr){
							cell.parent('tr:last').find('td:eq(1)').text("");
						}else{
							rowElement.find('td:eq('+gongsmcIndex+')').text(obj[0].gongsmc);
						}
					}
								 	
					}
		});
	}

	
	
	//修改按钮
	function func_button_edit() {

		$('#form_chew').form("clear");//清除弹出窗口的数据
		
		$('#form_chew').removeClass('operant-add');//增加的operant为1，修改的operant为2
		
		
		var record = $("#grid_chew").grid("getSelectedRecords")[0];//选中的行的数据
		$('#form_chew').form('fillRecord', $.extend({}, record));


		$("#record1_flag").fieldValue(record.daztbh);		
		$('#grid_guanlcys').grid('clearBatchData');
		
		$('#grid_guanlcys').grid('reload',false,[],true);
		$("#record1_flag").fieldValue(record.daztbh);	
		$("#form_chew").form("open","修改");
		$("#record1_daztbh").fieldValue(record.daztbh);
		$("#record1_flag").fieldValue(record.daztbh);	
	};

	
	
	function preSaveEvent(){		
		$('#form_chew').form('submit');
		return false;
	}

	//提交
	function func_button_submit_zdy(){
		if($("#grid_guanlcys").grid("isEditedCell")){
			$("#grid_guanlcys").grid("saveRows");
		}else{		
			if("2" == $("#record1_chewsx").fieldValue()){
				var record = $("#grid_guanlcys").grid("getRecords");
				if(record.length == 0){
					alert("缺少承运商关系");
					$("submit_zdy").attr("disable");
				}else{
					if($("#grid_guanlcys").grid("isEditedCell")){
						$("#grid_guanlcys").grid("saveRows");
					}else{
					}		
					$('#form_chew').form('submit');
				}
			}else{
				var record = $("#grid_guanlcys").grid("getRecords");
				if(record.length != 0){
					sxchew("../kac/removeChengys.ajax");
				}
				$('#form_chew').form('submit');
			}
		}
	}		
	

	
		//车位列表行改变事件
	function grid_chew_click(record, rowIndex) {
		$("#chengys_usercenter").fieldValue(record.usercenter); //用户中心
		$("#chengys_chewbh").fieldValue(record.chewbh);	//车位编号
		$("#chengys_daztbh").fieldValue(record.daztbh);	//大站台编号
		$("#chengys_chengysbh").fieldValue("");	// 承运商编号
		$("#chengys_biaos").fieldValue("1");	//标识
		$('#grid_chengys').grid('reload',false,[],true);
	}
	
		//监听标识
	function record1_biaos_change() {
		var biaos = $('#record1_biaos').fieldValue();
		//无效可以改为有效
		if('0' == biaos){
			$('#record1_biaos').removeClass("disabled");
			$('#record1_biaos input:first').removeAttr("disabled");
// 			$('#record1_biaos').fieldEnabled();
		}else{
			$('#record1_biaos').addClass("disabled");
			$('#record1_biaos input:first').attr("disabled",true);
// 			$('#record1_biaos').fieldDisabled();
		}
		return true;	
	}
	
		//失效按钮
	function func_button_del() {
		if(confirm("确认失效")){
			var record = $("#grid_chew").grid("getSelectedRecords");
			var params = [];
			params.push("usercenter="+record[0].usercenter);	//用户中心
			params.push("chewbh="+record[0].chewbh);		//车位编号
			params.push("daztbh="+record[0].daztbh);		//大站台编号
			params.push("biaos = 0");		//标识
			
			if('1' == record[0].chewzt){
				alert("车位被占用，不能失效");
			}else{
				if ( '1' == record[0].biaos ) {
				//判斷是否有叉車關係
				$.sdcui.ajaxUtil.ajax({
					url : "../kac/queryChachew.ajax",
					data:params.join('&'),
					success : function(result) {
						if(0 ==result.result.total){
							//没有叉车关系，判断是否为专用车位
							if( 2 ==record[0].chewsx){
								if(confirm("删除车位该车位下的承运商关系也将被删除，是否确认")){
								sxchew("../kac/removechewCys.ajax");
								alert("失效成功");
								}
							}else{
								sxchew("../kac/removeChew.ajax");
								alert("失效成功");
							}
						}else{
							//有叉车关系
							if( 2 ==record[0].chewsx){
								if(confirm("删除车位该车位下的承运商关系或叉车关系将被删除，是否确认")){
								sxchew("../kac/removeChachewCys.ajax");
								alert("失效成功");
								}
							}else{
								sxchew("../kac/removeChachew.ajax");
								alert("失效成功");
							}
						}
					}
				})
			} else {
				alert("数据已失效");
			}
			}
		}
	}
	
	function sxchew(url){
		var record = $("#grid_chew").grid("getSelectedRecords");
		
		var params = [];
		params.push("usercenter="+record[0].usercenter);	//用户中心
		params.push("chewbh="+record[0].chewbh);		//车位编号
		params.push("daztbh="+record[0].daztbh);		//大站台编号
		params.push("biaos=0");		//标识
		
		$.sdcui.ajaxUtil.ajax({
		url : url,
		data:params.join('&'),
		success : function(result) {
			$("#grid_chew").grid('reload');
		}
		});
	}
	
	/*
		$(document).ready(function(){
			$("#grid_chew").find("input[name='chewbh']").bind("focus",function (){
 				$('#chew_chengysbh').fieldValue("");
 			});
 			$("#grid_chew").find("input[name='chewsx']").bind("focus",function (){
 				$('#chew_chengysbh').fieldValue("");
 			});
 			$("#grid_chew").find("input[name='biaos']").bind("focus",function (){
 				$('#chew_chengysbh').fieldValue("");
 			});
 			$("#grid_chew").find("input[name='daztbh']").bind("focus",function (){
 				$('#chew_chengysbh').fieldValue("");
 			});
 		
 			
 			$("#grid_chew").find("input[name='chengysbh']").bind("focus",function (){
 				$('#chew_chewbh').fieldValue("");
 				$('#chew_chewsx').fieldValue("");
 				$('#chew_biaos').fieldValue("");
 			//	$('#chew_daztbh').fieldValue("");
 			});
		 })
	*/
		//空格查询
	function grid_chew_beforeSubmit() {
		$("#chew_chwebh").fieldValue(trim($("#chew_chwebh").fieldValue()));
		
		var chewbhStr = $('#chew_chwebh').fieldValue();
		$('#chew_chwebh').fieldValue(trim(chewbhStr));
		
		var chewsxStr = $('#chew_chwesx').fieldValue();
		$('#chew_chwesx').fieldValue(trim(chewsxStr));
		
		var chengysbhStr = $('#chew_chengysbh').fieldValue();
	
		$('#chew_chengysbh').fieldValue(trim(chengysbhStr));
		
		if( ""==$('#chew_chengysbh').fieldValue()){
		
		}
		else{
		
			$('#grid_chengys').grid('clear');
			
			$("#chengys_usercenter").fieldValue($("#chew_usercenter").fieldValue());	//用户中心
			
			$("#chengys_chewbh").fieldValue($("#chew_chwebh").fieldValue());		//车位编号
			$("#chengys_quybh").fieldValue($("#chew_quybh").fieldValue());		//区域编号
			$("#chengys_chewsx").fieldValue($("#chew_chewsx").fieldValue());		//区域编号
			
			
			$("#chengys_chengysbh").fieldValue($("#chew_chengysbh").fieldValue());		//供应商编号
			
			
			$("#chengys_daztbh").fieldValue($("#chew_daztbh").fieldValue());		//大站台编号
			$('#grid_chengys').grid('reload');
			}
		}
	


	

</script>
</t:html>