<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.title}">

<!-- 
	  取货运输费用
	 @author denggq
	 @date 2012-4-12
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 75px; } </style>
</head>

<t:page i18n="i18n.ckx.xuqjs.i18n_quhys">
	<t:grid id="grid_yunsfyhz" caption="${i18n.title}" 
	idKeys="usercenter,danjh"   
	back="NOT" 
	remove="NOT" 
	scrollHeight="335" 
	pageSize="15"
	src="/qhysfy/queryYunsfyhz.ajax" 
	load="true" 
	showNum="true" 
	add="NOT"
	edit="NOT"
	showCheckbox="true" 
	 dataFormId="form_quhyuns"
>
		
		<t:fieldLayout id="layout1" prefix="quhyuns" columns="4">
			<t:fieldSelect property="usercenter" caption="用户中心" notNull="true" defaultValue="${usercenter}" convert="queryUserCenterMap" width="110"/>
			<t:fieldText property="danjh" caption="单据号" dataType="text" maxLength="10" minLength="10" width="110"/>
			<t:fieldText property="danjmc" caption="单据名称"  maxLength="20" width="110"/>
		<t:fieldSelect property="shenhzt" caption="审核状态" convert="shenhzt"  width="150"/>
		<t:fieldSelect property="danjlx" caption="单据类型" convert="danjlx"  width="150"/>
		</t:fieldLayout>
		

		<t:button caption="打印" name="print" active="1"/>
		<t:button caption="初审" name="chushen" active="0"/>
		<t:button caption="终审" name="zhongshen" active="1"/>
		<t:button caption="撤回" name="chehui" active="1"/>
			
		<t:gridCol   property="usercenter" caption="用户中心"  convert="queryUserCenterMap" ></t:gridCol>
		<t:gridCol property="danjh" caption="单据号" width="90" ></t:gridCol>
		<t:gridCol  property="danjmc" type="link" caption="单据名称"   width="130" ></t:gridCol>
		<t:gridCol   property="danjlx" caption="单据类型"  convert="danjlx"  width="80" ></t:gridCol>
		<t:gridCol property="shenhzt" caption="审核状态" convert="shenhzt"  width="80" ></t:gridCol>
		<t:gridCol  property="banch" caption="版次号"  width="80" ></t:gridCol>
				<t:gridCol  property="yunszfy" caption="运输总费用"  width="90" ></t:gridCol>
		<t:gridCol  property="yunsfy" caption="运输费用"  width="90" ></t:gridCol>
		<t:gridCol  property="fankfy" caption="返空费用"  width="90" ></t:gridCol>
		<t:gridCol  property="jinjfy" caption="紧急费用"  width="90" ></t:gridCol>
		<t:gridCol  property="lingxfy" caption="零星费用"  width="90" ></t:gridCol>
		<t:gridCol property="tuopfy" caption="托盘费用"   defaultValue="1" width="90"/>
		<t:gridCol  property="tuopfkfy" caption="托盘返空费用"  width="100" ></t:gridCol>


		<t:gridCol  property="yusr" caption="预审人"  width="70" ></t:gridCol>	
		<t:gridCol property="yus_time" caption="预审时间" width="130"/>
		<t:gridCol  property="chusr" caption="初审人"  width="70" ></t:gridCol>	
		<t:gridCol property="chus_time" caption="初审时间" width="130"/>
		<t:gridCol  property="zhongsr" caption="终审人"  width="70" ></t:gridCol>	
		<t:gridCol property="zhongs_time" caption="终审时间" width="130"/>
		<t:gridCol property="shenhkssj" caption="审核开始时间" width="130"/>
		<t:gridCol property="shenhjssj" caption="审核结束时间" width="130"/>
		<t:gridCol hidden="true" property="jinjjdjh" caption="紧急件单据号" width="0"></t:gridCol>
				<t:gridCol property="" caption=""/>
	</t:grid>	
</t:page>

<script type="text/javascript">

//审核状态
$.sdcui.serverConfig.convertArray['shenhzt'] = {
	'1' : '未审核',
	'2' : '已预审',
	'3' : '已初审',
	'4' : '已终审'
};


//单据类型
$.sdcui.serverConfig.convertArray['danjlx'] = {
	'1' : '正常件',
	'2' : '紧急件'
};


//预审
function func_button_yushen(){
	
	winOpen = window.open ('${ctx}/qhysfy/toYuShenPage.do?removeId=layout-north,layout-west,layout-south',
	         '','top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no, status=no');
	         winOpen.resizeTo(screen.availWidth,screen.availHeight);
}

//撤回
function func_button_chehui(){
	 var roles = $('#grid_yunsfyhz').grid('getSelectedRecords');
	 if(roles[0].shenhzt=='1'){
		 alert("未审核不需要撤回");
		 return false;			 		
	 }
	 if(roles[0].shenhzt=='4'){
		 alert("终审单据不能撤回");
		 return false;			 		
	 }

	 var params = [];
	 for(var i = 0 ; i < roles.length ; i++ ){
		 params.push("usercenter="+roles[i].usercenter);
		 params.push("danjh="+roles[i].danjh);
		 params.push("shenhzt="+roles[i].shenhzt);
		 params.push("danjlx="+roles[i].danjlx);
		 if(roles[i].jinjjdjh!=undefined){
			 params.push("jinjjdjh="+roles[i].jinjjdjh);
		}
	 }
	 if(confirm("你确定要撤回吗?")){
		 $.sdcui.ajaxUtil.ajax({
				url:'../qhysfy/chehuiYunsfyhz.ajax',
				data:params.join('&'),
				success:function(result){
					if(typeof result.success=="undefined"||result.success!==false){
						$("#grid_yunsfyhz").grid('reload');
					}
				}
			});
	 }		 

}

// 初审
function func_button_chushen(){
	 var roles = $('#grid_yunsfyhz').grid('getSelectedRecords');
	 if(roles.length==0){
		 alert("请至少选择一条记录");
		 return false;			 		
	 }else if(roles.length>2){
		 alert("最多只能选择两条记录");
		 return false;	
	 }else if(roles.length==2){
		 if((roles[0].danjlx=='1' && roles[1].danjlx=='1') ||　(roles[0].danjlx=='2' && roles[1].danjlx=='2')){
			 alert("不能两条正常件或者两条紧急件一起审"); 
			 return false;	
		 }else if(roles[0].shenhzt!='2' ||　roles[1].shenhzt!='2'){
			 alert("只能对已预审的单据进行初审");
			 return false;	
		 } 
	 }else if(roles.length==1 ){
	     if(roles[0].danjlx=='2'){
		    alert("请选择正常件的单据");
		    return false;	 
	     }else if(roles[0].shenhzt!='2'){
	    	 alert("只能对已预审的单据进行初审");
			 return false;	
	     }
	 }
	 var params = [];
	 for(var i = 0 ; i < roles.length ; i++ ){
		 params.push("list["+i+"].usercenter="+roles[i].usercenter);
		 params.push("list["+i+"].danjh="+roles[i].danjh);
		 params.push("list["+i+"].yunszfy="+roles[i].yunszfy);
		 params.push("list["+i+"].danjlx="+roles[i].danjlx);
	 }
	 if(confirm("你确定要初审吗?")){
		 $.sdcui.ajaxUtil.ajax({
				url:'../qhysfy/savechushen.ajax',
				data:params.join('&'),
				success:function(result){
					if(typeof result.success=="undefined"||result.success!==false){
						$("#grid_yunsfyhz").grid('reload');
					}
				}
			});
	 }		 
	
}


//打印
function func_button_print(){
	 var roles = $('#grid_yunsfyhz').grid('getSelectedRecords');
	 if(roles[0].shenhzt=='1' || roles[0].shenhzt=='2'){
		 alert("只有初审或者终审的单据才能打印");
		 return false;			 		
	 }
	 var roles = $('#grid_yunsfyhz').grid('getSelectedRecords');

	 
	 var strWindowType = "top=0,left=0,toolbar=no,location=no,directories=no,menubar=no,scrollbars=no,resizable=yes,status=yes";  
 
     window.open("../qhysfy/toprint.do?usercenter="+roles[0].usercenter+"&danjh="+roles[0].danjh+"&jinjjdjh="+roles[0].jinjjdjh,"",strWindowType);			       		
	 	
}

//超连接
	function link_danjmc(event) {
		var event = event || window.event;//原生态的事件处理 
		var element = event.srcElement || event.target;
		var rowDoc = $(element).parents('tr:first')[0];
		var record = $('#grid_yunsfyhz').grid('getRecord', rowDoc);//获取当前行对应的记录
	
		var danjmc = record.danjmc;
		if(danjmc=='未审核费用'){
		
			winOpen = window.open ('${ctx}/qhysfy/toYuShenPage.do?usercenter='+record.usercenter+'&removeId=layout-north,layout-west,layout-south',
					         record.danjh,'top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no, status=no');
					         winOpen.resizeTo(screen.availWidth,screen.availHeight);
	
		}else if(record.shenhzt==2){
			var params = [];
			params.push("usercenter="+record.usercenter);
			params.push("danjh="+record.danjh);
			params.push("banch="+record.banch);
			params.push("danjlx="+record.danjlx);
			var data = params.join('&');
			winOpen = window.open ('${ctx}/qhysfy/tochongsuan.do?removeId=layout-north,layout-west,layout-south&'+data,record.danjh,
				'top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no, status=no');
					winOpen.resizeTo(screen.availWidth,screen.availHeight);
		} else if(record.shenhzt==3 || record.shenhzt==4){
			var params = [];
			params.push("usercenter="+record.usercenter);
			params.push("danjh="+record.danjh);
			if(record.jinjjdjh!=undefined){
				 params.push("jinjjdjh="+record.jinjjdjh);
			}
	//		params.push("jinjjdjh="+record.jinjjdjh);
			params.push("danjlx="+record.danjlx);
			var data = params.join('&');
			winOpen = window.open ('${ctx}/qhysfy/tochushenpage.do?removeId=layout-north,layout-west,layout-south&'+data,record.danjh,
				'top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no, status=no');
					winOpen.resizeTo(screen.availWidth,screen.availHeight);
		}   
}


	//终审
	function func_button_zhongshen(){
		 var roles = $('#grid_yunsfyhz').grid('getSelectedRecords');
		 if(roles[0].shenhzt!='3'){
			 alert("只有初审状态才能进行终审");
			 return false;			 		
		 }

		 var params = [];
		 for(var i = 0 ; i < roles.length ; i++ ){
			 params.push("usercenter="+roles[i].usercenter);
			 params.push("danjh="+roles[i].danjh);
		 }
		 if(confirm("你确定要终审吗?")){
			 $.sdcui.ajaxUtil.ajax({
					url:'../qhysfy/zhongshenYunsfyhz.ajax',
					data:params.join('&'),
					success:function(result){
						if(typeof result.success=="undefined"||result.success!==false){
							$("#grid_yunsfyhz").grid('reload');
						}
					}
				});
		 }		 

	}
	
	
</script>

</t:html>