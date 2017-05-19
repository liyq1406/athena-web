<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","305");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_305}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
				//var demorecord = {'result':{'total':1,'rows':[{'yaohl':20,'lingjbh':123,'ush':'S00000001','gongysmc':345,'shangxbz':678,'shifsl':901,'danw':322,'kuw':012},{'yaohl':20,'lingjbh':123,'ush':'S00000002','gongysmc':345,'shangxbz':678,'shifsl':901,'danw':322,'kuw':014}]}};
				$('#grid_user_${pageId}').grid({
					keyFields:['yaohl'],
					id:'grid_user_${pageId}',
					showCheckbox:true,
					//查询交易
					src:'<%=request.getContextPath()%>/beihuo/30501.do',
					cols:[
						{property:'yaohlh',caption:'${i18n.baozdykh}'},
						{property:'tongblshqj',caption:'${i18n.qizlsh}'},
						{property:'peislb',caption:'${i18n.peislx}'},
						{property:'baozxh',caption:'${i18n.shangxbz}'},
						{property:'lingjbh',caption:'${i18n.lingjh}'},
						{property:'lingjmc',caption:'${i18n.lingjmc}'},
						{property:'lingjsl',caption:'${i18n.zhuangcsl}'},
						{property:'danw',caption:'${i18n.lingjdw}'},
				  		{property:'shangxsj',caption:'${i18n.zuizsxsj}'},
				  		{property:'chex',caption:'${i18n.chex}'},
				  		{property:'ceng',caption:'${i18n.ceng}'}
					],
					//records:demorecord,
					buttons:[
			            //F3备货
				   	 	{name:'beih',caption:'${i18n.beih}[F3]',keyboard:'F3',action:function(){
							var records = $('#grid_user_${pageId}').grid('getSelectedAll');
							if(records.length == 0){
								showMsg("${i18n.selectoneerror}");
								return false;
							}
							var yaohlList = [];
							for(var i=0;i<records.length;i++){
								var yaohl = records[i].split('=');
								yaohlList.push('\''+yaohl[1]+'\'');
							}
							var params = [];
							params.push('beihybh='+st_UserName);
							params.push('keh='+$("#keh input").val());
							params.push('cangkbh='+$("#cangkbh span").html());
							params.push('yaohlList=' + yaohlList.join(','));
							var url="<%=request.getContextPath()%>/beihuo/30502.do";
							$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
                                  $('#grid_user_${pageId}').grid('clearRecords');
                                  $('#grid_user_${pageId}').grid("parseResult",results)
                            });
							return false;
				   	 	}},
						//F4单选
						{name:'checked',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
								$('#grid_user_${pageId}').grid('selected');
								msgClear();
					    		return false;
						}},
						//F5全选
				   	 	{name:'selectall',caption:'${i18n.selectall}[F5]',keyboard:'F5',action:function(){
					   	 		$('#grid_user_${pageId}').grid('selectedAll');
					   	        msgClear();
					    		return false;
						}},
						 //重新加载
                        {name:'back',caption:'${i18n.back}[F11]',keyboard:'F11'},
                        //F12返回
                        {name:'return',caption:'${i18n.return}[F12]'}
					]
				});
				
			 	$('#form_user_${pageId}').form({
			 		fields:[
							{fieldType:'fieldText',biaos:'enter',property:'keh',dataType:'keh',caption:'${i18n.keh}',notNull:true},
							{fieldType:'fieldLabel',property:'shij',value:getDateTime()},
							{fieldType:'fieldLabel',property:'cangkbh',value:st_Cangkbh},
			 		]
			 	});
			 	
 			 	//按客户查询
 			 	$('#keh').bind('enter',function(){
                    //参数校验
                    if(!$('#form_user_${pageId}').form("validateParam")){
                    	$('#grid_user_${pageId}').grid('clearRecords');
                        return;
                    }
                    var params = $('#form_user_${pageId}').form("getFormParam");
                    params.push('beihybh=${userName}');               
                    params.push('currentPage=1');
                    //设置分页条件
					$('#grid_user_${pageId}').grid("setQueryParams", params);
                    $('#grid_user_${pageId}').grid("load",params);
			    });
 			 	
			 	$(document).keyboardsupport({});
			});
		</script>
	</head>
	<body>
		<div style="padding:20px;">
			<div id="title"></div>
			<div id="form_user_${pageId}" class="ui-fieldLayout">
			 	<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>${i18n.keh}:</td>
							<td><div class="ui-field" id="keh"></div></td>
							<td>${i18n.shij}:</td>
							<td><div class="ui-field" id="shij"></div></td>
							<td>${i18n.cangkbh}:</td>
							<td><div class="ui-field" id="cangkbh"></div></td>
						</tr>
					</tbody>
				</table> 
			</div>
			<br></br>
			<div id="grid_user_${pageId}"></div>
			<br></br>
			<div id='prompt'>${i18n.prompt}</div> 
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>