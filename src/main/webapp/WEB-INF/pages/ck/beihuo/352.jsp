<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","352");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_352}</title>
<jsp:include page="../../common/js.jsp" />
<script type="text/javascript">
$(function(){
     $('#grid_user1_${pageId}').hide();
     $('#grid_user2_${pageId}').hide();
	$('#form_user_${pageId}').form({
	    onreload:true,
 		fields:[
                {fieldType:'fieldText',property:'lingjbh',dataType:'letter_numeric',limitedLength:'10',caption:'${i18n.lingjbh}',notNull:true},
                {fieldType:'fieldSelect',property:'cangkbh',caption:'${i18n.cangk}',includeNull:true,src:'<%=request.getContextPath()%>/common/wareHouse.do'}

	 			]
 		});
 	$('#form_search_${pageId}').form({
 		fields:[
                {fieldType:'fieldText',property:'rownum',width:50,caption:'${i18n.hang}',notNull:true},
                {fieldType:'fieldText',property:'baozzt',biaos:'enter',width:50,caption:'${i18n.baozzt}',notNull:true,dataType:'plusinteger'}
	 			]
 		});
	$('#grid_user1_${pageId}').grid({
		keyFields:['cangkbh','lingjbh','shenbsl','magsl','zaitsl','gaibzsl','zhijsl','kucsl','jiessl','fanxsl',
		            'tuigyssl','dengdjfsl','jussl','','zhuanbhgsl','buhgsl','fangyssl','daixhsl','yixhsl','kehsl'],
		id:'grid_user_${pageId}',
		//翻页查询交易
		src:'<%=request.getContextPath()%>/beihuo/35201.do',
		//pageSize : 5,
		cols:[
			{property:'cangkbh',caption:'${i18n.cangkbh}',width:50},
			{property:'lingjbh',caption:'${i18n.lingjbh}',width:50},
	  		{property:'lingjmc',caption:'${i18n.lingjmc}',width:50},
	  		{property:'shenbsl',caption:'2',width:40},
	  		{property:'magsl',caption:'3',width:40},
	  		{property:'zaitsl',caption:'4',width:40},
	  		{property:'gaibzsl',caption:'5',width:40},
	  		{property:'zhijsl',caption:'6',width:40},
	  		{property:'kucsl',caption:'7',width:40},
	  		{property:'jiessl',caption:'8',width:40},
	  		{property:'fanxsl',caption:'9',width:40},
	  		{property:'tuigyssl',caption:'10',width:40},
	  		{property:'dengdjfsl',caption:'11',width:40},
	  		{property:'jussl',caption:'12',width:40},
	  		{property:'zhuanbhgsl',caption:'14',width:40},
	  		{property:'buhgsl',caption:'15',width:40},
	  		{property:'fangyssl',caption:'16',width:40},
	  		{property:'daixhsl',caption:'17',width:40},
	  		{property:'yixhsl',caption:'18',width:40},
	  		{property:'kehsl',caption:'19',width:40},
			{property:'shul',caption:'${i18n.huizsl}',width:50}
			
		   ]});
	$('#grid_user2_${pageId}').grid({
		keyFields:['','lingjbh','shenbsl','magsl','zaitsl','gaibzsl','zhijsl','kucsl','jiessl','fanxsl',
		            'tuigyssl','dengdjfsl','jussl','','zhuanbhgsl','buhgsl','fangyssl','daixhsl','yixhsl','kehsl'],
		id:'grid_user_${pageId}',
		//翻页查询交易
		src:'<%=request.getContextPath()%>/beihuo/35201.do',
		//pageSize : 5,
		cols:[
			{property:'lingjbh',caption:'${i18n.lingjbh}',width:50},
	  		{property:'lingjmc',caption:'${i18n.lingjmc}',width:50},
	  		{property:'shenbsl',caption:'2',width:40},
	  		{property:'magsl',caption:'3',width:40},
	  		{property:'zaitsl',caption:'4',width:40},
	  		{property:'gaibzsl',caption:'5',width:40},
	  		{property:'zhijsl',caption:'6',width:40},
	  		{property:'kucsl',caption:'7',width:40},
	  		{property:'jiessl',caption:'8',width:40},
	  		{property:'fanxsl',caption:'9',width:40},
	  		{property:'tuigyssl',caption:'10',width:40},
	  		{property:'dengdjfsl',caption:'11',width:40},
	  		{property:'jussl',caption:'12',width:40},
	  		{property:'zhuanbhgsl',caption:'14',width:40},
	  		{property:'buhgsl',caption:'15',width:40},
	  		{property:'fangyssl',caption:'16',width:40},
	  		{property:'daixhsl',caption:'17',width:40},
	  		{property:'yixhsl',caption:'18',width:40},
	  		{property:'kehsl',caption:'19',width:40},
			{property:'shul',caption:'${i18n.huizsl}',width:50}
			
		   ]});
	          $('#btn_search').bind('click',function(){
                    $('#grid_user_${pageId}').grid('clearRecords');
			   	 	if(!$('#form_user_${pageId}').form("validateParam")){
			     		return;
			     	}
				    var params = $('#form_user_${pageId}').form("getFormParam");
				     var cangkbh=$('#cangkbh input').attr("realValue");
				      if(cangkbh == ""){
                    	 params.push("flag=0");
                    }
				     params.push("usercenter="+st_UserCenter);
				     params.push("zhuangt=1");
		   	 		 params.push("currentPage=1");
		   	 		// params.push("pageSize=5");
					//设置分页条件
					$('#grid_user1_${pageId}').grid("setQueryParams", params);
					$('#serachKey').val(params);
					//加载数据
					$('#grid_user2_${pageId}').hide();
					$('#grid_user1_${pageId}').show();
					$('#grid_user1_${pageId}').grid("load",params);
					search = 1;
		    		return false;
                });  			
                $('#btn_select').bind('click',function(){
                    $('#grid_user_${pageId}').grid('clearRecords');
			   	 	if(!$('#form_user_${pageId}').form("validateParam")){
			     		return;
			     	}
				    var params = $('#form_user_${pageId}').form("getFormParam");
				    var cangkbh=$('#cangkbh input').attr('realValue');
				    if(cangkbh != ''){
                    	 params.push("flag=0");
                    }
				    params.push("usercenter="+st_UserCenter);
				    params.push("zhuangt=2");
		   	 		params.push("currentPage=1");
		   	 		//params.push("pageSize=5");
					//设置分页条件
					$('#grid_user2_${pageId}').grid("setQueryParams", params);
					$('#serachKey').val(params);
					//加载数据
					$('#grid_user1_${pageId}').hide();
					$('#grid_user2_${pageId}').show();
					$('#grid_user2_${pageId}').grid("load",params);
					search = 2;
		    		return false;
                });
         $("#baozzt").bind('enter',function(event){
		 		if(!$('#form_search_${pageId}').form("validateParam")){
		     		return;
		     	  }
	     	    var baozzt = $('#baozzt input').val();
                //判断包装状态是否有误 
                if(baozzt <2 || baozzt > 19 ||  baozzt ==13){
                   showMsg("${i18n.baozzterror}"); 
                   return false;
                }
		     	var rownum=$('#rownum input').val();
		     	var p =[];
		     	if($('#grid_user2_${pageId}').is(':hidden')){
		     	p = $('#grid_user1_${pageId}').grid('getSelectedByRowNum',rownum);
		 		}else if($('#grid_user1_${pageId}').is(':hidden')){
		     	p= $('#grid_user2_${pageId}').grid('getSelectedByRowNum',rownum);
		     	}else{
		     	showPromptMsg('red','${i18n.qxcx}')
					return false;
		     	
		     	}
		     	if (p.length != 20){
		 			showPromptMsg('red','${i18n.selectederror}')
					return false;
		     	   }
                if(p[baozzt].split("=")[1] == 0){
	                //包装状态下零件数量为0，不能查询
	                showPromptMsg('red','${i18n.bunck}')
	                  return false;
	                }
	             var params =[];
	             params.push("baozzt="+baozzt);
	             params.push("lingjbh="+p[1].split("=")[1]);
	             if('' == p[0].split("=")[1]){
	              params.push("flag=0");
	             }else{
	              params.push("cangkbh="+p[0].split("=")[1]);
	              params.push("flag=2");
	             }
	             params.push("currentPage=1");
				var url = "<%=request.getContextPath()%>/beihuo/33901.do";
			 		$('#form_search_${pageId}').form("submitUrl", params, url, function(results){
			 			 if (showPromptRequestMsg(results)==true){
			 			     if(results.result.response == '0000'){
				 				//加载返回数据
								var strJSON=JSON.stringify(results);
								$('#putvalue').val(strJSON);
								$("#putform").attr("action","<%=request.getContextPath()%>/beihuo/P35201.do"+st_Params);
	    			    		document.putform.submit();
    			    		 }
						 }
					});
					
		  });    	
	$(document).keyboardsupport({});
});

 //加载时判断是否是回退
		$(document).ready(function(){
			if ( $('#serachKey').val()!=""){
				//为界面查询字段赋值
				var params = $('#serachKey').val().split(",");
				var  search = 0; //当search为1时代表是点击F1查询，当search为2时代表是点击F2查询
				for(i=0;i<params.length;i++){
					var vParam = params[i].split("=");
					if (vParam[0].indexOf("lingjbh") != -1){                   //零件编号
						$('#lingjbh input').val(vParam[1])
						continue;
					}else if (vParam[0].indexOf("cangkbh") != -1){            //仓库编号
						$('#cangkbh input').val(vParam[1])
						$('#cangkbh input').attr("realValue",vParam[1]);
						continue;
					} else if (vParam[0].indexOf("zhuangt") != -1){             //卸货站台
						search = vParam[1] ;
						continue;
					}
				}
				if ('1' == search){
				    $('#grid_user1_${pageId}').grid("setQueryParams", params);
					//加载列表数据
					$('#grid_user1_${pageId}').show();
                    $('#grid_user2_${pageId}').hide();
					$('#grid_user1_${pageId}').grid("load",params,function(results){  });
			      }else if('2' == search){
			         $('#grid_user2_${pageId}').grid("setQueryParams", params);
					//加载列表数据
					$('#grid_user2_${pageId}').show();
                    $('#grid_user1_${pageId}').hide();
					$('#grid_user2_${pageId}').grid("load",params,function(results){  });
			      
			      }

			    
			}
		});
</script>
</head>
<body>
<!--主体内容开始-->
<div id="title"></div>
<input id="serachKey" name="serachKey" type="Hidden"></input>
<form id="putform" method="post" name="putform" >
    <input id="putvalue" name="putvalue" type="Hidden"></input>
</form>
<div id="form_user_${pageId}" class="ui-fieldLayout">
<table class="ui-grid" cellspacing="1" width="100%" >
	<tr>
		<td align="right" width="10%">${i18n.lingjbh}</td>
		<td align="left" width="20%"><div class="ui-field" id="lingjbh"></div></td>
		<td align="right" width="10%">${i18n.cangkbh}</td>
		<td align="left" width="20%"><div class="ui-field" id="cangkbh"></div></td>
	</tr>
  </table>
</div>
<div id="form_search_${pageId}" class="ui-fieldLayout">
<table class="ui-grid" cellspacing="1" width="100%"  align="center">
   <tr>
       <td width="10%" align="left" ></td>
       <td width="20%" align="left" >
       		<div style="float:left">${i18n.search}</div><div style="float:left" class="ui-field"  id="rownum" ></div><div style="float:left">${i18n.hzt}</div><div style="float:left" class="ui-field"  id="baozzt" ></div><div style="float:left">${i18n.sj}</div>      
      </td>
      <td width="10%"></td>
       <td align="left" width="20%"> <div><span id="btn_search" class="ui-button">${i18n.search}[F1]</span>
                 <span id="btn_select" class="ui-button">${i18n.search}[F2]</span>
                 <span id="btn_back" class="ui-button">${i18n.back}[F11]</span>
                 <span id="btn_return" class="ui-button">${i18n.return}[F12]</span>
            </div>
       </td>
    </tr>
  </table>
 </div>
  <div id="grid_user1_${pageId}" ></div>
  <div id="grid_user2_${pageId}" ></div>
  	<table class="ui-grid" cellspacing="1" width="100%">
		<tbody>
			<tr>
			    <td align="right">2:</td>
				<td align="left">${i18n.ljbzzt2}</td>
				<td align="right">3:</td>
				<td align="left">${i18n.ljbzzt3}</td>
				<td align="right">4:</td>
				<td align="left">${i18n.ljbzzt4}</td>
				<td align="right">5:</td>
				<td align="left">${i18n.ljbzzt5}</td>
				
			
			</tr>
			<tr>
			    <td align="right">6:</td>
				<td align="left">${i18n.ljbzzt6}</td>
				<td align="right">7:</td>
				<td align="left">${i18n.ljbzzt7}</td>
		        <td align="right">8:</td>
				<td align="left">${i18n.ljbzzt8}</td>
				<td align="right">9:</td>
				<td align="left">${i18n.ljbzzt9}</td>
				
			</tr>
			<tr>
			   <td align="right">10:</td>
				<td align="left">${i18n.ljbzzt10}</td>
				<td align="right">11:</td>
				<td align="left">${i18n.ljbzzt11}</td>
		        <td align="right">12:</td>
				<td align="left">${i18n.ljbzzt12}</td>
				<td align="right">14:</td>
				<td align="left">${i18n.ljbzzt14}</td>
				
			</tr>
			<tr>
			    <td align="right">15:</td>
				<td align="left">${i18n.ljbzzt15}</td>
				<td align="right">16:</td>
				<td align="left">${i18n.ljbzzt16}</td>
		        <td align="right">17:</td>
				<td align="left">${i18n.ljbzzt17}</td>
				<td align="right">18:</td>
				<td align="left">${i18n.ljbzzt18}</td>
			</tr>
			<tr>
			    <td align="right">19:</td>
				<td align="left">${i18n.ljbzzt19}</td>
			</tr>
		</tbody>
	</table> 
<div id='prompt'>${i18n.prompt}</div>
</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>