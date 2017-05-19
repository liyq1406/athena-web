<!-- huxy_11947 -->
<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","365");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
    <head>
        <title>${i18n.title_365}</title>
        <jsp:include page="../../common/js.jsp" />
        <script type="text/javascript">
        
            Date.prototype.format = function(format){
	        var o = {
	        "M+" : this.getMonth()+1, //month
	        "d+" : this.getDate(),    //day
	        "h+" : this.getHours(),   //hour
	        "m+" : this.getMinutes(), //minute
	        "s+" : this.getSeconds(), //second
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
       var curr=newdate.format('yyyy-MM-dd');
			
       //返回界面初始值
            $(function(){
                $('#grid_user_${pageId}').grid({
                    keyFields:[''],
                    id:'grid_user_${pageId}',
                    showCheckbox:false,
                    //查询交易
                    src:'<%=request.getContextPath()%>/beihuo/36501.do',
                    cols:[
                        {property:'lingjbh',caption:'${i18n.lingjbh}',width:20},
                        {property:'lingjmc',caption:'${i18n.lingjmc}',width:70},
                        {property:'dplingjsl',caption:'${i18n.dplingjsl}',width:30},
                        {property:'dflingjsl',caption:'${i18n.dflingjsl}',width:30},
                        {property:'chay',caption:'${i18n.chay}',width:25},
                        {property:'duizrq',caption:'${i18n.duizrq}',width:40}
                    ],
                    buttons:[
                        //F1查询
                        {name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
                            //参数校验
                              $('#grid_user_${pageId}').grid('clearRecords');
                              if(!$('#form_user_${pageId}').form("validateParam")){
                                  return;
                            }
                           var params =$('#form_user_${pageId}').form("getFormParam");                                         
                            //设置分页条件
				           $('#grid_user_${pageId}').grid("setQueryParams", params);
                           $('#grid_user_${pageId}').grid("load",params);
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
                        {fieldType:'fieldText',property:'lingjbh',maxLength:'10'},     
                        {fieldType:'fieldText',property:'rukrq',dataType:'date',maskOptions:{mask:'9999-99-99'},value:curr},
                        //12588
                        {fieldType:'fieldSelect',property:'flag',caption:'${i18n.zhikcy}',includeNull:false,notNull:true,value:'N',realValue:'0',src:'<%=request.getContextPath()%>/common/yesOrNo.do'}, 
                    ]
                });
            //页面加载后，查询数据为界面赋值
			$(document).ready(function(){
			});
            $(document).keyboardsupport({});
            });
        </script>
    </head>
    <body>
        <div style="padding:20px;">
            <div id="title"></div>
            <input id="serachKey" name="serachKey" type="Hidden"></input>
            <form id="putform" method="post" name="putform">
				<input id="putvalue" name="putvalue" type="Hidden"></input>
			</form> 
            <div id="form_user_${pageId}" class="ui-fieldLayout">
                <table class="ui-grid" cellspacing="1" width="100%">
                    <tbody>
                        <tr>
                            <td>${i18n.lingjbh}:</td>
                            <td><div class="ui-field" id="lingjbh"></div></td>
                            <td>库存时间:</td>
                            <td> <div class="ui-field" style="float:left" id="rukrq"></div></td>
                         </tr>
                         <tr>
                            <td>${i18n.zhikcy}:</td>
                            <td><div class="ui-field" id="flag"></div></td>  
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