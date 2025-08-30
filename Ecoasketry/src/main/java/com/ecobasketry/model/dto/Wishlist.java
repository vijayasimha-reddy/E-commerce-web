package com.ecobasketry.model.dto;

public class Wishlist {
	private int user_id;
	private int p_id;
	private String img_url;
	private String p_name;
	private Double p_price;
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public String getImg_url() {
		return img_url;
	}
	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public Double getP_price() {
		return p_price;
	}
	public void setP_price(Double p_price) {
		this.p_price = p_price;
	}
	
	
	
}
