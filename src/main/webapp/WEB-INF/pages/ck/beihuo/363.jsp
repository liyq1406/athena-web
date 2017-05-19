<!-- huxy_11468 -->
<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","363");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
    <head>
        <title>${i18n.title_363}</title>
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
       var agocurr=new Date(newdate.getTime() - 1000 * 60 * 60 * 24 *7).format('yyyy-MM-dd');
			
       //返回界面初始值
            $(function(){
                $('#grid_user_${pageId}').grid({
                    keyFields:['danjbh'],
                    id:'grid_user_${pageId}',
                    showCheckbox:true,
                    //查询交易
                    src:'<%=request.getContextPath()%>/beihuo/36301.do',
                    cols:[
                        {property:'danjbh',caption:'${i18n.zhuangcdh}',width:40},
                        {property:'gongysdm',caption:'${i18n.gongysdm}',width:30},
                        {property:'gongysmc',caption:'${i18n.gongysmc}',width:75},
                        {property:'chengysdm',caption:'${i18n.chengysdm}',width:30},
                        {property:'chengysmc',caption:'${i18n.chengysmc}',width:75},
                        {property:'creator',caption:'${i18n.creator}',width:40},
                        {property:'create_time',caption:'${i18n.create_time}',width:40},
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
				            if(end.getTime() - start.getTime() > 1000 * 60 * 60 * 24 *7){
				           		  showPromptMsg('red','${i18n.data_invalid}');
					              return ;
				            }
                           var params =$('#form_user_${pageId}').form("getFormParam");  
                           //隐藏单位来判断是否回退 
                           $('#serachKey').val(params);                                          
                            //设置分页条件
				           $('#grid_user_${pageId}').grid("setQueryParams", params);
                           $('#grid_user_${pageId}').grid("load",params);
                        }},
                        {name:'mingxi',caption:'${i18n.mingx}[F2]',keyboard:'F2',action:function(){
                        	var records = $('#grid_user_${pageId}').grid('getSelectedAll');
                        	if(records.length > 1 || records.length < 1)
                        	{
                        		 showPromptMsg('red','${i18n.selectoneerror}');
                        		 return false;
                        	}
                        	var params = [];
                        	var cangkbh=$('#cangkbh input').val();
                        	var st_params1 = "?st_fistPage="+st_FistPage+"&st_pageId="+st_PageId+"&st_mainPage="+st_MainPage+"&st_cangkbh="+cangkbh+"&st_cangklx="+st_Cangklx+"&st_rongqcbh="+st_Rongqcbh+"";
							params[0] =records[0].toString().replace("list[0].","");
							params.push("currentPage=1");
							var url = "<%=request.getContextPath()%>/beihuo/36302.do";
			 				$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 			 		if (showPromptRequestMsg(results)==true){
			 			    		 if(results.result.response != 'C_1403'){
			 			    		//加载返回数据
									var strJSON=JSON.stringify(results);
									$('#putvalue').val(strJSON);								
									$("#putform").attr("action","<%=request.getContextPath()%>/beihuo/P36301.do"+st_params1);
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
                        {fieldType:'fieldText',property:'keh',maxLength:'5'},
                        {fieldType:'fieldText',property:'beihdh',maxLength:'9'},
                        {fieldType:'fieldText',property:'danjbh',maxLength:'9'},
                        {fieldType:'fieldText',property:'lingjbh',maxLength:'10'},
                        {fieldType:'fieldText',property:'yaohlh',maxLength:'10'},
                        {fieldType:'fieldSelect',property:'cangkbh',includeNull:true,notNull:true,caption:'${i18n.cangk}',src:'<%=request.getContextPath()%>/common/wareHouse.do'},                                          
                        {fieldType:'fieldText',property:'qissj',dataType:'date',maskOptions:{mask:'9999-99-99'},value:agocurr}, 
                        {fieldType:'fieldText',property:'zhongzsj',dataType:'date',maskOptions:{mask:'9999-99-99'},value:curr},
                        {fieldType:'fieldText',property:'creator',maxLength:'20'}
                    
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
						if (vParam[0].indexOf("keh") != -1){                   
							$('#keh input').val(vParam[1]);
						}else if (vParam[0].indexOf("beihdh") != -1){
							$('#beihdh input').val(vParam[1]);
						} else if (vParam[0].indexOf("danjbh") != -1){
							$('#danjbh input').val(vParam[1]);
						} else if (vParam[0].indexOf("lingjbh") != -1){
							$('#lingjbh input').val(vParam[1]);
						}else if (vParam[0].indexOf("yaohlh") != -1){
							$('#yaohlh input').val(vParam[1]);
						}else if (vParam[0].indexOf("cangkbh") != -1){
							$('#cangkbh input').val(vParam[1]);
							$('#cangkbh input').attr('realValue',vParam[1]); 
						}else if (vParam[0].indexOf("qissj") != -1){
							$('#qissj input').val(vParam[1]); 
						}else if (vParam[0].indexOf("zhongzsj") != -1){
							$('#zhongzsj input').val(vParam[1]); 
						}else if (vParam[0].indexOf("creator") != -1){
							$('#creator input').val(vParam[1]); 
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
                            <td>${i18n.cangkbh}:</td>
                            <td><div class="ui-field" id="cangkbh"></div></td>
                            
                            <td>${i18n.keh}:</td>
                            <td><div class="ui-field" id="keh"></div></td>  
                            
                            <td>${i18n.beihdh}:</td>
                            <td><div class="ui-field" id="beihdh"></div></td>
                         </tr>
                         
                         <tr>                                                  
                           <td>${i18n.zhuangcdh}:</td>
                           <td><div class="ui-field" id="danjbh"></div></td>
                           <td>${i18n.lingjbh}:</td>
                           <td><div class="ui-field" id="lingjbh"></div></td>
                           <td>${i18n.yaohlh}:</td>
                           <td><div class="ui-field" id="yaohlh"></div></td>                       
                        </tr>
                        <tr>
                            <td>${i18n.creator}:</td>
                            <td><div class="ui-field" id="creator"></div></td>
                            <td>创建时间:</td>
                            <td> <div class="ui-field" style="float:left" id="qissj"></div><div style="float:left" >结束时间</div><div style="float:left" class="ui-field"  id="zhongzsj" ></div></td>                         
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