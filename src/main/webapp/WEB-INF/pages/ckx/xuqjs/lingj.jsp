<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<%
String welcome = (String)request.getSession().getAttribute("zbcZxc");
%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="role" value="${role}"/>

<t:html title="${i18n.lingj}">

<!-- 
	  零件
	 @author denggq
	 @date 2012-3-23
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>

<t:page i18n="i18n.ckx.xuqjs.i18n_lingj">
	<t:grid id="grid_lingj" caption="${i18n.lingj}" idKeys="usercenter,lingjbh" load="false" showNum="true" dataFormId="form_lingj" back="NOT"
		 src="/xuqjs/queryLingj.ajax" editSrc="/xuqjs/getLingj.ajax" remove="NOT" scrollHeight="295" pageSize="15">
		<t:fieldLayout prefix="record" columns="3">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" defaultValue="${usercenter}" convert="queryUserCenterMap" width="150"/>
			<t:fieldText property="lingjbh" caption="${i18n.lingjbh}" maxLength="10" width="150"/>
			<t:fieldSelect property="lingjlx" caption="${i18n.lingjlx}" convert="queryLjlx"  width="150"/>
			<t:fieldSelect property="lingjsx" caption="${i18n.lingjsx}" convert="queryLjsx"  width="150"/>
			<t:fieldSelect property="guanjljjb" caption="${i18n.guanjljjb}" convert="queryGuanjljjb"  width="150"/>
			<t:fieldSelect property="jihy" caption="${i18n.jihy}" src="/xuqjs/getZudmByAthority.ajax?role=JIHUAY" 
 				parents="usercenter"	show="VALUE" code="KEY" defaultValue="${JIHUAY}" width="150"/>
 			<t:fieldSelect property="zhijy" caption="${i18n.zhijy}" src="/xuqjs/getZudmByAthority.ajax?role=ZHIJIA"
				parents="usercenter"	show="VALUE" code="KEY" defaultValue="${ZHIJIA}" width="150" /> 
		<%-- 	<c:if test="${ 'JIHUAY' == role }">
				<t:fieldHidden property="jihy" caption="${i18n.jihy}"  defaultValue="${JIHUAY}" />
			</c:if> --%>
			<%-- <c:if test="${ 'WULIUY' == role }">
				<t:fieldHidden property="wuly" caption="${i18n.wuly}" defaultValue="${WULIUY}" /> 
			</c:if> --%>
			<%-- <c:if test="${ 'WULGYY' == role }">
				<t:fieldHidden property="wlgyy" caption="${i18n.wlgyy}"  defaultValue="${WULGYY}" />
			</c:if> --%>
			<%-- <c:if test="${ 'ZHIJIA' == role }">
				<t:fieldHidden property="zhijy" caption="${i18n.zhijy}" defaultValue="${ZHIJIA}" /> 
			</c:if> --%>
			<%-- <c:if test="${ 'ZBCPOA' == role }">
				
				<t:fieldSelect property="wlgyy" caption="${i18n.wlgyy}" src="/xuqjs/getZudmByAthority.ajax?role=WULGYY" 
 					show="VALUE" code="KEY" defaultValue="${WULGYY}" width="150"/>
			</c:if>
			
			<c:if test="${ 'ZXCPOA' == role }">
				<t:fieldSelect property="wuly" caption="${i18n.wuly}" src="/xuqjs/getZudmByAthority.ajax?role=WULIUY" 
					show="VALUE" code="KEY" defaultValue="${WULIUY}" width="150"/> 
				<t:fieldSelect property="zhijy" caption="${i18n.zhijy}" src="/xuqjs/getZudmByAthority.ajax?role=ZHIJIA"
					show="VALUE" code="KEY" defaultValue="${ZHIJIA}" width="150"/> 
			</c:if>
			
			<c:if test="${ 'root' == role }">
				<t:fieldSelect property="jihy" caption="${i18n.jihy}" src="/xuqjs/getZudmByAthority.ajax?role=JIHUAY" 
 					show="VALUE" code="KEY" defaultValue="${JIHUAY}" width="150"/>
				<t:fieldSelect property="wlgyy" caption="${i18n.wlgyy}" src="/xuqjs/getZudmByAthority.ajax?role=WULGYY" 
 					show="VALUE" code="KEY" defaultValue="${WULGYY}" width="150"/>
				<t:fieldSelect property="wuly" caption="${i18n.wuly}" src="/xuqjs/getZudmByAthority.ajax?role=WULIUY" 
					show="VALUE" code="KEY" defaultValue="${WULIUY}" width="150"/> 
				<t:fieldSelect property="zhijy" caption="${i18n.zhijy}" src="/xuqjs/getZudmByAthority.ajax?role=ZHIJIA"
					show="VALUE" code="KEY" defaultValue="${ZHIJIA}" width="150"/> 
			</c:if> --%>
			
			<t:fieldSelect property="biaos" caption="${i18n.biaos}" convert="biaos" width="150"/>
		</t:fieldLayout>
		
		<t:button caption="${i18n.export}" name="download"></t:button>
		<t:button caption="${i18n.youx }" name="youx" active="1" />
		<t:button caption="${i18n.invalidate}" name="del" active="1" />
		<t:button caption="下载模板" name="mobxz" ></t:button>
		
		<t:gridCol property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap"></t:gridCol>
		<t:gridCol property="lingjbh" caption="${i18n.lingjbh}"></t:gridCol>
		<t:gridCol property="lingjlx" caption="${i18n.lingjlx}" convert="queryLjlx" ></t:gridCol>
		<t:gridCol property="lingjsx" caption="${i18n.lingjsx}" convert="queryLjsx"></t:gridCol>
		<t:gridCol property="zhongwmc" caption="${i18n.zhongwmc}" width="150"></t:gridCol>
		<t:gridCol property="fawmc" caption="${i18n.fawmc}" width="150"></t:gridCol>
		<t:gridCol property="danw" caption="${i18n.danw}" convert="queryLjdw"></t:gridCol>
		<t:gridCol property="zhizlx" caption="${i18n.zhizlx}" ></t:gridCol>
		<t:gridCol property="kaisrq" caption="${i18n.kaisrq}"></t:gridCol>
		<t:gridCol property="jiesrq" caption="${i18n.jiesrq}"></t:gridCol>
		<t:gridCol property="zhuangcxs" caption="${i18n.zhuangcxs}"></t:gridCol>
		<t:gridCol property="anqm" caption="${i18n.anqm}"></t:gridCol>
		<t:gridCol property="lingjzl" caption="${i18n.lingjzl}"></t:gridCol>
		<t:gridCol property="guanjljjb" caption="${i18n.guanjljjb}" width="100" convert="queryGuanjljjb"></t:gridCol>
		<t:gridCol property="dinghcj" hidden="true" caption="${i18n.dinghcj}" ></t:gridCol>
		<t:gridCol property="chejmc" caption="${i18n.dinghcj}" ></t:gridCol>
		<t:gridCol property="gongybm" caption="${i18n.gongybm}"></t:gridCol>
		<t:gridCol property="zongcldm" caption="${i18n.zongcldm}" width="120"></t:gridCol>
		<t:gridCol property="anjmlxhd" caption="${i18n.anjmlxhd}" width="80"></t:gridCol>
		<t:gridCol property="diycqysj" caption="${i18n.diycqysj}" width="120"></t:gridCol>
		<t:gridCol property="jihy" caption="${i18n.jihy}" width="80"></t:gridCol>
		<t:gridCol property="zhijy" caption="${i18n.zhijy}" width="80"></t:gridCol>
		<t:gridCol property="biaos" caption="${i18n.biaos}" convert="biaos"></t:gridCol>
		<t:gridCol property="" caption="" width="15"/>
	</t:grid>
	
	
	<t:form id="form_lingj" caption="${i18n.lingj }" idKeys="usercenter,lingjbh" action="/xuqjs/saveLingj.ajax" dialog="true" reset="NOT" width="760">
		<t:fieldLayout columns="3" prefix="lingj">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter }" defaultValue="${usercenter }" convert="queryUserCenterMap" notNull="true" width="150"/>
			<t:fieldText property="lingjbh" caption="${i18n.lingjbh }"	maxLength="10" minLength="10" dataType="text" notNull="true" width="150"/>
			<t:fieldText property="zhongwmc" caption="${i18n.zhongwmc }"  width="150"/>
			<t:fieldText property="fawmc" caption="${i18n.fawmc }" maxLength="40" width="150"/>
			<t:fieldSelect property="lingjlx" caption="${i18n.lingjlx }" convert="queryLjlx" notNull="true" width="150"/>
			<t:fieldSelect property="lingjsx" caption="${i18n.lingjsx }" convert="queryLjsx" notNull="true" width="150"/>
			<t:fieldSelect property="danw" caption="${i18n.danw }" convert="queryLjdw" notNull="true" width="150"/>
			<t:fieldText property="zhizlx" caption="${i18n.zhizlx }" notNull="true" maxLength="3" minLength="3" width="150"/>
			<t:fieldCalendar property="kaisrq" caption="${i18n.kaisrq }" format="yyyy-MM-dd" notNull="true" width="150"/>
			<t:fieldCalendar property="jiesrq" caption="${i18n.jiesrq }" format="yyyy-MM-dd" notNull="true" width="150"/>
			<t:fieldText property="zhuangcxs" caption="${i18n.zhuangcxs }" expression="^[1-9][0-9]{0,3}(?:\.[0-9]{1,3})?$|0\.[0-9]{1,3}$|^0$"
				expressionMessage="${i18n.zhuangcxs_ex_mes}" notNull="true" width="150"/>
			<t:fieldText property="anqm" caption="${i18n.anqm }" maxLength="10" dataType="text" width="150"/>
			<t:fieldText property="lingjzl" caption="${i18n.lingjzl }" expression="^[1-9][0-9]{0,3}(?:\.[0-9]{1,3})?$|0\.[0-9]{1,3}$|^0$"
				expressionMessage="${i18n.lingjzl_ex_mes}" width="150"/>
			<t:fieldSelect property="guanjljjb" caption="${i18n.guanjljjb }" convert="queryGuanjljjb" notNull="true" width="150"/>
			<t:fieldSelect property="dinghcj" caption="${i18n.dinghcj }" src="../xuqjs/listChej.ajax" show="chejmc" code="chejbm" parents="usercenter" notNull="true" width="150"/>
			<t:fieldText property="gongybm" caption="${i18n.gongybm }" maxLength="10" dataType="text" width="150"/>
			<t:fieldText property="zongcldm" caption="${i18n.zongcldm }" maxLength="10" dataType="text" width="150"/>
			<t:fieldText property="anjmlxhd" caption="${i18n.anjmlxhd}" maxLength="10" dataType="text" width="150"/>
			<t:fieldCalendar property="diycqysj" caption="${i18n.diycqysj }" format="yyyy-MM-dd" width="150"/>
			<t:fieldSelect property="jihy" caption="${i18n.jihy}" src="/xuqjs/getZudmByAthority.ajax?role=JIHUAY" 
 					show="VALUE" code="KEY" defaultValue="${JIHUAY}" width="150" notNull="true" parents="usercenter"/>
 			<t:fieldSelect property="zhijy" caption="${i18n.zhijy}"  src="/xuqjs/edit.ajax" parents="usercenter,lingjbh"
 				show="VALUE" code="KEY" 	 width="150" />
			<%-- <c:if test="${ 'JIHUAY' == role }">
				<t:fieldHidden property="jihy" caption="${i18n.jihy}"  defaultValue="${JIHUAY}" />
			</c:if>
			<c:if test="${ 'WULIUY' == role }">
				<t:fieldHidden property="wuly" caption="${i18n.wuly}" defaultValue="${WULIUY}" /> 
			</c:if>
			<c:if test="${ 'WULGYY' == role }">
				<t:fieldHidden property="wlgyy" caption="${i18n.wlgyy}"  defaultValue="${WULGYY}" />
			</c:if>
			<c:if test="${ 'ZHIJIA' == role }">
				<t:fieldHidden property="zhijy" caption="${i18n.zhijy}" defaultValue="${ZHIJIA}" /> 
			</c:if>
			<c:if test="${ 'ZBCPOA' == role }">
				<t:fieldSelect property="jihy" caption="${i18n.jihy}" src="/xuqjs/getZudmByAthority.ajax?role=JIHUAY" 
 					show="VALUE" code="KEY" defaultValue="${JIHUAY}" width="150"/>
				<t:fieldSelect property="wlgyy" caption="${i18n.wlgyy}" src="/xuqjs/getZudmByAthority.ajax?role=WULGYY" 
 					show="VALUE" code="KEY" defaultValue="${WULGYY}" width="150"/>
			</c:if>
			
			<c:if test="${ 'ZXCPOA' == role }">
				<t:fieldSelect property="wuly" caption="${i18n.wuly}" src="/xuqjs/getZudmByAthority.ajax?role=WULIUY" 
					show="VALUE" code="KEY" defaultValue="${WULIUY}" width="150"/> 
				<t:fieldSelect property="zhijy" caption="${i18n.zhijy}" src="/xuqjs/getZudmByAthority.ajax?role=ZHIJIA"
					show="VALUE" code="KEY" defaultValue="${ZHIJIA}" width="150"/> 
			</c:if>
			
			<c:if test="${ 'root' == role }">
				<t:fieldSelect property="jihy" caption="${i18n.jihy}" src="/xuqjs/getZudmByAthority.ajax?role=JIHUAY" 
 					show="VALUE" code="KEY" defaultValue="${JIHUAY}" width="150"/>
				<t:fieldSelect property="wlgyy" caption="${i18n.wlgyy}" src="/xuqjs/getZudmByAthority.ajax?role=WULGYY" 
 					show="VALUE" code="KEY" defaultValue="${WULGYY}" width="150"/>
				<t:fieldSelect property="wuly" caption="${i18n.wuly}" src="/xuqjs/getZudmByAthority.ajax?role=WULIUY" 
					show="VALUE" code="KEY" defaultValue="${WULIUY}" width="150"/> 
				<t:fieldSelect property="zhijy" caption="${i18n.zhijy}" src="/xuqjs/getZudmByAthority.ajax?role=ZHIJIA"
					show="VALUE" code="KEY" defaultValue="${ZHIJIA}" width="150"/> 
			</c:if> --%>
			<t:fieldSelect property="biaos" caption="${i18n.biaos}" notNull="true" convert="biaos" width="150"/>
<%-- 			<t:fieldHidden property="biaos" caption="${i18n.biaos}" /> --%>
			<t:fieldHidden property="role"  defaultValue="${role}" />
			</t:fieldLayout>
			
	</t:form>
	<t:file action="/xuqjs/importAth_uploadCkxlingj.do" size="50">
		<t:fileparam sheet="ckxlingj" keys="USERCENTER,LINGJBH" table="{dbSchemal3}CKX_LINGJ" datasourceId="1"/>
	</t:file>
	<div><font color="red">导入结果不能大于5000条,否则为空</font></div>
</t:page>

<script type="text/javascript">

	//标识
	$.sdcui.serverConfig.convertArray['biaos'] = {
		'1' : '${i18n.youx}',
		'0' : '${i18n.wux}',
		'2' : '${i18n.xinj}'
	};
	
	
	//空格查询
	function grid_usercenter_beforeSubmit() {
		$("#lingj_lingjbh").fieldValue(trim($("#lingj_lingjbh").fieldValue()));
	}
	
	
	//失效按钮
	function func_button_del(){
		if(confirm("${i18n.quersx}")){
			var record = $("#grid_lingj").grid("getSelectedRecords");
			
			var params = [];
			params.push("usercenter="+record[0].usercenter);	//用户中心
			params.push("lingjbh="+record[0].lingjbh);	//零件编号
			params.push("biaos=0");	//标识
			
			if('0' == record[0].biaos){
				alert("${i18n.shixcg}");
				return false;
			}else if('2' == record[0].biaos){
				alert("${i18n.xinjbnsx}");
				return false;
			}else{
				 $.sdcui.ajaxUtil.ajax({
			 	 	   data:params.join('&'),
			 	 	   url:"../xuqjs/removeLingj.ajax",
			 	       success:function (result){
			 	    	  $("#grid_lingj").grid("reload");
			 	       }
			     });
			}
		}
	}
	
	
	//有效按钮
	function func_button_youx(){
		var record = $("#grid_lingj").grid("getSelectedRecords");
		
		var params = [];
		params.push("usercenter="+record[0].usercenter);	//用户中心
		params.push("lingjbh="+record[0].lingjbh);	//零件编号
		params.push("biaos=1");	//标识
		
		if('1' == record[0].biaos){//有效数据
			alert("${i18n.shujyyx}");
		}else if('2' == record[0].biaos){
			alert("${i18n.xinjbnyx}");
			return false;
		}else{
			$.sdcui.ajaxUtil.ajax({
		 	 	   data:params.join('&'),
		 	 	   url:"../xuqjs/removeLingj.ajax",
		 	       success:function (result){
		 	    	  $("#grid_lingj").grid("reload");
		 	       }
		     });
		}
		return true;
	}
	
	
	//form提交前验证
	function form_lingj_beforeSubmit() {
		var zhongwmc = trim($("#lingj_zhongwmc").fieldValue());
		if(undefined != zhongwmc && null != zhongwmc && "" !== zhongwmc){
			if (!checkCH(40, zhongwmc)) {
				alert("${i18n.zhongwmccd}");
				return false;
			}
		}
		
		//法文名称
		var fawmc = trim($("#lingj_fawmc").fieldValue());
		var s=/^[ a-zA-Z0-9]{0,40}$/g;
		if(fawmc.match(s)==null)
		{
  			alert("法文名称只能输入A-Z/a-z/0-9");
  			return false;
		}
		if(undefined != fawmc && null != fawmc && "" !== fawmc){
			if (!checkCH(40, fawmc)) {
				alert("最大输入40位长度");
				return false;
			}
		}
		
		//结束日期必须大于起始日期
		var kaisrq = trim($("#lingj_kaisrq").fieldValue());
		var jiesrq = trim($("#lingj_jiesrq").fieldValue());
		if(!compareDate(kaisrq,jiesrq)){
			alert("${i18n.ksrxyjsr}");
			return false;
		}
		
		return true;
	}
	
	
	//导出数据
	function func_button_download(){
		
		var usercenter = trim($('#record_usercenter').fieldValue());
		var lingjbh = trim($("#record_lingjbh").fieldValue());
		var lingjlx = trim($('#record_lingjlx').fieldValue());
		var lingjsx = trim($('#record_lingjsx').fieldValue());
		var guanjljjb = trim($('#record_guanjljjb').fieldValue());
		var jihy = trim($('#record_jihy').fieldValue());
		var wuly = trim($('#record_wuly').fieldValue());
		var wlgyy = trim($('#record_wlgyy').fieldValue());
		var zhijy = trim($('#record_zhijy').fieldValue());
		var biaos = $('#record_biaos').fieldValue();
		
		var record = {'usercenter':usercenter,'lingjbh':lingjbh,'lingjlx':lingjlx,'lingjsx':lingjsx,
				'guanjljjb':guanjljjb,'jihy':jihy,'wuly':wuly,'wlgyy':wlgyy,
				'zhijy':zhijy,'biaos':biaos};
		
		$.sdcui.pageUtils.goPage({
			url : '../xuqjs/downloadLingj.do',
			record : record,
			mode : 'form',
			beforeSubmit : function(){
				return true;
			}
	   });
	}
	
	
	//页面初始化
	function initPage(){
		
		//控制权限
		var currentRole = "${role}";
		
		var params = [{'name':'lingj_usercenter',	'roles':'ZXCPOA,WULGYY,ZHIJIA,WULIUY,CHACGLY,QUYGLY,YCJIHY,PZJIHY,CK_003,CK_001,CK_002,PCJIHY'},
		       		  {'name':'lingj_lingjbh',		'roles':'ZXCPOA,WULGYY,ZHIJIA,WULIUY,CHACGLY,QUYGLY,YCJIHY,PZJIHY,CK_003,CK_001,CK_002,PCJIHY'},
			       	  {'name':'lingj_zhongwmc',		'roles':'ZXCPOA,WULGYY,ZHIJIA,WULIUY,CHACGLY,QUYGLY,YCJIHY,PZJIHY,CK_003,CK_001,CK_002,PCJIHY'},
			       	  {'name':'lingj_fawmc',		'roles':'ZXCPOA,WULGYY,ZHIJIA,WULIUY,CHACGLY,QUYGLY,YCJIHY,PZJIHY,CK_003,CK_001,CK_002,PCJIHY'},
			       	  {'name':'lingj_lingjlx',		'roles':'WULGYY,ZHIJIA,WULIUY'},
			       	  {'name':'lingj_lingjsx',		'roles':'ZXCPOA,WULGYY,ZHIJIA,WULIUY,CHACGLY,QUYGLY,YCJIHY,PZJIHY,CK_003,CK_001,CK_002,PCJIHY'},
			       	  {'name':'lingj_danw',			'roles':'ZXCPOA,WULGYY,ZHIJIA,WULIUY,CHACGLY,QUYGLY,YCJIHY,PZJIHY,CK_003,CK_001,CK_002,PCJIHY'},
			       	  {'name':'lingj_zhizlx',		'roles':'ZXCPOA,WULGYY,ZHIJIA,WULIUY,CHACGLY,QUYGLY,YCJIHY,PZJIHY,CK_003,CK_001,CK_002,PCJIHY'},
			       	  {'name':'lingj_kaisrq',		'roles':'ZXCPOA,WULGYY,ZHIJIA,WULIUY,CHACGLY,QUYGLY,YCJIHY,PZJIHY,CK_003,CK_001,CK_002,PCJIHY'},
			       	  {'name':'lingj_jiesrq',		'roles':'ZXCPOA,WULGYY,ZHIJIA,WULIUY,CHACGLY,QUYGLY,YCJIHY,PZJIHY,CK_003,CK_001,CK_002,PCJIHY'},
			       	  {'name':'lingj_zhuangcxs',	'roles':'ZXCPOA,WULGYY,ZHIJIA,WULIUY,CHACGLY,QUYGLY,YCJIHY,PZJIHY,CK_003,CK_001,CK_002,PCJIHY'},
			       	  {'name':'lingj_anqm',			'roles':'JIHUAY,WULGYY'},
			       	  {'name':'lingj_lingjzl',		'roles':'ZXCPOA,WULGYY,ZHIJIA,WULIUY,CHACGLY,QUYGLY,YCJIHY,PZJIHY,CK_003,CK_001,CK_002,PCJIHY'},
			       	  {'name':'lingj_guanjljjb',	'roles':'ZXCPOA,WULGYY,ZHIJIA,WULIUY,CHACGLY,QUYGLY,YCJIHY,PZJIHY,CK_003,CK_001,CK_002,PCJIHY'},
			       	  {'name':'lingj_dinghcj',		'roles':'ZXCPOA,WULGYY,ZHIJIA,WULIUY,CHACGLY,QUYGLY,YCJIHY,PZJIHY,CK_003,CK_001,CK_002,PCJIHY'},
			       	  {'name':'lingj_gongybm',		'roles':'ZXCPOA,JIHUAY,ZHIJIA,WULIUY,CHACGLY,QUYGLY,YCJIHY,PZJIHY,CK_003,CK_001,CK_002,PCJIHY'},
			       	  {'name':'lingj_zongcldm',		'roles':'ZXCPOA,WULGYY,ZHIJIA,WULIUY,CHACGLY,QUYGLY,YCJIHY,PZJIHY,CK_003,CK_001,CK_002,PCJIHY'},
			       	  {'name':'lingj_anjmlxhd',		'roles':'ZXCPOA,WULGYY,ZHIJIA,WULIUY,CHACGLY,QUYGLY,YCJIHY,PZJIHY,CK_003,CK_001,CK_002,PCJIHY'},
			       	  {'name':'lingj_diycqysj',		'roles':'ZXCPOA,WULGYY,ZHIJIA,WULIUY,CHACGLY,QUYGLY,YCJIHY,PZJIHY,CK_003,CK_001,CK_002,PCJIHY'},
			       	  {'name':'lingj_jihy',		    'roles':'ZXCPOA,WULGYY,ZHIJIA,WULIUY,CHACGLY,QUYGLY,YCJIHY,PZJIHY,CK_003,CK_001,CK_002,PCJIHY'},
			       	{'name':'lingj_zhijy',		    'roles':'ZBCPOA,WULGYY,JIHUAY,CK_003,CK_001,CK_002,CHACGLY,QUYGLY,YCJIHY,PZJIHY,PCJIHY,WULIUY'}
		       		  ];
		setDisabled(params,currentRole);
		
	}
	
	//导出模板
	function func_button_mobxz(){
		
		$.sdcui.pageUtils.goPage({
			url : '../xuqjs/downloadCkxlingjMob.do',
			mode : 'form',
			beforeSubmit : function(){
				return true;
			}
	   });
	}
	
	
	$().ready(function(){
		var welcomePage = '<%=welcome %>';
 		if("ZXC" == welcomePage){
		$("#lingj_zhijy").click(function(){
			
			$("#field-pop-lingj_zhijy div").remove();
				var params = [];
				params.push("usercenter="+$("#lingj_usercenter").fieldValue());	//用户中心
				$.sdcui.ajaxUtil.ajax({
			 	 	   data:params.join('&'),
			 	 	   url:"../xuqjs/getZJYQX.ajax?role=ZHIJIA",
			 	       success:function (result){
			 	    	  $("#field-pop-lingj_zhijy div").remove();
			 	    	  //$("#grid_lingj").grid("reload");
			 	    	  $("#field-pop-lingj_zhijy").append("<div class='option-item zhijz' value=''></div>");
			 	    	  var list = result.result;
			 	    	  for(var i=0 ;i<list.length; i ++)
		 	    		  {
				 	    	  $("#field-pop-lingj_zhijy").append("<div class='option-item zhijz' value='"+list[i].KEY+"'>"+list[i].VALUE+"</div>");
		 	    		  }
			 	    	  
			 	    	 $(".zhijz").click(function(){
			 	    		$("#lingj_zhijy").find("input:eq(0)").removeAttr("readonly");
			 	    		$("#lingj_zhijy").find("input:eq(0)").val($(this).html());
			 	    		$("#lingj_zhijy").find("input:eq(0)").attr("readonly","1");
			 			 });
			 	    	 
			 	       }
			    });
				
		});
 		}else{
 		}
	});
	
</script>

</t:html>