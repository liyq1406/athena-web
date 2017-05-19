package com.athena.bo;


import java.text.MessageFormat;
import java.util.ResourceBundle;

import org.apache.log4j.Logger;

import com.crystaldecisions.celib.properties.URLEncoder;
import com.crystaldecisions.sdk.exception.SDKException;
import com.crystaldecisions.sdk.framework.CrystalEnterprise;
import com.crystaldecisions.sdk.framework.IEnterpriseSession;
import com.toft.core3.container.annotation.Component;
import com.toft.core3.container.core.ComponentDefinition;
import com.toft.mvc.ActionSupport;

@Component (scope = ComponentDefinition.SCOPE_PROTOTYPE)
public class BoAction extends ActionSupport{
	
	private static String TOKEN;
	private static Logger logger =   Logger.getLogger(BoAction.class);	
	private static String propertyFileName = "com/athena/bo/config/bo";//配置文件路径
    private static ResourceBundle resourceBundle=ResourceBundle.getBundle(propertyFileName);;
	/**
	 * 跳转到BO页面
	 * @return String
	 * @throws Exception 
	 */
	public String execute(){
		String url= resourceBundle.getString("url1");
		String ID=this.getParam("cuid");
		ID=ID==null?"":ID;
		try {
//			openDocumentToken();		
//			String src=MessageFormat.format(url,ID,TOKEN,"CUID");
			String src=MessageFormat.format(url,ID);
			this.setResult("src", src);
		} catch (Exception e) {
			logger.error(e.toString());
		}
		return "select";
	}

	/**
	 * 根据用户获取token
	 * @throws SDKException
	 */
//	protected synchronized void openDocumentToken() throws SDKException{
//		if(TOKEN==null||TOKEN.equals("")){
//			logger.info("获取TOKEN");
//			String pass =resourceBundle.getString("password");//"P@ssw0rd";
//			String name =resourceBundle.getString("username");//Administrator
//			String service = resourceBundle.getString("service");//10.26.218.141:6400
//			IEnterpriseSession sess = CrystalEnterprise.getSessionMgr().logon (name, pass, service,"secEnterprise");
//			String token = sess.getLogonTokenMgr().createLogonToken("",120,100);
//			TOKEN = URLEncoder.encode(token);
//			logger.info("获取TOKEN="+TOKEN);
//			sess.logoff();
//		}
//	}
}
