<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","339");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_339}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['uth','elh','blh','ush','cangkbh','zickbh','kuwbh','lingjbh','lingjsl','danw','gongysdm','zhuangtsx','zhijz'],
					id:'grid_user_${pageId}',
					//查询交易
					src:'<%=request.getContextPath()%>/beihuo/33901.do',
					cols:[
					
					  	{property:'elh',caption:'${i18n.elh}',width:'50'},
					  	{property:'blh',caption:'${i18n.blh}',width:'50'},
					  	{property:'uth',caption:'${i18n.uth}',width:'50'},
					  	{property:'ush',caption:'${i18n.biaoqh}',width:'50'},
						{property:'cangkbh',caption:'${i18n.cangkh}',width:'50'},
						{property:'zickbh',caption:'${i18n.zickh}',width:'50'},
						{property:'kuwbh',caption:'${i18n.kuw}',width:'50'},
						{property:'lingjbh',caption:'${i18n.lingjh}',width:'50'},
						{property:'lingjmc',caption:'${i18n.lingjmc}',width:'50'},
						{property:'lingjsl',caption:'${i18n.shul}',width:'50'},
						{property:'danw',caption:'${i18n.lingjdw}',width:'50'},
						{property:'gongysdm',caption:'${i18n.gongysdm}',width:'50'},
						{property:'zhuangtsx',caption:'${i18n.zhuangtsx}',width:'50',internation:true},
						{property:'zhijz',caption:'${i18n.zhijz}',width:'50'},
						{property:'editor',caption:'${i18n.zhuangtczr}'},
						{property:'edit_time',caption:'${i18n.xiugrq}'}
					],
					buttons:[
                       //F1查询
                       {name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
                           //参数校验
                            $('#grid_user_${pageId}').grid('clearRecords');
                            if(!$('#form_user_${pageId}').form("validateParam")){
			     		          return;
			     	           }
				         
                           var baozzt = $('#baozzt input').val();
                           //判断包装状态是否有误 
                           if(baozzt <2 || baozzt > 19 ||   baozzt ==13){
                              showMsg("${i18n.baozzterror}"); 
                              return false;
                           }
                           var params = $('#form_user_${pageId}').form("getFormParam");
                           var cangkbh=$('#cangkbh input').attr("realValue");
                           //判断如果仓库下拉列表为空则代表所有仓库
                           if(cangkbh ==""){
                             params.push("flag=0");
                           }
                           params.push('currentPage=1');
                           //设置分页条件
				           $('#grid_user_${pageId}').grid("setQueryParams", params);
		                   $('#grid_user_${pageId}').grid("load",params);
                       }}, //0011470/0011522                   
					{name:'print',caption:'${i18n.print}[F8]',keyboard:'F8',action:function(){
					var params = $('#form_user_${pageId}').form("getFormParam");
					var records = $('#grid_user_${pageId}').grid('getRecordAll');
										
					var ck = $('#cangkbh input').val()
					
					if(ck==''){
						params.splice(0,1);
						params.push("cangkbh="+st_Cangkbh);
					}
					params=params.concat(records);
							//var params = $('#grid_user_${pageId}').grid('getSelectedAll');
							var url = "<%=request.getContextPath()%>/beihuo/33902.do";
							$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
					 		    if (showPromptRequestMsg(results)==true){
										//加载返回数据
					 		    }	 
					          });
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
	                    {fieldType:'fieldText',property:'lingjbh',caption:'${i18n.lingjh}',dataType:'letter_numeric',limitedLength:'10'},
	                    {fieldType:'fieldText',property:'gongysdm',dataType:'letter_numeric',limitedLength:'10'},
	                    {fieldType:'fieldSelect',property:'cangkbh',caption:'${i18n.cangk}',includeNull:true,src:'<%=request.getContextPath()%>/common/wareHouse.do'},
                        {fieldType:'fieldText',property:'zickbh',dataType:'letter_numeric',caption:'${i18n.zick}',limitedLength:'3'},
						{fieldType:'fieldText',property:'kuwbh',dataType:'letter_numeric',limitedLength:'6'},
						{fieldType:'fieldText',property:'baozzt',caption:'${i18n.baozzt}',dataType:'plusinteger',notNull:true},
						{fieldType:'fieldText',property:'caozy',dataType:'laiy',maxLength:'11',caption:'${i18n.caozr}'},
						{fieldType:'fieldText',property:'zhijz',dataType:'text',maxLength:'4',caption:'${i18n.zhijz}'},
						{fieldType:'fieldText',property:'elh',dataType:'elh',caption:'${i18n.elh}'}
			 		]
			 	});
			 	
			 	$(document).keyboardsupport({});
			});
		</script>
	</head>
	<body>
		<div style="padding:20px;">
			<div id="title"></div>
			<form id="putform" method="post" name="putform" >
                <input id="putvalue" name="putvalue" type="Hidden"></input>
            </form>
			<div id="form_user_${pageId}" class="ui-fieldLayout">
			 	<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
						    <td>${i18n.cangk}:</td>
							<td><div class="ui-field" id="cangkbh"></div></td>
						    <td>${i18n.baozzt}:</td>
							<td><div class="ui-field" id="baozzt"></div></td>
							<td>${i18n.lingjh}:</td>
							<td><div class="ui-field" id="lingjbh"></div></td>
						</tr>
						<tr>	
							
							
							<td>${i18n.gongysdm}:</td>
							<td><div class="ui-field" id="gongysdm"></div></td>
							<td>${i18n.kuw}:</td>
							<td><div class="ui-field" id="kuwbh"></div></td>
					        <td>${i18n.zick}:</td>
							<td><div class="ui-field" id="zickbh"></div></td>
						
						</tr>
						<tr>
							 <td>${i18n.zhijz}:</td>
							<td><div class="ui-field" id="zhijz"></div></td>
							<td>${i18n.elh}:</td>
							<td><div class="ui-field" id="elh"></div></td>
							<td>${i18n.caozr}:</td>
							<td><div class="ui-field" id="caozy"></div></td>
						</tr>
					</tbody>
				</table> 
			</div>
			<br></br>
			<div id="grid_user_${pageId}"></div>
			<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
			    <td align="right">2:</td>
				<td align="left">${i18n.ljbzzt2}</td>
				<td align="right">3:</td>
				<td align="left">${i18n.ljbzzt3}</td>
				<td align="right">4:</td>
				<td align="left">${i18n.ljbzzt4}</td>
				<td align="right">5:</td>
				<td align="left">${i18n.ljbzzt5}</td>
				
			
			</tr>
			<tr>
			    <td align="right">6:</td>
				<td align="left">${i18n.ljbzzt6}</td>
				<td align="right">7:</td>
				<td align="left">${i18n.ljbzzt7}</td>
		        <td align="right">8:</td>
				<td align="left">${i18n.ljbzzt8}</td>
				<td align="right">9:</td>
				<td align="left">${i18n.ljbzzt9}</td>
				
			</tr>
			<tr>
			   <td align="right">10:</td>
				<td align="left">${i18n.ljbzzt10}</td>
				<td align="right">11:</td>
				<td align="left">${i18n.ljbzzt11}</td>
		        <td align="right">12:</td>
				<td align="left">${i18n.ljbzzt12}</td>
				<td align="right">14:</td>
				<td align="left">${i18n.ljbzzt14}</td>
				
			</tr>
			<tr>
			    <td align="right">15:</td>
				<td align="left">${i18n.ljbzzt15}</td>
				<td align="right">16:</td>
				<td align="left">${i18n.ljbzzt16}</td>
		        <td align="right">17:</td>
				<td align="left">${i18n.ljbzzt17}</td>
				<td align="right">18:</td>
				<td align="left">${i18n.ljbzzt18}</td>
			</tr>
			<tr>
			    <td align="right">19:</td>
				<td align="left">${i18n.ljbzzt19}</td>
			</tr>
					</tbody>
				</table> 
			<div id='prompt'>${i18n.prompt}</div> 
			
			
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>