<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="">
<head>
<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
<style type="text/css">
#main{
 height: auto;
 width:100%;
}

#left {
 float: left;
 height: auto;
 width: 65%;
 
}
#right {
 float: right;
 height: auto;
 width:35%;
}





</style>
</head>

	<t:page i18n="i18n.fj.pzfj" >
<script type="text/javascript">

//运输商-路线组
var cys_lxz = null;
//查看明细数据
var info = [];
//要车明细数据
var yaocmx = [];
//要车计划
var yaocjh = [];
//分配的车辆数量
var fpcl = [];


//数据初始化
$(document).ready(function(){
	gysInit();	
});

//初始化运输商-路线组	
function gysInit(){
	//通过ajax得到list
	var params = [];
	params.push("USERCENTER=${USERCENTER}");
	params.push("YAOCJHXH=${YAOCJHXH}");
	 $.sdcui.ajaxUtil.ajax({
	 	        url:"${ctx}/fj_peizai/selectYaocjhYyS.ajax",
	 	      	data:params.join("&"),
	            success:function (result){
	            	//运输商-路线组
	            	cys_lxz = result.cysLxz;
	 	        }
	       });	 
}


//解析选 中的record,得到车辆型号，路线组，车辆数目
function praseRecord(){
	
	 var data = new Object();
     //路线组
     data.lxz = new Array();
     //车辆型号
     data.cx = new Array();
     //数量
     data.cxsl = new Array();
     
	var records = $("#yaocejh").grid("getSelectedRecords");
	$.each(records,function(i,o){
		wrapRecord(data,o);
	});
	
	return data;
}

//封装数据
function wrapRecord(data,record){
      //保存路线组
      if(data.lxz.join(",").indexOf(record.YUNSLX)==-1){
    	  data.lxz.push(record.YUNSLX);
      }
      //保存车辆型号
      if(data.cx.join(",").indexOf(record.JIHCX)==-1){
    	  data.cx.push(record.JIHCX);
      }
      
      //保存车辆数量
      var _cx = new Array();
     $.each(data.cxsl,function(i,o){
    	  _cx.push(o.cx);
     });
     //如果不存在此车辆型号
      if(_cx.join(",").indexOf(record.JIHCX)==-1){
    	  var o = new Object();
    	   o.cx = record.JIHCX;
    	   o.sl = 1;
    	   data.cxsl[ data.cxsl.length] = o;
      }
    //存在嘛,则车辆数量加1
      else{
    	  $.each(data.cxsl,function(i,o){
        	  if(o.cx==record.JIHCX){
        		  o.sl = o.sl+1;
        	  }
         });
      } 
     
}




/**验证此运输商是否有此路线**/
function hasLxz(cys,data){
	
	//得到此运输商的所有路线
	var lxs = null;
	$.each(cys_lxz,function(i,o){
		if(i==cys){
			lxs = o.join(",");
			return;
		}
	});
	
	//判断是否有此路组组
	var hasLxz = false;
	$.each(data.lxz,function(i,o){
		//如果有此路线组
		if(lxs.indexOf(o)>=0){
			hasLxz =true;
		}else{
			hasLxz =false;
			return false ;
		}
	});
	
	if(!hasLxz){
		alert("${i18n.yaocemx_yunss_notxianlz }");
	}
	
	return hasLxz;
}

//判断是否有此车辆型号
function hasCx(data,cysbh,cysmc){
	
	//此运输商下的所有车辆型号
	var cxs= null;
	
	//得到所有的record
	var records = $("#yunssList").grid("getRecords");
	var cxArray = new Array();
	$.each(records,function(i,o){
		cxArray.push(o.CHEX);
	});
	
	cxs = cxArray.join(",");
	
	//判断是否有此车辆型号
	var hasCx = false;
	$.each(data.cx,function(i,o){
		//如果有此路线组
		if(cxs.indexOf(o)>=0){
			hasCx =true;
		}else{
			hasCx =false;
			return false;
		}
	});
	
	if(!hasCx){
		hasCx = confirm("${i18n.yaocemx_notxingh }") ;
		if(hasCx){
			var recordAll = $("#yunssList").grid("getRecords");
			$.each(data.cxsl,function(i,o){
				//如果有此路线组
				if(cxs.indexOf(o.cx)==-1){
					var obj =new Object();
					obj.GONGSMC = cysmc;
					obj.cys = cysbh;
					obj.CHEX = o.cx;
					obj.FENPSL = 0;
					obj.SHUL = 0;
					recordAll.push(obj);
				}
			});
			$("#yunssList").grid("parseRecords",recordAll);
		}
		
	}
	return hasCx;
}


//判断车辆数量
function hasClsl(data){
	//得到所有的record
	var records = $("#yunssList").grid("getRecords");
	
	//车辆数量是否不足
	var bool = true;
	
	$.each(data.cxsl,function(i,o){
		
		$.each(records,function(j,k){
			 if(k.FENPSL==undefined){  //此处加判断，没有分配前FENPSL为undefined，分配的FENPSL有值，每次将分配的值进行累加，最后判断是否满足要求 hzg 2012-8-9
				 fpsl = o.sl;
			 }else{
				 fpsl = o.sl+(k.FENPSL*1);
			 }
			if(o.cx==k.CHEX){
				if((k.SHUL*1)-fpsl<0){
					bool = false;
					return false;
				}
			}
		});
		if(!bool){
			return;
		}
		
	});
	
	if(!bool){
		bool = confirm("${i18n.yaocemx_shenb_notenough }") ;
	}
	
	return bool;
	
}



//分配 
function fp(_cysbh,_cysmc){
	
	//解析数
	var data  = praseRecord();
	
	//得到 运输商
	var  cys = _cysbh; 
	
	
	//分配前得到选 中的结果集
	var records = $("#yaocejh").grid("getSelectedRecords");
	if (records==null||records.length==0) {
		alert("${i18n.yaocemx_xuanz_yaocmx }");
		return;
	}
	
	//判断是否重复分配
	for(i=0;i<records.length;i++){
		  if(records[i].GCBH!=null&&records[i].GCBH.length>0){
			    alert("${i18n.yaocemx_dontagain_fenp }");
				$('.youi-panel .grid-content .grid-fixed tr.selected').removeClass('selected');
				$('.youi-panel .grid-content .grid-scroll tr.selected').removeClass('selected');
				return;
			}
	}
	
	
	//验证运输商是否有此路线组
	if(!hasLxz(cys,data)){
		return;
	}
	
	//验证运输商是否有此车辆型号
	if(!hasCx(data,_cysbh,_cysmc)){
		return;
	}
	
	//验证车辆数量是否充足 
	if(!hasClsl(data)){
		return;
	}

	//向要车明细grid中填写运输商
	$.each($('#yaocejh .grid-content .grid-scroll tr.selected'),function(i,n){
		$($(n).find('td')[2]).html(_cysbh);
		$($(n).find('td')[3]).html(_cysmc);
	});
	
	
	
	//分配后得到选 中的结果集
	var recordsFP = $("#yaocejh").grid("getSelectedRecords");
	$.each(recordsFP,function(i,o){
		//i.GCBH = _cysbh;
		info.push(o);
		yaocmx.push("list[" + i + "].ID=" + o.ID);
		yaocmx.push("list[" + i + "].JIHCX=" + o.JIHCX);
		yaocmx.push("list[" + i + "].GCBH=" + _cysbh);
	});
	
	
	//分配车型数量
	 yunssFeipsl(data.cxsl);
	
	//记录分配的车辆
	 cacheFpCl(cys);
	
}

//分配车型数量
function yunssFeipsl(cxsl){
	  //获得运输商车型申报数量集合
  	var yunssRecords = $("#yunssList").grid("getRecords");
    	$.each(cxsl,function(i,o){
      	  $.each(yunssRecords,function(k,m){
    		 if(o.cx==m.CHEX){
    			 var i = $($("#yunssList .grid-content .grid-table tr#"+m.CHEX+".row").find('td')[2]).html()*1;
        		$($("#yunssList .grid-content .grid-table tr#"+m.CHEX+".row").find('td')[2]).html(o.sl+i);
        		return false;
    		 }
    	  });
  	});
	
}



//删除缓存中已选择的要车明细
function func_button_sq(){
	var records = $("#fp_grid").grid('getSelectedRecords');
	/*是否有选中记录*/
	if (records==null||records.length==0) {
		alert("${i18n.yaocemx_notselect_item }");
		return;
	}
	
 if(confirm("${i18n.yaocemx_whether_delete }")){

	var ids =  {};
	var chex = {};
	$.each(records,function(i,n) {
		ids[i] = n['ID'];
		chex[n['JIHCX']] = (chex[n['JIHCX']]||0)+1;
	});
	
	
	
	
	/*置空明细表*/
	$.each(records,function(i,o){
		$.each(info,function(j,t){
			if(o.ID==t.ID){
				 info.splice(j,1);
				 return false;
				}
		});
	});
	
	
	//清除已选中的
	$('#yaocejh .grid-content .grid-fixed tr.selected').removeClass('selected');
	$('#yaocejh .grid-content .grid-scroll tr.selected').removeClass('selected');  
	$('#yaocejh').grid('setSelectedRecords',records);
	
	
	var recordsAll = $("#yaocejh").grid('getRecords');
	var _tem_records = [];
	var radioValue = $('input:radio[name="xuanz"]:checked').val(); 
	$.each(recordsAll,function(i,o){
		if(o.GCBH==radioValue){
			_tem_records.push(o);
		}
	});
	
	//删除刷新车辆数量
	refreshClzy(radioValue,chex);
	
	
/* 	//运输商编号
	var gysbh = _tmp_records[0].GCBH;
	//车辆数量
	var cxsl = _tmp_records.length; */
		
	$.each($('#yaocejh .grid-content .grid-scroll tr.selected'),function(i,n){
		$($(n).find('td')[2]).html("");
		$($(n).find('td')[3]).html("");
	});
	
	
	
	//删除缓存中的要车明细数据
	$.each(_tem_records,function(i, o){
		 var v = o;
		 var vv= "].ID=" + o.ID;
		$.each(yaocmx,function(j,r) {
				if(r.indexOf(vv)>0){
					yaocmx.splice(j,1);
					yaocmx.splice(j,1);
					yaocmx.splice(j,1);
					return false;
				}
		});
	});
	
	/*移除选中的*/
	$("#fp_grid").grid('deleteRow');
	
	//更新yunssGrid中的车型数量
	$.each(chex, function(k,v){
		var shul = $($("#yunssList .grid-content .grid-table tr#"+k+".row").find('td')[2]).html();
		$($("#yunssList .grid-content .grid-table tr#"+k+".row").find('td')[2]).html(parseInt(shul)-v);
		
	});
 }
}

	//渲染事件，向运输商列表选择列中加'radio'
	var isSelect = function (v) {
		return '<input type="radio" name="xuanz" value=\''+v+'\' onclick="javascript:radioClick(\''+v+'\')" />';
		
	}
	
	//运输明细查询
	function radioClick(v){
		$("#preYss_YUNSSBH").fieldValue(v);
		if(!isLoading(v)){
		$("#yunssList").grid("reload");
		}else{
			$.each(fpcl,function (i,o){
				if(o.cys==v){
					//$("#yunssList").grid("removeAll");
					$("#yunssList").grid("parseRecords",o.clzy);
				}
				
			});
		}
		
	}
	
//点击'分配'按钮分配运输商
	function func_button_feipBtn(){
	
		var radios=$('input:radio[name="xuanz"]'); 
		var val=$('input:radio[name="xuanz"]:checked').val(); 
		if(val==null){
			alert("${i18n.yaocemx_xuanz_yunss }");
			return;
		}
		for ( var i = 0; i < radios.length; i++) {
			if (radios[i].checked == true) {
				var rowElemt = $(radios[i]).parent('td:first').parent('tr:first');
				gysmc = rowElemt.find('td:eq(1)').text();
				gysbh = rowElemt.find('td:eq(2)').text();
				fp(gysbh,gysmc);
			}
		}	
		
		//去掉已选中项
		$('.youi-panel .grid-content .grid-fixed tr.selected').removeClass('selected');
		$('.youi-panel .grid-content .grid-scroll tr.selected').removeClass('selected');
	} 
	
//查看已选择的要车明细
	function func_button_viewBtn(){
		var rowData = [];
		var radios=$('input:radio[name="xuanz"]'); 
		var val=$('input:radio[name="xuanz"]:checked').val(); 
		if(val==null){
			alert("${i18n.yaocemx_xuanz_yunss }");
			return;
		}
		
		if(info.length==0){
			alert("${i18n.yaocemx_notfenp }");
			return;
		}
		
		for ( var i = 0; i < radios.length; i++) {
			if (radios[i].checked == true) {
				var rowElemt = $(radios[i]).parent('td:first').parent('tr:first');
				gysbh = rowElemt.find('td:eq(2)').text();
				$.each(info,function (i,o){ 
					   if(o.GCBH==gysbh) {
							rowData.push(o);
					   }
				});
			}
		}	
			$('#fp_grid').grid('parseRecords',rowData);  
			$("#form_fp").form("open");
	}
	

//确认分配
	function func_button_fp() {
		
		var params =[];
		params.push("YAOCJHXH=" + $("#yc_YAOCJHXH").fieldValue());
		//params.push("YUNSSBM=" + $("#preYss_YUNSSBH").fieldValue());
		var yaocmx = [];
		$.each(info,function(i,o){
		yaocmx.push("list[" + i + "].ID=" + o.ID);
		yaocmx.push("list[" + i + "].JIHCX=" + o.JIHCX);
		yaocmx.push("list[" + i + "].GCBH=" + o.GCBH);
	          });
		
		
		
		var p = params.join('&') + '&' + yaocmx.join('&');
		
		//alert(p);
		
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/fj_peizai/updateYaoCMx.ajax",
			data : p,
			success : function(result) {
				//刷新表格
				//$("#yaocejh").grid('submit');
				//刷新车辆资源
				//gysInit();
				//查看数据
				info = [];
				yaocmx = [];
				if(result.result.success=='true'){
					//返回上一级页面
					func_button_back();
				}
				
			}
		});

		return;
	}
	
	
//删除要车明细
function func_button_del(){
	var records =  $("#yaocejh").grid("getSelectedRecords");
	if (records==null||records.length==0) {
		alert("${i18n.yaocemx_xuanz_yaocmx }");
		return;
	}
	
	if(!hasYunss(records)){
		alert("${i18n.yaocemx_dont_delete }");
		return;
	}
	if(confirm("${i18n.yaocemx_whether_delete }")){
		var params = [];
		$.each(records,function(i,o){
			params.push("list[" + i + "].ID=" + o.ID);
			params.push("list[" + i + "].JIHCX=" + o.JIHCX);
		});
			params.push("YAOCJHXH=" + $("#yc_YAOCJHXH").fieldValue());
		$.sdcui.ajaxUtil.ajax({
			url : "${ctx}/fj_peizai/deleteYaoCMx.ajax",
			data :params.join('&'),
			success : function(result) {
				//刷新表格
				$("#yaocejh").grid('submit');
			}
		});
	}
	
	
}

//删除后加载分配的运输商
function loadYunss(){
	if(info.length==0){
		return false;
	} 
	
	$.each(info,function(i,n){
		$.each($('#yaocejh .grid-content .grid-scroll .grid-table tr.row'),function(j,o){
			if(n.ID==$(o).attr('id')){
				$($(o).find('td')[2]).html(n.GCBH);
				$($(o).find('td')[3]).html(n.GONGSMC);
			}
		});
		
	}); 
}


//验证所选记录是否已分配运输商
function hasYunss(records){
	var hasYunss = false;
	for(var i=0;i<records.length;i++){
		//如果没有运输商
		if(records[i].GCBH==undefined){
			hasYunss =true;
		}else{
			hasYunss = false;
			return false;
		}
	}
	return hasYunss;
	
}


	
//数据格试化
	var isPrint = function(v) {
		switch (v * 1) {
		case 1:
			return "${i18n.ylzt1 }";
		case 2:
			return "${i18n.ylzt2 }";
		case 3:
			return "${i18n.ylzt3 }";
		case 4:
			return "${i18n.ylzt4 }";
		default:
			return v;

		}
	}
	
	
/***分配车辆数量***/	
function cacheFpCl(cys){
	fpcl = [];
	var obj = new Object();
	obj.cys=cys;
	obj.clzy = new Array();
	var recordsAll = $("#yunssList").grid("getRecords");
	$.each(recordsAll,function(i,o){
		o.cys = cys;
		obj.clzy.push(o);
	});
	fpcl.push(obj) ;
}

/***刷新车辆数量**/
//删了时，刷新表格
function refreshClzy(cys,chex){
	var bool = false;
	$.each(fpcl ,function(i,o){
		if(cys==o.cys){
			o.clzy = $("#yunssList").grid("getRecords") ;
			updateYunssCXSL(o.clzy , chex);
			return false;
		}
	});	
}

//更新yunssGrid中的车型数量  hzg 2012-8-9
function updateYunssCXSL(clzy , chex){
		$.each(clzy,function(j,p){
			$.each(chex,function(k,v){
				if(p.CHEX==k){ //车型相同，减删除的车辆数
					p.FENPSL = (p.FENPSL*1)-v;
				}
			});
		});
		return clzy;
}


/**检查是否已分配***/
function isLoading(cys){
	 var bool = false;
	 $.each(fpcl,function(i,o){
					 if(cys==o.cys){
						 bool = true;
					 	return 
					 }
	 		});
	 return bool;
}



</script>

<div id="main">
<!-- 要车明细列表 -->
		<div id="left">
			<t:grid id="yaocejh" idKeys="ID" caption="${i18n.fengpyaocmx_title }"
				src="/fj_peizai/selectYaocjhMx.ajax" usePager="false"
				add="NOT" edit="NOT" remove="NOT" scrollHeight="350"  afterParse="loadYunss"
				save="NOT" showCheckbox="true" submit="NOT" reset="NOT">
				<t:fieldLayout id="yaocjh_select" prefix="yc" >
					<t:fieldHidden property="USERCENTER"></t:fieldHidden>
					<t:fieldHidden property="YAOCJHXH" defaultValue="${YAOCJHXH}"></t:fieldHidden>
				</t:fieldLayout>
 
				<t:gridCol property="JIHCX" type="text" width="35" caption="${i18n.chex }"></t:gridCol>
				<t:gridCol property="YUNSLX" type="text" width="70" caption="${i18n.yunslx }"></t:gridCol>
				<t:gridCol property="GCBH" type="text" caption="${i18n.yunssbm }"></t:gridCol>
				<t:gridCol property="GONGSMC" type="text" caption="${i18n.yunss }"></t:gridCol>
				<t:gridCol property="DAOCSJ" type="text" width="110"  caption="${i18n.ycsj }"></t:gridCol>
				<t:gridCol property="FAYSJ" type="text" width="110"  caption="${i18n.fysj }"></t:gridCol> 
				
			</t:grid>
		</div>

<!-- 运输商列表 -->	
	<div id="right">
		<t:grid id="feip_table" add="NOT" idKeys="GCBH" edit="NOT" remove="NOT" usePager="false"
					save="NOT" submit="NOT" src="/fj_peizai/selectYunss.ajax"  scrollHeight="150"
					 reset="NOT" caption="${i18n.yunsslb_title }">
				<t:fieldLayout id="yunss_select" prefix="yss" >
					<t:fieldHidden property="YAOCJHXH" defaultValue="${YAOCJHXH}"></t:fieldHidden>
				</t:fieldLayout>
			<t:gridCol property="GCBH" renderer="isSelect" width="30" caption="${i18n.xuanz }"></t:gridCol>
			<t:gridCol property="GONGSMC" type="text" width="120" caption="${i18n.yunss }"></t:gridCol>
			<t:gridCol property="GCBH" type="text" width="60" caption="${i18n.yunssbm }"></t:gridCol>
		</t:grid>
		
		<t:grid id="yunssList" add="NOT" idKeys="CHEX" edit="NOT"  scrollHeight="135"
		        remove="NOT" usePager="false" src="/fj_peizai/selectYunssMx.ajax" load="false"
					save="NOT" submit="NOT" reset="NOT">
				<t:fieldLayout id="yunss" prefix="preYss">
					<t:fieldHidden property="YUNSSBH"></t:fieldHidden>
					<t:fieldHidden property="SHENBSJ" defaultValue="${YAOCJHXH}"></t:fieldHidden>
				</t:fieldLayout>
			<t:gridCol property="GONGSMC" type="text"  caption="${i18n.yunss }"></t:gridCol>
			<t:gridCol property="CHEX" type="text" width="50" caption="${i18n.chex }"></t:gridCol>
			<t:gridCol property="FENPSL" type="text" width="60"  caption="${i18n.fenpsl }"></t:gridCol>
			<t:gridCol property="SHUL" type="text" width="60"  caption="${i18n.shenbsl }"></t:gridCol>
		
		<t:button caption="${i18n.fenp }" name="feipBtn"></t:button>
		<t:button caption="${i18n.chak }" name="viewBtn"></t:button>
		</t:grid>
		
	</div> 
</div>
	<table align="center">
		<tr align="center">
		<td align="center">
				<div class="youi-button active-0" id="button_fd">
				<div class="right"><div class="center"><a class="fd" href="javascript:onclick=func_button_del();">${i18n.delete }</a>	</div></div>
				</div>
			</td>
			<td align="center">
				<div class="youi-button active-0" id="button_fp">
				<div class="right"><div class="center"><a class="fp" href="javascript:onclick=func_button_fp();">${i18n.quer }</a>	</div></div>
				</div>
			</td>
			<td align="center">
				<div class="youi-button active-0" id="button_back">
				<div class="right"><div class="center"><a class="fh" href="javascript:onclick=func_button_back();">${i18n.btnBack }</a></div></div>
				</div>
			</td>
		</tr>
		</table> 


	<!-- 明细 -->
	<t:form dialog="true"  reset="NOT" submit="NOT"  id="form_fp" caption="${i18n.mingx_title }" >
		<t:grid id="fp_grid" idKeys="ID" load="false" width="600"
				usePager="false" showNum="false"
				editable="false" editModel="false" add="NOT" edit="NOT" remove="NOT"
				save="NOT" showCheckbox="true" submit="NOT" reset="NOT">
				<t:gridCol property="JIHCX" type="text" caption="${i18n.celxh }"></t:gridCol>
				<t:gridCol property="YUNSLX" type="text" caption="${i18n.yunslx }"></t:gridCol>
				<t:gridCol property="GONGSMC" type="text" caption="${i18n.yunss }"></t:gridCol>
				<t:gridCol property="DAOCSJ" type="text" width="120" caption="${i18n.ycsj }"></t:gridCol>
				<t:gridCol property="FAYSJ" type="text" caption="${i18n.fysj }"></t:gridCol>  
		</t:grid> 
			<t:button caption="${i18n.delete }" name="sq"  active="2"></t:button>
	</t:form>	


</t:page>
<script type="text/javascript" >
	function func_button_back(){
		window.location.href="${ctx}/fj_peizai/fenpycjhForJsp.do?menu.selected=4028819e34f0a6a40134f0a99e160003";
	}

</script>
</t:html>