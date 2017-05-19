<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="零件收货和报废统计">


<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 65px; } </style>
</head>

<t:page i18n="">
	<t:grid id="grid_lingjshhbftj" caption="零件收货和报废统计" idKeys="usercenter,lingjbh" src="/baob/querylingjshhbftj.ajax" 
	        add="NOT" edit="NOT" remove="NOT" load="false" save="NOT" showNum="true" exportXls="true" pageSize="15" scrollHeight="280">
		<t:fieldLayout id="lingjshhbftj" prefix="layout" columns="4">
			<t:fieldSelect property="usercenter" caption="用户中心" convert="queryUserCenterMap" width="120" defaultValue="${usercenter}"></t:fieldSelect>
			<t:fieldCalendar property="startrukrq" caption="入库时间" format="yyyy-MM-dd HH:mm:ss" notNull="true" width="165"></t:fieldCalendar>
 			<t:fieldCalendar property="endrukrq" caption="至" format="yyyy-MM-dd HH:mm:ss" notNull="true" width="165"></t:fieldCalendar>
			<t:fieldText property="cangkbh" caption="仓库编号" width="120" maxLength="3"></t:fieldText>
			<t:fieldSelect property="lingjzt" caption="状态" width="120" convert="ljzt"></t:fieldSelect>
		</t:fieldLayout>
		
		<t:button caption="收货明细" name="shouhmx"/>
		<t:button caption="报废明细" name="baofmx"/>
		
		<t:gridCol  property="usercenter" caption="用户中心" width="85"/>
		<t:gridCol  property="lingjbh" caption="零件编号" width="85"/>
		<t:gridCol  property="lingjmc" caption="零件名称" width="150"/>
		<t:gridCol  property="cangkbh" caption="仓库编号" width="85"/>
		<t:gridCol  property="ruksl" caption="入库数量" width="85"/>
		<t:gridCol  property="lingjzt" caption="状态"  width="85" convert="ljzt"/>
		<t:gridCol  property="" caption=""/>
	</t:grid>
	<t:form dialog="true" id="form_shouhmx" reset="NOT" submit="NOT" width="900" caption="收货明细查询">
			<t:grid id="grid_shmx" idKeys="usercenter,lingjbh" src="/baob/queryshouhmx.ajax" showNum="true" exportXls="true" back="NOT" 
				    submit="NOT" reset="NOT" add="NOT" edit="NOT" remove="NOT" load="false" pageSize="30" scrollHeight="380" editable="false" >
				<t:fieldLayout prefix="shmx"> 
						<t:fieldHidden property="usercenter"></t:fieldHidden>
						<t:fieldHidden property="startrukrq"></t:fieldHidden>
					    <t:fieldHidden property="endrukrq"></t:fieldHidden>
					    <t:fieldHidden property="cangkbh"></t:fieldHidden>
				</t:fieldLayout>
				<t:gridCol property="usercenter" caption="用户中心" width="85"/>
		        <t:gridCol property="yaohlh" caption="要货令号" width="85"/>
				<t:gridCol property="lingjbh" caption="零件编号" width="85"/>
				<t:gridCol property="gongysdm" caption="供应商代码" width="85"/>
				<t:gridCol property="chengysdm" caption="承运商代码" width="85"/>
				<t:gridCol property="cangkbh" caption="仓库编号" width="85"/>
				<t:gridCol property="yanssl" caption="零件交付数量" width="85"/>
				<t:gridCol property="ruksj" caption="实际交付时间" width="165"/>
				<t:gridCol property="zhuangtsx" caption="供货模式" width="85"/>
				<t:gridCol property="" caption=" "></t:gridCol>
			</t:grid>
	</t:form>
	<t:form dialog="true" id="form_baofmx" reset="NOT" submit="NOT" width="800" caption="报废明细查询">
			<t:grid id="grid_bfmx" idKeys="usercenter,lingjbh" src="/baob/querybaofmx.ajax" showNum="true" exportXls="true" back="NOT" 
				    submit="NOT" reset="NOT" add="NOT" edit="NOT" remove="NOT" load="false" pageSize="30" scrollHeight="380" editable="false" >
				<t:fieldLayout prefix="bfmx"> 
						<t:fieldHidden property="usercenter"></t:fieldHidden>
						<t:fieldHidden property="startrukrq"></t:fieldHidden>
					    <t:fieldHidden property="endrukrq"></t:fieldHidden>
					    <t:fieldHidden property="cangkbh"></t:fieldHidden>
				</t:fieldLayout>
				<t:gridCol property="usercenter" caption="用户中心" width="85"/>
				<t:gridCol property="lingjbh" caption="零件编号" width="85"/>
				<t:gridCol property="gongysdm" caption="供应商代码" width="85"/>
				<t:gridCol property="cangkbh" caption="仓库编号" width="85"/>
				<t:gridCol property="ruksl" caption="报废数量" width="85"/>
				<t:gridCol property="yuany" caption="报废原因" width="165"/>
				<t:gridCol property="ruksj" caption="报废时间" width="165"/>
				<t:gridCol property="" caption=" "></t:gridCol>
			</t:grid>
	</t:form>
	<t:buttons id="btn">
	<t:button caption="下载模板" name="mobxz" active="0"/>
    </t:buttons>
    <t:file action="/baob/importAth_ljshhbftj.do" size="50">
		<t:fileparam sheet="ljshhbftj" keys="lingjbh" table="{dbSchemal3}in_lingj" datasourceId="1"/>
	</t:file>
	<div><font color="red">导入结果不能大于1000条,否则为空</font></div>
	<div><font color="red">导出结果不能大于5000条,否则为空</font></div>
</t:page>
<script type="text/javascript">
$.sdcui.serverConfig.convertArray['ljzt'] = {
		'1' : '收货',
		'2' : '报废'
	};
	
//空格查询
function grid_lingjshhbftj_beforeSubmit() {
	$("#layout_startrukrq").fieldValue(trim($("#layout_startrukrq").fieldValue()));    
	$("#layout_endrukrq").fieldValue(trim($("#layout_endrukrq").fieldValue()));  
	$("#layout_cangkbh").fieldValue(trim($("#layout_cangkbh").fieldValue()));    
	$("#layout_lingjzt").fieldValue(trim($("#layout_lingjzt").fieldValue()));
	
	//比较时间大小 结束时间必须大于开始时间
	if ($("#layout_startrukrq").fieldValue()=="" || $("#layout_endrukrq").fieldValue()==""){
		alert("【入库时间】和【至】不能为空");
		return false;		
	}else{
		var startrukrq = new Date(($("#layout_startrukrq").fieldValue()).replace(/-/g,"/")); //起始日期 （将格式2014-10-12转换成2014/10/12）
		var endrukrq = new Date(($("#layout_endrukrq").fieldValue()).replace(/-/g,"/")); //结束日期（将格式2014-10-22转换成2014/10/22）
		if(startrukrq > endrukrq){
			alert("截止入库时间必须大于起始入库时间");
			return false;
		}else if(endrukrq-startrukrq>14*24*60*60*1000){
		    alert("时间区间不能大于两周！");
		    return false;
		}		
	}
	return true;
}

//导出模板
function func_button_mobxz(){
	$.sdcui.pageUtils.goPage({
		url : '../baob/downloadLjshhbftjMob.do',
		mode : 'form',
		beforeSubmit : function(){
			return true;
		}
   });
}

//收货明细查询
function func_button_shouhmx(){
	
	if(!grid_lingjshhbftj_beforeSubmit()){
		return;
	}
	
    $("#shmx_usercenter").fieldValue($("#layout_usercenter").fieldValue());//用户中心
    $("#shmx_startrukrq").fieldValue($("#layout_startrukrq").fieldValue());//起始入库时间
    $("#shmx_endrukrq").fieldValue($("#layout_endrukrq").fieldValue());//截止入库时间
    $("#shmx_cangkbh").fieldValue($("#layout_cangkbh").fieldValue());//仓库编号
	$('#form_shouhmx').form('open');
	$('#grid_shmx').grid('reload');//刷新grid
}

//报废明细查询
function func_button_baofmx(){
	
	if(!grid_lingjshhbftj_beforeSubmit()){
		return;
	}
	
    $("#bfmx_usercenter").fieldValue($("#layout_usercenter").fieldValue());//用户中心
    $("#bfmx_startrukrq").fieldValue($("#layout_startrukrq").fieldValue());//起始入库时间
    $("#bfmx_endrukrq").fieldValue($("#layout_endrukrq").fieldValue());//截止入库时间
    $("#bfmx_cangkbh").fieldValue($("#layout_cangkbh").fieldValue());//仓库编号
	$('#form_baofmx').form('open');
	$('#grid_bfmx').grid('reload');//刷新grid
}
</script>
</t:html>
