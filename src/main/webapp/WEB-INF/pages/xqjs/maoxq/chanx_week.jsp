<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="role" value="${role}"/>
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
				<c:choose>
					<c:when test="${fn:contains(xuqbc,'DKS')}">
						<t:fieldText property="zhizlx" caption="${i18n.zhizlx}"  width="150" maxLength="3"></t:fieldText>
					</c:when>
					<c:otherwise>
					    <t:fieldSelect property="zhizlx" caption="${i18n.zhizlx}" convert="queryDinghlx" width="150"></t:fieldSelect>
					</c:otherwise>
				</c:choose>		
			 	
				<t:fieldSelect property="xsfs" caption="${i18n.xsfs}" convert="pattern" defaultValue="1" notNull="true" width="150"></t:fieldSelect>		
	
			</t:fieldLayout>
			<span>${i18n.beiz}: ${i18n.xqbcis}：${xuqbc}</span>&nbsp;<span id="kaisrq">${i18n.zmxq}(S0:${kaisrq})</span>
			<div class="youi-buttons" align="right">
				<table>
					<tbody>
						<tr>
						<td>
								<div class="youi-button active-0" id="button_expxls">
									<div class="right">
										<div class="center">
											<a href="#" onclick="expxls()">${i18n.dc}</a>
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

		<t:grid id="grid_chanxWeek" caption="${i18n.zmxq} " showCheckbox="true" src="/maoxq/queryMxP.ajax" idKeys="xuqbc,usercenter,lingjbh,editor,edit_time" showNum="true" remove="NOT" edit="NOT" add="NOT"
			usePager="true" save="NOT" submit="NOT" reset="NOT" scrollHeight="330" pageSize="20">

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
			</t:fieldLayout>
			
			<t:gridCol property="usercenter" type="text" caption="${i18n.usercenter}"></t:gridCol>
			<t:gridCol property="lingjbh" type="text" caption="${i18n.lingjbh}"></t:gridCol>
			<t:gridCol property="chanx" type="text" caption="${i18n.chanx}"></t:gridCol>
			<t:gridCol property="shiycj" type="text" caption="${i18n.shiycj}"></t:gridCol>
			<t:gridCol property="lingjmc" type="text" caption="${i18n.lingjmc}"></t:gridCol>
			<t:gridCol property="danw" type="text" caption="${i18n.danw}"></t:gridCol>
			<t:gridCol property="jihyz" type="text" caption="${i18n.jihyz}"></t:gridCol>
			<t:gridCol property="zhizlx" type="text" caption="${i18n.zhizlx}"></t:gridCol>
			<t:gridCol property="s0Week1" type="text" caption="S0"></t:gridCol>
			<t:gridCol property="s1Week1" type="text" caption="S1"></t:gridCol>
			<t:gridCol property="s2Week1" type="text" caption="S2"></t:gridCol>
			<t:gridCol property="s3Week1" type="text" caption="S3"></t:gridCol>
			<t:gridCol property="s4Week1" type="text" caption="S4"></t:gridCol>
			<t:gridCol property="s5Week1" type="text" caption="S5"></t:gridCol>
			<t:gridCol property="s6Week1" type="text" caption="S6"></t:gridCol>
			<t:gridCol property="s7Week1" type="text" caption="S7"></t:gridCol>
			<t:gridCol property="s8Week1" type="text" caption="S8"></t:gridCol>
			<t:gridCol property="s9Week1" type="text" caption="S9"></t:gridCol>
			<t:gridCol property="s10Week1" type="text" caption="S10"></t:gridCol>
			<t:gridCol property="s11Week1" type="text" caption="S11"></t:gridCol>
			<t:gridCol property="s12Week1" type="text" caption="S12"></t:gridCol>
			<t:gridCol property="s13Week1" type="text" caption="S13"></t:gridCol>
			<t:gridCol property="s14Week1" type="text" caption="S14"></t:gridCol>
			<t:gridCol property="s15Week1" type="text" caption="S15"></t:gridCol>
			<t:gridCol property="s16Week1" type="text" caption="S16"></t:gridCol>
			<t:gridCol property="s17Week1" type="text" caption="S17"></t:gridCol>
			<t:gridCol property="s18Week1" type="text" caption="S18"></t:gridCol>
			<t:gridCol property="s19Week1" type="text" caption="S19"></t:gridCol>
			<t:gridCol property="s20Week1" type="text" caption="S20"></t:gridCol>
			<t:gridCol property="s21Week1" type="text" caption="S21"></t:gridCol>
			<t:gridCol property="s22Week1" type="text" caption="S22"></t:gridCol>
			<t:gridCol property="s23Week1" type="text" caption="S23"></t:gridCol>
			<t:gridCol property="s24Week1" type="text" caption="S24"></t:gridCol>
			<t:gridCol property="s25Week1" type="text" caption="S25"></t:gridCol>
			<t:gridCol property="s26Week1" type="text" caption="S26"></t:gridCol>
			<t:gridCol property="s27Week1" type="text" caption="S27"></t:gridCol>
			<t:gridCol property="s28Week1" type="text" caption="S28"></t:gridCol>
			<t:gridCol property="s29Week1" type="text" caption="S29"></t:gridCol>
			<t:gridCol property="s30Week1" type="text" caption="S30"></t:gridCol>
			<t:gridCol property="s31Week1" type="text" caption="S31"></t:gridCol>
			<t:gridCol property="s32Week1" type="text" caption="S32"></t:gridCol>
			<t:gridCol property="s33Week1" type="text" caption="S33"></t:gridCol>
			<t:gridCol property="s34Week1" type="text" caption="S34"></t:gridCol>
			<t:gridCol property="s35Week1" type="text" caption="S35"></t:gridCol>
			<t:gridCol property="s36Week1" type="text" caption="S36"></t:gridCol>
			<t:gridCol property="s37Week1" type="text" caption="S37"></t:gridCol>
			<t:gridCol property="s38Week1" type="text" caption="S38"></t:gridCol>
			<t:gridCol property="s39Week1" type="text" caption="S39"></t:gridCol>
			<t:gridCol property="s40Week1" type="text" caption="S40"></t:gridCol>
			<t:gridCol property="s41Week1" type="text" caption="S41"></t:gridCol>
			<t:gridCol property="s42Week1" type="text" caption="S42"></t:gridCol>
			<t:gridCol property="s43Week1" type="text" caption="S43"></t:gridCol>
			<t:gridCol property="s44Week1" type="text" caption="S44"></t:gridCol>
			<t:gridCol property="s45Week1" type="text" caption="S45"></t:gridCol>
			<t:gridCol property="s46Week1" type="text" caption="S46"></t:gridCol>
			<t:gridCol property="s47Week1" type="text" caption="S47"></t:gridCol>
			<t:gridCol property="s48Week1" type="text" caption="S48"></t:gridCol>
			<t:gridCol property="s49Week1" type="text" caption="S49"></t:gridCol>
			<t:gridCol property="s50Week1" type="text" caption="S50"></t:gridCol>
			<t:gridCol property="s51Week1" type="text" caption="S51"></t:gridCol>
			<t:gridCol property="s52Week1" type="text" caption="S52"></t:gridCol>
			<t:gridCol property="s53Week1" type="text" caption="S53"></t:gridCol>
			<t:gridCol property="s54Week1" type="text" caption="S54"></t:gridCol>
			<t:gridCol property="s55Week1" type="text" caption="S55"></t:gridCol>
			<t:gridCol property="s56Week1" type="text" caption="S56"></t:gridCol>
			<t:gridCol property="s57Week1" type="text" caption="S57"></t:gridCol>
			<t:gridCol property="s58Week1" type="text" caption="S58"></t:gridCol>
			<t:gridCol property="s59Week1" type="text" caption="S59"></t:gridCol>
			<t:gridCol property="s60Week1" type="text" caption="S60"></t:gridCol>
			<t:gridCol property="s61Week1" type="text" caption="S61"></t:gridCol>
			<t:gridCol property="s62Week1" type="text" caption="S62"></t:gridCol>
			<t:gridCol property="s63Week1" type="text" caption="S63"></t:gridCol>
			<t:gridCol property="s64Week1" type="text" caption="S64"></t:gridCol>
			<t:gridCol property="" caption=""></t:gridCol>
		</t:grid>
		<t:fieldLayout prefix="sa">
			<t:fieldArea property="beiz" caption="${i18n.beiz}" width="600" maxLength="60"></t:fieldArea>

		</t:fieldLayout>
		<t:buttons id="btns1">
			<t:button caption="${i18n.xz}" name="add"></t:button>

			<t:button caption="${i18n.sc}" name="delete"></t:button>

			<t:button caption="${i18n.edit}" name="edit"></t:button>
			<t:button caption="${i18n.saveAs}" name="saveAs"></t:button>
		</t:buttons>

	</t:form>

	<input id="removeId" value="${removeId}" type="hidden" />

	<form id="exp" name="exp" action="${ctx}/maoxq/downLoadFileDetail.do" method="post" style="background-color: white;" target="hiddenUp">
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
    $.sdcui.serverConfig.convertArray['lxkd'] = {
		'97X' : '97X',
		'97D' : '97D'
	};
	$.sdcui.serverConfig.convertArray['lxil'] = {
		'97W' : '97W',
		'UGB' : 'UGB'
	};
	/*$(function() {
		var xqbc = $("#record_xuqbc").fieldValue();
		if(xqbc.indexOf("DKS")!=-1){
		   $("#fieldSelect-recordOne_zhizlxil").parent('td:first').remove();
		   $("#fieldSelect-recordOne_zhizlxil").remove();
		   $("#recordOne_zhizlxil").parent('td:first').remove();
		   $("#recordOne_zhizlxil").remove();
		   //alert($("#record_zhizlxkd").fieldValue());
		}else{
		   $("#fieldSelect-recordOne_zhizlxkd").parent('td:first').remove();
		   $("#fieldSelect-recordOne_zhizlxkd").remove();
		   $("#recordOne_zhizlxkd").parent('td:first').remove();
		   $("#recordOne_zhizlxkd").remove();
		}
	})*/
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
			data : "xuqbc=" + $("#record_xuqbc").fieldValue(),
			success : function(result) {
				var rq = '${i18n.zmxq}(S0:' + result.result + ')';
				$('#kaisrq').text(rq);
				$('#grid_chanxWeek').grid('reload');// 刷新当前页
			}
		});
	}

	//查询按钮
	function query() {
	    var usercenter = $("#recordOne_usercenter").fieldValue();
	    var lingjbh = $("#recordOne_lingjbh").fieldValue();
	    var jihyz = $("#recordOne_jihyz").fieldValue();
	    var xsfs = $("#recordOne_xsfs").fieldValue();
	    $("#record_usercenter").fieldValue(usercenter);
	    $("#record_lingjbh").fieldValue(lingjbh);
	    $("#record_jihyz").fieldValue(jihyz);
	    $("#record_xsfs").fieldValue(xsfs);
	    $("#record_zhizlx").fieldValue($("#recordOne_zhizlx").fieldValue());
	    var xqbc = $("#record_xuqbc").fieldValue();
	    /* if(xqbc.indexOf("DKS")!=-1){
	       $("#record_zhizlx").fieldValue($("#recordOne_zhizlxkd").fieldValue());
	    }else{
	       $("#record_zhizlx").fieldValue($("#recordOne_zhizlxil").fieldValue());
	    }*/
	    //刷新列表
		$('#grid_chanxWeek').grid('reload');
		/*
		var xsfs = $("#record_xsfs").fieldValue();
		var usercenter = $("#record_usercenter").fieldValue();
		var jihyz = $("#record_jihyz").fieldValue();
		var lingjbh = $("#record_lingjbh").fieldValue();
		var zhizlx = $("#record_zhizlx").fieldValue();
		var xuqbc = $("#record_xuqbc").fieldValue();
		var mode = $("#record_mode").fieldValue();
		var record = {};
		record.xuqbc = xuqbc;
		record.mode = mode;
		record.xsfs = xsfs;
		record.usercenter = usercenter;
		record.jihyz = jihyz;
		record.lingjbh = lingjbh;
		record.zhizlx = zhizlx;
		record.xuqlx = 'Week';

		var params = [];
		params.push("xuqbc=" + xuqbc);
		params.push("mode=" + mode);
		params.push("xsfs=" + xsfs);
		params.push("usercenter=" + usercenter);
		params.push("jihyz=" + jihyz);
		params.push("lingjbh=" + lingjbh);
		params.push("zhizlx=" + zhizlx);
		params.push("xuqlx=" + 'Week');
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
			$('#grid_chanxWeek').grid('reload');
		}*/

	}

	//重置按钮
	function cancle() {
		$("#recordOne_usercenter").fieldValue("");
		$("#recordOne_jihyz").fieldValue("");
		$("#recordOne_lingjbh").fieldValue("");
		var xqbc = $("#record_xuqbc").fieldValue();
		$("#recordOne_zhizlx").fieldValue("");
		/*if(xqbc.indexOf("DKS")==-1){
			$("#recordOne_zhizlxil").fieldValue("");
		}*/
	}

	/**
	 *修改零件数量
	 */
	function func_button_edit() {
        if($("#record_shengxbz").fieldValue()=='1'){
	       alert("${i18n.noteditSx}");
	       return;
	    }
		var param = $("#grid_chanxWeek").grid('getSelectedRecords');
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
		var chanx = typeof param[0].chanx=='undefined'?"":param[0].chanx;
		params.push("chanx=" + chanx);
		var shiycj = typeof param[0].shiycj=='undefined'?"":param[0].shiycj;
		params.push("shiycj=" + shiycj);
		params.push("lingjbh=" + param[0].lingjbh);
		var data = params.join('&');
		winOpen = window.open ('${ctx}/maoxq/editPageWeek.do?removeId=layout-north,layout-west,layout-south&'
				+ data,
				'毛需求',
				'top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no, status=no');
		winOpen.resizeTo(screen.availWidth,screen.availHeight);
		//winOpen = window
		//		.showModalDialog(
		//				'${ctx}/maoxq/editPageWeek.do?removeId=layout-north,layout-west,layout-south&'
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
	    if($("#record_shengxbz").fieldValue()=='1'){
	       alert("${i18n.notaddSx}");
	       return;
		}
		var params = [];
		var param = $("#grid_chanxWeek").grid('getSelectedRecords');
		if (param.length >1) {
			alert("${i18n.selectOneRow}");
			return false;
		}else if(param.length == 1) {
		  	params.push("xuqbc=" + $("#record_xuqbc").fieldValue());
			params.push("usercenter=" + param[0].usercenter);
			params.push("zhizlx=" + param[0].zhizlx);
			params.push("jihyz=" + param[0].jihyz);
			var danw = typeof param[0].danw=='undefined'?"":param[0].danw;
			params.push("danw=" + danw);
			var lingjmc = typeof param[0].lingjmc=='undefined'?"":param[0].lingjmc;
			params.push("lingjmc=" + encodeURI(lingjmc));
			var chanx = typeof param[0].chanx=='undefined'?"":param[0].chanx;
			params.push("chanx=" + chanx);
			var shiycj = typeof param[0].shiycj=='undefined'?"":param[0].shiycj;
			params.push("shiycj=" + shiycj);
			params.push("lingjbh=" + param[0].lingjbh);
		}else{
		    params.push("xuqbc=" + $("#record_xuqbc").fieldValue());
		    params.push("mode=" + $("#record_mode").fieldValue());
		}
		var data = params.join('&');
		winOpen = window.open ('${ctx}/maoxq/weekInitAdd.do?removeId=layout-north,layout-west,layout-south&'
				+ data,
				'毛需求',
				'top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no, status=no');
		winOpen.resizeTo(screen.availWidth,screen.availHeight);
		//winOpen = window
		//		.showModalDialog(
		//				'${ctx}/maoxq/weekInitAdd.do?removeId=layout-north,layout-west,layout-south&'
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
		return false;		 */
	}

	//删除
	function func_button_delete() {
        if($("#record_shengxbz").fieldValue()=='1'){
	       alert("${i18n.notdeleteSx}");
	       return;
	    }
		var mx = $("#grid_chanxWeek").grid('getSelectedRecords');
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
			if(typeof mx[i].shiycj!='undefined')
			params.push('delete[' + i + '].shiycj=' + mx[i].shiycj);
			if(typeof mx[i].chanx!='undefined')
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
		var red = $("#grid_chanxWeek").grid("getRecords");
		if (red.length == 0) {
			alert("${i18n.dcnotdatanotnull}");
			return false;
		}
		var usercenter = $('#record_usercenter').fieldValue();
		var jihyz = $('#record_jihyz').fieldValue();
		var lingjbh = $('#record_lingjbh').fieldValue();
		var zhizlx = $('#record_zhizlx').fieldValue();
		var xuqbc = $('#record_xuqbc').fieldValue();
		var xuqlx = $('#record_xuqlx').fieldValue();
		var xsfs = $('#record_xsfs').fieldValue();
		var mode = $('#record_mode').fieldValue();
		$('#dto_usercenter').fieldValue(usercenter);
		$('#dto_jihyz').fieldValue(jihyz);
		$('#dto_lingjbh').fieldValue(lingjbh);
		$('#dto_zhizlx').fieldValue(zhizlx);
		$('#dto_xuqbc').fieldValue(xuqbc);
		$('#dto_xuqlx').fieldValue(xuqlx);
		$('#dto_xsfs').fieldValue(xsfs);
		$('#dto_mode').fieldValue(mode);
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
</script>
<style type="text/css">
</style>
</t:html>