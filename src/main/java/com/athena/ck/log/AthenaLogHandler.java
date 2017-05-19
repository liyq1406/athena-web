package com.athena.ck.log;

import javax.servlet.http.HttpServletRequest;

import com.toft.mvc.interceptor.supports.log.LogContext;
import com.toft.mvc.interceptor.supports.log.LogHandler;

/**
 * <p>
 * Title:
 * </p>
 * <p>
 * Description:
 * </p>
 * <p>
 * Copyright: Copyright (c) 2011
 * </p>
 * <p>
 * Company: 软通动力
 * </p>
 * 
 * @author 林笛
 * @version v1.0
 * @date 2012-2-6下午02:39:39
 */
public class AthenaLogHandler implements LogHandler{

	/* (non-Javadoc)
	 * @see com.toft.mvc.interceptor.supports.log.LogHandler#handler(com.toft.mvc.interceptor.supports.log.LogContext)
	 */
	public void handler(LogContext logContext) {
		// TODO Auto-generated method stub
		//System.out.println(1111);
	}

	/* (non-Javadoc)
	 * @see com.toft.mvc.interceptor.supports.log.LogHandler#convert(javax.servlet.http.HttpServletRequest, com.toft.mvc.interceptor.supports.log.LogContext)
	 */
	public void convert(HttpServletRequest request, LogContext logContext) {
		// TODO Auto-generated method stub
		
	}

}
