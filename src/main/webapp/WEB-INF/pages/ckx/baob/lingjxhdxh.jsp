<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="零件-消耗点-循环">

<!-- 
	零件-消耗点-循环
	 hj
 -->
 
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 65px; } </style>
</head>

<t:page i18n="" >
	<t:grid id="grid_lingjxhdxh" caption="零件-消耗点-循环" idKeys="lingjbh" load="" editable="false" 
	showNum="true" back="NOT"   exportXls="true"
		 src="/baob/querylingjxhdxh.ajax"  add="NOT" edit="NOT" remove="NOT"
		  scrollHeight="290" pageSize="15">
		<t:fieldLayout id="lj" prefix="lingj" columns="3">
			<t:fieldSelect property="usercenter" caption="用户中心" width="150" defaultValue="${USERCENTER}" convert="queryUserCenterMap"/>
			<t:fieldText property="lingjbh" caption="零件编号"  width="150" dataType="text" maxLength="10"  />
			<t:fieldText property="xiaohdbh" caption="消耗点编号"  width="150" dataType="text" maxLength="9" />
			<t:fieldText property="fenpqbh" caption="分配区编号"  width="150" dataType="text" maxLength="5" />
			<t:fieldText property="shengcxbh" caption="生产线编号" width="150" dataType="text" maxLength="5" />
 			<t:fieldSelect property="gonghms" caption="上线模式"  width="150" convert="querySXMS"/>
 			<t:fieldSelect property="biaos" caption="标识" defaultValue="1"  convert="biaos" width="150"/>
		</t:fieldLayout>
		
		<t:gridCol  property="usercenter" caption="用户中心"  />
		<t:gridCol  property="lingjbh" caption="零件编号" width="70"  />
		<t:gridCol  property="xiaohdbh" caption="消耗点编号" width="70"  />
		<t:gridCol  property="wulbh" caption="物流描述编号" width="70"  />
		<t:gridCol  property="fenpqbh" caption="分配区编号" width="70" />
		<t:gridCol  property="shengcxbh" caption="生产线编号" width="85" 	/>
		<t:gridCol  property="shengxr" caption="消耗点起始日" width="50" />
		<t:gridCol  property="jiesr" caption="结束日期" width="70" />
		<t:gridCol  property="xiaohbl" caption="消耗比例" width="60" />
		<t:gridCol  property="tiqjsxhbl" caption="提前计算消耗比例" width="95" />
		<t:gridCol  property="peislxbh" caption="配送类型" width="95" />
		<t:gridCol  property="qianhcbs" caption="前后车标识" width="95" />
		<t:gridCol  property="jipbzwz" caption="集配包装位置" width="95" />
		<t:gridCol  property="pdsbz" caption="PDS标志" width="95" />
		<t:gridCol  property="guanlybh" caption="管理员编号" width="95" />
		<t:gridCol  property="gongysbh" caption="供应商编号" width="95" />
		<t:gridCol  property="shunxglbz" caption="顺序管理标志" width="95" />
		<t:gridCol  property="zidfhbz" caption="自动发货标志" width="95" />
		<t:gridCol  property="xianbyhlx" caption="线边要货类型" width="95" />
		<t:gridCol  property="yancsxbz" caption="延迟上线标识" width="95" />
		<t:gridCol  property="beihdbz" caption="是否产生备货单" width="95" />
		<t:gridCol  property="xiaohcbh" caption="小火车编号" width="95" />
		<t:gridCol  property="xiaohccxbh" caption="小火车车厢编号" width="95" />
		<t:gridCol  property="yuanxhdbh" caption="原消耗点编号" width="95" />
		<t:gridCol  property="anqkcts" caption="安全库存天数" width="95" />
		<t:gridCol  property="anqkcs" caption="安全库存数量" width="95" />
		<t:gridCol  property="ceng" caption="层" width="95" />
		<t:gridCol  property="xianbllkc" caption="线边理论库存" width="95" />
		<t:gridCol  property="yifyhlzl" caption="已发要货令总量" width="95" />
		<t:gridCol  property="jiaofzl" caption="交付总量" width="95" />
		<t:gridCol  property="zhongzzl" caption="订单终止总量" width="95" />
		<t:gridCol  property="xittzz" caption="系统调整值" width="95" />
		<t:gridCol  property="biaos" caption="标识" width="95" />
		<t:gridCol  property="gonghms" caption="上线模式" width="95" />
		<t:gridCol  property="xunhbm" caption="循环编码" width="95" />
		<t:gridCol  property="baozrl" caption="包装容量" width="95" />
		<t:gridCol  property="cmj" caption="CMJ" width="95" />
		<t:gridCol  property="jisxhgm" caption="计算循环规模" width="95" />
		<t:gridCol  property="dangqxhgm" caption="现实循环规模" width="95" />
		<t:gridCol  property="bianhfd" caption="变化幅度" width="95" />
		<t:gridCol  property="shengxzt" caption="生效状态" width="95" />
		<t:gridCol  property="dongjjdzt" caption="冻结状态" width="95" />
		<t:gridCol  property="zuidyhl" caption="最大要货量" width="95" />
		<t:gridCol  property="" caption="" />
	</t:grid>
</t:page>

<script type="text/javascript">

//标识
$.sdcui.serverConfig.convertArray['biaos'] = {
	'0' : '无效',
	'1' : '有效',
	'2' : '新建'
};

	//空格查询
	function grid_lingjxhdxh_beforeSubmit() {
		$("#lingj_lingjbh").fieldValue(trim($("#lingj_lingjbh").fieldValue()));
		$("#lingj_xiaohdbh").fieldValue(trim($("#lingj_xiaohdbh").fieldValue()));
		$("#lingj_fenpqbh").fieldValue(trim($("#lingj_fenpqbh").fieldValue()));
		$("#lingj_shengcxbh").fieldValue(trim($("#lingj_shengcxbh").fieldValue()));
	}
	
	
	
</script>

</t:html>