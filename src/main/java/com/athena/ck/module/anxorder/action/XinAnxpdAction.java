package com.athena.ck.module.anxorder.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.athena.authority.entity.LoginUser;
import com.athena.authority.util.AuthorityUtils;
import com.athena.ck.entity.anxorder.Pand;
import com.athena.ck.entity.anxorder.PandModel;
import com.athena.ck.entity.anxorder.XinAnxpd;
import com.athena.ck.module.anxorder.service.XinAnxpdService;
import com.athena.component.wtc.action.BaseWtcAction;
import com.athena.excore.template.DownLoadServices;
import com.athena.excore.template.export.ExportConstants;
import com.toft.core3.container.annotation.Component;
import com.toft.core3.container.annotation.Inject;
import com.toft.core3.container.core.ComponentDefinition;
import com.toft.mvc.annotaions.Param;
import com.toft.mvc.dispacher.ActionContext;

@Component(scope = ComponentDefinition.SCOPE_PROTOTYPE)
public class XinAnxpdAction extends BaseWtcAction {
	@Inject
	private XinAnxpdService xinanxpdService;
	
	@Inject
	private DownLoadServices  downloadServices = null;
	// log4j日志初始化
	private final Logger log = Logger.getLogger(XinAnxpdAction.class);
	/**
	 * 页面加载
	 * @return
	 */
	public String executeXinAnxpd() {
		setResult("usercenter", AuthorityUtils.getSecurityUser().getUsercenter());
		return "select";
		
	}
	/**
	 * 新按需理论库存查询
	 * @param bean
	 * @return
	 */
	public String queryXinAnxpd(@Param XinAnxpd bean) 
	{
		setResult("result", xinanxpdService.pdquery(bean, this.getParams()));
		return AJAX;
	}
	
	/**
	 * @see 检查流水号  并将联查出的数据进行赋值
	 * @return
	 */
	public String checkLsh()
	{
		Map<String, String> params =  this.getParams();
		Map<String, Object> resultMap =  new HashMap<String, Object>();
		String mos = null;
		if(null != params)
		{
			mos = params.get("mos");
		}
		if(StringUtils.isNotBlank(mos))
		{
			if(mos.equalsIgnoreCase("CD"))
			{
				resultMap =  xinanxpdService.pandLiush(params,Pand.CD);
			}
			else if(mos.equalsIgnoreCase("CS"))
			{
				resultMap =  xinanxpdService.pandLiush(params,Pand.CS);
			}
			else
			{
				resultMap.put("message", "数据来源模式不正确!");
			}
		}
		else
		{
			resultMap.put("message", "数据来源模式不正确!");
		}
		setResult("result", resultMap);
		return AJAX;
	}
	
	
	/**
	 * 保存按需盘点库存结果
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String savePdkcjg()
	{
		List<XinAnxpd> xinAnxpdModels = null;
		String jsonStr = getParam("data");
		if(StringUtils.isNotBlank(jsonStr))
		{
			xinAnxpdModels = this.getList(jsonStr, XinAnxpd.class);
		}
		Map<String, String> map = new HashMap<String, String>();
	      try 
	      {
	    	 LoginUser loginUser = AuthorityUtils.getSecurityUser();
	    	 if(null != loginUser)
	    	 {
	    		 String creator = loginUser.getUsername();
	    		 if(StringUtils.isNotBlank(creator))
	    		 {
	    			 map = xinanxpdService.pdsave(xinAnxpdModels,creator);
	    			 setResult("result", map.get("message"));
	    		 }
	    	 }
	    	 else
	    	 {
	    		 setResult("result", "未找到操作人!");
	    	 }
		  } 
	      catch (Exception e) 
	      {
				setResult("result", "保存失败");
				log.error("盘点数据保存失败",e);
		  }  
		  return AJAX;
	}
	
	// 盘点导出
	@SuppressWarnings("unchecked")
	public String downLoadFilePd()
	{
		String jsonStr = getParam("param");
		if(StringUtils.isNotBlank(jsonStr))
		{
			List<XinAnxpd> pandModels = this.getList(jsonStr, XinAnxpd.class);
			if(null != pandModels)
			{
				LoginUser loginUser = AuthorityUtils.getSecurityUser();
				if(null != loginUser)
				{
					for (XinAnxpd pandModel : pandModels) 
					{
						String flag = pandModel.getAnxscjssj();
						if(StringUtils.isNotBlank(flag))
							pandModel.setAnxscjssj(flag.substring(0,10) + flag.substring(11, flag.length()));
						pandModel.setCreator(loginUser.getUsername());
					}
					Map<String, Object> dataSource = new HashMap<String, Object>();
					dataSource.put("list", pandModels);
					// 拿到response对象
					HttpServletResponse response = ActionContext.getActionContext().getResponse();
					downloadServices.downloadFile("xinanxpdDown.ftl", dataSource, response, "新按需盘点", ExportConstants.FILE_XLS, false);
				}
			}
		}
		// 返回类型一定要是download类型的
		return "downLoad";

	}
	
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private  List getList(String jsonString, Class beanClass)
	{
		JSONArray jsonArray = null;
		List resultList = null;
		try
		{
			jsonArray = JSONArray.fromObject(jsonString);
			resultList = new ArrayList();
			for(Iterator iter = jsonArray.iterator(); iter.hasNext();)
			{      
				JSONObject jsonObject = (JSONObject)iter.next(); 
				resultList.add(JSONObject.toBean(jsonObject, beanClass));   
			}
		}
		catch(Exception e)
		{
			log.error(e);
		}
		return resultList;
	}
}
