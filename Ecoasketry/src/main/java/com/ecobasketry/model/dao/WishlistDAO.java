package com.ecobasketry.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jakarta.servlet.http.HttpSession;
import com.ecobasketry.model.Connection.Connectors;
import com.ecobasketry.model.dto.Customer;
import com.ecobasketry.model.dto.Wishlist;

public class WishlistDAO {
	private Connection con;
    private HttpSession session;	

    public WishlistDAO(HttpSession session) {
        this.con = Connectors.requestConnection();
        this.session = session;
    }

    public boolean addWishlist(int p_id) {
        Customer c = (Customer) session.getAttribute("user");
        if (c == null) {
            return false;
        }
        int userId = c.getUser_id();
        String checkWish = "SELECT COUNT(*) FROM wishlist WHERE u_id = ? AND p_id = ?";
        String insertWish = "INSERT INTO wishlist (u_id, p_id, img_url, p_name, p_price) " +
                            "SELECT ?, p_id, img_url, p_name, p_price FROM products WHERE p_id = ?";
        try (
            PreparedStatement ps1 = con.prepareStatement(checkWish);
            PreparedStatement ps2 = con.prepareStatement(insertWish)
        ) {
            ps1.setInt(1, userId);
            ps1.setInt(2, p_id);
            ResultSet rs = ps1.executeQuery();
           if (rs.next() && rs.getInt(1) > 0) {
                return false;
            }    
            ps2.setInt(1, userId);
            ps2.setInt(2, p_id);

            return ps2.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    
    public ArrayList<Wishlist> getAllWishlist()
    {
    	ArrayList<Wishlist> al=new ArrayList<>();
    	Wishlist w=null;
    	Customer customer = (Customer) session.getAttribute("user");
    	if(customer == null)
        {
        	return al;
        }
    	String s="select * from wishlist where u_id=?";
    	try {
    		int Id = customer.getUser_id();
			PreparedStatement ps=con.prepareStatement(s);
			ps.setInt(1, Id);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				w=new Wishlist();
				w.setUser_id(rs.getInt("U_ID"));
				w.setP_id(rs.getInt("P_ID"));
				w.setImg_url(rs.getString("IMG_URL"));
				w.setP_name(rs.getString("P_NAME"));
				w.setP_price(rs.getDouble("P_PRICE"));
				al.add(w);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	return al;
    }
    
    
    public boolean deleteWishlist(int pid) {
    	Customer c = (Customer) session.getAttribute("user");
    	int uid=c.getUser_id();
        String s = "delete from wishlist where p_id = ? and u_id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(s);
            ps.setInt(1, pid);
            ps.setInt(2, uid);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

}
