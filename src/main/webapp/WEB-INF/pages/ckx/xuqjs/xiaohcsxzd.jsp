<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.xiaohc}-${i18n.xiaohcsxzd}">

<!-- 
	  小火车上线指导
	 @author hanwu
	 @date 2016-1-14
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
</head>

<t:page i18n="i18n.ckx.xuqjs.i18n_xiaohcsxzd">
	<t:grid id="grid_xiaohc" caption="${i18n.daixzlb}" idKeys="usercenter,shengcxbh,xiaohcbh" dataFormId="form_xiaohc" remove="NOT" scrollHeight="120" pageSize="10" back="NOT"
		src="/xiaohc/queryXiaohc.ajax" load="false" add="NOT" edit="NOT" showNum="true" showCheckbox="true">
		<t:fieldLayout prefix="record_xiaohc" columns="3">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" defaultValue="${usercenter}" convert="queryUserCenterMap" width="150"/>
			<t:fieldText property="shengcxbh" caption="${i18n.shengcxbh}" dataType="text" maxLength="5" minLength="5" width="150"/>
			<t:fieldText property="xiaohcbh" caption="${i18n.xiaohcbh}" dataType="text" maxLength="5" width="150"/>
		</t:fieldLayout>
		
		<t:button caption="${i18n.xuanz}" name="choose" />
		
		<t:gridCol property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap"/>
		<t:gridCol property="shengcxbh" caption="${i18n.shengcxbh}"/>
		<t:gridCol property="xiaohcbh" caption="${i18n.xiaohcbh}" width="120"/>
		<t:gridCol property="xiaohcmc" caption="${i18n.xiaohcmc}" width="120"/>
		<t:gridCol property="pianycws" caption="${i18n.pianycws}" width="120" />
		<t:gridCol property="xunhcss" caption="${i18n.xunhcss}" width="120" />
		<t:gridCol property="beihtqcss" caption="${i18n.beihtqcss}" hidden="true" width="0"/>
		<t:gridCol property="shangxtqcss" caption="${i18n.shangxtqcss}" hidden="true" width="0"/>
		<t:gridCol property="" caption=""/>
	</t:grid>
	<br/>			
	<t:grid id="grid_xiaohc_choosed" caption="${i18n.yixzlb}" idKeys="usercenter,shengcxbh,xiaohcbh" submit="NOT" reset="NOT" back="NOT"
		load="false" src="/xiaohc/queryXiaohccx.ajax" add="NOT" edit="NOT" remove="NOT" showNum="true" scrollHeight="120" pageSize="10"  showCheckbox="true">
		<t:gridCol property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap"/>
		<t:gridCol property="shengcxbh" caption="${i18n.shengcxbh}"/>
		<t:gridCol property="xiaohcbh" caption="${i18n.xiaohcbh}" width="120"/>
		<t:gridCol property="xiaohcmc" caption="${i18n.xiaohcmc}" width="120"/>
		<t:gridCol property="pianycws" caption="${i18n.pianycws}" width="120" />
		<t:gridCol property="xunhcss" caption="${i18n.xunhcss}" width="120" />
		<t:gridCol property="beihtqcss" caption="${i18n.beihtqcss}" hidden="true" width="0"/>
		<t:gridCol property="shangxtqcss" caption="${i18n.shangxtqcss}" hidden="true" width="0"/>
		<t:gridCol property="" caption=""/>
	</t:grid>
	<br/>
	<t:fieldLayout prefix="xiaohc" columns="3">
        <t:fieldText property="ahead" notNull="true" defaultValue="5" caption="${i18n.tiql}" maxLength="5"/>
    </t:fieldLayout>
    <t:buttons id="btn">
        <t:button caption="${i18n.shanc}" name="remove" />
        <t:button caption="${i18n.jiank}" name="observe" />
    </t:buttons>

</t:page>

<script type="text/javascript">
	
	//空格查询
	function grid_xiaohc_beforeSubmit() {
		$("#record_xiaohc_xiaohcbh").fieldValue(trim($("#record_xiaohc_xiaohcbh").fieldValue()));
		$("#record_xiaohc_shengcxbh").fieldValue(trim($("#record_xiaohc_shengcxbh").fieldValue()));
		$("#record_xiaohc_xiaohcmc").fieldValue(trim($("#record_xiaohc_xiaohcmc").fieldValue()));
	}
	
	//选择按钮
	function func_button_choose(){
		//获取带选择列表的选中数据
		var unchoosed_rows = $('#grid_xiaohc').grid('getSelectedRecords');
		//获取已选择列表的所有数据
		var choosed_rows = $('#grid_xiaohc_choosed').grid('getRecords');
		//最多只能选择5个小火车
		if(unchoosed_rows.length + choosed_rows.length > 5){
			alert("${i18n.message_xiaohczdz}");
			return false;
		}
		if(unchoosed_rows.length > 0){
		    for(var i = 0; i < unchoosed_rows.length; i++){
		    	for(var j = 0; j < choosed_rows.length; j++){
		    		//验证不能选择多次同一辆小火车
		    		if(unchoosed_rows[i].usercenter + unchoosed_rows[i].shengcxbh + unchoosed_rows[i].xiaohcbh ==
		    			choosed_rows[j].usercenter + choosed_rows[j].shengcxbh + choosed_rows[j].xiaohcbh){
		    			alert("${i18n.usercenter}：" + unchoosed_rows[i].usercenter + "，" +
		    				  "${i18n.shengcxbh}：" + unchoosed_rows[i].shengcxbh + "，" +
		    				  "${i18n.xiaohcbh}：" + unchoosed_rows[i].xiaohcbh + 
		    				  "${i18n.message_yixz}");
		    			return false;
		    		}
		    	}
		    	choosed_rows.push(unchoosed_rows[i]);
		    }
		    //将带选择列表数据添加进已选择列表
			$('#grid_xiaohc_choosed').grid("parseRecords",choosed_rows);
			//移除待选择列表的选中状态
			$('#grid_xiaohc').find('tr').removeClass('selected');
		}else{
			//至少选择一个小火车
			alert("${i18n.message_qingxzytjl}");
		}
 	}
	
	//移除按钮
	function func_button_remove(){
		//移除已选择列表的选择数据
		$("#grid_xiaohc_choosed").grid('deleteRow');
 	}
	
	//监控按钮
	function func_button_observe(){
        var reg = new RegExp("^([1-9][0-9]{0,4})$");
        var ahead_value = $("#xiaohc_ahead").fieldValue();  
        //1-99999之间的整数
	    if(!reg.test(ahead_value)){  
	        alert("${i18n.message_dayy}");  
	        return false;
	    }
	    //获取已选择列表的所有数据
		var choosed_rows = $('#grid_xiaohc_choosed').grid('getRecords');
	    //最多监控5个小火车
	    if(choosed_rows.length > 5){
	    	alert("${i18n.message_jiankzdz}");
	    	return false;
	    }
	    //最少监控1个小火车
	    if(choosed_rows.length < 1){
	    	alert("${i18n.message_jiankzxz}");
	    	return false;
	    }
		for(var i = 0; i < choosed_rows.length; i++){
			//备货提前车身数和上线提前车身数都存在
			if(choosed_rows[i].beihtqcss && choosed_rows[i].shangxtqcss){
				//提前量 > 备货提前车身数 - 上线提前车身数
				if(ahead_value > choosed_rows[i].beihtqcss - choosed_rows[i].shangxtqcss){
					alert("${i18n.usercenter}：" + choosed_rows[i].usercenter + "，" +
		    			  "${i18n.shengcxbh}：" + choosed_rows[i].shengcxbh + "，" +
		    			  "${i18n.xiaohcbh}：" + choosed_rows[i].xiaohcbh + 
		    			  "${i18n.message_zuidtql}：" + (choosed_rows[i].beihtqcss - choosed_rows[i].shangxtqcss));
					return false;
				}
			}
    	}
		//小火车参数
		var params = [];
		params.push("tiql="+ahead_value);
		for(var i = 0 ; i < choosed_rows.length ; i++ ){
			 params.push("list["+i+"].usercenter="+choosed_rows[i].usercenter);
			 params.push("list["+i+"].shengcxbh="+choosed_rows[i].shengcxbh);
			 params.push("list["+i+"].xiaohcbh="+choosed_rows[i].xiaohcbh);
		}		
		window.location.href = "${ctx}/xuqjs/getSxzdPage.do?"+params.join('&');
	}
	
	$(function(){
		$('#button_choose').css('padding-right','3px');
		$('#btn div.youi-button.active-0').css('padding-right','10px');
	});
</script>

</t:html>