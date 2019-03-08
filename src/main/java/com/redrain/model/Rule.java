package com.redrain.model;

public class Rule {
    private String ruleid;

    private String content;
    
	private String categories;
    
    public String getCategories() {
		return categories;
	}

	public void setCategories(String categories) {
		this.categories = categories;
	}



    public String getRuleid() {
        return ruleid;
    }

    public void setRuleid(String ruleid) {
        this.ruleid = ruleid == null ? null : ruleid.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}