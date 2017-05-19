<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","125");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_125}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
$(function(){
	$('#form_user_${pageId}').form({
 		fields:[
                {fieldType:'fieldText',property:'danjlx',dataType:'danjlx',maxLength:'2',caption:'${i18n.xiaohdh}',notNull:false},
				{fieldType:'fieldText',property:'danjbh',notNull:true,caption:'${i18n.danjbh}'}
                ]
 		});
	//打印F1
	$('#btn_print').bind('click',function(){
		//先对单据类型进行校验，成功后对单据号进行校验
		if($('#danjlx input').form("validate")){
		  var danjlx = $('#danjlx input').val();
		  if('1' == danjlx){
		       $('#danjbh').fieldText('setDataType',"jusdh");
		  }else if ('2' == danjlx){
		       $('#danjbh').fieldText('setDataType',"yansdh");
		  }else if ('3' == danjlx){
		       $('#danjbh').fieldText('setDataType',"daohdh");
		  }else if ('4' == danjlx){
		       $('#danjbh').fieldText('setDataType',"panddh");
		  }else if ('5' == danjlx || '21' == danjlx || '31' == danjlx){
		       $('#danjbh').fieldText('setDataType',"beihdh");
		  }else if ('6' == danjlx){
		       $('#danjbh').fieldText('setDataType',"fanxrkdh");
		  }else if ('7' == danjlx){
		       $('#danjbh').fieldText('setDataType',"fanxdh");
		  }else if ('8' == danjlx){
		       $('#danjbh').fieldText('setDataType',"tuihdh");
		  }else if ('9' == danjlx){
		       $('#danjbh').fieldText('setDataType',"jusgzdh");
		  }else if ('10' == danjlx){
		       $('#danjbh').fieldText('setDataType',"zhijgzdh");
		  }else if ('11' == danjlx){
		       $('#danjbh').fieldText('setDataType',"gaibzgzdh");
		  }else if ('12' == danjlx || '16' == danjlx){
		       $('#danjbh').fieldText('setDataType',"ush");
		  }else if ('13' == danjlx){
		       $('#danjbh').fieldText('setDataType',"uch2");
		  }else if ('14' == danjlx){
		       $('#danjbh').fieldText('setDataType',"chukdh");
		  }else if ('15' == danjlx){
		       $('#danjbh').fieldText('setDataType',"xiaohdh");
		  }else if ('17' == danjlx){
		       $('#danjbh').fieldText('setDataType',"jiufdh");
		  }else if ('18' == danjlx){
		       $('#danjbh').fieldText('setDataType',"elh");
		  }else if ('19' == danjlx){
		       $('#danjbh').fieldText('setDataType',"ulh");
		  }else if ('20' == danjlx){
		       $('#danjbh').fieldText('setDataType',"uth");
		  }else if ('21' == danjlx){
		       $('#danjbh').fieldText('setDataType',"beihdh");
		  }else if ('22' == danjlx){
		       $('#danjbh').fieldText('setDataType',"daohykqd");
		  }else if ('23' == danjlx || '24' == danjlx ){
		       $('#danjbh').fieldText('setDataType',"baozdykh");
		  }else if ('25' == danjlx  ){
		       $('#danjbh').fieldText('setDataType',"baozdykh");
		  }else if ('26' == danjlx  ){
		       $('#danjbh').fieldText('setDataType',"yikbhdh");
		  }else if ('27' == danjlx  ){
		       $('#danjbh').fieldText('setDataType',"cangkykqdh");
		  }else if ('28' == danjlx  ){
		       $('#danjbh').fieldText('setDataType',"danqkykqdh");
		  }else if ('29' == danjlx  ){
		       $('#danjbh').fieldText('setDataType',"uch");
		  }else if ('30' == danjlx  ){
		       $('#danjbh').fieldText('setDataType',"yikdh");
		  }else if ('32' == danjlx  ){
		       $('#danjbh').fieldText('setDataType',"blh");
		  }else if ('33' == danjlx  ){
		       $('#danjbh').fieldText('setDataType',"text");
		       if(($('#danjbh input').val()).length > 10){
		          showMsg($.sdcui.resource.i18n['C_V_MAXLENGTH'](10));
		          return ;
		       }
		  }else if ('34' == danjlx  ){//0011295
		       $('#danjbh').fieldText('setDataType',"cangkykqdh");
		  }else {
		  	   showPromptMsg('red',$.sdcui.resource.i18n['C_NotExist'])
		  	   return;
		  }
		}
		if(!$('#form_user_${pageId}').form("validateParam")){
				return;
			}
	 	var params=$('#form_user_${pageId}').form("getFormParam");
<%-- 	 	var danjlx=$("#danjlx input").val();
	 	if(danjlx==19||danjlx==20||danjlx==21||danjlx==2||danjlx==22){
	 		var url = "<%=request.getContextPath()%>/common/12501.do";
	 	}else{
	 		var url = "<%=request.getContextPath()%>/common/12502.do";
	 	} --%>
	 	var url = "<%=request.getContextPath()%>/common/12501.do";
		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			if (showPromptRequestMsg(results)==true){
				 //加载返回数据
				 
			 }
	       });
     	return  false;
 	});
 	$(document).keyboardsupport({});
});
</script>
</head>
<body>
<!--主体内容开始-->
<div id="title"></div>  
<div id="form_user_${pageId}" class="ui-fieldLayout"> 	
<table class="ui-grid" cellspacing="1" width="100%">
<tr>
		<td class="field-label">${i18n.danjlx}：</td>
		<td class="field-container"><div class="ui-field" id="danjlx"></div></td>
		<td class="field-label">${i18n.danjbh}：</td>
		<td class="field-container"><div class="ui-field" id="danjbh"></div></td>
		<td class="field-container">
		<span id="btn_print"  class="ui-button">${i18n.print}[F1]</span>
		<span id="btn_back" class="ui-button">${i18n.back}[F11]</span>
		<span id="btn_return" class="ui-button">${i18n.return}[F12]</span></td>
      </tr>
		</table>
<h4></h4>
		<table class="table-bg-border" cellspacing="1" width="100%" >
      <tr>
		<td>1.${i18n.bill_01}</td>
		<td>2.${i18n.bill_02}</td>
		<td>3.${i18n.bill_03}</td>
		<td>4.${i18n.bill_04}</td>				
		<td>5.${i18n.bill_05}</td>
		<td>6.${i18n.bill_06}</td>
	  </tr>
      <tr>
		<td>7.${i18n.bill_07}</td>
		<td>8.${i18n.bill_08}</td>
		<td>9.${i18n.bill_09}</td>
		<td>10.${i18n.bill_10}</td>				
		<td>11.${i18n.bill_11}</td>
		<td>12.${i18n.bill_12}</td>	  
      </tr>
	  <tr>
		<td>13.${i18n.bill_13}</td>
		<td>14.${i18n.bill_14}</td>
		<td>15.${i18n.bill_15}</td>
		<td>16.${i18n.bill_16}</td>				
		<td>17.${i18n.bill_17}</td>
		<td>18.${i18n.bill_18}</td>
	  </tr>
	  <tr>
		<td>19.${i18n.bill_19}</td>
		<td>20.${i18n.bill_20}</td>
		<td>21.${i18n.bill_21}</td>
		<td>22.${i18n.bill_22}</td>				
		<td>23.${i18n.bill_23}</td>
		<td>24.${i18n.bill_24}</td>
	  </tr>
	  <tr>
		<td>25.${i18n.bill_25}</td>
		<td>26.${i18n.bill_26}</td>
		<td>27.${i18n.bill_27}</td>
		<td>28.${i18n.bill_28}</td>				
		<td>29.${i18n.bill_29}</td>
		<td>30.${i18n.bill_30}</td>
	  </tr>
	   <tr>
		<td>31.${i18n.bill_31}</td>
		<td>32.${i18n.bill_32}</td>
		<td>33.${i18n.bill_33}</td>
		
		<td>34.${i18n.bill_34}</td>
	  </tr>
	  <tr>
		<td></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>				
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	  </tr>
		</table>
		</div>	
			<h4>
	
			</h4>	
  <div id='prompt'>${i18n.prompt}</div>	  
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>