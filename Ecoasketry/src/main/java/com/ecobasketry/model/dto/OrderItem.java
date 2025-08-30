package com.ecobasketry.model.dto;

public class OrderItem {
private int ot_id;
private int o_id;
private int p_id;
private String p_name;
private String img_url;
private int quantity;
private double p_price;
private double sub_total;
private double total_price;
public int getOt_id() {
	return ot_id;
}
public void setOt_id(int ot_id) {
	this.ot_id = ot_id;
}
public int getO_id() {
	return o_id;
}
public void setO_id(int o_id) {
	this.o_id = o_id;
}
public int getP_id() {
	return p_id;
}
public void setP_id(int p_id) {
	this.p_id = p_id;
}
public String getP_name() {
	return p_name;
}
public void setP_name(String p_name) {
	this.p_name = p_name;
}
public String getImg_url() {
	return img_url;
}
public void setImg_url(String img_url) {
	this.img_url = img_url;
}
public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}
public double getP_price() {
	return p_price;
}
public void setP_price(double p_price) {
	this.p_price = p_price;
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