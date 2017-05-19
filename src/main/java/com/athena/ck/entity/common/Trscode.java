package com.athena.ck.entity.common;

public class Trscode {
	
	private String trancode;
	private String trsname;
	private String timeout;
	private String service;
	private String oper_no;
	
	public String getOper_no() {
		return oper_no;
	}
	public void setOper_no(String oper_no) {
		this.oper_no = oper_no;
	}
	public String getTrancode() {
		return trancode;
	}
	public void setTrancode(String trancode) {
		this.trancode = trancode;
	}
	public String getTrsname() {
		return trsname;
	}
	public void setTrsname(String trsname) {
		this.trsname = trsname;
	}
	public String getTimeout() {
		return timeout;
	}
	public void setTimeout(String timeout) {
		this.timeout = timeout;
	}
	public String getService() {
		return service;
	}
	public void setService(String service) {
		this.service = service;
	}
	
	public boolean equals(Object obj){
		if(obj instanceof Trscode){
			//System.out.println(((Trscode) obj).getTrancode());
			if(((Trscode) obj).getTrancode().equals(this.getTrancode())){				
				return true;
			}
		}
		return false;
	}
	
	

}
