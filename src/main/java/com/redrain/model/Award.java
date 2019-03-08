package com.redrain.model;

public class Award {
    private Integer awardid;

    private String awardname;

    private String awardtype;

    private Integer awardchance;
    
    private int limit;

	private int offset;
    
    private String search;

    public Integer getAwardid() {
        return awardid;
    }

    public void setAwardid(Integer awardid) {
        this.awardid = awardid;
    }

    public String getAwardname() {
        return awardname;
    }

    public void setAwardname(String awardname) {
        this.awardname = awardname == null ? null : awardname.trim();
    }

    public String getAwardtype() {
        return awardtype;
    }

    public void setAwardtype(String awardtype) {
        this.awardtype = awardtype == null ? null : awardtype.trim();
    }

    public Integer getAwardchance() {
        return awardchance;
    }

    public void setAwardchance(Integer awardchance) {
        this.awardchance = awardchance;
    }
    

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
}