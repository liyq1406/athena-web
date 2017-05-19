<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 110px; } </style>
	</head>
	<t:page i18n="i18n.ckx.carry.i18n_carry">
	
			<!-- 子表数据 -->
	
			<t:grid id="grid_CkxWaibwlxx" src="queryCkxWaibwlxx.ajax"  idKeys="usercenter,lujbh,xuh" dataFormId="form_CkxWaibwlxx"
			showNum="true" editSrc="getCkxWaibwlxx.ajax" removeSrc="removeCkxWaibwlxx.ajax" caption="${i18n.wulljxx}" load="false" add="NOT"
			scrollHeight="290" pageSize="15">
			<t:fieldLayout prefix="record0" columns="3">
				<t:fieldSelect  property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap"  defaultValue="${loginUser.usercenter}"  width="150" />
				<t:fieldText property="lujbh" caption="${i18n.lujbh}" maxLength="10" width="150" ></t:fieldText>
				<t:fieldText property="gcbh" caption="${i18n.gcbh}" maxLength="10" width="150" ></t:fieldText>
				<t:fieldText property="xuh" dataType="integer" caption="${i18n.xuh}" maxLength="2" width="150" ></t:fieldText>
				<t:fieldText property="wuldbh"  caption="${i18n.wuldbh}" maxLength="3" minLength="3" dataType="text" width="150" ></t:fieldText>
				
			</t:fieldLayout>
			<t:button name="addCkxWaibwlxx" icon="addRecord" caption="${i18n.add}"></t:button>
				<t:gridCol property="usercenter" editor="fieldSelect" convert="queryUserCenterMap" caption="${i18n.usercenter}"/>
				<t:gridCol property="lujbh" caption="${i18n.lujbh}"></t:gridCol>
				<t:gridCol property="xuh" caption="${i18n.xuh}"></t:gridCol>
				<!-- xss 2015/7/8- 0010509 -->
				<t:gridCol property="shifqhbs" editor="fieldHidden" convert="shif" caption="${i18n.shifqhbs}"></t:gridCol>
				
				<t:gridCol property="wuldbh" caption="${i18n.wuldbh}"></t:gridCol>
				<t:gridCol property="wuldmc" caption="${i18n.wuldmc}"></t:gridCol>
				<t:gridCol property="shifjk" caption="${i18n.shifjk}" editor="fieldHidden" convert="shif"></t:gridCol>
				<t:gridCol property="yaohlzkbs" caption="${i18n.yaohlzk}" editor="fieldHidden" convert="shif">></t:gridCol>
				<t:gridCol property="guanjdbs" caption="${i18n.guanjdbs}" editor="fieldHidden" convert="shif"></t:gridCol>
				<t:gridCol property="jihdhsysj" caption="${i18n.jihdhsysj}"></t:gridCol>
				<t:gridCol property="gcbh" caption="${i18n.gcbh}"></t:gridCol>
				<t:gridCol property="yunsms" caption="${i18n.yunsms}" editor="fieldHidden" convert="queryYSMS"></t:gridCol>
				<t:gridCol property="yunssj" caption="${i18n.yunssj}"></t:gridCol>
				<t:gridCol property="beihzq" caption="${i18n.beihzq}"></t:gridCol>
				<%-- <t:gridCol property="shengxrq" caption="生效日期"></t:gridCol> --%>
				
			</t:grid>
		
	
	
	<!-- 编辑数据 -->
	<t:fieldLayout prefix="record3" >
		<t:form width="800" dialog="true" id="form_addCkxWaibwlxx" caption="${i18n.waibwllj}" reset="NOT" action="saveCkxWaibwlxx.ajax" >
			<t:fieldLayout prefix="record31">
				${i18n.addNewCode}：<input type="checkbox" onclick="changeGroup(this)"/>
				<t:fieldText property="newlujbh" dataType="text" maxLength="10" minLength="10" caption="${i18n.lujbh}"/>
				
				<t:fieldSelect property="lujbh"  src="getSelectLujbhCode.ajax" show="lujbh" code="lujbh" caption="${i18n.lujbh}"  />
				
				<t:fieldHidden property="xuh" />
				<t:fieldSelect  property="usercenter" notNull="true"  caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${loginUser.usercenter}"  />
				<t:fieldText property="wuldbh" notNull="true"  caption="${i18n.wuldbh}"  maxLength="3" minLength="3" dataType="text" />
				<t:fieldText property="wuldmc" notNull="true"  caption="${i18n.wuldmc}" readonly="true"></t:fieldText>
				<t:fieldSelect property="shifjk" notNull="true" convert="shif" caption="${i18n.shifjk}" />
				<t:fieldSelect property="yaohlzkbs"  convert="shif"  notNull="true" caption="${i18n.yaohlzk}" />
				<t:fieldSelect property="guanjdbs" notNull="true"  convert="shif" caption="${i18n.guanjdbs}" />
				<t:fieldText property="jihdhsysj" notNull="true"  expression='^[0-9]{1,3}$|^[0-9]{1,3}[.][0-9]{1,2}$'  expressionMessage="${i18n.qingsr3wzsh2wxs}"  caption="${i18n.jihdhsysj}"></t:fieldText>
				<t:fieldText property="gcbh" notNull="true"  caption="${i18n.gcbh}" maxLength="10" minLength="6"></t:fieldText>
				<t:fieldSelect property="yunsms" notNull="true" convert="queryYSMS" caption="${i18n.yunsms}"></t:fieldSelect>
				<t:fieldText property="yunssj" notNull="true" caption="${i18n.yunssj}" expression='^[0-9]{1,3}$|^[0-9]{1,3}[.][0-9]{1,2}$'  expressionMessage="${i18n.qingsr3wzsh2wxs}" ></t:fieldText>
				<t:fieldText property="beihzq" notNull="true" caption="${i18n.beihzq}" expression='^[0-9]{1,3}$|^[0-9]{1,3}[.][0-9]{1,2}$' expressionMessage="${i18n.qingsr3wzsh2wxs}"></t:fieldText>			
				<%-- <t:fieldCalendar property="shengxrq" notNull="true" caption="生效日期" format="yyyy-MM-dd"/> --%>
				<!-- xss 2015/7/8- 0010509 -->
				<t:fieldSelect property="shifqhbs" notNull="true"  convert="shif" caption="${i18n.shifqhbs}" />
				
			</t:fieldLayout>
			
		</t:form>
		<t:form width="800" dialog="true" id="form_CkxWaibwlxx" reset="NOT" caption="${i18n.waibwllj}" action="saveCkxWaibwlxx.ajax" >
			<t:fieldLayout prefix="record32">
				<t:fieldText property="lujbh"  caption="${i18n.lujbh}" readonly="true"   maxLength="10" minLength="10" dataType="text"/>
				<t:fieldHidden property="xuh" />
				<t:fieldSelect  property="usercenter" notNull="true"  caption="${i18n.usercenter}" convert="queryUserCenterMap" />
				<t:fieldText property="wuldbh" notNull="true"  caption="${i18n.wuldbh}"  maxLength="3" minLength="3" dataType="text" />
				<t:fieldText property="wuldmc" notNull="true"  caption="${i18n.wuldmc}" readonly="true"></t:fieldText>
				<t:fieldSelect property="shifjk" notNull="true" convert="shif" caption="${i18n.shifjk}" />
				<t:fieldSelect property="yaohlzkbs"  convert="shif"  notNull="true" caption="${i18n.yaohlzk}" />
				<t:fieldSelect property="guanjdbs" notNull="true"  convert="shif" caption="${i18n.guanjdbs}" />
				<t:fieldText property="jihdhsysj" notNull="true"  expression='^[0-9]{1,3}$|^[0-9]{1,3}[.][0-9]{0,2}$'  expressionMessage="${i18n.qingsr3wzsh2wxs}"  caption="${i18n.jihdhsysj}"></t:fieldText>
				<t:fieldText property="gcbh" notNull="true"  caption="${i18n.gcbh}" maxLength="10" minLength="6"></t:fieldText>
				<t:fieldSelect property="yunsms" notNull="true" convert="queryYSMS" caption="${i18n.yunsms}"></t:fieldSelect>
				<t:fieldText property="yunssj" notNull="true" caption="${i18n.yunssj}" expression='^[0-9]{1,3}$|^[0-9]{1,3}[.][0-9]{1,2}$'  expressionMessage="${i18n.qingsr3wzsh2wxs}" ></t:fieldText>
				<t:fieldText property="beihzq" notNull="true" caption="${i18n.beihzq}" expression='^[0-9]{1,3}$|^[0-9]{1,3}[.][0-9]{1,2}$'  expressionMessage="${i18n.qingsr3wzsh2wxs}"></t:fieldText>				
				<%-- <t:fieldCalendar property="shengxrq" notNull="true" caption="生效日期" format="yyyy-MM-dd"/> --%>
				<!-- xss 2015/7/8- 0010509 -->
				<t:fieldSelect property="shifqhbs" notNull="true"  convert="shif" caption="${i18n.shifqhbs}" />
				
			</t:fieldLayout>
			
		</t:form>
	</t:fieldLayout>
	
	
	</t:page>
		<script type="text/javascript">
			function initPage(){
				//页面初始化
				var  codetd=$("#record31_newlujbh").parent("td:first");
				codetd.hide();
				codetd.prev().hide();
				$("#record31_wuldbh input").blur(function (){record31_wuldbh_click();});
				$("#record32_wuldbh input").blur(function (){record32_wuldbh_click();});
			}
			function func_grid_addCkxWaibwlxx(){
				$('#form_addCkxWaibwlxx').form('clear');
				$("#record31_usercenter").fieldValue('${loginUser.usercenter}');
				$('#form_addCkxWaibwlxx').form('open','${i18n.add} - ');
			}
			//添加按钮回调函数
			function form_addCkxWaibwlxx_afterSubmit(result){
				if(typeof result.success=="undefined"||result.success!==false){
					$('#form_addCkxWaibwlxx').dialog('close');
					$('#grid_CkxWaibwlxx').grid('reload');//刷新表格数据
				}
				return false;
			}
			
			
			//添加按钮回调函数
			function form_CkxWaibwlxx_afterSubmit(result){
				if(typeof result.success=="undefined"||result.success!==false){
					$('#form_CkxWaibwlxx').dialog('close');
					$('#form_CkxWaibwlxx').find('input').val("");
					$('#grid_CkxWaibwlxx').grid('reload');//刷新表格数据
				}
			}
			$.sdcui.serverConfig.convertArray['shif'] = {'1':'${i18n.yes}','0':'${i18n.no}'};
			//根据物理点编号获取物理点名称
			function record31_wuldbh_click(){
				var lujbh = $('#record31_wuldbh').fieldValue();
				var params = [];
				params.push("lujbh="+lujbh);
				$.sdcui.ajaxUtil.ajax({
		            url:"getPathNameByPathCode.ajax",//请求url
		            data:params.join('&'),
		           	success:function (result){
		           		if(result.result==null){
		           			alert("${i18n.wuldbhbczhsjysx}");
		           			$("#form_addCkxWaibwlxx").find("input[name='wuldmc']").val("");
		           		}else{
		           			$("#form_addCkxWaibwlxx").find("input[name='wuldmc']").val(result.result.wuldmc);
		           		}
		            }
		     	});
			}
			//根据物理点编号获取物理点名称
			function record32_wuldbh_click(){
				var lujbh = $('#record32_wuldbh').fieldValue();
				var params = [];
				params.push("lujbh="+lujbh);
				$.sdcui.ajaxUtil.ajax({
		            url:"getPathNameByPathCode.ajax",//请求url
		            data:params.join('&'),
		           	success:function (result){
		           		if(result.result==null){
		           			alert("${i18n.wuldbhbczhsjysx}");
		           			$("#form_CkxWaibwlxx").find("input[name='wuldmc']").val("");
		           		}else{
		           			$("#form_CkxWaibwlxx").find("input[name='wuldmc']").val(result.result.wuldmc);
		           		}
		            }
		     	});
			}
			//新旧编组切换录入
			function changeGroup(obj){
				
				if($(obj).attr("checked")=="checked"){
					var code=$("#record31_newlujbh").parent("td:first");
					
					var newcode=$("#record31_lujbh").parent("td:first");
					
					newcode.hide();
					newcode.prev().hide();
					newcode.find("input").val("");
					code.show();
					code.prev().show();
				}else{
					var codetd=$("#record31_newlujbh").parent("td:first");
					var bianzhtd=$("#record31_lujbh").parent("td:first");
					bianzhtd.show();
					bianzhtd.prev().show();
					codetd.hide();
					codetd.prev().hide();
					codetd.find("input").val("");
				}
			}
			
			
			
			
			
			
		</script>
	
</t:html>