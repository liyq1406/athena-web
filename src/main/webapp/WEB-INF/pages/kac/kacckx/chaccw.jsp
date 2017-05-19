<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.xiehzt}">

<!-- 
	  叉车-车位
	 @author liushuang
	 @date 2015-1-20
 -->

<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>
<style type="text/css">
  .youi-fieldLayout table td.contral.label-col { width: 100px; }
</style>
<t:page i18n="">
 	<t:grid id="grid_chac" caption="叉车" idKeys="usercenter,chacbh,daztbh,quybh" src="/kac/queryChac.ajax"  back="NOT" 
		 editable="false"  edit="NOT" showNum="true" scrollHeight="150"  afterParse="loadChaccw" 
		 clickRowEvent="grid_chac_click" dataFormId="form_chac"  load="false" 
		 >
		<t:fieldLayout id="fl_chac" prefix="chac" columns="3">
				<t:fieldSelect property="usercenter" caption="用户中心" convert="queryUserCenterMap" defaultValue="${usercenter }" notNull="true" width="150" />
				<t:fieldSelect property="quybh" caption="区域编号"  parents="usercenter" parentsAlias="usercenter" src="/kac/queryPostDengdqy.ajax" code="quybh" show="quybh" notNull="true" width="150"/>
				<t:fieldSelect property="daztbh" caption="大站台编号" parents="usercenter,quybh" parentsAlias="usercenter,quybh" src="/kac/queryPostDazt.ajax" code="daztbh" show="daztbh"  width="150"/>
				<t:fieldText property="chacbh" caption="叉车编号" maxLength="10"  dataType="text" width="150"/>
				<t:fieldSelect property="chacz" caption="叉车组"   parents="usercenter" parentsAlias="usercenter" src="/kac/queryChacz.ajax" code="chacz" show="chacz"  width="150"/>
				<t:fieldSelect property="biaos" caption="标识" convert="biaos" defaultValue="1"  width="150" />
		</t:fieldLayout>
		<t:gridCol property="usercenter" caption="用户中心"  convert="queryUserCenterMap"  width="120" />
		<t:gridCol property="chacbh" caption="叉车编号"  width="120" />
		<t:gridCol property="chacmc" caption="叉车名称"  width="120" />
		<t:gridCol property="daztbh" caption="大站台编号"  width="120" />
		<t:gridCol property="chacz" caption="叉车组"  width="120" />
		<t:gridCol property="biaos" caption="标识" convert="biaos" defaultValue="1" width="100"/>
		<t:gridCol property="" caption=" " ></t:gridCol>
	</t:grid>
	
	<t:grid id="grid_chew" scrollHeight="150" caption="关联车位" idKeys="usercenter,chacbh,chewbh" src="/kac/queryChewcc.ajax" 
		add="NOT" edit="NOT" submit="NOT" reset="NOT" save="NOT" back="NOT"  
		editable="false" remove="NOT" load="false"  showNum="true">
		<t:fieldLayout id="fl_chew" prefix="chew">
			<t:fieldHidden property="usercenter" caption="用户中心"/>
			<t:fieldHidden property="chacbh" caption="叉车编号"/>
			<t:fieldHidden property="daztbh" caption="大站台编号"/>
			<t:fieldHidden property="biaos" caption="标识" defaultValue="1" />
		</t:fieldLayout>
		<t:gridCol property="chewbh" caption="车位编号" width="150"/>
		<t:gridCol property="chewsx" caption="车位属性"  width="150" convert="chewsx"/>
		<t:gridCol property="" caption="" />
	</t:grid>
	
	
	<t:form id="form_chac" caption="" dialog="true" reset="NOT" submit="NOT"
		width="870" idKeys="usercenter,chacbh,daztbh,quybh">
		<t:fieldLayout columns="3" prefix="chacFROM" showLabel="true">
					<t:fieldSelect property="usercenter" caption="用户中心" convert="queryUserCenterMap" defaultValue="${usercenter }" notNull="true"  width="150" />
					<t:fieldSelect property="quybh" caption="区域编号"  parents="usercenter" parentsAlias="usercenter" 
									src="/kac/queryPostDengdqy.ajax" code="quybh" show="quybh" notNull="true" width="150" />
					<t:fieldSelect property="daztbh" caption="大站台编号" parents="usercenter,quybh" parentsAlias="usercenter,quybh" 
									src="/kac/queryPostDazt.ajax" code="daztbh" show="daztbh" notNull="true" width="150"/>
					<t:fieldText property="chacbh" caption="叉车编号" maxLength="10" dataType="text" notNull="true" width="150"/>
					<t:fieldText property="chacmc" caption="叉车名称" maxLength="32"  width="150" />
					<t:fieldSelect property="chacz" caption="叉车组"  notNull="true" parents="usercenter" parentsAlias="usercenter" src="/kac/queryYXChacz.ajax" code="chacz" show="chacz"  width="150"/>
					<t:fieldSelect property="biaos" caption="标识"  defaultValue="1" convert="biaoss" width="150" />
		</t:fieldLayout>
		<t:fieldLayout  prefix="chewFROM" columns="1" showLabel="false" >
			<t:fieldGrid property="chew" parents="chac" mode="reload" width="870" >
				<t:grid id="from_grid_chew" caption="关联车位" idKeys="usercenter,chacbh,daztbh,quybh,chewbh"  showCheckbox="true"  src="/kac/queryChaccw.ajax"
					add="NOT" edit="NOT" submit="NOT" reset="NOT" save="NOT" back="NOT"  remove="NOT" load="false"  preSaveRowsEvent="preSaveEvent"  >
			 			<t:fieldLayout id="f2_chew" prefix="chew1">
							<t:fieldHidden property="usercenter" caption="用户中心"/>
							<t:fieldHidden property="daztbh" caption="大站台编号"/>
							<t:fieldHidden property="biaos" caption="标识" defaultValue="1" />
						</t:fieldLayout>
						<t:gridCol property="chewbh" caption="车位编号" width="120"/>
						<t:gridCol property="chewsx" caption="车位属性" convert="chewsx" width="120"/>
						<t:gridCol property="" caption="" convert="" />

				</t:grid>
			</t:fieldGrid>
		</t:fieldLayout>
		<t:button caption="提交" name="submit_zdy"></t:button>
	</t:form>
</t:page>

<script type="text/javascript">

	//标识
	$.sdcui.serverConfig.convertArray['biaos'] = {
		'1' : '有效',
		'0' : '无效',
	};
	
	//标识
	$.sdcui.serverConfig.convertArray['biaoss'] = {
		'1' : '有效',
	};
	
	//车位属性
	$.sdcui.serverConfig.convertArray['chewsx'] = {
		'4' : '急件车位',
		'3' : '通用车位',
		'2' : '专用车位',
		'1' : '非专用车位'
	};
	

	//空格查询
	function grid_chac_beforeSubmit() {
		$("#chac_chacbh").fieldValue(trim($("#chac_chacbh").fieldValue()));	
		}
	
	
	//叉车行事件
	function grid_chac_click(record, rowIndex){
		$("#chew_usercenter").fieldValue(record.usercenter);	//用户中心
		$("#chew_chacbh").fieldValue(record.chacbh);		 //叉车编号
		$("#chew_daztbh").fieldValue(record.daztbh);         //大站台编号
		$('#grid_chew').grid('reload',false,[],true);
	}
    

		//增加查询
	function chacFROM_daztbh_change(){
		var record = $("#chacFROM_daztbh").grid("getSelectedRecords");
						
		$("#chew1_usercenter").fieldValue($("#chacFROM_usercenter").fieldValue());
		$("#chew1_daztbh").fieldValue($("#chacFROM_daztbh").fieldValue());
		$("#chew1_biaos").fieldValue('1');
		$("#from_grid_chew").grid("reload");
	}
    
    //保存提交按钮
    function func_button_submit_zdy() {	
    		var quybh = trim($("#chacFROM_quybh").fieldValue());
    		if("" ==quybh||null ==quybh){
    			alert("区域编号不允许为空");
    		    return ;
    		}
    		
    		var daztbh = trim($("#chacFROM_daztbh").fieldValue());
    		if("" ==daztbh||null ==daztbh){
    			alert("大站台编号不允许为空");
    		    return ;
            }
            
          
    		var chacbh = trim($("#chacFROM_chacbh").fieldValue());
    		var s=/^[a-zA-Z0-9]{0,10}$/g;
    		// var sdesc =trim(chacbh).replace(/\s+/g,"");
    		if("" ==chacbh||null ==chacbh){
    			alert("叉车编号不允许为空");
    		    return ;
    		}else if(chacbh.match(s)==null){
    			alert("叉车编号为 英文字母，数字组合，长度为10");
		      	return false;
    		}
    		
    		  var chacz = trim($("#chacFROM_chacz").fieldValue());
    		if("" ==chacz||null ==chacz){
    			alert("叉车组不允许为空");
    		    return ;
            }
    		
  			var chacmc = trim($("#chacFROM_chacmc").fieldValue());
  			var len=/^[a-zA-Z0-9\u4e00-\u9fa5]{0,32}$/g;
  			if(chacmc.match(len)==null){
    			alert("叉车名称长度为32");
		      	return false;
    		}
    
    		$("#chacFROM_chacbh").fieldValue(chacbh);	
    		$("#chacFROM_chacmc").fieldValue(chacmc);
    		
    		var record = $('#from_grid_chew').grid('getSelectedRecords');
			var params = [];
			params.push('usercenter='+$("#chacFROM_usercenter").fieldValue());
			params.push('quybh='+$("#chacFROM_quybh").fieldValue());
			params.push('daztbh='+$("#chacFROM_daztbh").fieldValue());
			params.push('chacbh='+$("#chacFROM_chacbh").fieldValue());
			if(""!=$("#chacFROM_chacmc").fieldValue()||null!=$("#chacFROM_chacmc").fieldValue()){
				params.push('chacmc='+$("#chacFROM_chacmc").fieldValue());
			}
			if(""!=$("#chacFROM_chacz").fieldValue()||null!=$("#chacFROM_chacz").fieldValue()){
				params.push('chacz='+$("#chacFROM_chacz").fieldValue());
			}
			
			for(var i=0;i<record.length;i++){
				params.push('chew_insert['+i+'].chewbh='+record[i].chewbh);
			}
			$.sdcui.ajaxUtil.ajax({
					url:'saveChac.ajax',
					data:params.join('&'),
					success:function(result){
					if(result.result.message == '叉车组已被选择，请重新选择叉车组！'){
					}else{
						$("#grid_chac").grid("reload");
						$("#form_chac").form("close");
					}
						
					}
				});
				
		
			
		//$('#form_chac').form('submit');	
	}
	
	//删除事件
	function func_button_remove(){
		var record=$("#grid_chac").grid("getSelectedRecords");
 			if(confirm("确认删除?同时会删除对应的车位关系")){
 				var params = [];
				params.push('usercenter='+record[0].usercenter);
				params.push('chacbh='+record[0].chacbh);
				params.push('daztbh='+record[0].daztbh);

 				$.sdcui.ajaxUtil.ajax({
 		 	 	   url:"removeChac.ajax",
 		 	 	   data:params.join('&'),
 		 	       success:function (result){
 		 	    	$("#chew_usercenter").fieldValue(record[0].usercenter);	//用户中心
					$("#chew_chacbh").fieldValue(record[0].chacbh);		 //叉车编号
					$("#chew_daztbh").fieldValue(record[0].daztbh);         //大站台编号
 		 	    	$('#grid_chac').grid('reload');//刷新表格数据	
					$('#grid_chew').grid('reload');
 		 	       }
 		     	});
 	 		}
 	
	}
	
	
	//事件后触发事件
	function loadChaccw(){
		//$("#grid_chew").grid("clear");
	}
	
	function form_chac_afterSubmit() {
		$('#form_chac').grid('close'); 
	}
	
	
	function preSaveEvent(){		
		$('#form_chac').form('submit');
		return false;
	}
</script>

</t:html>