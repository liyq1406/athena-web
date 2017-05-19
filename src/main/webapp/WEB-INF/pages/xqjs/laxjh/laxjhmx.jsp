<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<link type="text/css" rel="stylesheet" 
			href="<c:url value="/styles/authority/role.css"/>"/>
	</head>
	<t:page  i18n="i18n.xqjs.laxjh.laxjhmx">
		<t:grid id="grid_laxjhmx" 
			idKeys="usercenter,laxjhNo,id,tcNo"
			caption="${i18n.title_index }" 
			src="queryLaxjhmx.ajax"
			add="NOT"
			edit="NOT" 
			removeSrc="editLaxjhmx.ajax"  back="NOT"  showNum="true">
			<t:button name="expxls" caption="${i18n.expxls }" active="3"/>
			<t:fieldLayout columns="4" prefix="select">
				<t:fieldText property="tcNo" width="100" caption="${i18n.tcNo }" maxLength="17"></t:fieldText>
				<t:fieldSelect property="dinghcj" width="100"  caption="${i18n.dinghcj }"><t:fieldOption value="UW2" text="${i18n.UW5 }"></t:fieldOption>
				<t:fieldOption value="UW5"  text="${i18n.UW2 }"></t:fieldOption></t:fieldSelect>
				<t:fieldCalendar property="qiysj" width="100"  caption="${i18n.qiysj }" format="yyyy-MM-dd"></t:fieldCalendar>
				<t:fieldText property="wuld" width="100"  caption="${i18n.wuld }" maxLength="3"></t:fieldText>
				<t:fieldHidden property="usercenter" defaultValue="${usercenter }"></t:fieldHidden>
				<t:fieldHidden property="laxjhh"  defaultValue="${jihNo }"></t:fieldHidden>
				<t:button caption="${i18n.addRecord }" name="addRecord" icon="addRecord"></t:button>
			</t:fieldLayout>
			<t:gridCol property="tcNo" width="100" caption="${i18n.tcNo }" type="link"/>
			<t:gridCol property="dinghcj" width="100" caption="${i18n.dinghcj }" />
			<t:gridCol property="qiysj" width="100" caption="${i18n.qiysj }" />
			<t:gridCol property="laxzdsj" width="100" caption="${i18n.laxzdsj }"/>
			<t:gridCol property="wuld" caption="${i18n.wuld }" />
		</t:grid>
		<t:grid id="grid_weimzlj" 
			idKeys="lingjh"
			caption="${i18n.weimz_title }" 
			src="queryLaxjhWeimzlj.ajax"
			add="NOT"
			edit="NOT"
			remove="NOT" showNum="true" exportXls="true" reset="NOT" submit="NOT"  back="NOT">
			<t:fieldLayout columns="2" prefix="select">
				<t:fieldHidden property="jihNo" defaultValue="${jihNo }"/>
			</t:fieldLayout>
			
			<t:gridCol property="lingjh" width="100" caption="${i18n.lingjh }"/>
			<t:gridCol property="zhongwmc" width="100" caption="${i18n.zhongwmc }" />
			<t:gridCol property="usercenter" width="100" caption="${i18n.usercenter }"/>
			<t:gridCol property="weimzsl" caption="${i18n.weimzsl }" />
			<t:gridCol property="cangkkc" caption="${i18n.cangkkc }" />
			<t:gridCol property="jihy" caption="${i18n.jihy }" />
		</t:grid>
		<t:form dialog="true"  caption="${i18n.laxjhmx_title }" action="saveLaxjhmx.ajax" reset="NOT" id="form_laxjhmx">
			<t:fieldLayout columns="2" prefix="laxjhmx">
				<t:fieldHidden property="usercenter" defaultValue="${usercenter }"></t:fieldHidden>
				<t:fieldHidden property="laxjhNo"  defaultValue="${jihNo }"></t:fieldHidden>
				<t:fieldHidden property="flag" defaultValue="1"/>
				<t:fieldText property="tcNo" caption="${i18n.tcNo }" notNull="true" maxLength="17"></t:fieldText>
				<t:fieldHidden property="id" caption="ID" ></t:fieldHidden>
				<t:fieldCalendar property="qiysj" caption="${i18n.qiysj }" format="yyyy-MM-dd" notNull="true"></t:fieldCalendar>
				<t:fieldText property="mudd" caption="${i18n.mudd }" maxLength="3"></t:fieldText>
				<t:fieldText property="wuld" caption="${i18n.wuld }" maxLength="3"></t:fieldText>
				<t:fieldCalendar property="laxzdsj" caption="${i18n.laxzdsj }" format="yyyy-MM-dd" notNull="true"></t:fieldCalendar>
				<t:fieldText property="beiz" caption="${i18n.beiz }" maxLength="100"></t:fieldText>
			</t:fieldLayout>
		</t:form>
	</t:page>
	<script type="text/javascript">
			 $.sdcui.serverConfig.convertArray['dinghcj']={'UW5':'${i18n.UW5}','UW2':'${i18n.UW2}'};
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
		    	//var shengxzt = "";
		    	//shengxzt = ${shengxzt};
		    	//if(shengxzt=="0"){
		    	//	$('#button_expxls').addClass('disabled');
		    	//}else if(shengxzt=="1"){
		    	//	$('#button_expxls').removeClass('disabled');
		    	//}
				$('#laxjhmx_tcNo').bind('focusout',function(){
					var tcNo = $("#laxjhmx_tcNo").fieldValue();
				  	$.sdcui.ajaxUtil.ajax({
					url:'getTcId.ajax?tcNo='+tcNo,
					success:function(result){
							var id = result.result.id;
							if(id!=null&&id!=''){
								$("#laxjhmx_id").fieldValue(result.result.id);
								$("#laxjhmx_qiysj").fieldValue(result.result.qiysj);
								$("#laxjhmx_mudd").fieldValue(result.result.mudd);
								$("#laxjhmx_wuld").fieldValue(result.result.zuiswld);
								var laxjhh = $("#select_laxjhh").fieldValue();
								var usercenter = $("#select_usercenter").fieldValue();
								var id = $("#laxjhmx_id").fieldValue();
								$.sdcui.ajaxUtil.ajax({
								url:'validateLaxjhmxTcNo.ajax?tcNo='+tcNo+'&laxjhh='+laxjhh+'&id='+id+'&usercenter='+usercenter,
								success:function(result){
									if(result.result=="0"){
										alert("${i18n.gtchyzmxz}");
										$("#laxjhmx_flag").fieldValue("0");
										return false;
									}else{
										$("#laxjhmx_flag").fieldValue("1");
									}
								}
								});
							}else{
								alert("${i18n.gxhbcz}");
								$("#laxjhmx_flag").fieldValue("2");
								return false;
							}
							
					}
					});
				});
			}
		    
			function func_button_addRecord(){
				$('#form_laxjhmx').form('open','');
			}
			
			function form_laxjhmx_beforeSubmit(){
				var flag = $('#laxjhmx_flag').fieldValue();
				if(flag==0){
					alert("${i18n.gtchyzmxz}");
					return false;
				}else if(flag==2){
					alert("${i18n.gxhbcz}");
					return false;
				}
				return true;
			}
			function form_laxjhmx_afterSubmit(result){
				if(result.result=="1"){
					$('#grid_laxjhmx').grid('reload');
		   		}
		   		$('#form_laxjhmx').form("clear").form('close');
			 }
			 
			 /**
			*链接点击事件
			*/
			function link_tcNo(event){
				var event = event||window.event;//原生态的事件处理 
				var element = event.srcElement || event.target;
				var rowDoc = $(element).parents('tr:first')[0];
				var record = $('#grid_laxjhmx').grid('getRecord',rowDoc);//获取当前行对应的记录
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
				var wuld = $('#select_wuld').fieldValue();
				var qiysj = $('#select_qiysj').fieldValue();
				var laxjhh = $('#select_laxjhh').fieldValue(); 
				$.sdcui.pageUtils.goPage({
					url:'/laxjh/laxjhDownLoadFile.do?usercenter='+usercenter+'&tcNo='+tcNo+'&dinghcj='+dinghcj+'&wuld='+wuld+'&qiysj='+qiysj+'&laxjhh='+laxjhh,//url
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