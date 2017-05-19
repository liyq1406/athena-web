<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","164");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_164}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		$(function(){
			$('#form_user_${pageId}').form({
				onemoredemand:true,
		 		fields:[
		 		     {fieldType:'fieldSelect',property:'cangkbh',caption:'${i18n.cangk}',includeNull:true,notNull:false,src:'<%=request.getContextPath()%>/common/wareHouse.do'},
		 			 {fieldType:'fieldSelect',property:'flag',caption:'${i18n.shanclb}',value:$.sdcui.resource.i18n['P164_02'],realValue:'2',internation:true,notNull:true,src:'<%=request.getContextPath()%>/common/shanclb.do'},
					 {fieldType:'fieldText',property:'blh',dataType:'text',maxLength:'10',caption:'${i18n.blh}'},  
                     {fieldType:'fieldText',property:'elh',caption:'${i18n.elh}',dataType:'elh'},
                     {fieldType:'fieldText',property:'uth',caption:'${i18n.uth}',dataType:'uth'} ,
                     {fieldType:'fieldText',property:'caozy',dataType:'laiy',maxLength:'11',caption:'${i18n.caozy}'},
                     {fieldType:'fieldText',property:'shangxsj1',caption:'${i18n.shancqzsj}',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'}} ,
                     {fieldType:'fieldText',property:'shangxsj2',caption:'${i18n.shancqzsj}',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'}}
		 		]
		 	});
			
			$('#grid_user_${pageId}').grid({
				keyFields:['uth','blh','elh','lingjbh','yanssl','lingjsl','lingjmc','gongysdm','gongysdm','chengysdm','shancsj','jiaoylx','editor'],
				id:'grid_user_${pageId}',
				showCheckbox:false,
				//翻页查询交易
				src:'<%=request.getContextPath()%>/shouhuo/16401.do',
				cols:[
				//0010438
				{property:'uth',caption:'${i18n.uth}'},
				
		  		{property:'blh',caption:'${i18n.blh}'},
		  		{property:'elh',caption:'${i18n.elh}'},
		  		{property:'lingjbh',caption:'${i18n.lingjbh}'},
		  		
		  		//0010438		  		
		  		{property:'yanssl',caption:'${i18n.yanssl}'},
		  		{property:'lingjsl',caption:'${i18n.lingjsl}'},
		  		
		  		{property:'lingjmc',caption:'${i18n.lingjmc}'},
		  		{property:'gongysdm',caption:'${i18n.gongysdm}'},
		  		{property:'chengysdm',caption:'${i18n.chengysdm}'},
		  		{property:'shancsj',caption:'${i18n.shancsj}'},
		  		
		  		//0010438
		  		{property:'jiaoylx',caption:'${i18n.shanclb}'},
		  		
		  		{property:'editor',caption:'${i18n.caozy}'},
		  		
		  		{property:'cangkbh',caption:'${i18n.cangkbh}',width:'50'},
		  		
		  		{property:'shancyy',caption:'${i18n.shancyy}',width:'100'}
		  		
		  		
			],
			buttons:[
			   	 	{name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
			   	 	   $('#grid_user_${pageId}').grid('clearRecords');
				   	 	if(!$('#form_user_${pageId}').form("validateParam")){
				     		return;
				     	}
				   	 var starttime=new Date(($('#shangxsj1 input').val()).replace(/-/g,"/"));
                     var endtime=new Date(($('#shangxsj2 input').val()).replace(/-/g,"/"));
                     if(endtime<starttime){
                            showPromptMsg('red','${i18n.datetime_invalid}');
                             return false;
                        }
					    var params = $('#form_user_${pageId}').form("getFormParam");
			   	 		params.push("currentPage=1");
						//设置分页条件
						$('#grid_user_${pageId}').grid("setQueryParams", params);
						//加载数据
						$('#grid_user_${pageId}').grid("load",params);
			    		return false;
					}}
					,{name:'print',caption:'${i18n.print}[F8]',keyboard:'F8',action:function(){
					    var params = $('#form_user_${pageId}').form("getFormParam");
						//var params =$('#grid_user_${pageId}').grid('getQueryParams');  
					    var records = $('#grid_user_${pageId}').grid('getRecordAll');
					    
					    
					    /*传仓库列表，并且不能为空 2015.5.17*/
					    var ck = $('#cangkbh input').val();					    
					    
					    if(ck==''){
					    	$('#prompt span').css('color','red').text("${i18n.C_171_01}");
							return false;					    
					    }
					    
					    if(records.length < 1 || records.length == 0){
							$('#prompt span').css('color','red').text("${i18n.P164_0105}");
							return false;
						}			
					    
					    params = params.concat(records);
						var url = "<%=request.getContextPath()%>/shouhuo/16402.do";	
						
						$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
				 		    if (showPromptRequestMsg(results)==true){
									//加载返回数据
									//$('#grid_user_${pageId}').grid('parseResult',results);
				 		    }	 
				          });
		    		 return false;						
						}}
				　,{name:'back',caption:'${i18n.back}[F11]'}
		          ,{name:'return',caption:'${i18n.return}[F12]'}	
			
			]});

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
							<td>${i18n.cangkbh}:</td>
							<td><div class="ui-field" id="cangkbh"></div></td>
						</tr>
						
						
						<tr>
							<td>${i18n.blh}:</td>
							<td><div class="ui-field" id="blh"></div></td>
							<td>${i18n.elh}:</td>
							<td><div class="ui-field" id="elh"></div></td>
							<td>${i18n.uth}:</td>
							<td><div class="ui-field" id="uth"></div></td>
						</tr>
						<tr>
							<td>${i18n.caozy}:</td>
							<td><div class="ui-field" id="caozy"></div></td>
							<td>${i18n.shancqzsj}:</td>
							<td><div class="ui-field" style="float:left" id="shangxsj1"></div><div style="float:left" >至</div><div style="float:left" class="ui-field"  id="shangxsj2" ></div> </td>
							<td>${i18n.shanclb}:</td>
							<td><div class="ui-field" id="flag"></div></td>
						
						</tr>
					</tbody>
				</table> 
			</div>
			<div id="grid_user_${pageId}"></div>
          <div id='prompt'>${i18n.prompt}</div>
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>