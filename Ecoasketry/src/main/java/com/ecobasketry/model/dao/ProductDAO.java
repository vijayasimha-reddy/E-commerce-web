package com.ecobasketry.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ecobasketry.model.Connection.Connectors;
import com.ecobasketry.model.dto.Product;
import com.ecobasketry.model.dto.Subcategory;
import com.mysql.cj.exceptions.UnsupportedConnectionStringException;

public class ProductDAO {
	private Connection con=null;
	public ProductDAO() {
		this.con=Connectors.requestConnection();
	}
	
	public boolean addProduct(Product p) {
		String query="insert into products values(0,?,?,?,?,?,?,?)";
		int i=0;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, p.getP_name());
			ps.setString(2, p.getCat_name() );
			ps.setInt(3, p.getSubCat_id());
			ps.setDouble(4, p.getPrice() );
			ps.setInt(5, p.getStock());
			ps.setString(6, p.getImg_url());
			ps.setString(7, p.getP_desc());
			i=ps.executeUpdate();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		if(i>0) {
			return true;
		}
		else {
			return false;
		}
	}
	
	public ArrayList<Product> getAllProducts() {
		ArrayList<Product> a=new ArrayList<Product>();
		String query="select * from products";
		Product p=null;
		ResultSet rs=null;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			while(rs.next()) {
				p=new Product();
				p.setP_id(rs.getInt(1));
				p.setP_name(rs.getString(2));
				p.setCat_name(rs.getString(3));
				p.setSubCat_id(rs.getInt(4));
				p.setPrice(rs.getDouble(5));
				p.setStock(rs.getInt(6));
				p.setImg_url(rs.getString(7));
				p.setP_desc(rs.getString(8));
				a.add(p);
			}
			
		} 
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		return a;
	}
	
	public boolean updateProduct(Product p) {
		String query="update products set p_name=?,category_name=?,subcategory_id=?,p_price=?,stock=?,img_url=?,description=?  where p_id=?";
		int i=0;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, p.getP_name());
			ps.setString(2, p.getCat_name() );
			ps.setInt(3, p.getSubCat_id());
			ps.setDouble(4, p.getPrice() );
			ps.setInt(5, p.getStock());
			ps.setString(6, p.getImg_url());
			ps.setString(7, p.getP_desc());
			ps.setInt(8, p.getP_id());
			i=ps.executeUpdate();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		if(i>0) {
			return true;
		}
		else {
			return false;
		}
	}
	
	public boolean deleteProduct(int p_id) {
		String query="delete from products where p_id=?";
		int i=0;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, p_id);
			i=ps.executeUpdate();
		} 
		catch (SQLException e) {
		
			e.printStackTrace();
		}
		if(i>0) {
			return true;
		}
		else {
			return false;
		}
		
	}
	
	public Product getProductById(int p_id) {
		String query="select *  from products where p_id=?";
		ResultSet rs=null;
		Product p=null;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, p_id);
			rs=ps.executeQuery();
			if(rs.next()) {
				p=new Product();
				p.setP_id(rs.getInt(1));
				p.setP_name(rs.getString(2));
				p.setCat_name(rs.getString(3));
				p.setSubCat_id(rs.getInt(4));
				p.setPrice(rs.getDouble(5));
				p.setStock(rs.getInt(6));
				p.setImg_url(rs.getString(7));
				p.setP_desc(rs.getString(8));
			}
		} 
		catch (SQLException e) {
		
			e.printStackTrace();
		}
		return p;
	}
	
	public ArrayList<Product> getProductByName(String p_name) { //doubt
		String query="select *  from products where p_name=?";
		ResultSet rs=null;
		ArrayList<Product> a=new ArrayList<Product>();
		Product p=null;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, p_name);
			rs=ps.executeQuery();
			while(rs.next()) {
				p=new Product();
				p.setP_id(rs.getInt(1));
				p.setP_name(rs.getString(2));
				p.setCat_name(rs.getString(3));
				p.setSubCat_id(rs.getInt(4));
				p.setPrice(rs.getDouble(5));
				p.setStock(rs.getInt(6));
				p.setImg_url(rs.getString(7));
				p.setP_desc(rs.getString(8));
				a.add(p);
			}
		} 
		catch (SQLException e) {
		
			e.printStackTrace();
		}
		return a;
	}
	
	public ArrayList<Product> getProductByCategory(String category_name) { //doubt
		String query="select *  from products where category_name=?";
		ResultSet rs=null;
		ArrayList<Product> a=new ArrayList<Product>();
		Product p=null;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, category_name);
			rs=ps.executeQuery();
			while(rs.next()) {
				p=new Product();
				p.setP_id(rs.getInt(1));
				p.setP_name(rs.getString(2));
				p.setCat_name(rs.getString(3));
				p.setSubCat_id(rs.getInt(4));
				p.setPrice(rs.getDouble(5));
				p.setStock(rs.getInt(6));
				p.setImg_url(rs.getString(7));
				p.setP_desc(rs.getString(8));
				a.add(p);
			}
		} 
		catch (SQLException e) {
		
			e.printStackTrace();
		}
		return a;
	}
	
	public ArrayList<Product> getProductBySubCategory(String subcategoryname) { //doubt
		String query="select *  from products where subcategory_id=(select SUBCATEGORY_ID from subcategory where SUBCATEGORY_NAME=?);";
		ResultSet rs=null;
		ArrayList<Product> a=new ArrayList<Product>();
		Product p=null;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, subcategoryname);
			rs=ps.executeQuery();
			while(rs.next()) {
				p=new Product();
				p.setP_id(rs.getInt(1));
				p.setP_name(rs.getString(2));
				p.setCat_name(rs.getString(3));
				p.setSubCat_id(rs.getInt(4));
				p.setPrice(rs.getDouble(5));
				p.setStock(rs.getInt(6));
				p.setImg_url(rs.getString(7));
				p.setP_desc(rs.getString(8));
				a.add(p);
			}
		} 
		catch (SQLException e) {
		
			e.printStackTrace();
		}
		return a;
	}
	
	public int findsubcatid(String subcatname) {
	    String s = "select SUBCATEGORY_ID from subcategory where SUBCATEGORY_NAME=?";
	    int id = -1;
	    try {
	        PreparedStatement ps = con.prepareStatement(s);
	        ps.setString(1, subcatname);
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            id = rs.getInt("SUBCATEGORY_ID");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return id;
	}

	
	public ArrayList<Product> getProductBySubcategoryid(int id) {
		String query="select *  from products where SUBCATEGORY_ID=?";
		ResultSet rs=null;
		ArrayList<Product> a=new ArrayList<Product>();
		Product p=null;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, id);
			rs=ps.executeQuery();
			while(rs.next()) {
				p=new Product();
				p.setP_id(rs.getInt(1));
				p.setP_name(rs.getString(2));
				p.setCat_name(rs.getString(3));
				p.setSubCat_id(rs.getInt(4));
				p.setPrice(rs.getDouble(5));
				p.setStock(rs.getInt(6));
				p.setImg_url(rs.getString(7));
				p.setP_desc(rs.getString(8));
				a.add(p);
			}
		} 
		catch (SQLException e) {
		
			e.printStackTrace();
		}
		return a;
	}
	
	
	
	public ArrayList<String> getAllCategories() {
	    ArrayList<String> categories = new ArrayList<>();
	    String query = "SELECT DISTINCT CATEGORY_NAME FROM subcategory ORDER BY CATEGORY_NAME";
	    try {
			PreparedStatement ps = con.prepareStatement(query);
			 ResultSet rs = ps.executeQuery();
			    while (rs.next()) {
			        categories.add(rs.getString("CATEGORY_NAME"));
			    }
		} catch (SQLException e) {
			e.printStackTrace();
		}
	   
	    return categories;
	}

	public ArrayList<Integer> getSubcategoryIdsByCategory(String category) {
	    ArrayList<Integer> subcatIds = new ArrayList<>();

	    String sql = "SELECT SUBCATEGORY_ID FROM subcategory WHERE CATEGORY_NAME = ?";
	    try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, category);
		    ResultSet rs = ps.executeQuery();
		    while (rs.next()) {
		        subcatIds.add(rs.getInt("SUBCATEGORY_ID"));
		    }
		} catch (SQLException e) {
			e.printStackTrace();
		}
	    
	    return subcatIds;
	}

	public List<String> getSubcategoriesByCategory(String category) {
	    List<String> subcategories = new ArrayList<>();
	    try {
	        String sql = "SELECT SUBCATEGORY_NAME FROM subcategory WHERE CATEGORY_NAME = ?";
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setString(1, category);
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            subcategories.add(rs.getString("SUBCATEGORY_NAME"));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return subcategories;
	}
	
	public ArrayList<Product> searchProduct(String text)
	{
		ArrayList<Product> al=new ArrayList<>();
		Product p=null;
		String s="select * from products where p_name like ? or SUBCATEGORY_ID in (select SUBCATEGORY_ID from subcategory where SUBCATEGORY_NAME like ?)";
		try {
			PreparedStatement ps=con.prepareStatement(s);
			ps.setString(1,"%"+text+"%");
			ps.setString(2,"%"+text+"%");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				p=new Product();
				p.setP_id(rs.getInt(1));
	            p.setP_name(rs.getString(2));
	            p.setCat_name(rs.getString(3));
	            p.setSubCat_id(rs.getInt(4));
	            p.setPrice(rs.getDouble(5));
	            p.setStock(rs.getInt(6));
	            p.setImg_url(rs.getString(7));
	            p.setP_desc(rs.getString(8));
	            al.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return al;
	}
	
	
}
