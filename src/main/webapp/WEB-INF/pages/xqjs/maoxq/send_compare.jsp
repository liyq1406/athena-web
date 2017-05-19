<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.mxqcxbj}" >
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<script type="text/javascript">
		     $(function(){
			    removeHidden();
			 })
		</script>
	</head>
	<t:page  i18n="i18n.xqjs.maoxq.maoxqcxbj">

	<t:form id="form_maoxqCyc" submit="NOT" reset="NOT"> 
	       <t:grid id="grid_queryCompareQr"  caption="${i18n.zhouqmxqbjfs}"     
			src="/maoxq/queryCompareQr.ajax" removeSrc="/maoxq/removeCompareQr.ajax" idKeys="usercenter,xuqbc1,xuqbc2,bjfs,jiz,creator,create_time"   showNum="true"  edit="NOT"  add="NOT"
			usePager="true"  reset="NOT"  save="NOT"  load="true" scrollHeight="400"  pageSize="20">
			
			<t:button caption="${i18n.view}" name="compareCyc_view"></t:button>
			    
			<t:gridCol property="chkbox" align="center" renderer="createChkbox" caption="${i18n.xz}"></t:gridCol>
			
			 <t:gridCol  property="xuqbc1"  width="120"  type="text" caption="${i18n.xuqbc1}" ></t:gridCol>
			<t:gridCol  property="xuqbc2"  width="120"    type="text" caption="${i18n.xuqbc2}"  ></t:gridCol>
			<t:gridCol  property="jiz" width="120"   type="text" caption="${i18n.jz}"   ></t:gridCol>
			<t:gridCol  property="bjfs"  convert="bjfs"  width="90"   type="text" caption="${i18n.bjfs}"   ></t:gridCol>
			<t:gridCol  property="zhuangt"  convert="biaos"     type="text" caption="${i18n.zhuangt}"   ></t:gridCol>
			<t:gridCol  property="creator"      type="text" caption="${i18n.creator}"   ></t:gridCol>
			<t:gridCol  property="create_time"  width="150"   type="text" caption="${i18n.create_time}"   ></t:gridCol>
			<t:gridCol property="" caption="" ></t:gridCol>
			
			</t:grid>

	</t:form>
    <input id="removeId" value="${removeId}" type="hidden"/> 

	</t:page>
	<script type="text/javascript">
	
	function createChkbox(){
		return "<input  name='chkbox'  type='checkbox' />";
	}
		
	//标识
	$.sdcui.serverConfig.convertArray['biaos'] = {
		'0' : '${i18n.notsend}',
		'1' : '${i18n.sended}'
		
	};
	 
	//标识
	$.sdcui.serverConfig.convertArray['bjfs'] = {
		'1' : '${i18n.chanx}',
		'0' : '${i18n.usercenter}'
	};
	 
	
			
	<!--  xss V4_008-->		
	function func_button_compareCyc_view() {
		
		var record = $('#grid_queryCompareQr').grid('getSelectedRecords'); 
		
		if(record.length != 1){
		    alert("请选中一条仅且一条数据，进行操作！");
			return false;
		}
		
		var params = []; 
		var xuqlx ="Cyc";
		var mode ="chanx";
		
		//params.push("usercenter="+record[0].usercenter);	  
		 
		if(record[0].jiz==record[0].xuqbc1){
			params.push("xuqbc="+record[0].jiz);	
			params.push("xuqbc1="+record[0].xuqbc2);	
		}else{
			params.push("xuqbc="+record[0].jiz);	
			params.push("xuqbc1="+record[0].xuqbc1);	
		} 
		 
		params.push("xsfs="+record[0].bjfs);
		params.push("xuqlx="+xuqlx);	 
		params.push("mode="+mode);	
		
		var data = params.join('&');
			
		winOpen = window.open ('${ctx}/maoxq/comparePage.do?removeId=layout-north,layout-west,layout-south&'+data,
		'${i18n.maoxqBj}',
		'top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no, status=no');
		winOpen.resizeTo(screen.availWidth,screen.availHeight);
		return false; 
	}
	
	</script>
	<style type="text/css">
	
	</style>
</t:html>