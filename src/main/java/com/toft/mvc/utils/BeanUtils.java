package com.toft.mvc.utils;

import java.util.Map;

public abstract class BeanUtils {
	
	public static void populate(Object bean, Map<?, ?> properties) {
		try {
			String key;
			for(Map.Entry<?, ?> entry :properties.entrySet()){
				key = entry.getKey().toString();
				if(key.indexOf("[")!=-1){
					continue;
				}
				com.athena.component.utils.PropertyUtils.setPropertyValue(
						bean,key, entry.getValue());
				key = null;
			}
		} catch (Exception e) {
			throw new RuntimeException("Fail on populate property", e);
		}
	}

	public static void setProperty(Object object, String name, Object value) {
		try {
			org.apache.commons.beanutils.BeanUtils.setProperty(object, name,
					value);
		} catch (Exception e) {
			throw new RuntimeException("Fail on set property", e);
		}
	}
}
