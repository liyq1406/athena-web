<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<t:html title="${i18n.lingjxhd}">

<!-- 
	消耗点-零件
	 @author denggq
	 @date 2012-4-18
 -->

<head>
	<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	<style type="text/css"> .youi-fieldLayout table td.contral.label-col {     width: 100px; } </style>
</head>
<t:page i18n="i18n.ckx.xuqjs.i18n_lingjxhd" >
	<t:grid id="grid_lingjxhd" caption="${i18n.lingjxhd}" idKeys="usercenter,lingjbh,xiaohdbh" load="false" remove="NOT" dataFormId="form_lingjxhd" back="NOT"
		src="/xuqjs/queryLingjxhd.ajax" editSrc="/xuqjs/getLingjxhd.ajax" showNum="true"  showCheckbox="true"
		saveRowsSrcs="/xuqjs/savesLingjxhd.ajax" pageSize="50" scrollHeight="290" afterSaveRowsEvent="afterSaveRows" >
		<t:fieldLayout id="lingjxhd" prefix="lingjxhd" columns="3">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${usercenter}" width="140" />
			<t:fieldText property="lingjbh" caption="${i18n.lingjbh}" dataType="text" maxLength="10" minLength="10" width="140" />
			<t:fieldText property="shengcxbh" caption="${i18n.shengcxbh}" dataType="text" maxLength="5" minLength="5"  width="140"/>
			<t:fieldText property="fenpqbh" caption="${i18n.fenpqbh}" dataType="text" maxLength="5" minLength="5"  width="140"/>
			<t:fieldSelect property="gongybs" caption="${i18n.gongybs}" convert="gongybs" width="140"/>
			<t:fieldSelect property="biaos" caption="${i18n.biaos}" convert="biaos"  width="140"/>
		</t:fieldLayout>
		
		<t:button caption="${i18n.export}" name="download"></t:button>
		<t:button caption="替换${i18n.mobxz}" name="mobxz" active="0"/>
		<t:button caption="新增及更新模板下载" name="mobxzxhd" active="0"/>
		<t:button caption="${i18n.save}" name="save" />
		<t:button caption="比例均分" name="junfbl" />
		<t:button caption="失效" name="shixiao" />
        <t:button caption="PDS生效/失效时间" name="pdssj" />
		<t:gridCol property="usercenter" caption="${i18n.usercenter}" editor="fieldSelect" convert="queryUserCenterMap" 
			editorOptions="{'notNull':true}" width="60"/>
		<t:gridCol property="lingjbh" caption="${i18n.lingjbh}" editor="fieldText" 
			editorOptions="{'maxLength':'10','minLength':'10','dataType':'text','notNull':true}"/>
		<t:gridCol property="xiaohdbh" caption="${i18n.xiaohdbh}" editor="fieldText" 
			editorOptions="{'maxLength':'9','minLength':'9','dataType':'text','notNull':true}"/>
		<t:gridCol property="wulbh" caption="${i18n.wulbh}" editor="fieldText" width="90" defaultValue="0000"
			editorOptions="{'maxLength':'4','minLength':'4','dataType':'text','notNull':true}"/>
		<t:gridCol property="fenpqbh" caption="${i18n.fenpqbh}" width="90" 
			editorOptions="{'maxLength':'5','minLength':'5','dataType':'text'}"/>
		<t:gridCol property="shengcxbh" caption="${i18n.shengcxbh}" width="80"
			editorOptions="{'maxLength':'5','minLength':'5','dataType':'text'}"/>
		<t:gridCol property="gongybs" caption="${i18n.gongybs}" convert="biaos" width="70"/>
		<t:gridCol property="xiaohbl" caption="${i18n.xiaohbl}" editor="fieldText" width="90"
			editorOptions="{'expression':'^(0|100|[1-9][0-9]?)$','expressionMessage':'${i18n.xiaohbl_ex_mes}','notNull':true}"/>
		<t:gridCol property="tiqjsxhbl" caption="${i18n.tiqjsxhbl}" editor="fieldText" width="120" 
			editorOptions="{'expression':'^(0|100|[1-9][0-9]?)$','expressionMessage':'${i18n.tiqjsxhbl_ex_mes}'}"/>
		<t:gridCol property="yuanxhdbh" caption="${i18n.yuanxhdbh}" editor="fieldText" width="90"
			editorOptions="{'maxLength':'9','minLength':'9','dataType':'text'}"/>
		<t:gridCol property="shengxr" caption="${i18n.shengxr}" editor="fieldCalendar" width="90"
			editorOptions="{'format':'yyyy-MM-dd','notNull':true}" params="xiaohbl"/>
		<t:gridCol property="jiesr" caption="${i18n.jiesr}" editor="fieldCalendar" defaultValue="9999-12-31"
			editorOptions="{'format':'yyyy-MM-dd','notNull':true}" width="80" params="xiaohbl"/>
		<t:gridCol property="gongyxl" caption="工艺系列" width="80"/>
		<t:gridCol property="biaos" caption="${i18n.biaos}" convert="biaos" editor="fieldSelect" defaultValue="1" editorOptions="{'notNull':true}" width="53"/>
		<t:gridCol property="yuanbiaos" hidden="true"  caption="原标识"></t:gridCol>
		
		<t:gridCol property="" caption="" width="15"></t:gridCol>
	</t:grid>
    <t:form dialog="true" id="form_pdssj"   reset="NOT" submit="NOT" width="650" height="155" caption="PDS生效/失效时间">
			<t:grid id="grid_pds" idKeys="usercenter,lingjbh,xiaohdbh" src="/xuqjs/pdssj.ajax"   showNum="true" back="NOT" 
				submit="NOT" reset="NOT" add="NOT" edit="NOT" remove="NOT" load="false" scrollHeight="70" usePager="false"  editable="false" >
				<t:fieldLayout prefix="pds"> 
						<t:fieldHidden property="usercenter" ></t:fieldHidden>
						<t:fieldHidden property="lingjbh"  ></t:fieldHidden>
					    <t:fieldHidden property="xiaohdbh"  ></t:fieldHidden>
				</t:fieldLayout>
				<t:gridCol property="usercenter" caption="${i18n.usercenter}"  width="80"/>
		        <t:gridCol property="lingjbh" caption="${i18n.lingjbh}"  width="100" />
				<t:gridCol property="xiaohdbh" caption="${i18n.xiaohdbh}"   width="100" />
				<t:gridCol property="pdsshengxsj" caption="PDS生效时间" width="120" />
				<t:gridCol property="pdsshixsj" caption="PDS失效时间" width="120" />
				<t:gridCol property="" caption=" "></t:gridCol>
			</t:grid>
	</t:form>
	<t:form dialog="true" id="form_lingjxhd" caption="${i18n.lingjxhd}" action="/xuqjs/saveLingjxhd.ajax" width="660" 
		idKeys="usercenter,lingjbh,xiaohdbh" reset="NOT">
		<t:fieldLayout id="ljxhd" prefix="record" columns="3">
			<t:fieldSelect property="usercenter" caption="${i18n.usercenter}" convert="queryUserCenterMap" defaultValue="${usercenter}" notNull="true" width="120"/>
			<t:fieldText property="lingjbh" caption="${i18n.lingjbh}" dataType="text" maxLength="10" minLength="10" notNull="true" width="120"/>
			<t:fieldText property="xiaohdbh" caption="${i18n.xiaohdbh}" dataType="text" maxLength="9" minLength="9" notNull="true" width="120"/>
			<t:fieldText property="wulbh" caption="${i18n.wulbh}" dataType="text" maxLength="4" minLength="4" notNull="true" defaultValue="0000" width="120" />
<%-- 			<t:fieldText property="fenpqbh" caption="${i18n.fenpqbh}" readonly="true" width="120"/> --%>
<%-- 			<t:fieldText property="shengcxbh" caption="${i18n.shengcxbh}" readonly="true"  width="120"/> --%>
<%-- 			<t:fieldText property="peislxbh" caption="${i18n.peislxbh}" dataType="text" maxLength="4" minLength="4"  width="120" /> --%>
<%-- 			<t:fieldSelect property="qianhcbs" caption="${i18n.qianhcbs}" convert="qianhcbs" width="120" /> --%>
<%-- 			<t:fieldText property="jipbzwz" caption="${i18n.jipbzwz}" dataType="text" maxLength="2" width="120" /> --%>
			<t:fieldSelect property="pdsbz" caption="${i18n.pdsbz}" convert="pdsbz" readonly="true" width="120"/>
			<t:fieldCalendar property="shengxr" caption="${i18n.shengxr}" format="yyyy-MM-dd" notNull="true" width="120"/>
			<t:fieldText property="tiqjsxhbl" caption="${i18n.tiqjsxhbl}" expression="^(0|100|[1-9][0-9]?)$" 
				expressionMessage="${i18n.tiqjsxhbl_ex_mes}" width="120" />
			<t:fieldText property="guanlybh" caption="${i18n.guanlybh}"  dataType="text" maxLength="3" width="120" />
			<t:fieldSelect property="shunxglbz" caption="${i18n.shunxglbz}" notNull="true" convert="shunxglbz" width="120" defaultValue="Y" />
			<t:fieldText property="gongysbh" caption="${i18n.gongysbh}" width="120"/>
			<t:fieldSelect property="zidfhbz" caption="${i18n.zidfhbz}" notNull="true" convert="zidfhbz" width="120" defaultValue="N" />
			<t:fieldSelect property="xianbyhlx" caption="${i18n.xianbyhlx}" notNull="true" convert="xianbyhlx"  width="120" defaultValue="K" />
			<t:fieldSelect property="yancsxbz" caption="${i18n.yancsxbz}" notNull="true" convert="yancsxbz"  width="120" defaultValue="P" />
			<t:fieldSelect property="beihdbz" caption="${i18n.beihdbz}" notNull="true" convert="beihdbz"  width="120" defaultValue="Y" />
			<t:fieldText property="xiaohcbh" caption="${i18n.xiaohcbh}" maxLength="5" dataType="text" width="120" />
			<t:fieldText property="xiaohccxbh" caption="${i18n.xiaohccxbh}" maxLength="4" dataType="text" width="120" />
			<t:fieldText property="anqkcts" caption="${i18n.anqkcts}" expression="^[1-9][0-9]{0,2}(?:\.[0-9]{1,2})?$|0\.[0-9]{1,2}$|^0$"
				expressionMessage="${i18n.anqkcts_ex_mes}"  width="120"/>
			<t:fieldText property="anqkcs" caption="${i18n.anqkcs}" expression="^[1-9][0-9]{0,6}(?:\.[0-9]{1,3})?$|0\.[0-9]{1,3}$|^0$"
				expressionMessage="${i18n.anqkcs_ex_mes}"  width="120"/>
			<t:fieldText property="ceng" caption="${i18n.ceng}" dataType="text" maxLength="2" width="120" />
			<t:fieldText property="xianbllkc" caption="${i18n.xianbllkc}" readonly="true" width="120" defaultValue="0"/>
			<t:fieldText property="yifyhlzl" caption="${i18n.yifyhlzl}" readonly="true" width="120"   defaultValue="0"/>
			<t:fieldText property="jiaofzl" caption="${i18n.jiaofzl}" readonly="true" width="120"   defaultValue="0"/>
			<t:fieldText property="zhongzzl" caption="${i18n.zhongzzl}" readonly="true" width="120"   defaultValue="0"/>
			<t:fieldText property="xittzz" caption="${i18n.xittzz}"  width="120" readonly="true"/>	
			<t:fieldHidden property="biaos" caption="${i18n.biaos}"></t:fieldHidden>
<%-- 			<t:fieldHidden property="yuanbiaos" caption="原标识"></t:fieldHidden>	 --%>
		</t:fieldLayout>
	</t:form>
	
	<t:file action="/xuqjs/importAth_uploadLingjxhd.do" size="50">
		<t:fileparam sheet="lingjxhd" keys="USERCENTER,LINGJBH,XIAOHDBH" table="{dbSchemal3}CKX_LINGJXHD" datasourceId="1" dateColumns="SHENGXR" dateFormats="yyyy-MM-dd"/>
	</t:file>
	
<form id="form_importlingjxhd_xls" target="_self" enctype="multipart/form-data" action="/athena/xuqjs/importAth_uploadLingjxhdInsert.do" method="post" name="form_importlingjxhd_xls">
	<table>
		<tbody>
			<tr>
				<td>
					<input id="fileNamexhd_xls" type="file" size="50" name="fileNamexhd_xls">
				</td>
				<td>
					<div id="button_submitlingjxhd_upload" class="youi-button active-0">
						<div class="right">
							<div class="center">
								<a class="submit" onclick="form_subimtxhd()" href="#"> 新增及更新导 入 </a>
							</div>
						</div>
					</div>
				</td>
		   </tr>
		</tbody>
	</table>
<script type="text/javascript">
function form_subimtxhd(){ 
	var formEle = document.getElementById("form_importlingjxhd_xls"); 
	if($("#fileNamexhd_xls").val()==null || ""==$("#fileNamexhd_xls").val())
	{ 
		alert("上传文件不能为空."); 
		return false; 
	}else{ 
		window.down_showLoading();
		formEle.submit(); 
	} 
} 
$(document).ready(function(){window.down_hideLoading();var a = "null"; if(a!='null') { a = a.replace(/@/g,'\n');alert(a);}});
</script>
<input id="import_hidd_comfig" type="hidden" value="[{'sheet':'lingjxhd','datasourceId':'1','table':'{dbSchemal3}CKX_LINGJXHD','keys':'USERCENTER,LINGJBH,XIAOHDBH','dateColumns':'SHENGXR','dateFormats':'yyyy-MM-dd','clazz':'null'}]" name="import_hidd_comfig">
</form>
<%-- 	<t:file action="/xuqjs/uploadLingjxhdInsert.do" size="50"> --%>
<%-- 		<t:fileparam sheet="lingjxhd" keys="USERCENTER,LINGJBH,XIAOHDBH" table="{dbSchemal3}CKX_LINGJXHD" datasourceId="1" dateColumns="SHENGXR" dateFormats="yyyy-MM-dd"/> --%>
<%-- 	</t:file> --%>
</t:page>


<script type="text/javascript">
		function initPage(){
			$("#button_submit_upload").find("a").html("替换导入");
			//1.控制PDSBZ
			$("#record_peislxbh input").blur(function() {
				var peislxbh = trim($("#record_peislxbh").fieldValue());
				if("" != peislxbh && undefined != peislxbh && null != peislxbh){
					$("#record_pdsbz").fieldValue("2");
				}else{
					$("#record_pdsbz").fieldValue("");
				}
				return true;
			});
		
			//控制权限
			var currentRole = "${role}";
			
			var params = [{'name':'record_xianbllkc',	'roles':'WULGYY'},
			       		  {'name':'record_yifyhlzl',	'roles':'ZBCPOA,WULGYY'},
				       	  {'name':'record_jiaofzl',		'roles':'ZBCPOA,WULGYY'},
				       	  {'name':'record_xittzz',		'roles':'WULGYY'},
				       	  {'name':'record_xiaohcbh',	'roles':'ZXCPOA,JIHUAY'},
				       	  {'name':'record_xiaohccxbh',	'roles':'ZXCPOA,JIHUAY'},
				       	  {'name':'record_zhongzzl',	'roles':'WULGYY'}
			       		  ];
			setDisabled(params,currentRole);
			
			//控制生效日 （1.增加时生效日必须可填写，2修改时新建时可填写，3修改时有效无效不能填写）
			
		}
		//增加按钮
		function func_button_add() {
            $('#form_lingjxhd').form("clear");//清除弹出窗口的数据
			$('#form_lingjxhd').addClass('operant-add');//增加的operant为1，修改的operant为2
			$('#record_shengxr').removeClass("disabled").removeClass('readonly');
			$('#record_shengxr').find(".textInput").attr("disabled",false);
			
			
		
			
			
			var record = {} ;
			record.usercenter = '${usercenter}';   
			record.wulbh = "0000" ;
			record.shunxglbz = "Y" ;
			record.zidfhbz = "N" ;
			record.xianbyhlx = "K" ;
			record.yancsxbz = "P" ;
			record.beihdbz = "Y" ;
			record.xianbllkc = "0" ;
			record.yifyhlzl = "0" ;
			record.jiaofzl = "0" ;
			record.zhongzzl = "0" ;
			
			$('#form_lingjxhd').form('fillRecord', $.extend({}, record));
			$("#form_lingjxhd").form("open","增加");
			
			$('#record_usercenter').removeClass("disabled").removeClass('readonly');
			$('#record_usercenter input:first').removeAttr("disabled");
			
			$('#record_lingjbh').removeClass("disabled").removeClass('readonly').find(".textInput").attr("disabled",false);
			$('#record_xiaohdbh').removeClass("disabled").find(".textInput").attr("disabled",false);
		}
		//修改按钮
		function func_button_edit() {
			
			$('#form_lingjxhd').form("clear");//清除弹出窗口的数据
			
			$('#form_lingjxhd').removeClass('operant-add');//增加的operant为1，修改的operant为2
			
			var record = $("#grid_lingjxhd").grid("getSelectedRecords")[0];//选中的行的数据
			var param = jQuery.param(record);   //转化成//a[one]=1&a[two]=2&a[three]=3&b[]=1&b[]=2&b[]=3格式
			$.sdcui.ajaxUtil.ajax({
				url : "../xuqjs/getLingjxhd.ajax",
				data:param,
				success : function(result) {
					var record = {} ;
					record.usercenter = '${usercenter}';   
					record.wulbh = "0000" ;
					record.shunxglbz = "Y" ;
					record.zidfhbz = "N" ;
					record.xianbyhlx = "K" ;
					record.yancsxbz = "P" ;
					record.beihdbz = "Y" ;
					record.xianbllkc = "0" ;
					record.yifyhlzl = "0" ;
					record.jiaofzl = "0" ;
					record.zhongzzl = "0" ;
					
					$('#form_lingjxhd').form('fillRecord', $.extend({}, record));
					var r = result.result ;
					if("2" == r.biaos){
						$('#record_shengxr').removeClass("disabled").removeClass('readonly');
						$('#record_shengxr').find(".textInput").attr("disabled",false);
					}else{
						$('#record_shengxr').addClass("disabled").addClass('readonly');
						$('#record_shengxr').find(".textInput").attr("disabled","disabled");
					}
					$('#form_lingjxhd').form('fillRecord', $.extend({}, r));
					$("#form_lingjxhd").form("open","修改");
				}
			});
			
			
			
			
				
// 			$('#form_shengcx').form('fillRecord', $.extend({}, record));
			
// 			$('#fenpq').grid('clearBatchData');
			
// 			$('#fenpq').grid('reload',false,[],true);
			
// 			$("#form_shengcx").form("open","${i18n.update}");
			
			
		}
		//空格查询
		function grid_lingjxhd_beforeSubmit() {
			$("#lingjxhd_lingjbh").fieldValue(trim($("#lingjxhd_lingjbh").fieldValue()));
			$("#lingjxhd_shengcxbh").fieldValue(trim($("#lingjxhd_shengcxbh").fieldValue()));
			$("#lingjxhd_fenpqbh").fieldValue(trim($("#lingjxhd_fenpqbh").fieldValue()));
		}
		
		
		//点击均分比例触发的函数
		function func_button_junfbl(){
			 var roles = $('#grid_lingjxhd').grid('getSelectedRecords');
			 if(roles.length==0){
			 		alert("请至少选择一条记录");
			 		return false;
			 }
			 var params = [];
			 for(var i = 0 ; i < roles.length ; i++ ){
				 params.push("list["+i+"].usercenter="+roles[i].usercenter);
				 params.push("list["+i+"].lingjbh="+roles[i].lingjbh);
				 params.push("list["+i+"].xiaohdbh="+roles[i].xiaohdbh);
				 params.push("list["+i+"].wulbh="+roles[i].wulbh);
				 params.push("list["+i+"].fenpqbh="+roles[i].fenpqbh);
				 params.push("list["+i+"].shengcxbh="+roles[i].shengcxbh);
				 params.push("list["+i+"].gongybs="+roles[i].gongybs);
				 params.push("list["+i+"].xiaohbl="+roles[i].xiaohbl);
				 params.push("list["+i+"].tiqjsxhbl="+roles[i].tiqjsxhbl);
				 params.push("list["+i+"].yuanxhdbh="+roles[i].yuanxhdbh);
				 params.push("list["+i+"].shengxr="+roles[i].shengxr);
				 params.push("list["+i+"].jiesr="+roles[i].jiesr);
				 params.push("list["+i+"].biaos="+roles[i].biaos);
			 }
			 $.sdcui.ajaxUtil.ajax({
					url:'junfenbilixiaohd.ajax',
					data:params.join('&'),
					success:function(result){
						if(typeof result.success=="undefined"||result.success!==false){
							$("#grid_lingjxhd").grid('reload');
						}
					}
				});
		}
		
		
		//点击失效触发的函数
		function func_button_shixiao(){
			 var roles = $('#grid_lingjxhd').grid('getSelectedRecords');
			 if(roles.length==0){
			 		alert("请至少选择一条记录");
			 		return false;
			 }
			 var params = [];
			 for(var i = 0 ; i < roles.length ; i++ ){
				 params.push("list["+i+"].usercenter="+roles[i].usercenter);
				 params.push("list["+i+"].lingjbh="+roles[i].lingjbh);
				 params.push("list["+i+"].xiaohdbh="+roles[i].xiaohdbh);
				 params.push("list["+i+"].wulbh="+roles[i].wulbh);
				 params.push("list["+i+"].fenpqbh="+roles[i].fenpqbh);
				 params.push("list["+i+"].shengcxbh="+roles[i].shengcxbh);
				 params.push("list["+i+"].gongybs="+roles[i].gongybs);
				 params.push("list["+i+"].xiaohbl="+roles[i].xiaohbl);
				 params.push("list["+i+"].tiqjsxhbl="+roles[i].tiqjsxhbl);
				 params.push("list["+i+"].yuanxhdbh="+roles[i].yuanxhdbh);
				 params.push("list["+i+"].shengxr="+roles[i].shengxr);
				 params.push("list["+i+"].jiesr="+roles[i].jiesr);
				 params.push("list["+i+"].biaos="+roles[i].biaos);
			 }
			 $.sdcui.ajaxUtil.ajax({
					url:'shixiaoxiaohd.ajax',
					data:params.join('&'),
					success:function(result){
						if(typeof result.success=="undefined"||result.success!==false){
							$("#grid_lingjxhd").grid('reload');
						}
					}
				});
		}
		
		//顺序管理标识
		$.sdcui.serverConfig.convertArray['shunxglbz'] = {
				'Y' : 'Y',
				'N' : 'N'
		};
		
		//前后车标识
		$.sdcui.serverConfig.convertArray['qianhcbs'] = {
			'-1' : '${i18n.qianc}',
			'0' : '${i18n.dangqc}'
		};
		
		//自动发货标识
		$.sdcui.serverConfig.convertArray['zidfhbz'] = {
			'Y' : 'Y',
			'N' : 'N'
		};
		
		//是否延迟上线
		$.sdcui.serverConfig.convertArray['yancsxbz'] = {
			'I' : 'I',
			'P' : 'P'
		};
		
		//线边要货类型
		$.sdcui.serverConfig.convertArray['xianbyhlx'] = {
			'K' : 'K',
			'R' : 'R'
// 			'P' : 'P',
// 			'S' : 'S',
// 			'G' : 'G'
		};
		
		//是否产生备货
		$.sdcui.serverConfig.convertArray['beihdbz'] = {
				'Y' : 'Y',
				'N' : 'N'
		};
		
		//PDS拆分标志
		$.sdcui.serverConfig.convertArray['pdsbz'] = {
			'1' : '${i18n.tongb}',
			'2' : '${i18n.jip}',
			'3' : '${i18n.anx}'
		};
		
		//标识
		$.sdcui.serverConfig.convertArray['biaos'] = {
			'1' : '${i18n.youx}',
			'0' : '${i18n.wux}',
			'2' : '${i18n.xinj}'
		};
		
		//工艺标识
		$.sdcui.serverConfig.convertArray['gongybs'] = {
			'1' : '${i18n.youx}',
			'0' : '${i18n.wux}'
		};
		
		//保存按钮
		function func_button_save() {
			if($("#grid_lingjxhd").grid("isEditedCell")){
				$('#grid_lingjxhd').grid('saveRows');
			}
		}
		
		//行编辑保存后的方法
		function afterSaveRows(result){
			if(false == result.success){
				return false;
			}
			return true;
		}
		
		
		//导出数据
		function func_button_download(){
			
			var usercenter = trim($('#lingjxhd_usercenter').fieldValue());
			var lingjbh = trim($("#lingjxhd_lingjbh").fieldValue());
			var shengcxbh = trim($('#lingjxhd_shengcxbh').fieldValue());
			var biaos = $('#lingjxhd_biaos').fieldValue();
			var fenpqbh = $('#lingjxhd_fenpqbh').fieldValue();
			var gongybs = $('#lingjxhd_gongybs').fieldValue();
			
			var record = {'usercenter':usercenter,'lingjbh':lingjbh,'shengcxbh':shengcxbh,'biaos':biaos,'fenpqbh':fenpqbh,'gongybs':gongybs};
			
			$.sdcui.pageUtils.goPage({
				url : '../xuqjs/downloadLingjxhd.do',
				record : record,
				mode : 'form',
				beforeSubmit : function(){
					return true;
				}
		   });
		}
		
		
		
		//失效按钮
		function func_button_invalidate(){
			var record = $("#grid_lingjxhd").grid("getSelectedRecords")[0];//选中的行的数据
			
			var params = [];
			params.push("usercenter="+record.usercenter);	//用户中心
			params.push("lingjbh="+record.lingjbh);			//零件编号
			params.push("xiaohdbh="+record.xiaohdbh);		//消耗点编号
			params.push("biaos=0");		//标识
			
			if(confirm("${i18n.quersx}")){
				if('1' == record.biaos){
					 $.sdcui.ajaxUtil.ajax({
				 	 	   url:"../xuqjs/removeLingjxhd.ajax",
				 	 	   data:params.join('&'),
				 	       success:function (result){
				 	    	    alert("${i18n.shixcg}");
				 	    		$("#grid_lingjxhd").grid("reload");
				 	       }
				     	});
				}else if('2' == record.biaos){
					alert("${i18n.xinjbnsx}");
				}else{
					alert("${i18n.shujysx}");
				}
			}
		}
		
		
		/*消耗比例*/
		function xiaohbl_closeEvent(){
			var cell = this.col.cell;
			var rowElement = cell.parent("tr:first");
			
			var usercenterIndex = $('td.usercenter:first').prevAll().length;//结束日期
			var usercenter = trim(rowElement.find('td:eq(' + usercenterIndex + ')').text());
			
			var lingjbhIndex = $('td.lingjbh:first').prevAll().length;//结束日期
			var lingjbh = trim(rowElement.find('td:eq(' + lingjbhIndex + ')').text());
			
			var xiaohdbhIndex = $('td.xiaohdbh:first').prevAll().length;//结束日期
			var xiaohdbh = trim(rowElement.find('td:eq(' + xiaohdbhIndex + ')').text());

			var jiesrIndex = $('td.jiesr:first').prevAll().length;//结束日期
			var jiesr = trim(rowElement.find('td:eq(' + jiesrIndex + ')').text());
			
			var shengxrIndex = $('td.shengxr:first').prevAll().length;//消耗点起始日
			var shengxr = trim(rowElement.find('td:eq(' + shengxrIndex + ')').text());
			
			var xiaohblIndex = $('td.xiaohbl:first').prevAll().length;//消耗比例
			var xiaohbl = rowElement.find('td:eq(' + xiaohblIndex + ')').text();
			
			var shengxrs = shengxr.split("-");//消耗点起始日
			var shengxr0 = new Date(shengxrs[0],shengxrs[1],shengxrs[2]);
			
			var jiesrs = jiesr.split("-");//结束日期
			var jiesr0 = new Date(jiesrs[0],jiesrs[1],jiesrs[2]);
			
			var currentDate = new Date();//当前电脑时间
			var year = currentDate.getFullYear();
			var month = currentDate.getMonth()+1;
			var day = currentDate.getDate();
			var current = new Date(year,month,day);
			
			if(null != shengxr0 && "" != shengxr0 && shengxr0.getTime() > current.getTime()){
				if(0 != xiaohbl){
					alert("${i18n.xiaohbl0}");
					return false;
				}          
			}
			
			if(null != jiesr0 && "" != jiesr0 && jiesr0.getTime() < current.getTime()){
				if(0 != xiaohbl){
					alert("${i18n.xiaohbl0}");
					return false;
				}          
			}
			
			return true;
		}
		
				
   /*
	*PDS生效/失效时间
	*/
	function func_button_pdssj(){
	    var params = [];
		var param = $('#grid_lingjxhd').grid('getSelectedRecords');//获取选中的零件消耗点,仅可为一条
		if(param.length != 1){
		   alert("请选中一条仅且一条数据，进行操作！");
			return false;
		}
		 $("#pds_usercenter").fieldValue(param[0].usercenter);//用户中心
		 $("#pds_lingjbh").fieldValue(param[0].lingjbh);//零件编号
		 $("#pds_xiaohdbh").fieldValue(param[0].xiaohdbh);//消耗点编号
		 $('#form_pdssj').form('open');
		 params.push('pds.usercenter='+param[0].usercenter);//用户中心
		 params.push('pds.lingjbh='+param[0].lingjbh);//零件编号
		 params.push('pds.xiaohdbh='+param[0].xiaohdbh);//消耗点编号
		 $('#grid_pds').grid('reload');//刷新grid
	}
		
		//导出模板
		function func_button_mobxz(){
			
			$.sdcui.pageUtils.goPage({
				url : '../xuqjs/downloadLingjxhdMob.do',
				mode : 'form',
				beforeSubmit : function(){
					return true;
				}
		   });
		}
		
		//新增及更新模板
		function func_button_mobxzxhd(){
			
			$.sdcui.pageUtils.goPage({
				url : '../xuqjs/downloadLingjxhdInsertorUpdate.do',
				mode : 'form',
				beforeSubmit : function(){
					return true;
				}
		   });
		}
	</script>
</t:html>