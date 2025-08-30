package com.ecobasketry.model.dto;



public class Review {

	private int pid;

	private String uname;

	private String review;

	private int rating;

	public int getPid() {

		return pid;

	}

	public void setPid(int pid) {

		this.pid = pid;

	}

	public String getUname() {

		return uname;

	}

	public void setUname(String uname) {

		this.uname = uname;

	}

	public String getReview() {

		return review;

	}

	public void setReview(String review) {

		this.review = review;

	}

	public int getRating() {

		return rating;

	}

	public void setRating(int rating) {
		this.rating = rating;
	}
}