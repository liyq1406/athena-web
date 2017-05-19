<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 90px; } </style>
	</head>
	<t:page i18n="i18n.ckx.carry.i18n_carry">
		<t:grid id="grid_CkxXiehztxhsj" 
			idKeys="usercenter,cangkbh,xiehztbh,mos"
			dataFormId="form_CkxXiehztxhsj"
			caption="${i18n.xiehztxhsj }" 
			add="NOT"
			src="queryCkxXiehztxhsj.ajax"
			editSrc="getCkxXiehztxhsj.ajax"
			removeSrc="removeCkxXiehztxhsj.ajax" 
			load="false" showNum="true"
			scrollHeight="310" pageSize="15">
			<t:fieldLayout prefix="record0" columns="3">
				<t:fieldSelect  property="usercenter" caption="${i18n.usercenter }" convert="queryUserCenterMap"  defaultValue="${loginUser.usercenter}" width="150"/>
				<t:fieldText property="xiehztbh" caption="${i18n.xiehztbz }" minLength="4" maxLength="4" width="150"></t:fieldText>
				<t:fieldText property="cangkbh"  caption="${i18n.cangkbh}" minLength="6" maxLength="6" width="150"></t:fieldText>
				<t:fieldSelect property="mos" caption="${i18n.mos}" convert="queryGHMS1" width="150"/>
				<t:fieldSelect property="shengxbs" caption="${i18n.biaos}" convert="biaos"  width="150"/>
			</t:fieldLayout>
			
			<t:button name="addCkxXiehztxhsj" icon="addRecord" caption="${i18n.add}"></t:button>
			<t:gridCol property="usercenter" editor="fieldSelect" convert="queryUserCenterMap" caption="用户中心"/>
			<t:gridCol property="xiehztbh" caption="${i18n.xiehztbz }" width="120"/>
			<t:gridCol property="cangkbh" caption="${i18n.cangkbh}"/>
			<t:gridCol  property="mos" caption="${i18n.mos}"/>
			<t:gridCol property="beihsj" caption="${i18n.beihsj}"/>
			<t:gridCol property="shengxbs"  caption="${i18n.biaos}" editor="fieldHidden" convert="biaos" />
			<t:gridCol property="" caption="" width="5"></t:gridCol>
		</t:grid>
		<t:form dialog="true" reset="NOT" id="form_addCkxXiehztxhsj" caption="${i18n.xiehztxhsj}" action="addCkxXiehztxhsj.ajax">
			<t:fieldLayout prefix="record1">
				<t:fieldSelect  property="usercenter" notNull="true"  caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${loginUser.usercenter}" />
				<t:fieldText  property="xiehztbh"  caption="${i18n.xiehztbz }" notNull="true" maxLength="4" minLength="4" dataType="text"/>
				<t:fieldText  property="cangkbh"  caption="${i18n.cangkbh}" notNull="true" maxLength="6" minLength="6" dataType="text"/>
				<t:fieldSelect property="mos" caption="${i18n.mos}" notNull="true"  convert="queryGHMS1"></t:fieldSelect>
				<t:fieldText property="beihsj" notNull="true" expression='^[0-9]{1,3}$|^[0-9]{1,3}[.][0-9]{1,2}$'  expressionMessage="请输入3位正整数或2位小数" caption="备货时间(分钟)"></t:fieldText>
			</t:fieldLayout>
		</t:form>
		<t:form dialog="true" reset="NOT" id="form_CkxXiehztxhsj" caption="${i18n.xiehztxhsj}" action="saveCkxXiehztxhsj.ajax">
			<t:fieldLayout prefix="record2">
				<t:fieldSelect  property="usercenter" notNull="true" caption="${i18n.usercenter}" convert="queryUserCenterMap" readonly="true"/>
				<t:fieldText property="xiehztbh" caption="${i18n.xiehztbz }" readonly="true" ></t:fieldText>
				<t:fieldText property="cangkbh"  caption="${i18n.cangkbh}" readonly="true" ></t:fieldText>
				<t:fieldText property="mos" caption="${i18n.mos}"  readonly="true" ></t:fieldText>
				<t:fieldText property="beihsj" notNull="true" expression='^[0-9]{1,3}$|^[0-9]{1,3}[.][0-9]{1,2}$'  expressionMessage="请输入3位正整数或2位小数" caption="备货时间(分钟)"></t:fieldText>
				<t:fieldSelect property="shengxbs" caption="${i18n.biaos}" notNull="true" convert="biaos"></t:fieldSelect>
			</t:fieldLayout>
		</t:form>
	</t:page>
	<script type="text/javascript">
			function initPage(){
				//页面初始化
			}
			function func_grid_addCkxXiehztxhsj(){
				$('#form_addCkxXiehztxhsj').form('clear');
				$("#record1_usercenter").fieldValue('${loginUser.usercenter}');
				$('#form_addCkxXiehztxhsj').form('open','${i18n.add} - ');
			}
			
			//添加按钮回调函数
			function form_addCkxXiehztxhsj_afterSubmit(result){
				if(typeof result.success=="undefined"||result.success!==false){
					
// 					$('#form_addCkxXiehztxhsj').dialog('close');
// 					$('#form_addCkxXiehztxhsj').find('input').val("");
					$('#grid_CkxXiehztxhsj').grid('reload');//刷新表格数据
				}
			}
			$.sdcui.serverConfig.convertArray['shifzdbh'] = {'1':'${i18n.yes}','0':'${i18n.no}'};
			$.sdcui.serverConfig.convertArray['biaos'] = {'1':'${i18n.available}','0':'${i18n.unavailable}'};
		</script>
</t:html>