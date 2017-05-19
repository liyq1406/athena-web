<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	</head>
	
	<t:page i18n="i18n.xqjs.ildingd.ildingdjs" >
		<t:grid id="grid_dingdh" showNum="true" showCheckbox="true" submit="NOT" reset="NOT" idKeys="dingdh"
		 add="NOT" src="/ilorder/queryDingdh.ajax" remove="NOT" edit="NOT" scrollHeight="78">
			<t:fieldLayout prefix="gridLayout">
				<t:fieldHidden property="dingdlx1" defaultValue="9"></t:fieldHidden>
				<t:fieldHidden property="dingdzt" defaultValue="0"></t:fieldHidden>
				<t:fieldHidden property="zhizlx" defaultValue="UGB"></t:fieldHidden>
			</t:fieldLayout>
			<t:gridCol property="dingdh" align="left" caption="${i18n.dingdh}"></t:gridCol>
		</t:grid>
		<t:grid id="grid_maoxqo" load="false" showNum="true" submit="NOT" reset="NOT" scrollHeight="70" idKeys="xuqbc"
		add="NOT" edit="NOT" remove="NOT" src="/ilorder/queryMaoxqo.ajax">
			<t:fieldLayout prefix="gridLayout" columns="3">
				<t:fieldHidden property="dingdlx1" defaultValue="9"></t:fieldHidden>
				<t:fieldHidden property="dingdzt" defaultValue="0"></t:fieldHidden>
				<t:fieldHidden property="zhizlx" defaultValue="UGB"></t:fieldHidden>
				<t:fieldSelect width="150" show="gonghms" code="xuqly" src="/ilorder/queryXuqly.ajax" caption="${i18n.xuqly}" property="xuqly"></t:fieldSelect>
				<t:fieldSelect width="150" show="ziyhqrq" code="ziyhqrq" src="/ilorder/juanlZrhqrq.ajax"
				 caption="${i18n.ziyhqrq}" property="ziyhqrq"></t:fieldSelect>
			</t:fieldLayout>
			<t:gridCol property="xuqbc" type="link" caption="${i18n.xuqbc}" width="100"></t:gridCol>
			<t:gridCol property="xuqcfsj"  caption="${i18n.chaifsj}" width="150"></t:gridCol>
			<t:gridCol property="xuqly"  caption="${i18n.xuqly}" width="100"></t:gridCol>
			<t:gridCol property="xuqlymc"  caption="${i18n.xuqly}${i18n.shuom}" width="100"></t:gridCol>
			<t:gridCol property="beiz" caption="${i18n.beiz}" width="100"></t:gridCol>
		</t:grid>
		<t:buttons id="buttons_form">
			<t:button caption="${i18n.qued}" name="qued"></t:button>
		</t:buttons>
		<t:grid id="grid_maoxqt" idKeys="xuqbc" showNum="true" showCheckbox="true" submit="NOT" reset="NOT" add="NOT" edit="NOT" remove="NOT" scrollHeight="70"
		src="/kdorder/querySessionMaoxq.ajax" load="true" >
		<t:fieldLayout prefix="layout">
			<t:fieldHidden property="xuqbc"></t:fieldHidden>
			<t:fieldHidden property="isDel"></t:fieldHidden>
			<t:fieldHidden property="zhizlx"></t:fieldHidden>
		</t:fieldLayout>
			<t:gridCol property="xuqbc" type="link" caption="${i18n.xuqbc}" width="100"></t:gridCol>
			<t:gridCol property="xuqcfsj"  caption="${i18n.chaifsj}" width="150"></t:gridCol>
			<t:gridCol property="xuqly"  caption="${i18n.xuqly}" width="100"></t:gridCol>
			<t:gridCol property="xuqlymc"  caption="${i18n.xuqly}${i18n.shuom}" width="100"></t:gridCol>
			<t:gridCol property="beiz" caption="${i18n.beiz}" width="100"></t:gridCol>
		</t:grid>
		<t:buttons id="button_form">
			<t:button name="qux" caption="${i18n.qux}"></t:button>
  			<t:button name="cansjy" caption="${i18n.cansjy}"></t:button>
  			<t:button name="shengcdd" caption="${i18n.shengcdd}"></t:button>
		</t:buttons>
	</t:page>
		
	<script type="text/javascript">
	$.sdcui.serverConfig.convertArray['dingdlx']={'9':'卷料订单'};
	
	/**
	*链接点击事件
	*/
	function link_xuqbc(event){
		var event = event||window.event;//原生态的事件处理 
		var element = event.srcElement || event.target;
		var rowDoc = $(element).parents('tr:first')[0];
		var record = $('#grid_maoxqo').grid('getRecord',rowDoc);//获取当前行对应的记录
		var xuqbc = record.xuqbc;
		/**
		 * form跳转模式提交
			window.open ('${ctx}/zygzbj/mxqMx.do?removeId=layout-north,layout-west,layout-south','毛需求明细','height=768,width=1024,top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
		return false; */
         winOpen =  window.open ('${ctx}/kanbyhl/queryMX.do?removeId=layout-north,layout-west,layout-south&xuqbc='+xuqbc,
		'毛需求明细',
		'top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no, status=no');
		winOpen.resizeTo(screen.availWidth,screen.availHeight);
        return false;
	}
	
	//生成选择radio
	function radioXuqbc(){
		return "<input name='selectXuqbcs' onclick='radioClick(this)' type='radio'/>";
	}
	
	//需求类型change事件
	function gridLayout_xuqly_change() {
		$('#grid_maoxqo').grid('reload');
	}
	
	//确定按妞事件
	function func_button_qued() {
		if(vali()) {
			//是否选中了版次
			var record = $('#grid_maoxqo').grid('getSelectedRecords');
			//选中的版次放到隐藏域
			$('#layout_xuqbc').fieldValue(record[0].xuqbc);
			$('#layout_isDel').fieldValue("0");
			$('#grid_maoxqt').grid('reload');
		}
	}
	
	//radio点击事件
	function radioClick(obj){
		var rowElemt = $(obj).parent('td:first').parent('tr:first');
		var xuqbc = rowElemt.find('td:eq(1)').text();
		//选中的版次放到隐藏域
		$('#layout_xuqbc').fieldValue(xuqbc);
	}
	
	//表单验证
	function vali() {
		//是否选中了版次
		var record = $('#grid_maoxqo').grid('getSelectedRecords');
		if(record.length == 0) {
			//请选择版次
			alert("${i18n.choose}");
			return false;
		}
		return true;
	}
	
	//取消按妞事件
	function func_button_qux() {
		if(qxvali()) {
			//是否选中了版次
			var record = $('#grid_maoxqt').grid('getSelectedRecords');
			//选中的版次放到隐藏域
			$('#layout_xuqbc').fieldValue(record[0].xuqbc);
			$('#layout_isDel').fieldValue("1");
			$('#grid_maoxqt').grid('reload');
		}
	}
	
	//取消表单验证
	function qxvali() {
		//是否选中了版次
		var record = $('#grid_maoxqt').grid('getSelectedRecords');
		if(record.length == 0) {
			//请选择版次
			alert("${i18n.choose}");
			return false;
		}
		return true;
	}
	
	/**
	*参数校验
	*/
	function func_button_cansjy(){
		var grid = $('#grid_maoxqt').grid('getRecords');
		//订单号
		var gridDingdh = $('#grid_dingdh').grid('getSelectedRecords');
		if(grid.length<1){
		alert("${i18n.chooseMxqbc}");
		return false
		}else{
		if(gridDingdh.length < 1){
			alert("${i18n.chooseDd}");
			return false;
		}
		var ziyhqrq = $('#gridLayout_ziyhqrq').fieldValue();
		if(ziyhqrq==''){
		alert("${i18n.chooseZyhqrq}");
		return false;
		}
		}
		var param =[];
		for(var i = 0;i < gridDingdh.length;i++){
			param.push('dingdh['+i+'].dingdh='+gridDingdh[i].dingdh);
		}
		for(var i=0;i<grid.length;i++){
		 param.push('edit['+i+'].xuqbc='+grid[i].xuqbc);
		 param.push('edit['+i+'].xuqcfsj='+grid[i].xuqcfsj);
		 param.push('edit['+i+'].xuqly='+grid[i].xuqly);
		 param.push('edit['+i+'].xuqlymc='+grid[i].xuqlymc);
		 param.push('edit['+i+'].beiz='+grid[i].beiz);
		}
		param.push('xuqlx='+$('#gridLayout_chullx').fieldValue());
		param.push('ziyhqrq='+ziyhqrq);
		param.push('zhizlx='+$('#gridLayout_zhizlx').fieldValue());
		
		
		
		$.sdcui.ajaxUtil.ajax({
            url:"${ctx}/ilorder/queryChullx.ajax",
            data:param.join('&'),
           success:function (result){
          	 if(result.result == 'false'){
          		 alert("${i18n.jldingdjy}");
          		 return false;
          	 }
          	 chullx = result.result;
          
          	 param.push('xuqlx='+chullx);

          	 $.sdcui.ajaxUtil.ajax({
                   url:"${ctx}/ilorder/checkValue.ajax",
                   data:param.join('&'),
                  success:function (result){
                 	 alert(result.result);
                   }
           });

            }
    	});
		
		
	}
	
	/**
	*生成订单
	*/
	function func_button_shengcdd(){
		var grid = $('#grid_maoxqt').grid('getRecords');
		//订单号
		var gridDingdh = $('#grid_dingdh').grid('getSelectedRecords');
		if(grid.length<1){
		alert("${i18n.chooseMxqbc}");
		return false;
		}else{
			if(gridDingdh.length < 1){
				alert("${i18n.chooseDd}");
				return false;
			}
		var ziyhqrq = $('#gridLayout_ziyhqrq').fieldValue();
		if(ziyhqrq==''){
		alert("${i18n.chooseZyhqrq}");
		return false;
		}
		}
		var param =[];
		for(var i = 0;i < gridDingdh.length;i++){
			param.push('dingdh['+i+'].dingdh='+gridDingdh[i].dingdh);
		}
		for(var i=0;i<grid.length;i++){
		 param.push('edit['+i+'].xuqbc='+grid[i].xuqbc);
		 param.push('edit['+i+'].xuqcfsj='+grid[i].xuqcfsj);
		 param.push('edit['+i+'].xuqly='+grid[i].xuqly);
		 param.push('edit['+i+'].xuqlymc='+grid[i].xuqlymc);
		 param.push('edit['+i+'].beiz='+grid[i].beiz);
		}
		param.push('ziyhqrq='+ziyhqrq);
		param.push('zhizlx='+$('#gridLayout_zhizlx').fieldValue());
		
		var chullx = "";
		
		$.sdcui.ajaxUtil.ajax({
              url:"${ctx}/ilorder/queryChullx.ajax",
              data:param.join('&'),
             success:function (result){
            	 if(result.result == 'false'){
            		 alert("${i18n.jldingdjy}");
            		 return false;
            	 }
            	 chullx = result.result;
            	 param.push('xuqlx='+chullx);

		 		$.sdcui.ajaxUtil.ajax({
		 	 	                         url:"${ctx}/ilorder/ilCalculate.ajax",
		 	 	                         data:param.join('&'),
		 	                             success:function (result){
		 	                            	 alert(result.result);
		 	 	                         }
		 	                      });
              }
      	});
		
		

	}
	</script>
	<style type="text/css">
	</style>
</t:html>