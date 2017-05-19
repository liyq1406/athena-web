<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<link type="text/css" rel="stylesheet" 
			href="<c:url value="/styles/authority/role.css"/>"/>
	</head>
	<t:page  i18n="i18n.xqjs.laxjh.kaixjhmx">
		<t:grid id="grid_kaixjhmx" 
			idKeys="usercenter,kaixjhNo,id,tcNo"
			caption="${i18n.title_index }" 
			src="queryKaixjhmx.ajax"
			add="NOT"
			edit="NOT"
			removeSrc="editKaixjhmx.ajax"  back="NOT"  showNum="true">
			<t:button name="expxls" caption="${i18n.expxls }" active="3"/>
			<t:fieldLayout columns="4" prefix="select">
				<t:fieldText property="tcNo" width="100" caption="${i18n.tcNo }" maxLength="17"></t:fieldText>
				<t:fieldSelect property="dinghcj" width="100" caption="${i18n.dinghcj }"><t:fieldOption value="UW5" text="${i18n.UW5 }"></t:fieldOption>
				<t:fieldOption value="UW2" text="${i18n.UW2 }"></t:fieldOption>
				</t:fieldSelect>
				<t:fieldCalendar property="qiysj" width="100" caption="${i18n.qiysj }" format="yyyy-MM-dd"></t:fieldCalendar>
				<t:fieldCalendar property="kaixzdsj" width="100" caption="${i18n.kaixzdsj }" format="yyyy-MM-dd"></t:fieldCalendar>
				<t:fieldHidden property="usercenter" defaultValue="${usercenter }"></t:fieldHidden>
				<t:fieldHidden property="kaixjhh"  defaultValue="${jihNo }"></t:fieldHidden>
				<t:button caption="${i18n.addRecord }" name="addRecord" icon="addRecord"></t:button>
			</t:fieldLayout>
			<t:gridCol property="tcNo" width="100" caption="${i18n.tcNo }" type="link"/>
			<t:gridCol property="dinghcj" width="100" caption="${i18n.dinghcj }" />
			<t:gridCol property="qiysj" width="100" caption="${i18n.qiysj }"/>
			<t:gridCol property="kaixzdsj" width="100" caption="${i18n.kaixzdsj }"/>
			<t:gridCol property="wuld" caption="${i18n.wuld }" />
		</t:grid>
		<t:grid id="grid_weimzlj" 
			idKeys="lingjh"
			caption="${i18n.weimz_title }" 
			src="queryKaixjhWeimzlj.ajax"
			add="NOT"
			edit="NOT"
			remove="NOT" showNum="true" exportXls="true" reset="NOT" back="NOT" submit="NOT">
			<t:fieldLayout columns="2" prefix="select">
				<t:fieldHidden property="jihNo" defaultValue="${jihNo }"/>
			</t:fieldLayout>
			
			<t:gridCol property="lingjh" width="100" caption="${i18n.lingjh }"/>
			<t:gridCol property="zhongwmc" width="100" caption="${i18n.zhongwmc }" />
			<t:gridCol property="usercenter" width="100" caption="${i18n.usercenter }"  />
			<t:gridCol property="weimzsl" caption="${i18n.weimzsl }" />
			<t:gridCol property="cangkkc" caption="${i18n.cangkkc }" />
			<t:gridCol property="jihy" caption="${i18n.jihy }"   convert="getJihz"/>
		</t:grid>
		<t:form dialog="true"  caption="${i18n.kaixjhmx_title }" action="saveKaixjhmx.ajax" reset="NOT" id="form_kaixjhmx">
			<t:fieldLayout columns="2" prefix="kaixjhmx">
				<t:fieldHidden property="usercenter" defaultValue="${usercenter }"></t:fieldHidden>
				<t:fieldHidden property="kaixjhNo"  defaultValue="${jihNo }"></t:fieldHidden>
				<t:fieldHidden property="flag" defaultValue="1"/>
				<t:fieldText property="tcNo" caption="${i18n.tcNo }" notNull="true" maxLength="17"></t:fieldText>
				<t:fieldHidden property="id" caption="ID"></t:fieldHidden>
				<t:fieldCalendar property="qiysj" caption="${i18n.qiysj }" format="yyyy-MM-dd" notNull="true"></t:fieldCalendar>
				<t:fieldText property="mudd" caption="${i18n.mudd }" maxLength="3"></t:fieldText>
				<t:fieldText property="wuld" caption="${i18n.wuld }" maxLength="3"></t:fieldText>
				<t:fieldCalendar property="kaixzdsj" caption="${i18n.kaixzdsj }" format="yyyy-MM-dd" notNull="true"></t:fieldCalendar>
				<t:fieldText property="beiz" caption="${i18n.beiz }"></t:fieldText>
			</t:fieldLayout>
		</t:form>
	</t:page>
	<script type="text/javascript">
			 $.sdcui.serverConfig.convertArray['dinghcj']={'UW5':'${i18n.UW5 }','UW2':'${i18n.UW2 }'};
			 $(function(){ 

	           $('body div.layout-panel.panel-north').remove();
	
	           $('body td.td-west').remove();
	
	           $('body div.layout-panel.panel-south').remove(); 
	       });
			function initPage(){
				var pageHeight = document.body.clientHeight;
				var gridHeight = pageHeight - 382;
				$('.youi-grid .grid-content .grid-fixed').css('height', function(index) {
				  return gridHeight;
				});
				$('.youi-grid .grid-content .grid-scroll').css('height', function(index) {
					  return gridHeight;
				});
				//var shengxzt = ${shengxzt};
		    	//if(shengxzt=="0"){
		    	//	$('#button_expxls').addClass('disabled');
		    	//}else if(shengxzt=="1"){
		    	//	$('#button_expxls').removeClass('disabled');
		    	//}
				$('#kaixjhmx_tcNo').bind('focusout',function(){
					var tcNo = $("#kaixjhmx_tcNo").fieldValue();
				  	$.sdcui.ajaxUtil.ajax({
					url:'getTcId.ajax?tcNo='+tcNo,
					success:function(result){
						var id = result.result.id;
						if(id!=null&&id!=''){
							$("#kaixjhmx_id").fieldValue(result.result.id);
							$("#kaixjhmx_qiysj").fieldValue(result.result.qiysj);
							$("#kaixjhmx_mudd").fieldValue(result.result.mudd);
							$("#kaixjhmx_wuld").fieldValue(result.result.zuiswld);
							var kaixjhh = $("#select_kaixjhh").fieldValue();
							var usercenter = $("#select_usercenter").fieldValue();
							var id = $("#kaixjhmx_id").fieldValue();
							$.sdcui.ajaxUtil.ajax({
							url:'validateKaixjhmxTcNo.ajax?tcNo='+tcNo+'&kaixjhh='+kaixjhh+'&id='+id+'&usercenter='+usercenter,
							success:function(result){
								if(result.result=="0"){
									alert("${i18n.gtchyzmxz }");
									$("#kaixjhmx_flag").fieldValue("0");
									return false;
								}else{
									$("#kaixjhmx_flag").fieldValue("1");
								}
							}
							});
						}else{
							alert("${i18n.gxhbcz }");
							$("#laxjhmx_flag").fieldValue("2");
							return false;
						}
					}
					});
				});
			}
		    
		
			function func_button_addRecord(){
				$('#form_kaixjhmx').form('open','');
			}
			function form_kaixjhmx_beforeSubmit(){
				var flag = $('#kaixjhmx_flag').fieldValue();
				if(flag==0){
					alert("${i18n.gtchyzmxz }");
					return false;
				}else if(flag==2){
					alert("${i18n.gxhbcz }");
					return false;
				}
				return true;
			}
			function form_kaixjhmx_afterSubmit(result){
				if(result.result=="1"){
					$('#grid_kaixjhmx').grid('reload');
		   		}
		   		$('#form_kaixjhmx').form("clear").form('close');
			 }
			  /**
			*链接点击事件
			*/
			function link_tcNo(event){
				var event = event||window.event;//原生态的事件处理 
				var element = event.srcElement || event.target;
				var rowDoc = $(element).parents('tr:first')[0];
				var record = $('#grid_kaixjhmx').grid('getRecord',rowDoc);//获取当前行对应的记录
				var usercenter = $('#select_usercenter').fieldValue();
				var tcNo = record.tcNo;
				/**
				 * form跳转模式提交
				 */
				$.sdcui.pageUtils.goPage({
					url:'/lingjcx/selectYaohlBylaxkaix.do?usercenter='+usercenter+'&tcNo='+tcNo,//url
					record:record,//
					mode:'form',
					beforeSubmit:function(){
						//
						return true;
					}
				});
				event.stopPropagation();//阻止事件冒泡
				return false;
		
			}
			function func_grid_expxls(){
				var usercenter = $('#select_usercenter').fieldValue();
				var tcNo =  $('#select_tcNo').fieldValue();
				var dinghcj = $('#select_dinghcj').fieldValue();
				var kaixzdsj = $('#select_kaixzdsj').fieldValue();
				var qiysj = $('#select_qiysj').fieldValue();
				var kaixjhh = $('#select_kaixjhh').fieldValue(); 
				$.sdcui.pageUtils.goPage({
					url:'/laxjh/kaixjhDownLoadFile.do?usercenter='+usercenter+'&tcNo='+tcNo+'&dinghcj='+dinghcj+'&kaixzdsj='+kaixzdsj+'&qiysj='+qiysj+'&kaixjhh='+kaixjhh,//url
					mode:'form',
					beforeSubmit:function(){
						//
						return true;
					}
				});
				event.stopPropagation();//阻止事件冒泡
				return false;
			}
		</script>
</t:html>