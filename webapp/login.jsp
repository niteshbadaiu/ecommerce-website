<%@ page import="com.nitesh.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 	
	User auth=(User)request.getSession().getAttribute("auth");
	if(auth!=null){
		response.sendRedirect("index1.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
	<title>Login</title>
	<%@include file="includes/header.jsp" %>
</head>
<body>
	<%@include file="includes/navbar.jsp" %>
	<div class="container">
		<div class="card w-50 mx-auto my-5">
		<div class="card-header text-center">User Login</div>
		<div class="card-body">
			<form action="LoginServlet" method="post">
				<div class="form-group">
					<label>Email Address</label>
					<input type="email" class="form-control" name="login-email" placeholder="Enter Your Email" required>
					<label>Password</label>
					<input type="password" class="form-control" name="login-password" placeholder="*********" required>
				</div>
				<div class="text-center">
					<button type="submit" class="btn btn-primary">Login</button>
				</div>
			</form>
		</div>
		</div>
	</div>
	<%@include file="includes/footer.jsp" %>
</body>
</html>