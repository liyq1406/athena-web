<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="DFPV流水帐审核" >
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	</head>
	
<t:page i18n="">
	<t:grid id="grid_dfpvlszsh" 
		caption="DFPV流水帐审核" 
		src="/xuqjs/queryDfpvlszsh.ajax"
		idKeys="usercenter,pingzh,pingzxmh"  
		load="false" 
		back="NOT"
		showNum="true"
		scrollHeight="300" 
		pageSize="15"
		showCheckbox="true"				
		>
		<t:fieldLayout id="dfpvlszsh" prefix="layout" columns="2">
			<t:fieldSelect property="usercenter" caption="用户中心" defaultValue="${loginUsercenter}" convert="queryUserCenterMap"  width="150"/>
			<t:fieldText property="pingzh" caption="凭证号" width="150" dataType="text" maxLength="12"/>
			<t:fieldText property="lingjbh" caption="零件编号" width="150" dataType="text" maxLength="10"/>
			<t:fieldText property="caozm" caption="操作码" width="150" dataType="text" maxLength="10"/>
			<t:fieldCalendar property="edit_time_from" caption="审核时间" width="150" format="yyyy-MM-dd HH:mm:ss"></t:fieldCalendar>
			<t:fieldCalendar property="edit_time_to"   caption="至" width="150" format="yyyy-MM-dd HH:mm:ss"></t:fieldCalendar>
			<t:fieldText property="blh" caption="BL号" width="150" dataType="text" maxLength="10"/>
			<t:fieldSelect property="zhuangt" caption="状态" notNull="true" convert="zhuangt" defaultValue="0" width="150"/>
		</t:fieldLayout>
<t:buttons id="shenh">
			<t:button caption="审核" name="shenh" active="0"/>
</t:buttons>
		
		<t:gridCol property="usercenter" caption="用户中心" convert="queryUserCenterMap" defaultValue="${usercenter}"/>
		<t:gridCol property="pingzh" caption="凭证号"/>
		<t:gridCol property="pingzxmh" caption="凭证序号"/>
		<t:gridCol property="caozm" caption="操作码"/>
		<t:gridCol property="blh" caption="BL号"/>
		<t:gridCol property="cangkzck" caption="仓库子仓库"/>
		<t:gridCol property="lingjbh" caption="零件编号"/>
		<t:gridCol property="lingjsl" caption="数量"/>
		<t:gridCol property="liusqs" caption="起始流水号"/>
		<t:gridCol property="liusjz" caption="截止流水号"/>
		<t:gridCol property="zherzt" caption="责任主体代码"/>
		<t:gridCol property="zherztmc" caption="责任主体名称"/>
		<t:gridCol property="yicxhlx" caption="废损类型"/>
		<t:gridCol property="caozy" caption="操作员"/>
		<t:gridCol property="oper_time" caption="操作时间"/>
		<t:gridCol property="creator" caption="创建人"/>
		<t:gridCol property="create_time" caption="创建时间"/>
		<t:gridCol property="editor" caption="编辑人"/>
		<t:gridCol property="edit_time" caption="编辑时间"/>
		<t:gridCol property="zhuangt" caption="状态" convert="zhuangt" defaultValue="0"/>

	</t:grid>

</t:page>



<script type="text/javascript"> 

function grid_dfpvlszsh_beforeSubmit() {
		if($("#layout_edit_time_from").fieldValue()!="" && $("#layout_edit_time_to").fieldValue() != ""){
		}else if($("#layout_edit_time_from").fieldValue()=="" && $("#layout_edit_time_to").fieldValue() == ""){
		}
		else{
			alert("若根据时间筛选，请将时间段填写完整。");
			return false;
		}
		return true;
	}
	
	
		$.sdcui.serverConfig.convertArray['zhuangt'] = {
		'0' : '未审核',
		'1' : '已审核'
	};
	
	function func_button_shenh()
	{
		if(confirm('确认审核'))
		{
			
			var params = $('#grid_dfpvlszsh').grid("getSelectedRecords");
			if(params.length == 0){
		           alert('请至少选择一条！');
		           return false;
		        }
			var record = [];
			 for(var i=0;i<params.length;i++){
			record.push("edit["+i+"].usercenter="+params[i].usercenter);
			record.push("edit["+i+"].pingzh="+params[i].pingzh);
			record.push("edit["+i+"].pingzxmh="+params[i].pingzxmh);
			record.push("edit["+i+"].caozm="+params[i].caozm);
			record.push("edit["+i+"].cangkzck="+params[i].cangkzck);
			record.push("edit["+i+"].blh="+params[i].blh);
			if(params[i].zhuangt == "1"){
				alert("已审核！无法重复审核");
				return false;
			}
			}
			
			
			 $.sdcui.ajaxUtil.ajax({
			 	  url:"${ctx}/xuqjs/updateShenh.ajax",
			 	  data: record.join('&'),
                  success:function (result)
                  {
                	 alert(result.result);
                	 //刷新当前页面
        			 $('#grid_dfpvlszsh').grid('reload');
                  }
            });
			
		}
	}
</script>
</t:html>