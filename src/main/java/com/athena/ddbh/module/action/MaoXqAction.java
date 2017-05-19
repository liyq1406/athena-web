package com.athena.ddbh.module.action;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.athena.authority.entity.LoginUser;
import com.athena.ddbh.entity.Anxmaoxq;
import com.athena.ddbh.module.service.MaoXqCompareService;
import com.athena.util.CommonUtil;
import com.athena.util.athenalog.impl.UserOperLog;
import com.toft.core3.container.annotation.Component;
import com.toft.core3.container.annotation.Inject;
import com.toft.mvc.ActionSupport;
import com.toft.mvc.annotaions.Param;

/**
 * <p>
 * 项目名称：athena-xqjs
 * </p>
 * 类名称：MaoxqAction
 * <p>
 * 类描述： 毛需求
 * </p>
 * 创建人：Niesy
 * <p>
 * 创建时间：2012-02-07
 * </p>
 * 
 * @version
 * 
 */

@Component
public class MaoXqAction extends ActionSupport {

	@Inject
	private MaoXqCompareService maoxqCompareService;

	private final Log log = LogFactory.getLog(MaoXqAction.class);
	@Inject
	private UserOperLog userOperLog;

	// 获取用户信息
	public LoginUser getUserInfo() {

		return com.athena.authority.util.AuthorityUtils.getSecurityUser();
	}

	/**
	 * 页面初始化，执行跳转
	 */
	public String execute() {
		return "success";
	}
	
	/**
	 * 页面初始化，执行跳转 
	 * 0007182: 增加按需毛需求查询界面  按需 毛需求主页面初始化 
	 */
	public String executeAn_x() {
		setResult("usercenter",getUserInfo().getUsercenter());
		return "success";
	}

	/**
	 * 0007182: 增加按需毛需求查询界面  按需 毛需求查询
	 */
	public String queryMaoxqAnx(@Param Anxmaoxq bean) {
		this.userOperLog.addCorrect(CommonUtil.MODULE_XQJS, "按需毛需求查询", "按需毛需求查询开始");
		try {
			Map<String,Object> map = maoxqCompareService.selectAnxMxq(getParams(), bean);
			//setResult("result", maoxqCompareService.selectAnxMxq(getParams(), bean));
			//判断是否有错误信息
			if(map.get("anxmxq_ERROR")!=null){
				//错误信息不为空
				String error = (String) map.get("anxmxq_ERROR");
				//取出错误信息
				Map<String,String> errors = new HashMap<String, String>();
				errors.put("message", error);
				//将错误信息 设置到result
				setResult("result", errors);
			}else{
				//返回查询结果
				setResult("result", map);
			}
		} catch (Exception e) {
			Map<String,String> map = new HashMap<String,String>();
			map.put("message", e.getMessage());
			setResult("result", map);
			setResult("success", false);
		}
		this.userOperLog.addCorrect(CommonUtil.MODULE_XQJS, "按需毛需求查询", "按需毛需求查询结束");
		return AJAX;
	}

}
