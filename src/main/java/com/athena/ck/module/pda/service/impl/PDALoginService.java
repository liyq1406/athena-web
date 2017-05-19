package com.athena.ck.module.pda.service.impl;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.athena.UserIsExist;
import com.athena.authority.AuthorityConstants;
import com.athena.authority.entity.LoginUser;
import com.athena.authority.entity.User;
import com.athena.authority.service.PageButtonService;
import com.athena.authority.service.UserService;
import com.athena.ck.entity.common.PDALoginUser;
import com.athena.ck.entity.common.PDARongqc;
import com.athena.component.service.BaseService;
import com.toft.core3.container.annotation.Component;
import com.toft.core3.container.annotation.Inject;

@Component
public class PDALoginService extends BaseService<User> {

	private final static Log log = LogFactory.getLog(PDAService.class);
	@Inject
	private UserService userService;
	@Inject
	private UserIsExist userIsExist;
	/**
	 * 获取表空间
	 */
	protected String getNamespace() {
		return AuthorityConstants.MODULE_NAMESPACE;
	}
	/**
	 * 判断PDA用户是否登陆成功
	 * 
	 * @param pdaLoginUser
	 * @return
	 */
	public LoginUser PDAUserLogin(PDALoginUser pdaLoginUser){
		//判断用户是否能登陆成功
		try{
			 userIsExist.userIsExist(pdaLoginUser.getUsername(), pdaLoginUser.getPassword());
			 return (LoginUser)userService.ckGetUserByLoginname(pdaLoginUser.getUsername(),pdaLoginUser.getUsercenter());
		} catch (Exception e) {
			log.error(e.getMessage());
			return null;
		}
	}
	

	//判断用户是否能登陆成功 0010495
	public LoginUser PDAUserLogin2(PDARongqc pdaRongqc){
		try{
			 userIsExist.userIsExist(pdaRongqc.getUsername(), pdaRongqc.getPassword());
			 return (LoginUser)userService.ckGetUserByLoginname(pdaRongqc.getUsername(),pdaRongqc.getUsercenter());
		} catch (Exception e) {
			log.error(e.getMessage());
			return null;
		}
	}
	
	/*
	 * 验证用户是否登录　　2013-01-14
	 * @param pdaLoginUser
	 * @return
	 */
	public boolean checkIsLogin(PDALoginUser pdaLoginUser){
		return false;
	}
	/*
	 * 用户登录　　　2013-01-14
	 * @param pdaLoginUser
	 */
	public void userLogin(PDALoginUser pdaLoginUser){
		return;
	}
	/*
	 * 用户退出　　　2013-01-14
	 * @param pdaLoginUser
	 */
	public void userLoginOut(PDALoginUser pdaLoginUser){
		return;
	}
}
