package com.athena.ck.module.anxorder.service;

import java.util.List;

import org.apache.cxf.frontend.ClientProxy;
import org.apache.cxf.frontend.ClientProxyFactoryBean;
import org.apache.cxf.transport.Conduit;
import org.apache.cxf.transport.http.HTTPConduit;
import org.apache.cxf.transports.http.configuration.HTTPClientPolicy;
import org.apache.log4j.Logger;

import com.athena.ck.entity.anxorder.NoAnxjssjException;
import com.athena.ck.entity.anxorder.PandModel;
import com.athena.ck.entity.anxorder.TranslateListToMapException;
import com.athena.component.utils.LoaderProperties;

public class PandWebserviceUtil implements PandWebservice
{

//	private String http = "http://";
//	
//	private String ip = "10.26.218.79";
//	
//	private String webservicePath = "/athena/services/pandWebservice";
	
	private PandWebservice pandWebservice ; 
	
	private Logger logger = Logger.getLogger(PandWebserviceUtil.class);
	
	
	//配置文件路径
	private final String fileName="urlPath.properties";  
	
	/**
	 * @see    初始化webservice服务类，并且进行超时限制，然后调用webservice服务
	 * @throws Exception
	 */
	public PandWebserviceUtil() throws Exception
	{
		super();
		try
		{
			String urlPath = LoaderProperties.getPropertiesMap(fileName).get("urlPath");
			ClientProxyFactoryBean factory = new ClientProxyFactoryBean();
			factory.setServiceClass(PandWebservice.class);
			factory.setAddress(urlPath +"pandWebservice");
			pandWebservice = (PandWebservice)factory.create();
			Conduit conduit = ClientProxy.getClient(pandWebservice).getConduit();  
		    HTTPConduit hc = (HTTPConduit)conduit;  
		    HTTPClientPolicy client = new HTTPClientPolicy();  
		     // 15分钟超时时间
		    client.setReceiveTimeout(1000 * 60 * 15);    
		    hc.setClient(client);  
		}
		catch (Exception e) 
		{
			logger.error(e);
			throw e;
		}
	}


	public List<PandModel> initPandModel(List<PandModel> pandModels) throws NoAnxjssjException, TranslateListToMapException 
	{
		return pandWebservice.initPandModel(pandModels);
	}


	public void savePandModel(List<PandModel> pandModels) throws TranslateListToMapException
	{
		pandWebservice.savePandModel(pandModels);
	}
	
}
