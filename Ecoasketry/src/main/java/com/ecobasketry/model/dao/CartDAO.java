package com.ecobasketry.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jakarta.servlet.http.HttpSession;
import com.ecobasketry.model.Connection.Connectors;
import com.ecobasketry.model.dto.Cart;
import com.ecobasketry.model.dto.Customer;

public class CartDAO {
    private Connection con;
    private HttpSession session;

    public CartDAO(HttpSession session) {
        this.con = Connectors.requestConnection();
        this.session = session;
    }

   
    public boolean addCart(int pid) {
        Customer customer = (Customer) session.getAttribute("user");
        if (customer == null) {
            return false;
        }
        String query = "INSERT INTO cart(u_id, p_id, img_url, p_name, p_price, quantity) " +
                       "SELECT ?, p_id, img_url, p_name, p_price, 1 FROM products WHERE p_id=?";
        try {
            int userId = customer.getUser_id();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userId);
            ps.setInt(2, pid);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    
    public ArrayList<Cart> getcartItem() {
        ArrayList<Cart> cartList = new ArrayList<>();
        Customer customer = (Customer) session.getAttribute("user");
        if(customer == null)
        {
        	return cartList;
        }
        String query = "SELECT * FROM cart WHERE u_id=?";
        try {
            int userId = customer.getUser_id();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Cart cartItem = new Cart();
                cartItem.setC_id(rs.getInt("c_id"));
                cartItem.setUser_id(rs.getInt("u_id"));
                cartItem.setP_id(rs.getInt("p_id"));
                cartItem.setImg_url(rs.getString("img_url"));
                cartItem.setP_name(rs.getString("p_name"));
                cartItem.setP_price(rs.getDouble("p_price"));
                cartItem.setQuantity(rs.getInt("quantity"));
                cartList.add(cartItem);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cartList;
    }

    
    public ArrayList<Cart> getAllCartItem() {
        ArrayList<Cart> cartList = new ArrayList<>();
        String query = "SELECT * FROM cart";

        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Cart cartItem = new Cart();
                cartItem.setC_id(rs.getInt("c_id"));
                cartItem.setUser_id(rs.getInt("u_id"));
                cartItem.setP_id(rs.getInt("p_id"));
                cartItem.setImg_url(rs.getString("img_url"));
                cartItem.setP_name(rs.getString("p_name"));
                cartItem.setP_price(rs.getDouble("p_price"));
                cartItem.setQuantity(rs.getInt("quantity"));
                cartList.add(cartItem);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cartList;
    }

 
    public boolean removeCartItem(int c_id) {
        String query = "DELETE FROM cart WHERE c_id=?";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, c_id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    
    public boolean updateCartItem(int c_id, int quantity) {
        String query = "UPDATE cart SET quantity=? WHERE c_id=?";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, quantity);
            ps.setInt(2, c_id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean deleteCartItem(int id) {
        String query = "DELETE FROM cart WHERE u_id=?";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
