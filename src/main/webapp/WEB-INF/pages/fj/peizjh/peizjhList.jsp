<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<script type="text/javascript" src="${ctx}/athena/js/util.js"></script>
<style type="text/css">
	.t-fieldLayout table td.contral.label-col {
    	width: 0px;
	}
</style>

</head>
<t:page i18n="i18n.fj.fj" >
<!-- 配载计划列表 -->
	<t:grid id="peizjhGrid" idKeys="yaocmxh,peizdh,usercenter,yunslx,faysj,cangkbh" caption="${i18n.peizjh_title }"
		src="/fj/queryPeizjh.ajax" showNum="true" add="NOT" submit="NOT" reset="NOT" edit="NOT" remove="NOT" 
	    dataFormId="form_peizjh" >
		<t:fieldLayout id="pz_select" prefix="pz">
			<t:fieldCalendar property="fromDaocsj" format="yyyy-MM-dd HH:mm" caption="${i18n.peizjh_fromDaocsj }"></t:fieldCalendar>
			<t:fieldCalendar property="toDaocsj" format="yyyy-MM-dd HH:mm" caption="${i18n.peizjh_toDaocsj }"></t:fieldCalendar>
			<t:fieldText property="peizdh" caption="${i18n.peizdh }"></t:fieldText>
			<t:fieldSelect property="jihcx"  caption="${i18n.chex }" convert="chex"></t:fieldSelect>
			<t:fieldCustom property="chep" caption="${i18n.chep }"></t:fieldCustom>
			<t:fieldSelect property="yunssbm" caption="${i18n.yunss }" convert="yunss"></t:fieldSelect>
		</t:fieldLayout>
		<t:gridCol property="peizdh" caption="${i18n.peizdh} "></t:gridCol>
		<t:gridCol property="jihcx" caption="${i18n.chex }" ></t:gridCol>
		<t:gridCol property="chep" caption="${i18n.chep }"></t:gridCol>
		<t:gridCol property="yunssbm" caption="${i18n.yunssbm }"></t:gridCol>
		<t:gridCol property="gongsmc" caption="${i18n.yunssmc }"></t:gridCol>
		<t:gridCol property="daysj" caption="${i18n.peizjh_daysj }" width="130" ></t:gridCol>
		<t:gridCol property="jihzt"  caption="${i18n.peizjh_shifdy }" renderer="isPrint"></t:gridCol>
		<t:gridCol property="daocsj" caption="${i18n.peizjh_daocsj }"></t:gridCol>
		<t:button caption="${i18n.search }" name="btnSearch"></t:button>
		<t:button caption="${i18n.reset }" name="btnReset"></t:button>
		<t:button caption="查看 " name="btnshow"></t:button>
		<t:button caption="${i18n.add }"  name="btnAdd"></t:button>
		<t:button caption="${i18n.edit }" active="1" name="btnEdit"></t:button>
		<t:button caption="${i18n.btn_dayin }" active="1" name="pz_print"></t:button>
		<t:button caption="${i18n.btn_delete }" active="1" name="pz_del"></t:button>
	</t:grid>

<!-- 配载计划确认 -->
	<t:form dialog="true" reset="NOT" submit="NOT"  id="form_peizjh" caption="${i18n.peizjh_quer }" width="650">
		<t:fieldLayout prefix="peizjh"> 
			<t:fieldHidden property="yaocmxh" caption=""/>
			<t:fieldHidden property="yunslx" caption=""/>
			<t:fieldHidden property="gongsmc" caption=""/>
			<t:fieldHidden property="daocsj" caption=""/>
		    <t:fieldLabel property="peizdh" caption="${i18n.peizdh}"/>
			<t:fieldLabel property="jihcx" caption="${i18n.chex }" />
			<t:fieldCustom property="chep" caption="${i18n.chep }"></t:fieldCustom>
			<t:fieldLabel property="yunssbm" caption="${i18n.yunssbm }" />
			<t:fieldLabel property="usercenter" caption="${i18n.usercenter }"  />
         	<t:fieldGrid property="yaohlList" mode="reload" caption="${i18n.needBeihYaohl }"   parents="peizdh" column="6" width="550" parentsAlias="peizdh">
				<t:grid id="form_grid_peizYaohl" load="false" 
					src="/fj/queryPeizjhYaohl.ajax" submit="NOT" usePager="false"  reset="NOT" add="NOT"
					edit="NOT" remove="NOT"  width="550">
					<t:gridCol property="YAOHLH" caption="${i18n.yaohlbh }" ></t:gridCol>
					<t:gridCol property="LINGJBH" caption="${i18n.lingjh } "></t:gridCol>
					<t:gridCol property="LINGJSL" caption="${i18n.lingjsl }"></t:gridCol>
					<t:gridCol property="BAOZXH" caption="${i18n.baozxh }"></t:gridCol>
					<t:gridCol property="XIEHD" caption="${i18n.xiehd }"></t:gridCol>
					<t:gridCol property="JIAOFJ" caption="${i18n.jiaofsj } "></t:gridCol>
				</t:grid>
			</t:fieldGrid>
			<t:button caption="${i18n.btn_dayin }" name="savePrint"></t:button>
		</t:fieldLayout>
	</t:form>
	
<!-- 是否继续配载 -->
	<t:form dialog="true" reset="NOT" submit="NOT" id="form_surePeiz" caption="${i18n.noResourcesEnough }" width="650">
		<t:fieldLayout prefix="peizSure"> 
			<t:fieldHidden property="yaocmxh" caption=""/>
			<t:fieldHidden property="yunslx" caption=""/>
			<t:fieldHidden property="gongsmc" caption=""/>
			<t:fieldHidden property="daocsj" caption=""/>
			<t:fieldHidden property="faysj" caption=""/>
			<t:fieldHidden property="cangkbh" caption=""/>
			<t:fieldHidden property="bhdList" />
		    <t:fieldLabel property="peizdh" caption="${i18n.peizdh}"/>
			<t:fieldLabel property="jihcx" caption="${i18n.chex }" />
			<t:fieldLabel property="chep" caption="${i18n.chep }" />
			<t:fieldLabel property="yunssbm" caption="${i18n.yunssbm }" />
			<t:fieldLabel property="usercenter" caption="${i18n.usercenter }"  />
		</t:fieldLayout>
		<t:fieldLayout prefix="peizSure1" showLabel="false" columns="1">
		    <t:fieldGrid property="noMatchYaohlList" parents="peizdh"  caption="${i18n.noMatchYaohl}"  column="6" width="640" parentsAlias="peizdh">
				<t:grid id="form_grid_NoMatchYaohl" load="false" caption="${i18n.noMatchYaohl}"  submit="NOT" usePager="false"  reset="NOT" add="NOT"
					edit="NOT" remove="NOT"  width="640" >
					<t:gridCol property="YAOHLH" caption="${i18n.yaohlbh }" ></t:gridCol>
					<t:gridCol property="LINGJBH" caption="${i18n.lingjh } "></t:gridCol>
					<t:gridCol property="LINGJSL" caption="${i18n.lingjsl }"></t:gridCol>
					<t:gridCol property="BAOZXH" caption="${i18n.baozxh }"></t:gridCol>
					<t:gridCol property="XIEHD" caption="${i18n.xiehd }"></t:gridCol>
					<t:gridCol property="JIAOFJ" caption="${i18n.jiaofsj } "></t:gridCol>
				</t:grid>
			</t:fieldGrid>
		</t:fieldLayout>
		<t:button caption="${i18n.btn_continuePZ }" name="surePeiz"></t:button>
		<t:button caption="${i18n.btn_cancelPZ }" name="cancelPeiz"></t:button>
	</t:form>	
	
	
<!-- 配载计划删除 -->	
	<t:form dialog="true" reset="NOT" submit="NOT" id="form_wulgz"
		caption="${i18n.btn_delete }"  >
		<t:fieldLayout prefix="wulgz" columns="3"> 
			<t:fieldHidden property="yaocmxh" caption="${i18n.yaocmxh }"/>
		    <t:fieldLabel property="peizdh" caption="${i18n.peizdh}"/>
			<t:fieldLabel property="jihcx" caption="${i18n.jihcx }" />
			<t:fieldSelect property="shijcx" width="100" caption="${i18n.shijcx }" src="/fj/queryChex.ajax" show="CHEXBH" code="CHEXBH" ></t:fieldSelect>
			<t:fieldLabel property="yunssbm" caption="${i18n.yunssbm }" />
			<t:fieldLabel property="jihy" caption="${i18n.jihy }" defaultValue="${username}"/>
			<t:fieldLabel property="caozy" caption="${i18n.caozy }" defaultValue="${username}"/>
			<t:fieldLabel property="usercenter" caption="${i18n.usercenter }" />
		</t:fieldLayout>
		<t:fieldLayout prefix="peizjh1" > 
			<t:fieldArea property="guzyy" maxLength="200" caption="${i18n.guzyy }" rows="5" column="100" width="500" notNull="true" />
			<t:button caption="${i18n.btn_save }" name="saveWulgz"></t:button>
		</t:fieldLayout>
	</t:form>

<!-- 配载计划查看 -->
	<t:form dialog="true" reset="NOT" submit="NOT"  id="form_peizjhshow" caption="${i18n.peizjh_quer }" width="700">
		<t:fieldLayout prefix="peizjhshow"> 
			<t:fieldHidden property="yaocmxh" caption=""/>
			<t:fieldHidden property="yunslx" caption=""/>
			<t:fieldHidden property="gongsmc" caption=""/>
			<t:fieldHidden property="daocsj" caption=""/>
		    <t:fieldLabel property="peizdh" caption="${i18n.peizdh}"/>
			<t:fieldLabel property="jihcx" caption="${i18n.chex }" />
			<t:fieldLabel property="chep" caption="${i18n.chep }" />
			<t:fieldLabel property="yunssbm" caption="${i18n.yunssbm }" />
			<t:fieldLabel property="usercenter" caption="${i18n.usercenter }"  />
         	<t:fieldGrid property="yaohlList" mode="reload" caption="${i18n.yaohl }"   parents="peizdh" column="6" width="600" parentsAlias="peizdh">
				<t:grid id="form_grid_showpeizYaohl" load="false" 
					src="/fj/queryPeizjhYaohl.ajax" submit="NOT" usePager="false"  reset="NOT" add="NOT"
					edit="NOT" remove="NOT"  width="600">
					<t:gridCol property="YAOHLH" caption="${i18n.yaohlbh }" ></t:gridCol>
					<t:gridCol property="LINGJBH" caption="${i18n.lingjh } "></t:gridCol>
					<t:gridCol property="LINGJSL" caption="${i18n.lingjsl }"></t:gridCol>
					<t:gridCol property="BAOZXH" caption="${i18n.baozxh }"></t:gridCol>
					<t:gridCol property="XIEHD" caption="${i18n.xiehd }"></t:gridCol>
					<t:gridCol property="BEIHDH" caption="备货单号 "></t:gridCol>
					<t:gridCol property="JIAOFJ" caption="${i18n.jiaofsj } "></t:gridCol>
				</t:grid>
			</t:fieldGrid>
		</t:fieldLayout>
	</t:form>
	
<script type="text/javascript">

	  //初始化页面
	function initPage(){
		$('#form_surePeiz').find('#button_close').css('display','none');
	}

//初始化查询区域车型下拉框
	function chepInit(){
		var pzElement = $('#peizjh_chep');
		if(!pzElement.hasClass('loaded')){
			$('#peizjh_chep').html('<select><option value=""></option>'+parseStateOfOptions()+'</select><input maxlength="6" id="achep" onkeyup="UpCaseAchep();"/> <span style="color:red;">*</span>');
			
			$('#peizjh_chep').addClass('loaded').fieldCustom({
				property:'chep',
				setValue:function(value){
					
				},
				getValue:function(){
					var value = this.element.find('select').val()+this.element.find('input').val();
					return value;
				},
				clear:function(){
					this.element.find('select,input').val('');
				}
			});
		}
		
	}

//自定义查询按钮功能
function func_button_btnSearch(){
	//验证车牌是否符合规则
	var chepLen = $("#field_chep input").val();
		if(chepLen.length>0&&chepLen.length!=6){
			alert("${i18n.peizjh_chep_notseven }");
			return false;
		}
		if(chepLen.length>0){
			var reg = "^[A-Z]{1}[A-Z_0-9]{5}$";
	        var matchChep= chepLen.match(reg);
			if(matchChep==null){
			   alert("${i18n.peizjh_input_rightchep }");
		       return false;
		    }
		}
	 $("#peizjhGrid").grid("submit");
}

//自定义重置按钮功能
function func_button_btnReset(){
	$("#peizjhGrid").grid("reset");
}


/**
 * 自定义增加铵钮功能
 */
function func_button_btnAdd(){
		$.sdcui.pageUtils.goPage({
			url:'/fj/toPageAddPeizjh.do',
			mode:'form',
			beforeSubmit:function(){
				return true;
			}
		});
		return;
	}
	
/**
 * 自定义修改按钮功能
 */
function func_button_btnEdit(){
		var rowData = $("#peizjhGrid").grid('getSelectedRecords')[0];
		if(rowData.jihzt==1){//如果状态为已打印则不能修改
			alert("${i18n.peizjh_dont_change }");
			return;
		}
		if(rowData.jihzt==2){//该配载计划处理中，不能修改
			alert("该配载计划处理中，不能修改");
			return;
		}
		$.sdcui.pageUtils.goPage({
			url:'/fj/toPageEditPeizjh.do',
			record:rowData,
			mode:'form',
			beforeSubmit:function(){
				return true;
			}
		});
		return;
}

	//keyup事件，将小写字母转换成大写字母，查询时
function UpCaseSchep(){
		 obj=document.getElementById("schep");
		 obj.value=( obj.value.toUpperCase());
}
//keyup事件，将小写字母转换成大写字母，打印时
function UpCaseAchep(){
	obj=document.getElementById("achep");
	obj.value=( obj.value.toUpperCase());
}

	var isPrint = function (v) {
		if (v == 0) {
			return "${i18n.unprint}";
		} else if (v == 1){
			return "${i18n.print}";
		} else if (v == 2){
			return "${i18n.handling}";
		}
	} 
	$.sdcui.serverConfig.convertArray['yunss'] =${yunssJson};
	$.sdcui.serverConfig.convertArray['chex'] =${chexJson};
	                                           //{'cx001':'大车','cx002':'小车'} 
	                                                                                  
	 //拼下拉框组件
	function peizjhGrid_beforeSubmit(){
		var pzElement = $('#pz_chep');
		if(!pzElement.hasClass('loaded')){
			$('#pz_chep').html('<select><option value=""></option>'+parseStateOfOptions()+'</select><input maxlength="6" id="schep" onkeyup="UpCaseSchep();"/>');
			
			$('#pz_chep').addClass('loaded').fieldCustom({
				property:'chep',
				setValue:function(value){
					 
				},
				getValue:function(){
					var value = this.element.find('select').val()+this.element.find('input').val();
					return value;
				},
				clear:function(){
					this.element.find('select,input').val('');
				}
			});
		}
		
		//验证开始时间与结束时间
		var startTime = $("#pz_fromDaocsj").fieldValue();
 		var endTime = $("#pz_toDaocsj").fieldValue();
 		var start = new Date(startTime.replace("-","/"));
 		var end = new Date(endTime.replace("-","/"));
 		var n = end.getTime() - start.getTime();
 		if(n<0){
 			alert("${i18n.js_dateCompare}");
 			return false;
 		}
 		
 		
 		
 		
	}
	                                                                                      
	   /**
	   	*点击打印打开确认页面  
	    */
		function func_button_pz_print(){
			chepInit();
			var rowData = $("#peizjhGrid").grid('getSelectedRecords')[0];
			if(rowData==undefined){
				alert("${i18n.js_xuanz}");
				return;
			}
			
			var params = [];
			params.push("peizdh="+isUndefinedOrNull(rowData.peizdh));//配载单号
			params.push("jihcx="+isUndefinedOrNull(rowData.jihcx));  //车型
			params.push("chep="+isUndefinedOrNull(rowData.chep)); //车牌
			params.push("yunssbm="+isUndefinedOrNull(rowData.yunssbm));//运输商编码
			params.push("usercenter="+isUndefinedOrNull(rowData.usercenter)); //用户中心
			params.push("gongsmc="+isUndefinedOrNull(rowData.gongsmc));//运输商名称 
			params.push("daocsj="+isUndefinedOrNull(rowData.daocsj));  //到车时间
			params.push("faysj="+isUndefinedOrNull(rowData.faysj));    //发运时间
			params.push("cangkbh="+isUndefinedOrNull(rowData.cangkbh)); //仓库编号
			if(rowData.jihzt==1){//如果状态为已打印则不需确认，直接打印
				 //alert("直接打印"); 
				if(confirm("${i18n.peizjh_whether_again }")){
					//直接打印
					 $.sdcui.ajaxUtil.ajax({
		 	 	        url:"${ctx}/fj/printPeizjh.ajax",
		 	 	        data:params.join("&"), 
		 	            success:function (result){
		 	            	alert("${i18n.peizjh_day_finish }");
		 	            }
					 });
				}
					return;
				
			}
			$('#form_peizjh').form('fillRecord',$.extend({yaohlList:'--'},rowData));
			$("#form_peizjh").form("open");
			$("#form_peizjh").find('input#achep')[0].value = "";
			$("#form_peizjh").find('select')[0][0].selected = true;
	
		}
		
		/**
	   	*点击产看打开查看页面  
	    */
		function func_button_btnshow(){
			$("#peizjhshow_chep").fieldValue("");
			var rowData = $("#peizjhGrid").grid('getSelectedRecords')[0];
			if(rowData==undefined){
				alert("${i18n.js_xuanz}");
				return;
			}
			$('#form_peizjhshow').form('fillRecord',$.extend({yaohlList:'--'},rowData));
			$("#form_peizjhshow").form("open");
	
		}
		/**
	   	 * 点击删除打开删除页面  
	     */
		function func_button_pz_del(){
			var rowData = $("#peizjhGrid").grid('getSelectedRecords')[0];
			var params = [];
			params.push("peizdh="+isUndefinedOrNull(rowData.peizdh));   //配载单号
			if(rowData==undefined){
				alert("${i18n.js_xuanz}");
				return;
			}
			if(rowData.jihzt==1){//如果状态为已打印则不能删除
				alert("${i18n.peizjh_dont_delete }");
				return;
			}
			
			if(rowData.jihzt==2){//如果状态为处理中，且要货令明细为空可以删除
				//删除配载计划
				 $.sdcui.ajaxUtil.ajax({
		 	 	        url:"${ctx}/fj/deleteCheck.ajax",
		 	 	        data:params.join("&"),
		 	            success:function (result){
		 	            	if(result.num == '0'){
		 	   				$("#form_wulgz").form("open");
		 					$('#form_wulgz').form('fillRecord',$.extend(rowData));
		 	            	}else{
			 					alert("该配载计划处理中，不能删除");
			 					return;
		 	            	}
		 	 	        }
		 	       });	
			}else{
				$("#form_wulgz").form("open");
				$('#form_wulgz').form('fillRecord',$.extend(rowData));
			}		

		}
		
		/**
	   	 * 保存打印，自定义提交 
	     */
		function func_button_savePrint(){
			var rowData = $("#peizjhGrid").grid('getSelectedRecords')[0];
			var formRecord = $("#form_peizjh").form('getFormRecord'); 
			var cp = decodeURIComponent(formRecord.chep); //js解码
			 
			 //0013129-xss
			switch(cp[0]){
					case  '鄂':
							cp = cp.replace("鄂","HB");
						      break;
						      
					case  '京':
							cp = cp.replace("京","BJ");
						      break;	
						      
					case  '津':
							cp = cp.replace("津","TJ");
						      break;
						      
					case  '冀':
							cp = cp.replace("冀","HE");
						      break;
						      
					case  '晋':
							cp = cp.replace("晋","SX");
						      break;
						      
					case  '蒙':
							cp = cp.replace("蒙","NM");
						      break;
						      
					case  '辽' :
							cp = cp.replace("辽","LN");
						      break;
						      
					case  '吉' :
							cp = cp.replace("吉","JL");
						      break;
						      
					case  '黑' :
							cp = cp.replace("黑","HL");
						      break;
						      
					case  '沪' :
							cp = cp.replace("沪","SH");
						      break;
						      
					case  '苏' :
							cp = cp.replace("苏","JS");
						      break;	      	
						      
					case  '浙' :
						cp = cp.replace("浙","ZJ");
						      break;
			      
					case  '皖' :
						cp = cp.replace("皖","AH");
						      break;
				  
				    case  '闽' :
				    	cp = cp.replace("闽","FJ");
						      break;
						      
					case  '赣' :
						cp = cp.replace("赣","JX");
						      break;
						      
					case  '鲁' :
						cp = cp.replace("鲁","SD");
						      break;						      
						      
					case  '豫' :
						cp = cp.replace("豫","HA");
						      break;
						      
					case  '湘' :
						cp = cp.replace("湘","HN");
						      break;
						      
					case  '粤' :
						cp = cp.replace("粤","GD");
						      break;
						      
					case  '桂' :
						cp = cp.replace("桂","GX");
						      break;
						      
					case  '琼' :
						cp = cp.replace("琼","HI");
						      break;	      
						      
					case  '川' :
						cp = cp.replace("川","SC");
						      break;
						      
					case  '贵' :
						cp = cp.replace("贵","GZ");
						      break;
						      
					case  '云' :
						cp = cp.replace("云","YN");
						      break;		
						      
					case  '渝' :
						cp = cp.replace("渝","CQ");
						      break;	
						      
					case  '藏' :
						cp = cp.replace("藏","XZ");
						      break;	
						      
					case  '陕' :
						cp = cp.replace("陕","SN");
						      break;	
					
					case  '甘' :
						cp = cp.replace("甘","GS");
						      break;
						      
					case  '青' :
						cp = cp.replace("青","QH");
						      break;
						      
					case  '宁' :
						cp = cp.replace("宁","NX");
						      break;
						      
					case  '新' :
						cp = cp.replace("新","XJ");
						      break;
						      
					default :
					        break; 	      						      				      				      			
				}
			
			
			
			rowData['chep']=cp;
			var records = $("#form_grid_peizYaohl").grid('getRecords',false); 
			$.each($("#form_grid_peizYaohl").grid('getRecords',true),function(i, n){
				records.push(n);
			}); 
			var params = [];
			$.each(records,function(i,n){
				 params.push("yaohlList["+i+"]=" + n.YAOHLH);
			}); 
			
			params.push("peizdh="+isUndefinedOrNull(rowData.peizdh));   //配载单号
			params.push("jihcx="+isUndefinedOrNull(rowData.jihcx));     //车型
			//0013129-xss
			//params.push("chep="+isUndefinedOrNull(formRecord.chep));    //车牌
			
			params.push( "chep="+isUndefinedOrNull(cp) );    //车牌 
			
			params.push("yunssbm="+isUndefinedOrNull(rowData.yunssbm)); //运输商编码
			params.push("usercenter="+isUndefinedOrNull(rowData.usercenter));//用户中心
			params.push("yaocmxh="+isUndefinedOrNull(rowData.yaocmxh)); //要车明细号
			params.push("yunslx="+isUndefinedOrNull(rowData.yunslx));   //运输路线
			params.push("gongsmc="+isUndefinedOrNull(rowData.gongsmc)); //运输商名称
			params.push("daocsj="+isUndefinedOrNull(rowData.daocsj));   //到车时间
			params.push("faysj="+isUndefinedOrNull(rowData.faysj));     //发运时间
			params.push("cangkbh="+isUndefinedOrNull(rowData.cangkbh)); //仓库编号
			
			delete formRecord.yaohlList;
			if($("#form_peizjh #field_chep input").val()==""){
				alert("${i18n.peizjh_chep_notnull }");
				return false;
			}
			var chepLen = $("#form_peizjh #field_chep input").val();
	 		if(chepLen.length>0&&chepLen.length!=6){
	 			alert("${i18n.peizjh_chep_notseven }");
	 			return false;
	 		}
	 		if(chepLen.length>0){
	 			var reg = "^[A-Z]{1}[A-Z_0-9]{5}$";
		        var matchChep= chepLen.match(reg);
				if(matchChep==null){
				   alert("${i18n.peizjh_input_rightchep }");
			       return false;
			    }
	 		}
			
				//修改配载计划、修改要车计划状态、插入配载单和配载单明细
				 $.sdcui.ajaxUtil.ajax({
		 	 	        url:"${ctx}/fj/updatePeizjh.ajax",
		 	 	        data:params.join("&"),  //自动封装到bean中
		 	            success:function (rep){
			 	            if (rep.result.success=='true'){
			 	            	//直接打印
								 $.sdcui.ajaxUtil.ajax({
					 	 	        url:"${ctx}/fj/printPeizjh.ajax",
					 	 	        data:params.join("&"), 
					 	            success:function (result){
					 	            	alert("${i18n.peizjh_day_finish }");
					 	            }
								 });
			 	            	
			 	            	$("#form_peizjh").form("close"); 
			 	            	$("#peizjhGrid").grid("reload",false);
			 	            } else if (rep.result.success=='false'){
			 	            	if(rep.noYaohl=='0'){
			 	            		alert('${i18n.js_noBeihdYaohl}');
			 	            		return;
			 	            	}
			 	            	rowData['noMatchYaohlList'] = rep.notMatch;
			 	            	rowData['bhdList']= rep.result.bhdList;
			 	            	$('#form_surePeiz').form('fillRecord',$.extend(rowData)); 
			 	            	$("#form_peizjh").form("close"); 
			 	            	$("#form_surePeiz").form("open");  
			 	            }  
		 	 	        }
		 	       });
				$("#peizjhGrid").grid("reload",true);
			}

		/**
	   	 * 保存跳转，自定义提交
	     */
		function func_button_saveWulgz(){
			var formRecord = $("#form_wulgz").form('getFormRecord'); 
			var params = [];
			params.push("yaocmxh="+formRecord.yaocmxh);
			params.push("peizdh="+formRecord.peizdh);
			params.push("jihcx="+formRecord.jihcx);
			params.push("shijcx="+formRecord.shijcx);
			params.push("yunssbm="+formRecord.yunssbm);
			params.push("jihy="+formRecord.jihy);
			params.push("caozy="+formRecord.caozy);
			params.push("usercenter="+formRecord.usercenter);
			params.push("guzyy="+formRecord.guzyy);
			
			$("#form_wulgz").form('submit');
			if($("#form_wulgz").form('validate')==true){
				//删除配载计划
				 $.sdcui.ajaxUtil.ajax({
		 	 	        url:"${ctx}/fj/deletePeizjh.ajax",
		 	 	        data:params.join("&"),
		 	            success:function (result){
		 	            	//保存成功后跳转到配载计划页面
		 					window.location.href="${ctx}/fj/peizjh.do";
		 	 	        }
		 	       });	
			}
			
		}
		
		/**
		*确认配载
		*/
		function func_button_surePeiz(){
			var formRecord = $("#form_surePeiz").form('getFormRecord'); 
			var records = $("#form_grid_NoMatchYaohl").grid('getRecords',false); 
			$.each($("#form_grid_NoMatchYaohl").grid('getRecords',true),function(i, n){
				records.push(n);
			}); 

			var params = [];
			$.each(records,function(i,n){
				 params.push("noMatchYaohlList["+i+"]=" + n.YAOHLH);
			}); 
			params.push("peizdh="+isUndefinedOrNull(formRecord.peizdh));  //配载单号
			params.push("jihcx="+isUndefinedOrNull(formRecord.jihcx));    //车型
			
			
			
			
			//0013129-xss
			var cp  = formRecord.chep;
			switch(cp[0]){
					case  '鄂':
							cp = cp.replace("鄂","HB");
						      break;
						      
					case  '京':
							cp = cp.replace("京","BJ");
						      break;	
						      
					case  '津':
							cp = cp.replace("津","TJ");
						      break;
						      
					case  '冀':
							cp = cp.replace("冀","HE");
						      break;
						      
					case  '晋':
							cp = cp.replace("晋","SX");
						      break;
						      
					case  '蒙':
							cp = cp.replace("蒙","NM");
						      break;
						      
					case  '辽' :
							cp = cp.replace("辽","LN");
						      break;
						      
					case  '吉' :
							cp = cp.replace("吉","JL");
						      break;
						      
					case  '黑' :
							cp = cp.replace("黑","HL");
						      break;
						      
					case  '沪' :
							cp = cp.replace("沪","SH");
						      break;
						      
					case  '苏' :
							cp = cp.replace("苏","JS");
						      break;	      	
						      
					case  '浙' :
						cp = cp.replace("浙","ZJ");
						      break;
			      
					case  '皖' :
						cp = cp.replace("皖","AH");
						      break;
				  
				    case  '闽' :
				    	cp = cp.replace("闽","FJ");
						      break;
						      
					case  '赣' :
						cp = cp.replace("赣","JX");
						      break;
						      
					case  '鲁' :
						cp = cp.replace("鲁","SD");
						      break;						      
						      
					case  '豫' :
						cp = cp.replace("豫","HA");
						      break;
						      
					case  '湘' :
						cp = cp.replace("湘","HN");
						      break;
						      
					case  '粤' :
						cp = cp.replace("粤","GD");
						      break;
						      
					case  '桂' :
						cp = cp.replace("桂","GX");
						      break;
						      
					case  '琼' :
						cp = cp.replace("琼","HI");
						      break;	      
						      
					case  '川' :
						cp = cp.replace("川","SC");
						      break;
						      
					case  '贵' :
						cp = cp.replace("贵","GZ");
						      break;
						      
					case  '云' :
						cp = cp.replace("云","YN");
						      break;		
						      
					case  '渝' :
						cp = cp.replace("渝","CQ");
						      break;	
						      
					case  '藏' :
						cp = cp.replace("藏","XZ");
						      break;	
						      
					case  '陕' :
						cp = cp.replace("陕","SN");
						      break;	
					
					case  '甘' :
						cp = cp.replace("甘","GS");
						      break;
						      
					case  '青' :
						cp = cp.replace("青","QH");
						      break;
						      
					case  '宁' :
						cp = cp.replace("宁","NX");
						      break;
						      
					case  '新' :
						cp = cp.replace("新","XJ");
						      break;
						      
					default :
					        break; 	      						      				      				      			
				}
			
			//params.push("chep="+isUndefinedOrNull(formRecord.chep));      //车牌
			params.push( "chep="+isUndefinedOrNull(cp) );     
			
			params.push("yunssbm="+isUndefinedOrNull(formRecord.yunssbm));//运输商编码
			params.push("usercenter="+isUndefinedOrNull(formRecord.usercenter));//用户中心
			params.push("yaocmxh="+isUndefinedOrNull(formRecord.yaocmxh));  //要车明细号
			params.push("yunslx="+isUndefinedOrNull(formRecord.yunslx));    //运输路线
			params.push("gongsmc="+isUndefinedOrNull(formRecord.gongsmc));  //运输商名称
			params.push("daocsj="+isUndefinedOrNull(formRecord.daocsj));    //到车时间
			params.push("faysj="+isUndefinedOrNull(formRecord.faysj));     //发运时间
			params.push("cangkbh="+isUndefinedOrNull(formRecord.cangkbh)); //仓库编号
			params.push("bhdList="+isUndefinedOrNull(formRecord.bhdList));  //备货令列表
			
			 $.sdcui.ajaxUtil.ajax({
	 	 	        url:"${ctx}/fj/surePeiz.ajax",
	 	 	      	data:params.join("&"),
	 	            success:function (result){
	 	            //直接打印
						$.sdcui.ajaxUtil.ajax({
			 	 	       url:"${ctx}/fj/printPeizjh.ajax",
			 	 	       data:params.join("&"), 
			 	           success:function (result){
			 	            alert("${i18n.peizjh_day_finish }");
			 	           }
						});
	 	            	$("#form_surePeiz").form("close"); 
	 	            	$("#peizjhGrid").grid("reload",false);
	 	 	        }
	 	       });	
			
		}
		
		/**
		*取消配载
		*/
		function func_button_cancelPeiz(){
			var formRecord = $("#form_surePeiz").form('getFormRecord'); 
			 $.sdcui.ajaxUtil.ajax({
	 	 	        url:"${ctx}/fj/cancelPeiz.ajax",
	 	 	        data:"peizdh="+$("#peizSure_peizdh").fieldValue(),
	 	            success:function (result){
	 	            	$("#form_surePeiz").form("close"); 
	 	            	$("#peizjhGrid").grid("reload",false);
	 	 	        }
	 	       });	
			
		}

	</script>
</t:page>	
</t:html>
