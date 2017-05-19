<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.xbkcpd}" >
<head>
	<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>

<t:page i18n="i18n.xqjs.anx.xbpd">


<style>
	
</style>
<!--主体内容开始-->
<t:form id="form_chushzy" submit="NOT" reset="NOT">
  <!--查询列表开始-->
  <t:grid id="chushzyGridQuery" caption="${i18n.pdcx}" idKeys="lingjbh,usercenter,shengcxbh,xiaohdbh,scjssj" showNum="true" 
	src="/anxorder/queryxbkpd.ajax"  edit="NOT" load="false" remove="NOT"  add="NOT"  showCheckbox="true" scrollHeight="135">
	<t:fieldLayout prefix="layout" columns="3">
	    <t:fieldSelect  property="usercenter" convert="queryUserCenterMap" caption="${i18n.usercenter}" width="150" ></t:fieldSelect>
		<t:fieldText property="lingjbh" caption="${i18n.lingjbh}"     maxLength="10"  width="150"></t:fieldText>
		<t:fieldText property="shengcxbh" caption="${i18n.shengcxbh}"     maxLength="5"   width="150"></t:fieldText>
		<t:fieldText property="xiaohdbh" caption="${i18n.xiaohdbh}"   maxLength="9"   width="150"></t:fieldText>
		<t:fieldSelect property="mos" caption="${i18n.mos}" width="150">
		     <t:fieldOption text="" value=""></t:fieldOption>
		     <t:fieldOption text="MD" value="MD"></t:fieldOption>
		</t:fieldSelect>
		<t:fieldSelect property="waibms" caption="${i18n.waibms}" width="150">
		     <t:fieldOption text="" value=""></t:fieldOption>
		     <t:fieldOption text="CD" value="CD"></t:fieldOption>
		</t:fieldSelect>
	</t:fieldLayout>
	<t:gridCol property="usercenter" caption="${i18n.usercenter}"></t:gridCol>
	<t:gridCol property="lingjbh" type="text" caption="${i18n.lingjbh}"></t:gridCol>
	<t:gridCol property="shengcxbh" caption="${i18n.shengcxbh}"></t:gridCol>
	<t:gridCol property="xiaohdbh" caption="${i18n.xiaohdbh}"></t:gridCol>
	<t:gridCol   property="xianbllkc" caption="${i18n.xianbllkc}"></t:gridCol>
	</t:grid>
	<t:buttons id="buttons_form">
			<t:button caption="${i18n.qued}" name="qued"></t:button>
	</t:buttons>
	 <t:grid id="chushzyGrid" caption="${i18n.xbpdbj}" idKeys="lingjbh,usercenter,shengcxbh,xiaohdbh,scjssj" showNum="true" 
	  edit="NOT" load="false" remove="NOT"  add="NOT"   submit="NOT" reset="NOT" scrollHeight="160"  showCheckbox="true">
	<t:button caption="${i18n.delete}" name="remove" active="0" icon="removeRecord"></t:button>
	<t:button caption="保存" name="save"></t:button>
	<t:button caption="${i18n.dcxls}" name="expxls" active="3"></t:button>
	<t:gridCol property="usercenter" caption="${i18n.usercenter}"></t:gridCol>
	<t:gridCol property="lingjbh" type="text" caption="${i18n.lingjbh}"></t:gridCol>
	<t:gridCol property="shengcxbh" caption="${i18n.shengcxbh}"></t:gridCol>
	<t:gridCol property="xiaohdbh" caption="${i18n.xiaohdbh}"></t:gridCol>
	<t:gridCol   property="xianbllkc" caption="${i18n.xianbllkc}"></t:gridCol>
	<t:gridCol   property="zhongzlxh" caption="${i18n.zhongzlxh}" editorOptions="{'notNull':true,closeEvent:jsdxh,'expression':'^[0-9A-Z]{9}$','expressionMessage':'9位的数字和字母'}" editor="fieldText" ></t:gridCol>
	<t:gridCol   property="kucsldxh" caption="${i18n.kucsldxh}"></t:gridCol>
	<t:gridCol   editor="fieldText"  property="pdsjkc" caption="${i18n.pdsjkc}" editorOptions="{'notNull':true,closeEvent:jscy,'expression':'^[0-9]{1,10}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$','expressionMessage':'整数部分最大位10位，小数部分最大位3位'}"></t:gridCol>
	<t:gridCol   property="cy" caption="${i18n.cy}" ></t:gridCol>
	</t:grid>
</t:form>
	<form id="exp" name="exp" action="${ctx}/anxorder/downLoadFilePd.do" method="post" style="background-color: white;" target="hiddenUp">
		<div style="display: none;">
			<t:fieldLayout prefix="dto">
				<t:fieldHidden property="param"></t:fieldHidden>
			</t:fieldLayout>
		</div>
	</form>
	<iframe name="hiddenUp" id="hiddenUp" style="display: none;"></iframe>
</t:page>
<script type="text/javascript">
	//保存按钮
	function func_button_save(){
		 var records = $("#chushzyGrid").grid("getSelectedRecords");
		 var length = records.length;//判断长度
		 if(length < 1){
			 alert("请选择一条数据!");
			 return false;
		 }
		 var validateMessages = $("#chushzyGrid").grid("validateBatchRecords");
			//状态edited validate-error
			if(validateMessages.length){
				$.sdcui.messageUtil.showError(validateMessages.join('\n'));
				return false;
			}
		 var params = [];
		 for (var i =0;i < records.length;i++){
			 	if(records[i].zhongzlxh == null){
			 		alert('总装流水号为空');
			 		return false;
			 	}
			 	if(records[i].pdsjkc == null){
			 		alert('实际盘点库存为空');
			 		return false;
			 	}
				params.push('list['+i+'].usercenter='+records[i].usercenter);
				params.push('list['+i+'].xiaohd='+records[i].xiaohdbh);
				params.push('list['+i+'].lingjbh='+records[i].lingjbh);
				params.push('list['+i+'].yicxhl='+records[i].cy);
				params.push('list['+i+'].kucsldxh='+records[i].kucsldxh.substr(1));
				params.push('list['+i+'].xianbllkc='+records[i].xianbllkc);
				params.push('list['+i+'].zhongzlxh='+records[i].zhongzlxh);
				params.push('list['+i+'].pdsjkc='+records[i].pdsjkc);
			}
		 $.sdcui.ajaxUtil.ajax({
	            url:"addYicdxh.ajax",//请求url
	            data:params.join('&'),
	           	success:function (result){
	           		alert(result.result);
	            }
	    	});
	}
	
     function func_button_qued(){
         var allRecords = $("#chushzyGrid").grid("getRecords");
         var records = $("#chushzyGridQuery").grid("getSelectedRecords");
         $('#chushzyGrid').grid('parseRecords', allRecords.concat(records));
     }

/**
	 *列渲染事件,创建checkbox	

	function createCheckbox() {
		return "<input  name='chkbox'  type='checkbox' value='1'/>";
	}	 */

     function func_button_remove(){
	     var records=$("#chushzyGrid .grid-content.youi-editor td.num").parent('tr:first').parent('tbody:first').find('tr.selected td');
	     if(records.length==0){
	        alert('${i18n.selectonedelete}');
	        return ;
	     }
         if(confirm('${i18n.verifydelete}')){
             //var records = $("#chushzyGrid").grid("getSelectedRecords");
	         var allRecords = $("#chushzyGrid").grid("getRecords");
	         for(var i=0;i<records.length;i++){
	             var k = $(records[i]).text();
	             k=parseInt(k)-1;
	            // for(var j=0;j<allRecords.length;j++){
	             //    if(parseInt(k)-1==j){
	                    //allRecords=allRecords.slice(0,j).concat(allRecords.slice(j+1,allRecords.length));
	                    allRecords[k]=null;
	             //    }
	            // }
	         }
	         for(var j=0;j<allRecords.length;j++){
	             if(allRecords[j]==null){
	                allRecords=allRecords.slice(0,j).concat(allRecords.slice(j+1,allRecords.length));
	                j--;
	             }
	         }
	         $('#chushzyGrid').grid('parseRecords', allRecords);
         }
        
     }

     function jscy(){
        var cell = this.col.cell;
		var rowElement = cell.parent('tr:first');
		var pdkcIndex = $('td.pdsjkc:first').prevAll().length;
		var xianbllkcIndex = $('td.xianbllkc:first').prevAll().length;
		var kucsldxhIndex = $('td.kucsldxh:first').prevAll().length;
		var cyIndex = $('td.cy:first').prevAll().length;
		var zhongzlxhIndex = $('td.zhongzlxh:first').prevAll().length;
		var pdkc = rowElement.find('td:eq(' + pdkcIndex + ')').text();
		var xianbllkc = rowElement.find('td:eq(' + xianbllkcIndex + ')').text();
		var kucsldxh = rowElement.find('td:eq(' + kucsldxhIndex + ')').text();
		var zhongzlxh = rowElement.find('td:eq(' + zhongzlxhIndex + ')').text();
		if(zhongzlxh==''||rowElement.find('td:eq(' + zhongzlxhIndex + ')').hasClass('validate-error')){
		   alert('${i18n.jslshbc}');
		}else{
			   if(pdkc!=''){
			   xianbllkc=xianbllkc==''?'0':xianbllkc;
			   kucsldxh=kucsldxh==''?'0':kucsldxh;
			   var cy=parseInt(xianbllkc)+parseInt(kucsldxh)-parseInt(pdkc);
			   rowElement.find('td:eq(' + cyIndex + ')').text(cy);
			}
		}
		
     }
     
     function jsdxh(){
        var cell = this.col.cell;
		var rowElement = cell.parent('tr:first');
		var usercenterIndex = $('td.usercenter:first').prevAll().length;
		var lingjbhIndex = $('td.lingjbh:first').prevAll().length;
		var shengcxbhIndex = $('td.shengcxbh:first').prevAll().length;
		var xiaohdbhIndex = $('td.xiaohdbh:first').prevAll().length;
		var zhongzlxhIndex = $('td.zhongzlxh:first').prevAll().length;
		//var scjssjIndex = $('td.scjssj:first').prevAll().length;
		var kucsldxhIndex = $('td.kucsldxh:first').prevAll().length;
		var usercenter = rowElement.find('td:eq(' + usercenterIndex + ')').text();
		var lingjbh = rowElement.find('td:eq(' + lingjbhIndex + ')').text();
		var shengcxbh = rowElement.find('td:eq(' + shengcxbhIndex + ')').text();
		var xiaohdbh = rowElement.find('td:eq(' + xiaohdbhIndex + ')').text();
		var zhongzlxh = rowElement.find('td:eq(' + zhongzlxhIndex + ')').text();
		var id = rowElement.attr('id');
		var scjssj = id.substr(id.lastIndexOf(',')+1);
		var param = [];
		param.push('usercenter='+usercenter);
		param.push('lingjbh='+lingjbh);
		param.push('shengcxbh='+shengcxbh);
		param.push('xiaohdbh='+xiaohdbh);
		param.push('zhongzlxh='+zhongzlxh);
		param.push('scjssj='+scjssj);
		if(zhongzlxh!=''&&!rowElement.find('td:eq(' + zhongzlxhIndex + ')').hasClass('validate-error')){
				$.sdcui.ajaxUtil.ajax({
					url : "${ctx}/anxorder/checkLsh.ajax",
					data : param.join('&'),
					success : function(result) {
						/* if(result.msg!=null){
						    rowElement.find('td:eq(' + zhongzlxhIndex + ')').addClass('validate-error').attr('title',result.msg);
						 }else{
						    rowElement.find('td:eq(' + zhongzlxhIndex + ')').removeClass('validate-error');
						    var dxh = result.result;
						    rowElement.find('td:eq(' + kucsldxhIndex + ')').text(dxh);
						 }*/
						  var dxh = result.result;
						  rowElement.find('td:eq(' + kucsldxhIndex + ')').text(dxh);
					}
				});
		}
		
     }
     
     function func_button_expxls(){
        $("#chushzyGrid").grid("triggerCloseEdited");
        var param = $("#chushzyGrid").grid("getRecords");
        var params = [];
        for(var i=0;i<param.length;i++){
            params.push('pd[' + i + '].usercenter=' + param[i].usercenter);
            params.push('pd[' + i + '].lingjbh=' + param[i].lingjbh);
            params.push('pd[' + i + '].shengcxbh=' + param[i].shengcxbh);
            params.push('pd[' + i + '].xiaohdbh=' + param[i].xiaohdbh);
            if(typeof param[i].xianbllkc != 'undefined')
            params.push('pd[' + i + '].xianbllkc=' + param[i].xianbllkc);
            
            if(typeof param[i].zhongzlxh != 'undefined')
            params.push('pd[' + i + '].zhongzlxh=' + param[i].zhongzlxh);
            
            if(typeof param[i].kucsldxh != 'undefined')
            params.push('pd[' + i + '].kucsldxh=' + param[i].kucsldxh);
            
            if(typeof param[i].pdsjkc != 'undefined')
            params.push('pd[' + i + '].pdsjkc=' + param[i].pdsjkc);
            
            if(typeof param[i].cy != 'undefined')
            params.push('pd[' + i + '].cy=' + param[i].cy);
        }
        $('#dto_param').fieldValue(params.join('&'));
		var fm = document.getElementById("exp");
		//fm.action="${ctx}/anxorder/downLoadFilePd.do?"+params.join('&');
		fm.submit();
     }
</script>
</t:html>