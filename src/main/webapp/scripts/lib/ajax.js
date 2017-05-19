var g_isSub = 0;
/*
 * ajax带参数请求
 */
function ajaxRequest(params, url, success){
	if(g_isSub){
		return false;
	}
	params = params || [];
	//添加仓库
	var isExistCk = false;
	for(var i=0;i<params.length;i++){
		if (params[i].split("=")[0] == "cangkbh"){
			isExistCk = true;
			break
		}
	}
	if (isExistCk == false && st_Cangkbh){
		params.push("cangkbh=" + st_Cangkbh)
	}
	if (st_UserName){
		params.push("pageusername=" + st_UserName);
	}
	//请求数据
	var dateParams = params.join('&');
	$.ajax({
		url : url,
		data : dateParams,
		type : 'POST',
		datatype : 'json',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',// 配置提交的contentType
		beforeSend : function() {
			g_isSub = 1 ;
			showPromptMsg('blue',$.sdcui.resource.i18n['C_running']);											
		}, 
		success:function(results){
			if (results.toString().indexOf("[object Object]") != -1){
				showPromptRequestMsg(results);
				if(success){
					try{
						success(results);
					} catch(e) {
						alert(e);
					}
				}
				g_isSub = 0 ;
				return true;
			} else if (results.errorMsg){
				showPromptMsg('red',results.errorMsg.message)
				g_isSub = 0 ;
				return false;
			} else {
				g_isSub = 0 ;
				//window.location.reload(true);
				showPromptMsg('red',$.sdcui.resource.i18n['C_NoReply']);
				return false;
			}
		},
		complete:function(jqXHR, statusText, responseText){
			if (jqXHR.getResponseHeader('sessionstatus') == 'timeout') {
				//刷新页面
				window.location.reload(true);
				return false;
			}else if(jqXHR.getResponseHeader('sessionstatus') == 'userchange'){
				window.location.href = "../index_ck.jsp" + st_Params;
				return false;
			}
		},
		error:function(){
			g_isSub = 0 ;
			//window.location.reload(true);
			showPromptMsg('red',$.sdcui.resource.i18n['C_ConnError']);
			return false;
		}
	});
}

/*
 * ajax无参数请求
 */
function ajaxRequestNoParams(url, success){
	$.ajax({
		url: url,
		//data: false,
		type : 'POST',
		datatype : 'json',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',// 配置提交的contentType
		beforeSend : function() {
			showPromptMsg('blue',$.sdcui.resource.i18n['C_running']);											
		}, 
		success:function(results){
			if (results.toString().indexOf("[object Object]") != -1){
				msgClear();
				if(success){
					try{
						success(results);
					} catch(e) {
						alert(e);
					}
				}
				return true;
			} else if (results.errorMsg){
				showPromptMsg('red',results.errorMsg.message)
				g_isSub = 0 ;
				return false;
			} else {
				//window.location.reload(true);
				showPromptMsg('red',$.sdcui.resource.i18n['C_NoReply']);
				return false;
			}
		},
		complete:function(jqXHR, statusText, responseText){
			if (jqXHR.getResponseHeader('sessionstatus') == 'timeout') {
				//刷新页面
				window.location.reload(true);
				return false;
			}
		},
		error:function(){
			//window.location.reload(true);
			showPromptMsg('red',$.sdcui.resource.i18n['C_ConnError']);
			return false;
		}
	});
}
