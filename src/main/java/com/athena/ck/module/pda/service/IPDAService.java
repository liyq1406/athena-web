package com.athena.ck.module.pda.service;

import javax.jws.WebService;

@WebService
public interface IPDAService {

	/**
	 * 手持机系统登陆方法
	 * @date 2012-4-16
	 * @param bizJson 客户端业务请求json串
	 * @return String 返回客户端需求json字符串
	 * @throws ServiceException
	 */
	public String doLogin(String bizJson);
	
	/**
	 * 手持机系统退出登陆方法
	 * @date 2012-4-16
	 * @param bizJson 客户端业务请求json串
	 * @return String 返回客户端需求json字符串
	 * @throws ServiceException
	 */
	public String doLoginOut(String bizJson);
	
	/**
	 * 手持机系统获取基础数据
	 * @date 2012-4-16
	 * @param bizJson 客户端业务请求json串
	 * @return String 返回客户端需求json字符串
	 * @throws ServiceException
	 */
	public String getBaseCode(String bizJson);
	
	/**
	 * 手持机系统业务通用WTC方法
	 * @date 2011-12-30
	 * @param bizJson 客户端业务请求json串
	 * @return 返回客户端需求json字符串
	 * @throws ServiceException
	 */
	public String callWTC(String bizJson);
	
	
	
	/* 手持机获得容器厂数据
	 * 2015.5.18
	 * xss
	 * 0010495
	 */	
	public String getRongqc(String bizJson);
	
}
