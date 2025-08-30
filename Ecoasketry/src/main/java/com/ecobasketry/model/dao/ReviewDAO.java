package com.ecobasketry.model.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.ecobasketry.model.Connection.Connectors;
import com.ecobasketry.model.dto.Customer;
import com.ecobasketry.model.dto.Review;

import jakarta.servlet.http.HttpSession;

public class ReviewDAO {
	private Connection con;
    private HttpSession session;

    public ReviewDAO(HttpSession session) {
        this.con = Connectors.requestConnection();
        this.session = session;
    }
    
    public boolean addReview(Review r)
    {
    	Customer c = (Customer) session.getAttribute("user");
    	String s="insert into review values(?,?,?,?)";
    	try {
			PreparedStatement ps=con.prepareStatement(s);
			ps.setInt(1, r.getPid());
			ps.setString(2, c.getName());
			ps.setString(3,r.getReview());
			ps.setInt(4, r.getRating());
			return ps.executeUpdate()>0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	return false;
    }
}