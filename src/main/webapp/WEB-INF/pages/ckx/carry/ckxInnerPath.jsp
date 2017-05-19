<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="role" value="${role}"/>

<t:html>
	<head>

		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		
		<style type="text/css"> 
		.youi-fieldLayout table td.contral.label-col {width: 80px;}
		#grid_CkxInnerPath .youi-fieldLayout table td.contral.label-col {width: 70px;}
		#form_addCkxInnerPath1 .youi-fieldLayout table td.contral.label-col.col-2{width: 130px;}
		.field-items-panel.item-srcoll{height:100px;overflow-y:auto;}
		.field-items-panel{position:absolute;
			background:#FFFFFF;
			display:none;
			border:1pt solid silver;			
			overflow-x:hidden;
			overflow-y:auto;
			z-index:1201;
			left:0;
			top:0;
			height:100px;} 
		#field-pop-record0_usercenter.field-items-panel{position:absolute;
			background:#FFFFFF;
			display:none;
			border:1pt solid silver;			
			overflow-x:hidden;
			overflow-y:auto;
			z-index:1201;
			left:0;
			top:0;
			height:80px;}
		#field-pop-record32_usercenter.field-items-panel{position:absolute;
			background:#FFFFFF;
			display:none;
			border:1pt solid silver;			
			overflow-x:hidden;
			overflow-y:auto;
			z-index:1201;
			left:0;
			top:0;
			height:60px;}
		#field-pop-record11_usercenter.field-items-panel{position:absolute;
			background:#FFFFFF;
			display:none;
			border:1pt solid silver;			
			overflow-x:hidden;
			overflow-y:auto;
			z-index:1201;
			left:0;
			top:0;
			height:60px;}
	   #field-pop-record22_usercenter.field-items-panel{position:absolute;
			background:#FFFFFF;
			display:none;
			border:1pt solid silver;			
			overflow-x:hidden;
			overflow-y:auto;
			z-index:1201;
			left:0;
			top:0;
			height:60px;}
		</style>
	</head>
	<t:page i18n="i18n.ckx.carry.i18n_carry">
		<!-- 内部物流路径显示 -->
		<t:grid id="grid_CkxInnerPath" 
			idKeys="usercenter,lingjbh,fenpqh,xianbk,dinghk"
			caption="${i18n.neibwllj}" 
			dataFormId="form_editCkxInnerPath"
			src="queryCkxInnerPath.ajax" 
			add="NOT"
			edit="NOT"
			editSrc="getCkxInnerPath.ajax"
			remove="NOT" showCheckbox="true" exportXls="true" 
			load="false" showNum="true"
			scrollHeight="270" pageSize="15">
			<t:fieldLayout prefix="record0" columns="4">
				<t:fieldSelect  property="usercenter" width="120" caption="${i18n.usercenter}" convert="queryUserCenterMap"  defaultValue="${loginUser.usercenter}"/>
				<t:fieldText  property="lingjbh" width="120" caption="${i18n.lingjbh}" dataType="text" maxLength="10" minLength="10"/>
				<t:fieldText  property="zhidgys" width="120" caption="${i18n.zhidgys}" column="2" maxLength="10" minLength="10"/>
				<t:fieldText  property="shengcxbh" width="120" caption="${i18n.shengcx}" dataType="text" maxLength="5" minLength="5"/>
				<t:fieldText  property="fenpqh" width="120" caption="${i18n.fenpq}" dataType="text" maxLength="5"/>			
				<t:fieldText  property="xianbk"  width="120"caption="${i18n.xianbk}" dataType="text" maxLength="3" minLength="3"/>
				<t:fieldText  property="dinghk" width="120" caption="${i18n.dinghk}" dataType="text" maxLength="3" minLength="3"/>
				<t:fieldSelect  property="mos" width="120" convert="querySXMS" caption="${i18n.mos1}"/>
				<t:fieldSelect  property="mos2" width="120" convert="queryXDMS" caption="${i18n.mos2}"/>
				<t:fieldSelect property="wms" width="120" convert="queryWBMS" caption="${i18n.waibms}" />
				
			</t:fieldLayout>
			<t:button name="toAddCkxInnerPath" icon="addRecord" caption="${i18n.add}"></t:button>
			<t:button name="toAddCkxInnerPath1" icon="addRecord" caption="${i18n.add}(${i18n.shoud})"></t:button>
			<%-- 增加复选框后修改删除、修改功能  lc 2016.10.18 --%>
			<t:button name="toEditCkxInnerPath" icon="editRecord" caption="${i18n.update}" active="1"></t:button>
			<t:button caption="删除" name="remove" active="0" icon="removeRecord"/>
			
			
			<t:gridCol property="usercenter" editor="fieldSelect" convert="queryUserCenterMap" caption="${i18n.usercenter}"/>
			<t:gridCol property="lingjbh" caption="${i18n.lingjbh}"/>
			<t:gridCol property="fenpqh" caption="${i18n.fenpq}"/>
			<t:gridCol property="shengcxbh" caption="${i18n.shengcx}"/>
			<t:gridCol property="mos" caption="${i18n.mos1}"/>
			<t:gridCol property="jianglms" caption="${i18n.jianglms1}"/>
			<t:gridCol property="jianglmssxsj" caption="${i18n.jianglmssxsj1}"/>
			<t:gridCol editor="fieldHidden" convert="queryCklx" property="qidlx" caption="${i18n.qidlx1}" />
			<t:gridCol property="xianbk" caption="${i18n.xianbk}"/>
			<t:gridCol property="mos2" caption="${i18n.mos2}"/>
			<t:gridCol property="jianglms2" caption="${i18n.jianglms2}"/>
			<t:gridCol property="jianglmssxsj2" caption="${i18n.jianglmssxsj2}"/>
			<t:gridCol editor="fieldHidden"  convert="queryCklx" property="qidlx2" caption="${i18n.qidlx2}"/>
			<t:gridCol property="dinghk" caption="${i18n.dinghk}"/>
			<t:gridCol property="wms" caption="${i18n.waibms}"/>
			<t:gridCol property="wjlms" caption="${i18n.waibjlms}"/>
			<t:gridCol property="shengxsj" caption="${i18n.waibjlmssxsj}"/>
			<t:gridCol property="zhidgys" caption="${i18n.zhidgys}"/>
		</t:grid>
		<%-- 增加下载模板、导入、导出功能  lc 2016.10.19 --%>
		<t:buttons id="btn">
		<t:button caption="下载模板" name="mobxz" active="0"/>
    	</t:buttons>
    	<t:file action="/carry/importAth_innerpath.do" size="50">
			<t:fileparam sheet="neibwl" keys="usercenter,lingjbh,fenpqh,xianbk,dinghk" 
			    table="{dbSchemal3}ckx_shengcx_xianb,{dbSchemal3}ckx_xianb_dingh,{dbSchemal3}ckx_waibms" 
			    dateColumns="jianglmssxsj,jianglmssxsj2,shengxsj" dateFormats="yyyy-MM-dd,yyyy-MM-dd,yyyy-MM-dd" datasourceId="1"/>
		</t:file>
		<div><font color="red">导入结果不能大于5000条,否则为空</font></div>
		<div><font color="red">导出结果不能大于5000条,否则为空</font></div>
		
		
		<!-- 添加路径 -->
		<t:form submit="NOT" reset="NOT"  width="800" dialog="true" id="form_addCkxInnerPath" caption="${i18n.neibwllj}" action="addCkxInnerPath.ajax">
			<t:fieldLayout prefix="record1">
				<t:grid id="grid_CkxLingjxhd" caption="${i18n.lingjxhd}" src="/xuqjs/queryLingjxhdByCarry.ajax" 
					 idKeys="usercenter,lingjbh,xiaohdbh" pageSize="30" showCheckbox="true" scrollHeight="180"
					 add="NOT" remove="NOT" edit="NOT" showNum="true" load="false">
					<t:fieldLayout prefix="record11" width="700" columns="3">
						<t:fieldSelect  width="100" notNull="true" property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${loginUser.usercenter}" />
						<t:fieldText  maxLength="10" width="100"  property="lingjbh" caption="${i18n.lingjbh}"/>
						<t:fieldText  maxLength="5" width="100"  property="fenpqbh" caption="${i18n.fenpq}"/>
						<t:fieldText  maxLength="5" width="100"  property="shengcxbh" caption="${i18n.shengcx}"/>
						<t:fieldText maxLength="5" width="100" dataType="text" property="zhizlx" caption="${i18n.zhizlx}"  />
					</t:fieldLayout>
		 			<t:gridCol property="usercenter" width="156" editor="fieldSelect" convert="queryUserCenterMap" caption="${i18n.usercenter}"/>
					<t:gridCol property="lingjbh" width="156" caption="${i18n.lingjbh}"/>
					<t:gridCol property="fenpqbh" width="156" caption="${i18n.fenpq}"/>
					<t:gridCol property="shengcxbh" width="156" caption="${i18n.shengcx}"/>
					<t:gridCol property="zhizlx" width="156" caption="${i18n.zhizlx}"/>
				</t:grid>
				${i18n.xuanzqswz}：<input id="rdoInnerType" type="radio" onclick="check(this)" value="0" name="rdoInnerType" checked="checked"/>${i18n.xianbk} 
				<input onclick="check(this)" value="1" type="radio" name="rdoInnerType"/>${i18n.dinghk} 
				<div id="div_record12">
				<t:fieldLayout  prefix="record12" columns="3">
				<!-- 产线-线边库 -->
					<t:fieldText property="xianbk" caption="${i18n.xunhqd}" width="100" maxLength="3"/>
					<t:fieldSelect property="qidlx" convert="queryCklx" caption="${i18n.qidlx1}" readonly="true" width="100" />
					<t:fieldText property="zhidgys" caption="${i18n.zhidgys}" width="100" maxLength="10" expression="(^[0-9A-Z]{6}[\s0-9A-Z]{2}[0-9A-Z]{2}$)" expressionMessage="只能输入大写字母或数字,最大长度10位,7,8位能输入空格"/>
					<t:fieldSelect property="mos" convert="querySXMS" caption="${i18n.mos1}" width="100" />
					
					<t:fieldSelect property="jianglms" convert="querySXMS" caption="${i18n.jianglms1}" width="100"/>
					<t:fieldCalendar property="jianglmssxsj" format="yyyy-MM-dd" caption="${i18n.jianglmssxsj1}" width="100"/>
				<!-- 外部模式 -->
					<t:fieldSelect property="wms" convert="queryWBMS" caption="${i18n.waibms}"width="100" />
					
					<t:fieldSelect property="wjlms" convert="queryWBMS" caption="${i18n.waibjlms}" width="100"/>
					<t:fieldCalendar property="shengxsj" format="yyyy-MM-dd" caption="${i18n.waibjlmssxsj}"width="100"/>
				</t:fieldLayout>
				</div>
				<div style="display:none ;" id="div_record13">
					<t:fieldLayout  prefix="record13" columns="3">
						<!-- 线边库-定货库 -->
						<t:fieldText property="dinghk"  caption="${i18n.xianbqd}" width="100" maxLength="3" />
						<t:fieldSelect property="qidlx2" convert="queryCklx" caption="${i18n.qidlx2}" readonly="true" width="100"/>
						<t:fieldCustom property="kenbg"></t:fieldCustom>
						<t:fieldSelect property="mos2" convert="queryXDMS" caption="${i18n.mos2}" width="100"/>
						<t:fieldSelect property="jianglms2" convert="queryXDMS" caption="${i18n.jianglms2}" width="100" />
						<t:fieldCalendar property="jianglmssxsj2" format="yyyy-MM-dd" caption="${i18n.jianglmssxsj2}" width="100"/>
					</t:fieldLayout>
				</div>
			</t:fieldLayout>
			<t:button caption="${i18n.submit}" name="addSubmitPath"></t:button>
		</t:form>
		<!-- 添加路径属性（手工） -->
		<t:form width="600" submit="NOT" reset="NOT" dialog="true" id="form_addCkxInnerPath1" caption="${i18n.neibwllj}" action="addCkxInnerPath1.ajax">
			<t:fieldLayout  prefix="record3" >
			${i18n.xuanzqswz}：<input id="rdoInnerType3" onclick="checkType(this)" type="radio" value="0" name="rdoInnerType2" checked="checked"/>${i18n.xianbk}  
						<input  onclick="checkType(this)" value="1" type="radio" name="rdoInnerType2"/>${i18n.dinghk}  
				<t:fieldLayout  prefix="record32" columns="3">
					<t:fieldSelect width="100"  property="usercenter" notNull="true" caption="${i18n.usercenter}" convert="queryUserCenterMap" />
					<t:fieldText width="100" property="lingjbh" caption="${i18n.lingjbh}" maxLength="10" notNull="true"></t:fieldText>
<%-- 					<t:fieldText width="100" property="shengcxbh" caption="${i18n.shengcx}" maxLength="5" notNull="true"></t:fieldText> --%>
					<t:fieldText width="100" property="fenpqh" caption="${i18n.fenpq}" maxLength="5" notNull="true"></t:fieldText>
				
					<!-- 产线-线边库 -->
					<t:fieldText width="100" property="xianbk"  caption="${i18n.xunhqd}" notNull="true" maxLength="3" minLength="3" dataType="text"/>
					<t:fieldSelect width="100" property="qidlx" column="2" convert="queryCklx" caption="${i18n.qidlx1}" notNull="true" readonly="true"/>
					<t:fieldHidden property="xianbk1" caption="${i18n.xianbqd}1" />
					<t:fieldSelect width="100" property="mos" convert="querySXMS" caption="${i18n.mos1}" notNull="true"/>
					
					<t:fieldSelect width="100" property="jianglms" convert="querySXMS"  caption="${i18n.jianglms1}" />
					<t:fieldCalendar width="100" property="jianglmssxsj" format="yyyy-MM-dd" caption="${i18n.jianglmssxsj1}" />
					
					<!-- 外部模式 -->
					<t:fieldSelect width="100" property="wms" convert="queryWBMS" notNull="true" caption="${i18n.waibms}" />
					
					<t:fieldSelect width="100" property="wjlms"  convert="queryWBMS" caption="${i18n.waibjlms}" />
					<t:fieldCalendar width="100" property="shengxsj" format="yyyy-MM-dd" caption="${i18n.waibjlmssxsj}" />
					<t:fieldText width="100" property="zhidgys"  caption="${i18n.zhidgys}" maxLength="10" minLength="10" expression="(^[0-9A-Z]{6}[\s0-9A-Z]{2}[0-9A-Z]{2}$)" expressionMessage="只能输入大写字母或数字,最大长度10位,7,8位能输入空格"/>
				</t:fieldLayout>
				<!-- 线边库-定货库 -->
				<div id="div_record33" >
				<t:fieldLayout  prefix="record33" columns="3">
					<t:fieldText width="100" property="dinghk" maxLength="3" minLength="3" caption="${i18n.xianbqd}" />
					<t:fieldSelect width="100" property="qidlx2" convert="queryCklx" caption="${i18n.qidlx2}" readonly="true"/>
					<t:fieldCustom property="abcd"></t:fieldCustom>
					<t:fieldSelect width="100" property="mos2" convert="queryXDMS" caption="${i18n.mos2}" />
					<t:fieldSelect width="100" property="jianglms2" convert="queryXDMS" caption="${i18n.jianglms2}" />
					<t:fieldCalendar width="100" property="jianglmssxsj2" format="yyyy-MM-dd" caption="${i18n.jianglmssxsj2}"/>
				</t:fieldLayout>
				</div>
			</t:fieldLayout>
			<t:button caption="${i18n.submit}" name="addSubmitPath1"></t:button>
		</t:form>
		<!-- 修改路径属性 -->
		<t:form width="600" submit="NOT" reset="NOT" dialog="true" id="form_editCkxInnerPath" caption="${i18n.neibwllj}" action="saveCkxInnerPath.ajax">
			<t:fieldLayout  prefix="record2" >
			${i18n.xuanzqswz}：<input id="rdoInnerType1" onclick="check1(this)" type="radio" value="0" name="rdoInnerType1"/>${i18n.xianbk}  
						<input id="rdoInnerType2" onclick="check1(this)" value="1" type="radio" name="rdoInnerType1"/>${i18n.dinghk}  
						<span id="rdoMsg" style="color: red;"></span>
				<t:fieldLayout  prefix="record22" columns="3">
					<t:fieldSelect width="100"  property="usercenter" notNull="true" caption="${i18n.usercenter}" convert="queryUserCenterMap" />
					<t:fieldText width="100" property="lingjbh" caption="${i18n.lingjbh}" readonly="true" maxLength="10"></t:fieldText>
					<t:fieldText width="100" property="shengcxbh" caption="${i18n.shengcx}" readonly="true" maxLength="6"></t:fieldText>
					<t:fieldText width="100" property="fenpqh" caption="${i18n.fenpq}" readonly="true" maxLength="5"></t:fieldText>
				
					<!-- 产线-线边库 -->
					<t:fieldText width="100" property="xianbk"  caption="${i18n.xunhqd}" notNull="true" maxLength="3" minLength="3" dataType="text"/>
					<t:fieldSelect width="100" property="qidlx" convert="queryCklx" caption="${i18n.qidlx1}" notNull="true" readonly="true"/>
					<t:fieldHidden property="xianbk1" caption="临时线边" />
					<t:fieldSelect width="100" property="mos" convert="querySXMS" caption="${i18n.mos1}" notNull="true"/>
					
					<t:fieldSelect width="100" property="jianglms" convert="querySXMS"  caption="${i18n.jianglms1}" />
					<t:fieldCalendar width="100" property="jianglmssxsj" format="yyyy-MM-dd" caption="${i18n.jianglmssxsj1}" />
					
					<!-- 外部模式 -->
					<t:fieldSelect width="100" property="wms" convert="queryWBMS" notNull="true" caption="${i18n.waibms}" />
					<t:fieldHidden property="hiddenWMS" caption="隐藏的外部模式（同步更新用）"></t:fieldHidden>
					<t:fieldSelect width="100" property="wjlms"  convert="queryWBMS" caption="${i18n.waibjlms}" />
					<t:fieldCalendar width="100" property="shengxsj" format="yyyy-MM-dd" caption="${i18n.waibjlmssxsj}" />
					<t:fieldText width="100" property="zhidgys"  caption="${i18n.zhidgys}" maxLength="10" minLength="10" expression="(^[0-9A-Z]{6}[\s0-9A-Z]{2}[0-9A-Z]{2}$)" expressionMessage="只能输入大写字母或数字,最大长度10位,7,8位能输入空格"/>
				</t:fieldLayout>
				<!-- 线边库-定货库 -->
				<div id="div_record23" >
				<t:fieldLayout  prefix="record23" columns="3">
					<t:fieldText width="100" property="dinghk" maxLength="3" minLength="3" caption="${i18n.xianbqd}" />
					<t:fieldSelect width="100" property="qidlx2" convert="queryCklx" caption="${i18n.qidlx2}" readonly="true"/>
					<t:fieldCustom property="abcd"></t:fieldCustom>
					<t:fieldSelect width="100" property="mos2" convert="queryXDMS" caption="${i18n.mos2}" />
					<t:fieldSelect width="100" property="jianglms2" convert="queryXDMS" caption="${i18n.jianglms2}" />
					<t:fieldCalendar width="100" property="jianglmssxsj2" format="yyyy-MM-dd" caption="${i18n.jianglmssxsj2}"/>
				</t:fieldLayout>
				</div>
			</t:fieldLayout>
			<t:button caption="${i18n.submit}" name="editSubmitPath"></t:button>
		</t:form>
	</t:page>
	
	<script type="text/javascript">
			$.sdcui.serverConfig.convertArray['qidlx'] = {'1':'${i18n.putck}','0':'${i18n.xunk}','2':'${i18n.waizk}'};
			function initPage(){//页面初始化
				
				$("#record12_xianbk input").blur(function (){
					var _xianbk = $("#record12_xianbk").fieldValue();
					checkCangkbh(_xianbk,"record12_qidlx","record11_usercenter");
				});
				$("#record13_dinghk input").blur(function (){
					var _dinghk = $("#record13_dinghk").fieldValue();
					checkCangkbh(_dinghk,"record13_qidlx2","record11_usercenter");
				});
				$("#record22_xianbk input").blur(function (){	
					var _xianbk = $("#record22_xianbk").fieldValue();
					checkCangkbh(_xianbk,"record22_qidlx","record22_usercenter");
				});
				$("#record23_dinghk input").blur(function (){	
					var _dinghk = $("#record23_dinghk").fieldValue();
					checkCangkbh(_dinghk,"record23_qidlx2","record22_usercenter");
				});
				$("#record32_xianbk input").blur(function (){	
					var _xianbk = $("#record32_xianbk").fieldValue();
					checkCangkbh(_xianbk,"record32_qidlx","record32_usercenter");
				});
				$("#record33_dinghk input").blur(function (){	
					var _dinghk = $("#record33_dinghk").fieldValue();
					checkCangkbh(_dinghk,"record33_qidlx2","record32_usercenter");
				});
			}

			function checkCangkbh(cangkbh,qidlxid,usercenterID){
				var usercenterStr = $("#"+usercenterID).fieldValue();
				if(cangkbh==""){return;}
				$.sdcui.ajaxUtil.ajax({
		            url:"../cangk/getCangk.ajax?usercenter="+usercenterStr+"&cangkbh="+cangkbh,// 请求url
		           	success:function (result){
		           		if(result.result == null){
		           			alert("${i18n.buczcckbhhsjysx}");
		           			$("#"+qidlxid).fieldValue("");
		           			return ;
		           		}else{
		           			var cangklx = result.result.cangklx;
		           			if('2' == cangklx||'4' == cangklx){		           				
		           				alert("${i18n.neibwlljbnxzbhgpk}");
		           				$("#"+qidlxid).fieldValue("");	
		           				return ;
		           			}
		           			$("#"+qidlxid).fieldValue(cangklx);
		           		}
					}
		     	});				
			}
			// 自定义添加按钮
			function func_grid_toAddCkxInnerPath(){
				
				//无ZBCPOA或WULGYY或root权限无法增加
				var currentRole = "${role}";
				if("ZBCPOA"!=currentRole && "WULGYY"!=currentRole && "root"!=currentRole){
					alert("无增加权限，无法增加数据！");
					return false;					
				}
				
				$("#record11_usercenter").fieldValue('${loginUser.usercenter}');
// $('#grid_CkxLingjxhd').grid('reload');//刷新表格数据
				$('#form_addCkxInnerPath').form('open','${i18n.add} - ');
				$('#youi-dialog-form_addCkxInnerPath').css("top","1px"); //将弹出置顶
			}
			// 自定义添加按钮（手工）
			function func_grid_toAddCkxInnerPath1(){
				
				//无ZBCPOA或WULGYY或root权限无法增加
				var currentRole = "${role}";
				if("ZBCPOA"!=currentRole && "WULGYY"!=currentRole && "root"!=currentRole){
					alert("无增加权限，无法增加数据！");
					return false;					
				}
				
				$('#form_addCkxInnerPath1').form('open','${i18n.add} - ');
				$("#record32_usercenter").fieldValue('${loginUser.usercenter}');
				$("#rdoInnerType3").attr("checked",true);
				// 关闭订货库层
				$("#div_record33").hide();
				$("#div_record33").find("input").val("");					
			}
			
			
			// 定义修改按钮
			function func_grid_toEditCkxInnerPath(){
				var record = $('#grid_CkxInnerPath').grid('getSelectedRecords')[0];
				if(null==record){
					alert("${i18n.qingxzytjl}！");
					return;
				}
				
				
				if(""==record.dinghk){
					$("#div_record23").hide();
					$("#div_record23").find("input").val("");
					$("#rdoMsg").text("[${i18n.butianx}]");
					$("#rdoInnerType1").attr("checked","checked")
				}else{
					$("#div_record23").show();
					setMD("record22_mos",'UD');
					setMD("record22_jianglms",'UD');
					$("#rdoMsg").text("[${i18n.tianx}]");
					$("#rdoInnerType2").attr("checked","checked")
				}
			
				
				// 每个字段赋值
				$("#record22_usercenter").fieldValue(record.usercenter);
				$("#record22_lingjbh").fieldValue(record.lingjbh);
				$("#record22_shengcxbh").fieldValue(record.shengcxbh);
				$("#record22_fenpqh").fieldValue(record.fenpqh);
				
				$("#record22_xianbk").fieldValue(record.xianbk);
				$("#record22_xianbk1").fieldValue(record.xianbk);
				$("#record22_mos").fieldValue(record.mos);
				$("#record22_qidlx").fieldValue(record.qidlx);
				$("#record22_jianglms").fieldValue(record.jianglms);
				$("#record22_jianglmssxsj").fieldValue(record.jianglmssxsj);
				
				$("#record22_wms").fieldValue(record.wms);
				$("#record22_hiddenWMS").fieldValue(record.wms);
				$("#record22_zhidgys").fieldValue(record.zhidgys);
				$("#record22_wjlms").fieldValue(record.wjlms);
				$("#record22_shengxsj").fieldValue(record.shengxsj);
				
				
				$("#record23_dinghk").fieldValue(record.dinghk);
				$("#record23_mos2").fieldValue(record.mos2);
				$("#record23_qidlx2").fieldValue(record.qidlx2);
				$("#record23_jianglms2").fieldValue(record.jianglms2);
				$("#record23_jianglmssxsj2").fieldValue(record.jianglmssxsj2);
				
				
				// 打开窗口
				$('#form_editCkxInnerPath').form('open','${i18n.update} - ');
			}
			
			
			// 路径起始位置选择
			function check1(obj){
				if(obj.value==1){
					$("#rdoMsg").text("[${i18n.tianx}]");
					$("#div_record23").show();
					setMD("record22_mos",'UD');
					setMD("record22_jianglms",'UD');
				}else{
					$("#div_record23").hide();
					$("#div_record23").find("input").val("");
					$("#rdoMsg").text("[${i18n.butianx}]");
				}
			}
			
			// 验证关键点是否重复（仓库不能重复）是 true 否 false
			function checkPoint(xian,ding){
				return xian.value==ding.value?true:false;
			}
			
			
			// 路径起始位置选择
			function check(obj){
				if(obj.value==1){
					$("#div_record13").show();
					setMD("record12_mos",'UD');
					setMD("record12_jianglms",'UD');
				}else{
					$("#div_record13").hide();
					$("#div_record13").find("input").val("");
				}
			}
			// 路径起始位置选择
			function checkType(obj){
				if(obj.value==1){
					$("#div_record33").show();
					setMD("record32_mos",'UD');
					setMD("record32_jianglms",'UD');
				}else{
					$("#div_record33").hide();
					$("#div_record33").find("input").val("");
				}
			}
			
			
			// 提交
			function func_button_addSubmitPath(){
				//验证线边库
				var _xianbk = $("#record12_xianbk").fieldValue();
				checkCangkbh(_xianbk,"record12_qidlx","record11_usercenter");
				//验证订货库
				var _dinghk = $("#record13_dinghk").fieldValue();
				checkCangkbh(_dinghk,"record13_qidlx2","record11_usercenter");
				
				var record = $('#grid_CkxLingjxhd').grid('getSelectedRecords');
				if(record.length == 0){// 选择零件消耗点
					alert('${i18n.qignxzljxhd}!');
					return false;
				} 
				var params = [];
				var lingjs = [];
				for(var i=0;i<record.length;i++){
					params.push('ling['+i+'].usercenter='+record[i].usercenter);
					params.push('ling['+i+'].lingjbh='+record[i].lingjbh);
					params.push('ling['+i+'].xiaohdbh='+record[i].xiaohdbh);
					params.push('ling['+i+'].fenpqbh='+record[i].fenpqbh);
					params.push('ling['+i+'].shengcxbh='+record[i].shengcxbh);
					lingjs.push('ling['+i+'].lingjbh='+record[i].lingjbh);
					lingjs.push('ling['+i+'].usercenter='+record[i].usercenter);
				}
				if(!setMD("record12_mos",'UD')){return false;}
				if(!setMD("record12_jianglms",'UD')){return false;}
				var values1=$("#div_record12").find("input");
				var values2=$("#div_record13").find("input");
				
				// 验证产线-线边库路径
				for(var i=0;i<values1.length;i++){
					var name=$(values1[i]).attr("name");
					var value=$(values1[i]).attr("value");
					if(name!=null){
						if(checkValues(values1[i])){
							params.push("bean."+name+"="+value);
						}else{
							return;
						}
						
					}
				}
				// 验证线边库-订货库路径
				 if(!($("#rdoInnerType").attr("checked")=="checked")){
					// 非空验证
					 for(var i=0;i<values2.length;i++){
						var name=$(values2[i]).attr("name");
						var value=$(values2[i]).attr("value");
						if(name!=null){
							if(checkValues(values2[i])){
								params.push("bean."+name+"="+value);
							}else{
								return;
							}
							
						}
					}
					 // 循环起点与线边库起点不能相同
					 if($("#record12_xianbk").fieldValue()==$("#record13_dinghk").fieldValue()){
						 alert("循环起点与线边库起点不能相同 ");
						 return false;
					 }
					 
				 }
				
				 if(!checkThere("record12_jianglms","record12_jianglmssxsj","${i18n.jianglms1}"))return false;
				 if(!checkThere("record12_wjlms","record12_shengxsj","${i18n.waibjlms}"))return false;
				 if(!checkThere("record13_jianglms2","record13_jianglmssxsj2","${i18n.jianglms2}"))return false;
				 var xianbk = $("#record12_xianbk").fieldValue();
				 var dinghk = $("#record13_dinghk").fieldValue();
				 lingjs.push("xianbk="+xianbk);
				 lingjs.push("dinghk="+dinghk);	
				 if(!checkMos("record12_mos")){return false;	}
					if(!checkMos("record12_jianglms")){return false;	}
				 if(checkWbms(lingjs,1,params)){return ;}
// $.sdcui.ajaxUtil.ajax({
// url:"addCkxInnerPath.ajax",//请求url
// data:params.join('&'),
// success:function (result){
// if(typeof result.success=="undefined"||result.success!==false){
// $('#form_addCkxInnerPath').dialog('close');
// $('#form_addCkxInnerPath').form('clear');
// $('#grid_CkxInnerPath').grid('reload');//刷新表格数据
// }
// }
// });
			}
			function checkWbms(lingjs,operate,params){
				var op = Math.abs(operate)-1;
				// 0004865 2012-10-21
				if(2 == operate){
					if($("#record22_hiddenWMS").fieldValue() == $("#record22_wms").fieldValue()){
						submit_button(operate,params);
						return false;
					}					
				}
				lingjs.push('operate='+op);
				$.sdcui.ajaxUtil.ajax({
			            url:"checkUpdateInnerPath.ajax",// 请求url
			            data:lingjs.join('&'),
			           	success:function (result){
			           		if(confirm(result.result)){
			           			submit_button(operate,params);
			           		}
			           		return false;
						}
			     	});
				 return false;
			}
			function submit_button(operate,params){
				if(1 == operate){
          			 $.sdcui.ajaxUtil.ajax({
    		            url:"addCkxInnerPath.ajax",// 请求url
    		            data:params.join('&'),
    		           	success:function (result){
    		           		if(typeof result.success=="undefined"||result.success!==false){
    							$('#grid_CkxInnerPath').grid('reload');// 刷新表格数据
    							$('#grid_CkxLingjxhd').grid('reload');// 刷新表格数据
    		           		}
    					}
    		     	});
          			}else if(-1 == operate){
          				$('#form_addCkxInnerPath1').form('submit');
          			}else if(2 == operate){
          				$('#form_editCkxInnerPath').form('submit');
          			}
			}
			// 输入检查
			function checkValues(inp){
				var name=$(inp).attr("name");
				var value=inp.value;
				// 非空检查
				if(name=="xianbk"&&(value==""||value.length!=3)){alert("${i18n.qingtx3wxhqd}");return false;}
				if(name=="mos"&&value==""){alert("${i18n.qingtxqdlx}${i18n.mos1}");return false;}
				if(name=="qidlx"&&value==""){alert("${i18n.qingtxqdlx}${i18n.qidlx1}");return false;}
				// if(name=="jianglms"&&value==""){alert("请填写将来模式1");return
				// false;}
				// if(name=="jianglmssxsj"&&value==""){alert("请填写将来模式生效时间1");return
				// false;}
				if(name=="wms"&&value==""){alert("${i18n.qingtxqdlx}${i18n.waibms}");return false;}
				// if(name=="zhidgys"&&(value==""||value.length!=10)){alert("请填写10位指定供应商编码");return
				// false;}
				// if(name=="wjlms"&&value==""){alert("请填写外部将来模式");return
				// false;}
				// if(name=="shengxsj"&&value==""){alert("请填写外部将来模式生效时间");return
				// false;}
				if(name=="dinghk"&&(value==""||value.length!=3)){alert("${i18n.qingtx3wxbkqd}");return false;}
				if(name=="mos2"&&value==""){alert("${i18n.qingtxqdlx}${i18n.mos2}");return false;}
				if(name=="qidlx2"&&value==""){alert("${i18n.qingtxqdlx}${i18n.qidlx2}");return false;}
				// if(name=="jianglms2"&&value==""){alert("请填写将来模式2");return
				// false;}
				// if(name=="jianglmssxsj2"&&value==""){alert("请填写将来模式生效时间2");return
				// false;}
				
				return true;
			}
			function func_button_addSubmitPath1(){
				//验证线边库
				var _xianbk = $("#record32_xianbk").fieldValue();
				checkCangkbh(_xianbk,"record32_qidlx","record32_usercenter");
				//验证订货库
				var _dinghk = $("#record33_dinghk").fieldValue();
				checkCangkbh(_dinghk,"record33_qidlx2","record32_usercenter");
				
				if($("#rdoInnerType3").attr("checked")!='checked'){
					var values1=$("#div_record33").find("input");
					for(var i=0;i<values1.length;i++){
						var name=$(values1[i]).attr("name");
						var value=$(values1[i]).attr("value");
						if(name!=null){
							if(!checkValues(values1[i])){
								return;
							}
						}
					}
					
					 // 循环起点与线边库起点不能相同
					 if($("#record32_xianbk").fieldValue()==$("#record33_dinghk").fieldValue()){
						 alert("循环起点与线边库起点不能相同 ");
						 return false;
					 }
				}
			    if(!setMD("record32_mos",'UD')){return false;}
			    if(!setMD("record32_jianglms",'UD')){return false;}
				if(!checkThere("record32_jianglms","record32_jianglmssxsj","${i18n.jianglms1}"))return false;
				if(!checkThere("record32_wjlms","record32_shengxsj","${i18n.waibjlms}"))return false;
				if(!checkThere("record33_jianglms2","record33_jianglmssxsj2","${i18n.jianglms2}"))return false;
				var params = [];
				var lingjs = [];
				var usercenter = $("#record32_usercenter").fieldValue();
				var lingjbh = $("#record32_lingjbh").fieldValue();
				var xianbk = $("#record32_xianbk").fieldValue();
				var dinghk = $("#record33_dinghk").fieldValue();
				lingjs.push('ling[0].lingjbh='+lingjbh);
				lingjs.push('ling[0].usercenter='+usercenter);
				lingjs.push("xianbk="+xianbk);
				lingjs.push("dinghk="+dinghk);	
				if(!checkMos("record32_mos")){return false;	}
				if(!checkMos("record32_jianglms")){return false;	}
				if(checkWbms(lingjs,-1,params)){return ;}
				
			}
			function func_button_editSubmitPath(){
				//验证线边库
				var _xianbk = $("#record22_xianbk").fieldValue();
				checkCangkbh(_xianbk,"record22_qidlx","record22_usercenter");
				//验证订货库
				var _dinghk = $("#record23_dinghk").fieldValue();
				checkCangkbh(_dinghk,"record23_qidlx2","record22_usercenter");
				if($("#rdoInnerType1").attr("checked")!='checked'&&$("#rdoInnerType2").attr("checked")!='checked'){
					alert("请选择路径起始位置");
					return;
				}
				if($("#rdoInnerType2").attr("checked")=='checked'){
					var values1=$("#div_record23").find("input");
					for(var i=0;i<values1.length;i++){
						var name=$(values1[i]).attr("name");
						var value=$(values1[i]).attr("value");
						if(name!=null){
							if(!checkValues(values1[i])){
								return;
							}
						}
					}
					 // 循环起点与线边库起点不能相同
					 if($("#record22_xianbk").fieldValue()==$("#record23_dinghk").fieldValue()){
						 alert("循环起点与线边库起点不能相同 ");
						 return false;
					 }
				}
			    if(!setMD("record22_mos",'UD')){return false;}
			    if(!setMD("record22_jianglms",'UD')){return false;}
				if(!checkThere("record22_jianglms","record22_jianglmssxsj","${i18n.jianglms1}"))return false;
				if(!checkThere("record22_wjlms","record22_shengxsj","${i18n.waibjlms}"))return false;
				if(!checkThere("record23_jianglms2","record23_jianglmssxsj2","${i18n.jianglms2}"))return false;
				var params = [];
				var lingjs = [];
				var usercenter = $("#record22_usercenter").fieldValue();
				var lingjbh = $("#record22_lingjbh").fieldValue();
				var xianbk = $("#record22_xianbk").fieldValue();
				var dinghk = $("#record23_dinghk").fieldValue();
				lingjs.push('ling[0].lingjbh='+lingjbh);
				lingjs.push('ling[0].usercenter='+usercenter);
				lingjs.push("xianbk="+xianbk);
				lingjs.push("dinghk="+dinghk);	
				if(!checkMos("record22_mos")){return false;	}
				if(!checkMos("record22_jianglms")){return false;	}
				if(checkWbms(lingjs,2,params)){return ;}
			}
			function  record12_mos_change(){				
				setJLUD("record12_mos","record12_wms");					
			}
			function  record12_jianglms_change(){				
				setJLUD("record12_jianglms","record12_wjlms");	
			}
			function  record12_wms_change(){	
				setJLUD("record12_wms","record12_mos");
			}
			function  record12_wjlms_change(){	
				setJLUD("record12_wjlms","record12_jianglms");
			}
			function  record13_mos2_change(){	
				setMD("record13_mos2",'DU');
			}
			function  record13_jianglms2_change(){	
				setMD("record13_jianglms2",'DU');
			}
			function  record22_mos_change(){				
				setJLUD("record22_mos","record22_wms");					
			}
			function  record22_jianglms_change(){				
				setJLUD("record22_jianglms","record22_wjlms");	
			}
			function  record22_wms_change(){	
				setJLUD("record22_wms","record22_mos");
			}
			function  record22_wjlms_change(){	
				setJLUD("record22_wjlms","record22_jianglms");
			}
			function  record23_mos2_change(){	
				setMD("record23_mos2",'DU');
			}
			function  record23_jianglms2_change(){	
				setMD("record23_jianglms2",'DU');
			}
			function  record32_mos_change(){				
				setJLUD("record32_mos","record32_wms");					
			}
			function  record32_jianglms_change(){				
				setJLUD("record32_jianglms","record32_wjlms");	
			}
			function  record32_wms_change(){	
				setJLUD("record32_wms","record32_mos");
			}
			function  record32_wjlms_change(){	
				setJLUD("record32_wjlms","record32_jianglms");
			}
			function  record33_mos2_change(){	
				setMD("record33_mos2",'DD');
			}
			function  record33_jianglms2_change(){	
				setMD("record33_jianglms2",'DD');
			}
			function checkMos(id){
				var idValue = $("#"+id).fieldValue();
				var prefix= id.substr(0,7);
				if('R1'== idValue ||'CD'== idValue ){
					prefix += "2";
					if(0 < id.indexOf("_mos")){
						var _jianglms = $("#"+prefix+"_jianglms").fieldValue();
						var _wjlms = $("#"+prefix+"_wjlms").fieldValue();
						if(_jianglms != _wjlms && ("" == _jianglms || "" == _wjlms)){
							alert("若上线模式为CD或R1，则上线将来模式和外部将来模式必须都存在值或都不存在");
							return false;
						}else{
							if("" != _jianglms){
								var _jianglmssxsj = $("#"+prefix+"_jianglmssxsj").fieldValue();
								var _shengxsj = $("#"+prefix+"_shengxsj").fieldValue();
								if(_jianglmssxsj != _shengxsj){
									alert("若上线模式为CD或R1，且上线将来模式不为空，则上线生效时间和外部生效时间必须相同");
									return false;
								}
							}
							return true;
						}
					       
					}else if(0 < id.indexOf("_jianglms")){
						var _jianglmssxsj = $("#"+prefix+"_jianglmssxsj").fieldValue();
						var _shengxsj = $("#"+prefix+"_shengxsj").fieldValue();
						if(_jianglmssxsj != _shengxsj){
							alert("若上线将来模式为CD或R1，且上线将来模式不为空，则上线生效时间和外部生效时间必须相同");
							return false;
						}
						return true;
					}
				}else if('MD' == idValue){
					prefixDing = prefix +"3";
					prefix += "2";
					if(0 < id.indexOf("_mos")){
						var _jianglms = $("#"+prefix+"_jianglms").fieldValue();
						var _jianglms2 = $("#"+prefixDing+"_jianglms2").fieldValue();
						if(_jianglms != _jianglms2 && ("" == _jianglms || "" == _jianglms2)){
							alert("若上线模式为MD，则上线将来模式和中间将来模式必须都存在值或都不存在");
							return false;
						}else{
							if("" != _jianglms){
								var _jianglmssxsj = $("#"+prefix+"_jianglmssxsj").fieldValue();
								var _jianglmssxsj2 = $("#"+prefixDing+"_jianglmssxsj2").fieldValue();
								if(_jianglmssxsj != _jianglmssxsj2){
									alert("若上线模式为MD，且上线将来模式不为空，则上线生效时间和中间生效时间必须相同");
									return false;
								}
							}
							return true;
						}
					       
					}else if(0 < id.indexOf("_jianglms")){
						var _jianglmssxsj = $("#"+prefix+"_jianglmssxsj").fieldValue();
						var _jianglmssxsj2 = $("#"+prefixDing+"_jianglmssxsj2").fieldValue();
						if(_jianglmssxsj != _jianglmssxsj2){
							alert("若上线模式为MD，且上线将来模式不为空，则上线生效时间和中间生效时间必须相同");
							return false;
						}
						return true;
					}
				}
				return true;
			}
		
			// 检查是否同时存在，模式和对应的时间必须同时存在
			function checkThere(id1,id2,name){
				if(("" ==$("#"+id1).fieldValue()|| "" ==$("#"+id2).fieldValue())&& $("#"+id1).fieldValue()!= $("#"+id2).fieldValue()){
					alert("【"+name+"】${i18n.hetdydsxsjbxtscz}");
					return false;
				}
				return true;
			}
			/**
			 * 设置级联
			 */
			function setJLUD(id1,id2){
				var id1Value = $("#"+id1).fieldValue();
				if('R1'== id1Value ||'CD'== id1Value ||'SY' == id1Value){
					if('SY' == id1Value){	
						if(id1.indexOf("2_wms")>0||id1.indexOf("2_wjlms")>0){
							$("#"+id2).fieldValue($("#"+id1).fieldValue());
							setSelectDisabled(id2,true);
						}else{
							if('R1'==$("#"+id2).fieldValue()||'CD'==$("#"+id2).fieldValue()){
								$("#"+id2).fieldValue("");
							}
							setSelectDisabled(id2,false);
						}							
					}else{
						if($("#"+id2).fieldValue()!= $("#"+id1).fieldValue()){						
							$("#"+id2).fieldValue($("#"+id1).fieldValue());
							setSelectDisabled(id2,true);
						}
					}
				}else{
					if('R1'==$("#"+id2).fieldValue()||'CD'==$("#"+id2).fieldValue()){
						$("#"+id2).fieldValue("");
					}
					setSelectDisabled(id2,false);					
				}
				setMD(id1,'UD');
			}
			/**
			 * 判断是否是MD，若为MD则必须是订货库
			 */
			function setMD(id,t){
				var prefix=id.substr(0,7);
				var property=id.substr(8,id.length);	
				if("UD" == t){
					property +="2"; 	
					prefix +="3"; 
				}else{					
					property=property.substr(0,property.length-1);
					prefix +="2"; 
				}				
				if('MD'==$("#"+id).fieldValue()){									
					var type="rdoInnerType";
					if("record2" == prefix.substr(0,7)){
						type+="1";
					}else if ("record3" == prefix.substr(0,7)){
						type +="3";
					}
					if($("#"+type).attr("checked")=='checked'){
						alert("${i18n.ruozwMDzqswzbxsdhk}");
						return false;
					}else{
						if(!$("#"+id).hasClass('disabled')){
							setSelectDisabled(prefix+property,true);
							$("#"+prefix+property).fieldValue($("#"+id).fieldValue());
						}						
					}
				}else{
					if('MD' == $("#"+prefix+property).fieldValue()){
						$("#"+prefix+property).fieldValue("");
					}
					setSelectDisabled(prefix+property,false);
				}
				return true;
			}
			
			/**
			 * 置灰下拉框 置灰：true，清除：false
			 */
			function setSelectDisabled(id,flag){
				if(undefined != flag && null != flag && flag){
					if(!$("#"+id).hasClass("disabled")){
						$("#"+id).addClass('disabled');
					}	
					if($("#"+id+" input").eq(0).attr("disabled")){
						$("#"+id+" input").attr("disabled",flag);
					}	
				}else{
					if($("#"+id).hasClass("disabled")){
						$("#"+id).removeClass('disabled');
					}
					if($("#"+id+" input").eq(0).attr("disabled")){
						$("#"+id+" input").attr("disabled",false);
					}
				}				
			}
			
			//删除  lc 2016.10.18
			function func_button_remove(){
				 var roles = $('#grid_CkxInnerPath').grid('getSelectedRecords');
				 if(roles.length==0){
					 alert("请至少选择一条记录");
					 return false;			 		
				 }
				 var params = [];
				 for(var i = 0 ; i < roles.length ; i++ ){
					 params.push("list["+i+"].usercenter="+roles[i].usercenter);
					 params.push("list["+i+"].lingjbh="+roles[i].lingjbh);
					 params.push("list["+i+"].fenpqh="+roles[i].fenpqh);
					 params.push("list["+i+"].xianbk="+roles[i].xianbk);
					 params.push("list["+i+"].dinghk="+roles[i].dinghk);
				 }
				 if(confirm("确认删除选中记录?")){
					 $.sdcui.ajaxUtil.ajax({
							url:'deleteCkxInnerPath.ajax',
							data:params.join('&'),
							success:function(result){
								if(typeof result.success=="undefined"||result.success!==false){
									$("#grid_CkxInnerPath").grid('reload');
								}
							}
						});
				 }			 
			}
			
			//导出模板  lc 2016.10.19
			function func_button_mobxz(){
				$.sdcui.pageUtils.goPage({
					url : '../carry/downloadInnerpathMob.do',
					mode : 'form',
					beforeSubmit : function(){
						return true;
					}
			   });
			}
		</script>
</t:html>