//package com.ecobasketry.model.dao;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.ArrayList;
//
//import jakarta.servlet.http.HttpSession;
//
//import com.ecobasketry.model.Connection.Connectors;
//import com.ecobasketry.model.dto.Customer;
//import com.ecobasketry.model.dto.OrderItem;
//import com.ecobasketry.model.dto.Orders;
//
//public class OrdersDAO {
//	private Connection con;
//    private HttpSession session;	
//
//    public OrdersDAO(HttpSession session) {
//        this.con = Connectors.requestConnection();
//        this.session = session;
//    }
//    
//    public boolean addOrders(Orders o)
//    {
//    	String s="insert into orders values(0,?,?,?,now(),?,?,?,?,?)";
//    	Customer c = (Customer) session.getAttribute("user");
//    	try {
//    		int id=c.getUser_id();
//    		String name=c.getName();
//			PreparedStatement ps=con.prepareStatement(s);
//			ps.setInt(1, id);
//			ps.setString(2, name);
//			ps.setDouble(3,o.getTotal_cost());
//			ps.setString(4, "pending");
//			ps.setString(5,o.getO_address());
//			ps.setString(6,o.getO_city());
//			ps.setString(7, o.getO_state());
//			ps.setInt(8, o.getPin());
//			return ps.executeUpdate()>0;
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//    	return false;
//    }
//    
//    public ArrayList<Orders> getAllOrders()
//    {
//    	return null;
//    }
//    
//    
//    public ArrayList<Orders> getOrdersByUser()
//    {
//    	ArrayList<Orders> al=new ArrayList<>();
//    	Integer userId = (Integer) session.getAttribute("u_id");
//    	Orders o=null;
//    	if (userId == null) {
//            return al;
//        }
//    	String s="select * from orders where u_id=?";
//    	try {
//			PreparedStatement ps=con.prepareStatement(s);
//			ps.setInt(1, userId);
//			ResultSet rs=ps.executeQuery();
//			while(rs.next())
//			{
//				o=new Orders();
//				
//				
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//    	return al;
//    }
//    
//    /*
//    public boolean updateOrderStatus(int orderId, String status);
//    {
//    	String s="update orders set status=";
//    }
//    */
//}
