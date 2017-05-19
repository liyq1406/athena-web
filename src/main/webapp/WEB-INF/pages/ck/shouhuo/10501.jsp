<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","10501");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_10501 }</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
				 var parameter = ${result.result.parameter};
			 	$('#form_user_${pageId}').form({
					fields:[
					{fieldType:'fieldText',property:'jusgzdh',caption:'${i18n.genzdh}',value:parameter.jusgzdh},
			  		{fieldType:'fieldLabel',property:'lingjbh',caption:'${i18n.lingjbh}',value:parameter.lingjbh},
			  		{fieldType:'fieldLabel',property:'lingjmc',caption:'${i18n.lingjmc}',value:parameter.lingjmc},
			  		{fieldType:'fieldLabel',property:'jusljs',caption:'${i18n.jussl}',value:parameter.jusljs},
			  		{fieldType:'fieldLabel',property:'jusyy',caption:'${i18n.jusyy}',value:parameter.jusyy},
			  		{fieldType:'fieldLabel',property:'uah',caption:'${i18n.uah}',value:parameter.uah},
			  		{fieldType:'fieldLabel',property:'bzxh',caption:'${i18n.uabzlx}',value:parameter.bzxh},
			  		{fieldType:'fieldLabel',property:'ucxh',caption:'${i18n.ucbzxh}',value:parameter.ucxh},
			  		{fieldType:'fieldLabel',property:'jusucgs',caption:'${i18n.ucgs}',value:parameter.jusucgs},
			  		{fieldType:'fieldLabel',property:'gongysdm',caption:'${i18n.gongysdm}',value:parameter.gongysdm},
			  		{fieldType:'fieldLabel',property:'gongysmc',caption:'${i18n.gongysmc}',value:parameter.gongysmc},
			  		{fieldType:'fieldLabel',property:'chengysdm',caption:'${i18n.chengysdm}',value:parameter.chengysdm},
			  		{fieldType:'fieldLabel',property:'chengysmc',caption:'${i18n.chengysmc}',value:parameter.chengysmc},
			  		{fieldType:'fieldLabel',property:'blh',caption:'${i18n.blh}',value:parameter.blh},
			  		{fieldType:'fieldLabel',property:'uth',caption:'${i18n.uth}',value:parameter.uth},
			  		{fieldType:'fieldLabel',property:'caozy',caption:'${i18n.shouhybh}',value:parameter.caozy},
			  		{fieldType:'fieldLabel',property:'caozsj',caption:'${i18n.caozsj}',value:parameter.caozsj}
					]
				}); 
			
			$(document).keyboardsupport({});
		});
		</script>
		
	</head>
	<body>
		<div style="padding:20px;">
			<div id="title"></div>
			<div id="form_user_${pageId}" class="ui-fieldLayout">
				<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>${i18n.genzdh }</td>
							<td><div class="ui-field" id="jusgzdh"></div></td>
							<td>${i18n.lingjbh }</td>
							<td><div class="ui-field" id="lingjbh"></div></td>
							<td>${i18n.lingjmc }</td>
							<td><div class="ui-field" id="lingjmc"></div></td>
						</tr>
						<tr>
							<td>${i18n.uah}</td>
							<td><div class="ui-field" id="uah"></div></td>
							<td>${i18n.uabzlx }</td>
							<td><div class="ui-field" id="bzxh"></div></td>
							<td>${i18n.ucxh }</td>
							<td><div class="ui-field" id="ucxh"></div></td>
						</tr>
						<tr>
						    <td>${i18n.ucgs }</td>
							<td><div class="ui-field" id="caozycaozy"></div></td>
							<td>${i18n.jussl}</td>
							<td><div class="ui-field" id="jusljs"></div></td>
							<td>${i18n.jusyy }</td>
							<td><div class="ui-field" id="jusyy"></div></td>
						</tr>
						<tr>
							<td>${i18n.gongysdm}</td>
							<td><div class="ui-field" id="gongysdm"></div></td>
							<td>${i18n.gongysmc }</td>
							<td><div class="ui-field" id="gongysmc"></div></td>
							<td>${i18n.chengysdm }</td>
							<td><div class="ui-field" id="chengysdm"></div></td>
						</tr>
						<tr>
							<td>${i18n.chengysmc}</td>
							<td><div class="ui-field" id="chengysmc"></div></td>
							<td>${i18n.uth }</td>
							<td><div class="ui-field" id="uth"></div></td>
							<td>${i18n.blh }</td>
							<td><div class="ui-field" id="blh"></div></td>
						</tr>
						<tr>
							<td>${i18n.shouhybh }</td>
							<td><div class="ui-field" id="caozy"></div></td>
							<td>${i18n.caozsj }</td>
							<td><div class="ui-field" id="caozsj"></div></td>
							<td></td>
							<td align='right'>
							<span id="btn_back" class="ui-button">${i18n.back }[F11]</span>
							<span id="btn_return" class="ui-button">${i18n.return }[F12]</span></td>
						</tr>
					</tbody>
				</table>
			</div>
		    <div id='prompt'>${i18n.prompt}</div>
	  </div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>