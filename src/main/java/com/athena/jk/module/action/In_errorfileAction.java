package com.athena.jk.module.action;


import java.util.Map;

import com.athena.jk.entity.In_errorfile;
import com.athena.jk.module.service.In_errorfileService;
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
 * @date 2012-10-25
 */
@Component(scope = ComponentDefinition.SCOPE_PROTOTYPE)
public class In_errorfileAction extends ActionSupport {
	//注入service
	@Inject
	private In_errorfileService inservice;
	
	public String accessInerrorfilePages(){
		
		return "select";
	}
	
	public String queryInerrorfile(@Param In_errorfile bean){
		/*Map<String, String> params = this.getParams();
		inservice.selectErrorfile(bean, params);*/
		Map<String,Object> result = inservice.select(bean);
		setResult("result",result);
		return AJAX;
	}
}
