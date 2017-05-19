<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 90px; } </style>
	</head>
	<t:page i18n="i18n.ckx.carry.i18n_carry">
		<t:grid id="grid_CkxCangkxhsj"  idKeys="usercenter,cangkbh,fenpqhck,mos"
			dataFormId="form_CkxCangkxhsj" caption="${i18n.cangkxhsj}" 
			add="NOT" src="queryCkxCangkxhsj.ajax" editSrc="getCkxCangkxhsj.ajax" removeSrc="removeCkxCangkxhsj.ajax" 
			load="false" showNum="true" scrollHeight="295" pageSize="15">
			<t:fieldLayout prefix="record0" columns="3">
				<t:fieldSelect  property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap"  defaultValue="${loginUser.usercenter}"  width="150"/>
				<t:fieldText property="cangkbh"  caption="${i18n.cangkbh}" maxLength="6" width="150"></t:fieldText>
				<t:fieldText property="fenpqhck" caption="${i18n.xunh}/${i18n.cangk}" minLength="5" maxLength="6" width="150"></t:fieldText>
				<t:fieldHidden property="fenpqhckLength" caption="${i18n.xunh}/${i18n.cangk}"></t:fieldHidden>
				<t:fieldSelect property="mos" notNull="true" defaultValue="RD" caption="${i18n.mos}" convert="queryCKMS" width="150"/>
				<t:fieldSelect property="shengxbs" caption="${i18n.biaos}" convert="biaos"  width="150"/>
			</t:fieldLayout>
			
			<t:button name="addCkxCangkxhsj" icon="addRecord" caption="${i18n.add}"></t:button>
			<t:button caption="下载模板" name="mobxz" ></t:button>
			<t:gridCol property="usercenter" editor="fieldSelect" convert="queryUserCenterMap" caption="${i18n.usercenter}"/>
			<t:gridCol property="cangkbh" caption="${i18n.cangkbh}"/>
			<t:gridCol property="fenpqhck" caption="${i18n.xunh}/${i18n.cangk}"/>
			<t:gridCol  property="mos" caption="${i18n.mos}"/>
			<t:gridCol property="cangkshpcf" caption="${i18n.cangkshpcf}"/>
			<t:gridCol property="cangkshsj" caption="${i18n.cangkshsj}"/>
			<t:gridCol property="cangkfhsj" caption="${i18n.cangkfhsj}"/>
			<t:gridCol property="beihsj" caption="${i18n.beihsj}"/>
			<t:gridCol property="ibeihsj" caption="${i18n.ibeihsj}"/>
			<t:gridCol property="pbeihsj" caption="${i18n.pbeihsj}"/>
			<t:gridCol property="shifzdbh"  caption="${i18n.shifzdbh}" editor="fieldHidden" convert="shifzdbh" />
			<t:gridCol property="shengxbs"  caption="${i18n.biaos}" editor="fieldHidden" convert="biaos" />
			 
		
		</t:grid>
		<t:form dialog="true" width="700" reset="NOT" id="form_addCkxCangkxhsj" caption="${i18n.cangkxhsj}" action="addCkxCangkxhsj.ajax">
			<t:fieldLayout prefix="record1">
				<t:fieldSelect  property="usercenter" notNull="true"  caption="${i18n.usercenter}" convert="queryUserCenterMap"  defaultValue="${loginUser.usercenter}"/>
				<t:fieldText  property="cangkbh"  caption="${i18n.cangkbh}" notNull="true" maxLength="6" minLength="6" dataType="text"/>
				<t:fieldText  property="fenpqhck"  caption="${i18n.xunh}/${i18n.cangk}" notNull="true" maxLength="6" minLength="5" dataType="text" />
				<t:fieldSelect property="mos" caption="${i18n.mos}" notNull="true"  convert="queryCKMS"></t:fieldSelect>
				<t:fieldText property="cangkshpcf"  expression='^[0-9]{1,2}$'  expressionMessage="${i18n.qingsr12zs}" caption="${i18n.cangkshpcf}" ></t:fieldText>
				<t:fieldText property="beihsj" expression='^[0-9]{1,3}$|^[0-9]{1,3}[.][0-9]{1,2}$'  expressionMessage="${i18n.qingsr3wzsh2wxs}" caption="${i18n.beihsj}"></t:fieldText>
				<t:fieldText property="cangkshsj"  expression='^[0-9]{1,3}$|^[0-9]{1,3}[.][0-9]{1,2}$'  expressionMessage="${i18n.qingsr3wzsh2wxs}" caption="${i18n.cangkshsj}"></t:fieldText>
				<t:fieldText property="cangkfhsj" expression='^[0-9]{1,3}$|^[0-9]{1,3}[.][0-9]{1,2}$'  expressionMessage="${i18n.qingsr3wzsh2wxs}" caption="${i18n.cangkfhsj}"></t:fieldText>
				
				<t:fieldText property="ibeihsj"  expression='^[0-9]{1,3}$|^[0-9]{1,3}[.][0-9]{1,2}$'  expressionMessage="${i18n.qingsr3wzsh2wxs}" caption="${i18n.ibeihsj}"></t:fieldText>
				<t:fieldText property="pbeihsj"  expression='^[0-9]{1,3}$|^[0-9]{1,3}[.][0-9]{1,2}$'  expressionMessage="${i18n.qingsr3wzsh2wxs}" caption="${i18n.pbeihsj}"></t:fieldText>
				<t:fieldSelect property="shifzdbh" notNull="true" caption="${i18n.shifzdbh}" convert="shifzdbh" ></t:fieldSelect>
			</t:fieldLayout>
		</t:form>
		<t:form dialog="true" width="700" reset="NOT" id="form_CkxCangkxhsj" caption="${i18n.cangkxhsj}" action="saveCkxCangkxhsj.ajax" >
			<t:fieldLayout prefix="record2">
				<t:fieldSelect  property="usercenter" notNull="true"  caption="${i18n.usercenter}" convert="queryUserCenterMap" readonly="true"/>
				<t:fieldText property="cangkbh"  caption="${i18n.cangkbh}" readonly="true" ></t:fieldText>
				<t:fieldText property="fenpqhck" caption="${i18n.xunh}/${i18n.cangk}" readonly="true" ></t:fieldText>
				<t:fieldText property="mos" caption="${i18n.mos}"  readonly="true" ></t:fieldText>
				<t:fieldText property="cangkshpcf" expression='^[0-9]{1,2}$'  expressionMessage="${i18n.qingsr12zs}" caption="${i18n.cangkshpcf}"  ></t:fieldText>
				<t:fieldText property="beihsj" expression='^[0-9]{1,3}$|^[0-9]{1,3}[.][0-9]{1,2}$'  expressionMessage="${i18n.qingsr3wzsh2wxs}" caption="${i18n.beihsj}"></t:fieldText>
				<t:fieldText property="cangkshsj" expression='^[0-9]{1,3}$|^[0-9]{1,3}[.][0-9]{1,2}$'  expressionMessage="${i18n.qingsr3wzsh2wxs}" caption="${i18n.cangkshsj}"></t:fieldText>
				<t:fieldText property="cangkfhsj" expression='^[0-9]{1,3}$|^[0-9]{1,3}[.][0-9]{1,2}$'  expressionMessage="${i18n.qingsr3wzsh2wxs}" caption="${i18n.cangkfhsj}"></t:fieldText>
				
				<t:fieldText property="ibeihsj" expression='^[0-9]{1,3}$|^[0-9]{1,3}[.][0-9]{1,2}$'  expressionMessage="${i18n.qingsr3wzsh2wxs}" caption="${i18n.ibeihsj}"></t:fieldText>
				<t:fieldText property="pbeihsj" expression='^[0-9]{1,3}$|^[0-9]{1,3}[.][0-9]{1,2}$'  expressionMessage="${i18n.qingsr3wzsh2wxs}" caption="${i18n.pbeihsj}"></t:fieldText>
				<t:fieldSelect property="shifzdbh" notNull="true" caption="${i18n.shifzdbh}" convert="shifzdbh" ></t:fieldSelect>
				<t:fieldSelect property="shengxbs" caption="${i18n.biaos}" notNull="true" convert="biaos"></t:fieldSelect>
			</t:fieldLayout>
		</t:form>
		<t:file action="/carry/importAth_uploadCkxckxhsj.do" size="50">
		<t:fileparam sheet="cangkxhsj" keys="USERCENTER,CANGKBH,FENPQHCK,MOS" table="{dbSchemal3}CKX_CANGKXHSJ" datasourceId="1"/>
	    </t:file>
	    <div><font color="red">导入结果不能大于5000条,否则为空</font></div>
	</t:page>
	<script type="text/javascript">
			$.sdcui.serverConfig.convertArray['shifzdbh'] = {'1':'${i18n.yes}','0':'${i18n.no}'};
			$.sdcui.serverConfig.convertArray['biaos'] = {'1':'${i18n.available}','0':'${i18n.unavailable}'};
			//页面初始化
			function initPage(){
				//查询条件中[仓库/循环]填写5位时模式只能为rd 反之为rm
				/* $("#record0_fenpqhck input").blur(function() {
					var length = $("#record0_fenpqhck").fieldValue().length;
					if(5 == length){
						$("#record0_mos").fieldValue('RD');
					}else if(6 == length){
						$("#record0_mos").fieldValue('RM');
					}else{
						$("#record0_mos").fieldValue('');
					}
					return true;
				}); */
			}
			
			//点击查询前事件
			function grid_CkxCangkxhsj_beforeSubmit(){
				$("#record0_fenpqhckLength").fieldValue($("#record0_fenpqhck").fieldValue().length);
				return true;
			}
			
			//
			function func_grid_addCkxCangkxhsj(){
				$('#form_addCkxCangkxhsj').form('clear');
				$("#record1_usercenter").fieldValue('${loginUser.usercenter}');
				$('#form_addCkxCangkxhsj').form('open','${i18n.add} - ');
			}
			
			//添加按钮回调函数
			function form_addCkxCangkxhsj_afterSubmit(result){
				if(typeof result.success=="undefined"||result.success!==false){
// 					$('#form_addCkxCangkxhsj').dialog('close');
// 					$('#form_addCkxCangkxhsj').find('input').val("");
					$('#grid_CkxCangkxhsj').grid('reload');//刷新表格数据
				}
				
			}
			
			//增加前验证
			function form_addCkxCangkxhsj_beforeSubmit(){
				var mos = $('#record1_mos').fieldValue();fenpqhck
				var fenpqhck = $('#record1_fenpqhck').fieldValue();
				var ibeihsj = $('#record1_ibeihsj').fieldValue();
				var pbeihsj = $('#record1_pbeihsj').fieldValue();
				var cangkshpcf = $('#record1_cangkshpcf').fieldValue();
				var cangkshsj = $('#record1_cangkshsj').fieldValue();
				var cangkfhsj = $('#record1_cangkfhsj').fieldValue();
				var beihsj = $('#record1_beihsj').fieldValue();
				//rd模式验证   i备货时间 ， p备货时间，仓库送货时间和返回时间  mantis 0005218
				if("RD" == mos){
					if(null == ibeihsj||"" == ibeihsj){
						alert("${i18n.Ibeihshbnwk}");
						return false;
					}
					if(null == pbeihsj||"" == pbeihsj){
						alert("${i18n.Pbeihshbnwk}");
						return false;
					}
					if(null == cangkshsj||"" == cangkshsj ){
						alert("${i18n.cangkshsjbnwk}");
						return false;
					}
					if(null == cangkfhsj||"" == cangkfhsj ){
						alert("${i18n.cangkfhsjbnwk}");
						return false;
					}
					
					return true;
				}else if("RM" == mos){//rm模式验证   仓库送货频次 ， 备货时间，仓库送货时间和返回时间  
					if(null == cangkshpcf||"" == cangkshpcf){
						alert("${i18n.cangkshpcbnwk}");
						return false;
					}
					if(null == cangkshsj||"" == cangkshsj ){
						alert("${i18n.cangkshsjbnwk}");
						return false;
					}
					if(null == cangkfhsj||"" == cangkfhsj ){
						alert("${i18n.cangkfhsjbnwk}");
						return false;
					}
					if(null == beihsj||"" == beihsj ){
						alert("${i18n.beihsjbnwk}");
						return false;
					}
					return true;
				}
				return true;
			}	
			//修改前验证
			function form_CkxCangkxhsj_beforeSubmit(){
				var mos = $('#record2_mos').fieldValue();
				var ibeihsj = $('#record2_ibeihsj').fieldValue();
				var pbeihsj = $('#record2_pbeihsj').fieldValue();
				var cangkshpcf = $('#record2_cangkshpcf').fieldValue();
				var cangkshsj = $('#record2_cangkshsj').fieldValue();
				var cangkfhsj = $('#record2_cangkfhsj').fieldValue();
				var beihsj = $('#record2_beihsj').fieldValue();
				
				if("RD" == mos){//rd模式验证   i备货时间 ， p备货时间，仓库送货时间和返回时间  mantis 0005218
					if(null == ibeihsj||"" == ibeihsj ){
						alert("${i18n.Ibeihshbnwk}");
						return false;
					}
					if(null == pbeihsj||"" == pbeihsj ){
						alert("${i18n.Pbeihshbnwk}");
						return false;
					}
					if(null == cangkshsj||"" == cangkshsj ){
						alert("${i18n.cangkshsjbnwk}");
						return false;
					}
					if(null == cangkfhsj||"" == cangkfhsj ){
						alert("${i18n.cangkfhsjbnwk}");
						return false;
					}
					return true;
				}else if("RM" == mos){//rm模式验证   仓库送货频次 ， 备货时间，仓库送货时间和返回时间  
					if(null == cangkshpcf||"" == cangkshpcf ){
						alert("${i18n.cangkshpcbnwk}");
						return false;
					}
					if(null == cangkshsj||"" == cangkshsj ){
						alert("${i18n.cangkshsjbnwk}");
						return false;
					}
					if(null == cangkfhsj||"" == cangkfhsj ){
						alert("${i18n.cangkfhsjbnwk}");
						return false;
					}
					if(null == beihsj||"" == beihsj ){
						alert("${i18n.beihsjbnwk}");
						return false;
					}
					return true;
				}
				return true;
			}	
		
			//导出模板
			function func_button_mobxz(){
				
				$.sdcui.pageUtils.goPage({
					url : '../carry/downloadCkxhsjMob.do',
					mode : 'form',
					beforeSubmit : function(){
						return true;
					}
			   });
			}
			
		</script>
</t:html>