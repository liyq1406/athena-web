package com.athena.ck.common;

import java.text.MessageFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.commons.lang.StringUtils;

public class CKUtil {
	/*
	 * 获取国际化码信息
	 */
	private static List<ResourceBundle> bundle = new ArrayList<ResourceBundle>();
	/*
	 * 获取系统时间
	 */
	public static String getSysDate() {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sf.format(new Date());
	}

	public static String setValue(String value, int length) {
		StringBuffer restr = new StringBuffer(StringUtils.trimToEmpty(value));
		int vlength = 0;
		for (int i = 0; i < restr.length(); i++) {
			String temp = restr.substring(i, i + 1);
			if (temp.matches("[\u0391-\uFFE5]")) {
				vlength += 2;
			} else {
				vlength++;
			}
		}
		if (vlength < length) {
			for (int i = 0; i < length - vlength; i++) {
				restr.append(" ");
			}
		}
		return " " + restr.toString() + " ";
	}
	/*
	 * 值国际化转换
	 */
	public static String getBundleValue(String key , String formatValue){
		bundle.clear();
		if (bundle.size() < 1){
			bundle.add(ResourceBundle.getBundle("i18n.ck_zh_CN"));
			bundle.add(ResourceBundle.getBundle("i18n.ckJs_zh_CN"));
		}
		for(ResourceBundle item : bundle){
			if(item.containsKey(key)){
				String strValue = item.getString(key);
				if (formatValue != null){
					strValue = MessageFormat.format(strValue,new Object[]{formatValue}); 
				}
				return strValue;
			}
		}
		return null;
	}
	
	/*
	 * 仓库---值国际化转换
	 */
	public static Map getJsonValue(HashMap map){
		if(map.get("response").toString().equals("0000")){
			map.remove("response");
			map.put("response", "0001");
		}
		return map;
	}
}
