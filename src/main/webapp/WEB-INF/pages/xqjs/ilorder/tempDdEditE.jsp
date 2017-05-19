<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="订单修改">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>

<style type="text/css">
	#ilorderEe  .youi-fieldLayout table td.contral.label-col.col-2{
		    width: 120px;
	}
</style>
</head>

<t:page>

	<t:form id="ilquery" reset="NOT" submit="NOT">
		<t:grid id="ilorderEe" idKeys="DINGDH,HETH,GONGYSDM,EDIT_TIME,EDITOR,DINGDNR" caption=""  editAlias="DingdUpdate" src="/ilorder/queryDd.ajax" usePager="true" edit="NOT"
			load="false"  remove="NOT" scrollHeight="200" add="NOT" showCheckbox="true"  showNum="true">
			<t:button name="removeSelected" active="1" caption="删除" icon="removeRecord"></t:button>
			<t:button name="tempAdd" active="0" caption="增加" icon="addRecord"></t:button>
			<t:fieldLayout id="ilselect" prefix="il" columns="4">
				<t:fieldSelect property="usercenter" width="100" caption="用户中心" convert="queryUserCenterMap" ></t:fieldSelect>
				<t:fieldText property="gongysdm" caption="供应商/仓库编号" width="100" maxLength="10"></t:fieldText>
				<t:fieldText property="dingdh" caption="订单号" width="100" maxLength="9"></t:fieldText>
				<t:fieldHidden property="dingdlx" defaultValue="3"></t:fieldHidden>
				<t:fieldSelect property="jihyz" caption="计划员组" width="100" convert="getJihz"></t:fieldSelect>
				<t:fieldCalendar property="dingdjssjFrom" caption="制作时间"  format="yyyy-MM-dd HH:mm:ss" width="100"></t:fieldCalendar>
				<t:fieldCalendar property="dingdjssjTo" caption="至"  format="yyyy-MM-dd HH:mm:ss" width="100"></t:fieldCalendar>
				<t:fieldCalendar property="dingdsxsjFrom" caption="生效时间" format="yyyy-MM-dd" width="100"></t:fieldCalendar>
				<t:fieldCalendar property="dingdsxsjTo" caption="至"  format="yyyy-MM-dd" width="100"></t:fieldCalendar>
				<t:fieldSelect property="chullx" caption="订单类别" convert="queryLSDDLB" width="100" notNull="true" defaultValue="PP"></t:fieldSelect>
				<t:fieldSelect property="dingdzt" caption="订单状态" convert="ddzt" width="100"></t:fieldSelect>
				<t:fieldText property="editor" caption="维护人" width="100" maxLength="32"></t:fieldText>
				<t:fieldText property="fahzq" caption="发运区间" maxLength="10" width="100"></t:fieldText>
				<t:fieldSelect property="shiffsgys" caption="是否发送供应商" convert="shiffsgys" width="100" ></t:fieldSelect>
			</t:fieldLayout>
			<t:gridCol property="DINGDH" type="link" caption="订单号"></t:gridCol>
			<t:gridCol property="USERCENTER" type="text" caption="用户中心"></t:gridCol>
			<t:gridCol property="CHULLX" type="text" caption="订单类别" convert="queryLSDDLB"></t:gridCol>
			<t:gridCol property="DINGDLX" caption="订单类型" convert="queryDingdlx"></t:gridCol>
			<t:gridCol property="GONGYSDM" type="text" caption="供应商/仓库编号"></t:gridCol>
			<t:gridCol property="FAHZQ" type="text" caption="发运区间"></t:gridCol>
			<t:gridCol editorOptions="{'format':'yyyy-MM-dd HH:mm:ss'}" property="DINGDJSSJ" type="text" caption="制作时间"></t:gridCol>
			<t:gridCol editorOptions="{'format':'yyyy-MM-dd HH:mm:ss'}" property="DINGDSXSJ" type="text" caption="生效时间"></t:gridCol>
			<t:gridCol property="JIHYZ" type="text" caption="计划员组"></t:gridCol>
			<t:gridCol property="EDITOR" type="text" caption="维护人"></t:gridCol>
			<t:gridCol property="DINGDZT" type="text" caption="订单状态" convert="ddzt"></t:gridCol>
			<t:gridCol property="SHIFFSGYS" type="text" caption="是否发送供应商" convert="shiffsgys"></t:gridCol>
			<t:gridCol property="BEIZ" type="text" caption="备注" editor="fieldText"></t:gridCol>
		</t:grid>
	</t:form>
	
	<form id="form_daorwj" name="form_daorwj"  enctype='multipart/form-data' method="post"  target="hiddenUp">
			<table>
					<tr>
						<td>
								<t:buttons id="btn">
									<t:button caption="导出" name="export" />
									<t:button caption="生效" name="effect" />
									<t:button caption="待生效" name="uneffect" />
									<t:button caption="拒绝" name="refuse" />
								</t:buttons>
						</td>
					    <td style="text-align:right;">
					    	周期：
					    </td>
					    <td width="310px">
					        <t:fieldLayout columns="1" id="drdbsq" prefix="drdbsq"  showLabel="导入文件：">
					            <t:fieldFile property="file" caption="${i18n.drwj}"  >
					            </t:fieldFile>
				            </t:fieldLayout>
					    </td>
						<td>
							<t:buttons id="excel_submits">
								<t:button caption="周期临时订单导入" name="importExcel"></t:button>
								<t:button caption="重置" name="resetExcel"></t:button>
								<t:button caption="周期临时订单模板下载" name="expxls" ></t:button>
							</t:buttons>
						</td>
						
					</tr>
			</table>
    		 <iframe name="hiddenUp" id="hiddenUp" style="display: none;"></iframe>
	</form>
	
	<form id="form_daorwjAX" name="form_daorwjAX"  enctype='multipart/form-data' method="post"  target="hiddenUpAX">
			<table>
					<tr>
					    <td style="text-align:right;">
					    	按需：
					    </td>
					    <td width="310px">
					        <t:fieldLayout columns="1" id="drdbsqAX" prefix="drdbsqAX"  showLabel="导入文件：">
					            <t:fieldFile property="fileAX" caption="${i18n.drwj}"  >
					            </t:fieldFile>
				            </t:fieldLayout>
					    </td>
						<td>
							<t:buttons id="excel_submitsAX">
								<t:button caption="按需临时订单导入" name="importExcelAX"></t:button>
								<t:button caption="重置" name="resetExcelAX"></t:button>
								<t:button caption="按需临时订单模板下载" name="expxlsAX" ></t:button>
							</t:buttons>
						</td>
						
					</tr>
			</table>
    		<iframe name="hiddenUpAX" id="hiddenUpAX" style="display: none;"></iframe>
	</form>

	<t:form id="ilAdd" dialog="true" caption="新增" submit="NOT">
		<t:fieldLayout prefix="add">
			<t:fieldSelect property="usercenter" width="120" caption="用户中心" convert="queryUserCenterMap" notNull="true"></t:fieldSelect>
			<t:fieldText property="dingdh" caption="订单号" width="120" notNull="true" maxLength="9"></t:fieldText>
			<t:fieldText property="gongysdm" caption="供应商代码" width="120"  maxLength="10"></t:fieldText>
			<t:fieldSelect property="dingdlx" caption="订单类型" convert="dingdlx" width="120" notNull="true" ></t:fieldSelect>
			<t:fieldText property="heth" caption="合同号" width="120" notNull="true" maxLength="20"></t:fieldText>
			<t:fieldText property="dingdwhr" caption="维护人" width="120" notNull="true"></t:fieldText>
			<t:fieldCalendar property="fahzq" caption="发运区间" format="yyyyMM" width="120" notNull="true"></t:fieldCalendar>
			<t:fieldText property="beiz" caption="备注" width="120" maxLength="100"></t:fieldText>
			<t:fieldSelect property="shiffsgys" caption="是否发送供应商" convert="shiffsgys" notNull="true" width="120"></t:fieldSelect>
			<t:button caption="提交" name="subAdd"></t:button>
		</t:fieldLayout>
	</t:form>

</t:page>

<script type="text/javascript">
	$.sdcui.serverConfig.convertArray['ddzt'] = {
		'0' : '已定义',
		'1' : '制作中',
		'2' : '待生效',
		'3' : '拒绝',
		'4' : '已生效',
		'5' : '已发送'
	};
	$.sdcui.serverConfig.convertArray['dingdlx'] = {'3':'临时订单'};
	$.sdcui.serverConfig.convertArray['shiffsgys'] = {'0':'否','1':'是'};
    /**$.sdcui.serverConfig.convertArray['chullx'] = {
		'PP' : '周期',
		'PS' : '周',
		'PJ' : '日',
		'C' : '按需',
		'VJ' : 'VJ',
		'MJ' : 'MJ',
		'CV' : 'CV',
		'MV' : 'MV'
	};*/
	
	   /**
	*列渲染事件,创建checkbox	
	
	function createCheckbox(){
		return "<input  name='chkbox'  type='checkbox' value='1'/>";
	}*/

    function func_button_tempAdd(){
           var record = {};
           $.sdcui.pageUtils.goPage({
			url : '/ilorder/initTempDd.do',//url
			record : record,//
			mode : 'form',
			beforeSubmit : function() {
				//
				return true;
			}
		});
    }


	//订单新增后，刷新表格
	/*function func_button_subAdd() {

		$("#ilAdd").form('submit');
		//平台验证
			if (!$('#ilAdd').form('validate')) {
			var errorMessage = [];
			$('#foemid').find(
					'.youi-field.validating,.youi-field.validate-error').each(
					function() {
						if (this.title)
							errorMessage.push(this.title);
					});
			$.sdcui.messageUtil.showError(errorMessage.join('\n'));
			return ;
		}
		var params = [];
		var usercenter = $('#add_usercenter').fieldValue();
		var dingdh = $('#add_dingdh').fieldValue();
		var gongysdm = $('#add_gongysdm').fieldValue();
		var dingdlx = $('#add_dingdlx').fieldValue();
		var heth = $('#add_heth').fieldValue();
		var dingdwhr = $('#add_dingdwhr').fieldValue();
		var fahzq = $('#add_fahzq').fieldValue();
		var beiz = $('#add_beiz').fieldValue();
		var shiffsgys = $('#add_shiffsgys').fieldValue();
		params.push('dd[0].usercenter=' + usercenter);
		params.push('dd[0].dingdh=' + dingdh);
		params.push('dd[0].gongysdm=' + gongysdm);
		params.push('dd[0].dingdlx=' + dingdlx);
		params.push('dd[0].heth=' + heth);
		params.push('dd[0].dingdwhr=' + dingdwhr);
		params.push('dd[0].fahzq=' + fahzq);
		params.push('dd[0].shiffsgys=' +shiffsgys);
		params.push('dd[0].beiz=' + beiz);
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/ilorder/insertIlDd.ajax",
			data : params.join('&'),
			success : function(result) {
				alert(result.result);
				 $('#ilorderEe').grid('reload');
			}
		});

	}

	$(function() {
		$('#add_gongysdm').bind('focusout', function() {
			var usercenter = $('#add_usercenter').fieldValue();
			var gongysdm = $('#add_gongysdm').fieldValue();
			if (gongysdm == '') {
				alert('供应商代码不能为空！');
				return false;
			}
			$.sdcui.ajaxUtil.ajax({
				url : "${ctx}/ilorder/ifExistGys.ajax",
				data : 'usercenter=' + usercenter + '&gongysdm=' + gongysdm,
				success : function(result) {
				    var msg = result.result;
				    if(typeof(msg)!='undefined') alert(msg);
				}
			});
		})
	})*/

	function func_button_export() {
		var sxdd = $('#ilorderEe').grid('getSelectedRecords');
		//判断是否有选中一条数据
		if (sxdd.length != 1) {
			alert("请选择一条数据!");
			return false;
		}
		var params = [];
		for(var i=0,len=sxdd.length;i<len;i++){
		    params.push("dingdh=" + sxdd[0].DINGDH);
		    params.push("usercenter=" + sxdd[0].USERCENTER);
		    params.push("chullx=" + sxdd[0].CHULLX);
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
		if (confirm("确认删除选中记录?")) {
			for ( var i = 0, len = dd.length; i < len; i++) {
				params.push('dd[' + i + '].dingdh=' + dd[i].DINGDH);
				var zt = dd[i].DINGDZT;
				if (zt != 1){
					alert('只能删除制作中的订单！');
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
		//获得选中行参数
		var param = $('#ilorderEe').grid('getSelectedRecords');
		var params = [];
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
	    var url='initILTempDdmx.do';
		var event = event || window.event;//原生态的事件处理 
		var element = event.srcElement || event.target;
		var rowDoc = $(element).parents('tr:first')[0];
		var record = $('#ilorderEe').grid('getRecord', rowDoc);//获取当前行对应的记录
		var chullx = record.CHULLX;
		var DINGDH = record.DINGDH;
		var DINGDZT = record.DINGDZT;
		var DINGDNR = record.DINGDNR;
		var USERCENTER = record.USERCENTER;
		var GONGYSDM = record.GONGYSDM.replace(/ /g," ");
		//var GONGYSDM = record.GONGYSDM;
		if(chullx=='PJ'||chullx=='VJ'){
			url = 'initTempPJDdmx.do';
		}else if(chullx=='PP'|| chullx=='PS'){
		
		}else{
		  	url = 'initTempAnxDdmx.do';
		}
		/*if(chullx!='PP'&&chullx!='PS'&&chullx!='PJ'){
			url = 'initTempAnxDdmx.do';
		}*/
		url = url+'?GONGYSDM='+GONGYSDM+'&CHULLX='+chullx+'&DINGDH='+DINGDH+'&DINGDZT='+DINGDZT+'&DINGDNR='+DINGDNR+'&USERCENTER='+USERCENTER+'&GONGYSDM='+GONGYSDM;
		winOpen = window.open(url,'订单信息','top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
		winOpen.resizeTo(screen.availWidth,screen.availHeight);
	
		/**
		 * form跳转模式提交
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
	
	
	//导入excel
	function func_button_importExcel()
	{
		
		var form = document.forms["form_daorwj"];
		var file = form["file"];
		var fvalue = file.value;
		if (fvalue.length > 0) 
		{
			// 寻找表单域中的 <input type="file" ... /> 标签
			if (fvalue.lastIndexOf('xls')!= (fvalue.length - 3)) 
			{
				alert("只能导入excel文件,后缀名为:xls!");
				return false;
			}
            form.action = '${ctx}/ilorder/impIlorderTemp.do?';
			form.submit();
            $("#button_importExcel").addClass("disabled");
		} 
		else 
		{
			alert("请选择导入文件!");
			return false;
		}
	}
	
	 
	//重置    
	function func_button_resetExcel()
	{
		var objFile=document.getElementsByName('file')[0]; 
		objFile.outerHTML=objFile.outerHTML.replace(/(value=\").+\"/i,"$1\"");
	} 
	
	//提示语句
	function callback(msg) 
	{
		alert(msg);
		$("#button_importExcel").removeClass("disabled");
		$("#button_importExcelAX").removeClass("disabled");
	}
	
	 //模板下载
	function func_button_expxls() {
		$.sdcui.pageUtils.goPage({
			url : '../ilorder/mubanxiazai.do',
			mode : 'form',
			beforeSubmit : function(){
				return true;
			}
	   });
	}
	
	//导入按需excel
	function func_button_importExcelAX()
	{
		
		var form = document.forms["form_daorwjAX"];
		var file = form["fileAX"];
		var fvalue = file.value;
		if (fvalue.length > 0) 
		{
			// 寻找表单域中的 <input type="file" ... /> 标签
			if (fvalue.lastIndexOf('xls')!= (fvalue.length - 3)) 
			{
				alert("只能导入excel文件,后缀名为:xls!");
				return false;
			}
            form.action = '${ctx}/ilorder/impAXorderTemp.do?';
			form.submit();
            $("#button_importExcelAX").addClass("disabled");
		} 
		else 
		{
			alert("请选择导入文件!");
			return false;
		}
	}
	
	 
	//重置 按需  
	function func_button_resetExcelAX()
	{
		var objFile=document.getElementsByName('fileAX')[0]; 
		objFile.outerHTML=objFile.outerHTML.replace(/(value=\").+\"/i,"$1\"");
	} 
	
	 //模板下载按需
	function func_button_expxlsAX() {
		$.sdcui.pageUtils.goPage({
			url : '../ilorder/mubanxiazaiAX.do',
			mode : 'form',
			beforeSubmit : function(){
				return true;
			}
	   });
	}
</script>

<style type="text/css">
.but {
	width: 100px;
	float: left;
	text-align: center;
	margin: 0 0 0 5px;
}
#ilAdd td.contral.label-col.col-0{width:100px;}
</style>
</t:html>