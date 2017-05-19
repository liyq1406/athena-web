<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.kbxhjs}" >
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	</head>
	
	<t:page  i18n="i18n.xqjs.kanbyhl.kanbjs">
	
	<t:form id="form_kanbxhjs"  reset="NOT" submit="NOT" >

			<t:grid id="grid_kanbxhjs"  caption="${i18n.qxzbc}"  
			idKeys="xuqbc"
			src="/kanbyhl/initJS.ajax"    scrollHeight="320"  add="NOT"  edit="NOT"  remove="NOT" back="NOT"
			usePager="true" submit="NOT" reset="NOT"  save="NOT"  showNum="true"  selectRowEvent="xqjsrowSelect">
			<t:gridCol  property="xuanz"   align="center" renderer="createRadio" caption="${i18n.xz}"></t:gridCol>
			<t:gridCol  property="xuqly"   type="text" caption="${i18n.xuqly}"  convert="queryXuqly"></t:gridCol>
			<t:gridCol  property="xuqbc"   type="link" caption="${i18n.xuqbc}"  ></t:gridCol>
			<t:gridCol  property="xuqcfsj" type="text" caption="${i18n.xuqcfsj}" orderBy="desc" sortProperty="xuqcfsj"></t:gridCol>
			<t:gridCol  property="xuqly"   type="text" caption="${i18n.xuqly}"  convert="convertXqlyForChn"></t:gridCol>
			<t:gridCol  property="beiz"    type="text" caption="${i18n.beiz}"  ></t:gridCol>
			</t:grid>
	</t:form>  
	 <t:form id="form_gjsz"  submit="NOT"  reset="NOT">

	  <!--<p>设置计算时间：<input type="text"  name="jssj"/></p>
	  <t:fieldLayout   columns="1"  id="kb_kanbjs"  prefix="kb">
	 <t:fieldCalendar property="jssj"  format="yyyy-MM-dd HH:mm" caption="设置计算时间"></t:fieldCalendar>
	 </t:fieldLayout>-->
	 <t:buttons id='gjsz'>
	          <t:button caption="${i18n.gjsz}" name="szClick"></t:button>
	 </t:buttons>
	    <!--   <p  onclick="szClick()">高级设置</p> --> 
	     <div  style="display: none;"  id="gaojsz">

	      <!--      <t:fieldLayout   columns="1"  id="gjsz_kanbjs"  prefix="gjsz">
	                           <p>
	                           <input type="checkbox"  name="szxhjs"/>设置循环计算
	                           <t:fieldCalendar property="xhjssj"  format="HH:mm" caption="请设置循环计算时间"></t:fieldCalendar>
	                           </p>
	                           <input type="checkbox"  name="szzdplxc"/>设置自动批量下传
	                           <p>
	                           <t:fieldCalendar property="shengxsj"  format="HH:mm" caption="请输入生效时间"></t:fieldCalendar>
	                           </p>
	                           <p>选择计算范围</p>
	                           <p>
	                           <input id='allxh' name='xh'  type='radio' />所有循环
	                           <input id='newxh' name='xh'  type='radio' />新循环
	                           </p>  
	              </t:fieldLayout>
	              
	       --> 

	     <!--  <p>
	       <input type="checkbox"  name="szxhjs"/>设置循环计算
	       </p>
	       <p>
	                  请设置循环计算时间:<input type="text"  name="xhjssj"/>
	       </p>--> 
	       <p>
	       <input type="checkbox"  name="szzdplxc"/>${i18n.szzdplxc}
	       </p>
	       <table><!--   请输入生效时间：<input type="text"  name="shengxsj"/>-->
	            <tr>
	               <td>
	                   <t:fieldLayout   columns="1"  id="gjsz_kanbjs"  prefix="gjsz">
                                    <t:fieldCalendar property="shengxsj"  format="yyyy-MM-dd" caption="${i18n.qsrsxsj}"></t:fieldCalendar>
	                   </t:fieldLayout>
	               
	               </td>
	            </tr>
           </table>
	       <p>${i18n.xzjsfw}</p>

	       <p>
	       <input  id="allxh"  name='xh'  type='radio' checked="checked"  value="all"/>${i18n.allxh}
	       <input  id="newxh"  name='xh'  type='radio' value="new"/>${i18n.newxh}
	       </p>  
	 	 </div>
	 </t:form>
                     <t:buttons  id="kanbjs">
                              <t:button  name="verify" caption="${i18n.quer}" ></t:button>
                     </t:buttons>
    <t:fieldLayout prefix="comp" id="cp">
                   <t:fieldSelect property="usercenter" caption="${i18n.usercenter}">
                      <t:fieldOption value="UW" text="UW" ></t:fieldOption>
                      <t:fieldOption value="UL" text="UL"></t:fieldOption>
                      <t:fieldOption value="UX" text="UX"></t:fieldOption>
                   </t:fieldSelect>
    </t:fieldLayout>
    <div id="cfbtnIpt">
    <table>
         <tbody>
              <tr>
                 <td>
                    <t:buttons  id="kanbjsaniu">
                              <t:button  name="cfbtn" caption="${i18n.kbjs}" ></t:button>
                    </t:buttons>
                 </td>
                 <td>
                    <span style="color: red">${i18n.jscomment}</span>
                 </td>
              </tr>
         </tbody>
    </table>
    </div>
    <div id="button_kbtest">
	    <input type="button" id="cfbtn"  value="看板计算-测试(带模式切换)"  onclick="cfbtn()" disabled="disabled"/>
    </div>
	</t:page>
	<script type="text/javascript">
	$(function(){
	   $("#button_cfbtn").addClass("disabled");
	})
	/**
	*列渲染事件,创建Radio	
	*/
	function createRadio(){
		return "<input  name='xuanz' onclick='radioClick()' type='radio' value='0'/>";
	}
	
	function  xqjsrowSelect(selectedIds,rowtr,selectedrecords,selectedrecord,cell,cols){
	       /* if($(cell[0]).attr('type')!='radio')
	           $(rowtr).find('input[type="radio"]').attr("checked","checked");*/
	    if($(cell[0]).attr('type')!='radio'){
			return false;
		}   
	    return true;
	}
	
		//看板计算触发按钮
		function cfbtn() {
		    var isTure = $("#cfbtn").attr("disabled");
		    if(typeof isTure=='undefined'){
		        var usercenter = $("#comp_usercenter").fieldValue();
				$.sdcui.ajaxUtil.ajax({
					url : "${ctx}/kanbyhl/computer.ajax?usercenter="+usercenter+'&num=2',
					success : function(result) {
						alert(result.result);
						 $("#cfbtn").attr("disabled","disabled");
					}
				});
		    }
		}

		//看板计算触发按钮
		function func_button_cfbtn() {
		    var isTure = $("#button_cfbtn").hasClass("disabled");
		    if(isTure==false){
		    /*$.sdcui.ajaxUtil.ajax({
			url : "../paicfj/cxfCommonFunc.ajax?param=updateUtilControlBiaos",
				success : function(result) {
				        var id = 'youi_loading';
						var loading = $('#'+id);
						if(!loading.length){
							loading = $('<div class="youi-loading" id="'+id+'"/>').appendTo($('body',document));
						}
						var title = '计算中';
						loading.show().text(title).css({});*/
				        var usercenter = $("#comp_usercenter").fieldValue();
						$.sdcui.ajaxUtil.ajax({
							url : "${ctx}/kanbyhl/computer.ajax?usercenter="+usercenter+'&num=1',
							success : function(result) {
								 alert(result.result);
								 //$('#div.youi_loading').removeClass('loading');//去掉读取状态
								 $("#button_cfbtn").addClass("disabled");
							}
						});
				/*}		
			});*/
			
			
			
		       
		    }
		}

	//点击radio
	function radioClick() {
		var radios = document.getElementsByName("xuanz");
		var params = [];
		var param = {};
		for ( var i = 0; i < radios.length; i++) {
			if (radios[i].checked == true) {
				//alert(radios[i]);
				var rowElemt = $(radios[i]).parent('td:first').parent('tr:first');
				xuqbc = rowElemt.find('td:eq(2)').text();
				xuqly = rowElemt.find('td:eq(4)').attr("value")
				if(typeof(xuqly)=='undefined')
				xuqly=rowElemt.find('td:eq(4)').text();
				param.xuqbc = xuqbc;
				param.xuqly = xuqly;
				params[0]=param;
			}
		}
		return params;
	}
		/**高级设置点击事件
		 */
		function func_button_szClick() {
			$("#gaojsz").toggle();
		}

		var xhfw = "all";
		$(function() {
			$("input[name='xh']").click(function(event) {

				// alert(event.target.value);
				xhfw = event.target.value;
			});
		})

		function func_button_verify() {
			var param = radioClick();//获取选中的调拨申请明细,仅可为一条
			if (param.length == 0) {
				alert('${i18n.qxzygbc}');
				return false;
			}
			var chkbox = document.getElementsByName("szzdplxc");
			param.push('xuqbc=' + param[0].xuqbc);
			param.push('xuqly=' + param[0].xuqly);
			param.push('xhfw=' + xhfw);
			var shifzdfs = '0';
			if(chkbox[0].checked==true){
				shifzdfs = '1';
				param.push('shengxsj=' + $("#gjsz_shengxsj").fieldValue());
			}
			param.push('shifzdfs=' + shifzdfs);
			var params = param.join('&');
			$.sdcui.ajaxUtil.ajax({
				url : "${ctx}/kanbyhl/verify.ajax?" + params,
				//data:{"xuqbc":xuqbc,"xuqly":xuqly},
				success : function(result) {
					alert(result.result);
					$("#button_cfbtn").removeClass("disabled");
					$("#cfbtn").removeAttr("disabled");
				}
			});
		}
		/** 
		 *链接点击事件
		 */
		function link_xuqbc(event) {
			var event = event || window.event;//原生态的事件处理 
			var element = event.srcElement || event.target;
			var rowDoc = $(element).parents('tr:first')[0];
			var record = $('#grid_kanbxhjs').grid('getRecord', rowDoc);//获取当前行对应的记录
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
		window.open ('${ctx}/kanbyhl/queryMX.do?removeId=layout-north,layout-west,layout-south&xuqbc='+xuqbc,
		'${i18n.mxqmx}',
		'height=500,width=800,top=100,left=100,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no, status=no');
        return false;

		}
	</script>
	<style type="text/css">
	 #gjsz_kanbjs td.contral.label-col.col-0{width:100px;}
	</style>
</t:html>