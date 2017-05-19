<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		
		<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 70px; } </style>
	</head>
	<t:page i18n="i18n.ckx.carry.i18n_carry">
		<t:grid id="grid_ckxCkxWullj" 
			idKeys="usercenter,appobj"
			dataFormId="form_ckxWullj"
			caption="${i18n.wullj}" 
			src="queryCkxWullj.ajax"
			add="NOT" edit="NOT" remove="NOT"
			editSrc="getCkxWullj.ajax"
			removeSrc="removeCkxWullj.ajax" 
			load="false" showNum="true"
			scrollHeight="225" pageSize="10">
			<div id="div_record0">
			<t:fieldLayout  prefix="record0" columns="4" >
				<t:fieldSelect  property="usercenter" width="120" caption="${i18n.usercenter}" convert="queryUserCenterMap"  defaultValue="${loginUser.usercenter}"/>
				<t:fieldText property="lingjbh" width="120" caption="${i18n.lingjbh}" maxLength="10"></t:fieldText>
				<t:fieldText property="gongysbh" width="120" caption="${i18n.gongysbh}" maxLength="10"></t:fieldText>				
				<t:fieldText property="mudd"  width="120" caption="${i18n.mudd}" maxLength="6"></t:fieldText>	
				<t:fieldText property="shengcxbh"  width="120" caption="${i18n.shengcx}" maxLength="5"></t:fieldText>
				<t:fieldText property="fenpqh"  width="120" caption="${i18n.xunh}" maxLength="5"></t:fieldText>				
				<t:fieldText property="xianbck"  width="120" caption="${i18n.xunhqd}" maxLength="3"></t:fieldText>
			    <t:fieldText property="dinghck"  width="120" caption="${i18n.xianbkqd}" maxLength="3"></t:fieldText>
				<t:fieldSelect property="mos"   convert="querySXMS" width="120" caption="${i18n.mos1}"></t:fieldSelect>
				<t:fieldSelect property="mos2"  convert="queryXDMS" width="120" caption="${i18n.mos2}"></t:fieldSelect>
				<t:fieldSelect property="waibms"  convert="queryWBMS" width="120" caption="${i18n.waibms}" > </t:fieldSelect>
				<t:fieldText property="lujbh"  width="120" caption="${i18n.lujbh}" maxLength="10"></t:fieldText>
				<t:fieldText property="gcbh" width="120" caption="${i18n.chengys}" maxLength="10"></t:fieldText>
				<t:fieldSelect property="zhizlx" width="120" caption="${i18n.zhizlx}" convert="queryDinghlx"></t:fieldSelect>
				<t:fieldHidden property="rdoInnerType" defaultValue="0"></t:fieldHidden>
				${i18n.chaxlx}：
			${i18n.shengcsj}<input id="rdoInnerType" type="radio" onclick="check(this)" value="0" name="rdoInnerType" checked="checked"/>
			${i18n.mobsj}<input  type="radio" onclick="check(this)" value="1" name="rdoInnerType" />
			</t:fieldLayout>
			</div>
			<t:button name="check"  caption="参数检查" ></t:button>
			<t:button name="compute"  caption="${i18n.jismb}" ></t:button>
			<t:button name="effective" caption="${i18n.shengcmb}"></t:button>
			<t:button name="exports"  caption="${i18n.shujdc}"></t:button>
			<t:gridCol property="usercenter" editor="fieldSelect" convert="queryUserCenterMap" caption="${i18n.usercenter}"/>
			<t:gridCol property="lingjbh" caption="${i18n.lingjbh}"/>
			<t:gridCol property="gongysbh" caption="${i18n.gongysbh}"/>
			<t:gridCol property="lujbh" caption="${i18n.lujbh}"/>
			<t:gridCol property="lujmc" caption="${i18n.lujmc}"/>
			<t:gridCol property="fahd" caption="${i18n.fahd}"/>
			<t:gridCol property="jiaofm" caption="${i18n.jiaofm}"/>
			<t:gridCol property="beihzq" caption="${i18n.beihzq}"/>
			<t:gridCol property="yunszq" caption="${i18n.yunszq}"/>
			<t:gridCol property="zhizlx" caption="${i18n.zhizlx}"/>
			<t:gridCol property="waibms" caption="${i18n.waibms}"/>
			<t:gridCol property="wjianglms" caption="${i18n.waibjlms}"/>
			<t:gridCol property="wshengxsj" caption="${i18n.waibjlmssxsj}"/>
			<t:gridCol property="gongyfe" caption="${i18n.gongyfe}"/>
			<t:gridCol property="zhidgys" caption="${i18n.zhidgys}"/>
			<t:gridCol property="xiehztbh" caption="${i18n.xiehzt}"/>
			<t:gridCol property="gcbh" caption="${i18n.chengys}"/>
			<t:gridCol property="songhpc" caption="${i18n.songhpc}"/>
			<t:gridCol property="beihsjc" caption="${i18n.beihsj}C"/>
			<t:gridCol property="mudd" caption="${i18n.mudd}"/>
			<t:gridCol property="dinghck" caption="${i18n.xianbkqd}"/>
			<t:gridCol property="mos2" caption="${i18n.mos2}"/>
			<t:gridCol property="jianglms2" caption="${i18n.jianglms2}"/>
			<t:gridCol property="shengxsj2" caption="${i18n.jianglmssxsj2}"/>
			<t:gridCol property="cangkshpc2" caption="${i18n.cangkshpcf}2"/>
			<t:gridCol property="cangkshsj2" caption="${i18n.cangkshsj}2"/>
			<t:gridCol property="cangkfhsj2" caption="${i18n.cangkfhsj}2"/>
			<t:gridCol property="beihsj2" caption="${i18n.beihsj}2"/>
			<t:gridCol property="ibeihsj2" caption="I${i18n.beihsj}2"/>
			<t:gridCol property="pbeihsj2" caption="P${i18n.beihsj}2"/>
			<t:gridCol property="xianbck" caption="${i18n.xunhqd}"/>
			<t:gridCol property="mos" caption="${i18n.mos1}"/>
			<t:gridCol property="jianglms" caption="${i18n.jianglms1}"/>
			<t:gridCol property="shengxsj" caption="${i18n.jianglmssxsj1}"/>
			<t:gridCol property="cangkshpc" caption="${i18n.cangkshpcf}"/>
			<t:gridCol property="cangkshsj" caption="${i18n.cangkshsj}"/>
			<t:gridCol property="cangkfhsj" caption="${i18n.cangkfhsj}"/>
			<t:gridCol property="beihsj" caption="${i18n.beihsj}"/>
			<t:gridCol property="ibeihsj" caption="I${i18n.beihsj}"/>
			<t:gridCol property="pbeihsj" caption="P${i18n.beihsj}"/>
             <t:gridCol property="fenpqh" caption="${i18n.xunh}"/>
			<t:gridCol property="shengcxbh" caption="${i18n.shengcx}"/>
			<t:gridCol property="aaaa" caption="" width="40"/>
			
		</t:grid>
		
		
		
	</t:page>
	
	<script type="text/javascript">
			function initPage(){
				$("#button_effective").hide();
				$("#button_compute").hide();
				$("#button_check").hide();
			}
			//生效数据\模板数据 切换
			function check(obj){
				$("#record0_rdoInnerType").fieldValue(obj.value);
				//$("#grid_ckxCkxWullj").grid("reload");
				if(obj.value==1){
					$("#button_effective").show();
					$("#button_compute").show();
 					$("#button_check").show();
				}else{
					$("#button_effective").hide();
					$("#button_compute").hide();
 					$("#button_check").hide();
				}
			}
			//生效模板
			function func_grid_effective(){		
				if (!confirm("${i18n.cimbjfgsxsj}")){
					return;
				}
				$.sdcui.ajaxUtil.ajax({
		            url:"effective.ajax",//请求url
		            data:null,
		           	success:function (result){
						
					}
		     	});
			}
			//计算模板
			function func_grid_compute(){		
				if (!confirm("${i18n.cimbjcxjssfqd}")){
					return;
				}
				$.sdcui.ajaxUtil.ajax({
		            url:"compute.ajax",//请求url
		            data:null,
		           	success:function (result){
		           		$('#grid_ckxCkxWullj').grid('reload');//刷新表格数据	
					}
		     	});
			}
			//参数检查
			function func_grid_check(){		
				var record = $('#grid_ckxCkxWullj').grid('getSelectedRecords');
				if(record==null||record==''){
					alert('请选择一条数据');
					return;
				}
				//1.主键检查
				var result="";
				var usercenter=record[0].usercenter;
				var gongysbh=record[0].gongysbh;
				if(usercenter==""||usercenter==null){result+="缺失通用零件|";}
				if(gongysbh==""||gongysbh==null){result+="缺失零件供应商关系|";}
				if(result!=""){alert(result);return;}
				
				
				//2.非主键参数检查
				var params = [];
				params.push('usercenter='+record[0].usercenter);
				params.push('lingjbh='+record[0].lingjbh);
				params.push('fenpqh='+record[0].fenpqh);
				params.push('gongysbh='+record[0].gongysbh);
				
				$.sdcui.ajaxUtil.ajax({
		            url:"checkWulljTemp.ajax",//请求url
		            data:params.join('&'),
		           	success:function (result){
		           		
					}
		     	}); 
				
			}
			
			
		//导出模板
			function func_button_exports(){	
				var exportValue = $("#record0_rdoInnerType").fieldValue();				
				var record={};
				var values1=$("#div_record0").find("input");
				for(var i=0;i<values1.length;i++){
					var name=$(values1[i]).attr("name");
					var value=$(values1[i]).attr("value");
					if(name!=null&&"rdoInnerType"!=name&&value!=""){
						record[name]=value;
					}
				}
				record["rdoInnerType"]=exportValue;
				$.sdcui.pageUtils.goPage({
					url : 'exports.do',
					mode : 'form',
					record : record,
					beforeSubmit : function(){
						return true;
					}
				}); 
			}
			
	</script>

</t:html>