<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.kbgmszzdz}" >
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<script type="text/javascript">
		$(function(){ 

	           $('body div.layout-panel.panel-north').remove();
	
	           $('body td.td-west').remove();
	
	           $('body div.layout-panel.panel-south').remove(); 
	           
	       });
		</script>
	</head>
	<t:page  i18n="i18n.xqjs.kanbyhl.kanbjs">
	<div  class="youi-panel">
    <div class="panel-header">
        <div>${i18n.drzdyhl}</div>
    </div>
    </div>
	<form id="form_daorwj"  action="${ctx}/kanbyhl/impZdyhl.do"  target="hiddenUp" style="background-color: white;height:150px"  method="post" enctype='multipart/form-data' method="post" >
            <div   class="youi-field">
             ${i18n.drwj}：<input  type = "file"  name="file" id="file"/>
             </div>
             <div class="youi-buttons" align="right">
				
			<table>
				<tbody>
					<tr><td>
							<div class="youi-button active-0" id="button_impFrExc">
								<div class="right">
									<div class="center">
										<a href="#" onclick="return impFrExc()">${i18n.dr}</a>
									</div>
								</div>
							</div></td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>  
    <iframe name="hiddenUp" id="hiddenUp" style="display: none;"></iframe>
	</t:page>
	<script type="text/javascript">
	       
	function callback(msg)
	{
     		alert(msg);
	}
	
	
	function impFrExc() {
		var form = document.forms["form_daorwj"];
		var file = form["file"];
		var fvalue = file.value;
		if (fvalue.length > 0) {
			// 寻找表单域中的 <input type="file" ... /> 标签
			if (fvalue.lastIndexOf('xls')==-1) {
				alert("${i18n.qqddrdwjgs}");
				return false;
			}
			form.submit();
		} else {
			alert("${i18n.qxzydrdwj}");
			return false;
		}

	}
	</script>
	<style type="text/css">
	</style>
</t:html>