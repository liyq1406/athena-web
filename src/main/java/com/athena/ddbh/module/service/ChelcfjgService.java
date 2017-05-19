package com.athena.ddbh.module.service;


import java.util.HashMap;
import java.util.Map;

import com.athena.component.service.BaseService;
import com.athena.db.ConstantDbCode;
import com.athena.ddbh.entity.Chelcfjg;
import com.athena.util.exception.ServiceException;
import com.toft.core3.container.annotation.Component;
import com.toft.core3.transaction.annotation.Transactional;

/**
 * 车辆拆分结果Service对象
 * @author chenlei
 * @vesion 1.0
 * @date 2012-3-29
 */
@Component
public class ChelcfjgService extends BaseService<Chelcfjg> {
	
	/**
	 * 查询
	 * @param c
	 * @return
	 */
	public Map<String,Object> getChelcfjgs(Chelcfjg c) throws ServiceException {
		Map<String,Object> result = new HashMap<String,Object>();		 
		 try{ 
			 //校验页面传来的信息是否合法
			 if(validateChecljg(c)){
				 //合法,则查询出结果
				 result = baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_EXTENDS2).selectPages("chelcfjg.getDDBH_CHELCFJG", c, c);
				// baseDao = baseDao.getSdcDataSource("1");
				 //MultiDataSource.useDataSource(ConstantDbCode.DATASOURCE_CKX);
			 }else{
				 //不合法,则返回错误信息
				 result.put("CHECFJG_ERROR", "OF号,消耗点,零件三个查询条件必须输入一个.");
			 }
			 
			//切换到执行层
			this.changeSourceId(ConstantDbCode.DATASOURCE_CKX);	 
		 }catch(Exception e){
			//切换到执行层
			this.changeSourceId(ConstantDbCode.DATASOURCE_CKX);	 
				
			 throw new ServiceException(e.getMessage());
		 }
		 //返回结果集
		 return result;		
	}
	
	/**
	 * 校验页面传来的Chelcfjg对象的属性有效性  
	 * 	即：’OF号’,’零件’,’消耗点’三个字段 必须输入一个字段才给查询
	 * @return
	 */
	@Transactional
	public boolean validateChecljg(Chelcfjg c){
		//校验结果 默认为true
		boolean result = true;	
		//字段为空的标记
		int i = 0;
		//判断c是否为空
		if(c==null){
			//为空，则提示为false
			result = false;
		}else{
			//不为空，则判断 OFH号，消耗点，零件必须填写一项
			if(c.getOfh()==null){
				//为空则标记增加1
				i++;
			}else{
				if(c.getOfh().trim().equals("")){
					//为空字符串 则标记增加1
					i++;
				}				
			}
			
			if(c.getXhd()==null){
				//为空则标记增加1
				i++;
			}else{
				if(c.getXhd().trim().equals("")){
					//为空字符串 则标记增加1
					i++;	
				}				
			}
			
			if(c.getLj()==null){
				//为空则标记增加1
				i++;
			}else{
				if(c.getLj().trim().equals("")){
					//为空字符串 则标记增加1
					i++;
				}				
			}
			//标记大于等于3 则返回校验失败
			if(i>=3){
				result = false;
			}
		}
		//返回校验结果
		return result;
	}
	
	/**
	 * 重新拆分分总成
	 * @return 是否成功
	 */
	public int reSpiltFenzc(String userName)throws ServiceException{ 
		 // 成功替换分总成的数量
		 int i = 0;
		 try{ 
			
			//切换到DDBH
			this.changeSourceId(ConstantDbCode.DATASOURCE_EXTENDS2);
			
			i = reSpiltFenzc_new(userName);
			 
			//切换到执行层
			this.changeSourceId(ConstantDbCode.DATASOURCE_CKX);

			
		 }catch(Exception e){
			//切换到执行层
			this.changeSourceId(ConstantDbCode.DATASOURCE_CKX);
			 throw new ServiceException(e.getMessage());
		 }
		 return i;
	}
	 

	@Transactional
	public int reSpiltFenzc_new(String userName)throws ServiceException{ 
			 // 成功替换分总成的数量
			 int count = 0;
			 // 切换ddbh数据源
			 //MultiDataSource.useDataSource(ConstantDbCode.DATASOURCE_EXTENDS2);
			 // 清空分装线计划中间表
			 baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_EXTENDS2).execute("chelcfjg.truncateTemp");
			 // 将10天内的分装线计划从结果表插入到中间表
			 baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_EXTENDS2).execute("chelcfjg.insertTemp", userName);
			 // 将中间表的分总成号按照PDS拆分信息重新匹配
			 baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_EXTENDS2).execute("chelcfjg.updateTempFenzch");
			 // 将中间表的分总成号发生改变的计划的flag置于1
			 baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_EXTENDS2).execute("chelcfjg.updateFlag", userName);
			 // 更新分装线排产计划的分总成号
			 count = baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_EXTENDS2).execute("chelcfjg.updateRealFenzch");
			 // 切换ckx数据源
			 //MultiDataSource.useDataSource(ConstantDbCode.DATASOURCE_CKX);
			 return count; 
	}
	
	
}
