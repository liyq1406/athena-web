package com.athena.ck.module.common.service;

import java.util.List;
import java.util.Map;

import org.apache.cxf.jaxws.JaxWsProxyFactoryBean;

import com.athena.ck.common.CKUtil;
import com.athena.ck.entity.beihuo.Kuccx;
import com.athena.ck.entity.common.ChildWareHouse;
import com.athena.ck.entity.common.LIUSB;
import com.athena.ck.entity.common.Peislb;
import com.athena.ck.entity.common.Rongqc;
import com.athena.ck.entity.common.Trscode;
import com.athena.ck.entity.common.UserCenter;
import com.athena.ck.entity.common.WareHouse;
import com.athena.ck.entity.common.Wuld;
import com.athena.ck.entity.common.Xiehzt;
import com.athena.ck.entity.common.Xitcsdy;
import com.athena.ck.entity.common.Zhijz;
import com.athena.ck.entity.kunei.Budinfo;
import com.athena.ck.entity.shouhuo.Chengpbz;
import com.athena.ck.entity.shouhuo.Lingjgys;
import com.athena.ck.entity.shouhuo.Shengcx;
import com.athena.ck.entity.shouhuo.Tongbyhl;
import com.athena.ck.entity.yichang.Yic;
import com.athena.component.service.BaseService;
import com.athena.db.ConstantDbCode;
import com.athena.print.controller.GetPrintService;
import com.toft.core3.container.annotation.Component;

@Component
public class CommonService extends BaseService{
	/**
	 * 获取用户中心数据集
	 */
	public List<UserCenter> selectUserCenter(){
		 return  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.queryUserCenter");
	}
	
	/**
	 * 获取仓库集
	 */
	public List<WareHouse> selectWareHouse(WareHouse bean){
		 return  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.queryWareHouse", bean);
	}
	
	/**
	 * 获取子仓库集
	 */
	public List<ChildWareHouse> selectChildWareHouse(ChildWareHouse bean){
		 return  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.queryChildWareHouse", bean);
	}
	
	/**
	 * 获取容器场
	 */
	public List<Rongqc> selectRongqc(Rongqc bean){
		 return  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.queryRongqc", bean);
	}
	
	/**
	 * pda获取容器场
	 * 0010495
	 */
	public List<Rongqc> PdaselectRongqc(Rongqc bean){
		 return  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.PdaqueryRongqc", bean);
	}
	
	/**
	 * 获取仓库流水
	 */
	public List<LIUSB> selectLiusb(LIUSB bean){
		 return  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.queryLiusb", bean);
	}
	
	/**
	 * 获取记账区编号
	 */
	public List<Rongqc> selectjzqbh(Map map){
		 return  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.queryJiZhangqbh", map);
	}
	
	/**
	 * 获取返空区
	 */
	public List<Rongqc> selectFankongq(Map map){
		 return  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.queryFankongq", map);
	}
	
	/**
	 * 获取返空区603
	 */
	public List<Rongqc> selectFankongq603(Map map){
		 return  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.queryFankongq603", map);
	}
	
	/**
	 * 获取调入容器区
	 */
	public List<Rongqc> selectDiaoRurqq(){
		 return  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.queryDiaoRurqq");
	}
	
	/**
	 * 获取调入容器区 611
	 */
	public List<Rongqc> selectDiaoRurqq611(Map map){
		 return  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.queryDiaoRurqq611",map);
	}
	
	/**
	 * 根据盘点类型确定容器区的值 633
	 */
	public List<Rongqc> showRongqq633(Map map){
		if(map.get("temp").equals("1")){
			return  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.showRongqq63302",map);
		}else{
			return  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.showRongqq63301",map);
		}
	}
	
	/**
	 * 获取调入容器区 page 614
	 */
	public List<Rongqc> selectDiaoRurqq614(Map map){
		 return  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.queryDiaoRurqq614",map);
	}
	
	/**
	 *  容器盘点维护 page 614
	 */
	public List<Rongqc> flagJudge624(Map map){
		 return  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.queryRongqPanD624",map);
	}
	
	/**
	 * 获取调出容器区
	 */
	public List<Rongqc> selectDiaoChurqq(){
		 return  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.queryDiaoChurqq");
	}
	
	/**
	 * 获取调出容器区 Page 614
	 */
	public List<Rongqc> selectDiaoChurqq614(){
		 return  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.queryDiaoChurqq614");
	}
	
	/**
	 * 获取质检组
	 */
	public List<Zhijz> selectZhijz(Zhijz bean){
		 return  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.queryZhijz", bean);
	}
	
	/**
	 * 获取字典表分类数据集
	 */
	public List<Xitcsdy> selectXitcsdy(Xitcsdy bean){
		 return  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.queryXitcsdy", bean);
	}
	
	/**
	 * 获取用户中心数据集
	 */
	public List<Peislb> selectPeislb(){
		 return  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.queryPeislb");
	}

	/**
	 * 查询包装型号是否存在
	 */
	public  String checkbzxh(Map map) {
		Chengpbz cp = (Chengpbz) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("common.queryBaozxh", map);
		if (cp == null) {
			return "P148_0301";
		} else {
			return "0001";
		}
	}
	/**
	 * 查询仓库编号下的所有卸货站台信息
	 */
	public  List<Xiehzt> selectXiehzt(Map<String,String> map){
		return   baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.queryXiehzt",map);
	}
    /**
     * 151查询卸货站台信息
     */
	public List<Xiehzt> selectXiehzt151(Xiehzt xiehzt){
		return baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.queryXiehzt151",xiehzt);
	}
	/**
	 * 通过零件编号查询零件 名称
	 */
	public  Tongbyhl selectLingjmc(Map map){
		return  (Tongbyhl) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("common.queryLingjmc",map);
		
	}
	/**
	 * 通过供应商代码查询供应商名称
	 */
	public  Tongbyhl selectGongysmc(Map<String,String> map){
			return   (Tongbyhl) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("common.queryGongysmc",map);
	}
	/**
	 * 查询物理点
	 */
	public  List<Wuld>  selectWuld(Map map){
		return  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.queryWuld", map);
		
	}
	/**
	 * 查询零件编号获取 卸货站台 及供应商代码
	 * 10208
	 */
	public  Xiehzt selectXhztgys(Map map){
		return (Xiehzt) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("common.queryLingjCangk", map);

	}
	/**
	 * 查询零件编号获取 供应商列表
	 */
	public  List<Lingjgys> selectGongys(Map map){
	 return   baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.queryLingjGongys",map);
	}
	/**
	 * 通过零件编号用户中心获取配送类别
	 */
	public  List<Peislb> selectPeislb(Map map){
		 return   baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.queryLingjPeislb",map);
	}
	/**
	 * 通过零件编号配送类别获卸货站台
	 */
	public  String selectPeislbXiehzt(Map map){
		 return   (String) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("common.queryPeislbXiehzt",map);
	}
	/**
	 * 产线查询
	 */
	public  List<Shengcx>  selectChanx(Map map){
		return  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.queryChanx",map);
		
	}

	/**
	 * 查询操作码
	 */
	public  List<Trscode> selectAllTrscode(){
		 return   baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.queryTrscode");
	}
	/**
	 * 155卸货站台下拉
	 */
	public  List<Xiehzt> selectZickxhzt(Map map){
		return   baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.queryZickxhzt", map);

	}
	/**
	 * 147配送类别查询产线
	 * 20120818 
	 * XiaHui
	 */
	public  List<Shengcx>  selectPeislxcx(Map map){
		return  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.queryPeislbcx",map);
		
	}
	
	
	
	
	
	/**
	 * 查询供应商名称
	 */
	public List<Yic> selectgongysmcc(Map map){
		return (List<Yic>)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.querygongysmcc", map);
	}
	
	/**
	 * 查询供应商名称
	 */
	public List<Yic> searchgongysmc(Map map){
		return (List<Yic>)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.searchgongysmc", map);
	}
	/**
	 * 查询承运商代码
	 */
	public List<Yic> searchchengysdm(Map map){
		return (List<Yic>)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.searchchengysdm", map);
	}
	
	/**
	 * 查询零件名称
	 */
	public List<Yic> selectlingjmc(Map map){
		return (List<Yic>)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.querylingjmcc", map);
	}
	/**
	 * 查询供应商代码 
	 */
	public List<Yic> selectlingjgongys(Map map){
		return (List<Yic>)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.querylingjgongyss", map);
	}
	/**
	 * 查询承应商编号和承应商名称
	 */
	public List<Yic> selectchengysmc(Map map){
		String shengbd=map.get("shengbd").toString();
		String sb=shengbd.substring(0, 5);
		map.put("shengbd", sb);
		return (List<Yic>)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.querychengysmc", map);
	}
	/**
	 * 查询UC容量
	 */
	public List<Kuccx> selectucrl(Map map){
		return (List<Kuccx>)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.queryucrl", map);
	}
	/**
	 * 查询UC容量
	 */
	public List<Kuccx> selectuaucgs(Map map){
		return (List<Kuccx>)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.queryuaucgs", map);
	}
	/**
	 * 根据权限仓库编号验证出非成品仓库编号
	 */
	public String selectcangkbh(Map map){
		return (String)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("common.querycangkbh", map);
	}
	/**
	 * 查询零件仓库表仓库编号集合
	 * @author 贺志国
	 * @date 2014-10-14
	 * @param map 零件编号，用户中心
	 * @return 仓库编号集合
	 */
	public List<String> queryCangkbhOfLjck(Map<String,String> map){
		return baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.queryCangkbhOfLjck", map);
	}
	
	
	/**
	 * 查询打印主表数据
	 */
	public String selectbuda(Map map){
		//通过子任务编号和单据类型查询出主表id
		int danjlx=Integer.parseInt(map.get("danjlx").toString());
		String str="'p1','p2','p3','p4','p5','p6','p7'";
		if(danjlx==1){
			map.put("danjlx", "'p19'");//拒收单
		}else if(danjlx==2){	
			map.put("danjlx", "'p17'");//验收单
		}else if(danjlx==3){
			map.put("danjlx", "'p16'");//到货单
		}else if(danjlx==4){
			map.put("danjlx", "'p25'");//盘点单
		}else if(danjlx==5){
			map.put("danjlx", str);//备货单
		}else if(danjlx==6){
			map.put("danjlx", "'p14'");//返修入库单
		}else if(danjlx==7){
			map.put("danjlx", "'p11'");//返修单
		}else if(danjlx==8){
			map.put("danjlx", "'p12'");//退货单
		}else if(danjlx==9){
			map.put("danjlx", "'p18'");//拒收跟踪单
		}else if(danjlx==10){
			map.put("danjlx", "'p22'");//质检跟踪单
		}else if(danjlx==11){
			map.put("danjlx", "'p23'");//改包装跟踪单
		}else if(danjlx==12){
			map.put("danjlx", "'p21'");//US签
		}else if(danjlx==13){
			map.put("danjlx", "'p8'");//UC标签
		}else if(danjlx==14){
			map.put("danjlx", "'p9'");//出库单
		}else if(danjlx==15){
			map.put("danjlx", "'p10'");//调拨出库单
		}else if(danjlx==16){
			map.put("danjlx", "'p13'");//销毁单
		}else if(danjlx==17){
			map.put("danjlx", "'p20'");//成品库标签(US三栏)
		}else if(danjlx==18){
			map.put("danjlx", "'p24'");//纠纷单
		}
		List<Budinfo> list=null;
			if(danjlx==4||danjlx==18){
				 list = baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.queryzirwid", map);
			}else{
				list = baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.queryzirwidtwo", map);
			}
			
			if(list.size()!=0){
				map.put("qid", list.get(0).getQid());
				List<Budinfo> listall = baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.queryzirwidall", map);
				if(listall.size()==0){
					return "C_MAINIDDANJLX";
				}
				//通过主表id查询出主表数据并生成新的主表id插入到数据库中
				List<Budinfo> sjqid = baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.querysuijid",map);
				if(sjqid.size()==0){
					return "C_MAINID";
				}
				Budinfo budinfo=new Budinfo();
				budinfo.setQid(list.get(0).getQid());
				budinfo.setSjqid(sjqid.get(0).getSjqid());
				try{
					baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).execute("common.insertmain",budinfo);
					for (int i = 0; i < listall.size(); i++) {
						budinfo.setDanjbh(listall.get(i).getSeq());
						budinfo.setDanjlx(map.get("danjlx").toString());
						//通过子任务编号和单据类型查询出另外三张表的数据 进行修改插入（QID是生成的新主表id）
						baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).execute("common.insertinfo",budinfo);
						baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).execute("common.insertsheet",budinfo);
						baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).execute("common.insertlist",budinfo);
					}
				}catch(Exception e){
					return "C_INSERTSB";
				}
				
				//调用打印组WebService
				String endpoint = CKUtil.getBundleValue("C_FUWADREESS",null);
				//创建WebService客户端代理工厂  
		        JaxWsProxyFactoryBean factory = new JaxWsProxyFactoryBean();  
		        //设置WebService地址  
		        factory.setAddress(endpoint);
		        factory.setServiceClass(GetPrintService.class);
		        GetPrintService greetingService = (GetPrintService)factory.create(); 
		        greetingService.getQtaskController(sjqid.get(0).getSjqid());
				
			}else{
				return "C_INFODANJLX";
			}
		return "0000";
		
	}
	/**
	 * 102通过零件编号，供应商编号查询UA、UC型号是否正确 V4_022
	 * 
	 */
	public String selectuaucxh(Map map){
		String str=(String) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("common.queryUaucxh", map);
		if(str !=null){
			return "0001"; 
		}else{
			return "C_JLSB_001";
		}
		
	}
	/**
	 * 通过零件编号，供应商编号及用户中心  获取失效及批次的相关信息
	 * 20121109
	 */
	public   List<Lingjgys> selectpcsxq(Map map){
		 return   baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.queryPcsxq",map);
	}
	/**
	 * 查询序列作为BLH
	 */
	public String  selectBLH(){
		return (String) baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("shouhuo.queryBLH");
		
	}
	/**
	 * 150 通过零件及用户中心查询ckx_tongbjplj获得配送类别信息
	 */
	public List<Peislb> queryPeislb(){
		 return  baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).select("common.150Peislb");
	}
	
	/**
	 * 通过零件编号查询零件名称
	 */
	public String querySjljmc(Map map){
		 return  (String)baseDao.getSdcDataSource(ConstantDbCode.DATASOURCE_CKX).selectObject("common.querySjljmc",map);
	}
}
