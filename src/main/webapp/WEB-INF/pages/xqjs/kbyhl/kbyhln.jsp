<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.kbxhgl}">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>

<script type="text/javascript">
	
</script>
</head>
<t:page i18n="i18n.xqjs.kanbyhl.kanbjs">
	<t:grid id="kbxh" caption="${i18n.search_condition}" showNum="true" showCheckbox="true" editAlias="kb" src="/kanbyhl/searchKanbxhgm.ajax" add="NOT" edit="NOT" remove="NOT" load="false"
		idKeys="weihr,weihsj" scrollHeight="236">
		<t:fieldLayout id="kbxhgm" prefix="layout" columns="4">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" notNull="true" width="90"></t:fieldSelect>
			<t:fieldSelect property="chanx" caption="${i18n.cx}" src="/kanbyhl/selectChanx.ajax" code="shengcxbh" show="shengcxbh" parents="usercenter" parentsAlias="usercenter" width="90"></t:fieldSelect>
			<t:fieldText property="xunhbm" maxLength="8" minLength="8" caption="${i18n.xhbm}"  width="90"></t:fieldText>
			<t:fieldText property="lingjbh" maxLength="10" caption="${i18n.lingjbh}"  width="90"></t:fieldText>
			<t:fieldSelect property="gonghms" caption="${i18n.ghms}" convert="queryKBNBMS" width="90" ></t:fieldSelect>
			<t:fieldText property="kehd" caption="${i18n.ckfpxh}" width="90"></t:fieldText>
			<t:fieldSelect property="shengxzt" convert="sxzt" caption="${i18n.sxzt}" width="90"></t:fieldSelect>
			<t:fieldSelect property="dongjjdzt" convert="djzt" caption="${i18n.djzt}" width="90"></t:fieldSelect>
			<t:fieldSelect property="gmbh" caption="${i18n.gmbh}" convert="gmbh" width="90"></t:fieldSelect>
			<t:fieldText property="bh" dataType="integer" maxLength="3" width="90" caption="${i18n.cgbfb}"></t:fieldText>
			<t:fieldSelect property="shifzdfs" caption="${i18n.zdfslj}" convert="sffs" width="90" >
			</t:fieldSelect>
			<t:fieldSelect property="jianglms" caption="${i18n.jianglms}" convert="sffs" width="90" >
			</t:fieldSelect>
			<t:fieldHidden property="nwb" defaultValue="n"></t:fieldHidden>
		</t:fieldLayout>
		<t:gridCol property="xunhbm" caption="${i18n.xhbm}"></t:gridCol>
		<t:gridCol width="80" property="lingjbh" caption="${i18n.lingjbh}"></t:gridCol>
		<t:gridCol width="80" property="usercenter" caption="${i18n.usercenter}"></t:gridCol>
		<t:gridCol width="80" property="jissj" caption="${i18n.jsrq}"></t:gridCol>
		<t:gridCol width="80" property="kehd" caption="${i18n.kh}"></t:gridCol>
		<t:gridCol width="80" property="chanx" caption="${i18n.cx}"></t:gridCol>
		<t:gridCol width="80" property="gonghms" caption="${i18n.ghms}"></t:gridCol>
		<t:gridCol width="80" property="ucrl" caption="${i18n.bzrl}"></t:gridCol>
		<t:gridCol width="80" property="shifzdfs" caption="${i18n.zdfs}" convert="sffs"></t:gridCol>
		<t:gridCol width="80" property="cmj" caption="cmj"></t:gridCol>
		<t:gridCol width="80" property="jisxhgm" caption="${i18n.jsxhgm}"></t:gridCol>
		<t:gridCol width="80" property="dangqxhgm" caption="${i18n.xsxhgm}"></t:gridCol>
		<t:gridCol width="80" property="jiscy" caption="${i18n.jscy}"></t:gridCol>
		<t:gridCol width="80" property="bianhfd" caption="${i18n.bhfd}"></t:gridCol>
		<t:gridCol width="80" editor="fieldText" property="tiaozxhgm" caption="${i18n.tzxhgm}"></t:gridCol>
		<t:gridCol width="80" type="text" property="shengxzt" caption="${i18n.sxzt}" convert="sxzt"></t:gridCol>
		<t:gridCol width="80" property="dongjjdzt" caption="${i18n.zt}" convert="djzt"></t:gridCol>
		<t:gridCol width="80" property="zuidyhl" caption="${i18n.zdyhl}"></t:gridCol>
	
	</t:grid>

	<t:buttons id="btn">
		<t:button caption="${i18n.sx}" name="shengx"></t:button>
		<t:button caption="${i18n.shix}" name="unEffect"></t:button>
		<t:button caption="${i18n.dj}" name="dongj"></t:button>
		<t:button caption="${i18n.jd}" name="jied"></t:button>
		<t:button caption="导出XLS" name="expxls" ></t:button>
		<t:button caption="调整循环规模模板下载" name="xhgmmb" />
	</t:buttons>
	
	<form id="form_importxhgm_xls" target="_self" enctype="multipart/form-data" action="/athena/kanbyhl/importAth_xhgmdr.do?nwb=n" method="post" name="form_importxhgm_xls">
	<table>
		<tbody>
			<tr>
				<td>
					<input id="fileNamexhgm_xls" type="file" size="50" name="fileNamexhgm_xls">
				</td>
				<td>
					<div id="button_submitxhgm_upload" class="youi-button active-0">
						<div class="right">
							<div class="center">
								<a class="submit" onclick="form_subimtxhgm()" href="#">调整循环规模模板导入</a>
							</div>
						</div>
					</div>
				</td>
		   </tr>
		</tbody>
	</table>
	<script type="text/javascript">
	function form_subimtxhgm(){ 
		var formEle = document.getElementById("form_importxhgm_xls"); 
		if($("#fileNamexhgm_xls").val()==null || ""==$("#fileNamexhgm_xls").val())
		{ 
			alert("上传文件不能为空."); 
			return false; 
		}else{ 
			window.down_showLoading();
			formEle.submit(); 
		} 
	} 
	$(document).ready(function(){
		window.down_hideLoading();
		var a = "null"; 
		a = "${requestScope.uploudmessage}"; 
		if(a!='null'&&a!='') { 
			a = a.replace(/@/g,'\n');alert(a);
		}
	});
	</script>
	<input id="import_hidd_comfig" type="hidden" value="[{'sheet':'tiaozxhgm','datasourceId':'1','table':'{dbSchemal3}xqjs_kanbxhgm','keys':'USERCENTER,LINGJBH,GONGHMS,KEHD','dateColumns':'null','dateFormats':'yyyy-MM-dd','clazz':'null'}]" name="import_hidd_comfig">
	<div><font color="red">导入结果不能大于5000条,否则为空</font></div>
	</form>
	
	
</t:page>
<script type="text/javascript">

	$.sdcui.serverConfig.convertArray['sffs'] = {
		'1' : '${i18n.s}',
		'0' : '${i18n.f}'
	};
	$.sdcui.serverConfig.convertArray['sxzt'] = {
		'1' : '${i18n.ysx}',
		'0' : '${i18n.wsx}'
	};
	$.sdcui.serverConfig.convertArray['djzt'] = {
		'0' : '${i18n.dj}',
		'1' : '${i18n.zc}'
	};
	$.sdcui.serverConfig.convertArray['gmbh'] = {
		'01' : '${i18n.jseqxs}',
		'02' : '${i18n.jsxyxs}',
		'03' : '${i18n.jsdyxs}'
	};
	
	
// 	$(function(){
// 		var htmls = [
// 			'<div class="youi-button active-3" id="button_expxls">'
// 			,'<div class="right">'
// 			,'<div class="center">'
// 			,'<a class="expxls" href="#">${i18n.exldaoc}</a>'
// 			,'</div></div></div>'
// 		] 
// 		$('div.grid-formButtons table tr').append('<td>'+htmls.join('')+'</td>');
// 		$('#button_expxls').click(func_grid_expxls);
// 	});
	
	//导出看板循环规模模板
	function func_button_xhgmmb(){
		$.sdcui.pageUtils.goPage({
			url : '../kanbyhl/downloadKanbxhgmMob.do',
			mode : 'form',
			beforeSubmit : function(){
				return true;
			}
		});
	}
	
	//导出 	
	function func_button_expxls() {
		
		var kbxh = $('#kbxh').grid('getSelectedRecords');//获得选中行参数
		var param = [];
		for ( var i = 0; i < kbxh.length; i++) {
			param.push(kbxh[i].xunhbm);
		}
		
		var usercenter = trim($('#layout_usercenter').fieldValue());
		var chanx = trim($('#layout_chanx').fieldValue());
		var xunhbm = trim($('#layout_xunhbm').fieldValue());
		var lingjbh = trim($('#layout_lingjbh').fieldValue());
		var gonghms = trim($('#layout_gonghms').fieldValue());
		var kehd = trim($('#layout_kehd').fieldValue());
		var shengxzt = trim($('#layout_shengxzt').fieldValue());
		var dongjjdzt = trim($('#layout_dongjjdzt').fieldValue());
		var gmbh = trim($('#layout_gmbh').fieldValue());
		var bh= trim($('#layout_bh').fieldValue());
		var shifzdfs= trim($('#layout_shifzdfs').fieldValue());
		var jianglms= trim($('#layout_jianglms').fieldValue());
		var nwb= trim($('#layout_nwb').fieldValue());
		
		var record = {'xunhbms':param,'usercenter':﻿usercenter,'chanx':chanx,'xunhbm':xunhbm,'lingjbh':lingjbh,'gonghms':gonghms,'kehd':kehd,'shengxzt':shengxzt,'dongjjdzt':dongjjdzt,'gmbh':gmbh,'bh':bh,'shifzdfs':shifzdfs,'jianglms':jianglms,'nwb':nwb};
		$.sdcui.pageUtils.goPage({
			url : '../kanbyhl/expKanbxhgm.do',
			record : record,
			mode : 'form',
			beforeSubmit : function(){
				return true;
			}
	   });
	}
	
	//冻结操作	
	function func_button_dongj() {
		var kbxh = $('#kbxh').grid('getSelectedRecords');//获得选中行参数
		if (kbxh.length == 0) {
			alert("${i18n.qxzytsj}");
			return false;
		}
		var param = [];
		for ( var i = 0; i < kbxh.length; i++) {
			param.push('kb[' + i + '].xunhbm=' + kbxh[i].xunhbm);
			param.push('kb[' + i + '].weihr=' + kbxh[i].weihr);
			param.push('kb[' + i + '].weihsj=' + kbxh[i].weihsj);
			param.push('kb[' + i + '].lingjbh=' + kbxh[i].lingjbh);
			param.push('kb[' + i + '].usercenter=' + kbxh[i].usercenter);
			param.push('kb[' + i + '].dongjjdzt=' + kbxh[i].dongjjdzt);
			param.push('kb[' + i + '].shengxzt=1');
		}
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/kanbyhl/dongJKanbxhgm.ajax",
			data : param.join('&'),
			success : function(result) {
				if (result.flag != null) {
					alert(result.flag);
					return false;
				} else {
					alert(result.result);
					$("#kbxh").grid('reload');
				}
			}
		});

	}
	
	/**
	 *失效
	 */
	function func_button_unEffect() {
		var kbxh = $('#kbxh').grid('getSelectedRecords');//获得选中行参数
		if (kbxh.length == 0) {
			alert("${i18n.qxzytsj}");
			return false;
		}
		if(confirm("${i18n.unEffectTrue}")){
			var param = [];
			for ( var i = 0; i < kbxh.length; i++) {
				param.push('kb[' + i + '].xunhbm=' + kbxh[i].xunhbm);
			}
			$.sdcui.editorFactory.closeEditor;
			$.sdcui.ajaxUtil.ajax({
				url : "${ctx}/kanbyhl/unEffectKanbxhgm.ajax",
				data : param.join('&'),
				success : function(result) {
					if (result.flag != null) {
						alert(result.flag);
						return false;
					} else {
						alert(result.result);
						$("#kbxh").grid('reload');
					}
				}
			});
        }
	}
	//解冻操作
	function func_button_jied() {
		var kbxh = $('#kbxh').grid('getSelectedRecords');//获得选中行参数
		if (kbxh.length == 0) {
			alert("${i18n.qxzytsj}");
			return false;
		}
		var param = [];
		for ( var i = 0; i < kbxh.length; i++) {
			param.push('kb[' + i + '].xunhbm=' + kbxh[i].xunhbm);
			param.push('kb[' + i + '].gonghms=' + kbxh[i].gonghms);
			//param.push('kb[' + i + '].weihr=' + kbxh[i].weihr);
			//param.push('kb[' + i + '].weihsj=' + kbxh[i].weihsj);
			//param.push('kb[' + i + '].lingjbh=' + kbxh[i].lingjbh);
			//param.push('kb[' + i + '].usercenter=' + kbxh[i].usercenter);
		    param.push('kb[' + i + '].zuidyhl=-1' );
			param.push('kb[' + i + '].zhuangt=' + kbxh[i].dongjjdzt);
			param.push('kb[' + i + '].shengxzt=1');
			param.push('kb[' + i + '].dongjjdzt=1');
		}
		param.push("usercenter="+kbxh[0].usercenter);
		
		
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/kanbyhl/jieDKanbxhgm.ajax",
			data : param.join('&'),
			success : function(result) {
				if (result.flag != null) {
					alert(result.flag);
					return false;
				} else {
					alert(result.result);
					$("#kbxh").grid('reload');
				}
			}
		});

	}
	/**
	 *点击生效事件
	 */
	function func_button_shengx() {
		var kbxh = $('#kbxh').grid('getSelectedRecords');//获得选中行参数
		if (kbxh.length == 0) {
			alert("${i18n.qxzytsj}");
			return false;
		}
		var param = [];
		for ( var i = 0; i < kbxh.length; i++) {
			param.push('kb[' + i + '].xunhbm=' + kbxh[i].xunhbm);
			var a = kbxh[i].tiaozxhgm;
			if (typeof (a) == 'undefined') {
				param.push('kb[' + i + '].xiafxhgm=' + kbxh[i].jisxhgm);
				// param.push('kb['+i+'].dangqxhgm='+kbxh[i].jisxhgm);
			} else {
				//行编辑验证,调整循环规模
				var n = /^[1-9][0-9]{0,2}$/;
				if (!n.test(a) || a.length > 3) {
					alert("${i18n.qqrtzdxhgm}");
					return false;
				}
				param.push('kb[' + i + '].xiafxhgm=' + kbxh[i].tiaozxhgm);
				param.push('kb[' + i + '].leix=2');
				//param.push('kb['+i+'].dangqxhgm='+kbxh[i].tiaozxhgm)
			}
			var zuidyhl = typeof (kbxh[i].zuidyhl) == 'undefined' ? ''
					: kbxh[i].zuidyhl;
			//行编辑验证,最大要货量
			var r = /^[0-9]{1,10}(?:\.[0-9]{1,3})?$|^0\.[0-9]{1,3}$/;
			if (zuidyhl != '' && !r.test(zuidyhl)) {
				alert("${i18n.qqrzdyhl}");
				return false;
			}
			param.push('kb[' + i + '].weihr=' + kbxh[i].weihr);
			param.push('kb[' + i + '].weihsj=' + kbxh[i].weihsj);
			if (zuidyhl != '')
				param.push('kb[' + i + '].zuidyhl=' + kbxh[i].zuidyhl);
			param.push('kb[' + i + '].lingjbh=' + kbxh[i].lingjbh);
			param.push('kb[' + i + '].usercenter=' + kbxh[i].usercenter);
			var djjdzt = typeof (kbxh[i].dongjjdzt) == 'undefined' ? ""
					: kbxh[i].dongjjdzt;
			param.push('kb[' + i + '].dongjjdzt=' + djjdzt);

		}
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/kanbyhl/shengXKanbxhgm.ajax",
			data : param.join('&'),
			success : function(result) {
				if (result.flag != null) {
					alert(result.flag);
					return false;
				} else {
					alert(result.result);
					$("#kbxh").grid('reload');
				}
			}
		});

	}

	/*function layout_gonghms_change() {
		var ghms = $("#layout_gonghms").fieldValue();
		var xsValue = "";
		if (ghms == 'RM') {
			xsValue = "${i18n.ck}：";
		} else {
			xsValue = "${i18n.fpxh}：";
		}
		var td = $("#kbxhgm.youi-fieldLayout table td.field-label")[5];
		var lable = $(td).children()[0];
		$(lable).text(xsValue);
		var element = $("div#field-pop-layout_kehd");
		element.removeClass("loaded");
		$("#layout_kehd").find('input.value').val("");
		$("#layout_kehd").find('input.textInput').val("");
		element.empty();
	}

	$(function() {
		$("#layout_kehd").click(function() {
			initKh();
		});

	})

	function initKh() {
		var ghms = $("#layout_gonghms").fieldValue();
		var param = [];
		param.push("gonghms=" + ghms);
		var element = $("div#field-pop-layout_kehd");
		element.removeClass("loaded");
		$("#layout_kehd").find('input.value').val("");
		$("#layout_kehd").find('input.textInput').val("");
		element.empty();
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/kanbyhl/getWulzKehd.ajax",
			data : param.join('&'),
			success : function(result) {
				var arry = result.result;
				element.append('<div class="option-item"></div>');
				for ( var i = 0; i < arry.length; i++) {
					var keh = arry[i].KEH;
					var html = '<div class="option-item" value="'+keh+'">'
							+ keh + '</div>';
					element.append(html);
				}
				element.addClass("loaded");
			}

		});

	}*/
</script>
<style type="text/css">
#kbxhgm td.contral.label-col.col-4 {
	width: 85px;
}

#kbxhgm td.contral.label-col.col-0 {
	width: 60px;
}

#kbxhgm td.contral.label-col.col-2 {
	width: 89px;
}

#kbxhgm td.contral.label-col.col-6 {
	width: 60px;
}
#btn div.youi-button.active-0 {
	padding-right: 20px;
}
</style>
</t:html>
