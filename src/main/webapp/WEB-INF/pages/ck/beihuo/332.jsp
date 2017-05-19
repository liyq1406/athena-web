<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","332");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_332}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['beihdh'],
					id:'grid_user_${pageId}',
					//enableCutPage:false,
					//查询交易
					src:'<%=request.getContextPath()%>/beihuo/33201.do',
					cols:[
						{property:'beihdh',caption:'${i18n.beihdh}'},
						{property:'elh',caption:'${i18n.elh}'},
						{property:'ush',caption:'${i18n.ush}'},
						{property:'lingjsl',caption:'${i18n.shul}'},
						{property:'danw',caption:'${i18n.lingjdw}'},
						{property:'lingjbh',caption:'${i18n.lingjh}'},
						{property:'gongysdm',caption:'${i18n.gongys}'},
						{property:'cangkbh',caption:'${i18n.facck}'},
						{property:'jiesckbh',caption:'${i18n.jiesck}'},
						{property:'caozsj',caption:'${i18n.caozsj}'},
						{property:'zhuangt2',caption:'${i18n.yikbhdzt}',internation:true},
						{property:'zhuangtxx',caption:'${i18n.yikmxzt}',internation:true}
					],
					buttons:[
						//F1查询
                        {name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
                           
                            //参数校验
                            if(!$('#form_user_${pageId}').form("validateParam")){
                            	$('#grid_user_${pageId}').grid('clearRecords');
                                return;
                            }
                            
                          //自定义参数校验仓库 hzg 2014.9.24
                            if($("#cangkbh input").val()===""&&$("#jiesckbh input").val()===""){
                            	 showPromptMsg('red','发送仓库或接收仓库不能同时为空');
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
					]
				});
				
			 	$('#form_user_${pageId}').form({
			 	    onreload:true,
			 		onemoredemand:true,
			 		fields:[
                        {fieldType:'fieldText',property:'beihdh',caption:'${i18n.beihdh}',dataType:'beihdh'},    
						{fieldType:'fieldText',property:'lingjbh',caption:'${i18n.lingjh}',dataType:'letter_numeric',limitedLength:'10'},
						{fieldType:'fieldSelect',property:'cangkbh',includeNull:true,caption:'${i18n.facck}',src:'<%=request.getContextPath()%>/common/wareHouse.do'},
						{fieldType:'fieldSelect',property:'jiesckbh',includeNull:true,caption:'${i18n.jiesck}',src:'<%=request.getContextPath()%>/common/wareHouse.do'},
						{fieldType:'fieldSelect',property:'flag',internation:true,includeNull:true,src:'<%=request.getContextPath()%>/common/ckykzt.do'},
						{fieldType:'fieldSelect',property:'zhuangt',internation:true,includeNull:true,src:'<%=request.getContextPath()%>/common/ckykzt.do'}
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
						    <td>${i18n.beihdh}:</td>
							<td><div class="ui-field" id="beihdh"></div></td>
							<td>${i18n.lingjh}:</td>
							<td><div class="ui-field" id="lingjbh"></div></td>
							<td>${i18n.yikbhdzt}:</td>
							<td><div class="ui-field" id="flag"></div></td>
							<td>${i18n.yikmxzt}:</td>
							<td><div class="ui-field" id="zhuangt"></div></td>
						</tr>
						<tr>
						    <td>${i18n.facck}:</td>
							<td><div class="ui-field" id="cangkbh"></div></td>
							<td>${i18n.jiesck}:</td>
							<td><div class="ui-field" id="jiesckbh"></div></td>
							<td></td>
							<td></td>
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