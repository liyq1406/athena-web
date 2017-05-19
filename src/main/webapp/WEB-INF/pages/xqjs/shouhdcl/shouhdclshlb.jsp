<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	</head>
	<t:page i18n="i18n.xqjs.shouhdcl.shouhdcl">
	<t:grid id="grid_shouhdcl" caption="${i18n.shouhdcl}" showNum="true" showCheckbox="true" 
	idKeys="usercenter,jusgzdh,jusdh,xiehd,cangkbh,gonghms,chengysdm" 
	src="/shouhdcl/queryShouhdclshlb.ajax" add="NOT" edit="NOT" remove="NOT">
	<t:fieldLayout prefix="gridLayout" columns="3">
		<t:fieldSelect width="150" property="flag" convert="chuljg" caption="${i18n.chuljg}"></t:fieldSelect>
		<t:fieldText width="150" property="blh" caption="${i18n.fahtzd}" maxLength="17"></t:fieldText>
		<t:fieldCalendar format="yyyy-MM-dd" property="daohsj" caption="${i18n.daohsj}"></t:fieldCalendar>
		<t:fieldCalendar format="yyyy-MM-dd" property="utrq" caption="${i18n.daohsj}2"></t:fieldCalendar>
	     <t:fieldHidden property="lingjbh"></t:fieldHidden>
	     <t:fieldHidden property="danw"></t:fieldHidden>
	     <t:fieldHidden property="usercenter"></t:fieldHidden>
	     <t:fieldHidden property="gongysdm"></t:fieldHidden>
	     <t:fieldHidden property="gongysmc"></t:fieldHidden>
	     <t:fieldHidden property="gonghms"></t:fieldHidden>
	     <t:fieldHidden property="yansy"></t:fieldHidden>
	     <t:fieldHidden property="cangkbh"></t:fieldHidden>
	     <t:fieldHidden property="zhuangt"></t:fieldHidden>
	
		<t:fieldHidden property="usercenter1"></t:fieldHidden>
		<t:fieldHidden property="lingjbh1"></t:fieldHidden>
		<t:fieldHidden property="gongysdm1"></t:fieldHidden>
		<t:fieldHidden property="jihydm1"></t:fieldHidden>
		<t:fieldHidden property="gonghms1"></t:fieldHidden>
		<t:fieldHidden property="cangkbh1"></t:fieldHidden>
		<t:fieldHidden property="zhuangt1"></t:fieldHidden>
	</t:fieldLayout>
	<t:gridCol property="jusgzdh" caption="${i18n.jusgzdh}"></t:gridCol>
	<t:gridCol property="jusdh" caption="${i18n.jusdh}"></t:gridCol>
	<t:gridCol property="dingdh" caption="${i18n.dingdh}"></t:gridCol>
	<t:gridCol property="yaohlh" renderer="yaohlhRender" type="link" caption="${i18n.yaohl}"></t:gridCol>
	<t:gridCol property="lingjbh" caption="${i18n.lingjh}"></t:gridCol>
	<t:gridCol property="jusljs" caption="${i18n.lingjzl}"></t:gridCol>
	<t:gridCol property="gongysdm" caption="${i18n.gongysdm}"></t:gridCol>
	<t:gridCol property="dinghcj" caption="${i18n.dinghcj}"></t:gridCol>
	<t:gridCol property="uah"  caption="UA${i18n.hao}"></t:gridCol>
	<t:gridCol property="uabzlx" caption="UA${i18n.leix}"></t:gridCol>
	<t:gridCol property="uarl" caption="UA${i18n.rongl}"></t:gridCol>
	<t:gridCol property="ucbzlx" caption="UC${i18n.leix}"></t:gridCol>
	<t:gridCol property="uchl" caption="UC${i18n.rongl}"></t:gridCol>
	<t:gridCol property="ucgs" caption="UC${i18n.ges}"></t:gridCol>	
	<t:gridCol property="blh" caption="${i18n.fahtzd}"></t:gridCol>
	<t:gridCol property="qissj" caption="${i18n.fahsj}"></t:gridCol>	
	<t:gridCol property="zhongzsj" caption="${i18n.daohsj}"></t:gridCol>		
	<t:gridCol property="danw" caption="${i18n.danw}"></t:gridCol>
	<t:gridCol property="xiehd" caption="卸货点"></t:gridCol>
	<t:gridCol property="chuljg" convert="chuljg" caption="${i18n.chuljg}"></t:gridCol>
	<t:gridCol property="zhuangt" convert="shenhzt" caption="${i18n.shenhzt}"></t:gridCol>
	<t:gridCol property="jusyy" caption="${i18n.beiz}"></t:gridCol>
	<t:gridCol property="beiz4" caption="审核人"></t:gridCol>
	<t:gridCol property="beiz7" caption="审核时间" ></t:gridCol>
	</t:grid>
	<t:form id="tempAdd" dialog="true" submit="NOT" caption="${i18n.linsddcj}" reset="NOT">
		<t:fieldLayout prefix="add">
			<t:fieldHidden property="usercenter"></t:fieldHidden>
			<t:fieldHidden property="lingjbh"></t:fieldHidden>
			<t:fieldSelect property="dingdlx" caption="${i18n.dingdlx}" defaultValue="3" readonly="true" convert="dingDlx" width="150" notNull="true" ></t:fieldSelect>
			<t:fieldCalendar property="fahzq" readonly="true" caption="${i18n.fayqj}" format="yyyyMM" width="150" notNull="true"></t:fieldCalendar>
			<t:fieldCalendar property="jiaofrq" caption="交付时间" format="yyyy-MM-dd HH:mm" width="150" notNull="true"></t:fieldCalendar>
			<t:fieldText property="beiz" caption="${i18n.beiz}" maxLength="20"  width="150"></t:fieldText>
			<t:fieldSelect width="150" property="shiffsgys" defaultValue="0" readonly="true" caption="${i18n.shiffsgys}" convert="shiffsgys" notNull="true"></t:fieldSelect>
			<t:fieldText property="mdd" caption="${i18n.mdd}" maxLength="20"  width="150"></t:fieldText>
			<t:fieldText property="chullx" caption="供货模式" maxLength="20"  width="150"></t:fieldText>
			<t:button caption="${i18n.qued}" name="qued"></t:button>
		</t:fieldLayout>
	</t:form>
	<t:buttons id="button_forms">
		<t:button caption="${i18n.chuangjlsdd}" name="chuangjlsdd"></t:button>
		<t:button caption="${i18n.pilzdyhl}" name="pilzdyhl"></t:button>
		<t:button name="shdclback"  caption="${i18n.shdclback}"  />
	</t:buttons>
	</t:page>
	<script type="text/javascript"> 
	$.sdcui.serverConfig.convertArray['shenhzt']={'-1':'&nbsp','0':'${i18n.chuangj}','1':'${i18n.daicl}','2':'${i18n.yichul}','3':'${i18n.yish}'};
	$.sdcui.serverConfig.convertArray['chuljg']={'0':'${i18n.juj}','1':'${i18n.tongy}'};
	$.sdcui.serverConfig.convertArray['shiffsgys'] = {'0':'${i18n.fou}','1':'${i18n.shi}'};
	$.sdcui.serverConfig.convertArray['dingDlx'] = {'3':'${i18n.linsdd}'};
	/**
	*格式化补0函数
	*/
	function appendZero(s){
		return ("00"+s).substr((s+"").length);
	}
	function func_button_shdclback(){
		var usercenter1= $('#gridLayout_usercenter1').fieldValue();
		var lingjbh1 = $('#gridLayout_lingjbh1').fieldValue();
		var gongysdm1 =  $('#gridLayout_gongysdm1').fieldValue();
		var jihydm1 =  $('#gridLayout_jihydm1').fieldValue();
		var gonghms1 =  $('#gridLayout_gonghms1').fieldValue();  
		var cangkbh1 = $('#gridLayout_cangkbh1').fieldValue();
		var zhuangt1 =  $('#gridLayout_zhuangt1').fieldValue();
		window.location.href='${ctx}/shouhdcl/initShouhdcl.do?usercenter='+usercenter1+'&lingjbh='+lingjbh1+'&gongysdm='+gongysdm1+'&jihydm='+jihydm1+'&gonghms='+gonghms1+'&cangkbh='+cangkbh1+'&zhuangt1='+zhuangt1;
	}
	function gridReload(){
		$('#grid_shouhdcl').grid('reload');
	}
	/*
	*审核按钮点击事件
	*/
	function func_button_qued(){
		//校验
		if(!$('#tempAdd').form('validate')){
			return false;
		}
		var tempAdd = $('#tempAdd').form('getFormRecord');//获取选中的数据
		var record = $('#grid_shouhdcl').grid('getSelectedRecords');//获取选中的数据
		//拼参数
		var params = [];
		for (var i =0;i < record.length;i++){
			params.push('edit['+i+'].usercenter='+record[i].usercenter);
			params.push('edit['+i+'].jusgzdh='+record[i].jusgzdh);
			params.push('edit['+i+'].jusljs='+record[i].jusljs);
			params.push('edit['+i+'].uabzlx='+record[i].uabzlx);
			params.push('edit['+i+'].uarl='+record[i].uarl);
			params.push('edit['+i+'].ucbzlx='+record[i].ucbzlx);
			params.push('edit['+i+'].uchl='+record[i].uchl);
			params.push('edit['+i+'].ucgs='+record[i].ucgs);
			params.push('edit['+i+'].danw='+record[i].danw);
			params.push('edit['+i+'].xiehd='+record[i].xiehd);
			params.push('edit['+i+'].cangkbh='+record[i].cangkbh);
			params.push('edit['+i+'].chengysdm='+record[i].chengysdm);
			params.push('edit['+i+'].gonghms='+record[i].gonghms);
			params.push('edit['+i+'].dinghcj='+record[i].dinghcj);
		}
		params.push('dingd.usercenter='+tempAdd.usercenter);
		params.push('dingd.lingjbh='+tempAdd.lingjbh);
		//0013209-20170221-xss
		var gongysdm = record[0].gongysdm.replace(/ /g," "); 
		
		if(gongysdm == null||gongysdm == 'undefined'){
			gongysdm = '';
		}
		params.push('dingd.gongysdm='+gongysdm);
		params.push('dingd.dingdlx='+tempAdd.dingdlx);
		
		params.push('dingd.fahzq='+tempAdd.fahzq);
		params.push('jiaofrq='+tempAdd.jiaofrq);
		var beiz = tempAdd.beiz;
		if(beiz == null||beiz == 'undefined'){
			beiz = '';
		}
		params.push('dingd.beiz='+beiz);
		
		//添加目的地   请输入正确的 消耗点
		var gonghms = $('#gridLayout_gonghms').fieldValue();
		if(gonghms == 'CD'){
			var mdd = tempAdd.mdd;
			if(mdd == null||mdd == 'undefined'){
				mdd = '';
			} 
			if(mdd.length !=9 ){
			   alert('${i18n.mddmessege}');
			   return false;
			}
			params.push('dingd.mdd='+mdd);
		}
		//判断供货模式是否为空
		if(gonghms == null||gonghms == 'undefined'){
			gonghms = '';
		} 
		//===添加目的地
		params.push('dingd.chullx='+gonghms);
		params.push('dingd.shiffsgys='+tempAdd.shiffsgys);
		
		//xss-0011223
		$.sdcui.ajaxUtil.ajax({
            url:"checkLinsdd.ajax",//请求url
            data:params.join('&'),
           	success:function (result){
           		//alert(result.result);
           		if(result.result=='0'){ //消耗点对应的目的地和拒收跟踪单中的仓库不一致
           				if(confirm("输入的消耗点所对应的目的地和拒收跟踪单中的仓库不一致，是否继续？")){
           							$.sdcui.ajaxUtil.ajax({
						            url:"saveLinsdd.ajax",//请求url
						            data:params.join('&'),
						           	success:function (result){
						           		alert(result.result);
						           		$('#tempAdd').form('close');
						           		$('#grid_shouhdcl').grid('reload');
						            }
						    	});
           				}else{
           					return false;
           				}
           		}else{
           		           		$.sdcui.ajaxUtil.ajax({
						            url:"saveLinsdd.ajax",//请求url
						            data:params.join('&'),
						           	success:function (result){
						           		alert(result.result);
						           		$('#tempAdd').form('close');
						           		$('#grid_shouhdcl').grid('reload');
						            }
						    	});
           		
           		}
            }
    	});
		
		

	}
	/*
	*要货令渲染事件
	*/
	function yaohlhRender(col,value,rowIndex,colIndex){
		if(value.yaohlh){
			return value.yaohlh;
		}else{
			return "指定要货令号";
		}
	}
	/*
	*同意按钮点击事件
	*/
	function func_button_tongy(){
		shenh(1);
	}
	/*
	*创建临时订单按钮点击事件
	*/
	function func_button_chuangjlsdd(){
		var record = $('#grid_shouhdcl').grid('getSelectedRecords');//获取选中的数据
		//目的地添加  
		var gonghms = $('#gridLayout_gonghms').fieldValue();
		var length = record.length;//判断长度
		if(length < 1){//判断是否选择数据
			alert('${i18n.choose}!');
			return false;
		}
		//看板不能创建临时订单
		if(gonghms =='R1' || gonghms =='R2'){
			alert('看板的零件在审核时不能通过创建临时订单来收货，需指定要货令');
			return false;
		}
		
		//SG不能创建临时订单 -0012442/0011897/XSS
		if(gonghms =='SG' || gonghms =='sg'){
			alert('SG的零件在审核时不能通过创建临时订单来收货');
			return false;
		}
		
		//供应商校验
		var gongysdm = record[0].gongysdm;
		for (var i =0;i < record.length;i++){
			if(gongysdm != record[i].gongysdm){
				alert('${i18n.qingxzxtdgys}');
				return false;
			}
			if(record[i].jusdh != ''){
				alert('${i18n.zhindmyjsdhdsjcjlsdd}}');
				return false;
			}
			if(record[i].zhuangt != '1'){
				alert('${i18n.zhinddcldsjcjlsdd}');
				return false;
			}
		}
		var today = new Date();
		var year = today.getFullYear();
		var month = today.getMonth()+1;
		var day = today.getDate();
		var hour = today.getHours();
		var minutes = today.getMinutes();
		//if(day>0&&day<10){
		//	day = "0"+day;
		//}
		//var jiaofrq = year+"-"+appendZero(month)+"-"+day+" "+hour+":"+minutes;
		//时间格式标准化
		var jiaofrq = year+"-"+appendZero(month)+"-"+appendZero(day)+" "+appendZero(hour)+":"+appendZero(minutes);
	
		if(gonghms == 'CD'){
			$('#fieldText-add_mdd').show();
			$('#add_mdd').show();
			$('#fieldText-add_chullx').hide();
			$('#add_chullx').hide();
		}else if(gonghms == ''){
			$('#fieldText-add_mdd').show();
			$('#add_mdd').show();
			$('#fieldText-add_chullx').show();
			$('#add_chullx').show();
		}else{
			$('#fieldText-add_mdd').hide();
			$('#add_mdd').hide();
			$('#fieldText-add_chullx').hide();
			$('#add_chullx').hide();
		}
		//==end ==
			
		$('#add_beiz').fieldValue("");
		$('#add_jiaofrq').fieldValue(jiaofrq);
		$('#add_lingjbh').fieldValue(record[0].lingjbh);
		$('#add_usercenter').fieldValue(record[0].usercenter);
		$('#tempAdd').form('open');
	}
	/*
	*指定要货令链接点击事件
	*/
	function link_yaohlh(event){
		var event = event||window.event;//原生态的事件处理 
		var element = event.srcElement || event.target;
		var rowDoc = $(element).parents('tr:first')[0];
		var record = $('#grid_shouhdcl').grid('getRecord',rowDoc);//获取当前行对应的记录
		var lingjbh = record.lingjbh;
		var usercenter = record.usercenter;
		var jusgzdh = record.jusgzdh;
		var xiehd = record.xiehd;
		var zhuangt = record.zhuangt;
		var jusljs = record.jusljs;
		if(zhuangt=='2'){
			alert("${i18n.gsjycl}");
		}else{			
		winOpen=window.open('${ctx}/shouhdcl/initZhidyhl.do?lingjbh='+lingjbh+'&usercenter='+usercenter+'&jusgzdh='+jusgzdh+'&xiehd='+xiehd+'&zhuangt='+zhuangt+'&jusljs='+jusljs,'收货待处理','top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no, status=no');
		winOpen.resizeTo(screen.availWidth,screen.availHeight);
		}
		
		return false;
		
		/**
		 * form跳转模式提交
		 */
		/**$.sdcui.pageUtils.goPage({
			url:'/shouhdcl/initZhidyhl.do',//url
			record:record,//
			mode:'form',
			beforeSubmit:function(){
				return true;
			}
		});*/
	}
	/*
	*批量指定要货令按钮点击事件
	*/
	function func_button_pilzdyhl(){
		var record = $('#grid_shouhdcl').grid('getSelectedRecords');//获取选中的数据
		var length = record.length;//判断长度
		if(length < 1){//判断是否选择数据
			alert('${i18n.choose}!');
			return false;
		}
		//零件编号
		var lingjbh = $('#gridLayout_lingjbh').fieldValue();
		//拼参数
		var chuljg = $('#gridLayout_chuljg').fieldValue();
		if(chuljg==''||chuljg=='null'){
			chuljg = '-1';
		}
		var gongysdm = $('#gridLayout_gongysdm').fieldValue();
		var blh = $('#gridLayout_blh').fieldValue();
		var daohsj = $('#gridLayout_daohsj').fieldValue();
		var cangkbh = $('#gridLayout_cangkbh').fieldValue();
		var params = [];
		for (var i =0;i < record.length;i++){
			params.push('list['+i+'].usercenter='+record[i].usercenter);
			params.push('list['+i+'].jusgzdh='+record[i].jusgzdh);
			params.push('list['+i+'].lingjbh='+record[i].lingjbh);
			params.push('list['+i+'].xiehd='+record[i].xiehd);
			params.push('list['+i+'].zhuangt='+record[i].zhuangt);
		}

		$.sdcui.ajaxUtil.ajax({
            url:"piLzdyhl.ajax?gongysdm"+gongysdm+"&chuljg="+chuljg+"&blh="+blh+"&daohsj="+daohsj+"&cangkbh="+cangkbh,//请求url
            data:params.join('&'),
           	success:function (result){
           		alert(result.result);
           		$('#grid_shouhdcl').grid('reload');
            }
    	});
	}
	
	/**
	*审核处理
	*/
	function shenh(chuljg){
		var record = $('#grid_shouhdcl').grid('getSelectedRecords');//获取选中的数据
		var length = record.length;//判断长度
		if(length < 1){//判断是否选择数据
			alert('${i18n.choose}!');
			return false;
		}
		var str = "";
		//拼参数
		var params = [];
		for (var i =0;i < record.length;i++){
			var value = record[i];
			if(value.zhuangt != 1||value.jusdh.length>0){
				str += value.jusgzdh+"|";
			}else{
				params.push('list['+i+'].usercenter='+value.usercenter);
				params.push('list['+i+'].jusgzdh='+value.jusgzdh);
				params.push('list['+i+'].chuljg='+chuljg);
			}
		}
		if(str != ""){
			alert("${i18n.jusdh}"+str+"${i18n.yiclhzyjbjj}");
			return false;
		}
		if(chuljg == '0'){
			if(confirm("是否拒收该拒收跟踪单?")){
				    $.sdcui.ajaxUtil.ajax({
		            url:"shenH.ajax",//请求url
		            data:params.join('&'),
		           	success:function (result){
		           		alert(result.result);
		           		$('#grid_shouhdcl').grid('reload');
		            }
		    	});
			}
		}else{
				$.sdcui.ajaxUtil.ajax({
	            url:"shenH.ajax",//请求url
	            data:params.join('&'),
	           	success:function (result){
	           		alert(result.result);
	           		$('#grid_shouhdcl').grid('reload');
	            }
	    	});
		
		}
		
		
	}
	</script>
	<style type="text/css">
	.youi-fieldLayout table td.contral.label-col {
    	width: 105px;
	}
	</style>
</t:html>