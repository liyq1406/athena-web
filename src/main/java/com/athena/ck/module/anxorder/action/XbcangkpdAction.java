package com.athena.ck.module.anxorder.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import com.athena.ck.module.anxorder.service.PandlsService;
//import com.athena.ck.module.anxorder.service.XbcangkpdService;
import com.athena.component.wtc.action.BaseWtcAction;
import com.athena.excore.template.DownLoadServices;
import com.athena.excore.template.export.ExportConstants;
import com.toft.core3.container.annotation.Component;
import com.toft.core3.container.annotation.Inject;
import com.toft.core3.container.core.ComponentDefinition;
import com.toft.mvc.annotaions.Param;
import com.toft.mvc.dispacher.ActionContext;

/**
 * <p>
 * Title:线边库存Action
 * </p>
 * <p>
 * Description:线边库存相关页面动作处理
 * </p>
 * <p>
 * Copyright: Copyright (c) 2012
 * </p>
 * <p>
 * Company: 软通动力
 * </p>
 * 
 * @author 甘露
 * @version v1.0
 * @date 2012-12-26
 */
@Component(scope = ComponentDefinition.SCOPE_PROTOTYPE)
public class XbcangkpdAction extends BaseWtcAction 
{
	//@Inject
	//private XbcangkpdService xbcangkpdService;
	
	@Inject
	private PandlsService pandlsService;
	
	@Inject
	private DownLoadServices  downloadServices = null;
	
	// log4j日志初始化
	private final Logger log = Logger.getLogger(XbcangkpdAction.class);
	
	/**
	 * 页面跳转
	 * @return
	 */
	public String executeXbpd() 
	{
		return "select";
	}
	
	/**
	 * 线边理论库存查询
	 * 
	 * @param bean
	 * @return
	
	public String queryxbkpd(@Param Xianbkc bean) 
	{
		setResult("result", xbcangkpdService.xbpdxzQuery(bean, this.getParams()));
		return AJAX;
	}
	 */
	
	/**
	 * 线边理论库存查询
	 * 
	 * @param bean
	 * @return
	 */
	public String queryxbkpd(@Param PandModel bean) 
	{
		setResult("result", pandlsService.pdquery(bean, this.getParams()));
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
			if(mos.equalsIgnoreCase("C0"))
			{
				resultMap =  pandlsService.pdjs(this.getParams(),Pand.C0);
			}
			else if(mos.equalsIgnoreCase("CD"))
			{
				resultMap =  pandlsService.pdjs(this.getParams(),Pand.CD);
			}
			else if(mos.equalsIgnoreCase("CS"))
			{
				resultMap =  pandlsService.pdjs(this.getParams(),Pand.CS);
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
	 * C0线边盘点修改保存
	 * @return
	
	public  String  saveC0kc(@Param("list") ArrayList<Xianbkc> list)
	{
	      try 
	      {
	    	 xbcangkpdService.execC0Xianbpd(list); 
			 setResult("result", "保存成功");
		  } 
	      catch (Exception e) 
	      {
				setResult("result", "保存失败");
				log.error("C0线边理论库存盘点修改线边库存异常",e);
		  }  
		  return AJAX;
	}
	 */
	
	
	@SuppressWarnings("unchecked")
	public String saveC0kc()
	{
		List<PandModel> pandModels = null;
		String jsonStr = getParam("data");
		if(StringUtils.isNotBlank(jsonStr))
		{
			pandModels = this.getList(jsonStr, PandModel.class);
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
	    			 map = pandlsService.pdsave(pandModels,creator);
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
	/*public String downLoadFilePd() throws IllegalAccessException, InvocationTargetException, InstantiationException {
		String str = getParam("param");
		ArrayList<Caifjginfo> expls = new ArrayList<Caifjginfo>(50);
		if (str.indexOf("[") != -1) {
			String[] pls = str.split("&");
			Class<Caifjginfo> c = Caifjginfo.class;
			// 获取字段对象集合
			Field[] fields = c.getDeclaredFields();
			for (int j = 0; j < fields.length; j++) {
				Field f = fields[j];
				f.setAccessible(true);
				if ("serialVersionUID".equals(f.getName())) {
					continue;
				}
				for (int i = 0; i < pls.length; i++) {
					String fieldvalueStr = pls[i];
					if (fieldvalueStr.indexOf(f.getName()) != -1) {
						if (j == 0) {
							// 创建实例
							Caifjginfo temp = c.newInstance();
							Object value = fieldvalueStr.substring(fieldvalueStr.lastIndexOf("=") + 1);
							value = f.getType() == BigDecimal.class ? new BigDecimal(value.toString()) : value.toString();
							org.apache.commons.beanutils.BeanUtils.setProperty(temp, f.getName(), value);
							expls.add(temp);
						} else {
							Integer index = Integer.parseInt(fieldvalueStr.substring(fieldvalueStr.indexOf("[") + 1, fieldvalueStr.lastIndexOf("]")));
							Object value = fieldvalueStr.substring(fieldvalueStr.lastIndexOf("=") + 1);
							value = f.getType() == BigDecimal.class ? new BigDecimal(value.toString()) : value.toString();
							org.apache.commons.beanutils.BeanUtils.setProperty(expls.get(index), f.getName(), value);
						}
					}
				}

			}
		}
		Map<String, Object> dataSource = new HashMap<String, Object>();
		dataSource.put("list", expls);
		// 拿到response对象
		HttpServletResponse response = ActionContext.getActionContext().getResponse();
		downloadServices.downloadFile("xbpdDown.ftl", dataSource, response, "线边库存盘点", ExportConstants.FILE_XLS, false);

		// 返回类型一定要是download类型的
		return "downLoad";

	}*/
	
	

	// 盘点导出
	public String downLoadFilePd()
	{
		String jsonStr = getParam("param");
		if(StringUtils.isNotBlank(jsonStr))
		{
			List<PandModel> pandModels = this.getList(jsonStr, PandModel.class);
			if(null != pandModels)
			{
				LoginUser loginUser = AuthorityUtils.getSecurityUser();
				if(null != loginUser)
				{
					for (PandModel pandModel : pandModels) 
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
					downloadServices.downloadFile("xbpdDown.ftl", dataSource, response, "盘点", ExportConstants.FILE_XLS, false);
				}
			}
		}
		// 返回类型一定要是download类型的
		return "downLoad";

	}
	
	private String formatDateToString(Date date)
	{
		if (null == date)
			return null;
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String strDate = formatter.format(date);
		return strDate;
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
