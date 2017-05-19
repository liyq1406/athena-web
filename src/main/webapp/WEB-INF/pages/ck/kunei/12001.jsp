<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<%request.setAttribute("pageId","120");%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_12001}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		var row;           //行数据，用于动态添加行
		$(function(){
			$('#form_user_${pageId}').form({
		 		fields:[
				{fieldType:'fieldLabel',property:'elh'},
				{fieldType:'fieldLabel',property:'lingjbh'},
				{fieldType:'fieldLabel',property:'lilkcsl'},
				{fieldType:'fieldLabelInput',property:'gongysdm'},
				{fieldType:'fieldLabel',property:'uth'},
				{fieldType:'fieldLabel',property:'rukrq'},
				{fieldType:'fieldLabel',property:'jiufdh'},
				{fieldType:'fieldLabel',property:'shijkcsl'},
				{fieldType:'fieldLabel',property:'jiufyy'},
				{fieldType:'fieldLabel',property:'shijljbh'},
				{fieldType:'fieldLabel',property:'shijljsl'},
				{fieldType:'fieldLabelInput',property:'shijgysbh'},
				{fieldType:'fieldLabel',property:'str2'}
		 		]
		 	});
			
			$('#grid_user_${pageId}').grid({
				keyFields:['usxh','ussl','usgs'],
				id:'grid_user_${pageId}',
				showCheckbox:false,
				enableCutPage:false,
				cols:[
		  		{property:'usxh',caption:'${i18n.usxh}',dataType:'letter_numeric',limitedLength:'5',notNull:true,editor:'fieldText'},
		  		{property:'ussl',caption:'${i18n.ussl}',dataType:'dbnumber',isPlus:true,notNull:true,editor:'fieldText'},
		  		{property:'usgs',caption:'${i18n.usgs}',dataType:'plusinteger',maxLength:'5',notNull:true,editor:'fieldText'}
			],
		 	buttons:[
	 		 	//增行
	 			{name:'addrow',caption:'${i18n.add}[F9]',keyboard:'F9',action:function(){
	 				if (row && row != null){
	 					msgClear();
	 					$('#grid_user_${pageId}').grid("addRow",row);
		 	    		return false;
	 				}
	 			}}
	 			//删行
	 			,{name:'deleterow',caption:'${i18n.delete}[F10]',keyboard:'F10',action:function(){
	 				if (row && row != null){
	 					msgClear();
	 					var allRow = $('#grid_user_${pageId}').grid("getRecordAll");
		 				var selectRow = $('#grid_user_${pageId}').grid("getSelected",true);
		 				if (selectRow.length > 0 && allRow.length > selectRow.length){
		 					$('#grid_user_${pageId}').grid("deleteSelectedRow");
			 	    		return false;
		 				}
	 				}
	 			}}
	 			//确认
				,{name:'submit',caption:'${i18n.ok}[F3]',keyboard:'F3',action:function(){
					//获取参数
			 		var params = $('#form_user_${pageId}').form("getFormParam");
			 		//验证Grid的输入格式
			 		if (!$('#grid_user_${pageId}').grid("validate")){
			 			return false;
			 		}
			 		//验证改包装数量必须等于改包装实际零件数量
		 			var lingjsl = parseFloat($('#shijljsl span').html());
		 			var sumLjsl = 0;
		 			var columnUssl= $('#grid_user_${pageId}').grid("getColumnValue","ussl");
		 			var columnUsgs= $('#grid_user_${pageId}').grid("getColumnValue","usgs");
		 			for(i=0;i<columnUssl.length;i++){
		 				sumLjsl+= (parseFloat(columnUssl[i]) * parseFloat(columnUsgs[i]));
		 			}
		 			if (lingjsl != sumLjsl){
						showPromptMsg('red','${i18n.caogljzs}')
						return false;
		 			}
		 			//数据提交
			 		var records = $('#grid_user_${pageId}').grid('getRecordAll');
			 		params = params.concat(records);
			 		var url = "<%=request.getContextPath()%>/kunei/12004.do";
			 		$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
			 			 if (showPromptRequestMsg(results)==true){
			 			 	st_BackCount = 3;
			 			 	if (results.result.response=="0000" && !results.result.respdesc){
				 				//操作成功--返回
				 				window.location.href = "<%=request.getContextPath()%>/kunei/120.do"+st_Params+"&st_backCount=3";
			 				}
						 }
					});
				}}
				//返回上一页或重新加载
				,{name:'back',caption:'${i18n.back}[F11]',action:function(){
					if(st_BackCount == 1){
						history.back();
					} else {
						window.location.href = "<%=request.getContextPath()%>/kunei/120.do"+st_Params+"&st_backCount="+st_BackCount;
					}
				}}
				//返回
				,{name:'return',caption:'${i18n.return}[F12]'}
 			]});

			$(document).keyboardsupport({});
		});
		
		//页面加载后，查询数据为界面赋值
		$(document).ready(function(){
			//加载返回数据
			if ('${result}' != ''){
				var result = JSON.parse('${result}');
				$('#elh span').html(result.result.parameter.elh);
				$('#lingjbh span').html(result.result.parameter.lingjbh);
				$('#lilkcsl span').html(result.result.parameter.lilkcsl);
				$('#gongysdm span').html(result.result.parameter.gongysdm);
				$('#gongysdm input').val(result.result.parameter.gongysdm);
				$('#uth span').html(result.result.parameter.uth);
				$('#rukrq span').html(result.result.parameter.rukrq);
				$('#jiufdh span').html(result.result.parameter.jiufdh);
				$('#shijkcsl span').html(result.result.parameter.shijkcsl);
				$('#jiufyy span').html(result.result.parameter.jiufyy);
				$('#shijljbh span').html(result.result.parameter.shijljbh);
				$('#shijljsl span').html(result.result.parameter.shijljsl);
				$('#shijgysbh span').html(result.result.parameter.shijgysbh);
				$('#shijgysbh input').val(result.result.parameter.shijgysbh);
				
				//xss_20161123_11694
				$('#str2 span').html(result.result.parameter.str2);                   
				                    
				//加载返回数据
				$('#grid_user_${pageId}').grid('parseResult',result.result);
				if (result.result.parameter.list.length > 0){
					$('#grid_user_${pageId}').grid('focus');
				}
				row = result.result.parameter.list[0];
				//显示错误消息
				showPromptRequestMsg(result.result);
			}
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
							<td>${i18n.elh}:</td>
							<td><div class="ui-field" id="elh"></div></td>
							<td>${i18n.lingjbh}:</td>
							<td><div class="ui-field" id="lingjbh"></div></td>
							<td>${i18n.lilkcsl}:</td>
							<td><div class="ui-field" id="lilkcsl"></div></td>
						</tr>
						<tr>
							<td>${i18n.gongysdm}:</td>
							<td><div class="ui-field" id="gongysdm"></div></td>
							<td>${i18n.yansdh}:</td>
							<td><div class="ui-field" id="uth"></div></td>
							<td>${i18n.yanssj}:</td>
							<td><div class="ui-field" id="rukrq"></div></td>
						</tr>
						<tr>
							<td>${i18n.jiufdh}:</td>
							<td><div class="ui-field" id="jiufdh"></div></td>
							<td>${i18n.shijkcsl}:</td>
							<td><div class="ui-field" id="shijkcsl"></div></td>
							<td>${i18n.jiufyy}:</td>
							<td><div class="ui-field" id="jiufyy"></div></td>
						</tr>
						<tr>
							<td>${i18n.shijljbh}:</td>
							<td><div class="ui-field" id="shijljbh"></div></td>
							<td>${i18n.shijljsl}:</td>
							<td><div class="ui-field" id="shijljsl"></div></td>
							<td>${i18n.shijgysbh}:</td>
							<td><div class="ui-field" id="shijgysbh"></div></td>
						</tr>
						<tr>
							<td>${i18n.shijljckbh}:</td>
							<td id='str2' class="hidden-item"><div class="ui-field" id="str2"></div></td>						
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