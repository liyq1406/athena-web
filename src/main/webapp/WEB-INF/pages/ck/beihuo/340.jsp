<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","340");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_340}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['ush'],
					id:'grid_user_${pageId}',
					//查询交易
					src:'<%=request.getContextPath()%>/beihuo/34001.do',
					cols:[
					  	{property:'elh',caption:'${i18n.elh}',width:'50'},
					  	{property:'cangkbh',caption:'${i18n.cangkh}',width:'40'},
						{property:'lingjsl',caption:'${i18n.lingjsl}',width:'40'},
						{property:'lingjbh',caption:'${i18n.lingjh}',width:'50'},
						{property:'lingjmc',caption:'${i18n.lingjmc}',width:'50'},
						{property:'gongysdm',caption:'${i18n.gongysdm}',width:'50'},
						{property:'pich',caption:'${i18n.pich}',width:'50'},
						{property:'usgs',caption:'${i18n.usgs}',width:'50'},
						{property:'baozztxx',caption:'${i18n.zhuangt}',internation:true,width:'50'},
						{property:'zhuangtsx',caption:'${i18n.shux}',width:'50',internation:true},
						{property:'utrq',caption:'${i18n.utrq}',width:'50'},
						{property:'blh',caption:'${i18n.blh}',width:'50'},
						{property:'editor',caption:'${i18n.zhuangtczy}',width:'50'},
						{property:'create_time',caption:'${i18n.xiehsj}',width:'50'},
						{property:'edit_time',caption:'${i18n.zhuangtczsj}',width:'50'}
					],
					buttons:[
                       //F1查询
                       {name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
                           //参数校验
                           if(!$('#form_user_${pageId}').form("validateParam")){
                        	   $('#grid_user_${pageId}').grid('clearRecords');
                               return;
                           }
                           var params = $('#form_user_${pageId}').form("getFormParam");
                           params.push('currentPage=1');
                           //设置分页条件
				           $('#grid_user_${pageId}').grid("setQueryParams", params);
                           $('#grid_user_${pageId}').grid("load",params);
                       }},
                       //重新加载
                       {name:'back',caption:'${i18n.back}[F11]'},
                       //F12返回
                       {name:'return',caption:'${i18n.return}[F12]'}
					]//,records:{'result':{'total':2,'rows':[{'baozdykh':'123','qizlsh':'1234','peislx':'12345','shangxbz':'123','lingjh':'1234','lingjmc':'12345','ush':'123','gongysdm':'1234','kuw':'123','zhuangcsl':'123','zuizsxsj':'12345','chex':'12345','ceng':'123'}]}},
				});
				
			 	$('#form_user_${pageId}').form({
			    	onreload:true,
			 		fields:[
						{fieldType:'fieldText',property:'lingjbh',caption:'${i18n.lingjh}',dataType:'letter_numeric',limitedLength:'10'},
                        {fieldType:'fieldText',property:'gongysdm',dataType:'letter_numeric',limitedLength:'10'},
                        {fieldType:'fieldSelect',property:'cangkbh',caption:'${i18n.cangk}',notNull:true,src:'<%=request.getContextPath()%>/common/wareHouse.do'},
                        {fieldType:'fieldText',property:'zickbh',dataType:'letter_numeric',caption:'${i18n.zick}',limitedLength:'3'},
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
							<td>${i18n.lingjh}:</td>
							<td><div class="ui-field" id="lingjbh"></div></td>
							<td>${i18n.gongysdm}:</td>
							<td><div class="ui-field" id="gongysdm"></div></td>
							<td>${i18n.cangk}:</td>
							<td><div class="ui-field" id="cangkbh"></div></td>
							<td>${i18n.zick}:</td>
							<td><div class="ui-field" id="zickbh"></div></td>
						</tr>
						<tr>
							<td>${i18n.elh}:</td>
							<td><div class="ui-field" id="elh"></div></td>
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