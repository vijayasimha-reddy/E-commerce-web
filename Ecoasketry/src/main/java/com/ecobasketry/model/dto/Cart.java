package com.ecobasketry.model.dto;

public class Cart {
 private int c_id;
 private int user_id;
 private int p_id;
 private String img_url;
 private String p_name;
 private double p_price;
 private int quantity;
 private double sub_total;
 private double total_price;
 
 public int getC_id() {
	return c_id;
}
public void setC_id(int c_id) {
	this.c_id = c_id;
}
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
public double getP_price() {
	return p_price;
}
public void setP_price(double p_price) {
	this.p_price = p_price;
}
public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}
public double getSub_total() {
	return sub_total;
}
public void setSub_total(double sub_total) {
	this.sub_total = sub_total;
}
public double getTotal_price() {
	return total_price;
}
public void setTotal_price(double total_price) {
	this.total_price = total_price;
}

}