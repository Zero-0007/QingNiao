package com.cssl.pojo;

public class Type {
	private Integer tid;
	private String tname;

	public Integer getTid() {
		return tid;
	}

	public void setTid(Integer tid) {
		this.tid = tid;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public Type(Integer tid, String tname) {
		super();
		this.tid = tid;
		this.tname = tname;
	}

	public Type() {
		super();
	}

	@Override
	public String toString() {
		return "Type [tid=" + tid + ", tname=" + tname + "]";
	}
}
