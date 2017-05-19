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
		idKeys="weihr,weihsj" scrollHeight="230">
		<t:fieldLayout id="kbxhgm" prefix="layout" columns="4">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" notNull="true" width="90"></t:fieldSelect>
			<t:fieldSelect property="jihydm" caption="${i18n.jihyz}" width="90" convert="getJihz"></t:fieldSelect>
			<t:fieldSelect property="chanx" caption="${i18n.cx}" src="/kanbyhl/selectChanx.ajax" code="shengcxbh" show="shengcxbh" parents="usercenter" parentsAlias="usercenter" width="90"></t:fieldSelect>
			<t:fieldText property="xunhbm" maxLength="8" minLength="8" caption="${i18n.xhbm}"  width="90"></t:fieldText>
			<t:fieldText property="lingjbh" maxLength="10" caption="${i18n.lingjbh}"  width="90"></t:fieldText>
			<t:fieldText property="kehd" maxLength="9" caption="${i18n.kh}"  width="90"></t:fieldText>
			<t:fieldSelect property="gonghms" caption="${i18n.ghms}" convert="queryKBWBMS" width="90" ></t:fieldSelect>
			<t:fieldSelect property="shengxzt" convert="sxzt" caption="${i18n.sxzt}" width="90"></t:fieldSelect>
			<t:fieldSelect property="gmbh" caption="${i18n.gmbh}" convert="gmbh" width="90"></t:fieldSelect>
			<t:fieldText property="bh" maxLength="3" width="90" caption="${i18n.cgbfb}"></t:fieldText>
			<t:fieldSelect property="dongjjdzt" convert="djzt" caption="${i18n.djzt}" width="90"></t:fieldSelect>
			<t:fieldSelect property="shifzdfs" caption="${i18n.zdfslj}" convert="sffs" width="90">
			</t:fieldSelect>
			<t:fieldSelect property="jianglms" caption="${i18n.jianglms}" convert="sffs" width="90" >
			</t:fieldSelect>
			<t:fieldHidden property="nwb" defaultValue="w"></t:fieldHidden>
		</t:fieldLayout>
		<t:gridCol property="xunhbm" caption="${i18n.xhbm}"></t:gridCol>
		<t:gridCol property="lingjbh" caption="${i18n.lingjbh}"></t:gridCol>
		<t:gridCol property="usercenter" caption="${i18n.usercenter}"></t:gridCol>
		<t:gridCol property="jissj" caption="${i18n.jsrq}"></t:gridCol>
		<t:gridCol property="kehd" caption="${i18n.kh}"></t:gridCol>
		<t:gridCol property="chanx" caption="${i18n.cx}"></t:gridCol>
		<t:gridCol property="gonghms" caption="${i18n.ghms}"></t:gridCol>
		<t:gridCol property="umljsl" caption="${i18n.bzrl}"></t:gridCol>
		<t:gridCol property="shifzdfs" caption="${i18n.zdfs}" convert="sffs"></t:gridCol>
		<t:gridCol property="jihydm" caption="${i18n.glydm}"></t:gridCol>
		<t:gridCol property="cmj" caption="cmj"></t:gridCol>
		<t:gridCol property="jisxhgm" caption="${i18n.jsxhgm}"></t:gridCol>
		<t:gridCol property="dangqxhgm" caption="${i18n.xsxhgm}"></t:gridCol>
		<t:gridCol property="jiscy" caption="${i18n.jscy}"></t:gridCol>
		<t:gridCol property="bianhfd" caption="${i18n.bhfd}"></t:gridCol>
		<t:gridCol editor="fieldText" property="tiaozxhgm" caption="${i18n.tzxhgm}"></t:gridCol>
		<t:gridCol type="text" property="shengxzt" caption="${i18n.sxzt}" convert="sxzt"></t:gridCol>
		<t:gridCol property="dongjjdzt" caption="${i18n.zt}" convert="djzt"></t:gridCol>
		<t:gridCol editable="${!zbczxc }" editor="fieldText" property="zuidyhl"  caption="${i18n.zdyhl}" editorOptions="{'expression':'^[0-9]{1,10}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$','expressionMessage':'整数部分最大位10位，小数部分最大位3位'}"  ></t:gridCol>
		
	</t:grid>
	<t:buttons id="btn">
		<t:button caption="${i18n.sx}" name="shengx"></t:button>
		<t:button caption="${i18n.shix}" name="unEffect"></t:button>
		<t:button caption="${i18n.dj}" name="dongj"></t:button>
		<t:button caption="${i18n.jd}" name="jied"></t:button>
		<t:button caption="导出XLS" name="expxls" ></t:button>
		<c:if test="${!zbczxc }">
			<t:button caption="查看已交付" name="queryyjf" ></t:button>
			<t:button caption="下载模板" name="mobxz" active="0"/>
		</c:if>
		<t:button caption="调整循环规模模板下载" name="xhgmmbw" />
	</t:buttons>
	<c:if test="${!zbczxc }">
		<t:file action="/kanbyhl/importAth_zuidyhl.do" size="50">
			<t:fileparam sheet="zuidyhl" keys="USERCENTER,LINGJBH,XIAOHD,ZUIDYHL" table="{dbSchemal3}xqjs_kanbxhgm" datasourceId="1"/>
		</t:file>
		<div><font color="red">导入结果不能大于5000条,否则为空</font></div>
	</c:if>
	<form id="form_importxhgmw_xls" target="_self" enctype="multipart/form-data" action="/athena/kanbyhl/importAth_xhgmdr.do?nwb=w" method="post" name="form_importxhgmw_xls">
	<table>
		<tbody>
			<tr>
				<td>
					<input id="fileNamexhgmw_xls" type="file" size="50" name="fileNamexhgmw_xls">
				</td>
				<td>
					<div id="button_xhgmdrw" class="youi-button active-0">
						<div class="right">
							<div class="center">
								<a class="submit" onclick="form_subimtxhgmw()" href="#">调整循环规模模板导入</a>
							</div>
						</div>
					</div>
				</td>
		   </tr>
		</tbody>
	</table>
	<script type="text/javascript">
	function form_subimtxhgmw(){ 
		var formEle = document.getElementById("form_importxhgmw_xls"); 
		if($("#fileNamexhgmw_xls").val()==null || ""==$("#fileNamexhgmw_xls").val()){ 
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
		var b = true;
		a = "${requestScope.uploudmessage}";
		b = "${requestScope.checkZBCZXC}"; 
		if(a!='null' && a!=''&& b == 'true') { 
			a = a.replace(/@/g,'\n');
			alert(a);
		}
	});
	</script>
	<input id="import_hidd_comfig" type="hidden" value="[{'sheet':'tiaozxhgm','datasourceId':'1','table':'{dbSchemal3}xqjs_kanbxhgm','keys':'USERCENTER,LINGJBH,GONGHMS,KEHD','dateColumns':'null','dateFormats':'yyyy-MM-dd','clazz':'null'}]" name="import_hidd_comfig">
	<div><font color="red">导入结果不能大于5000条,否则为空</font></div>
	</form>
</t:page>
<script type="text/javascript">
    $("#button_submit_upload").find("a").html("导入最大要货量");  
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
	function func_button_xhgmmbw(){
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
		var jihydm = trim($('#layout_jihydm').fieldValue());
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
		
		var record = {'xunhbms':param,'usercenter':﻿usercenter,'jihydm':jihydm,'chanx':chanx,'xunhbm':xunhbm,'lingjbh':lingjbh,'gonghms':gonghms,'kehd':kehd,'shengxzt':shengxzt,'dongjjdzt':dongjjdzt,'gmbh':gmbh,'bh':bh,'shifzdfs':shifzdfs,'jianglms':jianglms,'nwb':nwb};
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
	 *失效
	 */
	function func_button_unEffect() {
		var kbxh = $('#kbxh').grid('getSelectedRecords');//获得选中行参数
		if (kbxh.length == 0) {
			alert("${i18n.qxzytsj}");
			return false;
		}
		if(confirm("${i18n.unEffectTrueTis}")){
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
	/**
	 *点击生效事件
	 */
	function func_button_shengx() {
		//    var kbxh= $('#kbxh').grid('getBatchRecords');//获得选中行参数
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
				//param.push('kb['+i+'].dangqxhgm='+kbxh[i].jisxhgm);
			} else {
				//行编辑验证,调整循环规模
				var n = /^[1-9][0-9]{0,2}$/;
				if (!n.test(a) || a.length > 3) {
					alert("${i18n.qqrtzdxhgm}");
					return false;
				}else if(a == 1){
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
			if(trim(zuidyhl).length != 0 && zuidyhl ==0){
			   alert('最大要货量必须大于0或为空！');
			   return false;
			}
			param.push('kb[' + i + '].weihr=' + kbxh[i].weihr);
			param.push('kb[' + i + '].weihsj=' + kbxh[i].weihsj);
			if (zuidyhl != '')
				param.push('kb[' + i + '].zuidyhl=' + kbxh[i].zuidyhl);
			param.push('kb[' + i + '].lingjbh=' + kbxh[i].lingjbh);
			param.push('kb[' + i + '].usercenter=' + kbxh[i].usercenter);
			param.push('kb[' + i + '].dongjjdzt=' + kbxh[i].dongjjdzt);

		}
		$.sdcui.editorFactory.closeEditor;
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
	
	function func_button_queryyjf(){
		var kbxh = $('#kbxh').grid('getSelectedRecords');//获得选中行参数
		var param = "";
		if(kbxh.length == 1 )
		{
			param = "usercenter=" + kbxh[0].usercenter + "&xunhbm=" + kbxh[0].xunhbm;
		}
		else if(kbxh.length > 1 )
		{
		  alert("此功能只能选中一条数据或一条不选");
		    return false;
		}
		
		winOpen =  window.open('${ctx}/kanbyhl/initYjf.do?'+param+'&removeId=layout-north,layout-west,layout-south',
					'${i18n.drzdyhl}',
					'top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no, status=no'
					);
		
		
		winOpen.resizeTo(screen.availWidth,screen.availHeight);			
	}
		//导出模板
		function func_button_mobxz(){
			$.sdcui.pageUtils.goPage({
				url : '../kanbyhl/downloadZuidyhlMob.do',
				mode : 'form',
				beforeSubmit : function(){
					return true;
				}
		   });
		}	
</script>
<style type="text/css">
#kbxhgm td.contral.label-col.col-6 {
	width: 80px;
}

#kbxhgm td.contral.label-col.col-0 {
	width: 60px;
}

#kbxhgm td.contral.label-col.col-2 {
	width: 60px;
}

#kbxhgm td.contral.label-col.col-4 {
	width: 60px;
}
#btn div.youi-button.active-0 {
	padding-right: 20px;
}
</style>
</t:html>
