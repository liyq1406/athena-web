<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<t:html title="${i18n.pc_gongstz_title }" >
	<head>
		<%@ include file="/WEB-INF/pages/common/commonScriptAndCss.jsp"%>
		
	</head>
	<t:page i18n="i18n.pc.pc" >
		<t:grid id="gongstzGrid" idKeys="gongzbh,xingq" caption="${i18n.pc_gongstz_title }" showCheckbox="true" 
		src="/pc/queryGongstz.ajax" add="NOT" remove="NOT" reset="NOT"
		submit="NOT" edit="NOT" usePager="false" showNum="true" scrollHeight="300" >
		<t:fieldLayout  id="sq_select" prefix="gongstz">
		        <t:fieldHidden property="gongyzq"  defaultValue="${gongyzq}"></t:fieldHidden> 
		        <t:fieldHidden property="biaos"  defaultValue="${biaos}"></t:fieldHidden>
		   		<t:fieldText property="tzsj" caption="调整时间：" dataType="number" ></t:fieldText>
		 </t:fieldLayout>
	 
		<t:gridCol   property="usercenter"  caption="${i18n.usercenter } "></t:gridCol>
		<t:gridCol   property="lineNum"   caption="${i18n.chanxh } "></t:gridCol>
		<t:gridCol   property="zhoux"    caption="${i18n.zhoux } "></t:gridCol>
		<t:gridCol   property="startTime"   caption="${i18n.kaissj }" ></t:gridCol>
		<t:gridCol   property="endTime"   caption="${i18n.jiessj }"  renderer="endTime" ></t:gridCol>
		
		<t:gridCol   property="workTime"  caption="${i18n.gongs } "></t:gridCol>
		<t:button caption="${i18n.btnXiug }" name="btnXiug"></t:button>
		
		<t:button caption="${i18n.btnTiaoz }" name="btnTiaoz"></t:button>
		
		<t:button caption="${i18n.btnBack }" name="btnBack"></t:button>
		</t:grid>


	<script type="text/javascript">	 
		params=[]; 
		xgnum = 0; 
		
		 /*自定义调整按钮 xss-0012121-2015/11/27*/
		function func_button_btnTiaoz(){
			//var tzsj = $("#gongstz_tzsj").fieldValue();
		
		if(xgnum==0){
			alert("请最少修改一条数据！");
			return false;
		}
		
		address = "${ctx}/pc/changxGongstz.ajax"; 
			//alert(params);			      
				$.sdcui.ajaxUtil.ajax({
					url:address,
					data:params.join('&'),
					//grid:this,
					success:function(result){  
								//alert('.......');
								//alert(result.success);
								   if(result.success=="success"){
									   alert("${i18n.gongstz_gongstz_finish }");
									   var gongyzq = $("#gongstz_gongyzq").fieldValue();
									   var biaos = $("#gongstz_biaos").fieldValue();
									   window.location.href="${ctx}/pc/gsQickc.do?gongyzq="+gongyzq+"&biaos="+biaos;
								   }else{
									   if(result.success=="null"){
										   alert("${i18n.gongstz_data_nullchange }");
									   }else if(result.success=="gongsQJerror"){
										   alert("${i18n.gongstz_between }");
									   }else if(result.success=="gongsBSerror"){
										   alert("${i18n.gongstz_multiple }");
									   }
									   return;
								   }
					} 
			});	 
		}
			
			
	    /* 自定义修改按钮  xss-0012121-2015/11/27 */
		function func_button_btnXiug(){
			//alert("test!");	
			var tzsj = $("#gongstz_tzsj").fieldValue();
		
			//var tzsj= $("#tzsj").val();
			   
			   if(tzsj<8||tzsj>22){
			    	alert("${i18n.gongstz_between }");
			    	return;
			   }
			   
			   //alert(tzsj);	
				
			   var recordall = $("#gongstzGrid").grid("getRecords");//所有行的数据
			   
			   var record2 = $("#gongstzGrid").grid("getSelectedRecords");//选中的行的数据
			   
			   var length = record2.length;//判断长度
				 
			   if(length < 1){
					 alert("请选择最少一条数据!");
					 return false;
			    } 
				
				for(i=0;i<record2.length;i++){								   		      	          
					if(record2[i].workTime==''||record2[i].workTime==null||record2[i]==undefined){//如果选择行数据中的工时为空就跳过
						alert("${i18n.gongstz_not_edit }");
						return;
					}
									   
			       for(j=0;j<recordall.length;j++){			     
			      	 if(recordall[j].workTime==record2[i].workTime){
			      	    if(recordall[j].lineNum==record2[i].lineNum){
			      	       if(recordall[j].zhoux==record2[i].zhoux){
			      	          if(recordall[j].endTime==record2[i].endTime){	
					      	      //alert(j);
					      	  	  //alert(recordall[j].lineNum);
					      	  	  recordall[j].workTime=tzsj;
					      	      //recordall.splice(j,1); 
			      	          
			      	          }
			      	       }
			      	     } 
			      	 }
			       }				
				}
				
				$('#gongstzGrid').grid('parseRecords', recordall);
				
				//params = [];
				
				//xgnum = 0;
					
				params.push("biaos="+$("#gongstz_biaos").fieldValue()	); 	
				params.push("gongyzq="+$("#gongstz_gongyzq").fieldValue()	 );		
				
				//alert("1"+xgnum);
				var n = xgnum;
				//alert("n"+n);
				for(m = 0;m<record2.length;m++){	
						params.push('edit['+n+'].endTime='+record2[m].endTime);
						params.push('edit['+n+'].gongzbh='+record2[m].gongzbh);
						params.push('edit['+n+'].lineNum='+record2[m].lineNum);
						params.push('edit['+n+'].startTime='+record2[m].startTime);
						params.push('edit['+n+'].usercenter='+record2[m].usercenter);
						params.push('edit['+n+'].workTime='+tzsj);
						params.push('edit['+n+'].zhoux='+record2[m].zhoux);
						params.push('edit['+n+'].xingq='+record2[m].xingq);
						n++;
			    } 
			    
			    xgnum = xgnum+ record2.length; // 修改的行数
			    //alert("xgnum"+xgnum);
			
		}
		
		
	   
	   /*批量保存完成后的操作
	   function afterSaveRowsForwardPage(result){
	   		   if(result.success=='success'){
			   alert("${i18n.gongstz_gongstz_finish }");
			   var gongyzq = $("#gongstz_gongyzq").fieldValue();
			   var biaos = $("#gongstz_biaos").fieldValue();
			   window.location.href="${ctx}/pc/gsQickc.do?gongyzq="+gongyzq+"&biaos="+biaos;
		   }else{
			   if(result.success=='null'){
				   alert("${i18n.gongstz_data_nullchange }");
			   }else if(result.success=='gongsQJerror'){
				   alert("${i18n.gongstz_between }");
			   }else if(result.success=='gongsBSerror'){
				   alert("${i18n.gongstz_multiple }");
			   }
			   return;
		   }
	   }
	   */
	   
	   //自定义返回按钮
		function func_button_btnBack(){
			window.history.back();
		}
	   
	   
	   //渲染事件，根据开始日期计算结束日期
		var endTime = function (col,value,record,rowIndex,colIndex) {
		   //alert(col+"星期=>"+value.XINGQ);
		var z = value.xingq-1;
		var kaissj = value.startTime;
		var dateParse = new Date(Date.parse(kaissj.replace(/-/g,"/"))); //转换成Data();
		dateParse.setDate(dateParse.getDate()+z);
		//var localDate = dateParse.toLocaleDateString();
		//var dd = localDate.toDateEx();
		//var newDate = dd.format("yyyy-MM-dd");
		//直接调用平台提供的Date.prototype.igFormat()方法 hzg 2012-8-10
		var newDate = dateParse.igFormat("yyyy-MM-dd");
		return newDate; 
	}
		
		//工作编号为空就不可编辑
		function qickcEditAble(){
		/*
			var record=$("#gongstzGrid").grid("getSelectedRecords")[0];
			var workTime = record.workTime;
			if(workTime==""||workTime==null||workTime==undefined){
				alert("${i18n.gongstz_not_edit }");
				return false;
			}
			*/
			return true;
		}
		
		
		
	</script>	
		
	</t:page >
</t:html>