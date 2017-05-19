package com.athena.jk.entity;

import com.athena.component.entity.Domain;
import com.toft.core3.support.PageableSupport;

/**
 * 接口错误日志实体类
 * @author 贺志国
 * @E-mail zghe@isoftstone.com
 * @version v1.0
 * @date 2012-10-25
 */
public class In_errorfile extends PageableSupport implements Domain {

	/**
	 * 序列号
	 */
	private static final long serialVersionUID = -5157666252421965656L;
	
	private String inbh;           //接口编号
	private String sid;            //SID
	private String file_errorinfo; //文件数据错误内容
	private String error_date;     //错误数据记录参数
	private String line;           //行号
	private String yunxkssj;       //接口运行开始时间
	private String yunxkssjTo;       //接口运行开始时间
	private String eid;            //EID
	

	public String getYunxkssjTo() {
		return yunxkssjTo;
	}

	public void setYunxkssjTo(String yunxkssjTo) {
		this.yunxkssjTo = yunxkssjTo;
	}

	public String getInbh() {
		return inbh;
	}

	public void setInbh(String inbh) {
		this.inbh = inbh;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getFile_errorinfo() {
		return file_errorinfo;
	}

	public void setFile_errorinfo(String file_errorinfo) {
		this.file_errorinfo = file_errorinfo;
	}

	public String getError_date() {
		return error_date;
	}

	public void setError_date(String error_date) {
		this.error_date = error_date;
	}

	public String getLine() {
		return line;
	}

	public void setLine(String line) {
		this.line = line;
	}

	public String getYunxkssj() {
		return yunxkssj;
	}

	public void setYunxkssj(String yunxkssj) {
		this.yunxkssj = yunxkssj;
	}

	public String getEid() {
		return eid;
	}

	public void setEid(String eid) {
		this.eid = eid;
	}


	public void setId(String id) {
		// TODO Auto-generated method stub
		
	}

	public String getId() {
		// TODO Auto-generated method stub
		return null;
	}


}
