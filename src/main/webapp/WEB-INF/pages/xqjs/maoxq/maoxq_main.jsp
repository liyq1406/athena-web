<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.mxqcxybj}">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>
<t:page i18n="i18n.xqjs.maoxq.maoxqcxbj">
<t:panel id="ddddd" >
    <div  class="youi-panel">
    <div class="panel-header">
        <div>${i18n.drxqwj}</div>
    </div>
    </div>
	<form id="form_daorwj" name="form_daorwj" action="${ctx}/maoxq/impExc.do" enctype='multipart/form-data' method="post" style="background-color: white;" target="hiddenUp">
			<div class="youi-buttons" align="right">
			<table>
				<tbody>
					<tr>
					    <td>
					        <t:fieldLayout columns="3" id="dr_maoxq" prefix="dr">
					            <t:fieldFile property="file" caption="${i18n.drwj}" width="120"></t:fieldFile>
								<t:fieldText property="xuqbc" caption="${i18n.xuqbc}" readonly="true" width="120" maxLength="20"></t:fieldText>
								<t:fieldText property="beiz" caption="${i18n.beiz}" maxLength="100" width="120" notNull="true"></t:fieldText>
				            </t:fieldLayout>
					    </td>
						<td>
							<div class="youi-button active-0" id="button_impFrExc">
								<div class="right">
									<div class="center">
										<a href="#" onclick="return impFrExc()"> ${i18n.dr}</a>
									</div>
								</div>
							</div></td>
						<td>
							<div id="button_reset" class="youi-button active-0">
								<div class="right">
									<div class="center">
										<a href="#" onclick="cancle2()"> ${i18n.cz} </a>
									</div>
								</div>
							</div>
					   </td>
					</tr>
				</tbody>
			</table>
		</div>
     
	</form>
	<iframe name="hiddenUp" id="hiddenUp" style="display: none;"></iframe>
	<t:form id="form_sel" reset="NOT" submit="NOT" caption="${i18n.cxtj}">
		<div class="youi-buttons" align="right">
	
			<table>
				<tbody>
					<tr>
					    <td>
					        <t:fieldLayout id="sel_term" prefix="sel" columns="3">
									<t:fieldSelect property="xuqly" caption="${i18n.xuqly}" convert="convertXqlyForChn" width="135"></t:fieldSelect>
									<t:fieldCalendar property="xuqbc" format="yyyy-MM-dd" caption="${i18n.xuqbc}" width="100" ></t:fieldCalendar>
									<t:fieldText property="xuh" caption="${i18n.bclsh}" width="100" maxLength="2" minLength="2"></t:fieldText>
							</t:fieldLayout>
					    </td>
						<td>
							<div class="youi-button active-0">
								<div class="right">
									<div class="center">
										<a href="#" onclick="query()"> ${i18n.cx} </a>
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
	<t:form id="form_maoxq" submit="NOT" reset="NOT">
		<t:grid id="grid_maoxq" caption="" scrollHeight="212"  src="/maoxq/queryMaoxq.ajax" idKeys="xuqbc,editor,edit_time" showNum="true" remove="NOT" edit="NOT"
			add="NOT" usePager="true" save="NOT" editAlias="maoxq" load="false" submit="NOT" reset="NOT" back="NOT" multiple="true" selectRowEvent="selectRow">
			<t:fieldLayout id="layout" prefix="record">
				<t:fieldHidden property="xuqbc"></t:fieldHidden>
				<t:fieldHidden property="bc"></t:fieldHidden>
				<t:fieldHidden property="xuqly"></t:fieldHidden>
			</t:fieldLayout>
			<t:gridCol property="chkbox" align="center" renderer="createChkbox" caption="${i18n.xz}"></t:gridCol>
			<t:gridCol property="jiz" align="center" renderer="createRadio" caption="${i18n.jz}"></t:gridCol>
			<t:gridCol property="xuqbc" type="link" caption="${i18n.xuqbc}"></t:gridCol>
			<t:gridCol property="xuqlx" type="text" caption="${i18n.xuqlx}"></t:gridCol>
			<t:gridCol property="xuqcfsj" type="text" caption="${i18n.xuqcfsj}"></t:gridCol>
			<t:gridCol property="xuqly" type="text" caption="${i18n.xuqly}" convert="convertXqlyForChn"></t:gridCol>
			<t:gridCol property="shengxbz" type="text" caption="${i18n.shengxbz}" convert="shengxbz"></t:gridCol>
			<t:gridCol property="shifjscmj" type="text" caption="${i18n.shifjscmj}" convert="shengxbz"></t:gridCol>
			<t:gridCol property="shifzdyssk" type="text" caption="${i18n.shifzdyssk}" convert="shengxbz"></t:gridCol>
			<t:gridCol property="beiz" type="text" caption="${i18n.beiz}" editor="fieldText" editorOptions="{openEvent:editComment,}"></t:gridCol>
		</t:grid>
		
       <table cellpadding="0" cellspacing="0">
              <tbody>
               <tr>
                      <td> 
                              <t:buttons id="btns2" >
					
								<t:button caption="${i18n.baoc}" name="save"></t:button>
					
								<t:button caption="${i18n.shanc}" name="delete"></t:button>
							</t:buttons>
                      </td>
	                 
	                  <td >
	                        <p>
							<input type="checkbox" name="shifzdyssk" value="1" /> ${i18n.sfzdyssk}&nbsp&nbsp&nbsp&nbsp <input type="checkbox" name="shifjscmj" value="1" /> ${i18n.shifjscmj}
							
							</p>				
	 
	                  </td>

               </tr>
               <tr>
                    <td>
	                      <t:fieldLayout id="bjfs" prefix="record">
					        <t:fieldSelect property="bjfs" caption="${i18n.bjfs}" convert="pattern" defaultValue="1" notNull="true" width="100"></t:fieldSelect>
				         </t:fieldLayout>  
	                  </td>
	                  <td>
	                        <t:fieldLayout   prefix="sk" id="yssk">
												<t:fieldCalendar property="from" caption="${i18n.gyzqfrom}" format="yyyyMM" width="100"></t:fieldCalendar>
												<t:fieldCalendar property="to" caption="${i18n.gyzqto}" format="yyyyMM" width="100"></t:fieldCalendar>
												
							</t:fieldLayout>
	                  </td>
               
               </tr>
               <tr>
                      <td>
	                      <t:buttons id="btns1">
								<t:button caption="${i18n.bjzq}" name="compareCyc"></t:button>
					
								<t:button caption="${i18n.bjz}" name="compareWeek"></t:button>
					
							</t:buttons>
	                  </td>
	                  <td>
	                      	<t:buttons id="bczd"><t:button caption="${i18n.baoczd}" name="appointTc"></t:button></t:buttons> 
	                      
	                  </td>

               </tr>
		        
			</tbody>
       
       </table>


	</t:form>
	<input  value="" style="display:none" id="oldBz"/>
	<div style="display: none;">
		<form id="compareForm" action="" method="POST"></form>
	</div>
	</t:panel>
</t:page>
<script type="text/javascript">
       $.sdcui.serverConfig.convertArray['codely']={'DIP':'DIP','DIS':'DIS','DKS':'DKS','CLV':'CLV','BJP':'BJP','WXP':'WXP','ZCJ':'ZCJ','ZCP':'ZCP','CYJ':'CYJ','CYP':'CYP'};
       $.sdcui.serverConfig.convertArray['pattern']={'0':'${i18n.anusercenter}','1':'${i18n.anchanx}'};
       $.sdcui.serverConfig.convertArray['shengxbz']={'0':'${i18n.no}','1':'${i18n.yes}'};
   
   /**
	*列渲染事件,创建Radio	
	*/
	function createRadio(){
		return "<input  name='jiz'  onclick ='radioClick()' type='radio' />";
	}
    
    function createChkbox(){
		return "<input  name='chkbox'  type='checkbox' />";
	}
    
    //修改备注之前
    function editComment(){
      
        var event = window.event || arguments.callee.caller.arguments[2];
		//var td = event.srcElement || event;
		var bz ;
		if(event.srcElement){
		   bz = event.srcElement.innerText;
		}else{
		   bz = event.record['beiz'];
		}
		if(typeof bz == 'undefined'){
		   bz = '';
		}else if(bz.indexOf('KD')!=-1){
		   bz= 'KD';
		}else if(bz.indexOf('AX')!=-1){
		   bz= 'AX';
		}else if(bz.indexOf('LX')!=-1){
		   bz= 'LX';
		}
		$("#oldBz").attr("value",bz);
		return true;
    }
    
   function selectRow(selectedIds,rowTr,selectedrecords,selectedrecord,cell,cols) {
		var checkbox = $(cell)[0];
		//var chk = $(rowTr).find("input[type='checkbox']");
		//var red = $(rowTr).find("input[type='radio']");
        if(checkbox.type == 'checkbox'){
			return true;
		}
		return false;
   }
	
	function callback(msg)

	{
        $("#button_impFrExc").removeClass("disabled");
		if(msg.indexOf('DKS')!=-1){
		   $("#dr_xuqbc").fieldValue(msg);
		   $("#record_xuqbc").fieldValue(msg);
		   alert("${i18n.drcg}");
		   $('#grid_maoxq').grid('reload');
		}else{
	        var  arr = msg.split(";");
	        var  str = arr.join("\n");
     		alert(str);
		}

	}

	/**
	 *指定运输时刻
	 *计算CMJ版本
	 */

	function func_button_appointTc() {
		var zdsk = document.getElementsByName("shifzdyssk")[0];
		var jscmj = document.getElementsByName("shifjscmj")[0];
		var record = $("#grid_maoxq").grid('getSelectedRecords');
		//指定运输时刻，from-to时间不能为空
		var skfrom = $("#sk_from").fieldValue();
		var skto = $("#sk_to").fieldValue();
		var skfw = [ 'DIP', 'ZCP', 'CYP' ];
		var cmjfw = [ 'DIP', 'ZCP', 'CYP', 'BJP', 'WXP' ];
		var param = [];
		if (record.length !=1) {
			alert("${i18n.qxzyzddmxq}");
			return false;
		}
		param = appiontParam(record, param);
		//如果两个都选择，判断需求来源是否超出范围

		if (jscmj.checked && zdsk.checked) {
			var ckfw = checkfw(record, skfw);
			if (!ckfw) {
				return false;
			}
			if (!cksk(skfrom, skto)) {
				return false;
			}
			param.push('shifzdyssk=' + zdsk.value);
			param.push('shifjscmj=' + jscmj.value);
			param.push('zdgyzqfrom=' + skfrom);
			param.push('zdgyzqto=' + skto);
		} else if (zdsk.checked) {
			if (!checkfw(record, skfw)) {
				return false;
			}
			if (!cksk(skfrom, skto))
				return false;
			param.push('shifzdyssk=' + zdsk.value);
			param.push('shifjscmj=' + '0');
			param.push('zdgyzqfrom=' + skfrom);
			param.push('zdgyzqto=' + skto);
		} else if (jscmj.checked) {
			for ( var i = 0, len = record.length; i < len; i++)
				for ( var j = 0, len1 = cmjfw.length; j < len1; j++) {
					var xuqly = record[i].xuqly;
					if (xuqly == cmjfw[j]) {
						break;
					} else {
						if (j == len1 - 1) {
							alert("${i18n.zdfw}");
							return false;
						}
						continue;
					}
				}
			param.push('shifzdyssk=' + '0');
			param.push('shifjscmj=' + jscmj.value);
		} else {
			alert("${i18n.qxzyzddxx}");
			return false;
		}

		//ajax请求       
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/maoxq/ifAppoint.ajax",
			data : param.join('&'),
			success : function(result) {
				alert(result.result);
				$('#grid_maoxq').grid('reload');
			}
		});

	}

	//指定运输时刻，from-to时间不能为空
	function cksk(skfrom, skto) {
		var strSk = /^\d{6}$/;
		if (skfrom.length == 0 || skto.length == 0) {
			alert("${i18n.qsrqsyjssj}");
			return false;
		} else if (!strSk.test(skfrom) || !strSk.test(skto)) {
			alert("${i18n.qsrzqdsjgs}");
			return false;
		}
		return true;
	}

	// 判断需求来源是否超出范围
	function checkfw(record, skfw) {
		for ( var i = 0, len = record.length; i < len; i++)
			for ( var j = 0, len1 = skfw.length; j < len1; j++) {
				var xuqly = record[i].xuqly;
				if (xuqly == skfw[j]) {
					break;
				} else {
					if (j == len1 - 1) {
						alert("${i18n.zdfw}");
						return false;
					}
					continue;
				}
			}
		return true;
	}

	//拼接参数
	function appiontParam(record, param) {
		for ( var i = 0, len = record.length; i < len; i++) {
			param.push('zd[' + i + '].xuqbc=' + record[i].xuqbc);
			param.push('zd[' + i + '].editor=' + record[i].editor);
			param.push('zd[' + i + '].edit_time=' + record[i].edit_time);
		}
		return param;
	}

	//var xmlHttpRequest;
	function impFrExc() {
		var form = document.forms["form_daorwj"];
		var file = form["file"];
		var fvalue = file.value;
		if (fvalue.length > 0) {
			// 寻找表单域中的 <input type="file" ... /> 标签
			if (fvalue.lastIndexOf('xls')==-1) {
				alert("${i18n.wjgsjy}");
				return false;
			}
			var bz = $("#dr_beiz").fieldValue();
			if(bz.indexOf('KD')==-1&&bz.indexOf('AX')==-1&&bz.indexOf('LX')==-1){
				alert('${i18n.drbeiz}');
				return ;
			} 
		    $("#dr_beiz").fieldValue(encodeURIComponent($("#dr_beiz").fieldValue()));
		    /*var id = 'youi_loading';
			var loading = $('#'+id);
			if(!loading.length){
				loading = $('<div class="youi-loading" id="'+id+'"/>').appendTo($('body',document));
			}*/
			form.submit();
            $("#button_impFrExc").addClass("disabled");
		} else {
			alert("${i18n.qsrydrdwj}");
			return false;
		}
       $("#dr_beiz").fieldValue(decodeURIComponent($("#dr_beiz").fieldValue()));

	}

	function createReqeust() {
		var req;
		if (window.ActiveXObject) {

			req = new ActiveXObject("Microsoft.XMLHTTP");
		} else {

			req = new XMLHttpRequest();
		}
		return req;
	}


	//点击radio
	function radioClick() {
		var radios = document.getElementsByName("jiz");
		var param = {};
		for ( var i = 0; i < radios.length; i++) {
			if (radios[i].checked == true) {
				//alert(radios[i]);
				var rowElemt = $(radios[i]).parent('td:first').parent('tr:first');
				var xuqbc = rowElemt.find('td:eq(2)').text();
				var xuqlx = rowElemt.find('td:eq(3)').text();
				var xuqly = rowElemt.find('td:eq(5)').text();
				param.xuqbc = xuqbc;
				param.xuqlx = xuqlx;
				param.xuqly = xuqly;
				//alert(xuqbc + xuqly); 
			}
		}
		return param;
	}

	/* $(function (){
	
		    $("input[name='xuh'].textInput").attr("style","width:20px;");
		    $("#form_sel td label[for='fieldText-sel2_xuh']").parent('td:first').attr("style","display:none;");
		    $("div#sel2_term  table:first").attr("width","550px");
		
	}) */

	//查询按钮
	function query() {
		var xuqbc = $("#sel_xuqbc").fieldValue();
		var xuqly = $("#sel_xuqly").fieldValue();
		var xuh = $("#sel_xuh").fieldValue();
		//验证时间格式
		var sj = /^\d{4}\-\d{2}\-\d{2}$/;
		//验证输入的流水号
		var str = /^\d{2}$/;
		if (xuqbc !== "") {
			if (!sj.test(xuqbc)) {
				alert("${i18n.sjgsjy}");
				return false;
			}
		} else if (xuh !== "") {
			if (!str.test(xuh)) {
				alert("${i18n.lshvalidate}");
				return false;
			}
		}
		var param = xuqbc.split("-");
		xuqbc = param.join("");
		xuqbc += xuh;
		$("#record_xuqbc").fieldValue(xuqbc);
		$("#record_xuqly").fieldValue(xuqly);
		//刷新列表
		$('#grid_maoxq').grid('reload');
	}

	//重置按钮
	function cancle() {
		$("#sel_xuqbc").fieldValue("");
		$("#sel_xuqly").fieldValue("");
		$("#sel_xuh").fieldValue("");
		$("#form_daorwj").fieldValue("");
	}
    
	//重置按钮
	function cancle2() {
		$("#dr_xuqbc").fieldValue("");
		$("#dr_beiz").fieldValue("");
		var objFile=document.getElementsByName('file')[0]; 
		objFile.outerHTML=objFile.outerHTML.replace(/(value=\").+\"/i,"$1\"");
	}
	
	/**
	 *链接点击事件
	 */
	function link_xuqbc(event) {
		var event = event || window.event;//原生态的事件处理 
		var element = event.srcElement || event.target;
		var rowDoc = $(element).parents('tr:first')[0];
		var record = $('#grid_maoxq').grid('getRecord', rowDoc);//获取当前行对应的记录
		var xuqlx = record.xuqlx;
		var params = [];
		
		if (xuqlx === "${i18n.cyc}") {
			record.xuqlx = 'Cyc';
			xuqlx='Cyc';
		} else if (xuqlx === "${i18n.week}") {
			record.xuqlx = 'Week';
			xuqlx='Week';
		} else {
			record.xuqlx = 'Days';
			xuqlx='Days';
		}
		params.push("xuqlx="+xuqlx);
		params.push("xuqbc="+record.xuqbc);
		params.push("shengxbz="+record.shengxbz);
		var data = params.join('&');
		/**
		 * form跳转模式提交
		$.sdcui.pageUtils.goPage({
			url : '/maoxq/initCwD.do',//url
			record : record,//
			mode : 'form',
			beforeSubmit : function() {
				//
				return true;
			}
		}); */
		winOpen = window.open ('${ctx}/maoxq/initCwD.do?removeId=layout-north,layout-west,layout-south&'+data,
				record.xuqbc,'top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no, status=no');
				winOpen.resizeTo(screen.availWidth,screen.availHeight);
		//window.showModalDialog ('${ctx}/maoxq/initCwD.do?removeId=layout-north,layout-west,layout-south&'+data,
		//window,
		//	"dialogHeight=490px;dialogWidth=700px;dialogTop=0px;dialogLeft=100px;center:yes;scroll:no;status:no;resizable:yes;location:no");
		
		/* event.stopPropagation();//阻止事件冒泡
		return false; */

		/* 			$.sdcui.pageUtils.goPage({
						url:'/maoxq/initWeek.do',//url
						record:record,//
						mode:'form',
						beforeSubmit:function(){
							//
							return true;
						}
					});
					event.stopPropagation();//阻止事件冒泡
					return false;
				
					$.sdcui.pageUtils.goPage({
						url:'/maoxq/initDays.do',//url
						record:record,//
						mode:'form',
						beforeSubmit:function(){
							//
							return true;
						}
					});
					event.stopPropagation();//阻止事件冒泡
					return false; */

	}

	function func_button_compareCyc() {
		var radioJz = radioClick();
		var jzbc = radioJz.xuqbc;
		var record = $('#grid_maoxq').grid('getSelectedRecords');//获取当前行对应的记录
		if (record.length != 2) {
			alert("${i18n.selectTwoRow}")
			return false;
		} else if (jzbc.length == 0) {
			alert("${i18n.oneJz}")
			return false;
		} else if (jzbc != record[0].xuqbc && jzbc != record[1].xuqbc) {
			alert("${i18n.twoRowSo}");
			return false;
		} else if (record[0].xuqlx !== "${i18n.cyc}" || record[1].xuqlx !== "${i18n.cyc}") {
			alert("${i18n.selecttwoCycCmp}");
			return false;
		}
		var xsfs = $("#record_bjfs").fieldValue();
		var param = {};
		
		var params = [];
		
		param.xuqbc = jzbc;
		param.xuqbc1 = record[1].xuqbc;
		if(record[1].xuqbc==jzbc){
			param.xuqbc1 = record[0].xuqbc;
		}
		param.xsfs = xsfs;
		param.xuqlx = "Cyc";
		
		if(record[1].xuqbc==jzbc){
			params.push("xuqbc1="+record[0].xuqbc);
		}else{
		    params.push("xuqbc1="+ record[1].xuqbc);
		}
		params.push("xuqbc="+jzbc);
		params.push("xsfs="+xsfs);
		params.push("xuqlx="+"Cyc");
		var data = params.join('&');
		/*$.sdcui.pageUtils.goPage({
			url : '/maoxq/comparePage.do',//url
			record : param,//
			mode : 'form',
			beforeSubmit : function() {
				//
				return true;
			}
		});*/
		
		
		//xss_0012943 
	    //是否有其他用户正在进行周期比较
		$.sdcui.ajaxUtil.ajax({
					url : '${ctx}/maoxq/maoxqSfbj.ajax', 
					success : function(result) {
						if ( result.flag !=null ) {
						 		 alert(result.flag); 
								 return false;
						}else{
				winOpen = window.open ('${ctx}/maoxq/comparePage.do?removeId=layout-north,layout-west,layout-south&'+data,
				'${i18n.maoxqBj}',
				'top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no, status=no'); 
				winOpen.resizeTo(screen.availWidth,screen.availHeight);
						}
					} 
		});	  
		
	

		return false;
		/*var params =[];
		params.push('xsfs=' + xsfs);
		params.push('xuqlx=' + "Cyc");
		params.push('xuqbc1=' + xuqbc);
		params.push('xsfs=' + param.xuqbc1);
		$.sdcui.ajaxUtil.ajax({
             url:"compareQr.ajax",//请求url
             data:params.join('&'),
            	success:function (result){
            	var fn = result.result;
            	    //回调函数后续操作
            	    window.location = "${ctx}/ppl/downLoadTxt.ajax?fileName="+fn+"&num="+time;
				}
           });*/

	}


		 	 
		 	 




	function func_button_compareWeek() {
		var radioJz = radioClick();
		var jzbc = radioJz.xuqbc;
		var record = $('#grid_maoxq').grid('getSelectedRecords');//获取当前行对应的记录
		if (record.length != 2) {
			alert("${i18n.selectTwoRow}")
			return false;
		} else if (jzbc.length == 0) {
			alert("${i18n.oneJz}")
			return false;
		} else if (jzbc != record[0].xuqbc && jzbc != record[1].xuqbc) {
			alert("${i18n.twoRowSo}");
			return false;
		} else if (record[1].xuqly!=record[0].xuqly || record[0].xuqlx !== "${i18n.week}" || record[1].xuqlx !== "${i18n.week}") {
			alert("${i18n.selecttworowWeekCompare}");
			return false;
		}
		var xsfs = $("#record_bjfs").fieldValue();
		var param = {};
		/*param.push("xuqbc="+jzbc);
		param.push("xuqbc1="+record[1].xuqbc);
		param.push("xsfs="+xsfs);
		param.push("xuqlx="+'Week');
		var data = param.join("&");
		var url = "${ctx}/maoxq/comparePage.do?"+data;
		$("#compareForm")[0].action = url;
		$("#compareForm").submit(); */
		param.xuqbc = jzbc;
		param.xuqbc1 = record[1].xuqbc;
		if(record[1].xuqbc==jzbc){
			param.xuqbc1 = record[0].xuqbc;
		}
		param.xsfs = xsfs;
		param.xuqlx = "Week";
		
		var params = [];
		if(record[1].xuqbc==jzbc){
			params.push("xuqbc1="+record[0].xuqbc);
		}else{
		    params.push("xuqbc1="+ record[1].xuqbc);
		}
		params.push("xuqbc="+jzbc);
		params.push("xsfs="+xsfs);
		params.push("xuqlx="+"Week");
		var data = params.join('&');
		/*$.sdcui.pageUtils.goPage({
			url : '/maoxq/comparePage.do',//url
			record : param,//
			mode : 'form',
			beforeSubmit : function() {
				//
				return true;
			}
		});*/
		winOpen = window.open ('${ctx}/maoxq/comparePage.do?removeId=layout-north,layout-west,layout-south&'+data,
		'${i18n.maoxqBj}',
		'top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no, status=no');
		winOpen.resizeTo(screen.availWidth,screen.availHeight);
		return false;
	}

	function func_button_save() {
		//获得选中行参数
		var param = $('#grid_maoxq').grid('getSelectedRecords');
		var length = param.length;
		if (length < 1) {
			alert("${i18n.saveonerow}");
			return false;
		}
		var maoxq = [];
		for ( var i = 0; i < length; i++) {
			maoxq.push('edit[' + i + '].xuqbc=' + param[i].xuqbc);
			var beiz = typeof(param[i].beiz)=='undefined'?'':param[i].beiz;
			var prefixbz = $("#oldBz").attr("value");
			if(beiz.indexOf(prefixbz)!=-1){
			   prefixbz= '';
			}
			beiz = prefixbz+beiz;
			var shengxbz = param[i].shengxbz;
			if(shengxbz==='1'){
				alert("${i18n.sxnotedit}");
				return false;
			}else if (beiz.length > 100) {
				alert("${i18n.commentlengthistoolong}");
				return false;
			}
			maoxq.push('edit[' + i + '].beiz=' + beiz);
			maoxq.push('edit[' + i + '].editor=' + param[i].editor);
			maoxq.push('edit[' + i + '].edit_time=' + param[i].edit_time);
		}
		//修改ajax请求       
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/maoxq/update.ajax",
			data : maoxq.join('&'),
			success : function(result) {
				alert(result.result);
				$('#grid_maoxq').grid('reload');
			}
		});
	}

	function func_button_delete() {
		//获得选中行参数
		var param = $('#grid_maoxq').grid('getSelectedRecords');
		var length = param.length;
		if (length < 1) {
			alert("${i18n.deleteonerow}");
			return false;
		}
		var maoxq = [];
		for ( var i = 0; i < length; i++) {
			maoxq.push('edit[' + i + '].xuqbc=' + param[i].xuqbc);
			var shengxbz = param[i].shengxbz;
			if(shengxbz==='1'){
				alert("${i18n.sxnotdelete}");
				return false;
			}
			maoxq.push('edit[' + i + '].editor=' + param[i].editor);
			maoxq.push('edit[' + i + '].edit_time=' + param[i].edit_time);
		}
		//修改ajax请求       
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/maoxq/delete.ajax",
			data : maoxq.join('&'),
			success : function(result) {
				alert(result.result);
				$('#grid_maoxq').grid('reload');
			}
		});
	}
</script>
<style type="text/css">
 #yssk td.contral.label-col.col-0{width:100px;}
 
</style>
</t:html>