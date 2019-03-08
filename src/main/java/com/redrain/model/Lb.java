package com.redrain.model;

public class Lb {
    private Integer lbid;

    private String lbname;

    private String lbmoney;
    
    private int limit;	

   	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	private int offset;
       
    private String search;

    public Integer getLbid() {
        return lbid;
    }

    public void setLbid(Integer lbid) {
        this.lbid = lbid;
    }

    public String getLbname() {
        return lbname;
    }

    public void setLbname(String lbname) {
        this.lbname = lbname == null ? null : lbname.trim();
    }

    public String getLbmoney() {
        return lbmoney;
    }

    public void setLbmoney(String lbmoney) {
        this.lbmoney = lbmoney == null ? null : lbmoney.trim();
    }
}