<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<link type="text/css" rel="stylesheet" 
			href="<c:url value="/styles/authority/role.css"/>"/>
	</head>
	<t:page  i18n="i18n.xqjs.laxjh.kaixjh">
		<t:grid id="grid_kaixjh" 
			idKeys="kaixjhh"
			caption="${i18n.kaixjhcx }" 
			src="executeKaixjh.ajax"
			add="NOT"
			edit="NOT"
			remove="NOT" showCheckbox="true" back="NOT"  showNum="true">
			<t:fieldLayout columns="4" prefix="select">
				<t:fieldText property="anqkc" width="100" caption="${i18n.anqkc }"  expression="^[0-9]*[1-9][0-9]*$" expressionMessage="请输入正整数或小数!" maxLength="13"></t:fieldText>
				<t:fieldText property="kaixjx" width="100" caption="${i18n.kaixjx }"  expression="^[0-9]*[1-9][0-9]*$" expressionMessage="请输入正整数或小数!" maxLength="13"></t:fieldText>
				<t:fieldSelect property="shengxzt" width="100" caption="${i18n.shengxzt }">
				   <t:fieldOption value="" text=""></t:fieldOption>
					<t:fieldOption value="0" text="${i18n.wsx }"></t:fieldOption>
					<t:fieldOption value="1" text="${i18n.ysx }"></t:fieldOption>
					<t:fieldOption value="2" text="${i18n.yqx }"></t:fieldOption>
				</t:fieldSelect>
				<t:fieldSelect property="suanfcl" width="100" caption="${i18n.suanfcl }">
					<t:fieldOption value="" text=""></t:fieldOption>
					<t:fieldOption value="1" text="${i18n.ljpzyx }"></t:fieldOption>
					<t:fieldOption value="2" text="${i18n.zxsjyx }"></t:fieldOption>
				</t:fieldSelect>
				<t:fieldSelect property="jihy" width="100" caption="${i18n.jihy }" convert="getJihz"/>
			</t:fieldLayout>
			
			<t:gridCol property="kaixjhh" width="100" caption="${i18n.kaixjhh }"  type="link"/>
			<t:gridCol property="banc" width="80" caption="${i18n.banc }"   type="link"/>
			<t:gridCol property="usercenter" width="80" caption="${i18n.usercenter }" />
			<t:gridCol property="createTime" caption="${i18n.createTime }" />
			<t:gridCol property="suanfcl" width="100"  caption="${i18n.suanfcl }"  convert="suanfcl"/>
			<t:gridCol property="jihy" caption="${i18n.jihy }" convert="getJihz"/>
			<t:gridCol property="anqkc" caption="${i18n.anqkc }" />
			<t:gridCol property="kaixjx" caption="${i18n.kaixjx }" />
			<t:gridCol property="shengxzt" caption="${i18n.shengxzt }" convert="shengxzt"/>
		</t:grid>
		<t:fieldLayout>
			<t:buttons id="al">
				<t:button caption="${i18n.shengx }" name="shengx"></t:button>
				<t:button caption="${i18n.cancel }" name="cancel"></t:button>
			</t:buttons>
		</t:fieldLayout>
	</t:page>
	<script type="text/javascript">
		  $.sdcui.serverConfig.convertArray['shengxzt']={'0':'${i18n.wsx}','1':'${i18n.ysx}','2':'${i18n.yqx}'};
		  $.sdcui.serverConfig.convertArray['suanfcl']={'1':'${i18n.ljpzyx}','2':'${i18n.zxsjyx}'};
		   function initPage(){
		    	getGridHeight();
		   }
		   function func_button_shengx(){
				var kaixjh = $('#grid_kaixjh').grid('getSelectedRecords')[0];
				if(kaixjh!=null&&kaixjh!=''){
					var kaixjhh = kaixjh.kaixjhh;
					var usercenter = kaixjh.usercenter;
					var shengxzt = kaixjh.shengxzt;
					if(shengxzt=='0'){
			   		$.sdcui.ajaxUtil.ajax({
						url:'sxKaixjh.ajax?kaixjhh='+kaixjhh+'&usercenter='+usercenter,
						success:function(result){
							//
							$('#grid_kaixjh').grid('reload');
							alert("${i18n.sxsuccess}");
						}
					});
					}else if(shengxzt=="1"){
						alert("${i18n.bndysxdjherror}");				
					}else if(shengxzt=="2"){
						alert("${i18n.gkaixjhyqxerror}");
					}else{
						alert("${i18n.gkaixjhwwxsjerror}");
					}
				}else{
					alert("${i18n.qxzjl}");					
				}
		   }
		   function func_button_cancel(){
		   		var kaixjh = $('#grid_kaixjh').grid('getSelectedRecords')[0];
		   		if(kaixjh!=null&&kaixjh!=''){
		   			var kaixjhh = kaixjh.kaixjhh;
					var usercenter = kaixjh.usercenter;
					var shengxzt = kaixjh.shengxzt;
					if(confirm("${i18n.qdqxgkaixjherror}")){
						if(shengxzt=="1"){
							$.sdcui.ajaxUtil.ajax({
							url:'qxKaixjh.ajax?kaixjhh='+kaixjhh+'&usercenter='+usercenter,
							success:function(result){
								//
								alert(result.result);
								$('#grid_kaixjh').grid('reload');
							}
							});
						}else if(shengxzt=="0"){
							alert("${i18n.gkaixjhswsxerror}");
						}else if(shengxzt=="2"){
						alert("${i18n.gkaixjhyqxerror}");
					}				
					}
		   		}else{
					alert("${i18n.qxzjl}");					
				}
		   }
    /**
	*链接点击事件
	*/
	function link_kaixjhh(event){
		var event = event||window.event;//原生态的事件处理 
		var element = event.srcElement || event.target;
		var rowDoc = $(element).parents('tr:first')[0];
		var record = $('#grid_kaixjh').grid('getRecord',rowDoc);//获取当前行对应的记录
		var jihNo = record.kaixjhh;
		var usercenter = record.usercenter;
		var shengxzt = record.shengxzt;
		window.open ('selectKaixjhmx.do?kaixjhNo='+jihNo+'&usercenter='+usercenter+'&shengxzt='+shengxzt,'${i18n.kaixjhmx}','height=500,width=750,top=100,left=100,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
		return false;
		/**
		 * form跳转模式提交
		 */
		/**$.sdcui.pageUtils.goPage({
			url:'selectKaixjhmx.do',//url
			record:record,//
			mode:'form',
			beforeSubmit:function(){
				//
				return true;
			}
		});
		event.stopPropagation();//阻止事件冒泡
		return false;*/

	}
	/**
	 *链接点击事件
	 */
	function link_banc(event) {
		var event = event || window.event;//原生态的事件处理 
		var element = event.srcElement || event.target;
		var rowDoc = $(element).parents('tr:first')[0];
		var record = $('#grid_kaixjh').grid('getRecord', rowDoc);//获取当前行对应的记录
	    record.xuqlx = 'Week';
	    record.xuqbc = record.banc;
		/**
		 * form跳转模式提交
		 */
		$.sdcui.pageUtils.goPage({
			url : '/maoxq/initCwD.do',//url
			record : record,//
			mode : 'form',
			beforeSubmit : function() {
				//
				return true;
			}
		});
		
	}
		</script>
</t:html>