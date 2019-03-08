package com.redrain.model;

import java.util.Date;

public class Gain {
    private Integer gainid;

    private Integer userid;

    private Integer awardid;

    private Date gaintime;

    private String status;
  
	private int limit;

	private int offset;
    
    private String search;
    
    private String username;
    
    private String awardname;
    
    private String awardtype;
    
    private Integer page;

    public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getGainid() {
        return gainid;
    }

    public void setGainid(Integer gainid) {
        this.gainid = gainid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getAwardid() {
        return awardid;
    }

    public void setAwardid(Integer awardid) {
        this.awardid = awardid;
    }

    public Date getGaintime() {
        return gaintime;
    }

    public void setGaintime(Date gaintime) {
        this.gaintime = gaintime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
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

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getAwardname() {
		return awardname;
	}

	public void setAwardname(String awardname) {
		this.awardname = awardname;
	}

	public String getAwardtype() {
		return awardtype;
	}

	public void setAwardtype(String awardtype) {
		this.awardtype = awardtype;
	}

}