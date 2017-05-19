<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.mxqcxbj}" >
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<script type="text/javascript">
		     $(function(){
			    removeHidden();
			 })
		</script>
	</head>
	<t:page  i18n="i18n.xqjs.maoxq.compareMaoxqWeek">

	<t:form id="form_maoxqWeek" submit="NOT" reset="NOT">
		
	       <t:grid id="grid_compareCenterWeek"  caption="${i18n.zmxq}"    
			src="/maoxq/compareQr.ajax"  idKeys="id,xuqbc,usercenter,lingjbh,editor,edit_time"    showNum="true" remove="NOT"  edit="NOT"  add="NOT"
			usePager="true"   save="NOT"  scrollHeight="390" pageSize="20">
			   <t:button caption="${i18n.dc}" name="expxls" active="3"></t:button>
			  <t:fieldLayout id="layout" prefix="record"  columns="3">
		                  <t:fieldSelect property="usercenter"  caption="${i18n.usercenter}"  convert="queryUserCenterMap" width="150"></t:fieldSelect>
		                  <t:fieldSelect       property="jihyz"   caption="${i18n.jihyz}" width="150" convert="getJihz"></t:fieldSelect>
		                  <t:fieldText   property="lingjbh" caption="${i18n.lingjbh}"  width="150" maxLength="10"></t:fieldText>
		                  <!-- 2015-9-08 xh 11708 -->
						  <c:choose>
								<c:when test="${fn:contains(xuqbc,'DKS')}">
									<t:fieldText property="zhizlx" caption="${i18n.zhizlx}"  width="150" maxLength="3"></t:fieldText>
								</c:when>
								<c:otherwise>
									<t:fieldSelect property="zhizlx" caption="${i18n.zhizlx}" convert="queryDinghlx" width="150"></t:fieldSelect>
								</c:otherwise>
						  </c:choose>
		                  <t:fieldHidden property="xuqbc" ></t:fieldHidden>
		                  <t:fieldHidden property="xuqbc1"></t:fieldHidden>
		                  <t:fieldHidden property="xuqlx" ></t:fieldHidden>
		                  <t:fieldHidden property="xsfs"></t:fieldHidden>
		                  <t:fieldHidden property="mode"></t:fieldHidden>
			</t:fieldLayout>
				<div style=" font-size: 15px; line-height: 50px;">
				<div align="left" >P0:${kaisrq}</div>
			</div>
			<t:gridCol  property="usercenter" type="text" caption="${i18n.usercenter}"  ></t:gridCol>
			<t:gridCol  property="lingjbh"    type="text" caption="${i18n.lingjbh}" ></t:gridCol>
			<t:gridCol  property="lingjmc"    type="text" caption="${i18n.lingjmc}"   ></t:gridCol>
			<t:gridCol  property="danw"       type="text" caption="${i18n.danw}"   ></t:gridCol>
			<t:gridCol  property="jihyz"      type="text" caption="${i18n.jihyz}"   ></t:gridCol>
			<t:gridCol  property="zhizlx"     type="text" caption="${i18n.zhizlx}"   ></t:gridCol>
			<t:gridCol  property="s0Week1"    type="text" caption="S0"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s0Week2"    type="text" caption="S0"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s0Margin"    type="text" caption="S0${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s1Week1"    type="text" caption="S1"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s1Week2"    type="text" caption="S1"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s1Margin"    type="text" caption="S1${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s2Week1"    type="text" caption="S2"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s2Week2"    type="text" caption="S2"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s2Margin"    type="text" caption="S2${i18n.ce}"  renderer="merginCss"></t:gridCol>			
			<t:gridCol  property="s3Week1"    type="text" caption="S3"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s3Week2"    type="text" caption="S3"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s3Margin"    type="text" caption="S3${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s4Week1"    type="text" caption="S4"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s4Week2"    type="text" caption="S4"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s4Margin"    type="text" caption="S4${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s5Week1"    type="text" caption="S5"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s5Week2"    type="text" caption="S5"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s5Margin"    type="text" caption="S5${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s6Week1"    type="text" caption="S6"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s6Week2"    type="text" caption="S6"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s6Margin"    type="text" caption="S6${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s7Week1"    type="text" caption="S7"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s7Week2"    type="text" caption="S7"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s7Week1"    type="text" caption="S7${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s8Week1"    type="text" caption="S8"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s8Week2"    type="text" caption="S8"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s8Margin"    type="text" caption="S8${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s9Week1"    type="text" caption="S9"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s9Week2"    type="text" caption="S9"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s9Margin"    type="text" caption="S9${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s10Week1"    type="text" caption="S10"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s10Week2"    type="text" caption="S10"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s10Margin"    type="text" caption="S10${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s11Week1"    type="text" caption="S11"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s11Week2"    type="text" caption="S11"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s11Margin"    type="text" caption="S11${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s12Week1"    type="text" caption="S12"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s12Week2"    type="text" caption="S12"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s12Margin"    type="text" caption="S12${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s13Week1"    type="text" caption="S13"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s13Week2"    type="text" caption="S13"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s13Margin"    type="text" caption="S13${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s14Week1"    type="text" caption="S14"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s14Week2"    type="text" caption="S14"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s14Margin"    type="text" caption="S14${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s15Week1"    type="text" caption="S15"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s15Week2"    type="text" caption="S15"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s15Margin"    type="text" caption="S15${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s16Week1"    type="text" caption="S16"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s16Week2"    type="text" caption="S16"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s16Margin"    type="text" caption="S16${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s17Week1"    type="text" caption="S17"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s17Week2"    type="text" caption="S17"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s17Margin"    type="text" caption="S17${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s18Week1"    type="text" caption="S18"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s18Week2"    type="text" caption="S18"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s18Margin"    type="text" caption="S18${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s19Week1"    type="text" caption="S19"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s19Week2"    type="text" caption="S19"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s19Margin"    type="text" caption="S19${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s20Week1"    type="text" caption="S20"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s20Week2"    type="text" caption="S20"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s20Margin"    type="text" caption="S20${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s21Week1"    type="text" caption="S21"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s21Week2"    type="text" caption="S21"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s21Margin"    type="text" caption="S21${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s22Week1"    type="text" caption="S22"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s22Week2"    type="text" caption="S22"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s22Margin"    type="text" caption="S22${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s23Week1"    type="text" caption="S23"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s23Week2"    type="text" caption="S23"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s23Margin"    type="text" caption="S23${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s24Week1"    type="text" caption="S24"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s24Week2"    type="text" caption="S24"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s24Margin"    type="text" caption="S24${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s25Week1"    type="text" caption="S25"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s25Week2"    type="text" caption="S25"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s25Margin"    type="text" caption="S25${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s26Week1"    type="text" caption="S26"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s26Week2"    type="text" caption="S26"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s26Margin"    type="text" caption="S26${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s27Week1"    type="text" caption="S27"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s27Week2"    type="text" caption="S27"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s27Margin"    type="text" caption="S27${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s28Week1"    type="text" caption="S28"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s28Week2"    type="text" caption="S28"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s28Margin"    type="text" caption="S28${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s29Week1"    type="text" caption="S29"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s29Week2"    type="text" caption="S29"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s29Margin"    type="text" caption="S29${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s30Week1"    type="text" caption="S30"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s30Week2"    type="text" caption="S30"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s30Margin"    type="text" caption="S30${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s31Week1"    type="text" caption="S31"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s31Week2"    type="text" caption="S31"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s31Margin"    type="text" caption="S31${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s32Week1"    type="text" caption="S32"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s32Week2"    type="text" caption="S32"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s32Margin"    type="text" caption="S32${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s33Week1"    type="text" caption="S33"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s33Week2"    type="text" caption="S33"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s33Margin"    type="text" caption="S33${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s34Week1"    type="text" caption="S34"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s34Week2"    type="text" caption="S34"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s34Margin"    type="text" caption="S34${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s35Week1"    type="text" caption="S35"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s35Week2"    type="text" caption="S35"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s35Margin"    type="text" caption="S35${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s36Week1"    type="text" caption="S36"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s36Week2"    type="text" caption="S36"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s36Margin"    type="text" caption="S36${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s37Week1"    type="text" caption="S37"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s37Week2"    type="text" caption="S37"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s37Margin"    type="text" caption="S37${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s38Week1"    type="text" caption="S38"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s38Week2"    type="text" caption="S38"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s38Margin"    type="text" caption="S38${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s39Week1"    type="text" caption="S39"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s39Week2"    type="text" caption="S39"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s39Margin"    type="text" caption="S39${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s40Week1"    type="text" caption="S40"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s40Week2"    type="text" caption="S40"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s40Margin"    type="text" caption="S40${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s41Week1"    type="text" caption="S41"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s41Week2"    type="text" caption="S41"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s41Margin"    type="text" caption="S41${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s42Week1"    type="text" caption="S42"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s42Week2"    type="text" caption="S42"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s42Margin"    type="text" caption="S42${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s43Week1"    type="text" caption="S43"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s43Week2"    type="text" caption="S43"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s43Margin"    type="text" caption="S43${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s44Week1"    type="text" caption="S44"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s44Week2"    type="text" caption="S44"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s44Margin"    type="text" caption="S44${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s45Week1"    type="text" caption="S45"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s45Week2"    type="text" caption="S45"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s45Margin"    type="text" caption="S45${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s46Week1"    type="text" caption="S46"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s46Week2"    type="text" caption="S46"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s46Margin"    type="text" caption="S46${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s47Week1"    type="text" caption="S47"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s47Week2"    type="text" caption="S47"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s47Margin"    type="text" caption="S47${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s48Week1"    type="text" caption="S48"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s48Week2"    type="text" caption="S48"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s48Margin"    type="text" caption="S48${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s49Week1"    type="text" caption="S49"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s49Week2"    type="text" caption="S49"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s49Margin"    type="text" caption="S49${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s50Week1"    type="text" caption="S50"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s50Week2"    type="text" caption="S50"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s50Margin"    type="text" caption="S50${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s51Week1"    type="text" caption="S51"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s51Week2"    type="text" caption="S51"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s51Margin"    type="text" caption="S51${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s52Week1"    type="text" caption="S52"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s52Week2"    type="text" caption="S52"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s52Margin"    type="text" caption="S52${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s53Week1"    type="text" caption="S53"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s53Week2"    type="text" caption="S53"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s53Margin"    type="text" caption="S53${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s54Week1"    type="text" caption="S54"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s54Week2"    type="text" caption="S54"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s54Margin"    type="text" caption="S54${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s55Week1"    type="text" caption="S55"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s55Week2"    type="text" caption="S55"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s55Margin"    type="text" caption="S55${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s56Week1"    type="text" caption="S56"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s56Week2"    type="text" caption="S56"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s56Margin"    type="text" caption="S56${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s57Week1"    type="text" caption="S57"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s57Week2"    type="text" caption="S57"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s57Margin"    type="text" caption="S57${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s58Week1"    type="text" caption="S58"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s58Week2"    type="text" caption="S58"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s58Margin"    type="text" caption="S58${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s59Week1"    type="text" caption="S59"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s59Week2"    type="text" caption="S59"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s59Margin"    type="text" caption="S59${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s60Week1"    type="text" caption="S60"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s60Week2"    type="text" caption="S60"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s60Margin"    type="text" caption="S60${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s61Week1"   type="text" caption="S61"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s61Week2"   type="text" caption="S61"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s61Margin"  type="text" caption="S61${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s62Week1"   type="text" caption="S62"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s62Week2"   type="text" caption="S62"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s62Margin"  type="text" caption="S62${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s63Week1"   type="text" caption="S63"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s63Week2"   type="text" caption="S63"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s63Margin"  type="text" caption="S63${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s64Week1"   type="text" caption="S64"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s64Week2"   type="text" caption="S64"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property="s64Margin"  type="text" caption="S64${i18n.ce}"  renderer="merginCss"></t:gridCol>
			<t:gridCol  property=""   caption=""  ></t:gridCol>
			</t:grid>

	</t:form>
    <input id="removeId" value="${removeId}" type="hidden"/>  
	</t:page>
	<script type="text/javascript">
		 $.sdcui.serverConfig.convertArray['lxkd'] = {
		'97X' : '97X',
		'97D' : '97D'
	};
	$(function() {
		var xqbc = $("#record_xuqbc").fieldValue();
		/*if(xqbc.indexOf("DKS")==-1){
		   $("#fieldSelect-record_zhizlx").parent('td:first').remove();
		   $("#fieldSelect-record_zhizlx").remove();
		   $("#record_zhizlx").parent('td:first').remove();
		   $("#record_zhizlx").remove();
		}*/
	})
	
	function merginCss(col,value,  rowIndex,colIndex){
	        var obj = this;
	        var property = this.property;
	        var margin;
	        if(property.indexOf("Margin")!=-1){
	           margin = value[property];
	        }else{
	           var att = property.substring(0, property.indexOf('W'))+"Margin";
	           margin = value[att];
	        }
	        
	        var showValue = value[property];
	        if(margin!=""){
	            var index = margin.indexOf("%");
	            var bfb = margin.substring(0,index);
	            if(bfb>0||bfb<0){
	               return "<span style=\"color: red;\">"+showValue+"</span>";
	            }
	        }
	        return "<span >"+showValue+"</span>";
	}
	//返回
	/*	function func_button_back() {
			history.back();
			//window.history.go(-1);
			//window.history.forward();

		} */

			function func_grid_expxls(){
			    var red = $("#grid_compareCenterWeek").grid("getRecords");
		        if(red.length==0){
		           alert("${i18n.dcdatanotnull}");
		            return false;
		        }
				var usercenter = $('#record_usercenter').fieldValue();
				var jihyz =  $('#record_jihyz').fieldValue();
				var lingjbh = $('#record_lingjbh').fieldValue();
				var xuqbc = $('#record_xuqbc').fieldValue();
				var xuqbc1 = $('#record_xuqbc1').fieldValue();
				var xuqlx = $('#record_xuqlx').fieldValue(); 
				var zhizlx="";
				if(xuqbc.indexOf("DKS")!=-1){
					zhizlx = $('#record_zhizlx').fieldValue(); 
				}
				var xsfs = $('#record_xsfs').fieldValue(); 
				var mode = $('#record_mode').fieldValue(); 
				$.sdcui.pageUtils.goPage({
					url:'/maoxq/downLoadFileCompare.do?usercenter='+usercenter+'&jihyz='+jihyz+'&lingjbh='+lingjbh+'&xuqbc='+xuqbc+'&xuqbc1='+xuqbc1+'&xuqlx='+xuqlx+'&xsfs='+xsfs+'&mode='+mode+'&zhizlx='+zhizlx,//url
					mode:'form',
					beforeSubmit:function(){
						//
						return true;
					}
				});
			}
	</script>
	<style type="text/css">
	
	</style>
</t:html>