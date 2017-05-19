/**
 * 
 */
package com.athena.component;

import java.util.HashMap;

import com.athena.ck.entity.common.Trscode;
import com.toft.core3.context.SdcContextEvent;
import com.toft.core3.context.SdcContextListener;

/**
 * <p>Title:</p>
 *
 * <p>Description:</p>
 *
 * <p>Copyright:Copyright (c) 2011.9</p>
 *
 * <p>Company:iSoftstone</p>
 *
 * @author Administrator
 * @version 1.0
 */
public class StartListener implements SdcContextListener{

	public void contextDestroyed(SdcContextEvent contextEvent) {
		
	}

	public void contextInitialized(SdcContextEvent contextEvent) {
		/*UserNumberCtrl.setMaxNumber(100000);
		System.out.println("****************************ATHENA 系统启动*********************");
		Trscode trs1 = new Trscode();
		trs1.setService("RCVBlhSel");
		
		trs1.setTimeout("10");
		trs1.setTrancode("10101");
		trs1.setTrsname("到货申报前UT号查询");
		trs1.setOper_no("101");
		TrscodeUtil.put("10101", trs1);
		
		Trscode trs2 = new Trscode();
		trs2.setService("RCVBlhShb");
		trs2.setTimeout("10");
		trs2.setTrancode("10102");
		trs2.setTrsname("到货申报打印到货单");
		trs2.setOper_no("101");
		TrscodeUtil.put("10102", trs2);*/
	}
	
	public static HashMap<String,Trscode> TrscodeUtil = new HashMap<String,Trscode>();
	public static Trscode getTrscode(String key)
	{
		if (TrscodeUtil.get(key)== null ||
				((Trscode)TrscodeUtil.get(key)).getTrancode()==null){
			Trscode trs = new Trscode();
			trs.setService("PASPLT");
			trs.setTimeout("10");
			trs.setTrancode(key);
			trs.setTrsname("默认代理服务");
			//trs.setOper_no("901");
			return trs;
		}
		return(Trscode)TrscodeUtil.get(key);
	}

}
