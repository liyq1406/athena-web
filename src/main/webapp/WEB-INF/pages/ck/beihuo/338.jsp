<%request.setAttribute("pageId","338");%>
<%@ taglib prefix="t" uri="http://www.isoftstone.com/sdc/ui"%>
<t:html i18n="i18n.ck">
	<head>
		<title>${i18n.title_338}</title>
		<jsp:include page="../../common/js.jsp" />
		<script type="text/javascript">
		Date.prototype.format = function(format){
	        var o = {
	        "M+" : this.getMonth()+1, //month
	        "d+" : this.getDate(),    //day
	        "h+" : this.getHours(),   //hour
	        "m+" : this.getMinutes(), //minute
	        "s+" : this.getSeconds(), //second
	       // "q+" : Math.floor((this.getMonth()+3)/3),  //quarter
	       // "S" : this.getMilliseconds() //millisecond
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
       var agocurr=new Date(newdate.getTime() - 1000 * 60 * 60 * 24 * 7).format('yyyy-MM-dd hh:mm:ss');
			$(function(){
				$('#grid_user_${pageId}').grid({
					keyFields:['beihdh'],
					id:'grid_user_${pageId}',
					//æ¥è¯¢äº¤æ 12811
					src:'<%=request.getContextPath()%>/beihuo/33801.do',
					cols:[
						{property:'yaohlh',caption:'${i18n.yaohlh}',width:'40'},
						{property:'beihdh',caption:'${i18n.beihdh}',width:'40'},
						{property:'cangkbh',caption:'${i18n.cangkbh}',width:'40'},
						{property:'ush',caption:'${i18n.ush}',width:'40'},
						{property:'usxh',caption:'${i18n.usxh}',width:'40'},
						{property:'lingjbh',caption:'${i18n.lingjbh}',width:'45'},
						{property:'lingjmc',caption:'${i18n.lingjmc}',width:'40'},
						{property:'lingjsl',caption:'${i18n.shul}',width:'40'},
						{property:'danw',caption:'${i18n.lingjdw}',width:'40'},
						{property:'elh',caption:'${i18n.elh}',width:'40'},
						{property:'pich',caption:'${i18n.pich}',width:'40'},
						{property:'keh',caption:'${i18n.keh}',width:'40'},
						{property:'shangxfs',caption:'${i18n.shangxlx}',width:'40'},
						{property:'shangxms',caption:'${i18n.shangxms}',width:'40'},
						{property:'chukrq',caption:'${i18n.chuksj}',width:'45'},
						{property:'zhengclsh',caption:'${i18n.liush}',width:'40'},
						{property:'peislb',caption:'${i18n.peislb}',width:'40'},
						{property:'usercode',caption:'${i18n.caozr}',width:'40'},
						{property:'beihybh',caption:'${i18n.beihr}',width:'40'}
					],
					buttons:[
						//F1æ¥è¯¢
				   	 	{name:'search',caption:'${i18n.search}[F1]',keyboard:'F1',action:function(){
				   	 		$('#grid_user_${pageId}').grid('clearRecords');
				            if (!validateform()){
                                return;
                            }
				            
				   	 	    //åæ°æ ¡éª
                            if(!$('#form_user_${pageId}').form("validateParam")){
                                return;
                            }
				   	 	    
                            //èå´æ ¡éª
                            if(!validRangeData("datetime", $('#chukrq1 input').val(), $('#chukrq2 input').val())){
                                $('#chukrq1 input').focus();
                                $('#chukrq1 input').removeClass('validate-success').addClass('validate-error');
                                return;
                            }
                              var start=new Date(($('#chukrq1 input').val()).replace(/-/g,"/"));
				              var end=new Date(($('#chukrq2 input').val()).replace(/-/g,"/"));
				              if(end<start){
					                  showPromptMsg('red','${i18n.datetime_invalid}');
					                   return false;
				                    }
                            
                            
                            //èå´æ ¡éª
                            if(!validRangeData("integer", $('#zhengclsh1 input').val(), $('#zhengclsh2 input').val())){
                                $('#zhengclsh1 input').focus();
                                $('#zhengclsh1 input').removeClass('validate-success').addClass('validate-error');
                                return;
                            }
				   	 	    
                            var params = $('#form_user_${pageId}').form("getFormParam");
                            params.push('currentPage=1');
                            //è®¾ç½®åé¡µæ¡ä»¶
							$('#grid_user_${pageId}').grid("setQueryParams", params);
                            $('#grid_user_${pageId}').grid("load",params);
						}},
						//F11å¯¼åº
				   	 	{name:'export',caption:'${i18n.export}[F8]',keyboard:'F8',action:function(){
				   	 	     var dclx = $("#daoclx input").val();
					   	 	$("#daoclx input").val($("#daoclx input").attr("realValue"));
					   	 	$("#peislb input").val($("#peislb input").attr("realValue"));
                            $("#putform").attr("action","<%=request.getContextPath()%>/beihuo/33802.do");
                            document.putform.submit();
                            $("#daoclx input").val(dclx);
				    		return false;
						}},
						 //éæ°å è½½
                        {name:'back',caption:'${i18n.back}[F11]'},
                        //F12è¿å
                        {name:'return',caption:'${i18n.return}[F12]'}
					]
					//,records:{'result':{'total':2,'rows':[{'baozdykh':'123','qizlsh':'1234','peislx':'12345','shangxbz':'123','lingjh':'1234','lingjmc':'12345','ush':'123','gongysdm':'1234','kuw':'123','zhuangcsl':'123','zuizsxsj':'12345','chex':'12345','ceng':'123'}]}},
				});
				$('#btn_export').hide();
			 	$('#form_user_${pageId}').form({
			        onreload:true,
			 		fields:[
						{fieldType:'fieldText',property:'lingjbh',caption:'${i18n.lingjh}',dataType:'letter_numeric',limitedLength:'10'},
                        {fieldType:'fieldText',property:'gongysdm',dataType:'letter_numeric',limitedLength:'10'},
                        {fieldType:'fieldSelect',property:'cangkbh',caption:'${i18n.cangk}',notNull:true,src:'<%=request.getContextPath()%>/common/wareHouse.do'},
                        {fieldType:'fieldText',property:'zickbh',dataType:'letter_numeric',caption:'${i18n.zick}',limitedLength:'3'},
                        //huxy_11464客户最长可输入9位
                        {fieldType:'fieldText',property:'keh',dataType:'cekeh'},
						{fieldType:'fieldSelect',property:'shangxms',includeNull:true,src:'<%=request.getContextPath()%>/common/waibandneibghms.do?zhuangt=2'},
						{fieldType:'fieldSelect',property:'shangxfs',includeNull:true,src:'<%=request.getContextPath()%>/common/shangxfs.do'},
						{fieldType:'fieldSelect',property:'peislb',includeNull:true,src:'<%=request.getContextPath()%>/common/peislb.do'},
						{fieldType:'fieldText',property:'chukrq1',notNull:true,caption:'${i18n.chuksj}',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'},value:agocurr},
						{fieldType:'fieldText',property:'chukrq2',notNull:true,caption:'${i18n.chuksj}',dataType:'datetime',maskOptions:{mask:'9999-99-99 99:99:99'},value:curr},
						{fieldType:'fieldText',property:'zhengclsh1',dataType:'letter_numeric',limitedLength:'9'},
						{fieldType:'fieldText',property:'zhengclsh2',dataType:'letter_numeric',limitedLength:'9'},
						{fieldType:'fieldSelect',property:'daoclx',caption:'${i18n.daoclx}',value:'Text',realValue:'0',notNull:true,src:'<%=request.getContextPath()%>/common/daoclx.do'}
			 		]
			 	});
			 	
			 	$(document).keyboardsupport({});
			});
			
			
			function validateform(){
                //åæ°æ ¡éª
                if(!$('#form_user_${pageId}').form("validateParam")){
                    $('#grid_user_${pageId}').grid('clearRecords');
                    return false;
                }
                
                //èå´æ ¡éª
                var saoksj1 = $('#chukrq1 input').val();
                var saoksj2 = $('#chukrq2 input').val();
                if(!validRangeData("datetime", saoksj1, saoksj2)){
                    $('#chukrq1 input').focus();
                    $('#chukrq1 input').removeClass('validate-success').addClass('validate-error');
                    return false;
                }
                var date1 = new Date(saoksj1.replace(/-/g,"/"));
                var date2 = new Date(saoksj2.replace(/-/g,"/"));
                var date3=date2.getTime()-date1.getTime();
                if (date3 > 7*24*3600*1000){
                    showPromptMsg('red',$.sdcui.resource.i18n['C_F_CHUKSJ']);
                    return false;
                }
                return true;
            }
		</script>
	</head>
	<body>
		<div style="padding:20px;">
			<div id="title"></div>
			<form id="putform" method="post" name="putform" >
                <input id="putvalue" name="putvalue" type="Hidden"></input>
			<div id="form_user_${pageId}" class="ui-fieldLayout">
			 	<table class="ui-grid" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td>${i18n.lingjh}:</td>
							<td><div class="ui-field" id="lingjbh"></div></td>
							<td>${i18n.gongysdm}:</td>
							<td><div class="ui-field" id="gongysdm"></div></td>
							<td>${i18n.cangk}:</td>
							<td><div class="ui-field" id="cangkbh"></div></td>
							
						</tr>
						<tr>
						    <td>${i18n.zick}:</td>
							<td><div class="ui-field" id="zickbh"></div></td>
							<td>${i18n.keh}:</td>
							<td><div class="ui-field" id="keh"></div></td>
							<td>${i18n.shangxms}:</td>
							<td><div class="ui-field" id="shangxms"></div></td>
							
						</tr>
						<tr>
						     <td>${i18n.shangxlx}:</td>
							<td><div class="ui-field" id="shangxfs"></div></td>
							<td>${i18n.peislb}:</td>
							<td><div class="ui-field" id="peislb"></div></td>
							<td>${i18n.tongblsh}:</td>
							<td><div class="ui-field" style="float:left" id="zhengclsh1"></div><div style="float:left" >${i18n.zhi}</div><div style="float:left" class="ui-field"  id="zhengclsh2" ></div> </td>
						</tr>
						<tr>
							<td>${i18n.chuksj}:</td>
							<td><div class="ui-field" id="chukrq1"></div></td>
							<td>${i18n.zhi}:</td>
							<td><div class="ui-field" id="chukrq2"></div></td>
							<td>${i18n.daoclx}:</td>
							<td><div class="ui-field" id="daoclx"></div></td>
						</tr>
					</tbody>
				</table> 
			</div>
			</form>
			<br></br>
			<div id="grid_user_${pageId}"></div>
			<br></br>
			<div id='prompt'>${i18n.prompt}</div> 
		</div>
	</body>
<jsp:include page="../../common/bottom.jsp" /></t:html>