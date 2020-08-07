<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>

</head>

<body>
 <jsp:include page="components/header.jsp"/>
<div class="box">
	<div class="box2">
		<h3>Create New User</h3>
		
		
		
		<p class="lead">${msg} </p>
		<h4 class="text-danger">${error}</h4>
		<h4 class="text-danger">${errors}</h4>
		<hr>
		<form:form action="register" modelAttribute="users" method="post">
		
			<div class="form-group">
			<label for="firstName">First Name</label>
			<form:errors path="firstName" class="text-danger text-center"/>
			<form:input path="firstName" class="form-control" placeholder="First Name"/>
			
			</div>
			
			<div class="form-group">
			<label for="lastName">Last Name</label>
			<form:errors path="lastName" class="text-danger text-center"/>
			<form:input path="lastName" class="form-control" placeholder="Last Name"/>
			</div>
				
			<div class="form-group">
			<label for="email">Email </label>
			<form:errors path="email" class="text-danger text-center"/>
			<form:input path="email"  type="email" class="form-control" placeholder="Email Address"/>
			</div>
			
			<div class="form-group">
			<label for="password">Password </label>
			<form:errors path="password" class="text-danger text-center"/>
			<form:input path="password" type="password" class="form-control" placeholder="Password"/>
			</div>
			
			<div class="form-group">
			<label for="password2">Confirm Password </label>
			<form:errors path="password2" class="text-danger text-center"/>
			<form:input path="password2" type="password"  class="form-control" placeholder="Confirm Password"/>
			</div>
			
			<div class="text-center">
			<button type="submit" class="btn btn-primary"><i class="fa fa-user-md"></i>Create User</button>
			</div>
			
			</form:form>
	</div>
</div>

<jsp:include page="components/footer.jsp"/>

</body>

</html>
    