<%@ page language="java" pageEncoding="UTF-8"%>
<%request.setAttribute("pageId","335");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
    <head>
        <title>${i18n.title_335}</title>
        <jsp:include page="../../common/js.jsp" />
        <script type="text/javascript">
            $(function(){
                $('#grid_user_${pageId}').grid({
                    keyFields:['ush','shifjd'],
                    id:'grid_user_${pageId}',
                    //查询交易
                    src:'<%=request.getContextPath()%>/kunei/33501.do',
                    //明细行修改交易
                    editSubmitSrc:'<%=request.getContextPath()%>/kunei/33502.do',
                    cols:[
                        {property:'ush',caption:'${i18n.ush}'},
                        {property:'elh',caption:'${i18n.elh}'},
                        {property:'gongysdm',caption:'${i18n.gongys}'},
                        {property:'lingjbh',caption:'${i18n.lingjh}'},
                        {property:'pich',caption:'${i18n.pich}'},
                        {property:'usxh',caption:'${i18n.rongqxh}'},
                        {property:'lingjsl',caption:'${i18n.shul}'},
                        {property:'danw',caption:'${i18n.lingjdw}'},
                        {property:'bzzt',caption:'${i18n.zhuangt}',internation:true},
                        {property:'kuwbh',caption:'${i18n.diz}'},
                        {property:'shifjd',caption:'${i18n.shifjd}',editor:'fieldText',
                            dataType:'yes',notNull:true,defValue:'N',afterenter:'refresh'}
                    ],
                    buttons:[
                        {name:'back',caption:'${i18n.back}[F11]'}
					    //F12返回
					    ,{name:'return',caption:'${i18n.return}[F12]'}
					]
                });
                
                $('#form_user_${pageId}').form({
                    onemoredemand:true,
                    onreload:true,
                    fields:[
                            {fieldType:'fieldText',biaos:'enter',property:'ush',dataType:'ush'},
                            {fieldType:'fieldText',biaos:'enter',property:'lingjbh',dataType:'letter_numeric',limitedLength:'10'},
                            {fieldType:'fieldText',biaos:'enter',property:'gongysdm',dataType:'letter_numeric',limitedLength:'10'},
                            {fieldType:'fieldText',biaos:'enter',property:'pich',dataType:'text',maskLength:'12',caption:'${i18n.pich}'}, 
							{fieldType:'fieldText',biaos:'enter',property:'str1',dataType:'text',limitedLength:'13',caption:'${i18n.xulh}',width:71}, 
							{fieldType:'fieldText',biaos:'enter',property:'str2',dataType:'text',limitedLength:'13',caption:'${i18n.xulh}',width:71}, 
                            {fieldType:'fieldLabel',property:'cangkbh',value:st_Cangkbh}
                    ]
                });
                
                //按US号查询
                $('#ush').bind('enter',function(){
                    doSearch();
                });
                
                //按零件号查询
                $('#lingjbh').bind('enter',function(){
                    doSearch();
                });
                
                //按供应商查询
                $('#gongysdm').bind('enter',function(){
                    doSearch();
                });

                //按批次号查询
 			 	$('#pich').bind('enter',function(){
 			 		doSearch();
			    });
 			 
 			 	 //按序列号查询
 			 	$('#str1').bind('enter',function(){
 			 		doSearch();
			    });
 			 	 
 			 //按序列号查询
 			 	$('#str2').bind('enter',function(){
 			 		doSearch();
			    });
 			 
                $(document).keyboardsupport({});
            });
            
             function doSearch(){
                //参数校验
                 if(!$('#form_user_${pageId}').form("validateParam")){
                	 $('#grid_user_${pageId}').grid('clearRecords');
                     return;
                 }
                //查询数据
		 		var params = $('#form_user_${pageId}').form("getFormParam");
		 		params.push("currentPage=1");
		 		//设置分页条件
				$('#grid_user_${pageId}').grid("setQueryParams", params);
				//加载数据
                var url = "<%=request.getContextPath()%>/kunei/33501.do";
                g_isSub = 0;
				$('#form_user_${pageId}').form("submitUrl", params, url, function(results){
					  if (showPromptRequestMsg(results)==true){
					      // if(results.result.response =="0000"){
					              $('#grid_user_${pageId}').grid('parseResult',results);
					             // msgClear();
					         // }
				      }
				 });
	    		return false;
            }
             function refresh(results){
				doSearch();
				msgClear();
			}
        </script>
    </head>
    <body>
        <div style="padding:20px;">
           	<div id="title"></div>
            <div id="form_user_${pageId}" class="ui-fieldLayout">
                <table class="ui-grid" cellspacing="1" width="100%">
                    <tbody>
                        <tr>
                            <td>${i18n.ush}:</td>
                            <td><div class="ui-field" id="ush"></div></td>
                            <td>${i18n.lingjh}:</td>
                            <td><div class="ui-field" id="lingjbh"></div></td>
                            <td>${i18n.gongys}:</td>
                            <td><div class="ui-field" id="gongysdm"></div></td>
                        </tr>
                        <tr>
							<td>${i18n.pich}:</td>
							<td><div class="ui-field" id="pich"></div></td>
							<td>${i18n.xulh}:</td>
							<td><div style="float:left" class="ui-field" id="str1">
							</div><div style="float:left">${i18n.zhi}</div>
							<div style="float:left" class="ui-field" id="str2"></div>
							</td>
							<td>${i18n.cangkbh}:</td>
                            <td><div class="ui-field" id="cangkbh"></div></td>
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