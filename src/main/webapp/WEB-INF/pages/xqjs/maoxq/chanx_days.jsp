<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.mxqcxbj}">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<script type="text/javascript">
	$(function() {
		removeHidden();
	})
</script>
</head>
<t:page i18n="i18n.xqjs.maoxq.maoxqmx">
   <t:panel id="ddddd" >
    <t:form    id="mxQuerytj" reset="NOT" submit="NOT" caption="${i18n.cxtj}">
             <t:fieldLayout id="layout" prefix="recordOne" columns="3">
				<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" width="150"></t:fieldSelect>
				<t:fieldSelect property="jihyz" caption="${i18n.jihyz}" width="150" convert="getJihz"></t:fieldSelect>
				<t:fieldText property="lingjbh" caption="${i18n.lingjbh}" width="150" maxLength="10"></t:fieldText>
				<t:fieldSelect property="zhizlx" caption="${i18n.zhizlx}" convert="queryDinghlx" width="150"></t:fieldSelect>
				<t:fieldSelect property="xsfs" caption="${i18n.xsfs}" convert="pattern" defaultValue="1" notNull="true" width="150"></t:fieldSelect>
				<t:fieldCalendar property="xuqksrq" format="yyyy-MM-dd" caption="开始时间" width="120" ></t:fieldCalendar>
			</t:fieldLayout>
			<span>${i18n.beiz}: ${i18n.xqbcis}：${xuqbc}</span>&nbsp;<span id="kaisrq">${i18n.rmxq}(J0-J8:${kaisrq})</span>
			<div class="youi-buttons" align="right">
				<table>
					<tbody>
						<tr>
						<td>
								<div class="youi-button active-0" id="button_expxls">
									<div class="right">
										<div class="center">
											<a href="#" onclick="expxls()">${i18n.dc} </a>
										</div>
									</div>
								</div></td>
							<td>
								<div class="youi-button active-0">
									<div class="right">
										<div class="center">
											<a href="#" onclick="query()"> ${i18n.query} </a>
										</div>
									</div>
								</div></td>
							<td>
								<div id="button_reset" class="youi-button active-0">
									<div class="right">
										<div class="center">
											<a href="#" onclick="cancle()"> ${i18n.cz} </a>
										</div>
									</div>
								</div></td>

						</tr>
					</tbody>
				</table>
			</div>
    
    </t:form>

	<t:form id="form_maoxqWeek" submit="NOT" reset="NOT">

		<t:grid id="grid_chanxDays" caption="${i18n.rmxq}" showCheckbox="true" src="/maoxq/queryMxP.ajax" idKeys="xuqbc,usercenter,lingjbh,editor,edit_time" showNum="true" remove="NOT" edit="NOT" add="NOT"
			usePager="true" save="NOT" load="true" submit="NOT" reset="NOT" scrollHeight="315" pageSize="20">
			<t:fieldLayout  prefix="record">
				<t:fieldHidden property="usercenter"></t:fieldHidden>
				<t:fieldHidden property="jihyz"></t:fieldHidden>
				<t:fieldHidden property="lingjbh"></t:fieldHidden>
				<t:fieldHidden property="xsfs"></t:fieldHidden>
				<t:fieldHidden property="xuqbc"></t:fieldHidden>
				<t:fieldHidden property="zhizlx"></t:fieldHidden>
				<t:fieldHidden property="mode"></t:fieldHidden>
				<t:fieldHidden property="xuqlx"></t:fieldHidden>
				<t:fieldHidden property="shengxbz"></t:fieldHidden>
				<t:fieldHidden property="xuqksrq"></t:fieldHidden>
			</t:fieldLayout>


			<t:gridCol property="usercenter" type="text" caption="${i18n.usercenter}"></t:gridCol>
			<t:gridCol property="lingjbh" type="text" caption="${i18n.lingjbh}"></t:gridCol>
			<t:gridCol property="shiycj" type="text" caption="${i18n.shiycj}"></t:gridCol>
			<t:gridCol property="chanx" type="text" caption="${i18n.chanx}"></t:gridCol>
			<t:gridCol property="lingjmc" type="text" caption="${i18n.lingjmc}"></t:gridCol>
			<t:gridCol property="danw" type="text" caption="${i18n.danw}"></t:gridCol>
			<t:gridCol property="jihyz" type="text" caption="${i18n.jihyz}"></t:gridCol>
			<t:gridCol property="zhizlx" type="text" caption="${i18n.zhizlx}"></t:gridCol>
			<t:gridCol property="j0" type="text" caption="J0"></t:gridCol>
			<t:gridCol property="j1" type="text" caption="J1"></t:gridCol>
			<t:gridCol property="j2" type="text" caption="J2"></t:gridCol>
			<t:gridCol property="j3" type="text" caption="J3"></t:gridCol>
			<t:gridCol property="j4" type="text" caption="J4"></t:gridCol>
			<t:gridCol property="j5" type="text" caption="J5"></t:gridCol>
			<t:gridCol property="j6" type="text" caption="J6"></t:gridCol>
			<t:gridCol property="j7" type="text" caption="J7"></t:gridCol>
			<t:gridCol property="j8" type="text" caption="J8"></t:gridCol>
		</t:grid>
		<t:fieldLayout prefix="sa">
			<t:fieldArea property="beiz" caption="备注" width="600" maxLength="60"></t:fieldArea>

		</t:fieldLayout>
		<t:buttons id="btns1">
			<t:button caption="${i18n.xz}" name="add"></t:button>

			<t:button caption="${i18n.sc}" name="delete"></t:button>

			<t:button caption="${i18n.edit}" name="edit"></t:button>
			<t:button caption="${i18n.saveAs}" name="saveAs"></t:button>
		</t:buttons>

	</t:form>
	<input id="removeId" value="${removeId}" type="hidden" />

	<form id="exp" name="exp" action="${ctx}/maoxq/downLoadFileDetailRi.do" method="post" style="background-color: white;" target="hiddenUp">
		<div style="display: none;">
			<t:fieldLayout prefix="dto">
				<t:fieldHidden property="usercenter"></t:fieldHidden>
				<t:fieldHidden property="jihyz"></t:fieldHidden>
				<t:fieldHidden property="lingjbh"></t:fieldHidden>
				<t:fieldHidden property="zhizlx"></t:fieldHidden>
				<t:fieldHidden property="xsfs"></t:fieldHidden>
				<t:fieldHidden property="xuqbc"></t:fieldHidden>
				<t:fieldHidden property="mode"></t:fieldHidden>
				<t:fieldHidden property="xuqlx"></t:fieldHidden>
				<t:fieldHidden property="xuqksrq"></t:fieldHidden>
			</t:fieldLayout>
		</div>
	</form>
	<iframe name="hiddenUp" id="hiddenUp" style="display: none;"></iframe>
	</t:panel>
</t:page>
<script type="text/javascript">
	$.sdcui.serverConfig.convertArray['pattern'] = {
		'0' : '${i18n.anCenter}',
		'1' : '${i18n.anChanx}'
	};
	var winOpen;
	var timer;
	function IfWindowClosed() {
		if (winOpen == null) {
			window.clearInterval(timer);
			reloadDate();
		}
	}

	function reloadDate() {
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/maoxq/showDate.ajax",
			data : "xuqbc=" + $("#record_xuqbc").fieldValue() + "&xuqlx=Days"+ "&xuqksrq="+ $("#recordOne_xuqksrq").fieldValue(),
			success : function(result) {
				var rq = '${i18n.rmxq}(J0-J8:' + result.result + ')';
				$('#kaisrq').text(rq);
				$('#grid_chanxDays').grid('reload');// 刷新当前页
			}
		});
	}

	//查询按钮
	function query() {
	    var usercenter = $("#recordOne_usercenter").fieldValue();
	    var lingjbh = $("#recordOne_lingjbh").fieldValue();
	    var jihyz = $("#recordOne_jihyz").fieldValue();
	    var xsfs = $("#recordOne_xsfs").fieldValue();
	    var zhizlx = $("#recordOne_zhizlx").fieldValue();
	    var xuqksrq = $("#recordOne_xuqksrq").fieldValue();
	    $("#record_usercenter").fieldValue(usercenter);
	    $("#record_lingjbh").fieldValue(lingjbh);
	    $("#record_jihyz").fieldValue(jihyz);
	    $("#record_xsfs").fieldValue(xsfs);
	    $("#record_zhizlx").fieldValue(zhizlx);
	    $("#record_xuqksrq").fieldValue(xuqksrq);
		//刷新列表
//		$('#grid_chanxDays').grid('reload');
		reloadDate();
		/*
		var xsfs = $("#record_xsfs").fieldValue();
		var usercenter = $("#record_usercenter").fieldValue();
		var jihyz = $("#record_jihyz").fieldValue();
		var lingjbh = $("#record_lingjbh").fieldValue();
		var zhizlx = $("#record_zhizlx").fieldValue();
		var xuqbc = $("#record_xuqbc").fieldValue();
		//存储方式
		var mode = $("#record_mode").fieldValue();
		var record = {};
		record.xsfs = xsfs;
		record.xuqbc = xuqbc;
		record.usercenter = usercenter;
		record.jihyz = jihyz;
		record.lingjbh = lingjbh;
		record.zhizlx = zhizlx;
		record.xuqlx = 'Days';

		var params = [];
		params.push("xuqbc=" + xuqbc);
		params.push("mode=" + mode);
		params.push("xsfs=" + xsfs);
		params.push("usercenter=" + usercenter);
		params.push("jihyz=" + jihyz);
		params.push("lingjbh=" + lingjbh);
		params.push("zhizlx=" + zhizlx);
		params.push("xuqlx=" + 'Days');
		var data = params.join('&');
		if (xsfs === '0') {
			window
					.open(
							'${ctx}/maoxq/initCwD.do?removeId=layout-north,layout-west,layout-south&'
									+ data,
							'毛需求明细',
							'height=500,width=800,top=100,left=100,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no, status=no');
			return false;
			/**
		 * form跳转模式提交
			$.sdcui.pageUtils.goPage({
				url:'/maoxq/initCwD.do',//url
				record:record,//
				mode:'form',
				beforeSubmit:function(){
					//
					return true;
				}
			});			
		} else {
			//刷新列表
			$('#grid_chanxDays').grid('reload');
		}*/

	}

	//重置按钮
	function cancle() {
		$("#recordOne_usercenter").fieldValue("");
		$("#recordOne_jihyz").fieldValue("");
		$("#recordOne_lingjbh").fieldValue("");
		$("#recordOne_zhizlx").fieldValue("");
		$("#recordOne_xuqksrq").fieldValue("");
	}

	/**
	 *修改零件数量
	 */
	function func_button_edit() {
		if ($("#record_shengxbz").fieldValue() == '1') {
			alert("${i18n.noteditSx}");
			return;
		}
		var param = $("#grid_chanxDays").grid('getSelectedRecords');
		if (param.length != 1) {
			alert("${i18n.selectOneRow}");
			return false;
		}
		var record = {};//获取当前行对应的记录
		record.xuqbc = $("#record_xuqbc").fieldValue();
		record.usercenter = param[0].usercenter;
		record.zhizlx = param[0].zhizlx;
		record.id = param[0].id;
		record.chanx = param[0].chanx;
		record.lingjbh = param[0].lingjbh;

		var params = [];
		params.push("xuqbc=" + $("#record_xuqbc").fieldValue());
		params.push("usercenter=" + param[0].usercenter);
		params.push("zhizlx=" + param[0].zhizlx);
		var chanx = typeof param[0].chanx == 'undefined' ? "" : param[0].chanx;
		params.push("chanx=" + chanx);
		var shiycj = typeof param[0].shiycj == 'undefined' ? ""
				: param[0].shiycj;
		params.push("shiycj=" + shiycj);
		params.push("lingjbh=" + param[0].lingjbh);
		var data = params.join('&');
		winOpen = window.open ('${ctx}/maoxq/editPageDay.do?removeId=layout-north,layout-west,layout-south&'
				+ data,
				'毛需求',
				'top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no, status=no');
		winOpen.resizeTo(screen.availWidth,screen.availHeight);
		//winOpen = window
		//		.showModalDialog(
		//				'${ctx}/maoxq/editPageDay.do?removeId=layout-north,layout-west,layout-south&'
		//						+ data,
		//				window,
		//				"dialogHeight=420px;dialogWidth=750px;dialogTop=100px;dialogLeft=100px;center:yes;scroll:no;status:no;resizable:yes;location:no");
		timer = window.setInterval("IfWindowClosed()", 500);
		/**
		 * form跳转模式提交
		$.sdcui.pageUtils.goPage({
			url:'/maoxq/editPage.do',//url
			record:record,//
			mode:'form',
			beforeSubmit:function(){
				//
				return true;
			}
		});
		event.stopPropagation();//阻止事件冒泡
		return false;		 */

	}
	//新增
	function func_button_add() {
		if ($("#record_shengxbz").fieldValue() == '1') {
			alert("${i18n.notaddSx}");
			return;
		}
		var params = [];
		var param = $("#grid_chanxDays").grid('getSelectedRecords');
		if (param.length > 1) {
			alert("${i18n.selectOneRow}");
			return false;
		} else if (param.length == 1) {
			params.push("xuqbc=" + $("#record_xuqbc").fieldValue());
			params.push("usercenter=" + param[0].usercenter);
			params.push("zhizlx=" + param[0].zhizlx);
			var jihyz = typeof param[0].jihyz == 'undefined' ? "" : param[0].jihyz;
			params.push("jihyz=" + jihyz);
			var danw = typeof param[0].danw == 'undefined' ? "" : param[0].danw;
			params.push("danw=" + danw);
			var lingjmc = typeof param[0].lingjmc == 'undefined' ? "" : param[0].lingjmc;
			params.push("lingjmc=" + encodeURI(lingjmc));
			var chanx = typeof param[0].chanx == 'undefined' ? ""
					: param[0].chanx;
			params.push("chanx=" + chanx);
			var shiycj = typeof param[0].shiycj == 'undefined' ? ""
					: param[0].shiycj;
			params.push("shiycj=" + shiycj);
			params.push("lingjbh=" + param[0].lingjbh);
		} else {
			params.push("xuqbc=" + $("#record_xuqbc").fieldValue());
			params.push("mode=" + $("#record_mode").fieldValue());
		}
		var data = params.join('&');
		winOpen = window.open ('${ctx}/maoxq/dayInitAdd.do?removeId=layout-north,layout-west,layout-south&'
				+ data,
				'毛需求',
				'top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no, status=no');
		winOpen.resizeTo(screen.availWidth,screen.availHeight);
		//winOpen = window
		//		.showModalDialog(
		//				'${ctx}/maoxq/dayInitAdd.do?removeId=layout-north,layout-west,layout-south&'
		//						+ data,
		//				window,
		//				"dialogHeight=500px;dialogWidth=750px;dialogTop=100px;dialogLeft=100px;center:yes;scroll:no;status:no;resizable:yes;location:no");
		timer = window.setInterval("IfWindowClosed()", 500);
		/**
		 * form跳转模式提交
		$.sdcui.pageUtils.goPage({
			url:'/maoxq/initAdd.do',//url
			record:record,//
			mode:'form',
			beforeSubmit:function(){
				//
				return true;
			}
		});
		event.stopPropagation();//阻止事件冒泡
		return false;
		 */
	}

	//删除
	function func_button_delete() {
		if ($("#record_shengxbz").fieldValue() == '1') {
			alert("${i18n.notdeleteSx}");
			return;
		}
		var mx = $("#grid_chanxDays").grid('getSelectedRecords');
		if (mx.length < 1) {
			alert("${i18n.selectOneRow}");
			return false;
		}
		if (!confirm("${i18n.deleteTrue}")) {
			return false;
		}
		var params = [];
		for ( var i = 0; i < mx.length; i++) {
			params.push('delete[' + i + '].xuqbc=' + mx[i].xuqbc);
			params.push('delete[' + i + '].usercenter=' + mx[i].usercenter);
			params.push('delete[' + i + '].editor=' + mx[i].editor);
			params.push('delete[' + i + '].edit_time=' + mx[i].edit_time);
			params.push('delete[' + i + '].zhizlx=' + mx[i].zhizlx);
			params.push('delete[' + i + '].lingjbh=' + mx[i].lingjbh);
			if (typeof mx[i].shiycj != 'undefined')
				params.push('delete[' + i + '].shiycj=' + mx[i].shiycj);
			if (typeof mx[i].chanx != 'undefined')
				params.push('delete[' + i + '].chanx=' + mx[i].chanx);
		}

		//修改ajax请求       
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/maoxq/delectMxP.ajax",
			data : params.join('&'),
			success : function(result) {
				alert(result.result);
				reloadDate();
			}
		});
	}

	/**
	 *另存为
	 */
	function func_button_saveAs() {
		var xuqbc = $("#record_xuqbc").fieldValue();
		var beiz = $("#sa_beiz").fieldValue();

		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/maoxq/saveAs.ajax",
			data : "xuqbc=" + xuqbc + "&beiz=" + beiz,
			success : function(result) {
				alert(result.result);
			}
		});
	}

	//返回
	/*	function func_button_back() {
			history.back();
			//window.history.go(-1);
			//window.history.forward();

		} */

	function expxls() {
		var red = $("#grid_chanxDays").grid("getRecords");
		if (red.length == 0) {
			alert("${i18n.dcnotdatanotnull}");
			return false;
		}
		setquery();
		var usercenter = $('#record_usercenter').fieldValue();
		var jihyz = $('#record_jihyz').fieldValue();
		var lingjbh = $('#record_lingjbh').fieldValue();
		var zhizlx = $('#record_zhizlx').fieldValue();
		var xuqbc = $('#record_xuqbc').fieldValue();
		var xuqlx = $('#record_xuqlx').fieldValue();
		var xsfs = $('#record_xsfs').fieldValue();
		var mode = $('#record_mode').fieldValue();
		var xuqksrq = $('#record_xuqksrq').fieldValue();
		$('#dto_usercenter').fieldValue(usercenter);
		$('#dto_jihyz').fieldValue(jihyz);
		$('#dto_lingjbh').fieldValue(lingjbh);
		$('#dto_zhizlx').fieldValue(zhizlx);
		$('#dto_xuqbc').fieldValue(xuqbc);
		$('#dto_xuqlx').fieldValue(xuqlx);
		$('#dto_xsfs').fieldValue(xsfs);
		$('#dto_mode').fieldValue(mode);
		$('#dto_xuqksrq').fieldValue(xuqksrq);
		var fm = document.getElementById("exp");
		fm.submit();

		/*var param=[];
		param.push("usercenter="+usercenter);
		param.push("jihyz="+jihyz);
		param.push("lingjbh="+lingjbh);
		param.push("zhizlx="+zhizlx);
		param.push("xuqbc="+xuqbc);
		param.push("xuqlx="+xuqlx);
		param.push("xsfs="+xsfs);
		param.push("mode="+mode);*/
		var record = {};
		record.usercenter = usercenter;
		record.jihyz = jihyz;
		record.lingjbh = lingjbh;
		record.zhizlx = zhizlx;
		record.xuqbc = xuqbc;
		record.xuqlx = xuqlx;
		record.xsfs = xsfs;
		record.mode = mode;

		/*$.sdcui.pageUtils.goPage({
			url : '/maoxq/downLoadFileDetail.do',//url
			record : record,//
			mode : 'form',
			beforeSubmit : function() {
				//
				return true;
			}
		});*/
	}
	
	function setquery(){
	    var usercenter = $("#recordOne_usercenter").fieldValue();
	    var lingjbh = $("#recordOne_lingjbh").fieldValue();
	    var jihyz = $("#recordOne_jihyz").fieldValue();
	    var xsfs = $("#recordOne_xsfs").fieldValue();
	    var zhizlx = $("#recordOne_zhizlx").fieldValue();
	    var xuqksrq = $("#recordOne_xuqksrq").fieldValue();
	    $("#record_usercenter").fieldValue(usercenter);
	    $("#record_lingjbh").fieldValue(lingjbh);
	    $("#record_jihyz").fieldValue(jihyz);
	    $("#record_xsfs").fieldValue(xsfs);
	    $("#record_zhizlx").fieldValue(zhizlx);
	    $("#record_xuqksrq").fieldValue(xuqksrq);
	}	
		
	//提示语句
	function callback(msg) 
	{
		alert(msg);
	}	
</script>
<style type="text/css">
</style>
</t:html>