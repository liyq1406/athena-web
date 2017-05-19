<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.kuw}">

<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>
<t:page i18n="i18n.ckx.cangk.i18n_kuw">
	<t:grid id="grid_kuw" caption="${i18n.kuw}"  dataFormId="form_kuwadd" edit="NOT" save="NOT" remove="NOT" load="false"  showNum="true" back="NOT" showCheckbox="true"
		idKeys="usercenter,cangkbh,zickbh,kuwbh" src="/cangk/queryKuw.ajax" saveRowsSrcs="/cangk/updateKuw.ajax" scrollHeight="290" pageSize="15">
		<t:fieldLayout id="fl_kuw" prefix="kuw" columns="4">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" defaultValue="${usercenter}" convert="queryUserCenterMap"  width="120"/>
			<t:fieldText property="cangkbh" caption="${i18n.cangkbh}" dataType="text" maxLength="3" minLength="3" width="120"/>
			<t:fieldText property="zickbh" caption="${i18n.zickbh}"  dataType="text" maxLength="3" minLength="3" width="120"/>
			<t:fieldText property="kuwbh" caption="${i18n.kuwbh}" dataType="text" maxLength="6" width="120"/>
			<t:fieldText property="kuwdjbh" caption="${i18n.kuwdjbh}" dataType="text" maxLength="5" width="120"/>
			<t:fieldSelect property="kuwzt" caption="${i18n.kuwzt}"  width="120" convert="kuwztxx_ckx"/>
			<t:fieldText property="mian" caption="${i18n.mian}" dataType="text" maxLength="2" width="120"/>
			<t:fieldText property="ceng" caption="${i18n.ceng}" dataType="text" maxLength="2" width="120"/>
			<t:fieldText property="lingjbh" caption="${i18n.dingzlj}" dataType="text" maxLength="10" width="120"/>
		</t:fieldLayout>
		
		<t:button caption="导出" name="download"></t:button>
		<t:button caption="${i18n.save}" name="save"></t:button>
		<t:button caption="${i18n.edit}" name="update1" active="0" icon="editRecord"></t:button>
		<t:button caption="${i18n.remove}" active="2" name="delete1"></t:button>
		
		<t:gridCol property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue=""/>
		<t:gridCol property="cangkbh" caption="${i18n.cangkbh}" width="130"/>
		<t:gridCol property="zickbh" caption="${i18n.zickbh}" width="130"/>
		<t:gridCol property="kuwbh" caption="${i18n.kuwbh}" width="130"/>
		<t:gridCol property="lingjbh" caption="${i18n.dingzlj}" width="130"/>
		<t:gridCol property="kuwdjbh" caption="${i18n.kuwdjbh}"  width="130"/>
		<t:gridCol property="kuwzt" caption="${i18n.kuwzt}" editor="fieldSelect" editorOptions="{openEvent:kuwztEditAble}" width="130" convert="kuwzt_ckx"/>
		<t:gridCol property="yifgs" caption="${i18n.yifgs}" width="130"/>
		<t:gridCol property="baozlx" caption="${i18n.baozlx}" width="130"/>
		<t:gridCol property="baozgs" caption="${i18n.baozgs}" editorOptions="{openEvent:baozgsEditAble}" editor="fieldText" width="130"/>
	</t:grid>

	<t:form dialog="true" id="form_kuwadd" action="/cangk/insertKuw.ajax" width="600" reset="NOT" submit="NOT" >
		<t:fieldLayout prefix="r1">
			<t:grid id="add1" caption="${i18n.kuw}" src="/cangk/insertKuw.ajax"  submit="NOT" reset="NOT" add="NOT" edit="NOT" remove="NOT" load="false" save="NOT">
				<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" defaultValue="${usercenter}" convert="queryUserCenterMap" />
					<t:fieldText property="cangkbh" caption="${i18n.cangkbh}" notNull="true" maxLength="3" minLength="3" dataType="text"/>
					<t:fieldText property="zickbh" caption="${i18n.zickbh}" notNull="true" expression="^([A-Z0-9]{3})$" expressionMessage="[A-Z0-9]"/>
					<t:fieldText property="mian" caption="${i18n.mian}" notNull="true" expression="^[A-Z0-9]{2}$" expressionMessage="2位大写字母或者数字"/>
					<t:fieldText property="ceng" caption="${i18n.ceng}" notNull="true" expression="^[A-Z0-9]{2}$" expressionMessage="2位大写字母或者数字"/>
				</t:grid>
			</t:fieldLayout>
			<t:fieldLayout prefix="r2" showLabel="false" columns="1" >
				<t:fieldGrid parents="usercenter,cangkbh,zickbh,mian,ceng,qislh,jieslh,kuwdjbh" width="600" property="kuws" mode="reload">
					<t:grid id="add2" idKeys="usercenter,cangkbh,zickbh,qislh,jieslh,kuwdjbh" 
					showEditorAddName="editorAdd" showEditorRemoveName="editorRemove"
					preSaveRowsEvent="preSaveEvent" submit="NOT" reset="NOT" add="NOT" edit="NOT" remove="NOT" editable="true" panel="false" showNum="true">
						<t:gridCol property="qislh" caption="${i18n.qislh}" width="100" editor="fieldText" editorOptions="{'expression':'^[0-9][0-9]$','expressionMessage':'2位整数型数字','notNull':true}"/>
						<t:gridCol property="jieslh" caption="${i18n.jieslh}" width="100" editor="fieldText" editorOptions="{'expression':'^[0-9][0-9]$','expressionMessage':'2位整数型数字','notNull':true}"/>
						<t:gridCol property="kuwdjbh" caption="${i18n.kuwdjbh}" width="120" editor="fieldText" editorOptions="{openEvent:kuwdjbhyz,'dataType':'text','maxLength':'5'}"/>
						<t:gridCol property="kuwzt" caption="${i18n.kuwzt}" defaultValue="0" width="100" editor="fieldSelect" convert="kuwzt_ckx" editorOptions="{'dataType':'number','notNull':true}"/>
						<t:gridCol property="" caption="" />
					</t:grid>
				</t:fieldGrid>
				<t:button caption="${i18n.tij}" name="tijiao"></t:button>
			</t:fieldLayout>
			
		</t:form>
		
	<t:form dialog="true" id="form_kuwupdate" action="/cangk/updateKuwdjbh.ajax" width="800" reset="NOT">
	<t:fieldLayout prefix="record" columns="1" showLabel="false">
		<t:fieldGrid parents="usercenter,cangkbh,zickbh,kuwbh"  width="800" property="kuws" mode="reload">
			<t:grid id="update1" idKeys="usercenter,cangkbh,zickbh,kuwbh" showCheckbox="true" caption="${i18n.kuw}"  src="/cangk/queryKuwdjbh.ajax" reset="NOT" add="NOT" edit="NOT" remove="NOT" load="false" save="NOT" showEditorAdd="false" showEditorRemove="false">
				<t:fieldLayout prefix="r3" columns="2">
						    <t:fieldSelect property="usercenter" caption="${i18n.usercenter}" defaultValue="${usercenter}" convert="queryUserCenterMap" />
							<t:fieldText property="cangkbh" caption="${i18n.cangkbh}" notNull="true" maxLength="3" minLength="3" dataType="text"/>
							<t:fieldText property="zickbh" caption="${i18n.zickbh}" notNull="true" expression="^([A-Z0-9]{3})$" expressionMessage="[A-Z0-9]"/>
							<t:fieldText property="mian" caption="${i18n.mian}" notNull="true" expression="^[A-Z0-9]{2}$" expressionMessage="2位大写字母或者数字"/>
							<t:fieldText property="ceng" caption="${i18n.ceng}" notNull="true" expression="^[A-Z0-9]{2}$" expressionMessage="2位大写字母或者数字"/>
							<t:fieldText property="qislh" caption="${i18n.qislh}" notNull="true" dataType="text" minLength="2" maxLength="2"  expression="^[0-9][0-9]$" expressionMessage="2位数字"/>
							<t:fieldText property="jiangl" caption="${i18n.jiangl}" notNull="true" dataType="text" minLength="1" maxLength="2" expression="^(0|[1-9][0-9]{0,2})$" expressionMessage="0-99的整数"/>
					</t:fieldLayout>
							<t:gridCol property="ykuwdjbh" caption="${i18n.kuwdjbh}" hidden="true"/>
							<t:gridCol property="qislh" caption="${i18n.qislh}" width="100" />
							<t:gridCol property="kuwbh" caption="${i18n.kuwbh}"/>
							<t:gridCol property="kuwdjbh" caption="${i18n.kuwdjbh}" editorOptions="{openEvent:kuwdjbh}" width="120"/>
							<t:gridCol property="kuwzt" caption="${i18n.kuwzt}" width="100" convert="kuwzt_ckx" editorOptions="{'notNull':true}"/>
							<t:gridCol property="kuwdjbhtd" caption="替代库位等级编号" editorOptions="{openEvent:kuwdjbhtd}" width="100" editor="fieldText"/>
<%-- 							<t:gridCol property="kuwzttd" caption="替代库位状态" width="100" editor="fieldSelect" convert="kuwzt_ckx" editorOptions="{'notNull':true}"/> --%>
			                <t:gridCol property="" caption="" />
			</t:grid>
		</t:fieldGrid>
	</t:fieldLayout>
				<t:button caption="${i18n.jied}" name="jied"></t:button>
				<t:button caption="${i18n.dongj}" name="dongj"></t:button>
	</t:form>
</t:page>

<script type="text/javascript">
	
	function func_button_tijiao(){
		var record=$("#add2").grid("getRecords");
 		if(record.length > 0){
 			for(var i=0;i<record.length;i++){
 				if(record[i].qislh==undefined){
 	 				alert("第"+i+1+"行"+"第1列,"+"${i18n.qislhwk}");
 	 				return false;
 	 			}else if(record[i].jieslh==undefined){
 	 				alert("第"+i+1+"行"+"第2列,"+"${i18n.jieslhwk}");
 	 				return false;
 	 			}else if(record[i].kuwdjbh==undefined){
 	 				var zickbh=$('#r1_zickbh').fieldValue();
 	 				if(zickbh.substring(2,3)!="P"&&zickbh.substring(2,3)!="S"&&zickbh.substring(2,3)!="D"){
 	 					alert("第"+i+1+"行"+"第3列,"+"${i18n.kuwdjbhwk}");
 	 					return false;
 	 				}
 	 			}
 			}
 		}
		$('#form_kuwadd').form('submit');
	}
	//选中数据全部解冻
	function func_button_jied(){
		var record=$("#update1").grid("getSelectedRecords");
 		if(record.length > 0){
 			var params = [];
 			for(var i=0;i<record.length;i++){
				params.push('edit['+i+'].kuwbh='+record[i].kuwbh);
				params.push('edit['+i+'].kuwdjbh='+record[i].kuwdjbh);
				params.push('edit['+i+'].kuwzt='+record[i].kuwzt);
 			}
 			$.sdcui.ajaxUtil.ajax({
		 	 	   url:"../cangk/updatekwztjied.ajax",
		 	 	   data:params.join('&'),
		 	       success:function (result){
		 	    	 $('#update1').grid('reload');//刷新表格数据	
		 	    	  }
		     	});
 		}else{
 			alert("${i18n.qingxxzyhsj}");
 		}
	}
	//选中数据全部冻结
	function func_button_dongj(){
		var record=$("#update1").grid("getSelectedRecords");
 		if(record.length > 0){
 			var params = [];
			for(var i=0;i<record.length;i++){
				params.push('edit['+i+'].kuwbh='+record[i].kuwbh);
				params.push('edit['+i+'].kuwdjbh='+record[i].kuwdjbh);
				params.push('edit['+i+'].kuwzt='+record[i].kuwzt);
 			}
			$.sdcui.ajaxUtil.ajax({
		 	 	   url:"../cangk/updatekuwztdongj.ajax",
		 	 	   data:params.join('&'),
		 	       success:function (result){
		 	    	 $('#update1').grid('reload');//刷新表格数据	
		 	    	  }
		     	});
 		}else{
 			alert("${i18n.qingxxzyhsj}");
 		}
	}
	
	//库位状态：冻结  解冻
	$.sdcui.serverConfig.convertArray['kuwzt_ckx'] = {
		'1' : '${i18n.dongj}',
		'0' : '${i18n.jied}'
	};
	//库位状态：冻结  解冻（满，未满，空）
	$.sdcui.serverConfig.convertArray['kuwztxx_ckx'] = {
		'P' : '${i18n.man}',
		'A' : '${i18n.weim}',
		'L' : '${i18n.kong}',
		'I' : '${i18n.dongj}'
	};
	function preSaveEvent(){		
		$('#form_kuwadd').form('submit');
		return false;
	}
	
 	//自定义删除按钮
 	function func_button_delete1(){
 		var record=$("#grid_kuw").grid("getSelectedRecords");
 		if(record.length > 0){
 			if(confirm("${i18n.comfigdelete}")){
 				var params = [];
				for(var i=0;i<record.length;i++){
					if(record[i].yifgs>0){
						alert("已经存在包装个数的不能删除！");
						return false;
					}else{
						params.push('delete['+i+'].cangkbh='+record[i].cangkbh);
						params.push('delete['+i+'].kuwbh='+record[i].kuwbh);
						params.push('delete['+i+'].kuwdjbh='+record[i].kuwdjbh);
						params.push('delete['+i+'].kuwzt='+record[i].kuwzt);
						params.push('delete['+i+'].usercenter='+record[i].usercenter);
						params.push('delete['+i+'].zickbh='+record[i].zickbh);
						params.push('delete['+i+'].baozgs='+record[i].baozgs);
						params.push('delete['+i+'].baozlx='+record[i].baozlx);
						params.push('delete['+i+'].yifgs='+record[i].yifgs);
					}
				}
				
 				$.sdcui.ajaxUtil.ajax({
 		 	 	   url:"../cangk/removeKuw.ajax",
 		 	 	   data:params.join('&'),
 		 	       success:function (result){
 		 	    	 $('#grid_kuw').grid('reload');//刷新表格数据	
 		 	    	  }
 		     	});
 	 		}
 		}else{
 			alert("${i18n.qingxxzyhsj}");
 		}
 		/* var cell = this.col.cell;
		var rowElement = cell.parent("tr:first");
		
		var qislhIndex = $('td.qislh:first').prevAll().length;
		
			var params = [];
			params.push("usercenter="+$("#r3_usercenter").fieldValue());	//用户中心
			params.push("cangkbh="+$("#r3_cangkbh").fieldValue());		//仓库编号
			params.push("zickbh="+$("#r3_zickbh").fieldValue());		//子仓库编号
			params.push("mian="+$("#r3_mian").fieldValue());		//面
			params.push("ceng="+$("#r3_ceng").fieldValue());		//层
			params.push("qislh="+$("#r3_qislh").fieldValue());		//起始列号
			params.push("jiangl="+$("#r3_jiangl").fieldValue());		//间隔列
			 $.sdcui.ajaxUtil.ajax({
		 	 	   url:"../cangk/removeKuw.ajax",
		 	 	   data:params.join('&'),
		 	       success:function (result){
		 	    	  var obj = result.result;
		 	    	  if (null != obj && obj != undefined) {
		 	    	  rowElement.find('td:eq(' + qislhIndex + ')').text(
								obj.yansxsm);
		 	    	  }
		 	       	}
		     	});  */

		
	}  
	
/* 	//库位等级编号在冻结的时候不可编辑
	function kuwdjbhEditAble()
	{
		var record=$("#grid_kuw").grid("getSelectedRecords")[0];
		if(record!=null){
			var kuwzt = record.kuwzt;
			var zickbh=record.zickbh;
			if('I' != kuwzt){
				if(!(zickbh.substring(2,3)=="P"||zickbh.substring(2,3)=="S")){
					return true;
				}
			}
		}
		
		return false;
	} */
	function kuwdjbh()
	{
		var zickbh=$('#r3_zickbh').fieldValue();
		if(zickbh.substring(2,3)=="P"||zickbh.substring(2,3)=="S"){
			
			return false;
		}
		return true;
	}
	function kuwdjbhtd()
	{
		var zickbh=$('#r3_zickbh').fieldValue();
		if(zickbh.substring(2,3)=="P"||zickbh.substring(2,3)=="S"){
			
			return false;
		}
		return true;
	}
	function kuwdjbhyz(){
		var event = window.event || arguments.callee.caller.arguments[2];
		var td = event.srcElement || event;
		var baohdIndex = td.colIndex
		var tr;
		if (event.srcElement) {
			tr = $(td).parent('tr:first');
		} else {
			tr = $(td.cell).parent('tr:first');
		}
		var zickbh=$('#r1_zickbh').fieldValue();
		if(zickbh.substring(2,3)=="P"||zickbh.substring(2,3)=="S"){
			$(tr).find('td:eq('+baohdIndex+')').val("");
			return false;
		}
		return true;
	}
	//库位状态为A（未满）时，可修改包装个数
	function baozgsEditAble()
	{
		var record=$("#grid_kuw").grid("getSelectedRecords")[0];
		if(record!=null){
			var kuwzt = record.kuwzt;
			if('A' == kuwzt ){
				return true;
			}
		}
		
		return false;
	}
	//已放个数有值的时候，库位状态不可编辑
	function kuwztEditAble()
	{
		var yifgs =	$($(this).find("td.editing").parent().find("td")[7])[0].innerHTML
		if(yifgs < 1||yifgs==undefined){
			return true;
		}
		return false;
	}
	//自定义修改按钮
	function func_button_update1(){
		$('#r3_qislh').fieldValue("");
		$('#r3_jiangl').fieldValue("");
		$('#r3_usercenter').fieldValue("");
		$('#r3_cangkbh').fieldValue("");
		$('#r3_zickbh').fieldValue("");
		$('#r3_mian').fieldValue("");
		$('#r3_ceng').fieldValue("");
		//$('#update1').grid('reload');//刷新表格数据
		//$('#update1').grid('clear');
		$('#update1').grid('clearBatchData');
		$('#update1').grid('reload',false,[],true);
		var record=$("#grid_kuw").grid("getSelectedRecords")[0];
		if(record!=null){
			$('#form_kuwupdate').form('fillRecord',$.extend({},record));
			var kuwbh = record.kuwbh;
			$('#r3_mian').fieldValue(kuwbh.substring(0,2));
			$('#r3_ceng').fieldValue(kuwbh.substring(4));
			$("#form_kuwupdate").form("open");
			
		}else{
			$("#form_kuwupdate").form("open");
		}
		
	}
	
	//空格查询
	function grid_kuw_beforeSubmit() {
		$("#kuw_cangkbh").fieldValue(trim($("#kuw_cangkbh").fieldValue()));
		$("#kuw_zickbh").fieldValue(trim($("#kuw_zickbh").fieldValue()));
		$("#kuw_kuwbh").fieldValue(trim($("#kuw_kuwbh").fieldValue()));
		$("#kuw_kuwdjbh").fieldValue(trim($("#kuw_kuwdjbh").fieldValue()));
	}
	
	
	//导出数据
	function func_button_download(){
		
		var usercenter = trim($('#kuw_usercenter').fieldValue());
		var cangkbh = trim($('#kuw_cangkbh').fieldValue());
		var zickbh = trim($('#kuw_zickbh').fieldValue());
		var kuwbh = trim($('#kuw_kuwbh').fieldValue());
		var kuwdjbh = trim($('#kuw_kuwdjbh').fieldValue());
		var kuwzt = $('#kuw_kuwzt').fieldValue();
		var lingjbh = $('#kuw_lingjbh').fieldValue();
		
		var record = {'usercenter':usercenter,'cangkbh':cangkbh,'zickbh':zickbh,'kuwbh':kuwbh,'kuwdjbh':kuwdjbh,'kuwzt':kuwzt,'lingjbh':lingjbh};
		
		$.sdcui.pageUtils.goPage({
			url : '../cangk/downloadKuw.do',
			record : record,
			mode : 'form',
			beforeSubmit : function(){
				return true;
			}
	   });
	}
	
</script>

</t:html>