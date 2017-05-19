<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.diaobl_sh}" >
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	</head>
	<t:page i18n="i18n.xqjs.diaobl.diaoblquery">
	<t:grid id="grid_diaosq" caption=""  showNum="true"  load="true" scrollHeight="310" 
	src="/diaobl/searchDiaobSq.ajax" add="NOT" edit="NOT" remove="NOT" back="NOT" idKeys="diaobsqdh">
		<t:fieldLayout  columns="4">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" width="150"></t:fieldSelect>
			<t:fieldText property="lingjbh" caption="${i18n.lingjbh}" maxLength="10" minLength="10" width="150"></t:fieldText>
			<t:fieldText property="chengbzx" caption="${i18n.chengbzx}" maxLength="5" width="150"></t:fieldText>
			<t:fieldText property="creator" caption="${i18n.creator }" maxLength="32" width="150" ></t:fieldText>
			<t:fieldSelect property="zhuangt" caption="${i18n.zhuangt1 }" convert="queryDblzt" width="150"></t:fieldSelect>
			<t:fieldText property="diaobsqdh" caption="${i18n.diaobsqdh}" maxLength="8" minLength="8" width="150"></t:fieldText>
			<t:fieldCalendar property="diaobsqsj" format="yyyy-MM-dd" caption="${i18n.diaobsqsj}" width="150"></t:fieldCalendar>
			<t:fieldHidden property="sh" defaultValue="40"></t:fieldHidden>
		</t:fieldLayout>
		<t:buttons id="diaobsm_button">
			<t:button caption="扫描审核" name="diaobsm"></t:button>
		</t:buttons>

	<t:gridCol width="100" property="diaobsqdh" type="link" caption="${i18n.diaobsqdh}" orderBy="desc" sortProperty="diaobsqdh"></t:gridCol>
	<t:gridCol property="usercenter" convert="usercenter" caption="${i18n.usercenter}"></t:gridCol>
	<t:gridCol property="chengbzx" caption="${i18n.chengbzx}"></t:gridCol>
	<t:gridCol property="diaobsqsj" caption="${i18n.diaobsqsj}" orderBy="desc" sortProperty="diaobsqsj"></t:gridCol>
	<t:gridCol property="creator" caption="${i18n.creator}"></t:gridCol>
	<t:gridCol property="zhuangt" caption="${i18n.zhuangt}" convert="queryDblzt"></t:gridCol>
	<t:gridCol property="beiz" caption="${i18n.beiz}"></t:gridCol>
	</t:grid>

	<div class="youi-buttons">
			<table>
				<tr>
					<td><div id="button_shengxdy" class="youi-button active-0">
							<div class="right" style="width: 75px">
								<div class="center">
									<a onclick="shengxdy()">生效打印</a>
								</div>
							</div>
						</div>
					</td>
					<td><div  id="button_chaydy"  class="youi-button active-0">
							<div class="right" style="width: 75px">
								<div class="center">
									<a onclick="chaydy()">差异打印</a>
								</div>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<form id="printform" name="printform" method="post"
		style="display: none;">
		<div>
			<input type="text" id="justDoPrint" name="justDoPrint" value="" />
			<!-- 立即预览打印 -->
			<input type="text" id="billcode" name="billcode" value="" />
			<!-- 单据号（唯一标识单据，用作打印历史维护） -->
			<input type="text" id="jsondataprovider" name="jsondataprovider"
				value="" />
			<!-- 自定义封装的json字符串 -->
			<input type="text" id="selectedid" name="selectedid" value="" />
			<!-- 选择数据表格时的多选id -->
			<input type="text" id="clazzparams" name="clazzparams" value="" />
			<!-- 配置为clazz时传递的json形式参数 -->
			<input type="text" id="templatecode" name="templatecode" value="" />
			<!-- 直接预览（打印）不进行模板选择时使用 -->
		</div>
	</form>
	</t:page>
	<script type="text/javascript">
	    $.sdcui.serverConfig.convertArray['codeConvert']={'00':'${i18n.weish }','10':'${i18n.shz}','20':'${i18n.ysh}','30':'${i18n.effect}','40':'${i18n.excuting}'};
	   // $.sdcui.serverConfig.convertArray['codeCenter']={'UW':'${i18n.uw }','UH':'${i18n.uh}','UX':'${i18n.ux}'};
		var winOpen;
		var timer;
		function IfWindowClosed() {
			if (winOpen == null) {
				window.clearInterval(timer);
				$('#grid_diaosq').grid('reload');// 刷新当前页
			}
		}
    function gridReload(){
        $('#grid_diaosq').grid('reload');// 刷新当前页
    }		
	/**
	*链接点击事件
	*/
	function link_diaobsqdh(event){
		var event = event||window.event;//原生态的事件处理 
		var element = event.srcElement || event.target;
		var rowDoc = $(element).parents('tr:first')[0];
		var record = $('#grid_diaosq').grid('getRecord',rowDoc);//获取当前行对应的记录
		var usercenter = record.usercenter;
		var diaobsqdh = record.diaobsqdh;
		var diaobsqsj = record.diaobsqsj;
		var zhuangt = record.zhuangt;
		/**
		 * form跳转模式提交
		$.sdcui.pageUtils.goPage({
			url:'/diaobl/initDiaobSqMx.do',//url
			record:record,//
			mode:'form',
			beforeSubmit:function(){
				//
				return true;
			}
		}); */
		winOpen = window.open ('${ctx}/diaobl/initDiaobSqMx.do?&usercenter='+usercenter+'&diaobsqdh='+diaobsqdh+'&diaobsqsj='+diaobsqsj+'&zhuangt='+zhuangt,
		'${i18n.diaobl_sh}',
		'top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no, status=no');
		winOpen.resizeTo(screen.availWidth,screen.availHeight);
        timer = window.setInterval("IfWindowClosed()", 500);

	}
	
	function func_button_diaobsm()
	{
		
		if(confirm('您确定要扫描审核吗?扫描审核会将状态为"审核中"的调拨申请单,并且调拨申请单下调拨申请明细的状态全部为"已审核"的状态修改为"已审核!"'))
		{
			 $.sdcui.ajaxUtil.ajax({
                  url:"${ctx}/diaobl/dodiaobsm.ajax",
                  success:function (result)
                  {
                	 alert(result.result);
                	 //刷新当前页面
        			 gridReload();
                  }
            });
			
		}
	}
	
	/*
	*生效打印
	*/
	function shengxdy(){

		var record = $('#grid_diaosq').grid('getSelectedRecords');//获取选中的数据
		var length = record.length;//判断长度
		var params = [];
		
		if(length != 1){//判断是否选择数据
			alert('请选择一条记录！');
			return false;
		}
		
		//判断该条记录是否已审核
		var zhuangt =record[0].zhuangt;
		if(zhuangt=='00' || zhuangt=='10'){
			alert('请选择一条已审核过的记录！');
			return false;
		}
		var usercenter =record[0].usercenter;
		var diaobsqdh = record[0].diaobsqdh;
		params.push("dbsq.usercenter="+usercenter);
		params.push("dbsq.diaobsqdh="+diaobsqdh);
		if(zhuangt=='20'){ 
					$.sdcui.ajaxUtil.ajax({
						url : "${ctx}/diaobl/diaoblSx.ajax",//请求url
						data : params.join('&'),
						success : function(result) {
							alert(result.result);
							if (result.flag != "3") {
								return false;
							} else {
								$.sdcui.ajaxUtil.ajax({
									url : "${ctx}/diaobl/sxprint.ajax",//请求url
									data : "usercenter=" + usercenter + "&diaobsqdh="
											+ diaobsqdh,
									success : function(result) {
										var jsondata = result.json;
										print(jsondata);
										//window.close();
										//window.opener.gridReload();
										$('#grid_diaosq').grid('reload');
									}
								});
							}
						}
					});
		}else{
			$.sdcui.ajaxUtil.ajax({
									url : "${ctx}/diaobl/sxprint.ajax",//请求url
									data : "usercenter=" + usercenter + "&diaobsqdh="
											+ diaobsqdh,
									success : function(result) {
										var jsondata = result.json;
										print(jsondata);
										//window.close();
										//window.opener.gridReload();
										$('#grid_diaosq').grid('reload');
									}
								});
		}
	}
	//差异打印
	function chaydy(){

		var record = $('#grid_diaosq').grid('getSelectedRecords');//获取选中的数据
		var length = record.length;//判断长度
		var params = [];

		if(length != 1){//判断是否选择数据
			alert('请选择一条记录！');
			return false;
		}
		//判断该条记录是否已审核
		var zhuangt =record[0].zhuangt;
		
		if(zhuangt=='00' || zhuangt=='10'){
			alert('请选择一条已审核过的记录！');
			return false;
		}

		var usercenter =record[0].usercenter;
		var diaobsqdh = record[0].diaobsqdh;
		var diaobsqsj = record[0].diaobsqsj;
		params.push("dbsq.usercenter="+usercenter);
		params.push("dbsq.diaobsqdh="+diaobsqdh);
		params.push("dbsq.diaobsqsj="+diaobsqsj);

					$.sdcui.ajaxUtil.ajax({
						url : "${ctx}/diaobl/cyprint.ajax",//请求url
						data : "usercenter=" + usercenter + "&diaobsqdh="
								+ diaobsqdh+"&diaobsqsj="+diaobsqsj,
						success : function(result) {
							var jsondata = result.json;
							printcy(jsondata);
							//window.close();
							//window.opener.gridReload();
							$('#grid_diaosq').grid('reload');
						}
					});
	}
	//生效打印
	function print(jsondata) {
		var templatecode = "DIAOBSXDY";
		var jsondata = jsondata;
		var selectedid = null;
		var clazzparams = null;
		var billcode = "BILLKEY";
		doprint_view(templatecode, jsondata, selectedid, clazzparams, billcode);

	}
	
	//差异打印
	function printcy(jsondata) {
		var templatecode = "DIAOBCYDY";
		var jsondata = jsondata;
		var selectedid = null;
		var clazzparams = null;
		var billcode = "BILLKEY";
		doprint_view(templatecode, jsondata, selectedid, clazzparams, billcode);

	}
	//打印预览，数据传递		
	function doprint_view(templatecode, jsondata, selectedid, clazzparams,
			billcode) {
		document.getElementsByName("jsondataprovider")[0].value = jsondata;
		document.getElementsByName("selectedid")[0].value = selectedid;
		document.getElementsByName("clazzparams")[0].value = clazzparams;
		document.getElementsByName("billcode")[0].value = billcode;
		document.getElementsByName("templatecode")[0].value = templatecode;
		document.getElementsByName("justDoPrint")[0].value = "false";
		var fm = document.getElementById("printform");
		fm.action = "${ctx}/webprint/print_doit.jsp";
		fm.target = "_blank";
		fm.submit();
	}
	</script>
	<style type="text/css"></style>
</t:html>