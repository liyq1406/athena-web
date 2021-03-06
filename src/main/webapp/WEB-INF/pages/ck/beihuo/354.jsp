<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","354");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_354}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		Date.prototype.format = function(format){
	        var o = {
	        "M+" : this.getMonth()+1, //month
	        "d+" : this.getDate(),    //day
	        "h+" : this.getHours(),   //hour
	        "m+" : this.getMinutes(), //minute
	        "s+" : this.getSeconds(), //second
	       // "q+" : Math.floor((this.getMonth()+3)/3),  //quarter
	       // "S" : this.getMilliseconds() //millisecond
	        }
	        if(/(y+)/.test(format)) format=format.replace(RegExp.$1,
	        (this.getFullYear()+"").substr(4 - RegExp.$1.length));
	        for(var k in o)if(new RegExp("("+ k +")").test(format))
	        format = format.replace(RegExp.$1,
	        RegExp.$1.length==1 ? o[k] :
	        ("00"+ o[k]).substr((""+ o[k]).length));
	        return format;
       }
       var newdate=new Date();
       var curr=newdate.format('yyyy-MM-dd hh:mm:ss');
       var agocurr=new Date(newdate.getTime() - 1000 * 60 * 60 * 24 * 7).format('yyyy-MM-dd hh:mm:ss');
       var paramsQuery;
       var currentPage = 1;
			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['yaohlh'],
					id:'grid_user_${pageId}',
					defaultColWidth : 60,
					pageSize : 5, // 每页记录条数
					showCheckbox:true,
					//查询交易
					src:'<%=request.getContextPath()%>/beihuo/35401.do',
					cols:[
						{property:'xunhbm',caption:'${i18n.xunhbh}',width:'40'},
						{property:'dangqxhgm',caption:'${i18n.xunhgm}',width:'40'},
						{property:'gonghms',caption:'${i18n.xunhlx}',width:'40'},
						{property:'yaohlh',caption:'${i18n.yaohlh}',width:'40'},
						{property:'zhuangtxx',internation:true,caption:'${i18n.zhuangt}',width:'40'},
						{property:'lingjbh',caption:'${i18n.lingjh}',width:'40'},
						{property:'lingjmc',caption:'${i18n.lingjmc}',width:'40'},
						{property:'yaohsl',caption:'${i18n.zhuangcsl}',width:'40'},
						{property:'danw',caption:'${i18n.lingjdw}',width:'40'},
						{property:'shiflsk',caption:'${i18n.linskbz}',width:'40'},
				  		{property:'yaohlztxx',caption:'${i18n.quxbz}',width:'40',internation:true},
				  		{property:'keh',caption:'${i18n.keh}',width:'40'},
				  		{property:'saoksj',caption:'${i18n.saoksj}',width:'40'},
				  		{property:'zuiwsj',caption:'${i18n.zuiwjfsj}',width:'40'},
				  		{property:'jiaofsj',caption:'${i18n.jiaofsj}',width:'40'},
				  		{property:'oper_no',caption:'${i18n.yonghbh}',width:'40'},
				  		{property:'gongysdm',caption:'${i18n.gongys}',width:'40'}
					],
					//records:demorecord,
					buttons:[
						//F1查询
				   	 	{name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
				   	 	if (!validateform()){
			   	        	return;
			   	        }
			   	 		
                        var params = $('#form_user_${pageId}').form("getFormParam");                            
                        params.push('currentPage=1');
                        //设置分页条件
			           $('#grid_user_${pageId}').grid("setQueryParams", params);
			           var url = "<%=request.getContextPath()%>/beihuo/35401.do";
			  			 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			  			 if (showPromptRequestMsg(results)==true){
			  				 $('#grid_user_${pageId}').grid('parseResult',results)
			  			 }
			  			 });
						}},
						{name:'qux',caption:'${i18n.qux}[F2]',keyboard:'F2',action:function(){
							//获取选择行
					 		var params = $('#grid_user_${pageId}').grid('getSelectedAll');
							if(params.length < 1){
								showPromptMsg('red','${i18n.selectoneerror}')
								return false;
							}
							//打开提示框是否删除
							if(confirm($.sdcui.resource.i18n['C_remove'])){
							//先提交选中行，然后再重新加载
							var params = $('#grid_user_${pageId}').grid('getSelectedAll');	
							params.push("lingjbh="+$("#lingjbh input").val());
							params.push("kehbh="+$("#kehbh input").val());
							params.push("xunhbm="+$("#xunhbm input").val());
							params.push("saoksj1="+$("#saoksj1 input").val());
							params.push("saoksj2="+$("#saoksj2 input").val());
							params.push("oper_no="+$("#oper_no input").val());
							params.push("currentPage="+currentPage);
							var url = "<%=request.getContextPath()%>/beihuo/35402.do";
							 $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
								 if (showPromptRequestMsg(results)==true){
									 $('#grid_user_${pageId}').grid('parseResult',results)
								 }
								 });
							}
							return false;
							}},
						    {name:'checked',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
									$('#grid_user_${pageId}').grid('selected');
						    		return false;
							}}
							,{name:'selectall',caption:'${i18n.selectall}[F5]',keyboard:'F5',action:function(){
						   	 		$('#grid_user_${pageId}').grid('selectedAll');
						    		return false;
							}},
						 //重新加载
                        {name:'back',caption:'${i18n.back}[F11]'},
                        //F12返回
                        {name:'return',caption:'${i18n.return}[F12]'}
					]
				});
				
			 	$('#form_user_${pageId}').form({
			 	    onreload:true,
			 		fields:[
						{fieldType:'fieldText',property:'lingjbh',dataType:'letter_numeric',caption:'${i18n.lingjh}',limitedLength:'10'},
						{fieldType:'fieldText',property:'kehbh',dataType:'xkeh'},
						{fieldType:'fieldText',property:'xunhbm',dataType:'letter_numeric',caption:'${i18n.xunhbh}',limitedLength:'8'},
						{fieldType:'fieldText',property:'saoksj1',notNull:true,caption:'${i18n.saoksjd}',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'},value:agocurr},
						{fieldType:'fieldText',property:'saoksj2',notNull:true,caption:'${i18n.saoksjd}',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'},value:curr},
						{fieldType:'fieldText',property:'oper_no',dataType:'yonghbh'}
			 		]
			 	});
 			 	
			 	$(document).keyboardsupport({});
			});
			function validateform(){
                //参数校验
                if(!$('#form_user_${pageId}').form("validateParam")){
                    $('#grid_user_${pageId}').grid('clearRecords');
                    return false;
                }
                
                //范围校验
                var saoksj1 = $('#saoksj1 input').val();
                var saoksj2 = $('#saoksj2 input').val();
                if(!validRangeData("datetime", saoksj1, saoksj2)){
                    $('#saoksj1 input').focus();
                    $('#saoksj1 input').removeClass('validate-success').addClass('validate-error');
                    return false;
                }
                var date1 = new Date(saoksj1.replace(/-/g,"/"));
                var date2 = new Date(saoksj2.replace(/-/g,"/"));
                var date3=date2.getTime()-date1.getTime();
                if (date3 > 7*24*3600*1000){
                	showPromptMsg('red',$.sdcui.resource.i18n['C_F_SAOKASJ']);
                    return false;
                }
                return true;
			}
		</script>
	</head>
	<body>
		<div style="padding:20px;">
			<div id="title"></div>
			<form id="putform" method="post" name="putform" >
			<div id="form_user_${pageId}" class="ui-fieldLayout">
			 	<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>${i18n.lingjbh}:</td>
							<td><div class="ui-field" id="lingjbh"></div></td>
							<td>${i18n.keh}:</td>
							<td><div class="ui-field" id="kehbh"></div></td>
							<td>${i18n.xunhbh}:</td>
							<td><div class="ui-field" id="xunhbm"></div></td>
						</tr>
						<tr>
							<td>${i18n.saoksjd}:</td>
							<td><div class="ui-field" id="saoksj1"></div></td>
							<td>${i18n.zhi}:</td>
							<td><div class="ui-field" id="saoksj2"></div></td>
							<td>${i18n.yonghbh}:</td>
							<td><div class="ui-field" id="oper_no"></div></td>
						</tr>
					</tbody>
				</table> 
			</div>
			</form>
			<br></br>
			<div id="grid_user_${pageId}"></div>
			<br></br>
			<div id='prompt'>${i18n.prompt}</div> 
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>