<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="role" value="${role}"/>

<t:html title="${i18n.lingjck}">

<!-- 
	 零件仓库
	 @author denggq
	 @date 2012-4-16
 -->
 
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<style type="text/css"> 
		div.showDivMessage {
	position: absolute;
	
	background-color: #FFFFFF;
	opacity:0.70; 
	filter:alpha(opacity=100); 
}
		.youi-fieldLayout table td.contral.label-col {     width: 110px; } </style>
	</head>
	<t:page i18n="i18n.ckx.xuqjs.i18n_lingjck">
		<t:grid id="grid_lingjck" caption="${i18n.lingjck}" idKeys="cangkbh,usercenter,lingjbh" load="false" back="NOT" scrollHeight="292" pageSize="15"
			src="/xuqjs/queryLingjck.ajax" remove="NOT" showCheckbox="true" dataFormId="form_lingjck" editable="NOT" showNum="true">
			<t:fieldLayout id="layout" prefix="lingjck" columns="3" >
				<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" width="150" defaultValue="${usercenter }"/>
				<t:fieldText property="lingjbh" caption="${i18n.lingjbh}" maxLength="10" minLength="10" dataType="text" width="150"/>
				<t:fieldText property="cangkbh" caption="${i18n.cangkbh}" maxLength="3" minLength="3" dataType="text" width="150"/>
				<t:fieldText property="zickbh" caption="${i18n.zickbh}" maxLength="3" minLength="3" dataType="text" width="150"/>
				<t:fieldText property="xiehztbh" caption="${i18n.xiehztbh}" maxLength="6" dataType="text" width="150"/>
				<t:fieldText property="danqkbh" caption="${i18n.danqkbh}" maxLength="3" dataType="text" width="150"/>
			</t:fieldLayout>
			
			<t:button caption="${i18n.export}" name="download"></t:button>
			<t:button caption="${i18n.baoz}" name="baoz" active="0" />
			<c:if test="${zbczxc }">
				<t:button caption="模板下载" name="mobxz" active="0"/>
			</c:if>
			<%-- 增加复选框后修改删除功能  lc 2016.10.24 --%>
			<t:button caption="删除" name="remove" active="0" icon="removeRecord"/>
			<%-- 导入定置库位  csy 2016.11.07 --%>
			<c:if test="${!zbczxc }">
				<t:button caption="定置库位导入模板下载" name="dingzkwdrmb" active="0"/>
			</c:if>
			
			<t:gridCol property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" width="70"/>
			<t:gridCol property="lingjbh" caption="${i18n.lingjbh}" />
			<t:gridCol property="cangkbh" caption="${i18n.cangkbh}" />
			<t:gridCol property="zickbh" caption="${i18n.zickbh}" />
			<t:gridCol property="xiehztbh" caption="${i18n.xiehztbh}" width="90" />
			<t:gridCol property="anqkcts" caption="${i18n.anqkcts}" width="90" />
			<t:gridCol property="anqkcsl" caption="${i18n.anqkcsl}"  width="90" />
			<t:gridCol property="zuidkcts" caption="${i18n.zuidkcts}" width="90" />
			<t:gridCol property="zuidkcsl" caption="${i18n.zuidkcsl}" width="90" />
			<t:gridCol property="zuixqdl" caption="${i18n.zuixqdl}" width="110" />
			<t:gridCol property="dingdbdzl" caption="${i18n.dingdbdzl}" width="90" />
			<t:gridCol property="dingdzzzl" caption="${i18n.dingdzzzl}" width="90" />
			<t:gridCol property="yijfzl" caption="${i18n.yijfzl}" width="80" />
			<t:gridCol property="xittzz" caption="${i18n.xittzz}" width="75" />
			<t:gridCol property="danqkbh" caption="${i18n.danqkbh}" width="80" />
			<t:gridCol property="danqkw" caption="${i18n.danqkw}" width="85" />
			<t:gridCol property="zuidsx" caption="${i18n.zuidsx}" width="180" />
			<t:gridCol property="zuixxx" caption="${i18n.zuixxx}" width="180" />
			<t:gridCol property="jistzz" caption="${i18n.jistzz}" width="90" />
			<t:gridCol property="shifxlh" caption="${i18n.shifxlh}" width="110" convert="zidfhbz"/>
			<t:gridCol property="beiykbh" caption="${i18n.beiykbh}" width="100" />
			<t:gridCol property="dingzkw" caption="${i18n.dingzkw}" width="70" />
			<t:gridCol property="fifo" caption="${i18n.fifo}" width="40" convert="fifo"/>
			<t:gridCol property="zidfhbz" caption="${i18n.zidfhbz}" width="90" convert="zidfhbz"/>
			<t:gridCol property="yuanckbh" caption="${i18n.yuanckbh}" width="90" />
			<t:gridCol property="zuh" caption="组号" width="90" />
			<t:gridCol property="editor" caption="修改人" width="90" />
			<t:gridCol property="edit_time" caption="修改时间" width="150" />
			<t:gridCol property="" caption="" width="20"/>
			<%-- 增加复选框后修改仓库替换功能  lc 2016.10.24 --%>
			<t:button caption="仓库替换" name="cangkth" active="1"></t:button>
		</t:grid>
		
		<c:if test="${zbczxc }">
			<t:file action="/xuqjs/importAth_uploadLingjck.do" size="50">
				<t:fileparam sheet="ckxlingj" keys="USERCENTER,LINGJBH,CANGKBH" table="{dbSchemal3}CKX_LINGJCK" datasourceId="1"/>
			</t:file>
		</c:if>
		
		<c:if test="${!zbczxc }">
			<form id="form_importdzkw_xls" target="_self" enctype="multipart/form-data" action="/athena/xuqjs/importAth_uploadDingzkw.do" method="post" name="form_importdzkw_xls">
			<table>
				<tbody>
					<tr>
						<td>
							<input id="fileNamedzkw_xls" type="file" size="50" name="fileNamedzkw_xls">
						</td>
						<td>
							<div id="button_submitxhgm_upload" class="youi-button active-0">
								<div class="right">
									<div class="center">
										<a class="submit" onclick="form_subimtxhgm()" href="#">定置库位导入</a>
									</div>
								</div>
							</div>
						</td>
				   </tr>
				</tbody>
			</table>
			<script type="text/javascript">
			function form_subimtxhgm(){ 
				var formEle = document.getElementById("form_importdzkw_xls"); 
				if($("#fileNamedzkw_xls").val()==null || ""==$("#fileNamedzkw_xls").val())
				{ 
					alert("上传文件不能为空."); 
					return false; 
				}else{ 
					window.down_showLoading();
					formEle.submit(); 
				} 
			} 
			$(document).ready(function(){window.down_hideLoading();var a = "null"; a = "${requestScope.uploudmessage}"; if(a!='null'&&a!='') { a = a.replace(/@/g,'\n');alert(a);}});
			</script>
			<input id="import_hidd_comfig" type="hidden" value="[{'sheet':'dingzkwdr','datasourceId':'1','table':'{dbSchemal3}CKX_LINGJCK','keys':'USERCENTER,LINGJBH,CANGKBH','dateColumns':'null','dateFormats':'yyyy-MM-dd','clazz':'null'}]" name="import_hidd_comfig">
			<div><font color="red">导入结果不能大于5000条,否则为空</font></div>
			</form>
		</c:if>
	</t:page>
	<t:form dialog="true" caption="零件仓库" idKeys="cangkbh,usercenter,lingjbh"  id="form_lingjck" action="/xuqjs/saveLingjck.ajax" width="720"  reset="NOT">
		<t:fieldLayout prefix="record" columns="3">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" notNull="true" defaultValue="${usercenter }" width="110" />
			<t:fieldText property="lingjbh" caption="${i18n.lingjbh}" maxLength="10" minLength="10" dataType="text" notNull="true" width="110" />
			<t:fieldText property="cangkbh" caption="${i18n.cangkbh}" maxLength="3" minLength="3" dataType="text" notNull="true" width="110" />
			<t:fieldText property="zickbh" caption="${i18n.zickbh}" maxLength="3" minLength="3" dataType="text"  notNull="true" width="110" />
			<t:fieldText property="xiehztbh" caption="${i18n.xiehztbh}" width="110" readonly="true"/>
			<t:fieldText property="anqkcts" caption="${i18n.anqkcts}" expression="^[1-9][0-9]{0,2}(?:\.[0-9]{1,2})?$|0\.[0-9]{1,2}$|^0$"
					expressionMessage="${i18n.anqkcts_ex_mes}"  width="110"  />
			<t:fieldText property="anqkcsl" caption="${i18n.anqkcsl}"  expression="^[1-9][0-9]{0,5}$|^0$" expressionMessage="${i18n.anqkcsl_ex_mes}" width="110" />
			<t:fieldText property="zuidkcts" caption="${i18n.zuidkcts}" expression="^[1-9][0-9]{0,2}(?:\.[0-9]{1,2})?$|0\.[0-9]{1,2}$|^0$"
					expressionMessage="${i18n.zuidkcts_ex_mes}"  width="110" />
			<t:fieldText property="zuidkcsl" caption="${i18n.zuidkcsl}" expression="^[1-9][0-9]{0,5}$|^0$" expressionMessage="${i18n.zuidkcsl_ex_mes}"   width="110" />
			<t:fieldText property="zuixqdl" caption="${i18n.zuixqdl}" expression="^[1-9][0-9]{0,6}(?:\.[0-9]{1,3})?$|0\.[0-9]{1,3}$|^0$"
					expressionMessage="${i18n.zuixqdl_ex_mes}"  width="110" />
			<t:fieldText property="dingdbdzl" caption="${i18n.dingdbdzl}" readonly="true"  width="110" />
			<t:fieldText property="dingdzzzl" caption="${i18n.dingdzzzl}" readonly="true" width="110" />
			<t:fieldText property="yijfzl" caption="${i18n.yijfzl}" readonly="true"  width="110" />
			<t:fieldText property="xittzz" caption="${i18n.xittzz}" readonly="true" width="110" />
			<t:fieldText property="jistzz" caption="${i18n.jistzz}" expression="^[-]{0,1}[1-9][0-9]{0,6}(?:\.[0-9]{1,3})?$|0\.[0-9]{1,3}$|^0$"
					expressionMessage="请输入-9999999.999 至  9999999.999 之间的数字"  width="110" />
			<t:fieldSelect property="shifxlh" caption="${i18n.shifxlh}" convert="zidfhbz" width="110" />
			<t:fieldSelect property="fifo" caption="${i18n.fifo}" convert="fifo" width="110" />
			<t:fieldSelect property="zidfhbz" caption="${i18n.zidfhbz}" convert="zidfhbz" width="110" />
			
			<t:fieldText property="danqkbh" caption="${i18n.danqkbh}" maxLength="3" minLength="3" dataType="text"  width="110" />
			<t:fieldText property="danqkw" caption="${i18n.danqkw}" maxLength="6" minLength="6" dataType="text" width="110"  />
			<t:fieldText property="zuidsx" caption="${i18n.zuidsx}" expression="^([1-9][0-9]{0,3})$|^0$" expressionMessage="${i18n.zuidsx_ex_mes}"   width="110" />
			<t:fieldText property="zuixxx" caption="${i18n.zuixxx}" expression="^([1-9][0-9]{0,3})$|^0$" expressionMessage="${i18n.zuixxx_ex_mes}"  width="110"  />
			<t:fieldText property="beiykbh" caption="${i18n.beiykbh}" maxLength="3" minLength="3" dataType="text" width="110" />
			<t:fieldText property="dingzkw" caption="${i18n.dingzkw}" maxLength="6" minLength="6" dataType="text"  width="110"/>
			<t:fieldText property="zuh" caption="组号" width="110"  />
			
		</t:fieldLayout>
	</t:form>
	<t:form dialog="true" caption="零件仓库替换" idKeys="cangkbh,usercenter,lingjbh"  id="form_lingjckReplace" action="/xuqjs/saveLingjck.ajax" width="720"  reset="NOT">
		<t:fieldLayout prefix="recordReplace" columns="2">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" notNull="true" defaultValue="${usercenter }" width="110" />
			<t:fieldText property="lingjbh" caption="${i18n.lingjbh}" maxLength="10" minLength="10" dataType="text" notNull="true" width="110" />
			<t:fieldText property="cangkbh" column="2" caption="${i18n.yuanckbh}" maxLength="3" minLength="3" dataType="text" notNull="true" width="110" />
			<t:fieldText property="yuanckbh" caption="新${i18n.cangkbh}" maxLength="3" minLength="3" dataType="text" notNull="true" width="110" />
			<t:fieldText property="zickbh" caption="${i18n.zickbh}" maxLength="3" minLength="3" dataType="text"  notNull="true" width="110" />
			
			
		</t:fieldLayout>
	</t:form>
	
	<script type="text/javascript">
	
	//导出定置库位模板
		function func_button_dingzkwdrmb(){
			
			$.sdcui.pageUtils.goPage({
				url : '../xuqjs/downloadDingzkwMob.do',
				mode : 'form',
				beforeSubmit : function(){
					return true;
				}
		   });
		}

	function func_button_cangkth(){
		
		$('#form_lingjckReplace').form("clear");//清除弹出窗口的数据
		$('#form_lingjckReplace').removeClass('operant-add');
		var record = $("#grid_lingjck").grid("getSelectedRecords")[0];//选中的行的数据
		record.zickbh = '';
		record.yuanckbh = '';
		$('#form_lingjckReplace').form('fillRecord', $.extend({}, record));
		$("#form_lingjckReplace").form("open","");
		
	}
	function form_lingjckReplace_beforeSubmit(){
		var usercenter = $("#recordReplace_usercenter").fieldValue();
		var lingjbh = $("#recordReplace_lingjbh").fieldValue();
		var yuanckbh = $("#recordReplace_yuanckbh").fieldValue();
		var cangkbh = $("#recordReplace_cangkbh").fieldValue();
		if(cangkbh == yuanckbh){
			alert("原仓库和新仓库不能相同");
			return false;
		}
		$.sdcui.ajaxUtil.ajax({
            url:"../xuqjs/getLingjck.ajax?usercenter="+usercenter+"&lingjbh="+lingjbh+"&cangkbh="+yuanckbh+"",// 请求url
           	success:function (result){
           		
   				var zickbh = $("#recordReplace_zickbh").fieldValue();
           		if(result.result == null){
           			if(!confirm("该操作为仓库替换，是否继续？")){           				
           				return false;
           			}  					
           		}else{
           			if(!confirm("零件与新仓库关系已存在！\u000d该操作为仓库合并，是否继续？")){
           				return false;
           			}
           		}
           		replaceSubmit(usercenter,lingjbh,cangkbh,yuanckbh,zickbh);
			}
     	});				
		return false;
	}
	function replaceSubmit(usercenter,lingjbh,cangkbh,yuanckbh,zickbh){
		$.sdcui.ajaxUtil.ajax({
            url:"../xuqjs/replaceLingjck.ajax?usercenter="+usercenter+"&lingjbh="+lingjbh+"&cangkbh="+yuanckbh+"&yuanckbh="+cangkbh+"&zickbh="+zickbh,// 请求url
           	success:function (result){
           		if(typeof result.success=="undefined"||result.success!==false){
        			$("#form_lingjckReplace").form("close");
        			$("#grid_lingjck").grid("reload");
        		}
        		return false;		
           	}
		});
	}
	function showDivMessage(){
		var wwidth = $(window).width();
		var wheight = $(window).height();
		var divParam = {width:wwidth,
			     height:wheight,
			     left:0,
				 top:0	,
				 zIndex: 1001};
		$("#showDivMessage").css(divParam);	
	}
		//是否回收
		$.sdcui.serverConfig.convertArray['fifo'] = {
			'Y' : 'Y',
			'N' : 'N'
		};
		
		//是否自动发送
		$.sdcui.serverConfig.convertArray['zidfhbz'] = {
			'1' : '${i18n.yes}',
			'0' : '${i18n.no}'
		};
		
		
		//空格查询
		function grid_lingjck_beforeSubmit() {
			$("#lingjck_lingjbh").fieldValue(trim($("#lingjck_lingjbh").fieldValue()));
			$("#lingjck_cangkbh").fieldValue(trim($("#lingjck_cangkbh").fieldValue()));
			$("#lingjck_zickbh").fieldValue(trim($("#lingjck_zickbh").fieldValue()));
			$("#lingjck_xiehztbh").fieldValue(trim($("#lingjck_xiehztbh").fieldValue()));
		}
		
		//填写单取库编号失去焦点事件
		$(function() {
			$('#record_danqkbh')
					.bind(
							'focusout',
							function() {
								var danqkbh = $('#record_danqkbh').fieldValue();
								var danqkbhStr = danqkbh.substr(2,1);
								//单取库编号不为空 并且 单取库编号只能为 P
								if(""!==danqkbhStr&&"P"!=danqkbhStr){
									 alert("单取库编号只能为P");
									 $('#record_danqkbh').fieldValue("");
									 return false;
								}
							})
		})
		
		//填写子仓库编号失去焦点事件
		$(function() {
			$('#record_zickbh')
					.bind(
							'focusout',
							function() {
								//var errorMessage = [];
								var currentRole = "${role}"; 
								var zickbh = $('#record_zickbh').fieldValue();
								var zickbhStr = zickbh.substr(2,1);
								var td = $("label#fieldText-record_dingzkw").parent("td:first");
								//子仓库为B 的时候  不能设置定置库位
								if ("ZXCPOA"==currentRole&&"B"==zickbhStr) {
									$(td).removeClass("notNull");
									$('#record_dingzkw').fieldValue("");
									//$('#record_dingzkw').removeAttr("class","youi-field fieldText validate-error");
									$('#record_dingzkw').addClass("disabled").find(".textInput").attr("readonly","true");
									$('#record_dingzkw').addClass("disabled").addClass('readonly');
								}
								if("ZXCPOA"==currentRole&&"D"==zickbhStr){
									 $(td).removeClass("notNull");
									 //$('#record_dingzkw').removeAttr("class","youi-field fieldText validate-error");
									 $('#record_dingzkw').removeClass("disabled").removeClass('readonly');
									 $('#record_dingzkw').removeClass("disabled").find(".textInput").removeAttr("readonly","false");
								}
								//子仓库为P 的时候 提示不能设置 并清除
								if("ZXCPOA"==currentRole&&"P"==zickbhStr){
							        $(td).removeClass("notNull");
							        $('#record_dingzkw').removeClass("disabled").removeClass('readonly');
									$('#record_dingzkw').removeClass("disabled").find(".textInput").removeAttr("readonly","false");
							        //$('#record_dingzkw').removeAttr("class","youi-field fieldText validate-error");
							        alert("子仓库类型不能为P");
							      	$('#record_zickbh').fieldValue("");
							        return false;
							      }
								
								//子仓库为S 的时候  必须设置定置库位
								if("ZXCPOA"==currentRole&&"S"==zickbhStr){
							        $(td).addClass("notNull");
							        $('#record_dingzkw').removeClass("disabled").removeClass('readonly');
									$('#record_dingzkw').removeClass("disabled").find(".textInput").removeAttr("readonly","false");
							        if($(td).hasClass("notNull")&&$("#record_dingzkw").fieldValue()==""){
								        	$('#record_dingzkw').attr("class","youi-field fieldText validate-error");
											//alert("【定置库位】不能为空");mantis 5580
											return false;
								  		}	
							      }
// 								if(errorMessage.length!=0){
// 								   	alert(errorMessage.join('\n'));
// 								    return false;
// 								}
							})
		})
		
		
		//空格查询
		function grid_lingjck_afterSubmit(message) {
			alert(message);
		}
		/*
		*@description 设置包装
		*@date 2012-4-16
		*@author denggq
		*/
		function func_button_baoz(){
			var record = $("#grid_lingjck").grid("getSelectedRecords");
			//增加复选框后修改设置包装功能  lc 2016.10.24
			if(record.length > 1){
		 		alert("请至多选择一条记录");
		 		return false;
		    }else if(undefined == record||''==record){
				$.sdcui.pageUtils.goPage({
					url:'/xuqjs/lingjgcb.do',//url
					mode:'form',
					beforeSubmit:function(){
						return true;
					}
				});
			}else{
				$.sdcui.pageUtils.goPage({
					url:'/xuqjs/lingjgcb.do',//url
					record : {'lingjbh':record[0].lingjbh},
					mode:'form',
					beforeSubmit:function(){
						return true;
					}
				});
			}
			
		}
		
		function func_button_edit(){
			$('#form_lingjck').form("clear");//清除弹出窗口的数据
			$('#form_lingjck').removeClass('operant-add');
			//增加用户中心锁
// 			$("#record_usercenter").addClass('youi-field fieldSelect readonly');
			
			var currentRole = "${role}"; 
			var td = $("label#fieldText-record_dingzkw").parent("td:first");
			$(td).removeClass("notNull");
			$('#record_dingzkw').removeClass("disabled").removeClass('readonly');
			$('#record_dingzkw').removeClass("disabled").find(".textInput").removeAttr("readonly","false");
			$('#form_lingjck').removeClass('operant-add');//增加的operant为1，修改的operant为2
			
			var record = $("#grid_lingjck").grid("getSelectedRecords")[0];//选中的行的数据
			$('#form_lingjck').form('fillRecord', $.extend({}, record));
			
			$("#form_lingjck").form("open","${i18n.edit}");
			//var zickbh = $('#record_zickbh').fieldValue();
			var zickbhStr = record.zickbh.substr(2,1);
			//子仓库为B 的时候  不能设置定置库位
			if ("ZXCPOA"==currentRole&&"B"==zickbhStr) {
				$(td).removeClass("notNull");
				$('#record_dingzkw').fieldValue("");
				//$('#record_dingzkw').removeAttr("class","youi-field fieldText validate-error");
				$('#record_dingzkw').addClass("disabled").find(".textInput").attr("readonly","true");
				$('#record_dingzkw').addClass("disabled").addClass('readonly');
			}
			//子仓库为S 的时候  必须设置定置库位
			if("ZXCPOA"==currentRole&&"S"==zickbhStr){
		        $(td).addClass("notNull");
		        $('#record_dingzkw').removeClass("disabled").removeClass('readonly');
				$('#record_dingzkw').removeClass("disabled").find(".textInput").removeAttr("readonly","false");
		        if($(td).hasClass("notNull")&&$("#record_dingzkw").fieldValue()==""){
			        	$('#record_dingzkw').attr("class","youi-field fieldText validate-error");
						alert("【定置库位】不能为空");
						return false;
			  		}	
		      }
			
		}
		
// 		function func_button_add(){
// 			$('#form_lingjck').form("clear");//清除弹出窗口的数据
// 			$('#form_lingjck').addClass('operant-add');
// 			解除用户中心锁
// 			$("#record_usercenter").removeClass('youi-field fieldSelect readonly');
// 			$("#record_usercenter").addClass('youi-field fieldSelect');
// 			$('#record_usercenter input:first').removeAttr("disabled");
// 			$('#record_lingjbh input:first').removeAttr("disabled");
// 			$('#record_cangkbh input:first').removeAttr("disabled");
// 			var td = $("label#fieldText-record_dingzkw").parent("td:first");
// 			$(td).removeClass("notNull");
// 			$('#record_dingzkw').removeClass("disabled").removeClass('readonly');
// 			$('#record_dingzkw').removeClass("disabled").find(".textInput").removeAttr("readonly","false");
// 			$("#form_lingjck").form("open","${i18n.add}");	
// 		}
		
		//导出数据
		function func_button_download(){
			
			var usercenter = trim($('#lingjck_usercenter').fieldValue());
			var lingjbh = trim($("#lingjck_lingjbh").fieldValue());
			var cangkbh = trim($('#lingjck_cangkbh').fieldValue());
			var zickbh = $('#lingjck_zickbh').fieldValue();
			var xiehztbh = $('#lingjck_xiehztbh').fieldValue();
			
			var record = {'usercenter':usercenter,'lingjbh':lingjbh,'cangkbh':cangkbh,'zickbh':zickbh,'xiehztbh':xiehztbh};
			
			$.sdcui.pageUtils.goPage({
				url : '../xuqjs/downloadLingjck.do',
				record : record,
				mode : 'form',
				beforeSubmit : function(){
					return true;
				}
		   });
		}
		
		//页面初始化
		function initPage(){
			
			//控制权限
			var currentRole = "${role}";
			var params = [{'name':'record_usercenter',	'roles':'JIHUAY,PCJIHY'},
			              {'name':'record_lingjbh',		'roles':'JIHUAY,PCJIHY'},
			              {'name':'record_cangkbh',		'roles':'JIHUAY,PCJIHY'},
			              {'name':'record_zickbh',		'roles':'JIHUAY,PCJIHY'},
			              {'name':'record_anqkcts',		'roles':'ZXCPOA'},
			              {'name':'record_anqkcsl',		'roles':'ZXCPOA'},
			              {'name':'record_zuidkcts',	'roles':'ZXCPOA'},
			              {'name':'record_zuidkcsl',	'roles':'ZXCPOA'},
			              {'name':'record_zuixqdl',		'roles':'WULGYY,ZXCPOA,PCJIHY'},
			              //以下字段只读
			              {'name':'record_xiehztbh',	'roles':'JIHUAY,PCJIHY'},
			              {'name':'record_dingdbdzl',	'roles':'ZXCPOA,WULGYY,JIHUAY,ZBCPOA,PCJIHY'},
			              {'name':'record_dingdzzzl',	'roles':'ZXCPOA,WULGYY,JIHUAY,ZBCPOA,PCJIHY'},
			              {'name':'record_yijfzl',		'roles':'ZXCPOA,WULGYY,JIHUAY,ZBCPOA,PCJIHY'},
			              {'name':'record_xittzz',		'roles':'ZXCPOA,WULGYY,PCJIHY'},
			            //以上字段只读
			              {'name':'record_jistzz',		'roles':'WULGYY,ZXCPOA,PCJIHY'},
			             // {'name':'record_shifxlh',		'roles':''},
			              {'name':'record_fifo',		'roles':'WULGYY,ZBCPOA,PCJIHY,JIHUAY'},
			              {'name':'record_zuh',			'roles':'PCJIHY'},
			              {'name':'record_zidfhbz',		'roles':'ZXCPOA,PCJIHY'},
			              {'name':'record_yuanckbh',	'roles':'JIHUAY,PCJIHY'},
			              {'name':'record_danqkbh',		'roles':'WULGYY,ZBCPOA,JIHUAY,PCJIHY'},
			              {'name':'record_danqkw',		'roles':'WULGYY,ZBCPOA,JIHUAY,PCJIHY'},
			              {'name':'record_zuidsx',		'roles':'WULGYY,ZBCPOA,JIHUAY,PCJIHY'},
			              {'name':'record_zuixxx',		'roles':'WULGYY,ZBCPOA,JIHUAY,PCJIHY'},
			              {'name':'record_beiykbh',		'roles':'WULGYY,ZBCPOA,JIHUAY,PCJIHY'},
			              {'name':'record_dingzkw',		'roles':'WULGYY,ZBCPOA,JIHUAY,PCJIHY'}
			              ];
			
			setDisabled(params,currentRole);
// 			var td = $("label#fieldText-record_dingzkw").parent("td:first");
// 			if("ZBCPOA"==currentRole){
// 				$('#record_dingzkw').addClass("disabled").find(".textInput").attr("readonly","true");
// 				$('#record_dingzkw').addClass("disabled").addClass('readonly');
// 			}
		} 
		
		//导出模板
		function func_button_mobxz(){
			
			$.sdcui.pageUtils.goPage({
				url : '../xuqjs/downloadLingjckdMob.do',
				mode : 'form',
				beforeSubmit : function(){
					return true;
				}
		   });
		}
		
		//删除  lc 2016.10.24
		function func_button_remove(){
			 var roles = $('#grid_lingjck').grid('getSelectedRecords');
			 if(roles.length==0){
				 alert("请至少选择一条记录");
				 return false;			 		
			 }
			 var params = [];
			 for(var i = 0 ; i < roles.length ; i++ ){
				 params.push("list["+i+"].usercenter="+roles[i].usercenter);
				 params.push("list["+i+"].lingjbh="+roles[i].lingjbh);
				 params.push("list["+i+"].cangkbh="+roles[i].cangkbh);
			 }
			 if(confirm("确认删除选中记录?")){
				 $.sdcui.ajaxUtil.ajax({
						url:'removeLingjck.ajax',
						data:params.join('&'),
						success:function(result){
							if(typeof result.success=="undefined"||result.success!==false){
								$("#grid_lingjck").grid('reload');
							}
						}
					});
			 }			 
		}
	</script>
</t:html>











