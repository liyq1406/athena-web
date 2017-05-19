<!-- huxy_11937 -->
<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","36401");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
    <head>
        <title>${i18n.title_36401}</title>
        <jsp:include page="../../common/js.jsp" />
        <script type="text/javascript">			
       //返回界面初始值
            $(function(){
                $('#grid_user_${pageId}').grid({
                    keyFields:['blh'],
                    id:'grid_user_${pageId}',
                    //查询交易
                    src:'<%=request.getContextPath()%>/beihuo/36402.do',
                    cols:[
                        {property:'lingjbh',caption:'${i18n.lingjbh}',width:30},
                        {property:'dplingjsl',caption:'${i18n.dplingjsl}',width:25},
                        {property:'dflingjsl',caption:'${i18n.dflingjsl}',width:25},
                        {property:'chay',caption:'${i18n.chay}',width:25}
                    ],
                    buttons:[
                         //重新加载
                        {name:'back',caption:'${i18n.back}[F11]',keyboard:'F11'},
                        //F12返回
                        {name:'return',caption:'${i18n.return}[F12]'}
                    ]
                });
                
                $('#form_user_${pageId}').form({
                	onreload:true,
                    fields:[
                        {fieldType:'fieldLabel',property:'blh'},                    
                    ]
                });
            //页面加载后，查询数据为界面赋值
			$(document).ready(function(){
				//加载返回数据
				$('#blh').html('${result.result.parameter.blh}');
				//加载返回数据
				$('#grid_user_${pageId}').grid('parseResult',${result});
				var params = [];
				params.push("blh="+'${result.result.parameter.blh}');
				params.push("cangkbh="+st_Cangkbh);
				//var params = $('#form_user_${pageId}').form("getFormParam");
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
                            <td>${i18n.blh}:</td>
                            <td><div class="ui-field" id="blh"></div></td>                    
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