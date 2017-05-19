<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		
	</head>
	<style type="text/css">
	#grid_CkxCalendarGroup .youi-fieldLayout table td.contral.label-col { width: 95px; }
	</style>
	<t:page i18n="i18n.ckx.workCalendar.i18n_workCalendar">
		<t:grid id="grid_CkxCalendarGroup" 
			idKeys="usercenter,appobj"
			dataFormId="form_ckxCalendarGroup"
			caption="${i18n.gongzsjgl}" 
			src="queryCkxCalendarGroup.ajax"
			add="NOT" load="false"
			editSrc="getCkxCalendarGroup.ajax"
			scrollHeight="310" pageSize="15"
			removeSrc="removeCkxCalendarGroup.ajax" showNum="true">
			<t:fieldLayout prefix="record0" columns="2">
				<t:fieldSelect  property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${loginUser.usercenter}" />
				<t:fieldCustom property="leix" caption="${i18n.chancztbz}"></t:fieldCustom>		
				<t:fieldHidden property="lxLength"></t:fieldHidden>
			    <t:fieldHidden property="appobj"></t:fieldHidden>
				<t:fieldText property="bianzh" dataType="text" caption="${i18n.gongzsjbz}" maxLength="8" width="175" />
				<t:fieldText property="rilbc" dataType="text"  caption="${i18n.rilbc}"  maxLength="8" width="175"/>
				<t:fieldSelect property="biaos" caption="${i18n.biaos}" convert="biaos"  width="175"/>
			</t:fieldLayout>
			<t:button name="addCalendarGroup1" icon="addRecord" caption="${i18n.add}${i18n.chanx}"></t:button>
			<t:button name="addCalendarGroup2" icon="addRecord" caption="${i18n.add}${i18n.cangkbh}"></t:button>
			<t:button name="addCalendarGroup3" icon="addRecord" caption="${i18n.add}${i18n.xiehztbz}"></t:button>
			
			<t:gridCol property="usercenter" editor="fieldSelect" convert="queryUserCenterMap" caption="${i18n.usercenter}"/>
			<t:gridCol property="appobj"   caption="${i18n.chancztbz }"/>
			<t:gridCol property="bianzh"   caption="${i18n.gongzsjbz}"/>
			<t:gridCol property="rilbc"    caption="${i18n.rilbc}"/>
			<t:gridCol property="weilbzh"  caption="${i18n.weilbzh}"/>
			<t:gridCol property="shengxsj" caption="${i18n.shengxsj}"/>
			<t:gridCol property="beiz"     caption="${i18n.gongzsjs}"/>
			<t:gridCol convert="biaos"  property="biaos"caption="${i18n.biaos}"/>
		</t:grid>
		<!-- 添加产线form -->
		<t:form dialog="true" id="form_addCkxCalendarGroup1" reset="NOT" caption="${i18n.chanxgl}" action="addCkxCalendarGroup.ajax">
			<t:fieldLayout prefix="record11">
				<t:fieldSelect  property="usercenter" notNull="true"  caption="${i18n.usercenter}" convert="queryUserCenterMap"  defaultValue="${loginUser.usercenter}"/>
				<t:fieldText  property="appobj"  caption="${i18n.chanx}" notNull="true" maxLength="5" minLength="5" dataType="text"/>
				<t:fieldSelect src="getSelectTeamCode.ajax" show="bianzh" code="bianzh"  property="bianzh"  caption="${i18n.gongzsjbz}" notNull="true"/>
				<t:fieldSelect src="getVersionNo.ajax" show="banc" code="banc" property="rilbc" caption="${i18n.rilbc}" notNull="true" parents="usercenter"/>
				<t:fieldSelect src="getSelectTeamCode.ajax" show="bianzh" code="bianzh"  property="weilbzh" caption="${i18n.weilbzh}" />
				<t:fieldCalendar property="shengxsj" caption="${i18n.shengxsj}" format="yyyy-MM-dd" />
				<t:fieldText property="beiz" notNull="true" caption="${i18n.gongzsjs}" maxLength="2"  expression="^([1-9]|1[0-9]|2[0-4])$" expressionMessage="${i18n.qingsr1d24zjdzs}" ></t:fieldText>
			</t:fieldLayout>
		</t:form>
		<!-- 添加仓库form -->
		<t:form dialog="true" id="form_addCkxCalendarGroup2" reset="NOT" caption="${i18n.cangkgl}" action="addCkxCalendarGroup.ajax">
			<t:fieldLayout prefix="record12">
				<t:fieldSelect  property="usercenter" notNull="true"  caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${loginUser.usercenter}" />
				<t:fieldText  property="appobj"  caption="${i18n.cangkbh}" notNull="true" maxLength="3" minLength="3" dataType="text"/>
				<t:fieldSelect src="getSelectTeamCode.ajax" show="bianzh" code="bianzh"  property="bianzh"  caption="${i18n.gongzsjbz}" notNull="true"/>
				<t:fieldSelect src="getVersionNo.ajax" show="banc" code="banc" property="rilbc" caption="${i18n.rilbc}" notNull="true" parents="usercenter"/>
				<t:fieldSelect src="getSelectTeamCode.ajax" show="bianzh" code="bianzh"  property="weilbzh" caption="${i18n.weilbzh}" />
				<t:fieldCalendar property="shengxsj" caption="${i18n.shengxsj}" format="yyyy-MM-dd" />
				<t:fieldText property="beiz" notNull="true" caption="${i18n.gongzsjs}" maxLength="2" expression="^([1-9]|1[0-9]|2[0-4])$" expressionMessage="${i18n.qingsr1d24zjdzs}"></t:fieldText>
			</t:fieldLayout>
		</t:form>
		<!-- 添加卸货站台form -->
		<t:form dialog="true" id="form_addCkxCalendarGroup3" reset="NOT" caption="${i18n.xiehztbzgl}" action="addCkxCalendarGroup.ajax">
			<t:fieldLayout prefix="record13">
				<t:fieldSelect  property="usercenter" notNull="true"  caption="${i18n.usercenter}" convert="queryUserCenterMap"  defaultValue="${loginUser.usercenter}"/>
				<t:fieldText property="appobj"  caption="${i18n.xiehztbz}" notNull="true" maxLength="4" minLength="4" dataType="text"/>
				<t:fieldSelect src="getSelectTeamCode.ajax" show="bianzh" code="bianzh"  property="bianzh"  caption="${i18n.gongzsjbz}" notNull="true"/>
				<t:fieldSelect src="getVersionNo.ajax" show="banc" code="banc" property="rilbc" caption="${i18n.rilbc}" notNull="true" parents="usercenter"/>
				<t:fieldSelect src="getSelectTeamCode.ajax" show="bianzh" code="bianzh"  property="weilbzh" caption="${i18n.weilbzh}" />
				<t:fieldCalendar property="shengxsj" caption="${i18n.shengxsj}" format="yyyy-MM-dd" />
				<t:fieldText property="beiz" notNull="true" caption="${i18n.gongzsjs}" maxLength="2" expression="^([1-9]|1[0-9]|2[0-4])$" expressionMessage="${i18n.qingsr1d24zjdzs}"></t:fieldText>
			</t:fieldLayout>
		</t:form>
		
		<!-- 修改form -->
		<t:form dialog="true" id="form_ckxCalendarGroup" reset="NOT" caption="${i18n.gongzsjgl}" action="saveCkxCalendarGroup.ajax">
			<t:fieldLayout prefix="record2">
				<t:fieldSelect  property="usercenter" notNull="true" caption="${i18n.usercenter}" convert="queryUserCenterMap" />
				<t:fieldText property="appobj" caption="${i18n.chancztbz }" readonly="true"/>
				<t:fieldSelect src="getSelectTeamCode.ajax" show="bianzh" code="bianzh"  property="bianzh"  caption="${i18n.gongzsjbz}"  notNull="true"/>
				<t:fieldSelect src="getVersionNo.ajax" show="banc" code="banc" property="rilbc" caption="${i18n.rilbc}" notNull="true" parents="usercenter"/>
				<t:fieldSelect src="getSelectTeamCode.ajax" show="bianzh" code="bianzh"  property="weilbzh" caption="${i18n.weilbzh}" />
				<t:fieldCalendar property="shengxsj" caption="${i18n.shengxsj}" format="yyyy-MM-dd" />
				<t:fieldSelect property="biaos" caption="${i18n.biaos}" convert="biaos" notNull="true"></t:fieldSelect>
			</t:fieldLayout>
			<t:fieldLayout >
				<t:fieldText property="beiz" notNull="true" caption="${i18n.gongzsjs}" maxLength="2" expression="^([1-9]|1[0-9]|2[0-4])$" expressionMessage="${i18n.qingsr1d24zjdzs}"> </t:fieldText>
			</t:fieldLayout>
		</t:form>
		<select >
		<option id="">
		</select>
	</t:page>

	<script type="text/javascript">
		function leixInit(){
			var LeixElement = $('#record0_leix');
			if(!LeixElement.hasClass('loaded')){
				$('#record0_leix').html('<select id="leix" onchange="leixchange(this)">'+parseLeixOfOptions()+'</select><input id="leixbh" size="10" onkeyup="checkLength(this)"/>');
				$('#record0_leix').addClass('loaded').fieldCustom({
					property:'leix',
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
		}
		function leixchange(obj){
			checkLength('#leixbh');
		}
		function checkLength(obj){			
			var value = $(obj).val().toUpperCase();
			var length=5;
			$("select option:selected ").each(function (i,obj){
				if("leix" == obj.parentNode.id){
					if("" != obj.value ){
						length = obj.value;			 
					}
				}
				//如果是leix 则找到该属性 ，则跳出循环
				return false;
			});
			
			if(value.length >= length){	
				value = value.substr(0,length);	
			}
			$(obj).val(value);	
		}
		function checkValueLength(value){
			var leix = $("select option");
			for(i = 0 ; i < leix.length ; i ++){
				if(value.length == leix[i].value){
					$('#record0_appobj').fieldValue(value);
					return true;
				}
			}
			alert("${i18n.qingsrzqdscxbh }");
			return false;
		}
		function grid_CkxCalendarGroup_beforeSubmit(){
			 $('#record0_appobj').fieldValue('');
			 $('#record0_lxLength').fieldValue('');
			 var leix = $("select option:selected");			 
			 var leixbh = trim($("#leixbh").val());
			 if(null != leixbh && undefined != leixbh && "" != leixbh ){
				 if("" != leix[0].value &&leix[0].value != leixbh.length){
					 alert("${i18n.qingsr }"+leix[0].value+"${i18n.weizf }");
					 return false;
				 }else {
					 if(!checkValueLength(leixbh)){
						 return false;
					 }
				 }
			 }
			 $('#record0_lxLength').fieldValue(leix[0].value);
			 return true;
		}
	
	function parseLeixOfOptions(){
		var leix = {shengcxbh:5,shengcxName:'${i18n.chanx }',cangkbh:3,cangkName:'${i18n.cangkbh }',xiehztbh:4,xiehztName:'${i18n.xiehztbz }'};
		var htmls = [];
		var s = '<option  value="" selected></option>';
		htmls.push(s);
		var s1 = '<option  value="'+leix.shengcxbh+'" >'+leix.shengcxName+'</option>';
		htmls.push(s1);
		var s2 = '<option  value="'+leix.cangkbh+'">'+leix.cangkName+'</option>';
		htmls.push(s2);
		var s3 = '<option  value="'+leix.xiehztbh+'">'+leix.xiehztName+'</option>';
		htmls.push(s3);
		return htmls.join('');
	}		
	function initPage(){
				//页面初始化
				leixInit();
			}
			
			$.sdcui.serverConfig.convertArray['biaos'] = {'1':'${i18n.available}','0':'${i18n.unavailable}'};
			
			function func_grid_addCalendarGroup1(){
				$('#form_addCkxCalendarGroup1').form('clear');
				$("#record11_usercenter").fieldValue('${loginUser.usercenter}');
				$('#form_addCkxCalendarGroup1').form('open','${i18n.add} - ');
			}
			function func_grid_addCalendarGroup2(){
				$('#form_addCkxCalendarGroup2').form('clear');
				$("#record12_usercenter").fieldValue('${loginUser.usercenter}');
				$('#form_addCkxCalendarGroup2').form('open','${i18n.add} - ');
			}
			function func_grid_addCalendarGroup3(){
				$('#form_addCkxCalendarGroup3').form('clear');
				$("#record13_usercenter").fieldValue('${loginUser.usercenter}');
				$('#form_addCkxCalendarGroup3').form('open','${i18n.add} - ');
			}
			
		
			function form_ckxCalendarGroup_beforeSubmit(){
				if(!checkThere("record2_weilbzh","record2_shengxsj"))return false;
				return true;
			}
			function form_addCkxCalendarGroup1_beforeSubmit(){
				if($("#record11_bianzh").fieldValue() == $("#record11_weilbzh").fieldValue()){
					alert("【${i18n.gongzsjbz}】${i18n.yu}【未来编组号】${i18n.bunxt}");
					return false;
				}
				if(!checkThere("record11_weilbzh","record11_shengxsj"))return false;
				return true;
			}
			
			function form_addCkxCalendarGroup2_beforeSubmit(){
				if($("#record12_bianzh").fieldValue() == $("#record12_weilbzh").fieldValue()){
					alert("【${i18n.gongzsjbz}】${i18n.yu}【未来编组号】${i18n.bunxt}");
					return false;
				}
				if(!checkThere("record12_weilbzh","record12_shengxsj"))return false;
				return true;
			}
			function form_addCkxCalendarGroup3_beforeSubmit(){
				if($("#record13_bianzh").fieldValue() == $("#record13_weilbzh").fieldValue()){
					alert("【${i18n.gongzsjbz}】${i18n.yu}【未来编组号】${i18n.bunxt}");
					return false;
				}
				if(!checkThere("record13_weilbzh","record13_shengxsj"))return false;
				return true;
			}
			
			
			//添加产线按钮回调函数
			function form_addCkxCalendarGroup1_afterSubmit(result){
				if (typeof (result.success) != "undefined" && result.success == false) {
					return ;
				}
				$('#form_addCkxCalendarGroup1').dialog('close');
				$('#form_addCkxCalendarGroup1').find('input').val("");
				$('#grid_CkxCalendarGroup').grid('reload');//刷新表格数据
			}
			//添加仓库按钮回调函数
			function form_addCkxCalendarGroup2_afterSubmit(result){
				if (typeof (result.success) != "undefined" && result.success == false) {
					return ;
				}
				$('#form_addCkxCalendarGroup2').dialog('close');
				$('#form_addCkxCalendarGroup2').find('input').val("");
				$('#grid_CkxCalendarGroup').grid('reload');//刷新表格数据
			}
			//添加卸货站台按钮回调函数
			function form_addCkxCalendarGroup3_afterSubmit(result){
				if (typeof (result.success) != "undefined" && result.success == false) {
					return ;
				}
				$('#form_addCkxCalendarGroup3').dialog('close');
				$('#form_addCkxCalendarGroup3').find('input').val("");
				$('#grid_CkxCalendarGroup').grid('reload');//刷新表格数据
			}
			function checkThere(id1,id2){
				if(("" ==$("#"+id1).fieldValue()|| "" ==$("#"+id2).fieldValue())&& $("#"+id1).fieldValue()!= $("#"+id2).fieldValue()){
					alert("【${i18n.weilbzh}】${i18n.he}【${i18n.shengxsj}】${i18n.bixtscz}");
					return false;
				}
				return true;
			}
		</script>
</t:html>