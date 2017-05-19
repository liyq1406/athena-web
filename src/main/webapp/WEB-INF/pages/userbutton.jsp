<%@ page language="java" pageEncoding="UTF-8" import="com.athena.authority.entity.LoginUser,com.athena.authority.util.AuthorityUtils,com.toft.ui.tags.UiConstants,java.util.Map,java.util.List,java.util.HashMap" %>
<%
    HttpSession sessions =request.getSession();
    LoginUser loginUser = AuthorityUtils.getSecurityUser();
    String menuId = request.getParameter("menu.selected");
    if((menuId==null||"".equals(menuId))&&(request.getSession().getAttribute("menuId")!=null&&!"".equals(request.getSession().getAttribute("menuId")))){
    	menuId = (String)request.getSession().getAttribute("menuId");
    }
    if(sessions.getAttribute("pageMap")!=null){
    	Map pageMap = (Map)sessions.getAttribute("pageMap");
    	if(pageMap.get(menuId)!=null){
    		List<String> list = (List<String>)pageMap.get(menuId);
			StringBuffer buttonStr = new StringBuffer();
			String flag = "";
			String editorRemove = "";
			for(String funcName:list){
				if("editorRemove".equals(funcName)){
					editorRemove = "editorRemove";
				}else{
					buttonStr.append(flag).append(funcName);
					flag = ",";	
				}
			}
			if(editorRemove != null && editorRemove.length()>0){
				if(buttonStr != null && buttonStr.length()>0){
					buttonStr.append(",");
				}
				buttonStr.append(editorRemove);
			}
			String username = loginUser.getUsername();
			if(!"ROOT".equals(username)){
				if(buttonStr.toString()!=null){
					pageContext.getRequest().setAttribute(UiConstants.REQUEST_ATTR_AUTHCODES,buttonStr.toString());
				}
			}

    	}
    }
    
    if(sessions.getAttribute("menuButtonMap")!=null){
    	Map menuButtonMap = (Map)sessions.getAttribute("menuButtonMap");
    	if(menuButtonMap.get(menuId)!=null){
    		List<String> list = (List<String>)menuButtonMap.get(menuId);
    		StringBuffer buttonStr = new StringBuffer();
			String flag = "";
			for(String funcName:list){
				buttonStr.append(flag).append(funcName);
				flag = ",";
			}
			String username = loginUser.getUsername();
			if(!"ROOT".equals(username)){
				if(buttonStr.toString()!=null){
					pageContext.getRequest().setAttribute(UiConstants.REQUEST_NOT_ATTR_AUTHCODES,buttonStr.toString());
				}
			}
    	}
    }
 %>