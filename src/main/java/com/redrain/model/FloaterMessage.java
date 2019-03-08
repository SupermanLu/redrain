package com.redrain.model;

public class FloaterMessage extends Message{
	
	private String content;
	
	private String bottle_type; //666 钱  1 语录
	private String gift_type; //1正常 0 祝福语
	private String Luckdraw;
	private String hint;//继续加油
	
	private String money;
	
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getBottle_type() {
		return bottle_type;
	}
	public void setBottle_type(String bottle_type) {
		this.bottle_type = bottle_type;
	}
	public String getGift_type() {
		return gift_type;
	}
	public void setGift_type(String gift_type) {
		this.gift_type = gift_type;
	}
	public String getLuckdraw() {
		return Luckdraw;
	}
	public void setLuckdraw(String luckdraw) {
		Luckdraw = luckdraw;
	}
	public String getHint() {
		return hint;
	}
	public void setHint(String hint) {
		this.hint = hint;
	}

}
