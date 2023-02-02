<%@page import="com.nitesh.model.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.nitesh.dao.ProductDao"%>
<%@ page import="com.nitesh.connection.DBCon"%>
<%@ page import="com.nitesh.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}
ProductDao pdao=new ProductDao(DBCon.getConnection());
List<Product> products=pdao.getAllProducts();
%>
<!DOCTYPE html>
<html>
<head>
<title>Welcome</title>
<%@include file="includes/header.jsp"%>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>
	<div class="mainbox" style="display:flex">
	<div class="card-header my-3">Categories</div>
	<div class="categories" style="width:20%; height:100px">
		<a href="">Shoes</a><br>
		<a href="">Bags</a><br>
		<a href="">Clothes</a><br>
		<a href="">Electronics</a>
	</div>
	<div class="container" style="width:80%; height:100px">
		<div class="card-header my-3">All Products</div>
		<div class="row">
			<%
				if(!products.isEmpty()){
					for(Product p:products){
			%>	
						<div class="col-md-3 my-3">
							<div class="card w-100" style="width: 18rem;">
								<img class="card-img-top" src="product_images/female-shoes.jpg" alt="Card image cap">
									<div class="card-body">
										<h5 class="card-title"><%= p.getName() %></h5>
										<h6 class="price">Price : $<%= p.getPrice() %></h6>
										<h6 class="category">Category : <%= p.getCategory() %></h6>
										<div class="mt-3 d-flex justify-content-between">
											<a href="add-to-cart?id=<%= p.getId() %>" class="btn btn-dark">Add to Cart</a>
											<a href="#" class="btn btn-primary">Buy Now</a>
										</div>
									</div>
							</div>
						</div>
			<%		}
				}
			%>
			
		</div>
	</div>
	</div>
	<%@include file="includes/footer.jsp"%>
</body>
</html>