<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.addMaoxq}" >
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<script type="text/javascript">
		     $(function(){
			    removeHidden();
			 })
		</script>
	</head>

	<t:page  i18n="i18n.xqjs.maoxq.addEditMaoxq">

	<t:form id="form_maoxqAdd" submit="NOT" reset="NOT" dialog="false" >
		    <t:fieldLayout   columns="1"  id="addMaoxq"  prefix="ins" >
				        <t:fieldHidden property="xuqbc" ></t:fieldHidden>
				        <t:fieldHidden property="usercenter" ></t:fieldHidden>
				        <t:fieldHidden property="lingjbh" ></t:fieldHidden>
				        <t:fieldHidden property="zhizlx" ></t:fieldHidden>
				        <t:fieldHidden property="shiycj" ></t:fieldHidden>
				        <t:fieldHidden property="chanx" ></t:fieldHidden>
				        <t:fieldHidden property="danw" ></t:fieldHidden>
				        <t:fieldHidden property="lingjmc" ></t:fieldHidden>
				        <t:fieldHidden property="jihyz" ></t:fieldHidden>
				        <t:fieldHidden property="mode" ></t:fieldHidden>
		    </t:fieldLayout>
		    <t:grid id="maoxqmxAdd"  editable="true" submit="NOT" reset="NOT" caption="${i18n.addMaoxq}" usePager="false" idKeys="usercenter,lingjbh,zhizlx"
		            save="NOT"  load="false"   back="NOT" scrollHeight="520" 
		            showEditorAddName="editorAdd" showEditorRemoveName="editorRemove">
		                 <t:gridCol   editor="fieldSelect"    type="text"     property="usercenter"   
		                 caption="${i18n.usercenter}" convert="queryUserCenterMap" editorOptions="{'notNull':true,closeEvent:func_set_lingj,defaultValue:'UW'}"></t:gridCol>
		                 <t:gridCol   editor="fieldText"      type="text"     property="shiycj"       
		                 caption="${i18n.shiycj}"    editorOptions="{'expression':'^[A-Z0-9]{3}$','expressionMessage':'${i18n.threezmszCj}'}"></t:gridCol>
		                 <t:gridCol   editor="fieldText"      type="text"     property="chanx"       
		                 caption="${i18n.chanx}"    editorOptions="{'expression':'^[A-Z0-9]{5}$','expressionMessage':'${i18n.cxjy}'}"></t:gridCol>
		                 <t:gridCol   editor="fieldText"      type="text"     property="lingjbh"     
		                 caption="${i18n.lingjbh}"  editorOptions="{'notNull':true,closeEvent:func_set_lingj,'expression':'^[A-Z0-9]{10}$','expressionMessage':'${i18n.ljhjy}'}"></t:gridCol>
		                 <t:gridCol    type="text"     property="lingjmc"      caption="${i18n.lingjmc}"   ></t:gridCol>
		                 <t:gridCol    type="text"     property="jihyz"      caption="${i18n.jihyz}"   ></t:gridCol>
		                 <t:gridCol    type="text"     property="danw"      caption="${i18n.danw}"   ></t:gridCol>
		                 <t:gridCol   editor="fieldText" editorOptions="{'notNull':true,'expression':'^[A-Z0-9]{3}$','expressionMessage':'${i18n.threezmszCj}'}"   property="zhizlx"  caption="${i18n.zhizlx}"   type="text"  ></t:gridCol>
		                 <t:gridCol   editor="fieldCalendar"  type="text"     property="xuqrq"       
		                 caption="${i18n.xuqrq}"  editorOptions="{'notNull':true,'maxLength':'10', 'minLength':'10','format':'yyyy-MM-dd', 'expressionMessage':'${i18n.sjjy}'}"></t:gridCol>
		                 <t:gridCol   editor="fieldText"      type="text"     property="xuqsl"       
		                 caption="${i18n.xuqsl}" editorOptions="{'notNull':true,'expression':'^[0-9]{1,7}(?:\\.[0-9]{1,3})?$|^0\\.[0-9]{1,3}$','expressionMessage':'${i18n.xqsljy}'}"></t:gridCol>
		    </t:grid>
		                <t:buttons id="btns2" >
		                      <t:button caption="${i18n.copy}" name="copy"></t:button>
				              <t:button caption="${i18n.qued}" name="add"></t:button>
				        </t:buttons>
	</t:form>
 <input id="removeId" value="${removeId}" type="hidden"/>  
	</t:page>
	<script type="text/javascript">
	
	
	 /**
	*列渲染事件,创建checkbox	
	*/
	function createChkbox(){
		return "<input  name='chkbox'   type='checkbox'  />";
	}
	
	function  xqjsrowSelect(selectedIds,rowtr,selectedrecords,selectedrecord,cell,cols){
	       /* if($(cell[0]).attr('type')!='radio')
	           $(rowtr).find('input[type="radio"]').attr("checked","checked");*/
	    if($(cell[0]).attr('type')=='checkbox'){
			return true;
		}   
	    return false;
	}
	
	$(function(){
	   var obj = {};
	   var param = [];
	   obj.usercenter = $("#ins_usercenter").fieldValue();
	   obj.lingjbh = $("#ins_lingjbh").fieldValue();
	   obj.shiycj = $("#ins_shiycj").fieldValue();
	   obj.chanx = $("#ins_chanx").fieldValue();
	   obj.zhizlx = $("#ins_zhizlx").fieldValue();
	   obj.danw = $("#ins_danw").fieldValue();
	   obj.lingjmc = $("#ins_lingjmc").fieldValue();
	   obj.jihyz = $("#ins_jihyz").fieldValue();
	   if($("#ins_usercenter").fieldValue()!=''){
		   param.push(obj);
		   $('#maoxqmxAdd').grid('parseRecords', param);
	   }
	
	})
    //复制
    function func_button_copy(){
       var param = $('#maoxqmxAdd').grid('getRecords');//获取行编辑数据
       if(param.length==0){
          alert("${i18n.nocopyrow}");
          return false;
       }
       $('#maoxqmxAdd').grid('parseRecords', param.concat(param[0]));
    }
	
	//查询零件、零件单位、制造路线
	function func_set_lingj(){
	   
		var cell = this.col.cell;
			var rowElement = cell.parent('tr:first');
            var rownum = cell.parent('tr').prevAll().length;
			var danwIndex = $('td.danw:first').prevAll().length;
			var lingjbhIndex = $('td.lingjbh:first').prevAll().length;
			var zhizlxIndex = $('td.zhizlx:first').prevAll().length;
			var usercenterIndex = $('td.usercenter:first').prevAll().length;
			var luxIndex = $('td.zhizlx:first').prevAll().length;
			var lingjmcIndex = $('td.lingjmc:first').prevAll().length;
			var jihyzIndex = $('td.jihyz:first').prevAll().length;

			var lingjbhStr = rowElement.find('td:eq(' + lingjbhIndex + ')').text();
			var usercenterStr = rowElement.find('td:eq(' + usercenterIndex + ')').text();
            if(lingjbhStr!=''&&usercenterStr!=''){
					var params = [];
					params.push('lingjbh=' + lingjbhStr);
					params.push('usercenter=' + usercenterStr);
					$.sdcui.ajaxUtil.ajax({
						url : "${ctx}/maoxq/validateMxqLj.ajax",
						data : params.join('&'),
						success : function(result) {
							if (result.flag != null) {
								alert(result.flag);
								rowElement.find('td:eq(' + lingjbhIndex + ')').addClass(
								"validate-error").attr("title","${i18n.di}"+rownum+"${i18n.row}"+result.flag);
							} else {
							    rowElement.find('td:eq(' + lingjbhIndex + ')').removeClass("validate-error")
								var obj = result.lingj;
								// rowElement.find('td:eq(' + luxIndex + ')').text(obj.lux);
								rowElement.find('td:eq(' + danwIndex + ')').text(obj.danw);
								rowElement.find('td:eq(' + lingjmcIndex + ')').text(obj.lingjmc);
								rowElement.find('td:eq(' + jihyzIndex + ')').text(obj.jihyz);
								rowElement.find('td:eq(' + zhizlxIndex + ')').text(obj.zhizlx);
							}
						}
					});
           }
		}

	
	
		//增加
		function func_button_add() {
		    var xuqbc = $("#ins_xuqbc").fieldValue();
		    var mode = $("#ins_mode").fieldValue();
			var param = $('#maoxqmxAdd').grid('getRecords');//获取行编辑数据
		    /*if (param.length == 0) {
				alert("请选择要添加的数据！");
				return false;
			}*/
			if(param.length==0)
			   return ;
			var params = [];
			for ( var i = 0, len = param.length; i < len; i++) {
				var shiycj = typeof(param[i].shiycj)=='undefined'?"":param[i].shiycj;
				var usercenter = typeof(param[i].usercenter)=='undefined'?"":param[i].usercenter;
				var lingjbh = typeof(param[i].lingjbh)=='undefined'?"":param[i].lingjbh;
				var chanx = typeof(param[i].chanx)=='undefined'?"":param[i].chanx;
				var xuqrq = typeof(param[i].xuqrq)=='undefined'?"":param[i].xuqrq;
				var xuqsl = typeof(param[i].xuqsl)=='undefined'?"":param[i].xuqsl;
				var zhizlx = typeof(param[i].zhizlx)=='undefined'?"":param[i].zhizlx;
				var danw = typeof(param[i].danw)=='undefined'?"":param[i].danw;
				var rowNum = i+1;
				var tr = $("#maoxqmxAdd div.grid-content table.grid-table tr:eq("+rowNum+")");
				var tdva = tr.find("td.validate-error");
				if(tdva.length!=0){
				   alert(tdva[0].title);
				   return false;
				}
				if(usercenter==""){
				    var msg = "${i18n.di}"+rowNum+"${i18n.zxnotnull}";
				    alert(msg);
					return false;
				}else if(shiycj==""){
				    var msg = "${i18n.di}"+rowNum+"${i18n.cjnotnull}";
				    alert(msg);
					return false;
				}else if(mode=="chanx"&&chanx==""){
				    var msg = "${i18n.di}"+rowNum+"${i18n.cxnotnull}";
				    alert(msg);
					return false;
				}else if(lingjbh == ""){
				    var msg = "${i18n.di}"+rowNum+"${i18n.ljnotnull}";
				    alert(msg);
					return false;
				}else if(zhizlx == ""){
				    var msg = "${i18n.di}"+rowNum+"${i18n.lxnotnull}";
				    alert(msg);
					return false;
				}else if(xuqrq==""){
				    var msg = "${i18n.di}"+rowNum+"${i18n.xqrqnotnull}";
				    alert(msg);
					return false;
				}else if(xuqsl==""){
				    var msg = "${i18n.di}"+rowNum+"${i18n.xqslnotnull}";
				    alert(msg);
					return false;
				}else {
					params.push('insert[' + i + '].usercenter='+ param[i].usercenter);
					params.push('insert[' + i + '].shiycj=' + shiycj);
					params.push('insert[' + i + '].lingjbh=' + lingjbh);
					params.push('insert[' + i + '].chanx=' + chanx);
					params.push('insert[' + i + '].xuqrq=' + xuqrq);
					params.push('insert[' + i + '].xuqsl=' + xuqsl);
					params.push('insert[' + i + '].xuqbc=' + xuqbc);
				    params.push('insert[' + i + '].zhizlx=' + param[i].zhizlx);
					params.push('insert[' + i + '].danw=' + danw);
				} 

			}
			//修改ajax请求       
			$.sdcui.ajaxUtil.ajax({
				url : "${ctx}/maoxq/addMx.ajax",
				data : params.join('&'),
				success : function(result) {
					alert(result.result);
					$('#maoxqmxAdd').grid('reload');
					//window.dialogArguments.reloadDate();      
				}
			});
		}

		//返回
		function func_button_back() {
			history.back();
			//window.history.go(-1);
			//window.history.forward();

		}
	</script>
	<style type="text/css">
	
	</style>
	<!--   <t:gridCol   editor="fieldText"      type="text"     property="shiycj"      
		                 caption="使用车间" editorOptions="{'notNull':true,'expression':'^[A-Z0-9]{1,3}$','expressionMessage':'1-3位的大写字母和数字'}"></t:gridCol> -->
</t:html>