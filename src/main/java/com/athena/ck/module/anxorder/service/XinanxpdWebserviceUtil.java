package com.athena.ck.module.anxorder.service;

import java.math.BigDecimal;
import java.util.List;

import org.apache.cxf.frontend.ClientProxy;
import org.apache.cxf.frontend.ClientProxyFactoryBean;
import org.apache.cxf.transport.Conduit;
import org.apache.cxf.transport.http.HTTPConduit;
import org.apache.cxf.transports.http.configuration.HTTPClientPolicy;
import org.apache.log4j.Logger;

import com.athena.ck.entity.anxorder.NoAnxjssjException;
import com.athena.ck.entity.anxorder.Pand;
import com.athena.ck.entity.anxorder.TranslateListToMapException;
import com.athena.ck.entity.anxorder.Xiaohcxhdmb;
import com.athena.ck.entity.anxorder.XinAnxpd;
import com.athena.component.utils.LoaderProperties;

public class XinanxpdWebserviceUtil implements XinanxpdWebservice
{

//	private String http = "http://";
//	
//	private String ip = "10.26.218.79";
//	
//	private String webservicePath = "/athena/services/xinanxpdWebservice";
	
	private XinanxpdWebservice xinanxpdWebservice ; 
	
	private Logger logger = Logger.getLogger(XinanxpdWebserviceUtil.class);
	
	
	//配置文件路径
	private final String fileName="urlPath.properties";  
	
	/**
	 * @see    初始化webservice服务类，并且进行超时限制，然后调用webservice服务
	 * @throws Exception
	 */
	public XinanxpdWebserviceUtil() throws Exception
	{
		super();
		try
		{
			String urlPath = LoaderProperties.getPropertiesMap(fileName).get("urlPath");
			ClientProxyFactoryBean factory = new ClientProxyFactoryBean();
			factory.setServiceClass(XinanxpdWebservice.class);
			factory.setAddress(urlPath +"xinanxpdWebservice");
			xinanxpdWebservice = (XinanxpdWebservice)factory.create();
			Conduit conduit = ClientProxy.getClient(xinanxpdWebservice).getConduit();  
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

	@Override
	public List<XinAnxpd> initXinAnxpd(List<XinAnxpd> xinanxpds)
			throws NoAnxjssjException, TranslateListToMapException {
		return xinanxpdWebservice.initXinAnxpd(xinanxpds);
	}
	
	@Override
	public BigDecimal jsDxh(Xiaohcxhdmb xhc, Pand pand) {
		return xinanxpdWebservice.jsDxh(xhc, pand);
	}
	
	@Override
	public BigDecimal jsYingyl(XinAnxpd xinAnxpd){
		return xinanxpdWebservice.jsYingyl(xinAnxpd);
	}

	
	@Override
	public void savePandModel(List<XinAnxpd> pandModels) throws TranslateListToMapException
	{
		xinanxpdWebservice.savePandModel(pandModels);
	}


	
}
