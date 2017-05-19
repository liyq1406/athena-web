/**
 * 
 */
package com.athena.component.ws;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;

import org.apache.cxf.frontend.ServerFactoryBean;
import org.apache.cxf.transport.servlet.CXFNonSpringServlet;
import org.apache.log4j.Logger;

import com.athena.ck.module.anxorder.service.PandWebservice;
import com.athena.ck.module.anxorder.service.XinanxpdWebservice;
import com.athena.ck.module.kdys.service.IKdysService;
import com.athena.ck.module.pda.service.IPDAService;
import com.athena.ckx.util.CkxCommonFunc;
import com.athena.ckx.util.CkxRepCommonFunc;
import com.athena.ckx.util.PeislxWebservice;
import com.athena.truck.util.PDATruckWebservice;
import com.athena.xqjs.module.anxorder.service.AnxCshWebservice;
import com.athena.xqjs.module.anxorder.service.AnxJsInter;
import com.athena.xqjs.module.anxorder.service.XinaxCshWebservice;
import com.athena.xqjs.module.denglswtx.service.DenglswtxInter;
import com.athena.xqjs.module.ilorder.service.PJCalculate;
import com.athena.xqjs.module.kanbyhl.service.Kanbyhl;
import com.athena.xqjs.module.ziyhqrq.ZiyhqrqService;
import com.athena.xqjs.module.ziyhqrq.Ziykz;
import com.athena.xqjs.util.AXlsddWebservice;
import com.toft.core3.web.context.WebSdcContext;
import com.toft.core3.web.context.support.WebSdcContextUtils;

/**
 * <p>
 * Title:SDC UI组件
 * </p>
 * 
 * <p>
 * Description:
 * </p>
 * 
 * <p>
 * Copyright:Copyright (c) 2011.11
 * </p>
 * 
 * <p>
 * Company:iSoftstone
 * </p>
 * 
 * @author zhouyi
 * @version 1.0.0
 */
public class CXFServlet extends CXFNonSpringServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = -4010110681113306837L;
	private final static String TUXEDO_SERVICE_NAME = "PASPLT";// TUXEDO调用的服务名称
	
	private static Logger logger =   Logger.getLogger(CXFServlet.class);	//定义日志方法;

	@Override
	public void loadBus(ServletConfig servletConfig) throws ServletException {
		logger.info("webservice服务端调用开始...");
		super.loadBus(servletConfig);
		// this.
		// You could add the endpoint publish codes here
		// Bus bus = getBus();
		// BusFactory.setDefaultBus(bus);
		// Endpoint.publish("/Greeter", new GreeterImpl());
		//
		// // You can als use the simple frontend API to do this
		ServerFactoryBean factory = new ServerFactoryBean();
		factory.setBus(bus);
		WebSdcContext context = WebSdcContextUtils.getWebSdcContext(servletConfig.getServletContext());
		logger.info("pda调用athena服务端开始");
		IPDAService ps = context.getComponent(IPDAService.class);
		factory.setServiceClass(IPDAService.class);
		factory.setServiceBean(ps);
		factory.setAddress("/pdaService");
		factory.create();
		logger.info("pda调用athena服务端结束");
		/*
		 * ServerFactoryBean factory1 = new ServerFactoryBean();
		 * factory1.setBus(bus); factory1.setServiceClass(PDAService.class);
		 * factory1.setAddress("/userService1"); factory1.create();
		 */
		
		//参考系批量调用 hzg 2013-1-17
		ServerFactoryBean factoryCommonFunc = new ServerFactoryBean();
		logger.info("参考系CkxCommonFunc调用athena服务端开始");
		CkxCommonFunc ckxCommonFunc =  context.getComponent(CkxCommonFunc.class);
		factoryCommonFunc.setBus(bus);
		factoryCommonFunc.setServiceClass(CkxCommonFunc.class);
		factoryCommonFunc.setServiceBean(ckxCommonFunc);
		factoryCommonFunc.setAddress("/CkxCommonFunc");
		factoryCommonFunc.create();
		logger.info("参考系CkxCommonFunc调用athena服务端结束");
	
		
		
		//参考系批量调用 hj 2013-4-25
		ServerFactoryBean factoryRepCommonFunc = new ServerFactoryBean();
		logger.info("参考系CkxRepCommonFunc调用athena服务端开始");
		CkxRepCommonFunc ckxRepCommonFunc =  context.getComponent(CkxRepCommonFunc.class);
		factoryRepCommonFunc.setBus(bus);
		factoryRepCommonFunc.setServiceClass(CkxRepCommonFunc.class);
		factoryRepCommonFunc.setServiceBean(ckxRepCommonFunc);
		factoryRepCommonFunc.setAddress("/CkxRepCommonFunc");
		factoryRepCommonFunc.create();
		logger.info("参考系CkxRepCommonFunc调用athena服务端结束");

		ServerFactoryBean factoryZiykz = new ServerFactoryBean();
		logger.info("需求计算Ziykz调用athena服务端开始");
		ZiyhqrqService zihqrqService = (ZiyhqrqService) context.getComponent(Ziykz.class);
		factoryZiykz.setBus(bus);
		factoryZiykz.setServiceClass(Ziykz.class);
		factoryZiykz.setServiceBean(zihqrqService);
		factoryZiykz.setAddress("/ziykz");
		factoryZiykz.create();
		logger.info("需求计算Ziykz调用athena服务端结束");

		// 发布kdys
		ServerFactoryBean factoryKdys = new ServerFactoryBean();
		logger.info("需求计算IKdysService调用athena服务端开始");
		IKdysService ks = context.getComponent(IKdysService.class);
		factoryKdys.setBus(bus);
		factoryKdys.setServiceClass(IKdysService.class);
		factoryKdys.setServiceBean(ks);
		factoryKdys.setAddress("/kdysService");
		factoryKdys.create();
		logger.info("需求计算IKdysService调用athena服务端结束");

		// 发布看板计算  hzg KanbjsService 改为  Kanbyhl 2013-1-18
		ServerFactoryBean factoryKan = new ServerFactoryBean();
		logger.info("需求计算Kanbyhl调用athena服务端开始");
		Kanbyhl kanbjs = context.getComponent(Kanbyhl.class);
		factoryKan.setBus(bus);
		factoryKan.setServiceClass(Kanbyhl.class);
		factoryKan.setServiceBean(kanbjs);
		factoryKan.setAddress("/kanbjsService");
		factoryKan.create();
		logger.info("需求计算Kanbyhl调用athena服务端结束");

		// 按需订单计算
		ServerFactoryBean anxJsInterfac = new ServerFactoryBean();
		logger.info("需求计算AnxJsInter调用athena服务端开始");
		AnxJsInter anxJsInter = context.getComponent(AnxJsInter.class);
		anxJsInterfac.setBus(bus);
		anxJsInterfac.setServiceClass(AnxJsInter.class);
		anxJsInterfac.setServiceBean(anxJsInter);
		anxJsInterfac.setAddress("/anxOrderService");
		anxJsInterfac.create();
		logger.info("需求计算AnxJsInter调用athena服务端结束");
		
		ServerFactoryBean factory3 = new ServerFactoryBean();
		logger.info("需求计算PJCalculate调用athena服务端开始");
		PJCalculate ps3 = context.getComponent(PJCalculate.class);
		factory3.setBus(bus);
		factory3.setServiceClass(PJCalculate.class);
		factory3.setServiceBean(ps3);
		factory3.setAddress("/pjCalculate");
		factory3.create();
		logger.info("需求计算PJCalculate调用athena服务端结束");

		// 更新入库明细到排产计划
//		ServerFactoryBean pcpService = new ServerFactoryBean();
//		logger.info("排产计划IPCDailyProduceService调用athena服务端开始");
//		IPCDailyProduceService IPCDailyProduceService = context.getComponent(IPCDailyProduceService.class);
//		pcpService.setBus(bus);
//		pcpService.setServiceClass(IPCDailyProduceService.class);
//		pcpService.setServiceBean(IPCDailyProduceService);
//		pcpService.setAddress("/pcpService");
//		pcpService.create();
//		logger.info("排产计划IPCDailyProduceService调用athena服务端结束");
		
		// 日滚动模拟排产
//		ServerFactoryBean pcdService = new ServerFactoryBean();
//		logger.info("滚动排产IPCDailyRollService调用athena服务端开始");
//		IPCDailyRollService IPCDailyRollService = context.getComponent(IPCDailyRollService.class);
//		pcdService.setBus(bus);
//		pcdService.setServiceClass(IPCDailyRollService.class);
//		pcdService.setServiceBean(IPCDailyRollService);
//		pcdService.setAddress("/pcdService");
//		pcdService.create();
//		logger.info("滚动排产IPCDailyRollService调用athena服务端结束");
		
		// 滚动周期模拟排产
//		ServerFactoryBean pcmService = new ServerFactoryBean();
//		logger.info("周期排产IPCScheduleService调用athena服务端开始");
//		IPCScheduleService IPCScheduleService = context.getComponent(IPCScheduleService.class);
//		pcmService.setBus(bus);
//		pcmService.setServiceClass(IPCScheduleService.class);
//		pcmService.setServiceBean(IPCScheduleService);
//		pcmService.setAddress("/pcmService");
//		pcmService.create();
//		logger.info("周期排产IPCScheduleService调用athena服务端结束");
		
		// 累计交付差额计算
//		ServerFactoryBean pclService = new ServerFactoryBean();
//		logger.info("排产计算IPCLeijjfService调用athena服务端开始");
//		IPCLeijjfService IPCLeijjfService = context.getComponent(IPCLeijjfService.class);
//		pclService.setBus(bus);
//		pclService.setServiceClass(IPCLeijjfService.class);
//		pclService.setServiceBean(IPCLeijjfService);
//		pclService.setAddress("/pclService");
//		pclService.create();
//		logger.info("排产计算IPCLeijjfService调用athena服务端结束");
		
		// 内部要货令表仓库子仓库批量
//		ServerFactoryBean fjService = new ServerFactoryBean();
//		logger.info("发交计算IFJScheduleService调用athena服务端开始");
//		IFJScheduleService IFJScheduleService = context.getComponent(IFJScheduleService.class);
//		fjService.setBus(bus);
//		fjService.setServiceClass(IFJScheduleService.class);
//		fjService.setServiceBean(IFJScheduleService);
//		fjService.setAddress("/fjService");
//		fjService.create();
//		logger.info("发交计算IFJScheduleService调用athena服务端结束");
		
		// 计算要车计划
//		ServerFactoryBean yaocjhService = new ServerFactoryBean();
//		logger.info("要车计划IYaoHLJhService调用athena服务端开始");
//		IYaoHLJhService IYaoHLJhService = context.getComponent(IYaoHLJhService.class);
//		yaocjhService.setBus(bus);
//		yaocjhService.setServiceClass(IYaoHLJhService.class);
//		yaocjhService.setServiceBean(IYaoHLJhService);
//		yaocjhService.setAddress("/yaocjhService");
//		yaocjhService.create();
//		logger.info("要车计划IYaoHLJhService调用athena服务端结束");
//		
		
		//接口新增数据后的登录用户事务提醒 hzg 2013-3-11
		ServerFactoryBean denglswtxInter = new ServerFactoryBean();
		logger.info("登录用户事务提醒DenglswtxService调用athena服务端开始");
		DenglswtxInter denglswtx = context.getComponent(DenglswtxInter.class);
		denglswtxInter.setBus(bus);
		denglswtxInter.setServiceClass(DenglswtxInter.class);
		denglswtxInter.setServiceBean(denglswtx);
		denglswtxInter.setAddress("/denglswtxService");
		denglswtxInter.create();
		logger.info("登录用户事务提醒DenglswtxService调用athena服务端结束");
		
		

		//接口新增数据后的登录用户事务提醒 wuyichao 2013-11-26
		ServerFactoryBean pandInter = new ServerFactoryBean();
		logger.info("盘点PandWebservice调用athena服务端开始");
		PandWebservice pandwtx = context.getComponent(PandWebservice.class);
		pandInter.setBus(bus);
		pandInter.setServiceClass(PandWebservice.class);
		pandInter.setServiceBean(pandwtx);
		pandInter.setAddress("/pandWebservice");
		pandInter.create();
		logger.info("盘点PandWebservice调用athena服务端结束");
		
		//接口计算上次盈余
		ServerFactoryBean xinanxpdInter = new ServerFactoryBean();
		logger.info("盘点XinanxpdWebservice调用athena服务端开始");
		XinanxpdWebservice xinanxpdwtx = context.getComponent(XinanxpdWebservice.class);
		xinanxpdInter.setBus(bus);
		xinanxpdInter.setServiceClass(XinanxpdWebservice.class);
		xinanxpdInter.setServiceBean(xinanxpdwtx);
		xinanxpdInter.setAddress("/xinanxpdWebservice");
		xinanxpdInter.create();
		logger.info("盘点XinanxpdWebservice调用athena服务端结束");
		
		
		//新增查询2个执行层的 配送类型
		ServerFactoryBean peislxInter = new ServerFactoryBean();
		logger.info("配送类型调用athena服务端开始");
		PeislxWebservice peislxwtx = context.getComponent(PeislxWebservice.class);
		peislxInter.setBus(bus);
		peislxInter.setServiceClass(PeislxWebservice.class);
		peislxInter.setServiceBean(peislxwtx);
		peislxInter.setAddress("/peislxWebservice");
		peislxInter.create();
		logger.info("配送类型调用athena服务端结束");
		
		
		//新增查询2个执行层的 数据回调  mantis:0011510  by hzg  2015.7.16 
		ServerFactoryBean anxcshServer = new ServerFactoryBean();
		logger.info("按需初始化调用athena服务端开始");
		AnxCshWebservice anxcsh = context.getComponent(AnxCshWebservice.class);
		anxcshServer.setBus(bus);
		anxcshServer.setServiceClass(AnxCshWebservice.class);
		anxcshServer.setServiceBean(anxcsh);
		anxcshServer.setAddress("/anxCshWebservice");
		anxcshServer.create();
		logger.info("按需初始化调用athena服务端结束");
		
		//新增查询3个执行层的 表  add by zbb  2015.12.10
		ServerFactoryBean xinaxcshServer = new ServerFactoryBean();
		logger.info("新按需初始化调用athena服务端开始");
		XinaxCshWebservice xinaxcsh = context.getComponent(XinaxCshWebservice.class);
		xinaxcshServer.setBus(bus);
		xinaxcshServer.setServiceClass(XinaxCshWebservice.class);
		xinaxcshServer.setServiceBean(xinaxcsh);
		xinaxcshServer.setAddress("/xinaxCshWebservice");
		xinaxcshServer.create();
		logger.info("新按需初始化调用athena服务端结束");
		
		//PDA车位放空  add by csy  2016.10.20
		ServerFactoryBean pdaTruckServer = new ServerFactoryBean();
		logger.info("PDA车位放空调用athena服务端开始");
		PDATruckWebservice pdaTruck = context.getComponent(PDATruckWebservice.class);
		pdaTruckServer.setBus(bus);
		pdaTruckServer.setServiceClass(PDATruckWebservice.class);
		pdaTruckServer.setServiceBean(pdaTruck);
		pdaTruckServer.setAddress("/pDATruckWebservice");
		pdaTruckServer.create();
		logger.info("PDA车位放空调用athena服务端结束");
		
		//按需临时订单验证  add by csy  2016.11.10
		ServerFactoryBean axLSDDServer = new ServerFactoryBean();
		logger.info("按需临时订单调验证用athena服务端开始");
		AXlsddWebservice axLSDD = context.getComponent(AXlsddWebservice.class);
		axLSDDServer.setBus(bus);
		axLSDDServer.setServiceClass(AXlsddWebservice.class);
		axLSDDServer.setServiceBean(axLSDD);
		axLSDDServer.setAddress("/axLSDDWebservice");
		axLSDDServer.create();
		logger.info("按需临时订单验证调用athena服务端结束");
		
	}
}
