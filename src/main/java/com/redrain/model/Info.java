package com.redrain.model;

import java.util.Date;

public class Info {
    private String infoid;

    private Date infotime;

    private Date updatetime;

    private String infocontent;
    
    private int limit;

	private int offset;
    
    private String search;

    public String getInfoid() {
        return infoid;
    }

    public void setInfoid(String infoid) {
        this.infoid = infoid == null ? null : infoid.trim();
    }

    public Date getInfotime() {
        return infotime;
    }

    public void setInfotime(Date infotime) {
        this.infotime = infotime;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    public String getInfocontent() {
        return infocontent;
    }

    public void setInfocontent(String infocontent) {
        this.infocontent = infocontent == null ? null : infocontent.trim();
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