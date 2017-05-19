<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.yhlnbtitle}">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<script type="text/javascript">
	
</script>
</head>
<t:page i18n="i18n.xqjs.kanbyhl.kanbjs">
	<t:grid id="gridYhl" caption="${i18n.search_condition}" showNum="true" showCheckbox="true" scrollHeight="218" src="/yhl/searchnYaohl.ajax" add="NOT" edit="NOT" remove="NOT" load="false"
		idKeys="editor,edit_time,yaohlh,usercenter,lingjbh">
		<t:fieldLayout id="yhl" prefix="layout" columns="4">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" notNull="true" width="100"></t:fieldSelect>
			<t:fieldText property="dingdh" maxLength="10" minLength="8" caption="${i18n.dingdh}" width="100"></t:fieldText>
			<t:fieldText property="yaohlh" caption="${i18n.yhlh}" maxLength="12" width="100"></t:fieldText>
			<t:fieldText property="lingjbh" caption="${i18n.lingjbh}" width="100" maxLength="10"></t:fieldText>
			<t:fieldText property="cangkbh" caption="${i18n.ck}" width="100" maxLength="3"></t:fieldText>
			<t:fieldText property="mudd" caption="${i18n.mudd}" width="100" maxLength="13"></t:fieldText>
			<t:fieldSelect property="yaohllx" convert="queryGHMS2" caption="${i18n.ghms}" width="100" defaultValue="RD" notNull="true"></t:fieldSelect>
			<t:fieldText property="keh" caption="${i18n.keh}" width="100" maxLength="5"></t:fieldText>
			<t:fieldSelect property="sj" caption="${i18n.sj}" convert="Yhlsj" width="100"></t:fieldSelect>
			<t:fieldCalendar property="qssj" format="yyyy-MM-dd HH:mm:ss" width="142"></t:fieldCalendar>
			<t:fieldCalendar property="jssj" format="yyyy-MM-dd HH:mm:ss" caption="${i18n.zi}" width="142" column="2"></t:fieldCalendar>
			<t:fieldHidden property="zt"></t:fieldHidden>
			<t:fieldCheckboxGroup property="yaohlzt" caption="${i18n.zt}" convert="Yhlzt" width="360" column="3"></t:fieldCheckboxGroup>
		</t:fieldLayout>
		<t:gridCol property="yaohlh" caption="${i18n.yhlh}"></t:gridCol>
		<t:gridCol width="80" property="dingdh" caption="${i18n.dingdh}"></t:gridCol>
		<t:gridCol property="usercenter" caption="${i18n.usercenter}"></t:gridCol>
		<t:gridCol property="lingjbh" caption="${i18n.lingjbh}"></t:gridCol>
		<t:gridCol property="yaohllx" caption="${i18n.ghms}"></t:gridCol>
		<t:gridCol width="80" property="cangkbh" caption="${i18n.ck}"></t:gridCol>
		<t:gridCol width="80" property="zickbh" caption="${i18n.zick}"></t:gridCol>
		<t:gridCol width="80" property="mudd" caption="${i18n.mudd}"></t:gridCol>
		<t:gridCol property="keh" caption="${i18n.keh}"></t:gridCol>
		<t:gridCol property="baozxh" caption="${i18n.baozlx}"></t:gridCol>
		<t:gridCol property="yaohsl" caption="${i18n.ljsl}"></t:gridCol>
		<t:gridCol property="faysj" caption="${i18n.yjfcsj}" ></t:gridCol>
		<t:gridCol property="zuiwsj" caption="${i18n.yjjfsj}"></t:gridCol>
		<t:gridCol property="jiaofj" caption="${i18n.sjjfsj}"></t:gridCol>
		<t:gridCol property="yaohlzt" caption="${i18n.zt}" convert="queryYhlzt"></t:gridCol>
		<t:gridCol width="80" property="chansyy" caption="产生原因" convert="chansyy"></t:gridCol>
		<t:gridCol width="80" property="zhongzyy" caption="终止原因" convert="zhongzyy"></t:gridCol>
<%-- 		<t:gridCol width="80" property="chansyy" caption="产生原因"></t:gridCol> --%>
<%-- 		<t:gridCol width="80" property="zhongzyy" caption="终止原因"></t:gridCol> --%>
		<t:gridCol width="80" property="yuanyhlh" caption="原要货令号"></t:gridCol>
		<t:gridCol property="beiz" caption="${i18n.bz}"></t:gridCol>
	</t:grid>
	<t:buttons id="btn">
		<t:button caption="${i18n.zhongz}" name="zhongz"></t:button>
	</t:buttons>
	<div id="ck_dataItems_selectedValues" style="display: none;">
		        <div class="youi-button active-3" id="button_expxls">
					<div class="right">
					<div class="center">
					  <a class="expxls" href="#">${i18n.exldaoc}</a>
			       </div>
			       </div>
			    </div>
	    </div>
</t:page>
<script type="text/javascript">

$(function(){
	var htmls =[];
	htmls.push($('#ck_dataItems_selectedValues').html());
	$('div.grid-formButtons table tr').append('<td>'+htmls.join('')+'</td>');
	 $('#ck_dataItems_selectedValues').empty();
	$('#button_expxls').click(func_grid_expxls);
});


function func_grid_expxls(event) { 
	var records = $('#gridYhl').grid('getSelectedRecords');
	var usercenter="";
	var jihyz="";
	var dingdh = "";
	var yaohlh = "";
	var cangkbh="";
	var mudd="";
	var lingjbh="";
	var gongysdm = "";
	var keh = "";
	var mudd = "";
	var sj = "";
	var qssj = "";
	var jislx = "";
	var jssj = "";
	var jiaofzt = "";
	var zt = "";
	var yaohllx = "";
	var yaohlzt="";
	var chengysdm="";
	if(records.length!=0){
		for(var i=0;i<records.length;i++){
			if(i==records.length-1){
				yaohlh +=""+records[i].yaohlh+"";
			   break;
			}
			yaohlh +=""+records[i].yaohlh+",";
		}
	}else{
	 yaohlh = $('#layout_yaohlh').fieldValue();
	}
	
	 usercenter = $('#layout_usercenter').fieldValue();
	 jihyz = $('#layout_jihyz').fieldValue();
	 dingdh = $('#layout_dingdh').fieldValue();
	 lingjbh = $('#layout_lingjbh').fieldValue();
	 cangkbh =$('#layout_cangkbh').fieldValue();
	 gongysdm = $('#layout_gongysdm').fieldValue();
	 keh = $('#layout_keh').fieldValue();
	 mudd = $('#layout_mudd').fieldValue();
	 sj = $('#layout_sj').fieldValue();
	 qssj = $('#layout_qssj').fieldValue();
	 jislx = $('#layout_jislx').fieldValue();
	 jssj = $('#layout_jssj').fieldValue();
	 jiaofzt = $('#layout_jiaofzt').fieldValue();
	 zt = $('#layout_zt').fieldValue();
	 yaohllx = $('#layout_yaohllx').fieldValue();
	 yaohlzt = $('#layout_yaohlzt').fieldValue();
	 chengysdm = $('#layout_chengysdm').fieldValue();
	 
	$.sdcui.pageUtils.goPage({
		url : '/yhl/nyaoHlDownLoadFile.do?usercenter=' + usercenter
				+ '&jihyz=' + jihyz + '&dingdh=' + dingdh + '&yaohlh='
				+ yaohlh + '&lingjbh=' + lingjbh +'&gongysdm='+gongysdm+'&keh='+keh+'&mudd='+mudd+'&sj='+sj+'&qssj='
				+qssj+'&jislx='+jislx+'&jssj='+jssj+'&jiaofzt='+jiaofzt+'&yaohllx='+yaohllx+'&zt='+yaohlzt+'&chengysdm='+chengysdm+'&cangkbh='+cangkbh,//url
		mode : 'form',
		beforeSubmit : function() {
			//
			return true;
		}
	});
	event.stopPropagation();//阻止事件冒泡
	return false;

   
}
	$.sdcui.serverConfig.convertArray['chansyy'] = {'01':'因原要货令拒收'};
	$.sdcui.serverConfig.convertArray['zhongzyy'] = {'01':'拒收出门'};
	$.sdcui.serverConfig.convertArray['Yhlzt'] = {
		'00' : '${i18n.yjf}',
		'01' : '${i18n.bd}',
		'02' : '${i18n.zait}',
		'03' : '${i18n.ddjf}',
		'04' : '${i18n.ycjf}',
		'05' : '${i18n.yzz}'
	};
	$.sdcui.serverConfig.convertArray['Yhlsj'] = {
		'0' : '${i18n.yjfc}',
		'2' : '${i18n.yjjf}',
		'3' : '${i18n.sjjf}'
	};
	$.sdcui.serverConfig.convertArray['Yhlddzt'] = {
		'0' : '${i18n.yw}',
		'1' : '${i18n.tq}',
		'2' : '${i18n.zc}'
	};
	function gridYhl_beforeSubmit() {
		var zt = $('#layout_yaohlzt').fieldValue();
		if (zt[zt.length - 1] == '05') {
			zt.push('06');
		}
		//如果要货令状态不为空则将值付给zt
		$('#layout_zt').fieldValue(zt);

	}
	//终止操作	
	function func_button_zhongz() {
		var yaohl = $('#gridYhl').grid('getSelectedRecords');//获得选中行参数
		var param = [];
		if (yaohl.length == 0) {
			alert("${i18n.qxzytsj}");
			return false;
		}
		for ( var i = 0; i < yaohl.length; i++) {
			param.push('edit[' + i + '].usercenter=' + yaohl[i].usercenter);
			param.push('edit[' + i + '].lingjbh=' + yaohl[i].lingjbh);
			/* param.push('edit['+i+'].gongysdm='+yaohl[i].gongysdm);
			param.push('edit['+i+'].yaohsl='+yaohl[i].yaohsl);
			param.push('edit['+i+'].editor='+yaohl[i].editor);
			param.push('edit['+i+'].edit_time='+yaohl[i].edit_time);
			param.push('edit['+i+'].yaohlzt='+yaohl[i].yaohlzt); */
			param.push('edit[' + i + '].yaohlh=' + yaohl[i].yaohlh);
		}
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/yhl/ZZYaohlN.ajax",
			data : param.join('&'),
			success : function(result) {
				alert(result.result);
				$("#gridYhl").grid('reload');
			}
		});

	}

	/*function layout_yaohllx_change() {
		var yaohllx = $("#layout_yaohllx").fieldValue();
		var xsValue = "";
		if (yaohllx == 'RM' || yaohllx == 'M1') {
			xsValue = "${i18n.ck}：";
		} else {
			xsValue = "${i18n.fpxh}：";
		}
		var td = $("#yhl.youi-fieldLayout table td.field-label")[7];
		var lable = $(td).children()[0];
		$(lable).text(xsValue);
	}

	$(function() {
		$("#layout_keh").click(function() {
			initKh();
		});

	})

	function initKh() {
		var yaohllx = $("#layout_yaohllx").fieldValue();
		var param = [];
		param.push("gonghms=" + yaohllx);
		var element = $("div#field-pop-layout_keh");
		element.removeClass("loaded");
		$("#layout_keh").find('input.value').val("");
		$("#layout_keh").find('input.textInput').val("");
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
#yhl td.contral.label-col.col-6 {
	width: 60px;
}

#yhl td.contral.label-col.col-0 {
	width: 70px;
}

#yhl td.contral.label-col.col-2 {
	width: 60px;
}

#yhl td.contral.label-col.col-4 {
	width: 60px;
}
</style>
</t:html>
