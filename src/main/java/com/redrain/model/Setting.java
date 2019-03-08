package com.redrain.model;

import java.util.Date;

public class Setting {
    private Integer settingid;

    private String webname;

    private String keyword;

    private String description;

    private String hasevent;

    private Integer max;

    private Integer min;

    private Date starttime;

    private Integer duration;

    private Date endtime;

    private String fbtime;

    private String sbtime;
    
    public Integer getTotalnum() {
		return totalnum;
	}

	public void setTotalnum(Integer totalnum) {
		this.totalnum = totalnum;
	}

	public Integer getTotalmoney() {
		return totalmoney;
	}

	public void setTotalmoney(Integer totalmoney) {
		this.totalmoney = totalmoney;
	}

	private Integer totalnum;
    
    private Integer totalmoney;

    public Integer getSettingid() {
        return settingid;
    }

    public void setSettingid(Integer settingid) {
        this.settingid = settingid;
    }

    public String getWebname() {
        return webname;
    }

    public void setWebname(String webname) {
        this.webname = webname == null ? null : webname.trim();
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword == null ? null : keyword.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public String getHasevent() {
        return hasevent;
    }

    public void setHasevent(String hasevent) {
        this.hasevent = hasevent == null ? null : hasevent.trim();
    }

    public Integer getMax() {
        return max;
    }

    public void setMax(Integer max) {
        this.max = max;
    }

    public Integer getMin() {
        return min;
    }

    public void setMin(Integer min) {
        this.min = min;
    }

    public Date getStarttime() {
        return starttime;
    }

    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    public Integer getDuration() {
        return duration;
    }

    public void setDuration(Integer duration) {
        this.duration = duration;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public String getFbtime() {
        return fbtime;
    }

    public void setFbtime(String fbtime) {
        this.fbtime = fbtime == null ? null : fbtime.trim();
    }

    public String getSbtime() {
        return sbtime;
    }

    public void setSbtime(String sbtime) {
        this.sbtime = sbtime == null ? null : sbtime.trim();
    }
}