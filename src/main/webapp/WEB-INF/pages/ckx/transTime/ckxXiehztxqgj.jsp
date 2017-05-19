<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	</head>
	<t:page i18n="i18n.ckx.transTime.i18n_xiehztxqgj">
	<!-- 计算卸货站台需求归集 -->
	<t:grid id="grid_CkxXiehztxqgj" caption="${i18n.xiehztbzxqgj }" src="/transTime/queryCkxXiehztxqgj.ajax"  idKeys="xiehztbh,lingjbh,chengysbh"
		add="NOT" remove="NOT" edit="NOT" showNum="true" load="false"
		afterSaveRowsEvent="afterSaveRows"
	scrollHeight="360" pageSize="15"
		>
		<t:fieldLayout prefix="record11" columns="4">
			<t:fieldSelect  property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap"  defaultValue="${loginUser.usercenter}"  />
			<t:fieldText  property="xiehztbh" caption="${i18n.xiehztbz }" maxLength="6" width="110" />
			<t:fieldText  property="chengysbh" caption="${i18n.gcbh }" maxLength="10" width="110" />
			<t:fieldText  property="lingjbh" caption="${i18n.lingjbh }" maxLength="10" width="110" />

		</t:fieldLayout>

		<t:gridCol property="xiehztbh" caption="${i18n.xiehztbz }" width="90"/>
		<t:gridCol property="chengysbh" caption="${i18n.gcbh }"/>
		<t:gridCol property="lingjbh" caption="${i18n.lingjbh }"/>
		<t:gridCol property="xuqsl" caption="${i18n.xuqsl }"/>
		<t:gridCol property="usercenter" caption="${i18n.usercenter }" convert="queryUserCenterMap"/>
		<t:gridCol property="kaissj" caption="${i18n.kaiszq }"/>
		<t:gridCol property="jiessj" caption="${i18n.jieszq}" width="80"/>
<t:gridCol property="" caption="" width="5"></t:gridCol>
		
	</t:grid>
	</t:page>
</t:html>