<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<style type="text/css"> 
		.youi-fieldLayout table td.contral.label-col {width: 100px;}
		#grid_CkxInnerPath .youi-fieldLayout table td.contral.label-col {width: 60px;}
		</style>
	</head>
	<t:page i18n="i18n.ckx.carry.i18n_carry">
	
	<div>
		<!-- 主表数据 -->
		<t:grid id="grid_CkxWaibwl" idKeys="usercenter,gongysbh,fahd,mudd" dataFormId="form_CkxWaibwl"
			caption="${i18n.waibwllj}" src="queryCkxOuterPath.ajax" editSrc="getCkxOuterPath.ajax"
			remove="NOT" showCheckbox="true" load="false" add="NOT" showNum="true"
			scrollHeight="335" pageSize="15">
			<t:fieldLayout prefix="record0" columns="4">
				<t:fieldSelect  property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap"  defaultValue="${loginUser.usercenter}" width="110" />
				<t:fieldText property="gongysbh"  caption="${i18n.gongysbh}" maxLength="10" minLength="10" width="110" ></t:fieldText>
				<t:fieldText property="fahd" caption="${i18n.fahd}" dataType="text" maxLength="3" minLength="3" width="110" ></t:fieldText>
				<t:fieldText property="mudd" caption="${i18n.mudd}" dataType="text" maxLength="9" minLength="3" width="110" ></t:fieldText>
			</t:fieldLayout>
			
			<%-- 增加复选框后修改删除功能  lc 2016.10.17 --%>
			<t:button caption="删除" name="remove" active="0" icon="removeRecord"/>
			
			<t:button name="addCkxWaibwl" icon="addRecord" caption="${i18n.add}"></t:button>
			<t:gridCol property="usercenter" editor="fieldSelect" convert="queryUserCenterMap" caption="${i18n.usercenter}"/>
			<t:gridCol property="gongysbh" caption="${i18n.gongysbh}" />
			<t:gridCol property="fahd" caption="${i18n.fahd}" />
			<t:gridCol  property="mudd" caption="${i18n.mudd}" />
			<t:gridCol  property="xiehztbz" caption="${i18n.xiehztbz}" />
			<t:gridCol property="lujbh" caption="${i18n.lujbh}" />
			<t:gridCol property="lujmc" caption="${i18n.lujmc}" />
			<t:gridCol property="chengysbh" caption="${i18n.chengys}" />
			<t:gridCol property="jiaofm" caption="${i18n.jiaofm}" />
			<t:gridCol property="beihzq" caption="${i18n.beihzq}" />
			<t:gridCol property="panysj" caption="${i18n.yunszq}" />
		</t:grid>
		<t:buttons id="btn">
		<t:button caption="下载模板" name="mobxz" active="0"/>
    	</t:buttons>
		<t:file action="/carry/importAth_outerpath.do" size="50">
			<t:fileparam sheet="waibwl" keys="USERCENTER,GONGYSBH,FAHD,MUDD" table="{dbSchemal3}ckx_waibwl" datasourceId="1"/>
		</t:file>
		<div><font color="red">导入结果不能大于5000条,否则为空</font></div>
	</div>
	
	<!-- 编辑数据 -->
	<t:fieldLayout prefix="record3" >
		<t:form dialog="true" id="form_addCkxWaibwl" reset="NOT" submit="NOT" caption="${i18n.waibwllj}" action="addCkxOuterPath.ajax">
			<t:fieldLayout prefix="record31" >
				<t:fieldSelect  property="usercenter" notNull="true"  caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${loginUser.usercenter}"/>
				<t:fieldText property="lujmc"  caption="${i18n.lujmc}" maxLength="20"></t:fieldText>
				<t:fieldText property="gongysbh" notNull="true" maxLength="10" minLength="10" caption="${i18n.gongysbh}" ></t:fieldText>
				<t:fieldText property="fahd" readonly="true"  notNull="true" maxLength="3" minLength="3" dataType="text" caption="${i18n.fahd}" ></t:fieldText>
				<t:fieldText property="mudd" notNull="true" maxLength="6" minLength="3" dataType="text" caption="${i18n.mudd}" ></t:fieldText>
				<t:fieldText property="xiehztbz" notNull="true" readonly="true" dataType="text" caption="${i18n.xiehztbz}" ></t:fieldText>
				<t:fieldText property="lujbh" notNull="true"  caption="${i18n.lujbh}" maxLength="10" minLength="6"  />
				<t:fieldText property="chengysbh" notNull="true" caption="${i18n.chengys}" readonly="true"/>
				<t:fieldText property="beihzq" notNull="true" expression='^[0-9]{1,3}$|^[0-9]{1,3}[.][0-9]{1,2}$'  expressionMessage="${i18n.qingsr3wzsh2wxs}" caption="${i18n.beihzq}"></t:fieldText>
				<t:fieldText property="panysj" notNull="true" expression='^[0-9]{1,3}$|^[0-9]{1,3}[.][0-9]{1,2}$'  expressionMessage="${i18n.qingsr3wzsh2wxs}" caption="${i18n.yunszq}"></t:fieldText>
				<t:fieldText property="jiaofm" notNull="true" dataType="text" maxLength="3" minLength="3" caption="${i18n.jiaofm}"></t:fieldText>
			</t:fieldLayout>
			<t:button caption="${i18n.submit}" name="butSubAdd"></t:button>
		</t:form>
		<t:form dialog="true" id="form_CkxWaibwl" reset="NOT" submit="NOT" caption="${i18n.waibwllj}" action="saveCkxOuterPath.ajax">
			<t:fieldLayout prefix="record32" >
				<t:fieldSelect  property="usercenter" readonly="true" notNull="true"  caption="${i18n.usercenter}" convert="queryUserCenterMap" />
				<t:fieldText property="lujmc"  caption="${i18n.lujmc}" maxLength="20"></t:fieldText>
				<t:fieldText property="gongysbh" notNull="true" maxLength="10" readonly="true" minLength="6" caption="${i18n.gongysbh}" ></t:fieldText>
				<t:fieldText property="fahd" notNull="true" maxLength="3" readonly="true" minLength="3" dataType="text" caption="${i18n.fahd}" ></t:fieldText>
				<t:fieldText property="mudd" notNull="true" maxLength="6" readonly="true" minLength="3" dataType="text" caption="${i18n.mudd}" ></t:fieldText>
				<t:fieldText property="xiehztbz" notNull="true" readonly="true"  caption="${i18n.xiehztbz}" ></t:fieldText>
				<t:fieldText property="lujbh" notNull="true" caption="${i18n.lujbh}" maxLength="10" minLength="10" dataType="text"/>
				<t:fieldText property="chengysbh" notNull="true" caption="${i18n.chengys}" readonly="true"/>
				<t:fieldText property="beihzq" notNull="true" expression='^[0-9]{1,3}$|^[0-9]{1,3}[.][0-9]{1,2}$'  expressionMessage="${i18n.qingsr3wzsh2wxs}" caption="${i18n.beihzq}"></t:fieldText>
				<t:fieldText property="panysj" notNull="true" expression='^[0-9]{1,3}$|^[0-9]{1,3}[.][0-9]{1,2}$'  expressionMessage="${i18n.qingsr3wzsh2wxs}" caption="${i18n.yunszq}"></t:fieldText>
				<t:fieldText property="jiaofm" notNull="true" dataType="text" maxLength="3" minLength="3" caption="${i18n.jiaofm}"></t:fieldText>
			</t:fieldLayout>
			<t:button caption="${i18n.submit}" name="butSubEdit"></t:button>
		</t:form>
	</t:fieldLayout>
	</t:page>
	<script type="text/javascript">
		function initPage(){
				//页面初始化
				//绑定供应商文本框事件
			$("#record31_gongysbh input").blur(function (){record31_gongysbh_change();});
			$("#record31_mudd input").blur(function (){checkXiehztbz(this,"record31_xiehztbz","record31_usercenter");});
			$("#record31_lujbh input").blur(function (){checkChengysbh(this,"record31_chengysbh","record31_usercenter");});
			$("#record32_lujbh input").blur(function (){checkChengysbh(this,"record32_chengysbh","record32_usercenter");});
		}
		function func_grid_addCkxWaibwl(){
			$('#form_addCkxWaibwl').form('clear');
			$("#record31_usercenter").fieldValue('${loginUser.usercenter}');
			$('#form_addCkxWaibwl').form('open','${i18n.add} - ');
		}
		
		//添加按钮回调函数
		function form_addCkxWaibwl_afterSubmit(result){
			if(typeof result.success=="undefined"||result.success!==false){
				$('#form_addCkxWaibwl').dialog('close');
				$('#form_addCkxWaibwl').find('input').val("");
				$('#grid_CkxWaibwl').grid('reload');//刷新表格数据
			}
		}
		
		
		
		
		//根据供应商获取发运地
		function record31_gongysbh_change(){
			var gongysbh = $('#record31_gongysbh').fieldValue();
			if(null == gongysbh|| "" == gongysbh){
				$("#form_addCkxWaibwl").find("input[name='fahd']").val("");
				return ;
			}
			var params = [];
			params.push("gongysbh="+gongysbh);
			$.sdcui.ajaxUtil.ajax({
	            url:"../xuqjs/getFaydByGongys.ajax",//请求url
	            data:params.join('&'),
	           	success:function (result){
	           		if(result.result==null){
	           			alert("${i18n.faydbcz}");
	           			$("#form_addCkxWaibwl").find("input[name='fahd']").val("");
	           		}else{
	           			$("#form_addCkxWaibwl").find("input[name='fahd']").val(result.result.fayd);
	           		}
	            	
	            }
	     	});
		}
		
		
		//根据目的地带出卸货站台编组
		function checkXiehztbz(obj,xiehztbzId,usercenterId){
			var usercenterStr = $("#"+usercenterId).fieldValue();
			if(null == obj.value|| "" == obj.value){
				$("#"+xiehztbzId).fieldValue("");
				return ;
			}
// 			if(""==trim($("#record31_mudd").fieldValue())){
// 				alert("目的地不能全部为空格");
// 				return false;
// 			}
			$.sdcui.ajaxUtil.ajax({
	            url:"../cangk/getCangk.ajax?usercenter="+usercenterStr+"&biaos=1&cangkbh="+obj.value,//请求url		          
	           	success:function (result){
	           		if(result.result == null){
	           			alert("${i18n.buczcckbhhsjysxqcxtx}");
	           			$("#"+xiehztbzId).fieldValue("");	           			
	           			return ;
	           		}else{
	           			var xiehztbz = result.result.xiehztbz;
	           			if(null == xiehztbz|| "" == xiehztbz){
	           				alert("${i18n.cickmydydxhztbzqcxsr}");	           				
	           				return ;
	           			}
	           			$("#"+xiehztbzId).fieldValue(xiehztbz);
	           		}
				}
	     	});				
		}
		
		//根据路径编号带出承运商
		function checkChengysbh(obj,chengysbhId,usercenterId){	
			var usercenterStr = $("#"+usercenterId).fieldValue();
			if(null == obj.value|| "" == obj.value){
				$("#"+chengysbhId).fieldValue("");
				return ;
			}
			$.sdcui.ajaxUtil.ajax({
	            url:"getWaibwlxxMaxXuh.ajax?usercenter="+usercenterStr+"&shengxbs=1&lujbh="+obj.value,//请求url		          
	           	success:function (result){
	           		if(result.result == null){
	           			alert("${i18n.buczcljbhqcxsr}");
	           			$("#"+chengysbhId).fieldValue("");	           			
	           			return ;
	           		}else{
	           			var chengysbh = result.result.gcbh;
	           			if(null == chengysbh|| "" == chengysbh){
	           				alert("${i18n.buczcljbhdycysqcxsr}");
	           				$("#"+chengysbhId).fieldValue("");	        
	           				return ;
	           			}
	           			$("#"+chengysbhId).fieldValue(chengysbh);
	           		}
				}
	     	});				
		}
		
		
		
		function func_button_butSubAdd(){
			var usercenter = $("#record31_usercenter").fieldValue();
			var chengysbh = $("#record31_chengysbh").fieldValue();
			if(null == chengysbh|| "" == chengysbh){
				alert("${i18n.qingtxljbh}");
				return ;
			}
			var xiehztbz = $("#record31_xiehztbz").fieldValue();
			if(null == xiehztbz|| "" == xiehztbz){
				alert("${i18n.qingtxmdd}");
				return ;
			}
			checkEditNum(usercenter,chengysbh,xiehztbz,"form_addCkxWaibwl",0);
		}
		function func_button_butSubEdit(){
			var usercenter = $("#record32_usercenter").fieldValue();
			var chengysbh = $("#record32_chengysbh").fieldValue();
			var xiehztbz = $("#record32_xiehztbz").fieldValue();
			if(null == chengysbh|| "" == chengysbh){
// 				alert("${i18n.weinhqcysqcxtxljbh}");
				alert("${i18n.weinhqcysqcxtxljbh}");
				return ;
			}
			if(null == xiehztbz|| "" == xiehztbz){
				alert("${i18n.citsjbwzqxscsjhcxwh}");
				return ;
			}
			checkEditNum(usercenter,chengysbh,xiehztbz,"form_CkxWaibwl",1);	
		}
		function checkEditNum(usercenter,chengysbh,xiehztbz,formId,operate){
			// 0012759 hanwu 20160425 
			// 后台取消了更新其他外部物流的备货周期和运输周期的逻辑，故前台也不需要相应的提示，注释掉，直接提交
			/* $.sdcui.ajaxUtil.ajax({
	            url:"checkEditCkxOuterPath.ajax?usercenter="+usercenter+"&chengysbh="+chengysbh+"&xiehztbz="+xiehztbz+"&operate="+operate,//请求url		          
	           	success:function (result){
	           		if(confirm(result.result)){
	           			$("#"+formId).form('submit');
	           		}
	           		return false;
				}
	     	}); */	
			$("#"+formId).form('submit');
		}
		
		//导出模板
		function func_button_mobxz(){
			$.sdcui.pageUtils.goPage({
				url : '../carry/downloadOuterpathMob.do',
				mode : 'form',
				beforeSubmit : function(){
					return true;
				}
		   });
		}
		
		//删除  lc 2016.10.17
		function func_button_remove(){
			 var roles = $('#grid_CkxWaibwl').grid('getSelectedRecords');
			 if(roles.length==0){
				 alert("请至少选择一条记录");
				 return false;			 		
			 }
			 var params = [];
			 for(var i = 0 ; i < roles.length ; i++ ){
				 params.push("list["+i+"].usercenter="+roles[i].usercenter);
				 params.push("list["+i+"].gongysbh="+roles[i].gongysbh);
				 params.push("list["+i+"].fahd="+roles[i].fahd);
				 params.push("list["+i+"].mudd="+roles[i].mudd);
			 }
			 if(confirm("确认删除选中记录?")){
				 $.sdcui.ajaxUtil.ajax({
						url:'removeCkxOuterPath.ajax',
						data:params.join('&'),
						success:function(result){
							if(typeof result.success=="undefined"||result.success!==false){
								$("#grid_CkxWaibwl").grid('reload');
							}
						}
					});
			 }			 
		}
	</script>
</t:html>