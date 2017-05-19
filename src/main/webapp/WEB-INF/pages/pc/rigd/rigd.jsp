<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html title="${i18n.pc_rigd_title }">

<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<script type="text/javascript">

//该方法未实现，需王凌实现
/* function rigdGrid_afterSubmit(){
	alert(222);
} */



</script>

</head>
<t:page i18n="i18n.pc.pc"  >
<!-- 日滚动计划列表 -->
			<t:grid id="rigdGrid" idKeys="chanxh" caption="${i18n.pc_rigd_title}" scrollHeight="205"
		src="/pc/queryRigd.ajax"  usePager="true" showEditorAdd = "false" showEditorRemove = "false" 
		preSaveRowsEvent="validBanc" 
		add="NOT" edit="NOT" remove="NOT" 
		showNum="true" load="false" editable="true" saveRowsSrcs="/pc/saveRigd.ajax" 
		 >
			<t:fieldLayout id="rigdLayout" prefix="rgd">
				<t:fieldCalendar property="kaissj" notNull="true" format="yyyy-MM-dd" caption="${i18n.kaissj }"></t:fieldCalendar>
				<t:fieldCalendar property="jiessj" notNull="true" format="yyyy-MM-dd" caption="${i18n.jiessj }"></t:fieldCalendar>
				<t:fieldSelect property="chanxh" caption="${i18n.chanxh }" convert="chanxh"></t:fieldSelect>
				<t:fieldText property="lingjbh" caption="${i18n.lingjbh }" maxLength="10"></t:fieldText>
				<t:fieldSelect property="zhuangt" caption="${i18n.zhuangt }" convert="zhuangt"></t:fieldSelect>
				<t:fieldHidden property="banString"></t:fieldHidden>
				<t:fieldHidden property="bancString"></t:fieldHidden>
				<t:fieldHidden property="chanxz"></t:fieldHidden>
				<t:fieldHidden property="shengcx" defaultValue="${shengcx}"></t:fieldHidden>
			</t:fieldLayout>
		
		<%-- <t:button caption="查询" name="btnSearch"></t:button> --%>
		<t:button caption="${i18n.paic }" name="btnPaic"></t:button>
		<t:button caption="${i18n.shengx }" name="btnShengx"></t:button>
		<t:button caption="${i18n.baojxx }" name="btnMessage"></t:button>
		<t:button caption="${i18n.jisljjf }" name="btnLeijjf"></t:button>
		<t:button caption="${i18n.report }" name="btnDownLoad"></t:button>
		<%-- <t:button caption="保存" name="btnSave"></t:button> --%>
			
			<t:gridCol property="chanxh" caption="${i18n.chanxh } "></t:gridCol>
			<t:gridCol property="shij" caption="${i18n.riq }  " ></t:gridCol>
			<t:gridCol property="lingjbh" caption="${i18n.lingjbh }"></t:gridCol>
			<t:gridCol property="zhuangt" caption="${i18n.zhuangt }" renderer="isZhuangzt"></t:gridCol>
			<t:gridCol editor="fieldText" property="lingjsl" editorOptions="{openEvent:qickcEditAble,'expression':'^(0|[1-9][0-9]{0,7})$','expressionMessage':'0-99999999的整数','notNull':true}" caption="${i18n.jisshul }"></t:gridCol>
			<c:forEach var="ban" items="${banList}" varStatus="status">
			<t:gridCol editor="fieldText" editorOptions="{openEvent:qickcEditAble,'expression':'^(0|[1-9][0-9]{0,7})$','expressionMessage':'0-99999999的整数','notNull':true}" property="ban${ban.ROWNUM }"  caption="${ban.BAN }${i18n.ban }"></t:gridCol>
			</c:forEach>
			<t:gridCol property="shijscsl"  caption="${i18n.shijscsl }" width="120"></t:gridCol>
			<t:gridCol property="currbalance" caption="${i18n.dangrce }"></t:gridCol> 
		</t:grid>
		
	<t:form  id="form_mg" dialog="true" submit="NOT" reset="NOT" width="550"  caption="${i18n.baojxinx }" >
		<t:grid src="/pc/queryRiMessage.ajax" id="messageGrid" 
		  idKeys="xiaox"  usePager="true" showNum="true" 
		  add="NOT" edit="NOT" remove="NOT"  load="false"
		  reset="NOT" save="NOT" submit="NOT" >
		<t:fieldLayout id="msg" prefix="messageLayout">
			<t:fieldHidden property="kaissj"></t:fieldHidden>
			<t:fieldHidden property="jiessj"></t:fieldHidden>
			<t:fieldHidden property="chanxh"></t:fieldHidden>
			<t:fieldHidden property="shengcx" defaultValue="${shengcx}"></t:fieldHidden>
		</t:fieldLayout>
			<t:gridCol property="XIAOX" caption="${i18n.paicmessage }" width="550"></t:gridCol>
		</t:grid>
	</t:form>	
		
<script type="text/javascript">
	$.sdcui.serverConfig.convertArray['chanxh'] =${chanxhJson};

	$.sdcui.serverConfig.convertArray['zhuangt'] ={'1':'${i18n.yishengc }','2':'${i18n.yifengbi }','3':'${i18n.yuji }'} ;
	//查询前执行方法
	function rigdGrid_beforeSubmit() {
		var kaissj = $("#rgd_kaissj").fieldValue();
		var jiessj = $("#rgd_jiessj").fieldValue();
		var chanxh = $("#rgd_chanxh").fieldValue();
			//点击报警信息时验证时间是否为空	
		if(kaissj==""||jiessj==""){
			alert("${i18n.rigd_kaissjjiessj_null }");
			return false;
		}else{
			//验证开始时间与结束时间
			var start = new Date(kaissj.replace("-","/"));
			var end = new Date(jiessj.replace("-","/"));
			var n = end.getTime() - start.getTime();
			if(n<0){
				alert("${i18n.rigd_jiessjMustbigkaissj }");
				return false;
			}
			var startfix = new Date(kaissj);
			var endfix = new Date(jiessj);
			var nfix = endfix.getTime() - startfix.getTime();
			if(nfix<0){
				alert("${i18n.rigd_jiessjMustbigkaissj }");
				return false;
			}
		} 
		
	}
		//数据格试化
	var isZhuangzt = function(v) {
		switch (v * 1) {
		case 1:
			return "${i18n.yishengc }";
		case 2:
			return "${i18n.yifengbi }";
		case 3:
			return "${i18n.yuji }";
		default:
			return v;

		}
	}


	//批量保存前验证班次数量
	function validBanc(params) { 
		var records = $("#rigdGrid").grid("getRecords",false); 
		var banString = $("#rgd_banString").fieldValue(); 
		var bancString = $("#rgd_bancString").fieldValue(); 
		var arrBan = bancString.split(',');
		if(banString == ""){
			return true;
		}
		for(var i=0;i<records.length;i++){
			var banlj = 0;
			//循环班
			$.each(arrBan,function(j,n){
				banlj += records[i][arrBan[j].toLocaleLowerCase()]*1;
			});
			//alert("计划数量="+records[i].lingjsl+"班数量和="+banlj);
			if(parseInt(records[i].lingjsl)!=banlj){
				alert("${i18n.rigd_di }"+(i+1)+"${i18n.rigd_lingjsl_unlikeness }");
				return false;
			}
		}
		return true;
	}	
		

//报警信息
	function func_button_btnMessage() {
	var kaissj = $("#rgd_kaissj").fieldValue();
	var jiessj = $("#rgd_jiessj").fieldValue();
	var chanxh = $("#rgd_chanxh").fieldValue();
		//点击报警信息时验证时间是否为空	
	if(kaissj==""||jiessj==""){
		alert("${i18n.rigd_kaissjjiessj_null }");
		return;
	}else{
		//验证开始时间与结束时间
		var start = new Date(kaissj.replace("-","/"));
		var end = new Date(jiessj.replace("-","/"));
		var n = end.getTime() - start.getTime();
		if(n<0){
			alert("${i18n.rigd_jiessjMustbigkaissj }");
			return false;
		}
		var startfix = new Date(kaissj);
		var endfix = new Date(jiessj);
		var nfix = endfix.getTime() - startfix.getTime();
		if(nfix<0){
			alert("${i18n.rigd_jiessjMustbigkaissj }");
			return false;
		}
	} 
	
	var chanxzString = $("#rgd_chanxz").fieldValue(); 
	if(chanxzString == ""){
		alert("${i18n.rigd_chanxz_err }");
		return false;
	}
		$("#messageLayout_kaissj").fieldValue(kaissj);
		$("#messageLayout_jiessj").fieldValue(jiessj);
		$("#messageLayout_chanxh").fieldValue(chanxh);
		$("#form_mg").form("open");
		$("#messageGrid").grid("reload");
	}
	


//排产
function func_button_btnPaic(){
	var chanxzString = $("#rgd_chanxz").fieldValue(); 
	if(chanxzString == ""){
		alert("${i18n.rigd_chanxz_err }");
		return false;
	}
	var params = [];
	params.push("shengcx="+$("#rgd_shengcx").fieldValue());
	if(confirm("${i18n.rigd_whether_paic }")){
		$("#button_btnPaic").addClass("disabled");
			 $.sdcui.ajaxUtil.ajax({
				 url:"${ctx}/pc/rigdPaic.ajax",
			      data:params.join("&"),  
		          success:function (result){
		        	  $("#button_btnPaic").removeClass("disabled");
			      }
		});
	}		 
}

//生效
function func_button_btnShengx(){
	var chanxzString = $("#rgd_chanxz").fieldValue(); 
	if(chanxzString == ""){
		alert("${i18n.rigd_chanxz_err }");
		return false;
	}
	var params = [];
	params.push("shengcx="+$("#rgd_shengcx").fieldValue());
	$.sdcui.ajaxUtil.ajax({
			 url:"${ctx}/pc/queryShiFSX.ajax",
			 data:params.join("&"), 
			 success:function(results){
				if(results.sxCount==0){
					alert("${i18n.rigd_null_rigdjih }");
					return;
				} 
			if(confirm("${i18n.rigd_whether_shengx }")){
				$.sdcui.ajaxUtil.ajax({
	      		url:"${ctx}/pc/rigdShengx.ajax",
	      		data:params.join("&"),  
          		success:function (result){
					if(result.count>0){
						alert("${i18n.rigd_shengx_success }");
					}else{
						alert("${i18n.rigd_shengx_fail }");
					}
	       		}
			 });
			}
		 }
  	});
	
}


//累计交付
function func_button_btnLeijjf(){
	var chanxzString = $("#rgd_chanxz").fieldValue(); 
	if(chanxzString == ""){
		alert("${i18n.rigd_chanxz_err }");
		return false;
	}
	var params = [];
	params.push("shengcx="+$("#rgd_shengcx").fieldValue());
	 $.sdcui.ajaxUtil.ajax({
		 url:"${ctx}/pc/rigdLeijjf.ajax",
		 data:params.join("&"), 
		 success:function(results){
			alert("${i18n.rigd_leijjf_finish}");
			return;
		 }
     });
}

//导出
function func_button_btnDownLoad(){
	var chanxzString = $("#rgd_chanxz").fieldValue(); 
	if(chanxzString == ""){
		alert("${i18n.rigd_chanxz_err }");
		return false;
	}
	var kaissj = $("#rgd_kaissj").fieldValue();
	var jiessj = $("#rgd_jiessj").fieldValue();
		//点击报警信息时验证时间是否为空	
	if(kaissj==""||jiessj==""){
		alert("${i18n.rigd_kaissjjiessj_null }");
		return;
	}else{
		//验证开始时间与结束时间
		var start = new Date(kaissj.replace("-","/"));
		var end = new Date(jiessj.replace("-","/"));
		var n = end.getTime() - start.getTime();
		if(n<0){
			alert("${i18n.rigd_jiessjMustbigkaissj }");
			return false;
		}
		var startfix = new Date(kaissj);
		var endfix = new Date(jiessj);
		var nfix = endfix.getTime() - startfix.getTime();
		if(nfix<0){
			alert("${i18n.rigd_jiessjMustbigkaissj }");
			return false;
		}
	} 
				$.sdcui.pageUtils.goPage({
					url:"../pc/rigdDownLoad.do?shengcx="+$("#rgd_shengcx").fieldValue()+"&kaissj="+kaissj+"&jiessj="+jiessj,
					mode : 'form',
					beforeSubmit:function(){
						return true;
					}
				});
}

//状态为已排产就不可编辑
function qickcEditAble(){
	var record=$("#rigdGrid").grid("getSelectedRecords")[0];
	var zhuangt = record.zhuangt;
	if(zhuangt=="1"){
		return false;
	}
	return true;
	
}	
</script>
</t:page>
</t:html>
