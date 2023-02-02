<!-- ctrl+shift+s to format -->
<%@page import="com.nitesh.dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="com.nitesh.model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="com.nitesh.connection.DBCon"%>
<%@ page import="com.nitesh.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 	
	User auth=(User)request.getSession().getAttribute("auth");
	if(auth!=null){
		request.setAttribute("auth", auth);
	}
	ArrayList<Cart> cart_list=(ArrayList<Cart>) session.getAttribute("cart-list");
	List<Cart> cartProduct=null;
	if(cart_list!=null){
		ProductDao pDao=new ProductDao(DBCon.getConnection());
		cartProduct=pDao.getCartProducts(cart_list);
		request.setAttribute("cart_list", cart_list);
	}
%>
<!DOCTYPE html>
<html>
<head>
	<title>Cart page</title>
	<%@include file="includes/header.jsp" %>
	<style type="text/css">
		table tbody td{
			vertical-align: middle;
		}
		.btn-incre, .btn-decre{
			box-shadow: none;
			font-size: 25px;
		}
	</style>
</head>
<body>
	<%@include file="includes/navbar.jsp" %>
	<div class="container">
		<div class="d-flex py-3"><h3>Total Price : $5000</h3><a class="mx btn btn-primary" href="">Check Out</a></div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Buy Now</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
			<%
				if(cartProduct!=null){
					for(Cart c:cartProduct){
			%>
			<tr>
				<td><%=c.getName() %></td>
				<td><%=c.getCategory() %></td>
				<td><%=c.getPrice() %></td>
				<td>
					<form action="" method="post" class="form-inline">
						<input type="hidden" name="id" value="<%=c.getId() %>" class="form-input">
						<div class="form-group d-flex justify-content-between">
							<a class="btn btn-sm btn-decre" href=""><i class="fas fa-minus-square"></i></a>
							<input type="text" name="quantity" class="form control" value="1" readonly>
							<a class="btn btn-sm btn-incre" href=""><i class="fas fa-plus-square"></i></a>
						</div>
					</form>
				</td>
				<td>
					<a class="btn btn-sm btn-danger" href="">Remove</a>
				</td>
			</tr>			
			<%	
					}
				}
			%>
			
			</tbody>
		
		</table>
	</div>
	<%@include file="includes/footer.jsp" %>
</body>
</html>