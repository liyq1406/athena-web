<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.diaoblqr }" >
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
	</head>
	<t:page  i18n="i18n.xqjs.diaobl.diaoblquery" >
	   <t:form id="diaobl_query"  reset="NOT" submit="NOT" >
		<t:grid id="grid_diaobsq" idKeys="usercenter,diaobsqdh,editor,edit_time,zhuangt,banc" caption="${i18n.diaobdlb }"  showNum="true"    showCheckbox="true"
			src="/dfpvdiaobl/select.ajax"  usePager="true"  add="NOT"  remove="NOT"  edit="NOT"  load="false" back="NOT" scrollHeight="310" >
              	
               
				<t:fieldLayout  id="sq_select" prefix="sq" columns="4">
				            <t:fieldSelect property="usercenter" caption="${i18n.usercenter}" width="110">
				   		  		<t:fieldOption value="UL" text="UL"></t:fieldOption>
				   		 	</t:fieldSelect> 
				   		 	<t:fieldText property="lingjbh" caption="${i18n.lingjbh}" maxLength="10" minLength="10" width="165"></t:fieldText>
				              
				              <t:fieldText property="creator"  caption="${i18n.creator }" width="135" ></t:fieldText>
				              <t:fieldText property="chengbzx"  caption="${i18n.chengbzx }" maxLength="5" width="135"></t:fieldText>
				              <t:fieldSelect property="zhuangt" caption="${i18n.zhuangt1 }" convert="queryDblzt"  width="135"></t:fieldSelect>
				              <t:fieldText property="diaobsqdh" caption="${i18n.diaobsqdh}" maxLength="8" minLength="8" ></t:fieldText>
				              <t:fieldCalendar property="diaobsqsj"    format="yyyy-MM-dd"    caption="${i18n.diaobsqsj}" width="165" ></t:fieldCalendar>
				              <t:fieldHidden property="sh" defaultValue="60"></t:fieldHidden>
				 </t:fieldLayout>
				<t:buttons id="sq_submit">
	              	 <t:button  name="export" caption="导出" ></t:button>
	                 <t:button  name="cancleA" caption="${i18n.btn_cancle}" ></t:button>
              	</t:buttons>
              	
				<t:gridCol   property="diaobsqdh"  type="link" caption="${i18n.diaobsqdh}"  width="135"  orderBy="desc" sortProperty="diaobsqdh"></t:gridCol>
				<t:gridCol   hidden="true" property="leix" caption="leix"></t:gridCol>
				<t:gridCol   property="usercenter"  type="text" caption="${i18n.usercenter}" ></t:gridCol>
				<t:gridCol   property="chengbzx" type="text" caption="${i18n.chengbzx}" ></t:gridCol>
				<t:gridCol   property="diaobsqsj" type="text" caption="${i18n.diaobsqsj}" ></t:gridCol>
				<t:gridCol   property="creator" type="text" caption="${i18n.creator}" ></t:gridCol>
				<t:gridCol   property="zhuangt" type="text" caption="${i18n.zhuangt}"  convert="queryDblzt"></t:gridCol>
				<t:gridCol   property="beiz" type="text" caption="${i18n.beiz}" ></t:gridCol>
				 
				
				
				</t:grid>
		   </t:form>
	
        <div  style="display: none;">          
        <form id="linkGo" action="${ctx}/dfpvdiaobl/initEdit.do" method="POST">
                             <input type="hidden" name="usercenter" id="lk_usercenter"/>
                             <input type="hidden" name="diaobsqdh"  id="lk_diaobsqdh"/>
                             <input type="hidden" name="diaobsqsj"  id="lk_diaobsqsj"/>
                             <input type="hidden" name="banc"   id="lk_banc"/>
                             <input type="hidden" name="zhuangt" id="lk_zhuangt"/>
                             
                             <input type="hidden" name="leix" id="lk_leix"/> 
        </form>
        </div> 
		</t:page>
	<script type="text/javascript">
	    //$.sdcui.serverConfig.convertArray['codeConvert']={'00':'${i18n.weish }','10':'${i18n.shz}','20':'${i18n.ysh}','30':'${i18n.effect}','40':'${i18n.excuting}','50':'${i18n.excuted}'};
	    //$.sdcui.serverConfig.convertArray['codeCenter']={'UW':'${i18n.uw }','UH':'${i18n.uh}','UX':'${i18n.ux}'};
    //1024*768 输入框宽度设定150
    
	$(function (){  //页面一加载就运行
	  $("div#sq_creator  input[name='creator']").attr("style","width：150px");	
	  $("div#sq_chengbzx  input[name='chengbzx']").attr("style","width：150px");
	  $("div#sq_diaobsqdh  input[name='diaobsqdh']").attr("style","width：150px");
		//$("div[id*='sq_']:not(.youi-field fieldSelect)  input").attr("style","width：150px");
	})
	 
	    
	    
   /**
	*链接点击事件
	*/
	function link_diaobsqdh(event){
		var event = event||window.event;//原生态的事件处理 
		var element = event.srcElement || event.target;
		var rowDoc = $(element).parents('tr:first')[0];
		var record = $('#grid_diaobsq').grid('getRecord',rowDoc);//获取当前行对应的记录
		var usercenter = record.usercenter;
		var diaobsqdh = record.diaobsqdh;
		var diaobsqsj = record.diaobsqsj;
		var banc = record.banc;
		var zhuangt = record.zhuangt;
		
		var leix = record.leix;
		
		/*$("#lk_usercenter").val(usercenter);
		$("#lk_diaobsqdh").val(diaobsqdh);
		$("#lk_diaobsqsj").val(diaobsqsj);
		$("#lk_banc").val(banc);
		$("#lk_zhuangt").val(zhuangt);
		//$("#linkGo").action = "${ctx}/diaobl/initEdit.do?usercenter="+usercenter+'&diaobsqdh='+diaobsqdh+'&diaobsqsj='+diaobsqsj+'&banc='+banc+'&zhuangt='+zhuangt,
		$("#linkGo").submit();*/
		//window.showModalDialog ("${ctx}/diaobl/initEdit.do?removeId=layout-north,layout-west,layout-south&usercenter="+usercenter+"&diaobsqdh="+diaobsqdh+"&diaobsqsj="+diaobsqsj+"&banc="+banc+"&zhuangt="+zhuangt,
		//window,
		//"fullscreen=1;toolbar=no;menubar=no;scrollbars=no;resizable=no;location=no;status=no");
		
		winOpen = window.open ('${ctx}/dfpvdiaobl/initEdit.do?removeId=layout-north,layout-west,layout-south&usercenter='+usercenter+'&diaobsqdh='+diaobsqdh+'&diaobsqsj='+diaobsqsj+'&banc='+banc+'&leix='+leix+'&zhuangt='+zhuangt,
		'${i18n.diaoblqr}','top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no, status=no');
		winOpen.resizeTo(screen.availWidth,screen.availHeight);
        //timer = window.setInterval("IfWindowClosed()", 500);
		//$("#linkGo").method = "post";
		/**
		 * form跳转模式提交
		 */
	/* 	$.sdcui.pageUtils.goPage({
			url:'/diaobl/initEdit.do',
			record:record,//
			mode:'form',
			beforeSubmit:function(){
				//
				return true;
			}
		});
		event.stopPropagation();
		return false; */

	   }
		
		/**function  set_checkbox(){
		        
		        return  "<input type='checkbox' name='checkbox'>";
		
		}*/
		
		function func_button_cancleA(){
		        var diaobsq= $('#grid_diaobsq').grid('getSelectedRecords');//获得选中行参数
		        if(diaobsq.length == 0){
		           alert('${i18n.js_selected}');
		           return false;
		        }
		        var param = [];
		        for(var i=0;i<diaobsq.length;i++){
		            param.push('edit['+i+'].usercenter='+diaobsq[i].usercenter);
		            param.push('edit['+i+'].diaobsqdh='+diaobsq[i].diaobsqdh);
		            param.push('edit['+i+'].editor='+diaobsq[i].editor);
		            param.push('edit['+i+'].edit_time='+diaobsq[i].edit_time);
		            param.push('edit['+i+'].zhuangt='+diaobsq[i].zhuangt);
		           }
		         $.sdcui.ajaxUtil.ajax({
	 	 	                         url:"${ctx}/dfpvdiaobl/docancle.ajax",
	 	 	                         data:param.join('&'),
	 	                             success:function (result){
	 	                            	 alert(result.result);
	 	                            	 $("#grid_diaobsq").grid('reload');
	 	 	                         }
	 	                      });
	 	               
		}
		
		
		function func_button_export()
		{
	        var diaobsq= $('#grid_diaobsq').grid('getSelectedRecords');//获得选中行参数
	        var param = "";
	        if(diaobsq.length > 0)
        	{
		        for(var i=0;i<diaobsq.length;i++)
		        {            
		            param += diaobsq[i].diaobsqdh;
		            if(i < diaobsq.length -1)
	            	{
		            	 param += ",";
	            	}
		        }
        	}
	        
	        var usercenter = $('#sq_usercenter').fieldValue();
	        var creator = $('#sq_creator').fieldValue();
	        var chengbzx = $('#sq_chengbzx').fieldValue();
	        var zhuangt = $('#sq_zhuangt').fieldValue();
	        var diaobsqdh = $('#sq_diaobsqdh').fieldValue();
	        var diaobsqsj = $('#sq_diaobsqsj').fieldValue();
	        var lingjbh = $('#sq_lingjbh').fieldValue();
			
	        var record = {'ids':param,'usercenter':usercenter,'creator':creator,'chengbzx':chengbzx,'zhuangt':zhuangt,'diaobsqdh':diaobsqdh,'diaobsqsj':diaobsqsj,'lingjbh':lingjbh};
	        
	         $.sdcui.pageUtils.goPage({
	        	 url:"../dfpvdiaobl/download.ajax",
	 			record : record,
	 			mode : 'form',
	 			beforeSubmit : function(){
	 				return true;
	 			}
	 	   });
		}
		
	</script>
	<style type="text/css"></style>
</t:html>