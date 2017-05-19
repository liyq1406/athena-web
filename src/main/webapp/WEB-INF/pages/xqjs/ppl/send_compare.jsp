<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.bj}" >
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<script type="text/javascript">
		     $(function(){
			    removeHidden();
			 })
		</script>
	</head>
	<t:page  i18n="i18n.xqjs.ppl.pplbjjs">

	<t:form id="form_maoxqCyc" submit="NOT" reset="NOT"> 
	       <t:grid id="grid_niandpplCompare"  caption="${i18n.zhouqmxqbjfs}"     
			src="/ppl/queryCompareQr.ajax" removeSrc="/ppl/removeCompareQr.ajax" idKeys="usercenter,xuqbc1,xuqbc2,jiz,creator,create_time"   showNum="true"  edit="NOT"  add="NOT"
			usePager="true"  reset="NOT"  save="NOT"  load="true" scrollHeight="400"  pageSize="20">
			
			<t:button caption="${i18n.view}" name="comparePpl_view"></t:button>
			    
			<t:gridCol property="chkbox" align="center" renderer="createChkbox" caption="${i18n.xuanz}"></t:gridCol>
			
			 <t:gridCol  property="xuqbc1"  width="120"  type="text" caption="${i18n.xuqbc1}" ></t:gridCol>
			<t:gridCol  property="xuqbc2"  width="120"    type="text" caption="${i18n.xuqbc2}"  ></t:gridCol>
			<t:gridCol  property="jiz" width="120"   type="text" caption="${i18n.jiz}"   ></t:gridCol>
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
	  
	  
			
	<!--  xss V4_008-->		
	function func_button_comparePpl_view() {
		
		var record = $('#grid_niandpplCompare').grid('getSelectedRecords'); 
		
		if(record.length != 1){
		    alert("请选中一条仅且一条数据，进行操作！");
			return false;
		}
		
		var params = [];  
		 
		if(record[0].jiz==record[0].xuqbc1){
			params.push("pplbc1="+record[0].jiz);	
			params.push("pplbc2="+record[0].xuqbc2);	
		}else{
			params.push("pplbc1="+record[0].jiz);	
			params.push("pplbc2="+record[0].xuqbc1);	
		} 
		  
		var data = params.join('&');
			
		winOpen = window.open ('${ctx}/ppl/biJ.do?removeId=layout-north,layout-west,layout-south&'+data,
		'${i18n.maoxqBj}',
		'top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no, status=no');
		winOpen.resizeTo(screen.availWidth,screen.availHeight);
		return false; 
	}
	
	</script>
	<style type="text/css">
	
	</style>
</t:html>