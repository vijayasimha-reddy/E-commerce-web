package com.ecobasketry.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jakarta.servlet.http.HttpSession;

import com.ecobasketry.model.Connection.Connectors;
import com.ecobasketry.model.dto.Subcategory;

public class CategoryDAO {
	private Connection con;
   
    public CategoryDAO() {
        this.con = Connectors.requestConnection();
    }
    
    public boolean addCategory(Subcategory s)
    {
    	String q="insert into subcategory values(?,?)";
    	try {
			PreparedStatement ps=con.prepareStatement(q);
			ps.setString(1, s.getSubCat_name());
			ps.setString(2,s.getCat_name());
			return ps.executeUpdate()>0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	return false;
    }
    
    
    public ArrayList<Subcategory> getAllCategories()
    {
    	ArrayList<Subcategory> al=new ArrayList<>();
    	Subcategory s=null;
    	String q="select * from subcategory";
    	try {
    	PreparedStatement ps=con.prepareStatement(q);
    	ResultSet rs=ps.executeQuery();
    	while(rs.next())
    	{
    		s=new Subcategory();
    		s.setSubCat_id(rs.getInt(1));
    		s.setSubCat_name(rs.getString(2));
    		s.setCat_name(rs.getString(3));
    		al.add(s);
    	}
    	}
    	catch(SQLException e)
    	{
    		e.printStackTrace();
    	}
    	return al;
    }
    
    
    public boolean deleteCategory(int categoryId)
    {
    	String s="delete from subcategory where subcategory_id=?";
    	try {
			PreparedStatement ps=con.prepareStatement(s);
			ps.setInt(1, categoryId);
			return ps.executeUpdate()>0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	return false;
    }
    
    
    public boolean updateSubcategory(Subcategory s)
    {
    	String q="update subcategory set subcategory_id=?,SUBCATEGORY_NAME=?,CATEGORY_NAME=?";
    	try {
			PreparedStatement ps=con.prepareStatement(q);
			ps.setInt(1,s.getSubCat_id());
			ps.setString(2, s.getSubCat_name());
			ps.setString(3, s.getCat_name());
			return ps.executeUpdate()>0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	return false;
    }
}
