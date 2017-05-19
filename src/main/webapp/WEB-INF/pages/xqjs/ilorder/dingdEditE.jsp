<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="订单修改">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>

</head>

<t:page>

	<t:form id="ilquery" reset="NOT" submit="NOT">
		<t:grid id="ilorderEe" idKeys="DINGDH,HETH,GONGYSDM,EDIT_TIME,EDITOR,DINGDNR" caption=""  editAlias="DingdUpdate" src="/ilorder/queryDd.ajax" usePager="true" edit="NOT"
			load="false"  remove="NOT" scrollHeight="225" add="NOT" back="NOT" showCheckbox="true"  showNum="true" >
			<t:button name="removeSelected" active="0" caption="删除" icon="removeRecord"></t:button>
			<t:button name="add" active="0" caption="增加" icon="addRecord"></t:button>
			<t:fieldLayout id="ilselect" prefix="il" columns="4">
				<t:fieldSelect property="usercenter" width="100" caption="用户中心" convert="queryUserCenterMap" ></t:fieldSelect>
				<t:fieldText property="gongysdm" caption="供应商代码" width="100" maxLength="10"></t:fieldText>
				<t:fieldText property="dingdh" caption="订单号" width="100"  maxLength="9"></t:fieldText>
				<t:fieldSelect property="dingdlx" caption="订单类型" convert="dingdlx1" width="100" notNull="true" defaultValue="0"></t:fieldSelect>
				<t:fieldCalendar property="dingdjssjFrom" caption="制作时间"  format="yyyy-MM-dd HH:mm:ss" width="100"></t:fieldCalendar>
				<t:fieldCalendar property="dingdjssjTo" caption="至" format="yyyy-MM-dd HH:mm:ss" width="100"></t:fieldCalendar>
				<t:fieldCalendar property="dingdsxsjFrom" caption="生效时间" format="yyyy-MM-dd" width="100"></t:fieldCalendar>
				<t:fieldCalendar property="dingdsxsjTo" caption="至" format="yyyy-MM-dd" width="100"></t:fieldCalendar>
				<t:fieldSelect property="chullx" caption="订单类别"  width="100" notNull="true" defaultValue="PP"></t:fieldSelect>
				<t:fieldSelect property="dingdzt" caption="订单状态" convert="ddzt" width="100"></t:fieldSelect>
				<t:fieldText property="editor" caption="维护人" width="100"></t:fieldText>
				<t:fieldText property="fahzq" caption="发运区间" maxLength="10" width="100"></t:fieldText>
				<t:fieldSelect property="jihyz" caption="计划员组" width="100" convert="getJihz"></t:fieldSelect>
			</t:fieldLayout >
			<t:gridCol property="DINGDH" type="link" caption="订单号"></t:gridCol>
			<t:gridCol property="USERCENTER" type="text" caption="用户中心"></t:gridCol>
			<t:gridCol property="CHULLX" type="text" caption="订单类别" convert="chullx2"></t:gridCol>
			<t:gridCol property="DINGDLX" caption="订单类型" convert="queryDingdlx"></t:gridCol>
			<t:gridCol property="GONGYSDM" type="text" caption="供应商代码"></t:gridCol>
			<t:gridCol property="FAHZQ" type="text" caption="发运区间"></t:gridCol>
			<t:gridCol editorOptions="{'format':'yyyy-MM-dd HH:mm:ss'}" property="DINGDJSSJ" type="text" caption="制作时间"></t:gridCol>
			<t:gridCol editorOptions="{'format':'yyyy-MM-dd HH:mm:ss'}" property="DINGDSXSJ" type="text" caption="生效时间"></t:gridCol>
			<t:gridCol property="JIHYZ" type="text" caption="计划员组"></t:gridCol>
			<t:gridCol property="EDITOR" type="text" caption="维护人"></t:gridCol>
			<t:gridCol property="DINGDZT" type="text" caption="订单状态" convert="ddzt"></t:gridCol>
			<t:gridCol property="BEIZ" type="text" caption="备注" ></t:gridCol>
		</t:grid>
	</t:form>
	<t:fieldLayout columns="1">
		<t:buttons id="btn">
			<t:button caption="生效" name="effect" />
			<t:button caption="待生效" name="uneffect" />
			<t:button caption="拒绝" name="refuse" />
			<t:button caption="周期订单导出" name="orderExp" />
			<t:button caption="按需订单导出" name="anxOrderExp" />
		</t:buttons>
	</t:fieldLayout>

	<t:form id="ilAdd" dialog="true" caption="新增" submit="NOT" >
		<t:fieldLayout prefix="add">
			<t:fieldSelect property="usercenter" width="150" caption="用户中心" convert="queryUserCenterMap" notNull="true"></t:fieldSelect>
			<t:fieldSelect property="dingdlx" caption="订单类型" width="150" notNull="true" convert="dingdlx2" defaultValue="0"></t:fieldSelect>
			<t:fieldSelect property="chullx" caption="订单类别" width="150" notNull="true" convert="chullx"  defaultValue="PP"></t:fieldSelect>
			<t:fieldText property="gongysdm" caption="供应商代码" width="150" notNull="true" maxLength="10"></t:fieldText>
			<t:fieldText property="fahzq" caption="发运区间"  width="150" notNull="true" maxLength="10" ></t:fieldText>
			<t:fieldText property="dingdnr" caption="订单内容"  maxLength="5"  expression="(^[9]+[8]*){1,5}$" expressionMessage="订单内容9和8组成，9在前，最长5位"
				notNull="true" width="150" defaultValue="9888"></t:fieldText>
			<t:fieldCalendar property="dingdjssj" caption="订单制作时间"     width="150" format="yyyy-MM-dd HH:mm:ss"></t:fieldCalendar>
			<t:fieldText property="jiszq" caption="计算周期"     width="150" maxLength="10" notNull="true"></t:fieldText>
			<t:fieldText property="beiz" caption="备注" width="150" maxLength="100"></t:fieldText>
			<t:button caption="提交" name="subAdd"></t:button>
		</t:fieldLayout>
	</t:form>
  
	<form id="exp" name="exp" action="${ctx}/ilorder/downLoadFileIlOrder.do" method="post" style="background-color: white;" target="hiddenUp" style="display: none;">
		      <t:fieldLayout prefix="dto">
					<t:fieldHidden property="dingdh"></t:fieldHidden>
					<t:fieldHidden property="chullx"></t:fieldHidden>
			 </t:fieldLayout>
	</form>
	
	<form id="expAnx" name="expAnx" action="${ctx}/ilorder/anxDingdmxDownload.do" method="post" style="background-color: white;" target="hiddenUp" style="display: none;">
		      <t:fieldLayout prefix="dtoAnx">
					<t:fieldHidden property="usercenter"></t:fieldHidden>
					<t:fieldHidden property="dingdh"></t:fieldHidden>
					<t:fieldHidden property="chullx"></t:fieldHidden>
					<t:fieldHidden property="gongysdm"></t:fieldHidden>
					<t:fieldHidden property="dingdlx"></t:fieldHidden>
					<t:fieldHidden property="dingdzt"></t:fieldHidden>
					<t:fieldHidden property="editor"></t:fieldHidden>
					<t:fieldHidden property="dingdjssjFrom"></t:fieldHidden>
					<t:fieldHidden property="dingdjssjTo"></t:fieldHidden>
			 </t:fieldLayout>
	</form>
<iframe name="hiddenUp" id="hiddenUp" style="display: none;"></iframe>
</t:page>

<script type="text/javascript">
	$.sdcui.serverConfig.convertArray['ddzt'] = {
		'0' : '已定义',
		'1' : '制作中',
		'2' : '待生效',
		'3' : '拒绝',
		'4' : '已生效',
		'5' : '已发送',
		'A' : '待生效A'
	};
    $.sdcui.serverConfig.convertArray['dingdlx1'] = {
		'0' : 'IL',
		'5' : '按需订单',
		'9' : '卷料订单'
	};
    
    $.sdcui.serverConfig.convertArray['dingdlx2'] = {
    		'0' : 'IL'
    };
    
	$.sdcui.serverConfig.convertArray['chullx'] = {
		'PP' : '周期',
		'PS' : '周',
		'PJ' : '日',
		'VJ' : 'VJ',
		'MJ' : 'MJ'          
	};
	
	$.sdcui.serverConfig.convertArray['chullx2'] = {
			'PP' : '周期',
			'PS' : '周',
			'PJ' : '日',
			'C1' : '按需C1订单',
    		'M1' : '按需M1订单',
    		'CD' : '按需CD订单',
    		'MD' : '按需MD订单',
    		'CV' : '按需CV订单',
    		'MV' : '按需MV订单'
	};
   
   function getQueryParams(){
       var params=[];
       params.push('usercenter='+$('#il_usercenter').fieldValue());
       params.push('gongysdm='+$('#il_gongysdm').fieldValue());
       params.push('dingdh='+$('#il_dingdh').fieldValue());
       params.push('dingdlx='+$('#il_dingdlx').fieldValue());
       params.push('dingdjssjFrom='+$('#il_dingdjssjFrom').fieldValue());
       params.push('dingdjssjTo='+$('#il_dingdjssjTo').fieldValue());
       params.push('dingdsxsjFrom='+$('#il_dingdsxsjFrom').fieldValue());
       params.push('dingdsxsjTo='+$('#il_dingdsxsjTo').fieldValue());
       params.push('chullx='+$('#il_chullx').fieldValue());
       params.push('dingdzt='+$('#il_dingdzt').fieldValue());
       params.push('editor='+$('#il_editor').fieldValue());
       params.push('fahzq='+$('#il_fahzq').fieldValue());
       params.push('jihyz='+$('#il_jihyz').fieldValue());
       return params;
   }
   
   
   
   
   function func_button_add(){
      $('#add_dingdlx').fieldValue("0");
      $('#add_chullx').fieldValue("PP");
      $('#add_dingdnr').fieldValue("9888");
      $("#ilAdd").form("open");

   }
  
   /**
	*列渲染事件,创建checkbox	
	
	function createCheckbox(){
		return "<input  name='chkbox'  type='checkbox' value='1'/>";
	}*/
   
   $(function() {
	   var element = $("div#field-pop-il_chullx");
	   element.append('<div class="option-item selected" value="PP">周期</div>');
       element.append('<div class="option-item" value="PS">周</div>');
       element.append('<div class="option-item" value="PJ">日</div>');
       element.append('<div class="option-item" value="VJ">VJ</div>');
       element.append('<div class="option-item" value="MJ">MJ</div>');
       $("#il_chullx").find('input.value').val("PP");
       $("#il_chullx").find('input.textInput').val("周期");
       element.addClass("loaded");
       add_dingdlx_change();
   })
   
   
  function il_dingdlx_change(){
	    var element = $("div#field-pop-il_chullx");
	    element.removeClass("loaded");
	    $("#il_chullx").find('input.value').val("");
	    element.empty();
	    var chullx={};
	    var dingdlx = $("#il_dingdlx").fieldValue();
	    if(dingdlx=='0'){
	       // chullx={'PP' : '周期','PS' : '周','PJ' : '日'};	
	       
	       element.append('<div class="option-item selected" value="PP">周期</div>');
	       element.append('<div class="option-item" value="PS">周</div>');
	       element.append('<div class="option-item" value="PJ">日</div>');
	       element.append('<div class="option-item" value="VJ">VJ</div>');
	       element.append('<div class="option-item" value="MJ">MJ</div>');
	       $("#il_chullx").find('input.value').val("PP");
	       $("#il_chullx").find('input.textInput').val("周期");
	    }else if(dingdlx=='5'){
	    	// chullx={'C' : '按需'};	
	    	 element.append('<div class="option-item selected" value="C">按需</div>');
	    	 element.append('<div class="option-item" value="CV">CV</div>');
		     element.append('<div class="option-item" value="MV">MV</div>');
	    	 $("#il_chullx").find('input.value').val("C");
	    	 $("#il_chullx").find('input.textInput').val("按需");
	    }else if(dingdlx=='9'){
	    	// chullx={'PP' : '周期'};	
	    	element.append('<div class="option-item selected" value="PP">周期</div>');
	    	$("#il_chullx").find('input.value').val("PP");
	    	$("#il_chullx").find('input.textInput').val("周期");
	    }
	    element.addClass("loaded");
   } 
   
	
	function add_chullx_change(){
		$('#add_gongysdm').fieldValue("");
	}
	
   function add_dingdlx_change(){
	    var element = $("div#field-pop-add_chullx");
	    element.removeClass("loaded");
	    $("#add_chullx").find('input.value').val("");
	    element.empty();
	    var dingdlx = $("#add_dingdlx").fieldValue();
	    if(dingdlx=='0'){
	       // chullx={'PP' : '周期','PS' : '周','PJ' : '日'};	
	       
	       element.append('<div class="option-item selected" value="PP">周期</div>');
	       element.append('<div class="option-item " value="PS">周</div>');
	       element.append('<div class="option-item " value="PJ">日</div>');
	       element.append('<div class="option-item " value="VJ">VJ</div>');
	       $("#add_chullx").find('input.value').val("PP");
	       $("#add_chullx").find('input.textInput').val("周期");
	    }else if(dingdlx=='5'){	
	    	 element.append('<div class="option-item selected" value="C1">正常按需C1订单</div>');
	    	 element.append('<div class="option-item " value="CD">初始化按需CD订单</div>');
	    	 $("#add_chullx").find('input.value').val("C1");
	    	 $("#add_chullx").find('input.textInput').val("正常按需C1订单");
	    }else if(dingdlx=='6'){	
	    	 element.append('<div class="option-item selected" value="M1">正常按需M1订单</div>');
	    	 element.append('<div class="option-item " value="MD">初始化按需MD订单</div>');
	    	 $("#add_chullx").find('input.value').val("M1");
	    	 $("#add_chullx").find('input.textInput').val("正常按需M1订单");
	    }
	    element.addClass("loaded");
  } 
  
   
   
   
	//订单新增后，刷新表格
	function func_button_subAdd() {
		    
		    //平台验证
			var errorMessage = [];
			if (!$('#ilAdd').form('validate')) {
			$('#ilAdd').find('.youi-field.validating,.youi-field.validate-error').each(
					function() {
						if (this.title)
							errorMessage.push(this.title);
					});
			}	
				
		    if($('#add_gongysdm[error]').length!=0){
			   var msg = $('#add_gongysdm').attr("error");
			   $('#add_gongysdm').attr("class","youi-field fieldText validate-error");
			   errorMessage.push(msg);
			}
		    var fahzq = $('#add_fahzq').fieldValue();
		    var jiszq = $('#add_jiszq').fieldValue();
			var chullx = $('#add_chullx').fieldValue();
		    var msg = "";
		    var str ="";
		   if(chullx=='PP'||chullx=='PS'){
		      str = /^\d{6}$/;
		      msg = "订单类别周期或周的时间格式：yyyyMM或yyyyWW";
		   }else if(chullx=='PJ'||chullx.indexOf('C')!=-1||chullx.indexOf('M')!=-1||chullx=='VJ'){
			   str = /^\d{4}[-]\d{2}[-]\d{2}$/;
			   msg = "订单类别日或按需的时间格式：yyyy-MM-dd";
		   }
	       if(!str.test(fahzq)&&fahzq!=""){
	    	   $('#add_fahzq').attr("error","【发货区间】"+msg);
	       }else if(str.test(fahzq)){
	    	   $('#add_fahzq').removeAttr("error"); 
	       }else if(!str.test(jiszq)&&jiszq!=""){
	    	   $('#add_jiszq').attr("error","【计算周期】"+msg);
	       }else if(str.test(jiszq)){
	    	   $('#add_jiszq').removeAttr("error"); 
	       }
		    if($('#add_fahzq[error]').length!=0){
				   var msg = $('#add_fahzq').attr("error");
				   $('#add_fahzq').attr("class","youi-field fieldText validate-error");
				   errorMessage.push(msg);
			}
		    if($('#add_jiszq[error]').length!=0){
				   var msg = $('#add_jiszq').attr("error");
				   $('#add_jiszq').attr("class","youi-field fieldText validate-error");
				   errorMessage.push(msg);
				}
			if(errorMessage.length!=0){
			   	alert(errorMessage.join('\n'));
			    return ;
			}	
		

		var params = [];
		var usercenter = $('#add_usercenter').fieldValue();
		//var dingdh = $('#add_dingdh').fieldValue();
		var gongysdm = $('#add_gongysdm').fieldValue();
		var dingdlx = $('#add_dingdlx').fieldValue();
		//var heth = $('#add_heth').fieldValue();
		var dingdjssj = $('#add_dingdjssj').fieldValue();
		var fahzq = $('#add_fahzq').fieldValue();
		var chullx = $('#add_chullx').fieldValue();
		var dingdnr = $('#add_dingdnr').fieldValue();
		var beiz = $('#add_beiz').fieldValue();
		params.push('dd[0].usercenter=' + usercenter);
		//params.push('dd[0].dingdh=' + dingdh);
		params.push('dd[0].gongysdm=' + gongysdm);
		params.push('dd[0].dingdlx=' + dingdlx);
		//params.push('dd[0].heth=' + heth);
		//params.push('dd[0].dingdwhr=' + dingdwhr);
		params.push('dd[0].fahzq=' + fahzq);
		params.push('dd[0].chullx=' + chullx);
		params.push('dd[0].shiffsgys=' + '1');
		params.push('dd[0].beiz=' + beiz);
		params.push('dd[0].dingdnr=' + dingdnr);
		params.push('dd[0].dingdjssj=' + dingdjssj);
		params.push('pattern=' + chullx);
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/ilorder/insertIlDd.ajax",
			data : params.join('&'),
			success : function(result) {
				alert(result.result);
				$("#ilAdd").form('close');
				 $('#ilorderEe').grid('reload');
			}
		});

	}

	function getPattern(chullx,dingdlx){
		  var pattern = "";
		  if(dingdlx=="0"&&chullx=="PP"){
			  pattern = "PP";
		  }else if(dingdlx=="0"&&chullx=="PS"){
			  pattern = "PS";
		  }else if(dingdlx=="0"&&chullx=="PJ"){
			  pattern = "PJ";
		  }else if(dingdlx=="5"){
			  pattern = "C1";
		  }else if(dingdlx=="6"){
			  pattern = "M1";
		  }else if(dingdlx=="7"){
			  pattern = "CD";
		  }else{
			  pattern = "MD";
		  }
		  return pattern;
	}
	
	
	$(function() {
		$('#add_gongysdm').bind('focusout', function() {
			var usercenter = $('#add_usercenter').fieldValue();
			var gongysdm = $('#add_gongysdm').fieldValue();
			var dingdlx = $('#add_dingdlx').fieldValue();
			var chullx = $('#add_chullx').fieldValue();
			if (gongysdm == ''||usercenter=='') {
				//alert('供应商代码不能为空！');
				return false;
			}
			var date =  'usercenter=' + usercenter + '&gongysdm=' + gongysdm+"&chullx="+chullx;
			var address = "${ctx}/ilorder/validateExistGys.ajax";
			var pagemsg = "【供应商代码】输入有误";
			if(dingdlx =='6'){
			   address = "${ctx}/ilorder/validateDindhck.ajax";
			   pagemsg = "【供应商代码】M订单订货仓库或线边仓库输入有误";
			}
			else
			{
				date += "&zhizlx=97W";
			}
			$.sdcui.ajaxUtil.ajax({
				url : address,
				data : date,
				success : function(result) {
				    var msg = result.msg;
				    if(typeof(msg)!='undefined'){
				    $('#add_gongysdm').attr("error",pagemsg);
				    alert(msg);
				    }else{
				    	$('#add_gongysdm').removeAttr("error"); 
				    }
				}
			});
		})
		
		
	})

	function func_button_export() {
		var sxdd = $('#ilorderEe').grid('getSelectedRecords');
		//判断是否有选中一条数据
		if (sxdd.length != 1) {
			alert("请选择一条数据!");
			return false;
		}
		var params = [];
		for(var i=0,len=sxdd.length;i<len;i++){
		    if (sxdd[0].DINGDZT != 4) {
				alert("只能导出生效的订单!");
				return false;
		    }
		    params.push("dingdh=" + sxdd[0].DINGDH);
		    params.push("usercenter=" + sxdd[0].USERCENTER);
		    params.push("dingdzt=" + sxdd[0].DINGDZT);
		}
		
		var data = params.join('&');
		// 调用导出
		window.location = "${ctx}/ilorder/expilOrder.ajax?" + data;
	}
	
	
	/**
	 *自定义删除
	 */
	function func_grid_removeSelected() {
		var dd = $('#ilorderEe').grid('getSelectedRecords');
		//if(dd.length==0) alert('请选择要删除的记录！');
		var params = [];
		var recordLength = dd.length;
		if(recordLength<1){
			alert("请选择一条记录!");
		}else{
			if (confirm("确认删除选中记录?")) {
				for ( var i = 0, len = dd.length; i < len; i++) {
					params.push('dd[' + i + '].dingdh=' + dd[i].DINGDH);
					var zt = dd[i].DINGDZT;
					if (zt != 1&& zt != 3){
						alert('只能删除制作中和拒绝的订单！');
	                    return false;				
					}
					params.push('dd[' + i + '].dingdzt=' + zt);
					params.push('dd[' + i + '].edit_time=' + dd[i].EDIT_TIME);
					params.push('dd[' + i + '].editor=' + dd[i].EDITOR);
				}
	
				$.sdcui.ajaxUtil.ajax({
					url : 'deleteDd.ajax',
					data : params.join('&'),
					success : function(result) {
						alert(result.result);
						$('#ilorderEe').grid('reload');
					}
				});
			}
		}
	}

	function func_button_effect() {
		//获得选中行参数
		var param = $('#ilorderEe').grid('getSelectedRecords');
		var params = [];
		//判断是否有选中一条数据
		if (param.length == 0) {
		    if (confirm("您确认要生效按查询条件筛选出的所有订单吗?")) {
				params=getQueryParams();
		    }else{
		        return ;
		    }
		}else{
			for ( var i = 0, len = param.length; i < len; i++) {
				params.push('dd[' + i + '].usercenter=' + param[i].USERCENTER);
				params.push('dd[' + i + '].dingdh=' + param[i].DINGDH);
				params.push('dd[' + i + '].dingdzt=' + param[i].DINGDZT);
				params.push('dd[' + i + '].edit_time=' + param[i].EDIT_TIME);
				params.push('dd[' + i + '].editor=' + param[i].EDITOR);
			}
		}
		params.push('flag=1');
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/ilorder/updateDaStatus.ajax",
			data : params.join('&'),
			success : function(result) {
				alert(result.result);
				$('#ilorderEe').grid('reload');
			}
		});

	}

	function func_button_uneffect() {
		//获得选中行参数
		var param = $('#ilorderEe').grid('getSelectedRecords');
		var params = [];
		//判断是否有选中一条数据
		if (param.length == 0) {
			if (confirm("您确认要待生效按查询条件筛选出的所有订单吗?")) {
				params=getQueryParams();
		    }else{
		        return ;
		    }
		}else{
			    for ( var i = 0, len = param.length; i < len; i++) {
				params.push('dd[' + i + '].usercenter=' + param[i].USERCENTER);
				params.push('dd[' + i + '].dingdh=' + param[i].DINGDH);
				params.push('dd[' + i + '].dingdzt=' + param[i].DINGDZT);
				params.push('dd[' + i + '].edit_time=' + param[i].EDIT_TIME);
				params.push('dd[' + i + '].editor=' + param[i].EDITOR);
			}
		}
		
		params.push('flag=0');
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/ilorder/updateDaStatus.ajax",
			data : params.join('&'),
			success : function(result) {
				alert(result.result);
				$('#ilorderEe').grid('reload');
			}
		});

	}

	function func_button_refuse() {
		var params = [];
		//获得选中行参数
		var param = $('#ilorderEe').grid('getSelectedRecords');
		//判断是否有选中一条数据
		if (param.length == 0) {
			if (confirm("您确认要拒绝按查询条件筛选出的所有订单吗?")) {
				params=getQueryParams();
		    }else{
		        return ;
		    }
		}else{
			    for ( var i = 0, len = param.length; i < len; i++) {
				params.push('dd[' + i + '].usercenter=' + param[i].USERCENTER);
				params.push('dd[' + i + '].dingdh=' + param[i].DINGDH);
				params.push('dd[' + i + '].dingdzt=' + param[i].DINGDZT);
				params.push('dd[' + i + '].edit_time=' + param[i].EDIT_TIME);
				params.push('dd[' + i + '].editor=' + param[i].EDITOR);
			}
		}
		
		params.push('flag=2');
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/ilorder/updateDaStatus.ajax",
			data : params.join('&'),
			success : function(result) {
				alert(result.result);
				$('#ilorderEe').grid('reload');
			}
		});

	}
	/**
	 *订单号链接点击事件
	 */
	function link_DINGDH(event) {
		var url='initDdlj.do' ;
		var event = event || window.event;//原生态的事件处理 
		var element = event.srcElement || event.target;
		var rowDoc = $(element).parents('tr:first')[0];
		var record = $('#ilorderEe').grid('getRecord', rowDoc);//获取当前行对应的记录
		var chullx = record.CHULLX;
		var DINGDH = record.DINGDH;
		var DINGDNR =record.DINGDNR;
		var USERCENTER = record.USERCENTER;
		var GONGYSDM = record.GONGYSDM;
		var DINGDZT = record.DINGDZT;
		var FAHZQ = record.FAHZQ;
	
		if(chullx.indexOf('C')!=-1||chullx.indexOf('M')!=-1){
			url = 'initAnxDingd.do';
		}
		url = url+'?DINGDH='+DINGDH+'&DINGDNR='+DINGDNR+'&USERCENTER='+USERCENTER+'&GONGYSDM='+GONGYSDM+'&CHULLX='+chullx+'&DINGDZT='+DINGDZT+'&FAHZQ='+FAHZQ;
		winOpen = window.open(url,
				'订单信息',
		 'top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no, status=no');
//		alert(screen.availWidth+"*"+screen.availHeight);
		winOpen.resizeTo(screen.availWidth,screen.availHeight);
		
		/**
		 * form跳转模式提交
		 url='/ilorder/initDdlj.do'
		 */
		/**$.sdcui.pageUtils.goPage({
			url : url,//url
			record : record,//
			mode : 'form',
			beforeSubmit : function() {
				//
				return true;
			}
		});*/

	}
	
   function func_button_orderExp(){
	    /*var fm = document.getElementById("expform");
		fm.action = "${ctx}/ilorder/execute.do";
		fm.target = "_blank";
		fm.submit();*/
	   var chullx = $("#il_chullx").fieldValue();
	   if(chullx!='PP'&&chullx!='PS'&&chullx!='PJ'&&chullx!='VJ'&&chullx!='MJ'){
		   alert("只能导出订单类别为周期、周、日、VJ、MJ的订单");
		   return ;
	   }
	   var records = $('#ilorderEe').grid('getSelectedRecords');
	   if(records.length==0){
	           var params = getQueryParams();
			   $.sdcui.ajaxUtil.ajax({
				url : "${ctx}/ilorder/queryDdNopages.ajax",
				data : params.join('&'),
				success : function(result) {
				    records = result['result'];
					if(records.length==0){
					   alert("没有可以导出的订单");
					   return ;
					}else{
					      expDto(records);
					}
				}
			});
		   
	   }else{
	        expDto(records);
	   }
	    
   }	
   
	function expDto(records) {
		var dingdh = "(";
		for ( var i = 0; i < records.length; i++) {
			var dh = typeof records[i].DINGDH == 'undefined' ? records[i].dingdh
					: records[i].DINGDH;
			if (i == records.length - 1) {
				dingdh += "'" + dh + "')";
				break;
			}
			dingdh += "'" + dh + "',";
		}
		$("#dto_dingdh").fieldValue(dingdh);
		$("#dto_chullx").fieldValue($("#il_chullx").fieldValue());
		var fm = document.getElementById("exp");
		fm.submit();

	}

	function callback(msg) {
		if (msg != null) {
			alert(msg);
		}
	}
	
	  /*******************************************  start  ************************************************
	   * 按需待生效订单导出  mantis:0011506
	   * hzg 2015.7.14
	   */
		function func_button_anxOrderExp() {
			var dingdlx = $("#il_dingdlx").fieldValue();
			var dingdzt = $("#il_dingdzt").fieldValue();
			if (dingdlx === '5' && dingdzt === 'A') {
				var params = getQueryParams();
				$.sdcui.ajaxUtil.ajax({
					url : "${ctx}/ilorder/queryAnxDdCount.ajax",
					data : params.join('&'),
					success : function(result) {
						if (result.result == 0) {
							alert("当天没有可以导出的【待生效A】按需订单");
							return;
						} else {
							$("#dtoAnx_chullx").fieldValue($("#il_chullx").fieldValue());
							$("#dtoAnx_usercenter").fieldValue($("#il_usercenter").fieldValue());
							$("#dtoAnx_gongysdm").fieldValue($("#il_gongysdm").fieldValue());
							$("#dtoAnx_dingdh").fieldValue($("#il_dingdh").fieldValue());
							$("#dtoAnx_dingdlx").fieldValue($("#il_dingdlx").fieldValue());
							$("#dtoAnx_dingdzt").fieldValue($("#il_dingdzt").fieldValue());
							$("#dtoAnx_editor").fieldValue($('#il_editor').fieldValue());
							$("#dtoAnx_dingdjssjFrom").fieldValue($('#il_dingdjssjFrom').fieldValue());
							$("#dtoAnx_dingdjssjTo").fieldValue($('#il_dingdjssjTo').fieldValue());
							var fm = document.getElementById("expAnx");
							fm.submit();
						}
					}
				});
			}else{
				alert("请选择订单状态为【待生效A】的订单");
				return;
			}	
		}
	/*******************************************  end  ************************************************/
	
	
</script>

<style type="text/css">
.but {
	width: 100px;
	float: left;
	text-align: center;
	margin: 0 0 0 5px;
}
#ilAdd td.contral.label-col.col-0{width:100px;}
#ilAdd td.contral.label-col.col-2{width:130px;}
</style>
</t:html>