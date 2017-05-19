<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.yhlwbtitle}">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<script type="text/javascript">
	
</script>
</head>
<t:page i18n="i18n.xqjs.kanbyhl.kanbjs">
	<t:grid id="Yhl" caption="${i18n.search_condition}" showNum="true" showCheckbox="true" scrollHeight="230" src="/yhl/searchYaohl.ajax" add="NOT" edit="NOT" remove="NOT" load="false"
		idKeys="yaohlh,editor,edit_time,dingdmxid,cangkbh">
		
		<t:fieldLayout id="yhl" prefix="layout" columns="4">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" notNull="true" width="100"></t:fieldSelect>
			<t:fieldSelect property="jihyz" caption="${i18n.jihyz}" width="100" convert="getJihz"></t:fieldSelect>
			<t:fieldText property="dingdh" maxLength="10" caption="${i18n.dingdh}" minLength="8" width="100"></t:fieldText>
			<t:fieldText property="yaohlh" maxLength="12" caption="${i18n.yhlh}" width="100"></t:fieldText>
			<t:fieldText property="lingjbh" maxLength="10" caption="${i18n.lingjbh}" width="100"></t:fieldText>
			<t:fieldText property="gongysdm" maxLength="10" caption="${i18n.gongysdm}" width="100"></t:fieldText>
			<t:fieldText property="keh" caption="${i18n.keh}" width="100" maxLength="5"></t:fieldText>
			<t:fieldText property="mudd" maxLength="13" caption="${i18n.mudd}" width="100"></t:fieldText>
			<t:fieldSelect property="sj" caption="${i18n.sj}" convert="queryYhlsj" width="100"></t:fieldSelect>
			<t:fieldCalendar property="qssj" format="yyyy-MM-dd HH:mm:ss" width="142"></t:fieldCalendar>
			<t:fieldCalendar property="jssj" format="yyyy-MM-dd HH:mm:ss" caption="${i18n.zi}" width="142"></t:fieldCalendar>
			<t:fieldSelect property="jiaofzt" convert="queryYhlddzt" caption="${i18n.ddzt}" width="100"></t:fieldSelect>
			<t:fieldHidden property="zt"></t:fieldHidden>
			<t:fieldSelect property="yaohllx" convert="queryWghms" caption="${i18n.ghms}" width="100"></t:fieldSelect>
			<t:fieldCheckboxGroup property="yaohlzt" caption="${i18n.zt}" convert="Yhlzt" width="360" column="2"></t:fieldCheckboxGroup>
			<t:fieldText property="chengysdm"  caption="${i18n.chengysdm}" width="100"></t:fieldText>
			<t:fieldSelect property="shifpz" caption="发送供应商" convert="shifpz" width="100" ></t:fieldSelect>
			<t:fieldSelect property="shiflsk" caption="是否临时卡" convert="shiflsk" width="100" ></t:fieldSelect>
			<t:fieldText property="chanx" caption="${i18n.chanx}" width="100" maxLength="5"></t:fieldText>
			<t:fieldSelect property="shiftt" caption="是否调整" width="100"  convert="queryshiftt"></t:fieldSelect>
		</t:fieldLayout>
		<t:gridCol property="yaohlh" caption="${i18n.yhlh}"></t:gridCol>
		<t:gridCol width="80" property="dingdh" caption="${i18n.dingdh}"></t:gridCol>
		<t:gridCol width="80" property="usercenter" caption="${i18n.usercenter}"></t:gridCol>
		<t:gridCol width="80" property="lingjbh" caption="${i18n.lingjbh}"></t:gridCol>
		<t:gridCol width="80" property="gongysdm" caption="${i18n.gongysdm}"></t:gridCol>
		<t:gridCol width="80" property="chengysdm" caption="${i18n.chengysdm}"></t:gridCol>
		<t:gridCol width="80" property="yaohllx" caption="${i18n.ghms}"></t:gridCol>
		<t:gridCol width="80" property="fahd" caption="${i18n.fahd}"></t:gridCol>
		<t:gridCol width="80" property="cangkbh" caption="${i18n.ck}"></t:gridCol>
		<t:gridCol width="80" property="zickbh" caption="${i18n.zick}"></t:gridCol>
		<t:gridCol width="80" property="mudd" caption="${i18n.mudd}"></t:gridCol>
		<t:gridCol width="80" property="keh" caption="${i18n.keh}"></t:gridCol>
		<t:gridCol width="80" property="baozxh" caption="${i18n.baozlx}"></t:gridCol>
		<t:gridCol width="80" property="yaohsl" caption="${i18n.ljsl}"></t:gridCol>
		<t:gridCol width="100" property="faysj" caption="${i18n.yjfcsj}" ></t:gridCol>
		<t:gridCol width="100" property="shijfysj" caption="${i18n.shijfysj}"></t:gridCol>
		<t:gridCol width="100" property="yaohlscsj" caption="要货令表达时间"></t:gridCol>
		<t:gridCol width="80" property="chanx" caption="${i18n.chanx}"></t:gridCol>
		<t:gridCol width="100" property="zuiwsj" caption="${i18n.yjjfsj}"></t:gridCol>
		<t:gridCol width="120" property="yuanzuiwsj" caption="原最晚交付时间"></t:gridCol>
		<t:gridCol width="130" property="xiughyjjfsj" caption="${i18n.xiughyjjfsj}"></t:gridCol>
		<t:gridCol width="100" property="jiaofj" caption="${i18n.sjjfsj}"></t:gridCol>
		<t:gridCol width="80" property="jiaofzt" caption="${i18n.ddzt}" convert="queryYhlddzt"></t:gridCol>
		<t:gridCol width="80" property="yaohlzt" caption="${i18n.zt}" convert="queryYhlzt"></t:gridCol>
		<t:gridCol width="80" property="jihyz" caption="${i18n.jihyz}"></t:gridCol>
		<t:gridCol property="daijfsl" type="text" caption="实际交付数量" ></t:gridCol>
		<t:gridCol property="shifpz" type="text" caption="是否发送供应商" convert="shiffsgys"></t:gridCol>
		<t:gridCol property="shiflsk" type="text" caption="是否临时卡" convert="shiflsk"></t:gridCol>
		<t:gridCol width="80" property="chansyy" caption="产生原因" convert="chansyy"></t:gridCol>
		<t:gridCol width="80" property="zhongzyy" caption="终止原因" convert="zhongzyy"></t:gridCol>
		<t:gridCol width="80" property="yuanyhlh" caption="原要货令号"></t:gridCol>
		<t:gridCol width="80" property="beiz" caption="${i18n.bz}"></t:gridCol>
<%-- 		<t:gridCol width="80" property="yuanzuizsj" caption="原最早交付时间"></t:gridCol> --%>
	</t:grid>
	<t:buttons id="btn">
		<t:button caption="${i18n.zhongz}" name="zhongz"></t:button>
		 <c:if test='${zbcZxc=="ZXC"}' >
			<t:button caption="批量终止要货令" name="plzzyhl"></t:button>
		</c:if>
	</t:buttons>
	    
	    <div id="ck_dataItems_selectedValues" style="display: none;">
		        <div class="youi-button active-3" id="button_expxls">
					<div class="right">
					<div class="center">
					  <a class="expxls" href="#">${i18n.exldaoc}</a>
			       </div>
			       </div>
			    </div>
	    </div>
	    
	    <c:if test='${zbcZxc=="ZXC"}'>
		<t:file action="/yhl/importAth_pilzzyhl.do" size="50">
			<t:fileparam sheet="yaohl" keys="USERCENTER,YAOHLH,LINGJBH" table="{dbSchemal3}ck_yaohl_zhongz" datasourceId="1"/>
		</t:file>
		<t:buttons id="temp">
			<t:button caption="批量终止模板下载" name="mobxz"></t:button>
		</t:buttons>
		<div><font color="red">导入结果不能大于300条,否则为空</font></div>
		<form id="form_importyaohltz_xls" target="_self" enctype="multipart/form-data" action="/athena/yhl/importAth_yaohltz.do" method="post" name="form_importyaohltz_xls">
	    <table>
		<tbody>
			<tr>
				<td>
					<input id="fileNameyaohltz_xls" type="file" size="50" name="fileNameyaohltz_xls">
				</td>
				<td>
					<div id="button_submityaohltzupload" class="youi-button active-0">
						<div class="right">
							<div class="center">
								<a class="submit" onclick="form_submityaohltz()" href="#">批量调整要货令导入</a>
							</div>
						</div>
					</div>
				</td>
				<td style="padding-left: 10px;">
					<t:buttons>
						<t:button caption="要货令调整模板下载" name="mobxz_yaohltz" active="0"/>
					</t:buttons>
				</td>
		   </tr>
		</tbody>
	</table>
	<script type="text/javascript">
	function form_submityaohltz(){ 
		var formEle = document.getElementById("form_importyaohltz_xls"); 
		if($("#fileNameyaohltz_xls").val()==null || ""==$("#fileNameyaohltz_xls").val())
		{ 
			alert("上传文件不能为空."); 
			return false; 
		}else{ 
			window.down_showLoading();
			formEle.submit(); 
		} 
	} 
	$(document).ready(function(){window.down_hideLoading();var a = "null"; if(a!='null') { a = a.replace(/@/g,'\n');alert(a);}});
	</script>
	<input id="import_hidd_comfig" type="hidden" value="[{'sheet':'yaohltz','datasourceId':'1','table':'{dbSchemal3}CK_YAOHL','keys':'USERCENTER,YAOHLH','dateColumns':'ZUIWSJ','dateFormats':'yyyy-MM-dd HH24:mm:ss','clazz':'null'}]" name="import_hidd_comfig">
	</form>
	<div><font color="red">导入结果不能大于10000条,否则为空</font></div>
	
	</c:if>
</t:page>
<script type="text/javascript">
    $("#button_submit_upload").find("a").html("批量终止要货令导入");  
	$(function(){ 
		var htmls =[];
		htmls.push($('#ck_dataItems_selectedValues').html());
		$('div.grid-formButtons table tr').append('<td>'+htmls.join('')+'</td>');
		 $('#ck_dataItems_selectedValues').empty();
		$('#button_expxls').click(func_grid_expxls);
		if($('#button_mobxz').parent().html() != null){
			$('#form_import_xls').find('tr').append('<td style="padding-left: 10px;">'+$('#button_mobxz').parent().html()+'</td>');
			$('#temp').remove();                		               
		}
		$('#button_mobxz').click(func_button_mobxz);
		$('#button_mobxz_yaohltz').click(func_button_mobxz_yaohltz);
	});
	
	
	function func_grid_expxls(event) { 
		var records = $('#Yhl').grid('getSelectedRecords');
		var usercenter="";
		var jihyz="";
		var dingdh = "";
		var yaohlh = "";
		var lingjbh="";
		var gongysdm = "";
		var keh = "";
		var mudd = "";
		var sj = "";
		var qssj = "";
		var jislx = "";
		var jssj = "";
		var jiaofzt = "";
		var zt = "";
		var yaohllx = "";
		var yaohlzt="";
		var chengysdm="";
		var shifpz ="";
		var shiflsk = "";
		var chanx = "";
		var shiftt = "";
		if(records.length!=0){
			for(var i=0;i<records.length;i++){
				if(i==records.length-1){
					yaohlh +=""+records[i].yaohlh+"";
				   break;
				}
				yaohlh +=""+records[i].yaohlh+",";
			}
		}else{
		 yaohlh = $('#layout_yaohlh').fieldValue();
		}
		
		 usercenter = $('#layout_usercenter').fieldValue();
		 jihyz = $('#layout_jihyz').fieldValue();
		 dingdh = $('#layout_dingdh').fieldValue();
		 lingjbh = $('#layout_lingjbh').fieldValue();
		 gongysdm = $('#layout_gongysdm').fieldValue();
		 keh = $('#layout_keh').fieldValue();
		 mudd = $('#layout_mudd').fieldValue();
		 sj = $('#layout_sj').fieldValue();
		 qssj = $('#layout_qssj').fieldValue();
		 jislx = $('#layout_jislx').fieldValue();
		 jssj = $('#layout_jssj').fieldValue();
		 jiaofzt = $('#layout_jiaofzt').fieldValue();
		 zt = $('#layout_zt').fieldValue();
		 yaohllx = $('#layout_yaohllx').fieldValue();
		 yaohlzt = $('#layout_yaohlzt').fieldValue();
		 chengysdm = $('#layout_chengysdm').fieldValue();
		 shifpz = $('#layout_shifpz').fieldValue();
		 shiflsk = $('#layout_shiflsk').fieldValue();
		 chanx = $('#layout_chanx').fieldValue();
		 shiftt = $('#layout_shiftt').fieldValue();
		$.sdcui.pageUtils.goPage({
			url : '/yhl/yaoHlDownLoadFile.do?usercenter=' + usercenter
					+ '&jihyz=' + jihyz + '&dingdh=' + dingdh + '&yaohlh='
					+ yaohlh + '&lingjbh=' + lingjbh +'&gongysdm='+gongysdm+'&keh='+keh+'&mudd='+mudd+'&sj='+sj+'&qssj='
					+qssj+'&jislx='+jislx+'&jssj='+jssj+'&jiaofzt='+jiaofzt+'&yaohllx='+yaohllx+'&zt='+yaohlzt+'&shifpz='+shifpz+'&shiflsk='+shiflsk+'&chengysdm='+chengysdm+'&chanx='+chanx+'&shiftt='+shiftt,//url
			mode : 'form',
			beforeSubmit : function() {
				//
				return true;
			}
		});
		event.stopPropagation();//阻止事件冒泡
		return false;


	   
	}

	$.sdcui.serverConfig.convertArray['shifpz'] = {'0':'否','1':'是'};
	$.sdcui.serverConfig.convertArray['shiffsgys'] = {'0':'否','1':'是','3':' '};
	$.sdcui.serverConfig.convertArray['shiflsk'] = {'0':'否','1':'是'};
	$.sdcui.serverConfig.convertArray['chansyy'] = {'01':'因原要货令拒收'};
	$.sdcui.serverConfig.convertArray['zhongzyy'] = {'01':'拒收出门'};
	
	$.sdcui.serverConfig.convertArray['Yhlzt'] = {
		'00' : '${i18n.yjf}',
		'01' : '${i18n.bd}',
		'02' : '${i18n.zait}',
		'03' : '${i18n.ddjf}',
		'05' : '${i18n.yzz}'
	};
	$.sdcui.serverConfig.convertArray['queryshiftt'] = {
			'0' : '否',
			'1' : '是'
		};
	$.sdcui.serverConfig.convertArray['Yhlsj'] = {
		'0' : '${i18n.yjfc}',
		'1' : '${i18n.sjfc}',
		'2' : '${i18n.yjjf}',
		'3' : '${i18n.sjjf}'
	};
	$.sdcui.serverConfig.convertArray['Yhlddzt'] = {
		'0' : '${i18n.yw}',
		'1' : '${i18n.tq}',
		'2' : '${i18n.zc}'
	};
	$.sdcui.serverConfig.convertArray['Wghms'] = {
		'R1' : 'R1',
		'R2' : 'R2',
		'C1' : 'C1',
		'CD' : 'CD',
		'SY' : 'SY',
		'PP' : 'PP',
		'PS' : 'PS',
		'PJ' : 'PJ'
	};
	function Yhl_beforeSubmit() {
		var zt = $('#layout_yaohlzt').fieldValue();
		//如果要货令状态不为空则将值付给zt
		$('#layout_zt').fieldValue(zt);

	}
	//终止操作	
	function func_button_zhongz() {
		var yaohl = $('#Yhl').grid('getSelectedRecords');//获得选中行参数
		var param = [];
		if (yaohl.length == 0) {
			alert("${i18n.qxzytsj}");
			return false;
		}
		for ( var i = 0; i < yaohl.length; i++) {
			param.push('edit[' + i + '].usercenter=' + yaohl[i].usercenter);
			param.push('edit[' + i + '].lingjbh=' + yaohl[i].lingjbh);
			/*  param.push('edit['+i+'].gongysdm='+yaohl[i].gongysdm);
			 param.push('edit['+i+'].cangkbh='+yaohl[i].cangkbh);
			 param.push('edit['+i+'].yaohsl='+yaohl[i].yaohsl);
			 param.push('edit['+i+'].editor='+yaohl[i].editor);
			 param.push('edit['+i+'].edit_time='+yaohl[i].edit_time);
			 param.push('edit['+i+'].yaohlzt='+yaohl[i].yaohlzt);
			 param.push('edit['+i+'].dingdmxid='+yaohl[i].dingdmxid);
			 param.push('edit['+i+'].dingdh='+yaohl[i].dingdh); */
			param.push('edit[' + i + '].yaohlh=' + yaohl[i].yaohlh);
		}
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/yhl/ZZYaohl.ajax",
			data : param.join('&'),
			success : function(result) {
				alert(result.result);
				$("#Yhl").grid('reload');
			}
		});

	}
	
	//导出模板
		function func_button_mobxz(){
			$.sdcui.pageUtils.goPage({
				url : '../yhl/downloadYaohlMob.do',
				mode : 'form',
				beforeSubmit : function(){
					return true;
				}
		   });
		}
   //批量终止要货令
   function func_button_plzzyhl(){
        var usercenter = $('#layout_usercenter').fieldValue();
		var lingjbh = $('#layout_lingjbh').fieldValue();
		winOpen = window.open('${ctx}/yhl/initplzzyhl.do?lingjbh='+lingjbh+'&usercenter='+usercenter,'批量终止要货令','top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no, status=no');
        winOpen.resizeTo(screen.availWidth,screen.availHeight);
   }
   
   //导出要货令调整模板
		function func_button_mobxz_yaohltz(){
			$.sdcui.pageUtils.goPage({
				url : '../yhl/downloadYaohltzMob.do',
				mode : 'form',
				beforeSubmit : function(){
					return true;
				}
		   });
		}	
</script>
<style type="text/css">
#yhl td.contral.label-col.col-6 {
	width: 68px;
}

#yhl td.contral.label-col.col-0 {
	width: 68px;
}

#yhl td.contral.label-col.col-2 {
	width: 68px;
}

#yhl td.contral.label-col.col-4 {
	width: 60px;
}

</style>
</t:html>
