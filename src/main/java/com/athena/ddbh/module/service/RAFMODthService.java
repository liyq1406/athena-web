package com.athena.ddbh.module.service;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.athena.authority.entity.LoginUser;
import com.athena.component.service.BaseService;
import com.athena.db.ConstantDbCode;
import com.athena.ddbh.entity.RAFMODth;
import com.athena.util.exception.ServiceException;
import com.toft.core3.container.annotation.Component;
/**
 * RAFMOD替换service对象
 * @author chenlei
 * @vesion 1.0
 * @date 2012-3-29
 */
@Component
public class RAFMODthService extends BaseService<RAFMODth> {
	//OF
	private static String RULE_OF ="OF"; 
	//消耗点
	private static String RULE_XHD = "XHD";
	//零件
	private static String RULE_LJ="LJ";
	//系数
	private static String RULE_XS = "XS";	
	//错误信息
	private static String MESSAGE;
	
	/**
	 * 保存一个RAFMODth
	 * @param addList
	 * @param loginUser
	 * @throws ServiceException
	 */
	private void save(List<RAFMODth> addList,LoginUser loginUser) throws ServiceException{	
		MESSAGE = null;
		if (validate(addList)) {
			for (RAFMODth r : addList) {

				// 设置 创建人 操作人
				r.setChuangjr(loginUser.getUsername());
				r.setCaozr(loginUser.getUsername());
				// 设置操作时间 创建时间
				r.setChuangjsj(getAllCurrTime());
				r.setCaozsj(getAllCurrTime());
				// 设置主键
				r.setId(getUUID());
				
				// 设置用户中心
				r.setUsercenter(loginUser.getUsercenter());
				
				//设置flag 默认设置为0
				r.setFlag("0");
				
				Verify(r);
//				// 判断用户是否是输入了 新零件 新消耗点 即：新增或者修改标志
//				if (r.getXinlj() != null && r.getXinxhd() != null) {
//					// 根据 消耗点 零件编号到参考系 消耗点--零件表，零件表中，找出
//					// 生产线，单位，制造路线，如果没有找到值，则不执行新增操作
//					List<RAFMODth> list = baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("rafmodth.getScx",r);
//					if (list != null && list.size() > 0) {
//						r.setChanx(list.get(0).getChanx());
//						r.setDanw(list.get(0).getDanw());
//						r.setZhizlx(list.get(0).getZhizlx());
//					} else {
//						MESSAGE="新消耗点找不到对应的生产线,单位，制造路线的值.";
//						throw new ServiceException("新消耗点找不到对应的生产线,单位，制造路线的值.");
//					}
//				}
//				
//				// 如果 处理标志 为 替换 则要做 处理标志 Of号 原消耗点 原零件 不能有重复
//				if(r.getCaozbs()==2){
//					RAFMODth raDth = (RAFMODth) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("rafmodth.getCount", r);
//					if(!"0".equals(raDth.equals(raDth.getCount_th()))){
//						//数据库有了 做替换 的 of号 原消耗点  原零件 则报错.
//						MESSAGE = "已经有此of号,此消耗点，零件替换记录了.";
//						throw new ServiceException("已经有此of号,此消耗点，零件替换记录了.");
//					}
//				}
				
				if(r.getYuanxs()==null || r.getYuanxs().equals("")){
					r.setYuanxs("0");
				}
				if(r.getXinxs()==null || r.getXinxs().equals("")){
					r.setXinxs("0");
				}
				try {
					baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_EXTENDS2).execute("rafmodth.insertDDBH_RAFMODTH", r);
				} catch (Exception e) {
					//回到执行层的库
					//MultiDataSource.useDataSource(ConstantDbCode.DATASOURCE_CKX);
					// 抛出数据库操作失败的ServiceException异常
					MESSAGE = "[" + r.getOfh()+ "]数据重复，保存失败";
					throw new ServiceException("[" + r.getOfh()
							+ "]数据重复，保存失败");
				}
				
			}
		} else {
			// 抛出校验失败的ServiceException异常
			throw new ServiceException(MESSAGE);
		}
	} 
	
	///////////////////////////////////////////////////////////////////////
	
	/**
	 *对RAFMODth做业务校验
	 *	校验规则：
	 *	1：如果要判断的RAFMODth对象  新零件 新消耗点不为空，则根据消耗点，新零件到参考系  消耗点--零件表，零件表中，找出生产线，单位，制造路线
	 * 	2：如果是做替换操作，处理标志 Of号 原消耗点 原零件 不能有重复
	 * @param r
	 */
	@SuppressWarnings("unchecked")
	private void Verify(RAFMODth r){
		// 判断用户是否是输入了 新零件 新消耗点 即：新增或者修改标志
		if (r.getXinlj() != null && r.getXinxhd() != null) {
			// 根据 消耗点 零件编号到参考系 消耗点--零件表，零件表中，找出
			// 生产线，单位，制造路线，如果没有找到值，则不执行新增操作
			//MultiDataSource.useDataSource(ConstantDbCode.DATASOURCE_CKX);
			List<RAFMODth> list = baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("rafmodth.getScx",r);
			if (list != null && list.size() > 0) {
				r.setChanx(list.get(0).getChanx());
				r.setDanw(list.get(0).getDanw());
				r.setZhizlx(list.get(0).getZhizlx());
			} else {
				MESSAGE="新消耗点找不到对应的生产线,单位，制造路线的值.";
				throw new ServiceException("新消耗点找不到对应的生产线,单位，制造路线的值.");
			}
			//MultiDataSource.useDataSource(ConstantDbCode.DATASOURCE_EXTENDS2);
		}
		
		// 如果 处理标志 为 替换 则要做 处理标志 Of号 原消耗点 原零件 不能有重复
		if(r.getCaozbs()==2){
			//连接ddbh的库
			//MultiDataSource.useDataSource(ConstantDbCode.DATASOURCE_EXTENDS2);
			//baseDao = baseDao.getSdcDataSource("2");
			RAFMODth raDth = (RAFMODth) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_EXTENDS2).selectObject("rafmodth.getCount", r);
			//回到执行层的库
			//MultiDataSource.useDataSource(ConstantDbCode.DATASOURCE_CKX);
			//baseDao = baseDao.getSdcDataSource("1");
			if(!"0".equals(raDth.getCount_th())){
				//数据库有了 做替换 的 of号 原消耗点  原零件 则报错.
				MESSAGE = "已经有此of号,此消耗点，零件替换记录了.";
				throw new ServiceException("已经有此of号,此消耗点，零件替换记录了.");
			}
		}
	}
	
	///////////////////////////////////////////////////////////////////////
	 
	 /**
	  * 修改
	  * @return
	  */
	 private void update(List<RAFMODth> editList,LoginUser loginUser)throws ServiceException{	
		if(validate(editList)){
			for(RAFMODth r : editList){
						
				//设置操作人 
				r.setCaozr(loginUser.getUsername());	
				// 设置操作时间 
				r.setCaozsj(getAllCurrTime());		
				// 设置用户中心
				r.setUsercenter(loginUser.getUsercenter());
				Verify(r);
						
				if("0".equals(r.getFlag())){
					try{
						//连接DDBH的库
						baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_EXTENDS2).execute("rafmodth.updateDDBH_RAFMODTH", r);
						//MultiDataSource.useDataSource(ConstantDbCode.DATASOURCE_CKX);
					}catch(Exception e){
						//抛出数据库操作失败的ServiceException异常
						MESSAGE="【"+r.getOfh()+"】数据出错，保存失败";
						//MultiDataSource.useDataSource(ConstantDbCode.DATASOURCE_CKX);
						throw new ServiceException("【"+r.getOfh()+"】数据出错，保存失败");
					}
				}else{
					MESSAGE = "【"+r.getOfh()+"】数据已经被计算，不能被修改";
					throw new ServiceException("【"+r.getOfh()+"】数据已经被计算，不能被修改");
				}
			}			
		}else{
			//回到执行层的库
			//MultiDataSource.useDataSource(ConstantDbCode.DATASOURCE_CKX);
			//抛出校验失败的ServiceException异常
			throw new ServiceException(MESSAGE);
		}		
	}
		 
	///////////////////////////////////////////////////////////////////////
	 
	 /**
	  * 批量删除
	  * @return
	  */
	private void delete(List<RAFMODth> beans)throws ServiceException{	
		if(beans!=null){
			for(RAFMODth  bean : beans){
				try{
					baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_EXTENDS2).execute("rafmodth.deleteDDBH_RAFMODTH", bean);
					//回到执行层的库
					//MultiDataSource.useDataSource(ConstantDbCode.DATASOURCE_CKX);
					//baseDao = baseDao.getSdcDataSource("1");
				}catch(Exception e){
					//回到执行层的库
					//MultiDataSource.useDataSource(ConstantDbCode.DATASOURCE_CKX);
					//baseDao = baseDao.getSdcDataSource("1");
					MESSAGE="【"+bean.getOfh()+"】数据出错，保存失败";
					//抛出删除失败的异常
					throw new ServiceException("【"+bean.getOfh()+"】数据出错，保存失败");
				}	
			}
		}
	}
	 
	///////////////////////////////////////////////////////////////////////
	 
	 /**
	  * 查询（外层）
	  * CSY 修改：执行修改前后添加切换数据源
	  * 2017-03-03
	  * @return
	  */
	public Map<String,Object> getRAFMODs(RAFMODth r)throws ServiceException{
		Map<String,Object> result = new HashMap<String,Object>();
		 
		try {
			this.changeSourceId(ConstantDbCode.DATASOURCE_EXTENDS2);
			result = this.getGetRAFMODs(r);
		} catch (Exception e) {
			throw new ServiceException(e.getMessage());
		} finally{
			this.changeSourceId(ConstantDbCode.DATASOURCE_CKX);
		}
		 
		return result;		 
	}
	 
	 /**
	  * 查询（内层）
	  * CSY 修改：执行修改前后添加切换数据源
	  * 2017-03-03
	  * @return
	  */
	 private Map<String,Object> getGetRAFMODs(RAFMODth r)throws ServiceException{
		 Map<String,Object> result = new HashMap<String,Object>();
		 
		 try{
			 /**
			  * 执行查询操作
			  */
			//连接DDBH的库
			//MultiDataSource.useDataSource(ConstantDbCode.DATASOURCE_EXTENDS2);
			//baseDao = baseDao.getSdcDataSource("2");
			result = baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_EXTENDS2).selectPages("rafmodth.getDDBH_RAFMODTH", r, r);
			//回到执行层的库
			//MultiDataSource.useDataSource(ConstantDbCode.DATASOURCE_CKX);
			//baseDao = baseDao.getSdcDataSource("1");
		 }catch(Exception e){
			//回到执行层的库
			//MultiDataSource.useDataSource(ConstantDbCode.DATASOURCE_CKX);
			//baseDao = baseDao.getSdcDataSource("1");
			//抛出查询失败的异常
			throw new ServiceException(e.getMessage());
		 }
		 
		 return result;		 
	 }
	 
	///////////////////////////////////////////////////////////////////////
	
	/**
	 * 页面保存 完成 新增 删除 修改的功能（外层）
	 * CSY 修改：执行修改前后添加切换数据源
	 * 2017-03-03
	 * @param addList
	 * @param editList
	 * @param delList
	 * @param loginUser
	 * @return
	 */
	public String savePg(List<RAFMODth> addList,
			List<RAFMODth> editList, List<RAFMODth> delList,
			LoginUser user) {
		
		String result = "保存成功";
		
		try {
			this.changeSourceId(ConstantDbCode.DATASOURCE_EXTENDS2);
			result = this.getSavePg(addList, editList, delList, user);
		} catch (Exception e) {
			throw new ServiceException(e.getMessage());
		} finally{
			this.changeSourceId(ConstantDbCode.DATASOURCE_CKX);
		}
		
		return result;
	}
	
	/**
	 * 页面保存 完成 新增 删除 修改的功能（内层）
	 * CSY 修改：执行修改前后添加切换数据源
	 * 2017-03-03
	 * @param addList
	 * @param editList
	 * @param delList
	 * @param loginUser
	 * @return
	 */
	private String getSavePg(List<RAFMODth> addList,
			List<RAFMODth> editList, List<RAFMODth> delList,
			LoginUser user) {
		
		String result = "保存成功";
		
		try{
			/**
			 * 新增操作
			 */
			save(addList,user);
			
			/**
			 * 修改操作
			 */
			update(editList,user);
			
			/**
			 * 删除操作
			 */
			delete(delList);//删除
		}catch(ServiceException e){
			result = MESSAGE;
			
			/**
			 * 返回校验失败的信息
			 */
			return result;
		}catch(Exception e){
			/**
			 * 不为校验异常 则抛出ServiceException
			 */
			throw new ServiceException(e.getMessage());
		}
		return result;
	}
	
	///////////////////////////////////////////////////////////////////////		
	
	/**
	 * 校验页面传来的字段是否正确
	 * @param list
	 */
	public static boolean validate(List<RAFMODth> list){
		boolean result = true;
		
		//list不为空则循环遍历校验
		if(list!=null){
			for(RAFMODth r : list){
				//list集合中有一个校验失败，则终止校验 返回失败信息
				if(!validateRADMODth(r)){
					result = false;
					break;
				}				
			}
		}else{
			//为空 则直接返回false
			result = false;
		}
		
		//返回校验结果
		return result;
	}
	
	/**
	 * 校验RAFMODth对象
	 * @param r
	 * @return
	 */
	public static boolean validateRADMODth(RAFMODth rafmod) {
		boolean result = true;
		
		//正则表达式
		Pattern pattern = null;
		//匹配器
		Matcher matcher = null;
		
		if(rafmod.getCaozbs() == 1){
			//为新增  原消耗点 原零件 原消耗点不能有值
			if(!validateString(pattern,matcher,rafmod.getOfh(),RULE_OF,false)){
				//不为字符或者数字且位数不等于8位，此字段为空，则返回校验失败
				result =false;
				MESSAGE = "新增 :【"+rafmod.getOfh()+"】的"+"OF号必须为字符或者数字";
			}else if(!validateString(pattern,matcher,rafmod.getYuanxhd(),RULE_XHD,true)){
				//不为字符或者数字且位数不等于9位，此字段不为空，则返回校验失败
				result =false;
				MESSAGE = "新增 :【"+rafmod.getOfh()+"】的"+"原消耗点必须为字符或者数字,且不能填写";
			}else if(!validateString(pattern, matcher, rafmod.getYuanlj(), RULE_LJ, true)){
				//不为字符或者数字且位数不等于10位，此字段不为空，则返回校验失败
				result =false;
				MESSAGE = "新增 :【"+rafmod.getOfh()+"】的"+"零件必须为字符或者数字,且不能填写";
			}else if(!validateString(pattern, matcher, rafmod.getYuanxs(), RULE_XS,true)){
				//不为数字，此字段不为空，则返回校验失败
				result =false;
				MESSAGE = "新增 :【"+rafmod.getOfh()+"】的"+"消耗系数必须为数字,整数部分不大于1000,小数部分位数不超过3位,且不能填写";
			}else if(!validateString(pattern,matcher,rafmod.getXinxhd(),RULE_XHD,false)){
				//不为字符或者数字且位数不等于9位，此字段为空，则返回校验失败
				result =false;
				MESSAGE = "新增 :【"+rafmod.getOfh()+"】的"+"消耗点必须为字符或者数字";
			}else if(!validateString(pattern, matcher, rafmod.getXinlj(), RULE_LJ, false)){
				//不为字符或者数字且位数不等于10位，此字段为空，则返回校验失败
				result =false;
				MESSAGE = "新增 :【"+rafmod.getOfh()+"】的"+"零件必须为字符或者数字";
			}else if(!validateString(pattern, matcher, rafmod.getXinxs(), RULE_XS,false)){
				//不为数字，此字段不为空，则返回校验失败
				result =false;
				MESSAGE = "新增 :【"+rafmod.getOfh()+"】的"+"消耗系数必须为数字,整数部分不大于1000,小数部分位数不超过3位.";
			}
			
		}else if(rafmod.getCaozbs() == 2){
			//为替换 都不能为空
			if(!validateString(pattern,matcher,rafmod.getOfh(),RULE_OF,false)){
				//不为字符或者数字且位数不等于8位，此字段为空，则返回校验失败
				result =false;
				MESSAGE = "替换:【"+rafmod.getOfh()+"】的"+"OF号必须为字符或者数字";
			}else if(!validateString(pattern,matcher,rafmod.getYuanxhd(),RULE_XHD,false)){
				//不为字符或者数字且位数不等于9位，此字段为空，则返回校验失败
				result =false;
				MESSAGE = "替换:【"+rafmod.getOfh()+"】的"+"消耗点必须为字符或者数字";
			}else if(!validateString(pattern, matcher, rafmod.getYuanlj(), RULE_LJ, false)){
				//不为字符或者数字且位数不等于10位，此字段为空，则返回校验失败
				result =false;
				MESSAGE = "替换:【"+rafmod.getOfh()+"】的"+"零件必须为字符或者数字";
			}else if(!validateString(pattern, matcher, rafmod.getYuanxs(), RULE_XS,false)){
				//不为数字，此字段为空，则返回校验失败
				result =false;
				MESSAGE = "替换:【"+rafmod.getOfh()+"】的"+"消耗系数必须为数字,整数部分不大于1000,小数部分位数不超过3位.";
			}else if(!validateString(pattern,matcher,rafmod.getXinxhd(),RULE_XHD,false)){
				//不为字符或者数字且位数不等于9位，此字段为空，则返回校验失败
				result =false;
				MESSAGE = "替换:【"+rafmod.getOfh()+"】的"+"消耗点必须为字符或者数字";
			}else if(!validateString(pattern, matcher, rafmod.getXinlj(), RULE_LJ, false)){
				//不为字符或者数字且位数不等于10位，此字段为空，则返回校验失败
				result =false;
				MESSAGE = "替换:【"+rafmod.getOfh()+"】的"+"零件必须为字符或者数字";
			}else if(!validateString(pattern, matcher, rafmod.getXinxs(), RULE_XS,false)){
				//不为数字，此字段为空，则返回校验失败
				result =false;
				MESSAGE = "替换:【"+rafmod.getOfh()+"】的"+"消耗系数必须为数字,整数部分不大于1000,小数部分位数不超过3位.";
			}
			
		}else if(rafmod.getCaozbs() == 3){
			//为删除
			if(!validateString(pattern,matcher,rafmod.getOfh(),RULE_OF,false)){
				//不为字符或者数字且位数不等于8位，此字段为空，则返回校验失败
				result =false;
				MESSAGE = "删除:【"+rafmod.getOfh()+"】的"+"OF号必须为字符或者数字";
			}else if(!validateString(pattern,matcher,rafmod.getYuanxhd(),RULE_XHD,false)){
				//不为字符或者数字且位数不等于9位，此字段为空，则返回校验失败
				result =false;
				MESSAGE = "删除:【"+rafmod.getOfh()+"】的"+"原消耗点必须为字符或者数字";
			}else if(!validateString(pattern, matcher, rafmod.getYuanlj(), RULE_LJ, false)){
				//不为字符或者数字且位数不等于10位，此字段为空，则返回校验失败
				result =false;
				MESSAGE = "删除:【"+rafmod.getOfh()+"】的"+"零件必须为字符或者数字";
			}else if(!validateString(pattern, matcher, rafmod.getYuanxs(), RULE_XS,false)){
				//不为数字，此字段为空，则返回校验失败
				result =false;
				MESSAGE = "删除:【"+rafmod.getOfh()+"】的"+"消耗系数必须为数字,整数部分不大于1000,小数部分位数不超过3位";
			}else if(!validateString(pattern,matcher,rafmod.getXinxhd(),RULE_XHD,true)){
				//不为字符或者数字且位数不等于9位，此字段不为空，则返回校验失败
				result =false;
				MESSAGE = "删除:【"+rafmod.getOfh()+"】的"+"消耗点必须为字符或者数字,且不能填写";
			}else if(!validateString(pattern, matcher, rafmod.getXinlj(), RULE_LJ, true)){
				//不为字符或者数字且位数不等于10位，此字段不为空，则返回校验失败
				result =false;
				MESSAGE = "删除:【"+rafmod.getOfh()+"】的"+"零件必须为字符或者数字,且不能填写";
			}else if(!validateString(pattern, matcher, rafmod.getXinxs(), RULE_XS,true)){
				//不为数字，此字段不为空，则返回校验失败
				result =false;
				MESSAGE = "删除:【"+rafmod.getOfh()+"】的"+"消耗系数必须为数字,整数部分不大于1000,小数部分位数不超过3位,且不能填写";
			}
			
		}else{
			//如果不为新增 删除 修改 就直接返回校验失败
			result = false;
		}
			
		return result;
	}
	

	/**
	 * 
	 * @param p
	 * @param m
	 * @param s
	 * @param rule
	 * @param isNull 是否可空
	 * @return
	 */
	public static boolean validateString(Pattern pattern,Matcher matcher,String str,String rule,boolean isNull){
		boolean result = true;
		
		if(isNull){
			//校验字段必须为空
			if(str!=null){
				result = false;
			}
		}else{
			//校验的字段不能为空的情况
			if(str==null){
				//校验字段为空
				result = false;
			}else{
				if(rule.equals(RULE_XHD)){
					//消耗点
					pattern = Pattern.compile("\\w{9}"); //字符和数字
					matcher = pattern.matcher(str);
					result = matcher.matches();
				}else if(rule.equals(RULE_LJ)){
					//零件
					pattern = Pattern.compile("\\w{10}"); //字符和数字
					matcher = pattern.matcher(str);
					result = matcher.matches();
				}else if(rule.equals(RULE_OF)){
					//OF号
					pattern = Pattern.compile("\\w{8}"); //字符和数字
					matcher = pattern.matcher(str);
					result = matcher.matches();
				}else if(rule.equals(RULE_XS)){
					//消耗系数
					pattern = Pattern.compile("\\d{1,3}\\.\\d{1,3}"); //数字
					matcher = pattern.matcher(str);
					boolean result1 = matcher.matches();
					
					pattern = Pattern.compile("\\d{1,3}"); //数字
					matcher = pattern.matcher(str);
					boolean result2 = matcher.matches();
					
					if(result1 || result2){
						result = true;
					}else{
						result=false;
					}
					
				}
			}
		}
				
		return result;
	}
	
    /**
     * 获取当前日期时间
     * @return
     */
    public String getAllCurrTime(){
    	return getDateTimeStr("yyyy-MM-dd HH:mm:ss");
    }
    /**
     * 以格式format返回表示日期时间的字符串
     * 
     * @param format
     * @return
     */
    public String getDateTimeStr(String format) {
        Date date = new Date();
        Format formatter = new SimpleDateFormat(format);
        return formatter.format(date);
    }
}
