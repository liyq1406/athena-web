<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","34601");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_34601}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			var demorecord = {'result':{'total':1,cangkbh:st_Cangkbh,jiesckbh:'123','rows':[{us:'us1','shul':20,'lingjbh':123,'ush':'S00000001','gongysmc':345,'shangxbz':678,'shifsl':901,'danw':322,'kuw':012},{us:'us2','shul':20,'lingjbh':123,'ush':'S00000002','gongysmc':345,'shangxbz':678,'shifsl':901,'danw':322,'kuw':014}]}};
            var parameter = ${result.result.parameter};
			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['us'],
					id:'grid_user_${pageId}',
					//showCheckbox:true,
					//checkedOnlyOne:true, //是否单选
					//查询交易
					src:'<%=request.getContextPath()%>/beihuo/34602.do',
					cols:[
						{property:'yaohlh',caption:'${i18n.baozdykh}'},
						{property:'weiz',caption:'${i18n.weizh}'},
						{property:'zhengclsh',caption:'${i18n.zhengclsh}'},
						{property:'lingjbh',caption:'${i18n.lingjbh}'},
						{property:'lingjmc',caption:'${i18n.lingjmc}'},
						{property:'gongysdm',caption:'${i18n.gongysdm}'},
						{property:'gongysmc',caption:'${i18n.gongysmc}'},
						{property:'lingjsl',caption:'${i18n.lingjsl}'},
						{property:'danw',caption:'${i18n.lingjdw}'}
					],
					buttons:[
					    {name:'back',caption:'${i18n.back}[F11]'}
                        //F12返回
                       ,{name:'return',caption:'${i18n.return}[F12]'}
					]				
				});
				
			 	$('#form_user_${pageId}').form({
			 		fields:[
                        {fieldType:'fieldLabel',property:'yaohlh',value:parameter.yaohlh},
                        {fieldType:'fieldLabel',property:'yaohllx',value:parameter.yaohllx},
                        {fieldType:'fieldLabel',property:'xiehd',value:parameter.xiehd},
                        {fieldType:'fieldLabel',property:'cangkbh',value:parameter.cangkbh},
                        {fieldType:'fieldLabel',property:'keh',value:parameter.keh},
                        {fieldType:'fieldLabel',property:'yaohlzt',value:$.sdcui.resource.i18n[parameter.yaohlztxx]},
                        {fieldType:'fieldLabel',property:'jiaofzt',value:$.sdcui.resource.i18n[parameter.jiaofztxx]}
			 		]
			 	});
			 	//加载时判断是否是回退
    			$(document).ready(function(){
    				//加载GRID
    				$('#grid_user_${pageId}').grid('parseResult',${result})
    			})
               
				
				var initparams = [];
				initparams.push('yaohlh=' + parameter.yaohlh);
				initparams.push('cangkbh=' + parameter.cangkbh);
				//设置分页条件
				$('#grid_user_${pageId}').grid("setQueryParams", initparams);
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
							<td>${i18n.yaohlh}:</td>
							<td><div class="ui-field" id="yaohlh"></div></td>
							<td>${i18n.yaohlx}:</td>
                            <td><div class="ui-field" id="yaohllx"></div></td>
                            <td>${i18n.xiehd}:</td>
                            <td><div class="ui-field" id="xiehd"></div></td>
                            <td>${i18n.cangkbh}:</td>
                            <td><div class="ui-field" id="cangkbh"></div></td>
						</tr>
						<tr>
                            <td>${i18n.keh}:</td>
                            <td><div class="ui-field" id="keh"></div></td>
                            <td>${i18n.yaohlzt}:</td>
                            <td><div class="ui-field" id="yaohlzt"></div></td>
                            <td>${i18n.shifyw}:</td>
                            <td><div class="ui-field" id="jiaofzt"></div></td>
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