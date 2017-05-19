package com.athena.component;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import com.athena.component.utils.LoaderProperties;
import com.athena.truck.component.QueueTimeController;
import com.toft.core3.web.context.support.WebSdcContextUtils;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import org.apache.log4j.Logger;
/**
 * 车辆入厂定时排队及分配车位程序
 * @author xiah
 */

public class KacTimerListener implements ServletContextListener{

  ServletContext servletContext;
//配置文件路径
 ScheduledExecutorService schedule = Executors.newSingleThreadScheduledExecutor();
  private final String fileName="urlPath.properties"; 
  private static Logger logger=Logger.getLogger(KacTimerListener.class);
  public void contextInitialized(ServletContextEvent event){
	  
    this.servletContext = event.getServletContext();
     //定时器延迟执行时间
    int yancsj =Integer.parseInt(LoaderProperties.getPropertiesMap(fileName).get("yancsj")) ;
    //定时器循环执行时间
    int xunhsj =Integer.parseInt(LoaderProperties.getPropertiesMap(fileName).get("xunhsj")) ;
    String menuHtml_builder=LoaderProperties.getPropertiesMap(fileName).get("menuHtml_builder");
	if(menuHtml_builder.equals("ckMenuHtmlBuilder")){
		    schedule.scheduleWithFixedDelay(new Runnable() {
		         public void run() {
		             try {
		              logger.info("车辆排队管理定时运行："+System.currentTimeMillis());
		              QueueTimeController controller = WebSdcContextUtils.getWebSdcContext(servletContext).getComponent(QueueTimeController.class);
		              controller.run();
		            } catch (Exception e){
		               logger.error("排队队列管理出现异常");
		               logger.error(e);
		            }
		        }
		   },yancsj ,xunhsj, TimeUnit.MINUTES);
	   }
  }

  public void contextDestroyed(ServletContextEvent event){
	  
    schedule.shutdown();
    WebSdcContextUtils.destroyWebSdcContext(this.servletContext);
    logger.info(" 车辆排队定时器销毁！");
  }
}

