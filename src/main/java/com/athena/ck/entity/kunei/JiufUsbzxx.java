package com.athena.ck.entity.kunei;
/**
 * <p>
 * Title:纠纷包装信息
 * </p>
 * <p>
 * Description:定义到纠纷包装信息实体类
 * </p>
 * <p>
 * Copyright: Copyright (c) 2011
 * </p>
 * <p>
 * Company: 软通动力
 * </p>
 * 
 * @author 甘露
 * @version v1.0
 * @date 2012-03-27
 */
public class JiufUsbzxx {
	/**
     * 
     */
	private String ush;
    private String jiufhusxh;
    private String jiufhussl;
	private String jiufhucrl;
	/**
	 * 返回US号
	 * 
	 * @return the ush
	 */
	public String getUsh() {
		return ush;
	}
	/**
	 * 设置US号
	 * 
	 * @param usxh
	 *            the ush to set
	 */
	public void setUsh(String ush) {
		this.ush = ush;
	}
	/**
	 * 返回纠纷后Us型号
	 * 
	 * @return the jiufhusxh
	 */
	public String getJiufhusxh() {
		return jiufhusxh;
	}
	/**
	 * 设置纠纷后Us型号
	 * 
	 * @param usxh
	 *            the jiufhusxh to set
	 */
	public void setJiufhusxh(String jiufhusxh) {
		this.jiufhusxh = jiufhusxh;
	}
	/**
	 * 返回纠纷后Us数量
	 * 
	 * @return the jiufhussl
	 */
	public String getJiufhussl() {
		return jiufhussl;
	}
	/**
	 * 设置纠纷后Us数量
	 * 
	 * @param usxh
	 *            the jiufhussl to set
	 */
	public void setJiufhussl(String jiufhussl) {
		this.jiufhussl = jiufhussl;
	}
	/**
	 * 返回纠纷后Uc容量
	 * 
	 * @return the jiufhucrl
	 */
	public String getJiufhucrl() {
		return jiufhucrl;
	}
	/**
	 * 设置纠纷后Uc容量
	 * 
	 * @param usxh
	 *            the jiufhucrl to set
	 */
	public void setJiufhucrl(String jiufhucrl) {
		this.jiufhucrl = jiufhucrl;
	}
}
