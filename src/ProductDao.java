package com.nitesh.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.nitesh.model.Cart;
import com.nitesh.model.Product;

public class ProductDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	public ProductDao(Connection con) {
		this.con=con;
		// TODO Auto-generated constructor stub
	}
	public List<Product> getAllProducts(){
		List<Product> products = new ArrayList<Product>();
		try {
			query="select* from products";
			pst=con.prepareStatement(query);
			rs=pst.executeQuery();
			while(rs.next()) {
				Product row=new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));
				
				products.add(row);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return products;
	}
	
	public List<Product> getProductByCategory(String category){
		List<Product> products = new ArrayList<Product>();
		try {
			query="select * from products where category=?";
			pst=con.prepareStatement(query);
			pst.setString(1,category);
			rs=pst.executeQuery();
			while(rs.next()) {
				Product row=new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));
				
				products.add(row);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return products;
	}
	
	public List<String> getCategories(){
		List<String> categories = new ArrayList<String>();
		try {
			query="select distinct category from products";
			pst=con.prepareStatement(query);
			rs=pst.executeQuery();
			while(rs.next()) {
				String category=new String();
				category=(String) rs.getString("category");
				categories.add(category);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return categories;
	}
	
	public List<Cart> getCartProducts(ArrayList<Cart> cartList){
		List<Cart> products=new ArrayList<Cart>();
		try {
			if(cartList.size()>=0) {
				for(Cart item:cartList) {
					query="select * from shopping_cart.products where id=?";
					pst=this.con.prepareStatement(query);
					pst.setInt(1, item.getId());
					rs=pst.executeQuery();
					while(rs.next()) {
						Cart row=new Cart();
						row.setId(rs.getInt("id"));
						row.setName(rs.getString("name"));
						row.setCategory(rs.getString("category"));
						row.setPrice(rs.getDouble("price")*item.getQuantity());
						row.setQuantity(item.getQuantity());
						products.add(row);
					}
				}
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return products;
		
	}
}
