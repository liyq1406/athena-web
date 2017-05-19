package com.athena.ck.module.zhijian.action;

import java.util.ArrayList;
import java.util.Map;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.ParseException;
import javax.xml.namespace.QName;
import org.apache.cxf.endpoint.Client;
import org.apache.cxf.frontend.ClientProxy;
import org.apache.cxf.transport.http.HTTPConduit;
import org.apache.cxf.transports.http.configuration.HTTPClientPolicy;
import net.sf.json.JSONObject;


import org.apache.cxf.jaxws.endpoint.dynamic.JaxWsDynamicClientFactory;

import com.athena.authority.entity.LoginUser;
import com.athena.authority.util.AuthorityUtils;

import com.athena.ck.common.CKUtil;
import com.athena.ck.entity.common.CommonEntity;
import com.athena.ck.entity.zhijian.Chengptxb;
import com.athena.component.wtc.action.BaseWtcAction;
import com.toft.core2.ToftConst;
import com.toft.core2.UserInfo;
import com.toft.core3.container.annotation.Component;
import com.toft.core3.container.core.ComponentDefinition;
import com.toft.mvc.annotaions.Param;

/**
 * <p>
 * Title:库内Action
 * </p>
 * <p>
 * Description:定义质检相关页面动作处理
 * </p>
 * <p>
 * Copyright: Copyright (c) 2011
 * </p>
 * <p>
 * Company: 软通动力
 * </p>
 * 
 * @author 甘露
 * @version v1.0
 * @date 2012-3-26
 */
@Component(scope = ComponentDefinition.SCOPE_PROTOTYPE)
public class ZhijAction extends BaseWtcAction {
	//构建webService对象
	private static JaxWsDynamicClientFactory dcf;
	private static org.apache.cxf.endpoint.Client client;
	//private static IPDAService clientSer;
	static{
		try{
			/*QName qName = new QName("http://server.soap.ilkj.net/","HelloServiceImpl");
			PDAService helloServiceImplService = new PDAService(new URL("http://10.26.171.167:7001/athena/services/pdaService?wsdl"),qName);
			IPDAService helloService = helloServiceImplService.getPort(IPDAService.class);
			client = ClientProxy.getClient(helloService);
			HTTPConduit http = (HTTPConduit) client.getConduit();
			HTTPClientPolicy httpClientPolicy = new HTTPClientPolicy();
			httpClientPolicy.setConnectionTimeout(36000);
			httpClientPolicy.setReceiveTimeout(32000);
			http.setClient(httpClientPolicy);*/

			JaxWsDynamicClientFactory clientFactory = JaxWsDynamicClientFactory
					.newInstance();
			String url = "http://10.26.218.30/athena/services/pdaService?wsdl";
			client = clientFactory.createClient(url);
			HTTPConduit http = (HTTPConduit) client.getConduit();
			HTTPClientPolicy httpClientPolicy = new HTTPClientPolicy();
			httpClientPolicy.setConnectionTimeout(36000); 
			// 连接超时
			httpClientPolicy.setAllowChunking(false);
			 // 取消块编码
			 httpClientPolicy.setReceiveTimeout(32000);
			 // 响应超时
			http.setClient(httpClientPolicy);
			
			//JaxWsProxyFactoryBean proxyFb = new JaxWsProxyFactoryBean();
	        //proxyFb.setAddress("http://10.26.171.167:7001/athena/services/pdaService?wsdl");
	        //proxyFb.setServiceClass(IPDAService.class);
	        //clientSer = (IPDAService)proxyFb.create();
	        // 设置服务对象的代理
	        //client = ClientProxy.getClient(clientSer);
	        
	        //HTTPConduit conduit = (HTTPConduit) client.getConduit();
            //HTTPClientPolicy policy = new HTTPClientPolicy();
             // 设置连接超时
            //policy.setConnectionTimeout(36000);
            // 设置请求超时
            //policy.setReceiveTimeout(32000);
            //conduit.setClient(policy);

			//dcf = JaxWsDynamicClientFactory.newInstance();
			//client = dcf.createClient("http://10.26.218.30/athena/services/pdaService?wsdl");
		}catch (Exception e){
			
		}
	}
	 
	
	public UserInfo getUserInfo(){
		return (UserInfo) getSessionAttribute(ToftConst.Toft_SessionKey_UserData);
	}
	
	/*成品退线边*/
	/**
	 * 215 成品退线边页面
	 * @return
	 * String
	 */
	public String chengptxbYm(){
		return "select";
	}
	/**
	 * 21501 成品退线边  查询US信息
	 * @return 
	 */
	public String chengptxbQueryUS(){
		String transcode = "21501";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 21502 成品退线边  保存确认
	 * @return 
	 */
	public String chengptxbSave(){
		String transcode = "21502";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 21503 成品退线边  删除行
	 * @return 
	 */
	public String chengptxbDelete(@Param("list") ArrayList<Chengptxb> list){
		String transcode = "21503";
		Map map = this.getParams();
		map.put("list", list);
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 21504 成品退线边分页 查询
	 * @return 
	 */
	public String chengptxbQueryFy(){
		String transcode = "21504";
		Map map = this.getParams();
		setResult("result", CKUtil.getJsonValue(this.callWtc(transcode, map)));
		return AJAX;
	}
	/**
	 * 21505 成品退线边  提交
	 * @return 
	 */
	public String chengptxbSubmit(){
		String transcode = "21505";
		Map map = this.getParams();
		setResult("result", this.callWtc(transcode, map));
		return AJAX;
	}
	
	/*成品退线边*/
	/**
	 * 216 成品退线边查询页面
	 * @return
	 * String
	 */
	public String chengptxbCxYm(){
		return "select";
	}
	
	/*成品退线边*/
	/**
	 * 217 手持收货页面
	 * @return
	 * String
	 */
	public String shoucshYm(){
		return "select";
	}
	
	public String shoucshSubmit() throws Exception{
		long startCallWTCTime = System.currentTimeMillis();
		//生成json
		CommonEntity commonEntity = new CommonEntity();
		commonEntity.setTrans_type("01");
		commonEntity.setTrscode(this.getParam("transcode"));
		commonEntity.setParameter(this.getParams());
		//添加用户
		LoginUser loginUser = AuthorityUtils.getSecurityUser();
		commonEntity.setOper_no(loginUser.getUsername());
		commonEntity.setTrans_bran_code(loginUser.getUsercenter());
		JSONObject jSONObj = JSONObject.fromObject(commonEntity);
		jSONObj.put("loginKey", "11111111111111");
		//调用webServices
		System.out.println(System.currentTimeMillis());
		//String strJSON = clientSer.callWTC(jSONObj.toString());
		Object[] objects = client.invoke("callWTC", jSONObj.toString());
		String strJSON = objects[0].toString();
		long endCallWTCTime = System.currentTimeMillis();
		System.out.println(endCallWTCTime-startCallWTCTime);
		setResult("result", JSONObject.fromObject(strJSON));
		return AJAX;
	}
}
