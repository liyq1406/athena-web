<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.ziygzlx}">

<!-- 
	资源跟踪类型对应表
	 @author qizhongtao
	 @date 2012-4-17
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 90px; } </style>
<script type="text/javascript">
	function jslxmcInit(){
		var jslxmcElement = $('#record_leix');
		if(!jslxmcElement.hasClass('loaded')){
			$('#record_jslxmc').html('<select id="leix">'+parseOptionsOfLeix()+'</select><input id="leixmc" size="20" />');
			$('#record_jslxmc').addClass('loaded').fieldCustom({
				property:'jslxmc',
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
	function parseOptionsOfLeix(){//P|S|J|T
		var htmls = [];
		var s1 = '<option value="P" selected>P</option>';
		htmls.push(s1);
		var s2 = '<option value="S">S</option>';
		htmls.push(s2);
		var s3 = '<option value="J">J</option>';
		htmls.push(s3);
		var s4 = '<option value="T">T</option>';
		htmls.push(s4);
		return htmls.join('');
	}
</script>
</head>
	<t:page i18n="i18n.ckx.xuqjs.i18n_ziygzlx">
		<t:grid id="grid_ziygzlx" caption="${i18n.ziygzlx}" idKeys="jislxbh,xuqly,zhizlx" load="false" dataFormId="form_ziygzlx" showNum="true" back="NOT"
			src="/xuqjs/queryZiygzlx.ajax"  removeSrc="/xuqjs/removeZiygzlx.ajax" scrollHeight="335" pageSize="15">
			<t:fieldLayout id="fl_ziygzlx" prefix="ziygzlx" columns="3">
				<t:fieldText property="jislxbh" caption="${i18n.jislxbh}" maxLength="10" dataType="text" width="150"/>
				<t:fieldSelect property="xuqly" caption="${i18n.xuqly}" convert="queryXuqly" width="150"/>
				<t:fieldSelect property="dinghlx" caption="${i18n.dinghlx}" convert="queryDinghlx" width="150"/>
			</t:fieldLayout>
			<t:gridCol property="jislxbh" caption="${i18n.jislxbh}" width="90"/>
			<t:gridCol property="jslxmc" caption="${i18n.jslxmc}" width="90"/>
			<t:gridCol property="xuqly" caption="${i18n.xuqly}" convert="queryXuqly" width="110"/>
			<t:gridCol property="dinghlx" caption="${i18n.dinghlx}" convert="queryDinghlx"/>
			<t:gridCol property="gonghms" caption="${i18n.gonghms}" convert="queryGonghms" width="210"/>
			<t:gridCol property="jisff" caption="${i18n.jisff}" convert="queryJisff" width="160"/>
			<t:gridCol property="" caption="" width="5"/>
		</t:grid>
		
		<t:form dialog="true" id="form_ziygzlx" caption="${i18n.ziygzlx}"  idKeys="jislxbh,xuqly,dinghlx" action="/xuqjs/saveZiygzlx.ajax" width="760" reset="NOT">
			<t:fieldLayout prefix="record" columns="2">
				<t:fieldText property="jislxbh" caption="${i18n.jislxbh}" dataType="text" maxLength="10" notNull="true"/>
				<t:fieldCustom property="jslxmc" caption="${i18n.jslxmc}" />
				<t:fieldSelect property="dinghlx" caption="${i18n.dinghlx}" convert="queryDinghlx" notNull="true" />
				<t:fieldSelect property="xuqly" caption="${i18n.xuqly}" convert="queryXuqly" notNull="true" />
				<t:fieldCheckboxGroup property="gonghms" caption="${i18n.gonghms}" width="400" convert="queryGonghms" column="2" />
				<t:fieldSelect property="jisff" caption="${i18n.jisff}" convert="queryJisff" notNull="true" />
			</t:fieldLayout>
		</t:form>
	</t:page>
	
	

	<script type="text/javascript">
	
		//空格查询
		function grid_ziygzlx_beforeSubmit() {
			$("#ziygzlx_jislxbh").fieldValue(trim($("#ziygzlx_jislxbh").fieldValue()));
		}
		
		//form提交前验证
		function form_ziygzlx_beforeSubmit() {
			var leixmc = trim($("#leixmc").val());
			if("" == leixmc || undefined == leixmc || null == leixmc){
				alert("${i18n.jslxmc_notnull}");
				return false;
			}
			
			var jslxmc = trim($("#record_jslxmc").fieldValue());
			if (!checkCH(48, jslxmc)) {
				alert("${i18n.jslxmccd}");
				return false;
			}
			
			return true;
		}
		
		//页面初始化
		function initPage(){
			
			//页面初始化
			jslxmcInit();//计算类型名称
			
			//计算类型名称长度最大50
			$("#record_jslxmc input").blur(function() {
				var jslxmc = trim($("#record_jslxmc").fieldValue());
				if (!checkCH(50, jslxmc)) {
					alert("${i18n.jslxmccd}");
					return false;
				}
				return true;
			});	
		}
		
		function func_button_edit(){
			
			$("#form_ziygzlx").form("clear");
			
			$('#form_ziygzlx').removeClass('operant-add');//增加的operant为1，修改的operant为2
			
			var record = $("#grid_ziygzlx").grid("getSelectedRecords")[0];//选中的行的数据
			
			var jslxmc = record.jslxmc;
			$("#leix").val(jslxmc.substring(0,1));
			$("#leixmc").val(jslxmc.substring(1));
			
			var gm = record.gonghms;
			record.gonghms = gm.split(",");
			
			$('#form_ziygzlx').form('fillRecord', $.extend({}, record));
			
			$("#form_ziygzlx").form("open","${i18n.update}");
		}
	</script>
</t:html>











