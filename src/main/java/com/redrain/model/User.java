package com.redrain.model;

public class User {
    private String userid;

    private String username;

    private String password;

    private Integer floatercount;

    private String name;

    private String role;
    
    private int limit;	

	private int offset;
    
    private String search;
    
    private String vcode;
    
    private int fixedmoney;

    public int getFixedmoney() {
		return fixedmoney;
	}

	public void setFixedmoney(int fixedmoney) {
		this.fixedmoney = fixedmoney;
	}

	public String getVcode() {
		return vcode;
	}

	public void setVcode(String vcode) {
		this.vcode = vcode;
	}

	public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid == null ? null : userid.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public Integer getFloatercount() {
        return floatercount;
    }

    public void setFloatercount(Integer floatercount) {
        this.floatercount = floatercount;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role == null ? null : role.trim();
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