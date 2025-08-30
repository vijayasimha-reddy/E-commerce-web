package com.ecobasketry.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ecobasketry.model.Connection.Connectors;
import com.ecobasketry.model.dto.Customer;
import com.ecobasketry.model.dto.OrderItem;

import jakarta.servlet.http.HttpSession;

public class CustomerDAO {
	private Connection con;
	
	public CustomerDAO()
	{
		this.con=Connectors.requestConnection();
	}
	public boolean Register(Customer c)
	{
		String s="insert into user values(0,?,?,?,?)";
		try {
			PreparedStatement ps=con.prepareStatement(s);
			ps.setString(1, c.getName());
			ps.setLong(2, c.getPhone());
			ps.setString(3, c.getMail());
			ps.setString(4,c.getPassword());
			return ps.executeUpdate()>0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
	public Customer Login(String mail,String pass)
	{
		String s="select * from user where mail=? and password=?";
		Customer c=null;
		try {
			PreparedStatement ps=con.prepareStatement(s);
			ps.setString(1,mail);
			ps.setString(2, pass);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				c=new Customer();
				c.setUser_id(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setPhone(rs.getLong(3));
				c.setMail(rs.getString(4));
				c.setPassword(rs.getString(5));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return c;
	}
	
	
	public boolean updateCustomer(Customer c) {
	    String q = "update user set u_name=?, phone=?, mail=?, password=? where u_id=?";
	    try {
	        PreparedStatement ps = con.prepareStatement(q);
	        ps.setString(1, c.getName());
	        ps.setLong(2, c.getPhone());
	        ps.setString(3, c.getMail());
	        ps.setString(4, c.getPassword());
	        ps.setInt(5, c.getUser_id());
	        return ps.executeUpdate() > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return false;
	}

	
	
	public ArrayList<Customer> getAllUsers()
	{
		ArrayList<Customer>al=new ArrayList<>();
		Customer c=null;
		String s="select * from user where u_id!=1";
		try {
			PreparedStatement ps=con.prepareStatement(s);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				c=new Customer();
				c.setUser_id(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setPhone(rs.getLong(3));
				c.setMail(rs.getString(4));
				al.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return al;
	}
	
	
	public boolean deleteUser(int id)
	{
		String s="delete from user where u_id=?";
		try {
			PreparedStatement ps=con.prepareStatement(s);
			ps.setInt(1, id);
			return ps.executeUpdate()>0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
	public Customer getUserById(int id)
	{
		Customer c=null;
		String s="select * from user where u_id=?";
		try {
			PreparedStatement ps=con.prepareStatement(s);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				c=new Customer();
				c.setUser_id(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setPhone(rs.getLong(3));
				c.setMail(rs.getString(4));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return c;
	}
	
	public Customer getUserbyMailPhone(String mail, long phone) {
		String query="select * from user where mail=? and phone=?";
		Customer c=null;
		ResultSet rs=null;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, mail);
			ps.setLong(2, phone);
			rs=ps.executeQuery();
			if(rs.next()) {
				c=new Customer();
				c.setUser_id(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setPhone(rs.getLong(3));
				c.setMail(rs.getString(4));
				c.setPassword(rs.getString(5));
			}
		} 
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		return c;
		
	}
	
}
