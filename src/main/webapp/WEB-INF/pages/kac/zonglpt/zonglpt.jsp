<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.xiehzt}">

<!-- 
	  叉车-车位
	 @author liushuang
	 @date 2015-1-20
 -->

<head >
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<META HTTP-EQUIV="Refresh" content="60">
</head>
<style type="text/css">
  .youi-fieldLayout table td.contral.label-col { width: 100px; }
</style>

<t:page i18n="总览平台">
<%--  <t:grid id="grid_zonglpt" caption="总览平台" back="NOT"   remove="NOT" reset="NOT" editable="false"  edit="NOT" showNum="true"  add="NOT" submit="NOT" scrollHeight="150" load="false" > --%>
<!-- 			<table width="100%"> -->
<!-- 				<tr bgcolor="grey"> -->
<!-- 					<td width="10%" align="left" bgcolor="#999999">区域名称</td> -->
<!-- 					<td width="25%" align="left" bgcolor="#999999">申报卡车</td> -->
<!-- 					<td width="25%" align="left" bgcolor="#999999">排队卡车</td> -->
<!-- 					<td width="25%" align="left" bgcolor="#999999">分配卡车</td> -->
<!-- 				</tr> -->
<%-- 			<c:forEach var="qy" items="${zonglpt}" varStatus="quys"> --%>
<!-- 				<tr> -->
<%-- 					<td align="left">${qy.quymc }</td> --%>
<%-- 					<td align="left">${qy.shenbkc }</td> --%>
<%-- 					<td align="left">${qy.paidkc}</td> --%>
<%-- 					<td align="left">${qy.fenpkc }</td> --%>
<!-- 				</tr> -->
<%-- 			</c:forEach> --%>
<!-- 			</table> -->
	 <c:forEach var="qy" items="${zonglpt}" varStatus="quys">
		<t:grid id="grid_zonglpt" scrollHeight="150" caption="${qy.quymc}"   src="/kac/queryZonglpt.ajax"  add="NOT" edit="NOT" submit="NOT" reset="NOT" save="NOT" back="NOT"  afterSaveRowsEvent="afterSaveRows"
		editable="false" remove="NOT" load="false"  showNum="true">
		<table width="100%">
				<tr bgcolor="grey">
					<td width="80" align="center" bgcolor="#999999">大站台</td>
					<td width="80" align="center" bgcolor="#999999">申报</td>
					<td width="80" align="center" bgcolor="#999999">排队</td>
					<td width="40" align="center" bgcolor="#999999"></td>
					<td width="40" align="center" bgcolor="#999999"></td>
					<td width="40" align="center" bgcolor="#999999"></td>
					<td width="40" align="center" bgcolor="#999999"></td>
					<td width="40" align="center" bgcolor="#999999"></td>
					<td width="40" align="center" bgcolor="#999999"></td>
					<td width="40" align="center" bgcolor="#999999"></td>
					<td width="40" align="center" bgcolor="#999999"></td>
					<td width="40" align="center" bgcolor="#999999"></td>
					<td width="40" align="center" bgcolor="#999999"></td>
					<td width="40" align="center" bgcolor="#999999"></td>
					<td width="40" align="center" bgcolor="#999999"></td>
					<td width="40" align="center" bgcolor="#999999"></td>
					<td width="40" align="center" bgcolor="#999999"></td>
					<td width="40" align="center" bgcolor="#999999"></td>
					<td width="80" align="center" bgcolor="#999999">急件</td>
					<td width="80" align="left" bgcolor="#999999">放空未出厂</td>
				</tr>
			<c:forEach var="pt" items="${qy.zonglptmx}" varStatus="pts">
				<tr>
					<td align="center" bgcolor="#FFFFFF">${pt.dazt}</td>
					<td align="center" bgcolor="#FFFFFF">${pt.shenbkcs }</td>
					<td align="center" bgcolor="#FFFFFF">${pt.paidkcs}</td>
					<c:choose> 
						<c:when test="${ '0' == pt.chewzt0}">
							<td width="40" align="center" style="background-color:green;">${pt.chew0}</td>
						</c:when>
						<c:when test="${ '1' == pt.chewzt0}">
							<td width="40" align="center" style="background-color:red;"><a href="${ctx}/kac/kacpd.do?removeId=layout-north,layout-west,layout-south&quybh=${qy.quybh}&daztbh=${pt.dazt}&chewbh=${pt.chew0}">${pt.chew0}</a></td>
						</c:when>
						<c:otherwise>
							<td width="40" align="center">${pt.chew0}</td>
						</c:otherwise>
					</c:choose>
					<c:choose> 
						<c:when test="${ '0' == pt.chewzt1}">
							<td width="40" align="center" style="background-color:green;">${pt.chew1}</td>
						</c:when>
						<c:when test="${ '1' == pt.chewzt1}">
							<td width="40" align="center" style="background-color:red;"><a href="${ctx}/kac/kacpd.do?removeId=layout-north,layout-west,layout-south&quybh=${qy.quybh}&daztbh=${pt.dazt}&chewbh=${pt.chew1}">${pt.chew1}</a></td>
						</c:when>
						<c:otherwise>
							<td width="40" align="center">${pt.chew1}</td>
						</c:otherwise>
					</c:choose>
					<c:choose> 
						<c:when test="${ '0' == pt.chewzt2}">
							<td width="40" align="center" style="background-color:green;">${pt.chew2}</td>
						</c:when>
						<c:when test="${ '1' == pt.chewzt2}">
							<td width="40" align="center" style="background-color:red;"><a href="${ctx}/kac/kacpd.do?removeId=layout-north,layout-west,layout-south&quybh=${qy.quybh}&daztbh=${pt.dazt}&chewbh=${pt.chew2}">${pt.chew2}</a></td>
						</c:when>
						<c:otherwise>
							<td width="40" align="center">${pt.chew2}</td>
						</c:otherwise>
					</c:choose>
					<c:choose> 
						<c:when test="${ '0' == pt.chewzt3}">
							<td width="40" align="center" style="background-color:green;">${pt.chew3}</td>
						</c:when>
						<c:when test="${ '1' == pt.chewzt3}">
							<td width="40" align="center" style="background-color:red;"><a href="${ctx}/kac/kacpd.do?removeId=layout-north,layout-west,layout-south&quybh=${qy.quybh}&daztbh=${pt.dazt}&chewbh=${pt.chew3}">${pt.chew3}</a></td>
						</c:when>
						<c:otherwise>
							<td width="40" align="center">${pt.chew3}</td>
						</c:otherwise>
					</c:choose>
					<c:choose> 
						<c:when test="${ '0' == pt.chewzt4}">
							<td width="40" align="center" style="background-color:green;">${pt.chew4}</td>
						</c:when>
						<c:when test="${ '1' == pt.chewzt4}">
							<td width="40" align="center" style="background-color:red;"><a href="${ctx}/kac/kacpd.do?removeId=layout-north,layout-west,layout-south&quybh=${qy.quybh}&daztbh=${pt.dazt}&chewbh=${pt.chew4}">${pt.chew4}</a></td>
						</c:when>
						<c:otherwise>
							<td width="40" align="center">${pt.chew4}</td>
						</c:otherwise>
					</c:choose>
					<c:choose> 
						<c:when test="${ '0' == pt.chewzt5}">
							<td width="40" align="center" style="background-color:green;">${pt.chew5}</td>
						</c:when>
						<c:when test="${ '1' == pt.chewzt5}">
							<td width="40" align="center" style="background-color:red;"><a href="${ctx}/kac/kacpd.do?removeId=layout-north,layout-west,layout-south&quybh=${qy.quybh}&daztbh=${pt.dazt}&chewbh=${pt.chew5}">${pt.chew5}</a></td>
						</c:when>
						<c:otherwise>
							<td width="40" align="center">${pt.chew5}</td>
						</c:otherwise>
					</c:choose>
					<c:choose> 
						<c:when test="${ '0' == pt.chewzt6}">
							<td width="40" align="center" style="background-color:green;">${pt.chew6}</td>
						</c:when>
						<c:when test="${ '1' == pt.chewzt6}">
							<td width="40" align="center" style="background-color:red;"><a href="${ctx}/kac/kacpd.do?removeId=layout-north,layout-west,layout-south&quybh=${qy.quybh}&daztbh=${pt.dazt}&chewbh=${pt.chew6}">${pt.chew6}</a></td>
						</c:when>
						<c:otherwise>
							<td width="40" align="center">${pt.chew6}</td>
						</c:otherwise>
					</c:choose>
					<c:choose> 
						<c:when test="${ '0' == pt.chewzt7}">
							<td width="40" align="center" style="background-color:green;">${pt.chew7}</td>
						</c:when>
						<c:when test="${ '1' == pt.chewzt7}">
							<td width="40" align="center" style="background-color:red;"><a href="${ctx}/kac/kacpd.do?removeId=layout-north,layout-west,layout-south&quybh=${qy.quybh}&daztbh=${pt.dazt}&chewbh=${pt.chew7}">${pt.chew7}</a></td>
						</c:when>
						<c:otherwise>
							<td width="40" align="center">${pt.chew7}</td>
						</c:otherwise>
					</c:choose>
					<c:choose> 
						<c:when test="${ '0' == pt.chewzt8}">
							<td width="40" align="center" style="background-color:green;">${pt.chew8}</td>
						</c:when>
						<c:when test="${ '1' == pt.chewzt8}">
							<td width="40" align="center" style="background-color:red;"><a href="${ctx}/kac/kacpd.do?removeId=layout-north,layout-west,layout-south&quybh=${qy.quybh}&daztbh=${pt.dazt}&chewbh=${pt.chew8}">${pt.chew8}</a></td>
						</c:when>
						<c:otherwise>
							<td width="40" align="center">${pt.chew8}</td>
						</c:otherwise>
					</c:choose>
					<c:choose> 
						<c:when test="${ '0' == pt.chewzt9}">
							<td width="40" align="center" style="background-color:green;">${pt.chew9}</td>
						</c:when>
						<c:when test="${ '1' == pt.chewzt9}">
							<td width="40" align="center" style="background-color:red;"><a href="${ctx}/kac/kacpd.do?removeId=layout-north,layout-west,layout-south&quybh=${qy.quybh}&daztbh=${pt.dazt}&chewbh=${pt.chew9}">${pt.chew9}</a></td>
						</c:when>
						<c:otherwise>
							<td width="40" align="center">${pt.chew9}</td>
						</c:otherwise>
					</c:choose>
					<c:choose> 
						<c:when test="${ '0' == pt.chewzt10}">
							<td width="40" align="center" style="background-color:green;">${pt.chew10}</td>
						</c:when>
						<c:when test="${ '1' == pt.chewzt10}">
							<td width="40" align="center" style="background-color:red;"><a href="${ctx}/kac/kacpd.do?removeId=layout-north,layout-west,layout-south&quybh=${qy.quybh}&daztbh=${pt.dazt}&chewbh=${pt.chew10}">${pt.chew10}</a></td>
						</c:when>
						<c:otherwise>
							<td width="40" align="center">${pt.chew10}</td>
						</c:otherwise>
					</c:choose>
					<c:choose> 
						<c:when test="${ '0' == pt.chewzt11}">
							<td width="40" align="center" style="background-color:green;">${pt.chew11}</td>
						</c:when>
						<c:when test="${ '1' == pt.chewzt11}">
							<td width="40" align="center" style="background-color:red;"><a href="${ctx}/kac/kacpd.do?removeId=layout-north,layout-west,layout-south&quybh=${qy.quybh}&daztbh=${pt.dazt}&chewbh=${pt.chew11}">${pt.chew11}</a></td>
						</c:when>
						<c:otherwise>
							<td width="40" align="center">${pt.chew11}</td>
						</c:otherwise>
					</c:choose>
					<c:choose> 
						<c:when test="${ '0' == pt.chewzt12}">
							<td width="40" align="center" style="background-color:green;">${pt.chew12}</td>
						</c:when>
						<c:when test="${ '1' == pt.chewzt12}">
							<td width="40" align="center" style="background-color:red;"><a href="${ctx}/kac/kacpd.do?removeId=layout-north,layout-west,layout-south&quybh=${qy.quybh}&daztbh=${pt.dazt}&chewbh=${pt.chew12}">${pt.chew12}</a></td>
						</c:when>
						<c:otherwise>
							<td width="40" align="center">${pt.chew12}</td>
						</c:otherwise>
					</c:choose>
					<c:choose> 
						<c:when test="${ '0' == pt.chewzt13}">
							<td width="40" align="center" style="background-color:green;">${pt.chew13}</td>
						</c:when>
						<c:when test="${ '1' == pt.chewzt13}">
							<td width="40" align="center" style="background-color:red;"><a href="${ctx}/kac/kacpd.do?removeId=layout-north,layout-west,layout-south&quybh=${qy.quybh}&daztbh=${pt.dazt}&chewbh=${pt.chew13}">${pt.chew13}</a></td>
						</c:when>
						<c:otherwise>
							<td width="40" align="center">${pt.chew13}</td>
						</c:otherwise>
					</c:choose>
					<c:choose> 
						<c:when test="${ '0' == pt.chewzt14}">
							<td width="40" align="center" style="background-color:green;">${pt.chew14}</td>
						</c:when>
						<c:when test="${ '1' == pt.chewzt14}">
							<td width="40" align="center" style="background-color:red;"><a href="${ctx}/kac/kacpd.do?removeId=layout-north,layout-west,layout-south&quybh=${qy.quybh}&daztbh=${pt.dazt}&chewbh=${pt.chew14}">${pt.chew14}</a></td>
						</c:when>
						<c:otherwise>
							<td width="40" align="center">${pt.chew14}</td>
						</c:otherwise>
					</c:choose>
					<td align="center" bgcolor="#FFFFFF">${pt.jingjkcs}</td>
					<td align="center" bgcolor="#FFFFFF">${pt.fangkkcs }</td>
				</tr>
			</c:forEach>
<%-- 		<c:forEach var="pt" items="${qy.zonglptmx}" varStatus="pts"> --%>
<%-- 			<p>${pt.dazt}大站台有 <a href="#" class="sbkc"><font color="red">${pt.shenbkcs}</font></a> 辆卡车申报,其中已排队的卡车有  <a href="#" class="pdkc"><font color="red">${pt.paidkcs}</font></a> 辆,已分配车位卡车  <a href="#" class="fpkc"><font color="red">${pt.fenpkcs}</font></a> 辆</p> --%>
<%-- 		</c:forEach> --%>
		</table>
		</t:grid>
	</c:forEach>
<%-- </t:grid> --%>
<div id="redWarm" style="color:red;">
<p>说明： (1) 红色为有效的占用车位      (2) 绿色为有效的空闲车位</p>
</div>
</t:page>

<script type="text/javascript">
	$(document).ready(function(){
			$("#grid_zonglpt").grid('reload');
	});
	
	
	//function sbkcs(v){
		//点击后 去后台查询对应的区域编号  和 大站台编号 赋值给下面跳转页面
// 		alert($(this).attr("id"));
// 		var s =$(this).parent().html();
// 		s = $.trim(s);
// 		s = s.substring(0,s.indexOf("大"));
// 		alert(s);
// 		var params = [];
// 		params.push("usercenter="+record[0].usercenter);	
// 		params.push("daztbh="+${pt.dazt});		
// 		$.sdcui.ajaxUtil.ajax({
// 			 	 	   url:"../kac/selectquybh.ajax",
// 			 	 	   data:params.join('&'),
// 			 	       success:function (result){
// 			 	    	  alert(result.result)
// 			     	});
		
// 		$.sdcui.pageUtils.goPage({
// 			url:'/kac/kacpd.do',//url
// 			record : {'quybh':10086,'daztbh':10010},
// 			mode:'form',
// 			beforeSubmit:function(){
// 				return true;
// 			}
// 		});
	//}
	
	
</script>




</t:html>