package com.toft.mvc.result.supports;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import com.toft.mvc.config.bean.ResultConfig;
import com.toft.mvc.dispacher.ActionContext;
import com.toft.mvc.result.Result;

/**
 * Ajax类型的结果
 * 
 * @author mqli
 * 
 */
public class AjaxResult implements Result {

	public void execute(ResultConfig resultConfig) {
		ActionContext context = ActionContext.getActionContext();
		HttpServletRequest request = context.getRequest();
		HttpServletResponse response = ActionContext.getActionContext()
				.getResponse();
		response.setHeader("charset", "UTF-8");
		
		String export = request.getParameter("pager:export");
		//头文件类型
		response.setContentType(ExportFactory.createContentType(export));
		//设置导出
		if(export!=null&&!export.equals("")){
			//TODO 移出成为下载文件的工具类方法
			/**
			 * IE和firefox中都下载文件名的处理不一致
			 * IE自动把URL编码直接转换
			 * Firefox需要在filename后面加*号。
			 */
			String exportTitle = request.getParameter("pager:exportTitle");//在post里面已经URL加密
			String agent = request.getHeader("USER-AGENT");
			
			String responseHeaderAttach = "attachment;filename*="+exportTitle+"."+export;
			if((null != agent && -1 != agent.indexOf("MSIE"))){
				responseHeaderAttach = "attachment;filename="+exportTitle+"."+export;
			}
			response.addHeader("Content-Disposition",responseHeaderAttach);
		}
		
		Map<Object, Object> jsonResult = new HashMap<Object, Object>();
		for (Map.Entry<String, Object> e : context.getResult().entrySet()) {
			jsonResult.put(e.getKey(), e.getValue());
		}
		if (context.getErrorMessages().size() > 0) {
			jsonResult.put("hasError", true);
			jsonResult.put("errorMsg", context.getErrorMessages());
		}
		try {
			if(export==null){
				JsonConfig jsonConfig = new JsonConfig();
				//日期格式转换
				jsonConfig.registerJsonValueProcessor(java.util.Date.class, 
						new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
				//BigDecimal类型值转换
				jsonConfig.registerJsonValueProcessor(java.math.BigDecimal.class, 
						new BigDecimalValueProcessor());
				response.getWriter().print(JSONObject.fromObject(jsonResult,jsonConfig));
				response.getWriter().close();
			}else{
				ExportFactory.export(export,
						parseExporterHeadInfo(request),
						jsonResult,
						response.getOutputStream());
				response.getOutputStream().close();
			}
		} catch (IOException e) {
			//
		}
	}
	
	private ExporterHeadInfo parseExporterHeadInfo(HttpServletRequest request){
		ExporterHeadInfo exporterHeadInfo = 
			new ExporterHeadInfo();
		exporterHeadInfo.setHeaders(request.getParameterValues("pager:header"));
		exporterHeadInfo.setProperties(request.getParameterValues("pager:property"));
		return exporterHeadInfo;
		
	}

}
