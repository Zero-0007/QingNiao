package com.cssl.pojo;

public class District {
	private Integer did;
	private String dname;

	public Integer getDid() {
		return did;
	}

	public void setDid(Integer did) {
		this.did = did;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public District(Integer did, String dname) {
		super();
		this.did = did;
		this.dname = dname;
	}

	public District() {
		super();
	}

	@Override
	public String toString() {
		return "District [did=" + did + ", dname=" + dname + "]";
	}
}
