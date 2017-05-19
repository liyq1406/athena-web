<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","207");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_207}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		$(function(){
			$('#form_user_${pageId}').form({
				onemoredemand:true,
				onreload:true,
		 		fields:[
				{fieldType:'fieldText',property:'renwbh',dataType:'jiufdh',caption:'${i18n.renwbh}',notNull:false},
				{fieldType:'fieldSelect',property:'kuczt',caption:'${i18n.zhuangt}',notNull:false,includeNull:true,internation:true,src:'<%=request.getContextPath()%>/common/shengczt.do'}, 	
				{fieldType:'fieldText',property:'shengckcsj',dataType:'date',maskOptions:{mask:'9999-99-99'},maskOptions:{mask:'9999-99-99'},caption:'${i18n.shengckcsj}',notNull:false},
				{fieldType:'fieldText',property:'creator',maxLength:'16',caption:'${i18n.creator}',notNull:false},
				{fieldType:'fieldSelect',property:'pandfs',caption:'${i18n.pandfs}',notNull:false,includeNull:true,internation:true,src:'<%=request.getContextPath()%>/common/pandfs.do'}
		 		]
		 	});

			$('#grid_user_${pageId}').grid({
				keyFields:['renwbh','cangkbh','pandfs','zhuangt'],
				id:'grid_user_${pageId}',
				showCheckbox:true,
				src:'<%=request.getContextPath()%>/kunei/20701.do',
				cols:[
				{property:'renwbh',caption:'${i18n.renwbh}'},
		  		{property:'usercenter',caption:'${i18n.usercenter}'},
		  		{property:'cangkbh',caption:'${i18n.cangk}'},
		  		{property:'pandfsxx',caption:'${i18n.pandfs}',internation:true},
		  		{property:'shengckcsj',caption:'${i18n.shengckcsj}'},
		  		{property:'creator',caption:'${i18n.creator}'},
		  		{property:'kucscfsxx',caption:'${i18n.kucscfs}',internation:true},
		  		{property:'zhuangtxx',caption:'${i18n.zhuangt}',internation:true},
		  		{property:'xianskkw',caption:'${i18n.xianskkw}',internation:true},
		  		{property:'ancpx',caption:'${i18n.ancpx}',internation:true}
			],
		 	buttons:[
		 	//查询
			{name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
				//参数校验
		 		if(!$('#form_user_${pageId}').form("validateParam")){
		 			$('#grid_user_${pageId}').grid('clearRecords');
	 				return;	
		 		}
				//查询并显示数据
		 		var params = $('#form_user_${pageId}').form("getFormParam");
		 		params.push("currentPage=1");
				//设置分页条件
				$('#grid_user_${pageId}').grid("setQueryParams", params);
				//加载数据
				$('#grid_user_${pageId}').grid("load",params);
	    		return false;
			}}
			//单选
			,{name:'getSelected',caption:'${i18n.checked}[F4]',keyboard:'F4',action:function(){
				msgClear();
				$('#grid_user_${pageId}').grid('selected');
				return false;
			}}
			//全选
			,{name:'selectedAll',caption:'${i18n.selectall}[F5]',keyboard:'F5',action:function(){
				msgClear();
				$('#grid_user_${pageId}').grid('selectedAll');
				return false;
			}}
			//查看
			,{name:'info',caption:'${i18n.info}[F7]',keyboard:'F7',action:function(){
				//获取选择行
				var currPandfs=$('#grid_user_${pageId}').grid('getSelectedColumnValue','pandfs')
		        if(currPandfs.length!=1){
		        	showPromptMsg('red','${i18n.selecterror}')
					return false;
				} 
				var currZhuangt=$('#grid_user_${pageId}').grid('getSelectedColumnValue','zhuangt')
				if (currZhuangt==2) {
					//1、已生成，2、未生成
					showPromptMsg('red',$.sdcui.resource.i18n['P207_P0101'])
					return false;
				}
				//存放查询条件
				var vQuery = $('#grid_user_${pageId}').grid('getQueryParams')
				vQuery.push("kucztxx="+$('#kuczt input').val());
				vQuery.push("pandfsxx="+$('#pandfs input').val());
				$('#serachKey').val(vQuery);
                //页面数据提交并跳转，判断盘点方式，打开不同的查看页面
                var params = $('#grid_user_${pageId}').grid('getSelectedAll');
				params.push("currentPage=1");
				//去掉List[0];
				for(i=0;i<params.length;i++){
					params[i]=params[i].toString().replace("list[0].","");
				}
				//1、滚动盘点，2、静态盘点
                if (currPandfs=="1"){
                	var url = "<%=request.getContextPath()%>/kunei/20702.do";
			 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 			 if (showPromptRequestMsg(results)==true){
			 				//加载返回数据
							var strJSON=JSON.stringify(results);
							$('#putvalue').val(strJSON);
							$("#putform").attr("action","<%=request.getContextPath()%>/kunei/P20701.do"+st_Params);
    			    		document.putform.submit();
						 }
					});
                }else{
                	var url = "<%=request.getContextPath()%>/kunei/20703.do";
			 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 			 if (showPromptRequestMsg(results)==true){
			 				//加载返回数据
							var strJSON = JSON.stringify(results);
							$('#putvalue').val(strJSON);
							$("#putform").attr("action","<%=request.getContextPath()%>/kunei/P20702.do"+st_Params);
    			    		document.putform.submit();
						 }
					});
                }
				return false;
			}}
			//打印
			,{name:'print',caption:'${i18n.print}[F8]',keyboard:'F8',action:function(){
				//获取选中行的任务编号
				var records = [];
		 		var recordsRwbh = $('#grid_user_${pageId}').grid('getSelectedColumnValue','renwbh');
				var recordsZt = $('#grid_user_${pageId}').grid('getSelectedColumnValue','zhuangt');
				//踢出状态是未生成的
				var index=0;
				for(var i=0; i<recordsRwbh.length; i++){
					//1、已生成，2、未生成
					if (recordsZt[i].toString()==1){
						records.push("list["+index.toString()+"].renwbh="+recordsRwbh[i]);
						index++;
					}  
				}
		 		if(records.length < 1){
					showPromptMsg('red',$.sdcui.resource.i18n['P211_P0104'])
					return false;
				}
		 		//调用打印服务
				var params = $('#form_user_${pageId}').form('getFormParam')
				params = params.concat(records);
				var url = "<%=request.getContextPath()%>/kunei/20704.do";
		 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
		 			 if (showPromptRequestMsg(results)==true){
		 				//打印成功
					 }
				});
				return false;
			}}
			//重新加载
			,{name:'back',caption:'${i18n.back}[F11]'}
			//返回
			,{name:'return',caption:'${i18n.return}[F12]'}
			]});
		
			//加载时判断是否是回退
			$(document).ready(function(){
				if ( $('#serachKey').val()!=""){
					//为界面查询字段赋值
					var params = $('#serachKey').val().split(",");
					for(i=0;i<params.length;i++){
						var vParam = params[i].split("=");
						if (vParam[0].indexOf("renwbh") != -1){                   //任务编号
							$('#renwbh input').val(vParam[1]);
							continue;
						} else if (vParam[0].indexOf("kucztxx") != -1){           //状态信息
							$('#kuczt input').val(vParam[1]);
							continue;
						} else if (vParam[0].indexOf("kuczt") != -1){             //状态
							$('#kuczt input').attr('realValue',vParam[1]);
							continue;
						} else if (vParam[0].indexOf("shengckcsj") != -1){        //生成库存时间
							$('#shengckcsj input').val(vParam[1]);
							continue;
						} else if (vParam[0].indexOf("pandfsxx") != -1){           //盘点方式信息
							$('#pandfs input').val(vParam[1]);
							continue;
						} else if (vParam[0].indexOf("pandfs") != -1){             //盘点方式
							$('#pandfs input').attr('realValue',vParam[1]);
							continue;
						} 
					}
					//移除库存状态信息
					params.splice(params.length-1,1);
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
							<td>${i18n.renwbh}:</td>
							<td><div class="ui-field" id="renwbh"></div></td>
							<td>${i18n.zhuangt}:</td>
							<td><div class="ui-field" id="kuczt"></div></td>
							<td>${i18n.shengckcsj}:</td>
							<td><div class="ui-field" id="shengckcsj"></div></td>
							<td>${i18n.creator}:</td>
							<td><div class="ui-field" id="creator"></div></td>
						</tr>
						<tr>
							<td>${i18n.pandfs}:</td>
							<td><div class="ui-field" id="pandfs"></div></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
			<br/>
			<div id="grid_user_${pageId}"></div>
			<br/>
          <div id='prompt'>${i18n.prompt}</div>
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>