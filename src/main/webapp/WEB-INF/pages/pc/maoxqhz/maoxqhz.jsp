<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html>
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<script type="text/javascript" src="${ctx}/athena/js/util.js"></script>

</head>
<t:page i18n="i18n.pc.pc">
	<!--月模拟计划跟踪列表 -->
	<t:grid id="maoxqGrid" idKeys="usercenter" caption="${i18n.pc_maoxq_title }" scrollHeight="230"
		src="/pc/queryMaoxqhz.ajax" showNum="true"  exportXls="false" add="NOT" edit="NOT" remove="NOT" load="false">
		<t:fieldLayout id="Maoxq_select" prefix="Maoxq">
			<t:fieldCustom property="gongyzq" caption="${i18n.gongyzq }" styleClass="red"></t:fieldCustom>
			<t:fieldText property="lingjbh" caption="${i18n.lingjbh } " maxLength="10"></t:fieldText>
			<t:fieldSelect property="chullx" caption="${i18n.xuqlx }" convert="chullx" notNull="true" ></t:fieldSelect>
			<t:fieldHidden property="gongyzqyear"></t:fieldHidden>
			<t:fieldHidden property="chanxz"></t:fieldHidden>
			<t:fieldHidden property="shengcx" defaultValue="${shengcx}"></t:fieldHidden>
		</t:fieldLayout>
		<t:gridCol property="USERCENTER" caption="${i18n.kehuusercenter }" width="120"></t:gridCol>
		<t:gridCol property="KAISSJ" caption="${i18n.kaissj }"></t:gridCol>
		<t:gridCol property="JIESSJ" caption="${i18n.jiessj }"></t:gridCol>
		<t:gridCol property="LINGJBH"  caption="${i18n.lingjbh }"></t:gridCol>
		<t:gridCol property="ZHONGWMC"  caption="${i18n.zhongwmc }"></t:gridCol>
		<t:gridCol property="LINGJSL" width="120" caption="${i18n.lingjsl }"></t:gridCol>
		<t:gridCol property="XIEHD"  caption="${i18n.laiy }" ></t:gridCol>
		<t:gridCol property="CHULLX"  caption="${i18n.xuqlx }" ></t:gridCol>
	</t:grid>
	
<script type="text/javascript">
//初始化查询区域工业周期下拉框
window.onload = function(){openGongyzq();}
	function openGongyzq(){
		var MaoxqElement = $('#Maoxq_gongyzq');
		var gyzqyear = $('#Maoxq_gongyzqyear').fieldValue();
		var yearString = '<select name = "year" id="yearId"><option value=""></option>';
		if(gyzqyear.length>0){
			var arryear = gyzqyear.split(',');
			for(var i=0;i<arryear.length;i++){
				yearString = yearString + '<option value="' + arryear[i] + '">' + arryear[i] + '</option>';
			}
		}
		yearString = yearString + '</select>';
		if(!MaoxqElement.hasClass('loaded')){
//			$('#Maoxq_gongyzq').html('<select name = "year" id="yearId"><option value=""></option><option value="2010">2010</option><option value="2011">2011</option><option value="2012">2012</option></select>'
			$('#Maoxq_gongyzq').html(yearString
			+'<select name = "month" id="monthId"><option value=""></option><option value="01">1</option><option value="02">2</option><option value="03">3</option><option value="04">4</option><option value="05">5</option><option value="06">6</option><option value="07">7</option><option value="08">8</option><option value="09">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option></select>');
			
			$('#Maoxq_gongyzq').addClass('loaded').fieldCustom({
				property:'gongyzq',
				setValue:function(value){
					
				},
				getValue:function(){
					var value = $("#yearId").val()+$("#monthId").val();
					return value;
				},
				clear:function(){
					this.element.find('select,select').val('');
				}
			});
		}
	}
	
	$.sdcui.serverConfig.convertArray['chullx'] ={'PP':'PP','PJ':'PJ'};
   
   	function maoxqGrid_beforeSubmit() {
		var year = $("#yearId").val();
		var moth = $("#monthId").val();
		
		if(year == ""){
			alert("${i18n.maoxqhz_year_notnull }");
			return false;
		}
		if(moth == ""){
			alert("${i18n.maoxqhz_month_notnull }");
			return false;
		}
	}                                            
</script>	
</t:page>
</t:html>