/**
 * 
 */
package com.toft.ui;

import java.io.IOException;
import java.util.MissingResourceException;
import java.util.ResourceBundle;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.toft.ui.tags.AbstractTag;

/**
 * <p>Title:SDC UI组件</p>
 *
 * <p>Description:</p>
 *
 * <p>Copyright:Copyright (c) 2011.11</p>
 *
 * <p>Company:iSoftstone</p>
 *
 * @author zhouyi
 * @version 1.0.0
 */
public class JsI18nServlet extends HttpServlet {
	
	private static final Log logger = LogFactory.getLog(JsI18nServlet.class);
	/**
	 * 
	 */
	private static final long serialVersionUID = 3034220319010741434L;

	private static final String COM_PREFIX = "C_";
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/x-json;charset=UTF-8");
		ResourceBundle resourceBundle =  null;
		String messageFile = "i18n.ckJs_"+getLocale();
		
		String pageId = request.getParameter("pageId");
		
		if (pageId == null || pageId.length() < 3){
			logger.error("pageId error:" +  pageId);
			return;
		}
		
		//页面
		String prefixPage = "P"+pageId+"_";
		//页面公用
		String prefixPageCom = "C"+pageId.substring(0,3)+"_";
		//模块公用
		String prefixModuleCom = "C"+pageId.substring(0,1)+"_";
		try {
			resourceBundle = ResourceBundle.getBundle("i18n.ckJs_"+getLocale());
		} catch (MissingResourceException e) {
			 logger.error("can't find properties file:"+messageFile+".", e);
		}
		
		Set<String> keys = resourceBundle.keySet();
		StringBuffer jsBuf = new StringBuffer();
		jsBuf.append("$.extend($.sdcui.resource, {")
			 .append("i18n:{");
		String message = null;
		for(String key:keys){
			//页面加载生成i8n.js只加载公共信息和该页面信息
			if(!key.startsWith(COM_PREFIX)&&
					!key.startsWith(prefixModuleCom)&& 
					!key.startsWith(prefixPageCom)&&
					!key.startsWith(prefixPage)){
				continue;
			}
			message = resourceBundle.getString(key);
			if(message.matches(".*\\{\\d\\}.*")){//包含参数的项
				jsBuf.append(key+":$.sdcui.getMessage('"+message+"'),");
			}else{
				jsBuf.append(key+":'"+message+"',");
			}
			message = null;
		}
		jsBuf.append("    1:1")
			.append("      }")
			.append("});");
		response.getWriter().println(jsBuf);
	}
	
	/**
	 * 获取国际化文件
	 * @return
	 */
	private String getLocale() {
		Object local = getServletContext().getAttribute(AbstractTag.LOCAL_SESSION_KEY);
		if ((null == local) || ("".equals(local)))
			local = "zh_CN";
		return local.toString();
	}
}
