package com.athena.ddbh.module.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.athena.component.service.BaseService;
import com.athena.db.ConstantDbCode;
import com.athena.ddbh.entity.Anxmaoxq;
import com.athena.util.exception.ServiceException;
import com.athena.xqjs.module.common.CommonFun;
import com.toft.core3.container.annotation.Component;
/**
 * <p>
 * 项目名称：athena-xqjs
 * </p>
 * 类名称：MaoxqService
 * <p>
 * 类描述： 毛需求
 * </p>
 * 创建人：Niesy
 * <p>
 * 创建时间：2012-02-08
 * </p>
 * 
 * @version
 * 
 */
@SuppressWarnings("rawtypes")
@Component
public class MaoXqCompareService extends BaseService {

	/**	
	 * 按需毛需求查询
	 * 0007182: 增加按需毛需求查询界面  按需 毛需求查询
	 */
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectAnxMxq(Map<String, String> params, Anxmaoxq bean)throws ServiceException {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			if(validateChecljg(bean)){
				//判断起始时间和结束时间跨度不能超过7天
				if(bean.getXhsjFrom()!=null&&bean.getXhsjTo()!=null){
					SimpleDateFormat shxjto = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					SimpleDateFormat xhsjfrom = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					Date dStart = shxjto.parse(CommonFun.getStrByAsc(bean.getXhsjTo()));
					Date dEnd = xhsjfrom.parse(CommonFun.getStrByAsc(bean.getXhsjFrom()));
					long days = (dEnd.getTime() - dStart.getTime()) / (24 * 60 * 60 * 1000);
					if(days>7){
						throw new ServiceException("消耗点起始时间和结束时间区间不能超过7天");
					}
				}
				
				//切换到 DDBH数据源
				if("exportXls".equals(params.get("exportXls"))){
					//0007182  转换字符串，把%20 替换成 空格 ,把%3A替换成:
					bean.setXhsjTo(CommonFun.getStrByAsc(bean.getXhsjTo()));
					bean.setXhsjFrom(CommonFun.getStrByAsc(bean.getXhsjFrom()));
					//0007182 根据条件筛选获取数据量，如果数据量小于5000，则导出全部，否则导出0条
					List<Object> list = baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_EXTENDS2).select("maoXqCompare.selAnxMxqsExport", bean);
					map.put("total", list.size());
					map.put("rows", list);
				}else{
					map = baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_EXTENDS2).selectPages("maoXqCompare.selAnxMxqs", bean, bean);
				}
			}else{
				//不合法,则返回错误信息
				map.put("anxmxq_ERROR", "OF号,消耗点,零件,流水号,消耗时间范围 五个查询条件必须输入一个.");
			}
			
			//切换到执行层
			this.changeSourceId(ConstantDbCode.DATASOURCE_CKX);
		} catch (Exception e) {
			//切换到执行层
			this.changeSourceId(ConstantDbCode.DATASOURCE_CKX);
			
			//抛出ServiceException异常
			 throw new ServiceException(e.getMessage());
		}
		return map;
	}
	
	
	/**
	 * 校验页面传来的Anxmaoxq对象的属性有效性  
	 * 	即：’OF号’,’零件’,’消耗点’,'流水号','消耗时间范围'5个字段 必须输入一个字段才给查询
	 * @return
	 */
	public boolean validateChecljg(Anxmaoxq c){
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
			
			if(c.getXiaohd()==null){
				//为空则标记增加1
				i++;
			}else{
				if(c.getXiaohd().trim().equals("")){
					//为空字符串 则标记增加1
					i++;	
				}				
			}
			
			if(c.getLingj()==null){
				//为空则标记增加1
				i++;
			}else{
				if(c.getLingj().trim().equals("")){
					//为空字符串 则标记增加1
					i++;
				}				
			}
			
			if(c.getZongzlsh()==null){
				//为空则标记增加1
				i++;
			}else{
				if(c.getZongzlsh().trim().equals("")){
					//为空字符串 则标记增加1
					i++;
				}				
			}
			
			if(c.getXhsjTo()==null){
				//为空则标记增加1
				i++;
			}else{
				if(c.getXhsjTo().trim().equals("")){
					//为空字符串 则标记增加1
					i++;
				}				
			}
			
			if(c.getXhsjFrom()==null){
				//为空则标记增加1
				i++;
			}else{
				if(c.getXhsjFrom().trim().equals("")){
					//为空字符串 则标记增加1
					i++;
				}				
			}
			
			
			//标记大于等于6 则返回校验失败
			if(i>=6){
				result = false;
			}
		}
		//返回校验结果
		return result;
	}
	
}
