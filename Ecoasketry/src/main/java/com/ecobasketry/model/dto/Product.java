package com.ecobasketry.model.dto;

public class Product {
private int p_id;
private String p_name;
private String cat_name;
private int subCat_id;
private double price;
private int stock;
private String img_url;
private String p_desc;
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
public String getCat_name() {
	return cat_name;
}
public void setCat_name(String cat_name) {
	this.cat_name = cat_name;
}
public int getSubCat_id() {
	return subCat_id;
}
public void setSubCat_id(int subCat_id) {
	this.subCat_id = subCat_id;
}
public double getPrice() {
	return price;
}
public void setPrice(double price) {
	this.price = price;
}
public int getStock() {
	return stock;
}
public void setStock(int stock) {
	this.stock = stock;
}
public String getImg_url() {
	return img_url;
}
public void setImg_url(String img_url) {
	this.img_url = img_url;
}
public String getP_desc() {
	return p_desc;
}
public void setP_desc(String p_desc) {
	this.p_desc = p_desc;
}


}