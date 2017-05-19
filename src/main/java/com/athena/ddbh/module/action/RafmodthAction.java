package com.athena.ddbh.module.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.athena.authority.entity.LoginUser;
import com.athena.authority.util.AuthorityUtils;
import com.athena.ddbh.entity.RAFMODth;
import com.athena.ddbh.module.service.RAFMODthService;
import com.athena.util.CommonUtil;
import com.athena.util.athenalog.impl.UserOperLog;
import com.toft.core3.container.annotation.Component;
import com.toft.core3.container.annotation.Inject;
import com.toft.core3.container.core.ComponentDefinition;
import com.toft.mvc.ActionSupport;
import com.toft.mvc.annotaions.Param;
/**
 * MAFMOD替换action
 * @author chenlei
 * @vesion 1.0
 * @date 2012-3-29
 */
@Component(scope=ComponentDefinition.SCOPE_PROTOTYPE)
public class RafmodthAction extends ActionSupport {
	@Inject
	private UserOperLog userOperLog;
	@Inject
	private RAFMODthService rService;
	
	/**
	 * 获取当前用户信息
	 * @return
	 */
	public LoginUser getLoginUser() {
		return AuthorityUtils.getSecurityUser();
	}
	
//	/**
//	 * 添加
//	 * @param bean
//	 * @return
//	 */
//	public String save(@Param RAFMODth bean){
//		Map<String,String> map = new HashMap<String,String>();
//		try{
//			//设置 创建人   操作人 
//			bean.setChuangjr(getLoginUser().getUsername());
//			bean.setCaozr(getLoginUser().getUsername());	
//			
//			//调用service方法
//			rService.save(bean);
//			
//			//设置操作处理结果
//			map.put("message", "保存成功！");
//		}catch(ServiceException e){
//			map.put("message", "保存失败！");
//			e.printStackTrace();
//		}catch (Exception e) {
//			map.put("message", "保存失败！");
//			e.printStackTrace();
//		}
//		
//		setResult("result",map);
//		return AJAX;
//	}
//	
//	/**
//	 * 更新
//	 * @param bean
//	 * @return
//	 */
//	public String update(@Param RAFMODth bean){
//		Map<String,String> map = new HashMap<String,String>();
//		
//		try{
//			//设置 操作人
//			bean.setCaozr(getLoginUser().getUsername());
//			
//			//调用service方法
//			rService.update(bean);
//			
//			//设置操作处理结果
//			map.put("message", "修改成功！");
//		}catch(ServiceException e){
//			map.put("message", "修改失败！");
//			e.printStackTrace();
//		}catch (Exception e) {
//			map.put("message", "修改失败！");
//			e.printStackTrace();
//		}
//		
//		setResult("result",map);
//		return AJAX;
//	}
//	
//	/**
//	 * 删除
//	 * @param beans
//	 * @return
//	 */
//	public String delete(@Param List<RAFMODth> beans){
//		Map<String,String> map = new HashMap<String,String>();
//		
//		try{
//			rService.delete(beans);
//			//设置操作处理结果
//			map.put("message", "删除成功！");
//		}catch(ServiceException e){
//			map.put("message", "删除失败！");
//			e.printStackTrace();
//		}catch (Exception e) {
//			map.put("message", "删除失败！");
//			e.printStackTrace();
//		}
//		
//		setResult("result",map);
//		return AJAX;
//	}
	
	/**
	 * 查询
	 * @param bean
	 * @return
	 */
	public String list(@Param RAFMODth bean){
		
		try{
			bean.setUsercenter(getLoginUser().getUsercenter());
			Map<String,Object> map = rService.getRAFMODs(bean);
			setResult("result", map);
			userOperLog.addCorrect(CommonUtil.MODULE_CKX, "RAFMOD替换", "数据查询");
		}catch (Exception e) {
			Map<String,String> map = new HashMap<String,String>();
			//抛出Exception异常
			map.put("message", e.getMessage());
			setResult("result", map);
			userOperLog.addError(CommonUtil.MODULE_CKX, "RAFMOD替换", "数据查询", CommonUtil.getClassMethod(), CommonUtil.replaceBlank(e.getMessage()));
		}
		//AJAX跳转
		return AJAX;
	}
	
	/**
	 * 初始化页面
	 * @return
	 */
	public String initi(){
		 return "initi";
	}
	
	/**
	 * 页面保存  修改 删除操作
	 * @param addList
	 * @param editList
	 * @param delList
	 * @return
	 */
	public String savePg(@Param("addList") ArrayList<RAFMODth> addList,@Param("editList") ArrayList<RAFMODth> editList,@Param("delList") ArrayList<RAFMODth> delList){
		Map<String,String> map = new HashMap<String,String>();
		try {
			//对页面传来集合进行新增，修改删除操作
			map.put("message", rService.savePg(addList, editList, delList, getLoginUser()));
			userOperLog.addCorrect(CommonUtil.MODULE_CKX, "RAFMOD替换", "数据保存");
		} catch (Exception e) {
			map.put("message", e.getMessage());
			userOperLog.addError(CommonUtil.MODULE_CKX, "RAFMOD替换", "数据保存", CommonUtil.getClassMethod(), CommonUtil.replaceBlank(e.getMessage()));
		}
		setResult("result",map );
		//AJAX跳转
		return AJAX;
	}
	
}
