<!-- huxy_11937 -->
<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","364");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
    <head>
        <title>${i18n.title_364}</title>
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
       var agocurr=new Date(newdate.getTime() - 1000 * 60 * 60 * 24 * 30).format('yyyy-MM-dd');
			
       //返回界面初始值
            $(function(){
                $('#grid_user_${pageId}').grid({
                    keyFields:['blh'],
                    id:'grid_user_${pageId}',
                    //showCheckbox:true, 12196
                    checkedOnlyOne:true,
                    //查询交易
                    src:'<%=request.getContextPath()%>/beihuo/36401.do',
                    cols:[
                        {property:'blh',caption:'${i18n.blh}',width:40},
                        {property:'chengysdm',caption:'${i18n.chengysdm}',width:30},
                        //12522 mudd
                        {property:'chengysmc',caption:'${i18n.mudd}',width:30},
                        {property:'tch',caption:'${i18n.tch}',width:30},
                        {property:'blscsj',caption:'${i18n.blscsj}',width:40},
                        {property:'zhuangt',caption:'${i18n.zhuangt}',width:40},
                    ],
                    buttons:[
                        //F1查询
                        {name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
                            //参数校验
                              $('#grid_user_${pageId}').grid('clearRecords');
                              if(!$('#form_user_${pageId}').form("validateParam")){
                                  return;
                            }
                            var begin = $('#qissj input').val();
                            var zz = $('#zhongzsj input').val();
                            if(begin=="" || zz=="")
                            {
                                 showPromptMsg('red','${i18n.qiszzsj_error}');
					             return ;
                            }                                                                                               
                            var start=new Date(($('#qissj input').val()).replace(/-/g,"/"));
				            var end=new Date(($('#zhongzsj input').val()).replace(/-/g,"/"));
				            if(end < start){
					              showPromptMsg('red','${i18n.datetime_invalid}');
					              return ;
				            }
				            if(end.getTime() - start.getTime() > 1000 * 60 * 60 * 24 * 30){
				           		  showPromptMsg('red','${i18n.data_invalid_30}');
					              return ;
				            }
                           var params =$('#form_user_${pageId}').form("getFormParam");  
                           //隐藏单位来判断是否回退 
                           $('#serachKey').val(params);                                          
                            //设置分页条件
				           $('#grid_user_${pageId}').grid("setQueryParams", params);
                           $('#grid_user_${pageId}').grid("load",params);
                        }},
                        {name:'duiz',caption:'${i18n.duiz}[F2]',keyboard:'F2',action:function(){
                            //12196
                        	var records = $('#grid_user_${pageId}').grid('getSelected',1);
                        	if(records.length > 1 || records.length < 1)
                        	{
                        		 showPromptMsg('red','${i18n.selectoneerror}');
                        		 return false;
                        	}
                        	var params = [];
                        	params[0] =records[0].toString().replace("list[0].","");
							params.push("currentPage=1");
							
							var url = "<%=request.getContextPath()%>/beihuo/36402.do";
			 				$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 			 		if (showPromptRequestMsg(results)==true){
			 			    		 if(results.result.response != 'C_1403'){
			 			    		//加载返回数据
									var strJSON=JSON.stringify(results);
									$('#putvalue').val(strJSON);								
									$("#putform").attr("action","<%=request.getContextPath()%>/beihuo/P36401.do"+st_Params);
	    			    			document.putform.submit();
    			    		  }
							 }
							});	
                       	 }},
                       //F4单选
						{name:'checked',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
								$('#grid_user_${pageId}').grid('selected');
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
                	onreload:true,
                    fields:[
                        {fieldType:'fieldText',property:'blh',maxLength:'17'},
                        {fieldType:'fieldSelect',property:'zhuangt',caption:'${i18n.zhuangt}',includeNull:true,notNull:false,src:'<%=request.getContextPath()%>/common/yesOrNo.do'},                                          
                        {fieldType:'fieldText',property:'qissj',dataType:'date',maskOptions:{mask:'9999-99-99'},value:agocurr}, 
                        {fieldType:'fieldText',property:'zhongzsj',dataType:'date',maskOptions:{mask:'9999-99-99'},value:curr},
                        //12588
                        {fieldType:'fieldSelect',property:'flag',caption:'${i18n.zhikcy}',includeNull:false,notNull:true,value:'N',realValue:'0',src:'<%=request.getContextPath()%>/common/yesOrNo.do'}, 
                    ]
                });
            //页面加载后，查询数据为界面赋值
			$(document).ready(function(){
			
							//加载返回数据
			if ( $('#serachKey').val()!=""){
					//为界面查询字段赋值
					var params = $('#serachKey').val().split(",");
					for(i=0;i<params.length;i++){
						var vParam = params[i].split("=");
						if (vParam[0].indexOf("blh") != -1){                   
							$('#blh input').val(vParam[1]);
						}else if (vParam[0].indexOf("qissj") != -1){
							$('#qissj input').val(vParam[1]); 
						}else if (vParam[0].indexOf("zhongzsj") != -1){
							$('#zhongzsj input').val(vParam[1]); 
						}else if (vParam[0].indexOf("zhuangt") != -1){
							$('#zhuangt input').val(vParam[1]); 
						}
						//12588
						else if (vParam[0].indexOf("flag") != -1){
							if(vParam[1] == '0')
								$('#flag input').val('N'); 
							else
							   $('#flag input').val('Y'); 
						}			
					}
					//设置分页条件
					$('#grid_user_${pageId}').grid("setQueryParams", params);
					//加载列表数据
					$('#grid_user_${pageId}').grid("load",params);
				}
				
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
                            <td>${i18n.blh}:</td>
                            <td><div class="ui-field" id="blh"></div></td>
                            <td>${i18n.shifyjs}:</td>
                            <td><div class="ui-field" id="zhuangt"></div></td>  
                         </tr>
                         
                        <tr>
                            <td>创建时间:</td>
                            <td> <div class="ui-field" style="float:left" id="qissj"></div><div style="float:left" >结束时间</div><div style="float:left" class="ui-field"  id="zhongzsj" ></div></td>                         
                           <!-- 12588 -->
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