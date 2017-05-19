package com.athena.jk.module.action;

import java.util.Map;

import com.athena.jk.entity.In_zidb;
import com.athena.jk.module.service.In_zidbService;
import com.toft.core3.container.annotation.Component;
import com.toft.core3.container.annotation.Inject;
import com.toft.core3.container.core.ComponentDefinition;
import com.toft.mvc.ActionSupport;
import com.toft.mvc.annotaions.Param;

/**
 * 
 * @author 贺志国
 * @E-mail zghe@isoftstone.com
 * @version v1.0
 * @date 2013-3-20
 */
@Component(scope = ComponentDefinition.SCOPE_PROTOTYPE)
public class In_zidbAction extends ActionSupport {
	//注入service
	@Inject
	private In_zidbService inservice;
	
	public String accessInzidb(){
		
		return "select";
	}
	
	public String queryInzidb(@Param In_zidb bean){
		Map<String,Object> result = inservice.select(bean);
		setResult("result",result);
		return AJAX;
	}
}
