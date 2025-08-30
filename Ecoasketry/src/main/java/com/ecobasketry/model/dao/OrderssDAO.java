package com.ecobasketry.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ecobasketry.model.Connection.Connectors;
import com.ecobasketry.model.dto.Cart;
import com.ecobasketry.model.dto.Customer;
import com.ecobasketry.model.dto.orderss;

import jakarta.servlet.http.HttpSession;

public class OrderssDAO {
	private Connection con;
    private HttpSession session;	

    public OrderssDAO(HttpSession session) {
        this.con = Connectors.requestConnection();
        this.session = session;
    }
    
    public boolean addOrders(orderss o) {
        String sql = "INSERT INTO orderss (u_id, uname, img_url, p_name, p_cost, order_date, status, order_address, " +
                     "order_city, order_state, pincode) " +
                     "VALUES (?, ?, ?, ?, ?, NOW(), 'CONFIRMED', ?, ?, ?, ?)";

        Customer c = (Customer) session.getAttribute("user");
        int id = c.getUser_id();
        String uname = c.getName();
        CartDAO cdo = new CartDAO(session);
        ArrayList<Cart> cl = cdo.getcartItem();
        for (Cart ci : cl) {
            try {
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, id);
                ps.setString(2, uname);
                ps.setString(3, ci.getImg_url());
                ps.setString(4, ci.getP_name());
                ps.setDouble(5, ci.getP_price());
                ps.setString(6, o.getO_address()); 
                ps.setString(7, o.getO_city());
                ps.setString(8, o.getO_state());
                ps.setInt(9, o.getPin());
                int rows = ps.executeUpdate();
                if (rows <= 0) {
                    return false; 
                }
            } catch (SQLException e) {
                e.printStackTrace();
                return false;
            }
        }
        return true; 
    }
    
    public ArrayList<orderss> getAllOrders()
    {
    	ArrayList<orderss> al=new ArrayList<>();
    	orderss o=null;
    	//String s="select * from orderss";
    	String s="select * from orderss order by order_date desc";
    	try {
			PreparedStatement ps=con.prepareStatement(s);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				o=new orderss();
				o.setO_id(rs.getInt(1));
				o.setUser_id(rs.getInt(2));
				o.setUname(rs.getString(3));
				o.setImg_url(rs.getString(4));
				o.setP_name(rs.getString(5));
				o.setP_cost(rs.getDouble(6));
				o.setO_date(rs.getString(7));
				o.setStatus(rs.getString(8));
				o.setO_address(rs.getString(9));
				o.setO_city(rs.getString(10));
				o.setO_state(rs.getString(11));
				o.setPin(rs.getInt(12));
				al.add(o);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	return al;
    }
    
    public boolean updateOrderStatus(int orderId, String status) {
        String s = "UPDATE orderss SET status = ? where o_id=?";
        try {
			PreparedStatement ps=con.prepareStatement(s);
			ps.setString(1, status);
			ps.setInt(2, orderId);
			return ps.executeUpdate()>0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
        return false;
    }
    
  public ArrayList<orderss> getOrdersByUser()
  {
	Customer c = (Customer) session.getAttribute("user");
  	ArrayList<orderss> al=new ArrayList<>();
  	orderss o=null;
  	String s="select * from orderss where u_id=?";
  	try {
			PreparedStatement ps=con.prepareStatement(s);
			ps.setInt(1, c.getUser_id());
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				o=new orderss();
				o.setO_id(rs.getInt(1));
				o.setUser_id(rs.getInt(2));
				o.setUname(rs.getString(3));
				o.setImg_url(rs.getString(4));
				o.setP_name(rs.getString(5));
				o.setP_cost(rs.getDouble(6));
				o.setO_date(rs.getString(7));
				o.setStatus(rs.getString(8));
				o.setO_address(rs.getString(9));
				o.setO_city(rs.getString(10));
				o.setO_state(rs.getString(11));
				o.setPin(rs.getInt(12));
				al.add(o);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
  	return al;
  }

}