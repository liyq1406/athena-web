/**
 * 
 */
package com.toft.mvc.result.supports;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

/**
 * <p>Title:SDC UI组件</p>
 *
 * <p>Description:</p>
 *
 * <p>Copyright:Copyright (c) 2011.11</p>
 *
 * <p>Company:iSoftstone</p>
 *
 * @author zhouyi
 * @version 1.0.0
 */
public class BigDecimalValueProcessor  implements JsonValueProcessor{

	/* (non-Javadoc)
	 * @see net.sf.json.processors.JsonValueProcessor#processArrayValue(java.lang.Object, net.sf.json.JsonConfig)
	 */
	public Object processArrayValue(Object value, JsonConfig jsonConfig) {
		return process(value);
	}

	/* (non-Javadoc)
	 * @see net.sf.json.processors.JsonValueProcessor#processObjectValue(java.lang.String, java.lang.Object, net.sf.json.JsonConfig)
	 */
	public Object processObjectValue(String key, Object value,
			JsonConfig jsonConfig) {
		return process(value);
	}

	/**
	 * BigDecimal类型处理:
	 * bigAttr=null，返回{"big":null}
	 * bigAttr=1，返回{"big":1}
	 * bigAttr=0，返回{"big":0}
	 * @param value
	 * @return
	 */
	private Object process(Object value) {
		if(value==null)return "";
		return value;
	}

}
