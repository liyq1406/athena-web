<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","346");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_346}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
			//var demorecord = {'result':{'total':1,cangkbh:st_Cangkbh,jiesckbh:'123','rows':[{yaohlh:'us1','shul':20,'lingjbh':123,'ush':'S00000001','gongysmc':345,'shangxbz':678,'shifsl':901,'danw':322,'kuw':012},{us:'us2','shul':20,'lingjbh':123,'ush':'S00000002','gongysmc':345,'shangxbz':678,'shifsl':901,'danw':322,'kuw':014}]}};
	        //返回界面初始值
            var searchKey = {};
			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['yaohlh','yaohllx','cangkbh','yaohlzt'],
					id:'grid_user_${pageId}',
					showCheckbox:true,
					checkedOnlyOne:true, //是否单选
					//查询交易
					src:'<%=request.getContextPath()%>/beihuo/34601.do',
					cols:[
						{property:'yaohlh',caption:'${i18n.yaohlh}',width:'40'},
						{property:'lingjbh',caption:'${i18n.lingjbh}',width:'40'},
						{property:'lingjmc',caption:'${i18n.lingjmc}',width:'55'},
						{property:'yaohsl',caption:'${i18n.lingjsl}',width:'40'},
						{property:'jiaofzl',caption:'${i18n.jiaofsl}',width:'40'},
						{property:'danw',caption:'${i18n.lingjdw}',width:'40'},
						{property:'dingdh',caption:'${i18n.dingdh}',width:'40'},
						{property:'chengysdm',caption:'${i18n.chengysdm}',width:'40'},
				  		{property:'gongysdm',caption:'${i18n.gongysdm}',width:'40'},
				  		{property:'yaohllx',caption:'${i18n.yaohlx}',width:'40'},
				  		{property:'zuiwsj',caption:'${i18n.zuiwsxsj}',width:'50'},
				  		{property:'xiehd',caption:'${i18n.xiehd}',width:'40'},
				  		{property:'mudd',caption:'${i18n.mudd}',width:'40'},
				  		{property:'cangkbh',caption:'${i18n.cangkbh}',width:'40'},
				  		{property:'shengbr',caption:'${i18n.jihydm}',width:'40'},
				  		{property:'keh',caption:'${i18n.keh}',width:'40'},
				  		{property:'tongblshqj',caption:'${i18n.liushqj}',width:'40'},
				  		{property:'yaohlztxx',internation:true,caption:'${i18n.zhuangt}',width:'40'},
				  		{property:'shiflsk',caption:'${i18n.shiflsk}',width:'40'},
				  		{property:'create_time',caption:'${i18n.biaodsj}',width:'40'},
				  		{property:'shiffsgys',internation:true,caption:'${i18n.shiffsgys}',width:'40'}
					],
					buttons:[
						//F1查询
						{name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
                            //参数校验
                            if(!$('#form_user_${pageId}').form("validateParam")){
                            	$('#grid_user_${pageId}').grid('clearRecords');
                                return;
                            }
                            
                            //范围校验
                            if(!validRangeData("datetime", $('#shangxsj1 input').val(), $('#shangxsj2 input').val())){
                                $('#shangxsj1 input').focus();
                                $('#shangxsj1 input').removeClass('validate-success').addClass('validate-error');
                                return;
                            }
                            
                            var params = $('#form_user_${pageId}').form("getFormParam");
                            params.push('currentPage=1');
                            //设置分页条件
				            $('#grid_user_${pageId}').grid("setQueryParams", params);
                            $('#grid_user_${pageId}').grid("load",params);
						}},
						//F4单选
						{name:'checked',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
								$('#grid_user_${pageId}').grid('selected');
								msgClear();
								return false;
						}},
						//F5全选
                        {name:'selectall',caption:'${i18n.selectall}[F5]',keyboard:'F5',action:function(){
                                $('#grid_user_${pageId}').grid('selectedAll');
                                msgClear();
                                return false;
                        }},
	                    //F6查看备货单
	                    {name:'lookbhd',caption:'${i18n.lookbhd}[F6]',keyboard:'F6',action:function(){
	                        	if($('#zhuangt input').attr('realValue')=='2'){
	                        		var params = $('#grid_user_${pageId}').grid('getSelectedAll');
		                             if(params.length != 4){
		                                 showPromptMsg('red','${i18n.selecterror}');
		                                 return false;
		                             }
		                             for(i=0;i<params.length;i++){
		         						params[i]=params[i].toString().replace("list[0].","");
		         					}
		         					if('03' == params[3].split('=')[1]){
		         					params.push('beihybh=${userName}');
		                             var url="<%=request.getContextPath()%>/beihuo/31401.do";
		                             $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
		                             	if (showPromptRequestMsg(results)){
		                                     if (results.result.response == "0001"){
		                                         //保存界面值
		                                         searchKey = {
		                                             lingjbh:$('#lingjbh input').val(),
		                                             gongysdm:$('#gongysdm input').val(),
		                                             chengysdm:$('#chengysdm input').val(),
		                                             shengbr:$('#shengbr input').val(),
		                                             yaohllx:$('#yaohllx input').val(),
		                                             xiehd:$('#xiehd input').val(),
		                                             cangkbh:$('#cangkbh input').val(),
		                                             keh:$('#keh input').val(),
		                                             yaohlztxx:$('#yaohlzt input').val(),
		                                             zhuangt:$('#zhuangt input').attr('realValue'),
		                                             zhuangtxx:$('#zhuangt input').val(),
		                                             yaohlzt:$('#yaohlzt input').attr('realValue'),
		                                             fahd:$('#fahd input').val(),
		                                             shangxsj1:$('#shangxsj1 input').val(),
		                                             shangxsj2:$('#shangxsj2 input').val(),
		                                             flag:$('#flag input').attr('realValue'),
                                          		     flagxx:$('#flag input').val(),
                                            		 shiffsgys:$('#shiffsgys input').attr('realValue'),
                                            		 shiffsgysxx:$('#shiffsgys input').val(),
		                                             params:$('#grid_user_${pageId}').grid('getQueryParams')
		                                         };
		                                         var strSearchKey=JSON.stringify(searchKey);
		                                         $('#searchKey').val(strSearchKey);
		                                         
		                                         //加载返回数据
		                                         var strJSON=JSON.stringify(results);
		                                         var beihlx=results.result.parameter.beihlx;
		                                         $('#putvalue').val(strJSON);
		                                         $("#putform").attr("action","<%=request.getContextPath()%>/beihuo/P31401.do"+st_Params+"&beihlx="+beihlx);
		                                         document.putform.submit();
		                                     }
		                                 }
		                             });
	                        	}else{
	                        		showPromptMsg('red','${i18n.bnckbhd}');
	                        	}
	                         }else{
	                            showPromptMsg('red','${i18n.bnckbhd}');
	                            
	                         }
	                                return false;
	                        }},
						//F7查看
						{name:'info',caption:'${i18n.info}[F7]',keyboard:'F7',action:function(){
                            var params = $('#grid_user_${pageId}').grid('getSelectedAll');
                            if(params.length != 4){
                                showPromptMsg('red','${i18n.selecterror}');
                                return false;
                            }
                            //加上要货令类型判断：同步/集配要货令可以查询明细
                            if(params[1].toString().replace("list[0].","")!= 'yaohllx=SY'){
                            	showPromptMsg('red',$.sdcui.resource.i18n['C_F_NOTTONGBJP']);
                                return false;
                            }
                            //去掉List[0];
                            for(i=0;i<params.length;i++){
                                params[i]=params[i].toString().replace("list[0].","");
                            }
                            
                            var url="<%=request.getContextPath()%>/beihuo/34602.do";
                            $('#form_user_${pageId}').form("submitUrl", params, url, function(results){
                            	if (showPromptRequestMsg(results)){
                                    if (results.result.response == "0000"){
                                        //保存界面值
                                        searchKey = {
                                            lingjbh:$('#lingjbh input').val(),
                                            gongysdm:$('#gongysdm input').val(),
                                            chengysdm:$('#chengysdm input').val(),
                                            shengbr:$('#shengbr input').val(),
                                            yaohllx:$('#yaohllx input').val(),
                                            yaohllxxx:$('#yaohllx input').attr('realValue'),
                                            xiehd:$('#xiehd input').val(),
                                            cangkbh:$('#cangkbh input').val(),
                                            keh:$('#keh input').val(),
                                            yaohlztxx:$('#yaohlzt input').val(),
                                            yaohlzt:$('#yaohlzt input').attr('realValue'),
                                            fahd:$('#fahd input').val(),
                                            shangxsj1:$('#shangxsj1 input').val(),
                                            shangxsj2:$('#shangxsj2 input').val(),
                                            zhuangt:$('#zhuangt input').attr('realValue'),
                                            zhuangtxx:$('#zhuangt input').val(),
                                            flag:$('#flag input').attr('realValue'),
                                            flagxx:$('#flag input').val(),
                                            shiffsgys:$('#shiffsgys input').attr('realValue'),
                                            shiffsgysxx:$('#shiffsgys input').val(),
                                            params:$('#grid_user_${pageId}').grid('getQueryParams')
                                        };
                                        var strSearchKey=JSON.stringify(searchKey);
                                        $('#searchKey').val(strSearchKey);
                                        
                                        //加载返回数据
                                        var strJSON=JSON.stringify(results);
                                        $('#putvalue').val(strJSON);
                                        $("#putform").attr("action","<%=request.getContextPath()%>/beihuo/P34601.do"+st_Params);
                                        document.putform.submit();
                                    }
                                }
                            });
						}},
						//F8打印
						{name:'print',caption:'${i18n.print}[F8]',keyboard:'F8',action:function(){
							//参数校验
 					 		var params =[];
 					 		params.push("zhuangt="+$('#zhuangt input').attr("realValue"));
 					 		params.push("cangkbh="+st_Cangkbh);
 					 		 var records = $('#grid_user_${pageId}').grid('getSelectedAll');
                             if(records.length <3){
                                showPromptMsg('red','${i18n.selectoneerror}');
                                return false;
                            }
                           params=params.concat(records);
						   	  	 var url = "<%=request.getContextPath()%>/beihuo/34603.do";
						 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
						 			if (showPromptRequestMsg(results)==true){
									  
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
			 		    {fieldType:'fieldSelect',property:'zhuangt',caption:'${i18n.yaohllx}',internation:true,notNull:true,onselect:'flagchange()',src:'<%=request.getContextPath()%>/common/yaohllx.do'},
                        {fieldType:'fieldText',property:'lingjbh',caption:'${i18n.lingjh}',dataType:'letter_numeric',limitedLength:'10'},
                        {fieldType:'fieldText',property:'gongysdm',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.gongysdm}'},
                        {fieldType:'fieldText',property:'dingdh',dataType:'text',maxLength:'12',caption:'${i18n.dingdh}'},
                        {fieldType:'fieldText',property:'chengysdm',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.chengysdm}'},
                        {fieldType:'fieldText',property:'shengbr',dataType:'yonghbh' ,caption:'${i18n.jihydm}'},
                        {fieldType:'fieldSelect',property:'yaohllx',caption:'${i18n.yaohllx}' },
                        {fieldType:'fieldText',property:'xiehd',dataType:'letter_numeric',limitedLength:'6',caption:'${i18n.xiehd}'},
                        {fieldType:'fieldSelect',property:'cangkbh',caption:'${i18n.cangkbh}',includeNull:true,src:'<%=request.getContextPath()%>/common/wareHouse.do'},
                        {fieldType:'fieldText',property:'keh',dataType:'keh',caption:'${i18n.keh}'},
                        {fieldType:'fieldSelect',property:'yaohlzt',internation:true,includeNull:true,caption:'${i18n.zhuangt}'},
                        {fieldType:'fieldText',property:'fahd',dataType:'letter_numeric',limitedLength:'3',caption:'${i18n.fahd}'},
                        {fieldType:'fieldText',property:'shangxsj1',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'},caption:'${i18n.shij}'},
                        {fieldType:'fieldText',property:'shangxsj2',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'},caption:'${i18n.shij}'},
                        {fieldType:'fieldSelect',property:'flag',internation:true,includeNull:true,caption:'${i18n.shaixuan}',src:'<%=request.getContextPath()%>/common/shaixuan.do'},
                        {fieldType:'fieldSelect',property:'shiffsgys',includeNull:true,caption:'${i18n.shiffsgys}',src:'<%=request.getContextPath()%>/common/yesOrNo.do'},
                        {fieldType:'fieldText',property:'peislb',dataType:'letter_numeric',caption:'${i18n.peislb}',limitedLength:'4',caption:'${i18n.peislb}'},
                        
                        //11423
                        {fieldType:'fieldSelect',property:'shiflsk',caption:'${i18n.shiflsk}',includeNull:true,notNull:false,value:'N',realValue:'0',src:'<%=request.getContextPath()%>/common/yesOrNo.do'}	
                        
                        
			 		]
			 	});
               
                
                //从跳转页面返回
                $(document).ready(function(){
                    var searchKeyValue = $('#searchKey').val();
                    //判断是否页面返回
                    if (searchKeyValue){
                        searchKey = JSON.parse(searchKeyValue);
                        //返回form参数
                        $('#lingjbh input').val(searchKey.lingjbh);
                        $('#gongysdm input').val(searchKey.gongysdm);
                        $('#chengysdm input').val(searchKey.chengysdm);
                        $('#shengbr input').val(searchKey.shengbr);
                        $('#yaohllx input').val(searchKey.yaohllx);
                        $('#yaohllx  input').attr('realValue',searchKey.yaohllxxx);
                        $('#xiehd input').val(searchKey.xiehd);
                        $('#cangkbh input').val(searchKey.cangkbh);
                        $('#keh input').val(searchKey.keh);
                        $('#peislb input').val(searchKey.peislb);
                        $('#yaohlzt input').val(searchKey.yaohlztxx);
                        $('#yaohlzt input').attr('realValue',searchKey.yaohlzt);
                        $('#fahd input').val(searchKey.fahd);
                        $('#shangxsj1 input').val(searchKey.shangxsj1);
                        $('#shangxsj2 input').val(searchKey.shangxsj2);
                        $('#zhuangt input').val(searchKey.zhuangtxx);
                        $('#zhuangt input').attr('realValue',searchKey.zhuangt);
                        $('#flag input').attr('realValue',searchKey.flag);
                        $('#flag input').val(searchKey.flagxx);
                        $('#shiffsgys input').attr('realValue',searchKey.shiffsgys);
                        $('#shiffsgys input').val(searchKey.shiffsgysxx);
                        //返回gird查询
                        var params = searchKey.params;
                        //设置分页条件
				        $('#grid_user_${pageId}').grid("setQueryParams", params);
                        $('#grid_user_${pageId}').grid("load",params);
                    }
                });
                
			 	$(document).keyboardsupport({});
			});
			
			function flagchange(){
 	            var  zhuangt = $('#zhuangt input').attr("realValue");
	 			if(zhuangt!=""){
	 				 $('#yaohllx').fieldSelect('resetUrl','<%=request.getContextPath()%>/common/waibandneibghms.do'+st_Params+'&zhuangt='+zhuangt);
	 				  $('#yaohlzt').fieldSelect('resetUrl','<%=request.getContextPath()%>/common/yaohlzt.do'+st_Params+'&zhuangt='+zhuangt);
	 				 
	 			}
	 		}
		</script>
	</head>
	<body>
		<div style="padding:20px;">
			<div id="title"></div>
			<input id="searchKey" name="searchKey" type="Hidden"></input>
			<form id="putform" method="post" name="putform" >
				<input id="putvalue" name="putvalue" type="Hidden"></input>
			</form>
			<div id="form_user_${pageId}" class="ui-fieldLayout">
			 	<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
						    <td>${i18n.yaohllx}:</td>
							<td><div class="ui-field" id="zhuangt"></div></td>
							<td>${i18n.yaohlx}:</td>
                            <td><div class="ui-field" id="yaohllx"></div></td>
							<td>${i18n.zhuangt}:</td>
                            <td><div class="ui-field" id="yaohlzt"></div></td>
							
						</tr>
						<tr>
						    <td>${i18n.cangkbh}:</td>
                            <td><div class="ui-field" id="cangkbh"></div></td> 
						    <td>${i18n.lingjbh}:</td>
							<td><div class="ui-field" id="lingjbh"></div></td>
							<td>${i18n.gongysdm}:</td>
                            <td><div class="ui-field" id="gongysdm"></div></td>
                         </tr>
                         <tr>   
                            <td>${i18n.chengysdm}:</td>
                            <td><div class="ui-field" id="chengysdm"></div></td>
                            <td>${i18n.xiehd}:</td>
                            <td><div class="ui-field" id="xiehd"></div></td>
                             <td>${i18n.keh}:</td>
                            <td><div class="ui-field" id="keh"></div></td>
                        </tr>
                        <tr>
                            <td>${i18n.dingdh}:</td>
                            <td><div class="ui-field" id="dingdh"></div></td>
                            <td>${i18n.jihydm}:</td>
                            <td><div class="ui-field" id="shengbr"></div></td>
                            <td>${i18n.fahd}:</td>
                            <td><div class="ui-field" id="fahd"></div></td>
                           
                        </tr>
                        <tr>
                           <td>${i18n.shij}:</td>
                            <td>
                                <div class="ui-field" style="float:left" id="shangxsj1"></div><div style="float:left" >至</div><div style="float:left" class="ui-field"  id="shangxsj2" ></div>
                            </td>
                             <td>${i18n.shaixuan}:</td>
                            <td>
                                <div class="ui-field" style="float:left" id="flag"></div>
                            </td>
                             <td>${i18n.shiffsgys}:</td>
                            <td>
                                <div class="ui-field" style="float:left" id="shiffsgys"></div>
                            </td>
                        </tr>
                        <tr>  
                             <td>${i18n.peislb}:</td>
                            <td><div class="ui-field" id="peislb"></div></td>
                                                        
                             <td>${i18n.shiflsk}:</td>
                            <td><div class="ui-field" id="shiflsk"></div></td>                                                       
                            
                        </tr>
                        
					</tbody>
				</table> 
			</div>
			<div id="grid_user_${pageId}"></div>
			<div id='prompt'>${i18n.prompt}</div> 
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>