package com.athena.ck.module.yaohl.action;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.athena.ck.entity.yaohl.Yaohls;
import com.athena.ck.module.yaohl.service.YaohlsService;
import com.athena.excore.template.DownLoadServices;
import com.athena.excore.template.export.ExportConstants;
import com.athena.util.exception.ActionException;
import com.athena.xqjs.entity.maoxq.CompareCyc;
import com.athena.xqjs.module.maoxq.action.NullCalendarCenterException;
import com.toft.core3.container.annotation.Component;
import com.toft.core3.container.annotation.Inject;
import com.toft.core3.container.core.ComponentDefinition;
import com.toft.mvc.ActionSupport;
import com.toft.mvc.annotaions.Param;
import com.toft.mvc.dispacher.ActionContext;

/**
 * CD/MD上线全程跟踪
 * @author 贺志国
 * @E-mail zghe@isoftstone.com
 * @version v1.0
 * @date 2014-10-31
 */
@Component(scope = ComponentDefinition.SCOPE_PROTOTYPE)
public class YaohlsAction extends ActionSupport {
	@Inject
	private YaohlsService yaohlsService;
	
	@Inject
	private DownLoadServices downloadServices = null;
	
	protected static Logger logger = Logger.getLogger(YaohlsAction.class);	//定义日志方法 
	
	/**
	 * 初始化页面
	 * @author 贺志国
	 * @date 2014-11-3
	 * @return
	 */
	public String accessInitPages(){
		
		return "select";
	}
	
	/**
	 * CD/MD查询
	 * @author 贺志国
	 * @date 2014-10-31
	 * @param bean
	 * @return
	 */
	public String queryYaohlOfCdmd(@Param Yaohls bean){
		Map<String,String> params = this.getParams();
		String m = "";
		if(params.get("yaohllx")==null){
			m = "【要货令类型】不能为空";
		}else if(params.get("usercenter")==null){
			m = "【用户中心】不能为空";
		}else if(params.get("shij")==null){
			m = "【时间】不能为空";
		}else if(params.get("qissj")==null){
			m = "【开始时间】不能为空";
		}else if(params.get("jiessj")==null){
			m = "【结束时间】不能为空";
		}
		
		if(m!=null && m.length()>0){
			throw new ActionException(m);
		}
		Map<String,Object> result = null;
		if("CD".equals(params.get("yaohllx"))){
			result = yaohlsService.selectYaohlOfcd(bean,params);
		}else if("MD".equals(params.get("yaohllx"))){
			result = yaohlsService.selectYaohlOfmd(bean,params);
		}
		setResult("result", result);
		return AJAX;
	}
	
	
	/**
	 * CD/MD 前端要货令状态
	 *  [{YAOHLMC=表达, YAOHLLX=01}, {YAOHLMC=在途, YAOHLLX=02}, 
	 *  {YAOHLMC=等待交付, YAOHLLX=03}, {YAOHLMC=已交付, YAOHLLX=04}]
	 * @return String 
	 */
	public String selectQdYhlzt(@Param("yaohllxParams") String yaohllx) {
		logger.info("yaohllx--->"+yaohllx);
		Map<String,String>  map0 = new HashMap<String,String>();
		Map<String,String>  map1= new HashMap<String,String>();
		Map<String,String>  map2 = new HashMap<String,String>();
		Map<String,String>  map3 = new HashMap<String,String>();
		Map<String,String>  map4 = new HashMap<String,String>();
		List<Map<String,String>> ztList = new ArrayList<Map<String,String>>(); 
		map1.put("YAOHLLX", "01");
		map1.put("YAOHLMC", "表达");
		map2.put("YAOHLLX", "02");
		map2.put("YAOHLMC", "在途");
		map3.put("YAOHLLX", "03");
		map3.put("YAOHLMC", "等待交付");
		map0.put("YAOHLLX", "00");
		map0.put("YAOHLMC", "已交付");
		map4.put("YAOHLLX", "04");
		map4.put("YAOHLMC", "延误");
		
		if("CD".equals(yaohllx)){
			ztList.add(map1);
			ztList.add(map2);
			ztList.add(map3);
			ztList.add(map0);
		}else if("MD".equals(yaohllx)){
			ztList.add(map1);
			ztList.add(map4);
			ztList.add(map0);
		}
		setResult("result",ztList);
		return AJAX;
	}

	/**
	 * CD/MD查询检查数据条数是否超过5000
	 * @author 王国首
	 * @date 2014-11-10
	 * @param bean
	 * @return
	 */
	public String expcheck(@Param Yaohls bean){
		String message = null;
		Map<String,String> result =new HashMap<String,String>();
		Map<String,String> params = this.getParams();
		int re = 0;
		String sql = "yaohls.queryYaohlOfmdcount";
		if("CD".equals(params.get("yaohllx"))){
			sql = "yaohls.queryYaohlOfcdcount";
		}
		params.put("sql", sql);
		params.put("head", "select count(*) from (");
		params.put("foot", ")");
		re = yaohlsService.selectYaohlOfcdmdCount(params);
		if(re>5000){
			setResult("errorMessage", "查询范围内数据条数大于5000条，无法下载！");
			return AJAX;
		}

		return AJAX;
	}

	
	/**
	 * 导出下载
	 * @author 王国首
	 * @date 2014-11-10
	 * @param bean
	 * @return
	 */
	public String downLoadFileYhlCDMD(@Param Yaohls bean) throws NullCalendarCenterException, IOException {
		Map<String, Object> dataSource = null;
		Map<String,String> params = this.getParams();
		String sql = "yaohls.queryYaohlOfmd";
		if("CD".equals(params.get("yaohllx"))){
			sql = "yaohls.queryYaohlOfcd";
		}
		params.put("sql", sql);

		dataSource = yaohlsService.selectYaohlOfcdmdDown(params);
		// 拿到response对象
		HttpServletResponse response = ActionContext.getActionContext().getResponse();
		// 设置下载
		String fileName = null;
		fileName = "yaohlCDMD.ftl";
		downloadServices.downloadFile(fileName, dataSource, response, "CDMD上线全程跟踪", ExportConstants.FILE_XLS, false);

		// 返回类型一定要是download类型的
		return "downLoad";

	}
	
}
