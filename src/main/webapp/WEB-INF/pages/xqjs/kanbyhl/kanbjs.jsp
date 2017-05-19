<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="看板计算">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>
<t:page i18n="i18n.xqjs.ilOrder">
	
<style>
#maoxqGrid .youi-fieldLayout table td.contral.label-col.col-0 {
	width: 120px;
}
 #form_gjsz .youi-fieldLayout table td.contral.label-col {     width: 100px; }
#maoxqForm td.contral.label-col.col-0{width:100px;}

</style>
<!--主体内容开始-->
<t:form id="maoxqForm" submit="NOT" reset="NOT">
  <!--查询列表开始-->
  <t:grid id="maoxqGrid" caption="${i18n.zqdljs}" 
  showNum="true" idKeys="xuqbc" 	
  src="/kanbyhl/initJS.ajax" add="NOT"  usePager="true"
  edit="NOT" remove="NOT"  load="false" scrollHeight="90">
	<t:fieldLayout prefix="layout" columns="3">
		<t:fieldSelect property="xuqlx" notNull="true"  caption="${i18n.xzjslx}" convert="xuqlx" width="150" >
		</t:fieldSelect>
		<t:fieldSelect property="xuqly" caption="${i18n.xuqly}"   width="180">
		<t:fieldOption value="DIP,ZCP,BJP,WXP,CYP"></t:fieldOption>
		</t:fieldSelect>
	</t:fieldLayout>
	<t:gridCol property="xuqbc" type="link" caption="${i18n.xuqbc}" width="100"></t:gridCol>
	<t:gridCol property="xuqcfsj"  caption="${i18n.xuqcfsj}" width="150"></t:gridCol>
	<t:gridCol property="xuqly"  caption="${i18n.xuqly}" width="100"></t:gridCol>
	<t:gridCol property="xuqlymc"  caption="${i18n.xuqlymc}" width="100"></t:gridCol>
	<t:gridCol  property="beiz" caption="${i18n.beiz}" width="100"></t:gridCol>
	</t:grid>
	<t:buttons id="button_form1">
	<t:button name="qd" caption="${i18n.qued}"></t:button>
	</t:buttons>


	<t:grid id="chooseMaoxqGrid" showNum="true" idKeys="xuqbc" 
	src="/kanbyhl/initJS.ajax" add="NOT" submit="NOT" edit="NOT" remove="NOT"  reset="NOT" load="false"  scrollHeight="80">
	<t:fieldLayout prefix="layout_choose">
		<t:fieldHidden property="xuqbc"></t:fieldHidden>
		<t:fieldHidden property="xuqly"></t:fieldHidden>
		<t:fieldHidden property="active" defaultValue="1"></t:fieldHidden>
	</t:fieldLayout>
	<t:gridCol property="xuqbc"  caption="${i18n.xuqbc}" width="100"></t:gridCol>
	<t:gridCol property="xuqcfsj"  caption="${i18n.xuqcfsj}" width="150"></t:gridCol>
	<t:gridCol property="xuqly"  caption="${i18n.xuqly}" width="100"></t:gridCol>
	<t:gridCol property="xuqlymc"  caption="${i18n.xuqlymc}" width="100"></t:gridCol>
	<t:gridCol property="beiz" caption="${i18n.beiz}"></t:gridCol>
	</t:grid>
	<t:buttons id="button_from2">
	<t:button name="qx" caption="取消"></t:button>
	</t:buttons>
	</t:form>
 <t:form id="form_gjsz"  submit="NOT"  reset="NOT">

	  <!--<p>设置计算时间：<input type="text"  name="jssj"/></p>
	  <t:fieldLayout   columns="1"  id="kb_kanbjs"  prefix="kb">
	 <t:fieldCalendar property="jssj"  format="yyyy-MM-dd HH:mm" caption="设置计算时间"></t:fieldCalendar>
	 </t:fieldLayout>-->
	 <t:buttons id='gjsz'>
	          <t:button caption="高级设置" name="szClick"></t:button>
	 </t:buttons>
	     <div  style="display: none;"  id="gaojsz">
	       <p>
	       <input type="checkbox" id="szzdplxc" name="szzdplxc" value="${param6}"/>设置自动批量下传
	       </p>
	       <table><!--   请输入生效时间：<input type="text"  name="shengxsj"/>-->
	            <tr>
	               <td>
	                   <t:fieldLayout   columns="1"  id="gjsz_kanbjs"  prefix="gjsz">
                                    <t:fieldCalendar property="shengxsj"  format="yyyy-MM-dd" defaultValue="${param7}" caption="请输入生效时间"></t:fieldCalendar>
	                   </t:fieldLayout>
	               
	               </td>
	            </tr>
           </table>
	       <p>选择计算范围</p>

	       <p>
	       <input  id="allxh"  name='xh'  type='radio' checked="checked"  value="all"/>所有循环
	       <input  id="newxh"  name='xh'  type='radio' value="new"/>新循环
	       </p>  
	 	 </div>
	 </t:form>
      <t:fieldLayout prefix="comp" id="cp">
                   <t:fieldSelect property="usercenter" convert="queryUserCenterMap" notNull="true" defaultValue="${usercenter}" caption="${i18n.usercenter}">
                   </t:fieldSelect>
    </t:fieldLayout>
     <div id="cfbtnIpt">
    <table>
         <tbody>
              <tr>
                 <td>
                    <t:buttons  id="kanbjsaniu">
                         <t:button  name="verify" caption="确定计算" ></t:button>     <t:button  name="cfbtn" caption="看板计算" ></t:button>
                    </t:buttons>
                 </td>
                 <td>
                    <span style="color: red">（计算前请点击确定计算按钮进行计算参数处理设置。）</span>
                 </td>
              </tr>
         </tbody>
    </table>
    </div>



<div id='hiddenRi' style="display: none;">
<div class='option-item' value="CLV,CYJ,ZCJ"></div>
<div class='option-item' value="CLV" > CLV日滚动毛需求</div>
<div class='option-item' value="CYJ" > 冲压排产（日）</div>
<div class='option-item' value="ZCJ" > 总成毛需求（日滚动）</div>
</div>
<div id='hiddenZhouq' style="display: none;">
<div class='option-item' value="DIP,ZCP,BJP,WXP,CYP" ></div>
<div class='option-item' value="DIP" > IL周期毛需求</div>
<div class='option-item' value="ZCP" > 总成毛需求（周期）</div>
<div class='option-item' value="BJP" > 备件毛需求（周期）</div>
<div class='option-item' value="WXP" > 外销毛需求（周期）</div>
<div class='option-item' value="CYP" > 冲压排产（周期）</div>
</div>
</t:page>



</t:html>
	<script type="text/javascript">

	function initPage(){
		//页面初始化
		var param7 =$("#form_gjsz").find('input#szzdplxc').attr("value");
		if(param7 == "1"){
			$("#form_gjsz").find('input#szzdplxc').attr("checked", "checked");
		}
	}
	//需求类型
	$.sdcui.serverConfig.convertArray['xuqlx'] = {
		'Zhouq' : '周期',
		'Ri' : '日'
	};
	
	var xhfw = "all";
	$(document).ready(function(){
		//为计算类型赋默认值，默认值为 周期
		$('#layout_xuqlx').fieldValue("Ri");
		$("#button_cfbtn").addClass("disabled");
		$("input[name='xh']").click(function(event) {

			// alert(event.target.value);
			xhfw = event.target.value;
		});
	});
	//计算类型change事件
	function layout_xuqlx_change() {
		//根据计算类型为数据来源提供数据源
		$('#field-pop-layout_xuqly').html($('#hidden'+$('#layout_xuqlx').fieldValue()).html());
		$('#field-pop-layout_xuqly').addClass('loaded');
		var divId = '#hidden'+$('#layout_xuqlx').fieldValue()+" > div";
		//为需求来源设默认值
		$('#layout_xuqly').fieldValue($(divId).attr("value"));
	}
	//表单验证
	function vali() {
		//是否选中了版次
		var record = $('#maoxqGrid').grid('getSelectedRecords');
		if (record.length == 0) {
			//请选择版次
			alert("${i18n.message_null}");
			return false;
		}
		return true;
	}
	
	//确定按妞事件
	function func_button_qd() {
		if (vali()) {
			//是否选中了版次
			var record = $('#maoxqGrid').grid('getSelectedRecords');
			if(!checkxuqly(record[0].xuqly)){
				return false;
			}
			//选中的版次放到隐藏域
			var xuqbc = $('#layout_choose_xuqbc').fieldValue()== ""?"":$('#layout_choose_xuqbc').fieldValue()+",";
			var xuqly = $('#layout_choose_xuqly').fieldValue()== ""?"":$('#layout_choose_xuqly').fieldValue()+",";
			$('#layout_choose_xuqbc').fieldValue(xuqbc+record[0].xuqbc);
			$('#layout_choose_xuqly').fieldValue(xuqly+record[0].xuqly);
			$('#layout_choose_active').fieldValue("1");		
			$('#chooseMaoxqGrid').grid('reload');
		}
	}
	//取消表单验证
	function qxvali() {
		//是否选中了版次
		var record = $('#chooseMaoxqGrid').grid('getSelectedRecords');
		if (record.length == 0) {
			//请选择版次
			alert("${i18n.message_null}");
			return false;
		}
		return true;
	}
	
	//取消按妞事件
	function func_button_qx() {
		if (qxvali()) {
			//是否选中了版次
			var record = $('#chooseMaoxqGrid').grid('getSelectedRecords');
		
			//选中的版次放到隐藏域
// 			var xuqbc = $('#layout_choose_xuqbc').fieldValue()== ""?"":$('#layout_choose_xuqbc').fieldValue()+",";
// 			var xuqly = $('#layout_choose_xuqly').fieldValue()== ""?"":$('#layout_choose_xuqly').fieldValue()+",";
// 			$('#layout_choose_xuqbc').fieldValue(xuqbc+record[0].xuqbc);
			$('#layout_choose_xuqly').fieldValue(minusXuq(record[0].xuqly,'ly'));
			$('#layout_choose_xuqbc').fieldValue(minusXuq(record[0].xuqbc,'bc'));
			if("" == $('#layout_choose_xuqly').fieldValue()){
				$('#layout_choose_active').fieldValue("0");
			}else{
				$('#layout_choose_active').fieldValue("1");				
			}
			$('#chooseMaoxqGrid').grid('reload');
		}
	}
	/**高级设置点击事件
	 */
	function func_button_szClick() {
		$("#gaojsz").toggle();
	}

	function func_button_verify() {
		var record = $('#chooseMaoxqGrid').grid('getRecords');
		if(record.length == 0){
			alert("请选择版次");return false;
		}
		var xuqbc = "" ;
		var xuqly = "" ;
		var param = [] ;
		for(var i = 0; i < record.length; i++){
			xuqbc += record[i].xuqbc+",";
			xuqly += record[i].xuqly+",";	
		}
		param.push('xuqbc=' + xuqbc);
		param.push('xuqly=' + xuqly);
		param.push('xhfw=' + xhfw);
		var chkbox = document.getElementsByName("szzdplxc");
		var shifzdfs = '0';
		if(chkbox[0].checked==true){
			shifzdfs = '1';
			param.push('shengxsj=' + $("#gjsz_shengxsj").fieldValue());
		}
		param.push('shifzdfs=' + shifzdfs);
		param.push('isZhouqRi=' + isZhouqRi);
		var params = param.join('&');
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/kanbyhl/verify.ajax?" + params,
// 			data:{"xuqbc":xuqbc,"xuqly":xuqly},
			success : function(result) {
				alert(result.result);
				if(typeof result.success=="undefined"||result.success!==false){
					$("#button_cfbtn").removeClass("disabled");
				}
			}
		});
	}
	//看板计算触发按钮
	function func_button_cfbtn() {
		var isTure = $("#button_cfbtn").hasClass("disabled");
		if(isTure==false){
			 var usercenter = $("#comp_usercenter").fieldValue();
				$.sdcui.ajaxUtil.ajax({
					url : "${ctx}/kanbyhl/computer.ajax?usercenter="+usercenter+'&num=1',
					success : function(result) {
						 alert(result.result);
						 //$('#div.youi_loading').removeClass('loading');//去掉读取状态
						if(typeof result.success=="undefined"||result.success!==false){
						    $("#button_cfbtn").addClass("disabled");
						}
					}
				});
		}
		$("#button_cfbtn").addClass("disabled");
	}
	
	/** 
	 *链接点击事件
	 */
	function link_xuqbc(event) {
		var event = event || window.event;//原生态的事件处理 
		var element = event.srcElement || event.target;
		var rowDoc = $(element).parents('tr:first')[0];
		var record = $('#maoxqGrid').grid('getRecord', rowDoc);//获取当前行对应的记录
		var xuqbc = record.xuqbc;
		/**
		 * form跳转模式提交
		$.sdcui.pageUtils.goPage({
			url : '/kanbyhl/queryMX.do',//url
			record : record,//
			mode : 'form',
			beforeSubmit : function() {
				//
				return true;
			}
		});
		event.stopPropagation();//阻止事件冒泡
		return false;	 */
	winOpen = window.open ('${ctx}/kanbyhl/queryMX.do?removeId=layout-north,layout-west,layout-south&xuqbc='+xuqbc,
	'${i18n.mxqmx}',
	'top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no, status=no');
	
	winOpen.resizeTo(screen.availWidth,screen.availHeight);
    return false;

	}
	/**验证同一来源只能选择一版毛需求,只能选择同周期或同日
	*/
	var isZhouqRi = "CLV";//如果为日计算：1，否则为0（即周期）
	function checkxuqly(xuqly){
		var xuqlys = $('#layout_choose_xuqly').fieldValue();
		if(0 <= xuqlys.indexOf(xuqly)){
			alert("同一来源只能选择一版毛需求");
			return false;
		}
		var xq = {Zhouq:'DIP,ZCP,BJP,WXP,CYP',Ri:'CLV,CYJ,ZCJ'};
		var xqly = "";
		//确定是周期还是日 的毛需求来源
		if(0 <= xq.Zhouq.indexOf(xuqly)){
			xqly = xq.Zhouq;//用周期去匹配毛需求来源
			isZhouqRi = "DIP";
		}else if(0 <= xq.Ri.indexOf(xuqly)){
			xqly = xq.Ri;//用日去匹配毛需求来源
			isZhouqRi = "CLV"
		}
		var xqs = xuqlys.split(",");
		//循环判断是否是同是周期或是日
		for(var i = 0; i < xqs.length; i++ ){
			if(0 > xqly.indexOf(xqs[i])){
				alert("只能选择同是周期或同是日的毛需求来源");
				return false;
			}
		}
		return true;
	}
	/**取消版次
	*/
	function minusXuq(xuq,operant){
		var xuqs = $('#layout_choose_xuq'+operant).fieldValue();
		var xqs = xuqs.split(",");
		//循环判断,找到该需求来源
		for(var i = 0; i < xqs.length; i++ ){
			if(xuq == xqs[i]){
				xqs.splice(i,1);
				break;
			}
		}
		return xqs.join(",");
	}
	</script>