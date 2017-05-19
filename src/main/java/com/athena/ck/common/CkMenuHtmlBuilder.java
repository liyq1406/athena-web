/**
 * 
 */
package com.athena.ck.common;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.athena.authority.AthenaAccount;
import com.athena.authority.MenuHtmlBuilder;
import com.athena.authority.entity.LoginUser;
import com.athena.authority.entity.MenuDirectory;
import com.athena.authority.service.MenuDirectoryService;
import com.athena.ck.entity.common.Rongqc;
import com.athena.ck.entity.common.WareHouse;
import com.athena.ck.entity.common.Zhijz;
import com.athena.ck.module.common.service.CommonService;
import com.toft.core3.container.annotation.Component;
import com.toft.core3.container.annotation.Inject;

/**
 * <p>Title:仓库</p>
 *
 * <p>Description:仓库菜单HTML生成类</p>
 *
 * <p>Copyright:Copyright (c) 2011.11</p>
 *
 * <p>Company:iSoftstone</p>
 *
 * @author zhouyi
 * @version 1.0.0
 */
@Component("ckMenuHtmlBuilder")
public class CkMenuHtmlBuilder implements MenuHtmlBuilder {
	//日记
	private final static Log logger = LogFactory.getLog(CkMenuHtmlBuilder.class);
	//session中存储菜单html的key
	private final static String SESSION_MENU_HTML_KEY = "SESSION_MENU_HTML_KEY";
	@Inject 
	private MenuDirectoryService menuDirectoryService;
	@Inject
	private CommonService commonService;
	/* (non-Javadoc)
	 * @see com.athena.authority.MenuHtmlBuilder#createMenuHtml(javax.servlet.http.HttpServletRequest, com.athena.authority.AthenaAccount)
	 */
	@SuppressWarnings("unchecked")
	public void createMenuHtml(HttpServletRequest request, 
			AthenaAccount account) {
		HttpSession session = request.getSession();
		if(account==null){//没有用户信息直接返回
			session.removeAttribute(SESSION_MENU_HTML_KEY);
			return;
		}
		//缓存中已经存在
		if(session.getAttribute(SESSION_MENU_HTML_KEY)!=null){
			return;
		}
		String contextPath = request.getContextPath();
		
		/******************在登录对象中存入其他的信息**************************/
		LoginUser loginUser = (LoginUser)account.getToftUser();
		//通过postId查询对应的仓库数据
		WareHouse bean = new WareHouse();
		bean.setPost_Id(loginUser.getPostAndRoleMap().get("CK_001"));
		bean.setUsercenter(loginUser.getUsercenter());
		List<WareHouse> ckList = commonService.selectWareHouse(bean);
		loginUser.addParam("ckList", ckList);
		//存放仓库集合
		String cklist = "";
		for(WareHouse wareHouse : ckList){
			cklist += "'"+ wareHouse.getCangkbh()+"',";
		}
		if (cklist.length() >0){
			cklist= cklist.substring(0, cklist.length()-1);
		}
		//session.setAttribute("ckList", cklist);
		loginUser.addParam("cklist", cklist);
		//查询容器场数据(只加载R、F类型容器厂)
		Rongqc rongqc = new Rongqc();
		rongqc.setPost_Id(loginUser.getPostAndRoleMap().get("CK_003"));
		rongqc.setUsercenter(loginUser.getUsercenter());
		List<Rongqc> resultList = commonService.selectRongqc(rongqc);
		List<Rongqc> rqcList = new ArrayList<Rongqc>();
		for(Rongqc item : resultList){
			if ("R".equals(item.getShiffk())||"F".equals(item.getShiffk())){
				rqcList.add(item);
			}
		}
		loginUser.addParam("rqcList", rqcList);
		//查询容器厂数据（只加载J记账区类型的容器厂）
		List<Rongqc> rqcList_J = new ArrayList<Rongqc>();
		for(Rongqc item:resultList){
			if("J".equals(item.getShiffk())){
				rqcList_J.add(item);
			}
		}
		loginUser.addParam("rqcList_J",rqcList_J);
		//查询质检组数据
		List<Zhijz> zjzList = new ArrayList<Zhijz>();
		if (loginUser.getPostAndRoleMap().get("ZXCPOA") != null){
			Zhijz zhijz = new Zhijz();
			zhijz.setDic_code("ZHIJIA");
			zhijz.setBiaos("1");
			zhijz.setUsercenter(loginUser.getUsercenter());
			zjzList = commonService.selectZhijz(zhijz);
		} else {
			Zhijz zhijz = new Zhijz();
			zhijz.setZhijzbh(loginUser.getPostAndRoleMap().get("ZHIJIA"));
			zhijz.setZhijzmc(loginUser.getPostAndRoleMap().get("ZHIJIA"));
			zjzList.add(zhijz);
		}
		loginUser.addParam("zjzList", zjzList);
		
		logger.debug("***********************初始化创建菜单***********************");
		//判断授权用户中心
		List ucList = loginUser.getUcList();
		String username = loginUser.getUsername();
		String usercenter = loginUser.getUsercenter();
		List<MenuDirectory> userMenus = new ArrayList<MenuDirectory>();
		if(username.equals("ROOT") || ucList.contains(usercenter)){ //有授权用户中心
			//查询所有仓库权限
			MenuDirectory params = new MenuDirectory();
			params.setDirType(0L);
			params.setDirIsCK("1");  //只查询仓库菜单权限
			List<MenuDirectory> menus = menuDirectoryService.list(params);
			//加入菜单html到缓存
			userMenus = getUserMenus(contextPath,menus,account.getMenuAndButtonsIds());
		} 
		/******************在登录对象中存入其他的信息**************************/
		loginUser.addParam("userMenus", userMenus);
		loginUser.addParam("menuHtmls", buildMenuHtml(userMenus));
		session.setAttribute(SESSION_MENU_HTML_KEY, loginUser.getParams().get("menuHtmls"));
		//用户和用户中心
		session.setAttribute("userName", loginUser.getUsername());
		session.setAttribute("userCenter", loginUser.getUsercenter());
	}
	
	/**
	 * 获取有指定权限的菜单集合
	 * @param contextPath web上下文
	 * @param menus 全部菜单集合
	 * @param menuAndButtonsIds 用户分配的菜单集合
	 * @return
	 */
	private List<MenuDirectory> getUserMenus(String contextPath, List<MenuDirectory> menus,
			Set<String> menuAndButtonsIds){
		List<MenuDirectory> userMenus = new ArrayList<MenuDirectory>();
		for(MenuDirectory menu : menus){
			if(isSkipMenu(menu,menuAndButtonsIds)){//只创建带地址的并且有对应仓库权限的
				//设置链接地址
				menu.setDirPath(contextPath + menu.getDirPath());
				//添加排序
				userMenus.add(menu);
				
				/*if(userMenus.size()<=0){
					userMenus.add(menu);
				} else {
					//查找对应的位置
					boolean isAdd = false; 
					for(int i=userMenus.size()-1; i>=0; i--){
						int code = Integer.parseInt(menu.getDirCode());
						int upCode = Integer.parseInt(userMenus.get(i).getDirCode());
						if (upCode <= code){
							userMenus.add(i+1, menu);
							isAdd = true;
							break;
						}
					}
					//如果未找到，加到第一个
					if (isAdd == false){
						userMenus.add(0,menu);
					}
				}*/
			}
		}
		return userMenus;
	}
	
	/**
	 * 创建菜单HTML
	 * @param userMenus 用户分配的菜单集合
	 * @return
	 */
	private String[] buildMenuHtml(List<MenuDirectory> userMenus) {
		//将最终集合按Code分类
		String topIndex="";
		List menuList = new ArrayList();
		for(MenuDirectory menu : userMenus){
			//添加内容
			if (!topIndex.equals("") && menu.getDirCode().startsWith(topIndex)){
				List<MenuDirectory> list = (List)menuList.get(menuList.size()-1);
				list.add(menu);
			} else {
				topIndex = menu.getDirCode().substring(0, 1);
				List<MenuDirectory> list = new ArrayList<MenuDirectory>();
				list.add(menu);
				menuList.add(list);
			}
		}
		//获取参数
		int rows = 15;//TODO 配置行数
		int cols = 6;//TODO 配置列数
		List rowsList = new ArrayList();  //获取每页最大的行数
		for(int i=0; i< menuList.size(); i++){
			List<MenuDirectory> list = (List<MenuDirectory>)menuList.get(i);
			if (rowsList.size() <= 0){
				rowsList.add(list.size());
				continue;
			}
			//获取每页中最大行数
			if(i < rowsList.size()*cols){
				int rowCount = Integer.parseInt(rowsList.get(rowsList.size()-1).toString());
				if (list.size() > rowCount){
					rowsList.set(rowsList.size()-1, list.size());
				}
			} else {
				rowsList.add(list.size());
			}
		}
		//循环为界面拼串
		List menuContext = new ArrayList();
		//横向页面循环
		for(int i=0; i<rowsList.size(); i++){
			//每页最大行数
			int pageRowCount = Integer.parseInt(rowsList.get(i).toString());
			//纵向码
			int pageCount = pageRowCount <= rows ? 1 : (int)pageRowCount/rows + 1;
			//纵向页面循环
			for(int j=0; j<pageCount; j++){
				int colIndex = i * cols;
				int colCount = (i+1)*cols;
				int rowIndex = j * rows;
				int rowCount = (j+1)*rows;
				String htmls = buildMenuTextTable(menuList,rowIndex,rowCount,colIndex,colCount);
				menuContext.add(htmls);
			}
		}
		return (String[])menuContext.toArray(new String[menuContext.size()]);
	}
	/**
	 * 创建菜单显示文本(table)
	 * @param menuList
	 * @param rowIndex
	 * @param rowCount
	 * @param colIndex
	 * @param colCount
	 * @return
	 */
	private String buildMenuTextTable(List menuList,int rowIndex,int rowCount,int colIndex,int colCount){
		StringBuffer htmls = new StringBuffer();
		htmls.append("<table class='menu-container-table'>");
		//循环行
		for(int i=rowIndex; i<rowCount; i++){
			htmls.append("<tr>");
			//循环列
			for(int j=colIndex; j<colCount; j++){
				if (menuList.size() > j){
					List<MenuDirectory> list = (List<MenuDirectory>)menuList.get(j);
					if (list.size() > i){
						htmls.append(buildMenuText(list.get(i)));
					} else {
						htmls.append(buildMenuText(null));
					}
				} else {
					htmls.append(buildMenuText(null));
				}
			}
			htmls.append("</tr>");
		}
		htmls.append("</table>");
		return htmls.toString();
	}

	/**
	 * 创建菜单显示文本(td)
	 * @param menu
	 * @return
	 */
	private String buildMenuText(MenuDirectory menu) {
		//定义变量
		StringBuffer tdText = new StringBuffer();
		//判断拼值
		if (menu == null){
			tdText.append("<td class='field-label' width='180px'>");
			tdText.append("&nbsp;");
			tdText.append("</td>");
			tdText.append("<td class='field-container'>");
			tdText.append("&nbsp;");
			tdText.append("</td>");
		} else {
			//第一个(名称)
			tdText.append("<td class='field-label' style='cursor:pointer;' width='180px'>");
			tdText.append("<Span id='"+menu.getDirCode()+"' onclick=\"pageJump('"+menu.getDirCode()+"','"+menu.getDirPath()+"');\">");
			tdText.append(menu.getDirName());
			tdText.append("</Span>");
			tdText.append("：</td>");
			//第二个(Code值)
			tdText.append("<td class='field-container' style='cursor:pointer;'>");
			tdText.append("<Span onclick=\"pageJump('"+menu.getDirCode()+"','"+menu.getDirPath()+"');\">");
			tdText.append(menu.getDirCode());
			tdText.append("</td>");
		}
		return tdText.toString();
	}

	/**
	 * 跳过的菜单规则
	 * 	1：不带URL的菜单
	 *  2：不在用户分配的菜单内的
	 * @param menu
	 * @param menuAndButtonsIds
	 * @return
	 */
	private boolean isSkipMenu(MenuDirectory menu, Set<String> menuAndButtonsIds) {
		//Code为空或存在权限
		if(menu.getDirPath()==null || !menuAndButtonsIds.contains(menu.getId())){
			return false;
		}
		return true;
	}
}
