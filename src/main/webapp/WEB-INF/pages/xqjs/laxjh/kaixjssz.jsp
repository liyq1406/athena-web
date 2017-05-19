<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<t:html>
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		<link type="text/css" rel="stylesheet" 
			href="<c:url value="/styles/authority/role.css"/>"/>
	</head>
	<t:page  i18n="i18n.xqjs.laxjh.kaixjssz">
		<t:grid id="grid_kaixjssz" 
			idKeys="xuqbc"
			caption="${i18n.title_index}" 
			src="queryKaixjs.ajax"
			add="NOT"
			edit="NOT"
			remove="NOT" showNum="true">
			<t:fieldLayout>
				<t:fieldSelect width="150"  property="xuqly" caption="${i18n.xuqly}">
					<t:fieldOption value="DKS" text="${i18n.dks}"></t:fieldOption>
					<t:fieldOption value="CLV" text="${i18n.clv}"></t:fieldOption>
					<t:fieldOption value="ZCJ" text="${i18n.zcj}"></t:fieldOption>
					<t:fieldOption value="ZCP" text="${i18n.zcp}"></t:fieldOption>
				</t:fieldSelect>
			</t:fieldLayout>
			<t:gridCol property="xuqbcradio" width="40" caption="${i18n.sel}" renderer="createRadio" />
			<t:gridCol property="xuqbc" width="200" caption="${i18n.xuqbc}"  type="link"/>
			<t:gridCol property="xuqcfsj" width="200" caption="${i18n.xqcfsj}" />
			<t:gridCol property="xuqly" width="200" caption="${i18n.xuqly}" convert="xuqly"/>
			<t:gridCol property="beiz" caption="${i18n.beiz}" />
		</t:grid>
		<t:form id="form_kaixjssz" submit="NOT" reset="NOT" action="executeKaixLingjbj.do">
			<t:fieldLayout columns="3">
			<t:fieldHidden property="xuqbc"></t:fieldHidden>
			<t:fieldSelect property="usercenter"  width="100" caption="${i18n.usercenter}"  convert="queryUserCenterMap" notNull="true"></t:fieldSelect>
			<t:fieldSelect property="suanfcl"  width="150" caption="${i18n.suanfcl}" notNull="true">
				<t:fieldOption value="1" text="${i18n.ljpzyx}"></t:fieldOption>
				<t:fieldOption value="2" text="${i18n.zxsjyx}"></t:fieldOption>
			</t:fieldSelect>
			<t:fieldText property="kaixjx"  width="100" caption="${i18n.kaixjx}" notNull="true" maxLength="2" expression="^[0-9]*[1-9][0-9]*$" expressionMessage="请输入正整数!"></t:fieldText>
			<t:fieldText property="anqkc"  width="100" caption="${i18n.anqkc}" maxLength="4"  expression="^[0-9]*[1-9][0-9]*$" expressionMessage="请输入正整数!"></t:fieldText>
			<t:fieldText property="ziyhqrq"  width="100" caption="${i18n.ziyhqrq}" defaultValue="${ziyhqrq}" readonly="true"></t:fieldText>
			</t:fieldLayout>
			<t:button caption="${i18n.next}" name="next"></t:button>
		</t:form>
	</t:page>
	<script type="text/javascript">
		$.sdcui.serverConfig.convertArray['xuqly']={'DKS':'${i18n.dks}','CLV':'${i18n.clv}','ZCJ':'${i18n.zcj}','ZCP':'${i18n.zcp}'};
		  	function initPage(){
		    	getGridHeight();
		   }
		   function func_form_next(){
		    var kaixjs = $('#grid_kaixjssz').grid('getSelectedRecords')[0];
		    if(kaixjs!=''&&kaixjs!=null){
			    var xuqbc = kaixjs.xuqbc;
			    var xuqly = kaixjs.xuqly;
			    if(xuqly=='DKS'){
				     $('#field_xuqbc').fieldValue(xuqbc);
				$("#form_kaixjssz").form("submit");
			    }else{
			    	alert("${i18n.fkdzmxqerror}");
			    }
		    }else{
		    	alert("${i18n.qxzxqbcerror}");
		    }
		    
		   }
		   function form_kaixjssz_afterSubmit(result){
		   	var xuqbc = $('#field_xuqbc').fieldValue();
		   	var kaixjx = $('#field_kaixjx').fieldValue();
		   	var anqkc = $('#field_anqkc').fieldValue();
		   	var suanfcl = $('#field_suanfcl').fieldValue();
		   	var usercenter = $('#field_usercenter').fieldValue();
		   	var wuldgk =  $('#field_wuldgk').fieldValue();
		   	if(result.result=="1"){
		   		window.location.href="selectKaixLingjbj.do?xuqbc="+xuqbc+"&kaixjx="+kaixjx+"&anqkc="+anqkc+"&usercenter="+usercenter+"&suanfcl="+suanfcl+"&wuldgk="+wuldgk;
		   	}else if(result.result=="2"){
		   		alert("${i18n.ljjihydmerror}");
		   	}else if(result.result=="3"){
		   		alert("${i18n.qjcmaoxqrilbcerror}");
		   	}else if(result.result=="5"){
		   		alert("${i18n.ljjihydmjcljxxerror}");
		   	}else if(result.result=="5"){
		   		alert("${i18n.ljjihydmjcljxxerror}");
		   	}else if(result.result=="6"){
				alert("${i18n.yjszzjxerror}");
			}
		   	/**
		   	else if(result.result=="4"){
	   		alert("毛需求所对应的仓库或产线为空，不能进行计算!");
	   		}
		   	**/
		   }
		      /**
	 *链接点击事件
	 */
	function link_xuqbc(event) {
		var event = event || window.event;//原生态的事件处理 
		var element = event.srcElement || event.target;
		var rowDoc = $(element).parents('tr:first')[0];
		var record = $('#grid_kaixjssz').grid('getRecord', rowDoc);//获取当前行对应的记录
	    record.xuqlx = 'Week';
		/**
		 * form跳转模式提交
		 */
		$.sdcui.pageUtils.goPage({
			url : '/maoxq/initCwD.do',//url
			record : record,//
			mode : 'form',
			beforeSubmit : function() {
				//
				return true;
			}
		});
		
	}
	/**
	*列渲染事件,创建Radio	
	*/
	function createRadio(){
		return "<input  name='xuqbcradio'  onclick ='radioClick()' type='radio' />";
	}
		</script>
</t:html>