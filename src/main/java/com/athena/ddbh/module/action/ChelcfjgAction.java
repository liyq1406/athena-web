package com.athena.ddbh.module.action;

import java.util.HashMap;
import java.util.Map;

import com.athena.authority.entity.LoginUser;
import com.athena.authority.util.AuthorityUtils;
import com.athena.ddbh.entity.Chelcfjg;
import com.athena.ddbh.module.service.ChelcfjgService;
import com.athena.util.CommonUtil;
import com.athena.util.athenalog.impl.UserOperLog;
import com.toft.core3.container.annotation.Component;
import com.toft.core3.container.annotation.Inject;
import com.toft.core3.container.core.ComponentDefinition;
import com.toft.mvc.ActionSupport;
import com.toft.mvc.annotaions.Param;

/**
 * 车辆拆分结果action
 * @author chenlei
 * @vesion 1.0
 * @date 2012-3-29
 */
@Component(scope=ComponentDefinition.SCOPE_PROTOTYPE)
public class ChelcfjgAction extends ActionSupport {
	
	@Inject
	private UserOperLog userOperLog;
	@Inject
	private ChelcfjgService chelService;
	
	/**
	 * 获取当前用户信息
	 * @return
	 */
	public LoginUser getLoginUser() {
		//返回当前用户对象
		return AuthorityUtils.getSecurityUser();
	}
	
	
	/**
	 * 获取车辆拆分结果
	 * @return
	 */
	public String list(@Param Chelcfjg bean){
		try{
			//根据条件得到车辆拆分信息
			Map<String,Object> map = chelService.getChelcfjgs(bean);
			//判断是否有错误信息
			if(map.get("CHECFJG_ERROR")!=null){
				//错误信息不为空
				String error = (String) map.get("CHECFJG_ERROR");
				//取出错误信息
				Map<String,String> errors = new HashMap<String, String>();
				errors.put("message", error);
				//将错误信息 设置到result
				setResult("result", errors);
			}else{
				//返回查询结果
				setResult("result", map);
			}
			userOperLog.addCorrect(CommonUtil.MODULE_CKX, "车辆拆分结果", "数据查询");
		}catch(Exception e){
			Map<String,String> map = new HashMap<String,String>();
			//抛出Exception异常
			map.put("message", e.getMessage());
			setResult("result", map);
			userOperLog.addError(CommonUtil.MODULE_CKX, "车辆拆分结果", "数据查询", CommonUtil.getClassMethod(), CommonUtil.replaceBlank(e.getMessage()));
		}
		//AJAX跳转
		return AJAX;
	}
	
	/**
	 * 初始化页面
	 * @return
	 */
	public String initi(){
		//页面的跳转
		 return "initi";
	}
	
	/**
	 * 分总成重新拆分
	 * @return
	 */
	public String rewrite(){
		try{
			// 根据PDS拆分信息重新拆分分总成
			setResult("count", chelService.reSpiltFenzc(getLoginUser().getUsername()));
			setResult("success", true);
			userOperLog.addCorrect(CommonUtil.MODULE_XQJS, "同步分装线排产", "重新拆分分总成");
		}catch(Exception e){
			setResult("success", false);
			userOperLog.addError(CommonUtil.MODULE_XQJS, "同步分装线排产", "重新拆分分总成", CommonUtil.getClassMethod(), CommonUtil.replaceBlank(e.getMessage()));
		}
		return AJAX;
	}
}
