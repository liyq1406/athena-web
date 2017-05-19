<!-- huxy_11468 -->
<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","36301");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
    <head>
        <title>${i18n.title_36301}</title>
        <jsp:include page="../../common/js.jsp" />
        <script type="text/javascript">			
       //返回界面初始值
            $(function(){
                $('#grid_user_${pageId}').grid({
                    keyFields:['danjbh'],
                    id:'grid_user_${pageId}',
                    //查询交易
                    src:'<%=request.getContextPath()%>/beihuo/36302.do',
                    cols:[
                        {property:'danjbh',caption:'${i18n.zhuangcdh}',width:40},
                        {property:'uakh',caption:'${i18n.uah}',width:30},
                        {property:'ush',caption:'${i18n.ush}',width:30},
                        {property:'lingjbh',caption:'${i18n.lingjbh}',width:30},
                        {property:'lingjmc',caption:'${i18n.lingjmc}',width:75},
                        {property:'lingjsl',caption:'${i18n.lingjsl}',width:25},
                        {property:'keh',caption:'${i18n.keh}',width:25},
                        {property:'creator',caption:'${i18n.creator}',width:40},
                        {property:'create_time',caption:'${i18n.create_time}',width:40},
                    ],
                    buttons:[
                        //F1打印
                        {name:'btn_print',caption:'${i18n.print}[F1]',keyboard:'F1',action:function(){
                            //参数校验
                            var params = [];
                            params.push("danjbh="+$('#danjbh').html());
                            params.push("danjlx=33");
							var url = "<%=request.getContextPath()%>/common/12501.do";
					 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
					 		if (showPromptRequestMsg(results)==true){
									  
							}});
                        }},                     
                         //重新加载
                        {name:'back',caption:'${i18n.back}[F11]',keyboard:'F11'},
                        //F12返回
                        {name:'return',caption:'${i18n.return}[F12]'}
                    ]
                });
                
                $('#form_user_${pageId}').form({
                	onreload:true,
                    fields:[
                        {fieldType:'fieldLabel',property:'danjbh'},                    
                    ]
                });
            //页面加载后，查询数据为界面赋值
			$(document).ready(function(){
				//加载返回数据
				$('#danjbh').html('${result.result.parameter.danjbh}');
				//加载返回数据
				$('#grid_user_${pageId}').grid('parseResult',${result});
				var params = $('#form_user_${pageId}').form("getFormParam");
				$('#grid_user_${pageId}').grid("setQueryParams", params);
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
                            <td>${i18n.zhuangcdh}:</td>
                            <td><div class="ui-field" id="danjbh"></div></td>                    
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