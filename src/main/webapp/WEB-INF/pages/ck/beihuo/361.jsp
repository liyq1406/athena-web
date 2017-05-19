<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","361");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
    <head>
        <title>${i18n.title_361}</title>
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
       var curr=newdate.format('yyyy-MM-dd hh:mm:ss');
       var agocurr=new Date(newdate.getTime() - 1000 * 60 * 60 * 24 *0.5).format('yyyy-MM-dd hh:mm:ss');
			
            //返回界面初始值
            var searchKey = {};
            $(function(){
                $('#grid_user_${pageId}').grid({
                    keyFields:['yaohlh','gonghms'],
                    id:'grid_user_${pageId}',
                    //查询交易
                    src:'<%=request.getContextPath()%>/beihuo/36101.do',
                    cols:[
                        {property:'yaohlh',caption:'${i18n.yaohlh}',width:40},
                        {property:'gonghms',caption:'${i18n.mosh}',width:30},
                        {property:'cangkbh',caption:'${i18n.cangkbh}',width:35},
                        {property:'xiaohd',caption:'${i18n.xiaohd}',width:35},                     
                        {property:'lingjbh',caption:'${i18n.lingjbh}',width:40},
                        {property:'lingjmc',caption:'${i18n.lingjmc}',width:40},
                        {property:'yaohsl',caption:'${i18n.yaohsl}',width:40},
                        {property:'huoch',caption:'${i18n.xiaohch}',width:35},
                        {property:'tangc',caption:'${i18n.tangc}',width:30},
                        {property:'chex',caption:'${i18n.chex}',width:30},
                        {property:'shangxsj',caption:'${i18n.xiaohcxsj}',width:55},
                        {property:'beihsj',caption:'${i18n.beihsj}',width:55},
                        {property:'chuksj',caption:'${i18n.zhcksj}',width:55},
                        {property:'beihdh',caption:'${i18n.zhbhdh}',width:55},
                        //{property:'beihdztxx',caption:'${i18n.beihzt}',internation:true}
                    ],
                    //records:{'result':{'total':2,'rows':[{'baozdykh':'123','qizlsh':'1234','peislx':'12345','shangxbz':'123','lingjh':'1234','lingjmc':'12345','ush':'123','gongysdm':'1234','kuw':'123','zhuangcsl':'123','zuizsxsj':'12345','chex':'12345','ceng':'123'}]}},
                    buttons:[
                        //F1查询
                        {name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
                            //参数校验
                              $('#grid_user_${pageId}').grid('clearRecords');
                            if(!$('#form_user_${pageId}').form("validateParam")){
                                return;
                            }
                            
                            
                            var mosh = $('#gonghms input').val();
                            if(mosh==''){
                            	 showPromptMsg('red','${i18n.mosh_invalid}');
					             return false;
                            }
                            
                            //范围校验
                            if(!validRangeData("datetime", $('#qissj input').val(), $('#zhongzsj input').val())){
                                $('#qissj input').focus();
                                $('#qissj input').removeClass('validate-success').addClass('validate-error');
                                return;
                            }
                            
                              var start=new Date(($('#qissj input').val()).replace(/-/g,"/"));
				              var end=new Date(($('#zhongzsj input').val()).replace(/-/g,"/"));
				              if(end<start){
					                  showPromptMsg('red','${i18n.datetime_invalid}');
					                   return false;
				              }
                            
                              //范围校验
                              var starttime=new Date(($('#qissj input').val()).replace(/-/g,"/")).format('yyyy-MM-dd hh:mm:ss');
				              var endtime=new Date(($('#zhongzsj input').val()).replace(/-/g,"/")).format('yyyy-MM-dd hh:mm:ss');
				              if(endtime<starttime){
					                  showPromptMsg('red','${i18n.datetime_invalid}');
					                  return false;
				              }
				              
 
                             //var params = $('#form_user_${pageId}').form("getFormParam");
                            var params=[];
                            
                            var huoch=$('#huoch input').val();
				              
                            params.push('huoch='+ huoch);
                            params.push('cangkbh='+ $('#cangkbh input').attr('realValue'));
                            params.push('qissj='+ starttime);
                            params.push('zhongzsj='+ endtime);
                            params.push('gonghms='+ $('#gonghms input').attr('realValue'));
                            
                            params.push('currentPage=1');
                             
                            var tc = $('#tangc input').val();                          
                            if(tc==''){ //趟次限制最大2位，为空时传999   
                               params.push('tangc=999');                        
                            }else{
                               params.push('tangc='+tc );
                            }
                                                   
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
                        {fieldType:'fieldText',property:'huoch',maxLength:'5'},
                        {fieldType:'fieldText',property:'tangc',maxLength:'2'},
                        {fieldType:'fieldSelect',property:'cangkbh',caption:'${i18n.cangk}',src:'<%=request.getContextPath()%>/common/wareHouse.do'},                                          
                        {fieldType:'fieldText',property:'qissj',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'},value:agocurr}, 
                        {fieldType:'fieldText',property:'zhongzsj',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'},value:curr},
                        {fieldType:'fieldSelect',property:'gonghms',includeNull:true,src:'<%=request.getContextPath()%>/common/axywmosh.do'}
                    
                    ]
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
                            <td>${i18n.mosh}:</td>
                            <td><div class="ui-field" id="gonghms"></div></td>
                            
                            <td>${i18n.xiaohch}:</td>
                            <td><div class="ui-field" id="huoch"></div></td>  
                            
                            <td>${i18n.cangk}:</td>
                            <td><div class="ui-field" id="cangkbh"></div></td>
                         </tr>
                         
                         <tr>
                          <td>开始时间:</td>
                            <td> <div class="ui-field" style="float:left" id="qissj"></div><div style="float:left" >结束时间</div><div style="float:left" class="ui-field"  id="zhongzsj" ></div></td>
                           
                           <td>${i18n.tangc}:</td>
                            <td><div class="ui-field" id="tangc"></div></td>
                            
                            
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