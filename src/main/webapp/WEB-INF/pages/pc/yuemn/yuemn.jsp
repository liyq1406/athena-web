<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="UTF-8"%> 
<%@ include file="/WEB-INF/pages/include.jsp"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<t:html i18n="i18n.pc.pcymn" > 

 <head>
  <title>${i18n.pc_shenlljlxt_title }</title>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
   <link href="${ctx}/athena/calander/css/main.css" rel="stylesheet" type="text/css" />     
   <link href="${ctx}/athena/calander/css/dailog.css" rel="stylesheet" type="text/css" />
   <link href="${ctx}/athena/calander/css/calendar.css" rel="stylesheet" type="text/css" /> 
   <link href="${ctx}/athena/calander/css/dp.css" rel="stylesheet" type="text/css" />      
   <link href="${ctx}/athena/calander/css/alert.css" rel="stylesheet" type="text/css" />   
<script type="text/javascript"> 

</script>
 </head>


 <body>
<div>
	  <form id="selectform" name="selectform" action="yuemn.do" method="post">
	  <input name="start" id="start" type="hidden" value=""></input>
	  <input name="end" id="end" type="hidden" value=""></input>
	  <input name="showday" id="showday" type="hidden" value=""></input>
	  
      <div id="calhead" style="padding-left:1px;padding-right:1px;">          

            <div class="cHead"><div class="ftitle">${i18n.yuemn_zhouqmn }</div>

            <div id="loadingpannel" class="ptogtitle loadicon" style="display: none;">${i18n.yuemn_loading }</div>

             <div id="errorpannel" class="ptogtitle loaderror" style="display: none;">${i18n.yuemn_dont_loading }</div>

            </div>          

            

            <div id="caltoolbar" class="ctoolbar">    
            <div  id="arg" class="fbutton">
                <div><span title='${i18n.yuemn_jispc }' class="showdayflash">${i18n.yuemn_jispc }</span></div>
             </div>       
            <div class="btnseparator"></div>
             <div id="Sure" class="fbutton">
                <div><span class="showtoday">${i18n.quer }</span></div> 
            </div>
<!--            <div id="export" class="fbutton">
                <div><span class="showtoday">导出</span></div> 
            </div>	-->
            <div class="btnseparator"></div>
             <div id="t3" class="fbutton">
			<select id="chanx" name="chanx">
				<option value="">${i18n.yuemn_quanbcx }</option>
				<c:forEach var="chanx" items="${chanxList}" varStatus="status">
					<option value="${chanx.SHENGCXBH }">${chanx.SHENGCXBH }</option>
				</c:forEach>
			</select>  
            </div>

			 <div id="t4" class="fbutton">
                	 <select id="gongyzq" name="gongyzq">
                       <c:forEach var="gongyzq" items="${gyzqList }">
                       	<option value="${gongyzq.GONGYZQ }" >${gongyzq.GONGYZQ }</option>
                       </c:forEach>
                    </select>
             </div> 

             <div class="btnseparator"></div>
            <div id="sfprevbtn" title="${i18n.yuemn_shangyg }"  class="fbutton">
              <span class="fprev"></span>
            </div>

            <div id="sfnextbtn" title="${i18n.yuemn_xiayg }" class="fbutton">
                <span class="fnext"></span>
            </div>
                      
            <div class="fshowdatep fbutton">
            		

                   <div>
						<span id="zqfw">${kaissj}~${jiessj}</span>
                   </div>
                   
                  <!--   <div>
						
                        <input type="hidden" name="txtshow" id="hdtxtshow" />

                        <span id="txtdatetimeshow">Loading</span>

                    </div> -->
            </div>

			<div id="btnMessage" class="fbutton">
                <div><span class="showtoday">${i18n.yuemn_baojxx }</span></div> 
            </div>

			<div id="btnDownLoad" class="fbutton">
                <div><span class="showtoday">${i18n.report }</span></div> 
            </div>
                        
			<div id="btnBack" class="fbutton">
                <div><span class="showtoday">${i18n.btnBack }</span></div> 
            </div>
			<div id="btnMonService" class="fbutton">
                <div><span class="showtoday">${i18n.yuemn_mondyjkfw }</span></div> 
            </div>    
            <div id="btnRukmxService" class="fbutton">
                <div><span class="showtoday">${i18n.yuemn_monqkcmx }</span></div> 
            </div>  
            <!--  -->
              <div id="btnGongstz" class="fbutton">
                <div><span class="showtoday">${i18n.gongstz }</span></div> 
            </div>           
             <div class="btnseparator"></div>         

            <div class="clear"></div>

            </div>

      </div>
	  </form>
      <div style="padding:1px;">

        <div class="t1 chromeColor">

            &nbsp;</div>

        <div class="t2 chromeColor">

            &nbsp;</div>

        <div id="dvCalMain" class="calmain printborder">

            <div id="gridcontainer" style="overflow-y: visible;">

            </div>

        </div>

        <div class="t2 chromeColor">

            &nbsp;</div>

        <div class="t1 chromeColor">

            &nbsp;

        </div>   

        </div>

     	<form id="exp" name="exp" action="" method="post" style="background-color: white;" target="hiddenUp" style="display: none;">
		     
			 <input type="hidden" id="dto_gongyzq" name="dto_gongyzq" />
			 <input type="hidden" id="dto_chanx" name="dto_chanx" />
	</form>
	<iframe name="hiddenUp" id="hiddenUp" style="display: none;"></iframe>

  </div> 
	<script src="<%=request.getContextPath()%>/scripts/lib/jquery.js" type="text/javascript" ></script>
<script src="<%=request.getContextPath()%>/scripts/lib/jquery.ui.core.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/scripts/lib/jquery.ui.widget.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/scripts/lib/jquery.ui.mouse.js" type="text/javascript"></script>

<script src="<%=request.getContextPath()%>/scripts/lib/sdc.ui-1.0.0.min.js" type="text/javascript"></script> 
	<script type="text/javascript" src="${ctx}/athena/calander/jquery.alert.js"></script> 
	<script type="text/javascript" src="${ctx}/athena/calander/xgcalendar_lang_zh_CN.js"></script>
	<script type="text/javascript" src="${ctx}/athena/calander/xgcalendar.js"></script>
	<script type="text/javascript" src="${ctx}/athena/calander/jquery.ifrmdailog.js"></script>
	<script type="text/javascript" src="${ctx}/athena/calander/Common.js"></script>
    <script type="text/javascript">
	    function refurbish() {
	    	$('#selectform').submit();
	    }
        $(document).ready(function() {
        	//判断工业周期下拉框选中 
        	$.each($('#gongyzq option'),function(i,n){
        		if ($(n).val()=='<c:out value="${gongyzq }"></c:out>') {
        			$(n).attr('selected','selected');
        		}
        	});
        	
        	$.each($('#chanx option'),function(i,n){
        		if ($(n).val()=='<c:out value="${chanxbh }"></c:out>') {
        			$(n).attr('selected','selected');
        		}
        	});
        	
        	
             /**
             *工业周期下拉框change事件
             */
             $("#gongyzq").change(function(){ 
            	 $('#selectform').submit();
             });
             

             /**
             *产线下拉框change事件
             */
             $("#chanx").change(function(){ 
            	 $('#selectform').submit();
             });

        	$('#newWork').click(newWork); 
        	i18n.xgcalendar.repeat_event='${i18n.kuatgz }';
        	i18n.xgcalendar.time='${i18n.shijian }';
        	i18n.xgcalendar.event='${i18n.gaiy }';
        	i18n.xgcalendar.location='${i18n.chanxian }';
        	i18n.xgcalendar.participant='${i18n.banc }';
            var chanx = {};
            var theme = [1,5,8,15,18,20,6,7,9,10,11,12,13];
            $.each($('#chanx').find('option'),function(i,n){
            	chanx[$(n).val()] = theme[i-1];
            });
           var view="month"; 
            ﻿ __CURRENTDATA=[
			<c:set var="flag" value="" />
			<c:forEach var="yuemn" items="${yuemnList }" varStatus="status">
			<c:set var="hour" value="${yuemn.hour}"/>
				<fmt:parseDate value="${yuemn.kaissj }" var="start" pattern="yyyy-MM-dd HH:mm:ss"></fmt:parseDate>
				<% 
				  //计算结束时间
					Date date = (Date)pageContext.getAttribute("start");  
					double hour = Double.parseDouble(pageContext.getAttribute("hour").toString());
					Date end = new Date();
					end.setTime(date.getTime()+(long)(hour*60*60*1000));
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
					String endStr = sdf.format(end);
					pageContext.setAttribute("end",endStr);
				%>
				<fmt:parseDate value="${end }" var="endstr" pattern="yyyy-MM-dd HH:mm:ss"></fmt:parseDate>
				${flag }['${yuemn.gongzbh}','${yuemn.appobj}, ${yuemn.hour}小时',new Date(<fmt:formatDate value='${start}' pattern='yyyy'/> ,<fmt:formatDate value='${start}' pattern='M'/>-1,<fmt:formatDate value='${start}' pattern='d'/>,<fmt:formatDate value='${start}' pattern='HH'/>,<fmt:formatDate value='${start}' pattern='mm'/>),
				         new Date(<fmt:formatDate value='${start}' pattern='yyyy'/> ,<fmt:formatDate value='${start}' pattern='M'/>-1,<fmt:formatDate value='${start}' pattern='d'/>,<fmt:formatDate value='${endstr}' pattern='HH'/>,<fmt:formatDate value='${endstr}' pattern='mm'/>),0,0,0,
				         chanx['${yuemn.appobj}'],
				         11,'${yuemn.appobj}',''] 
			<c:set var="flag" value="," />
			</c:forEach>                  
			
            ];
            <fmt:parseDate value="${rili }" var="rili" pattern="yyyy-MM-dd"></fmt:parseDate>
            var showday = '${param.showday}';
            var day = new Date();
            if (showday === '') {
            	day = new Date(<fmt:formatDate value='${rili}' pattern='yyyy'/> ,<fmt:formatDate value='${rili}' pattern='M'/>-1,<fmt:formatDate value='${rili}' pattern='d' />);
            } else {
            	day = $.sdcui.dateUtil.strToDate(showday, i18n.xgcalendar.dateformat.fulldayvalue);
            }
            var op = {

                view: view,

                theme:3, 
                showday: day, 

                EditCmdhandler:Edit,

                DeleteCmdhandler:Delete,

                ViewCmdhandler:View,    

				readonly:true,

                onWeekOrMonthToDay:wtd,
               
                onBeforeRequestData: cal_beforerequest,

                onAfterRequestData: cal_afterrequest,

                onRequestDataError: cal_onerror
          

            };

            var $dv = $("#calhead");

            var _MH = document.documentElement.clientHeight;

            var dvH = $dv.height() + 2;

            op.height = _MH - dvH;

            op.eventItems =__CURRENTDATA;



            var p = $("#gridcontainer").bcalendar(op).BcalGetOp();

            if (p && p.datestrshow) {

                $("#txtdatetimeshow").text(p.datestrshow);

            }

            $("#caltoolbar").noSelect();

  

            function cal_beforerequest(type)

            {

                var t="${i18n.loading }";

                switch(type)

                {

                    case 1:

                        t="${i18n.loading }";
                        this.extParam = [];
                        this.extParam.push({name:'start',value:$.sdcui.dateUtil.dateToStr(this.vstart, i18n.xgcalendar.dateformat.fulldayvalue)});
                        this.extParam.push({name:'end',value:$.sdcui.dateUtil.dateToStr(this.vend, i18n.xgcalendar.dateformat.fulldayvalue)});
                        break;

                    case 2:                      

                    case 3:  

                    case 4:    

                        t="${i18n.processing }";                                   

                        break;

                }

                $("#errorpannel").hide();

                $("#loadingpannel").html(t).show();    

            }

            function cal_afterrequest(type)

            {

                switch(type)

                {

                    case 1:

                        $("#loadingpannel").hide();

                        break;

                    case 2:

                    case 3:

                    case 4:

                        $("#loadingpannel").html("${i18n.operate_success }");

                        window.setTimeout(function(){ $("#loadingpannel").hide();},2000);

                    break;

                }              

               

            }

            function cal_onerror(type,data)

            {

                $("#errorpannel").show();

            }

            function Edit(data)

            {

               var eurl="";   

                if(data)

                {

                    var url = StrFormat(eurl,data);

                    OpenModelWindow(url,{ width: 600, height: 400, caption:"${i18n.manageRic }",onclose:function(){

                       $("#gridcontainer").BCalReload();

                    }});

                }

            } 
            
            function newWork(data)

            {

                var vurl="pc01E05.html";   

                if(data)

                {

                    var url = StrFormat(vurl,data);

                    OpenModelWindow(url,{ width: 600, height: 400, caption: "${i18n.addgongzr }"});

                }                

            }
            function View(data)

            {
			 var chanx = data[9];
			 var gongzbh = data[0];
             var vurl="${ctx}/pc/workDetail.do?chanx="+chanx+"&gongzbh="+gongzbh+"&gongyzq="+$("#gongyzq").val();   

                if(data)

                {

                    var url = StrFormat(vurl,data);

                    OpenModelWindow(url,{ width: 600, height: 400, caption: "${i18n.chakgzrl }"});

                }               

            }
            
            function setArg(data)
    	    { 
            	var gongyzq = $('#gongyzq').val();
            	if(gongyzq==null){
            		alert("${i18n.yuemn_gongyzqkong_dontmon }");
            		return;
            	}
            	var param = "gongyzq="+gongyzq;
            	$.sdcui.ajaxUtil.ajax({
					 url:"${ctx}/pc/queryShifqr.ajax",
					 data:param,
					 success:function(results){
//						var obj =  eval('('+ results + ')'); 
						if(results.querzt=='Y'){
							alert("${i18n.yuemn_isquer_dontmon }");
							return;
						}
		            	var vurl="${ctx}/pc/cansmn.do?gongyzq="+$("#gongyzq").val();  
		            	if(data)
			            {
		            		var vurl = StrFormat(vurl,data);
			    	        OpenModelWindow(vurl,{width:650,height:330, caption:"${i18n.yuemn_shedqckc }"});
			           		
			            }
					 }
				 }); 

    	    }   

            function setMessage(data)
    	    { 
            	var gongyzq = $('#gongyzq').val();
            	var chanx = $('#chanx').val();
            	if(gongyzq==null){
            		alert("${i18n.yuemn_gyzqkong_dontshowmessage }");
            		return;
            	}
            	var vurl="${ctx}/pc/message.do?gongyzq="+$("#gongyzq").val()+"&chanx="+$("#chanx").val();  
            	if(data)
	            {
            		var vurl = StrFormat(vurl,data);
	    	        OpenModelWindow(vurl,{width:700,height:330, caption:"${i18n.yuemn_baojxinx }"});
	            }
    	    }   
    	    
    	    function setMonService(data)
    	    { 
            	var gongyzq = $('#gongyzq').val();
            	var chanx = $('#chanx').val();
            	if(gongyzq==null){
            		alert("${i18n.yuemn_gyzqkong_dontgund }");
            		return;
            	}
            	var param = "gongyzq="+$("#gongyzq").val()+"&chanx="+$("#chanx").val();  
            	if(confirm("${i18n.yuemn_whether_gund }")){
					 $.ajax({
						 url:"${ctx}/pc/monService.ajax",
						 data:param,
						 dataType : 'html',
						 success:function(msg){
							alert("${i18n.yuemn_gund_finish }");
						 }
					 }); 
				}
    	    }   
            
            function setRukmxService(data)
    	    { 
            	var gongyzq = $('#gongyzq').val();
            	var chanx = $('#chanx').val();
            	if(gongyzq==null){
            		alert("${i18n.yuemn_gyzqkong_dontruk }");
            		return;
            	}
            	var param = "tt=11";  
            	if(confirm("${i18n.yuemn_whether_updateshij }")){
					 $.ajax({
						 url:"${ctx}/pc/rukmxService.ajax",
						 data:param,
						 dataType : 'html',
						 success:function(msg){
							alert("${i18n.yuemn_mon_finish }");
						 }
					 }); 
				}
    	    } 
            
            //跳转到工时调整页面 hzg 2012-6-20
            function setGongstz(data)
    	    { 
            	var gongyzq = $('#gongyzq').val();
            	var chanx = $('#chanx').val();
            	if(gongyzq==null){
            		alert("${i18n.yuemn_gyzqkong_dontgongstz }");
            		return;
            	}
            	var params = [];
            	params.push("gongyzq="+gongyzq);
            	$.sdcui.pageUtils.goPage({
        			url:'${ctx}/pc/toPageGongstz.do?gongyzq='+gongyzq+"&biaos=Y",
        			record:params.join("&"),
        			mode:'form',
        			beforeSubmit:function(){
        				return true;
        			}
            	});
    	    } 
            
            
            function Delete(data,callback)
            {  

                $.alerts.okButton="${i18n.yuemn_qued }";  

                $.alerts.cancelButton="${i18n.yuemn_quxiao }";  

                hiConfirm("${i18n.yuemn_whether_deleteric }", '${i18n.yuemn_queren }',function(r){ r && callback(0);});           

            }
            
            function Sure(data,callback)
            {  
            	var param = "gongyzq="+$('#gongyzq').val();
            	var gongyzq = $('#gongyzq').val();
            	if(gongyzq==null){
            		alert("${i18n.yuemn_gyzqkong_dontquer }");
            		return ;
            	}

            	$.sdcui.ajaxUtil.ajax({
					 url:"${ctx}/pc/queryShifqr.ajax",
					 data:param,
					 success:function(results){
						if(results.quernull=='0'){
							alert("${i18n.yuemn_gyzq_notpaicjh }");
							return;
						}
						if(results.querzt=='Y'){
							alert("${i18n.yuemn_isquer_dontquer }");
							return;
						}
            
						if(confirm("${i18n.yuemn_whether_quer }")){
							$.sdcui.ajaxUtil.ajax({
								 url:"${ctx}/pc/mnPaicSure.ajax",
								 data:param,
								 success:function(msg){
									if(msg.count>0){
										alert("${i18n.yuemn_quer_success }");
									}else{
										alert("${i18n.yuemn_quer_fail }");
									}
								 }
							 }); 
						}
					 }
				}); 
            }

            function wtd(p)

            {

               if (p && p.datestrshow) {

                    $("#txtdatetimeshow").text(p.datestrshow);

                }

                $("#caltoolbar div.fcurrent").each(function() {

                    $(this).removeClass("fcurrent");

                })

                $("#showdaybtn").addClass("fcurrent");

            }

			//文件 下载
			function setDownLoad(){
//				return ;
				var gongyzq = $('#gongyzq').val();
				var chanx = $('#chanx').val();
            	if(gongyzq==null){
            		alert("${i18n.yuemn_gyzqkong_dontdownload }");
            		return ;
            	}
/*  				$.sdcui.pageUtils.goPage({
					url:"${ctx}/pc/yuemndown.do?gongyzq="+$("#gongyzq").val()+"&chanx="+$("#chanx").val(),
					beforeSubmit:function(){
						return true;
					}
				});  */
        		var fm = document.getElementById("exp");
        		fm.action="${ctx}/pc/yuemndown.do?gongyzq="+$("#gongyzq").val()+"&chanx="+$("#chanx").val();
        		fm.submit(); 
			}
			
		   function callback(msg){
			     if(msg!=null){
			    	 alert(msg);
			     }	
			}   

            //点击新增日程

            $("#faddbtn").click(function(e) {

                var url ="";

                OpenModelWindow(url,{ width: 500, height: 400, caption: "${i18n.addRic }"});

            });

            //点击回到今天

             
            
            //确认
            $("#Sure").click(Sure);
            
            //导出
            $("#export").click(function(){ 
            });
            //设定参数模拟
            $('#arg').click(setArg);   
             //显示报警信息
            $('#btnMessage').click(setMessage);            
             //滚动月模拟服务调用
            $('#btnMonService').click(setMonService); 
             //导出报表
            $('#btnDownLoad').click(setDownLoad);   
             //模拟调用读取入库明细
            $('#btnRukmxService').click(setRukmxService); 
            $('#btnGongstz').click(setGongstz); 
             
            //上一个

            $("#sfprevbtn").click(function(e) {

                var p = $("#gridcontainer").BCalPrev().BcalGetOp(); 
				$('#start').val($.sdcui.dateUtil.dateToStr(p.vstart, i18n.xgcalendar.dateformat.fulldayvalue));
				$('#end').val($.sdcui.dateUtil.dateToStr(p.vend, i18n.xgcalendar.dateformat.fulldayvalue));
				$('#showday').val($.sdcui.dateUtil.dateToStr(p.showday, i18n.xgcalendar.dateformat.fulldayvalue));
                $('#selectform').submit();
            });

            //下一个

            $("#sfnextbtn").click(function(e) {
                var p = $("#gridcontainer").BCalNext().BcalGetOp();
				$('#start').val($.sdcui.dateUtil.dateToStr(p.vstart, i18n.xgcalendar.dateformat.fulldayvalue));
				$('#end').val($.sdcui.dateUtil.dateToStr(p.vend, i18n.xgcalendar.dateformat.fulldayvalue));
				$('#showday').val($.sdcui.dateUtil.dateToStr(p.showday, i18n.xgcalendar.dateformat.fulldayvalue));
                $('#selectform').submit(); 
            });

            //返回
            $("#btnBack").click(function(){
            	window.location.href="${ctx}/authority/sys_login_module.do?moduleIndex=0";
            });

        });

    </script> 

 </body> 
</t:html>

 