<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit User</title>

</head>

<body>
 <jsp:include page="components/header.jsp"/>
<div class="col-lg-2">
	<div class="box">
		<h1>Edit Account</h1>
		
		<a  href="userdirectory">View All Users</a>
		
		<p class="lead">${msg} ${message} </p>
		<h4 class="text-danger">${error}</h4>
		<h4 class="text-danger">${errors}</h4>
		<hr>
		<form:form action="updateUsers" modelAttribute="user" method="post">
		<form:input type="hidden" path="id" class="form-control"/>
		
			<div class="form-group">
			<label for="firstName">First Name</label>
			<form:input path="firstName" class="form-control" placeholder="First Name"/>
			</div>
			
			<div class="form-group">
			<label for="lastName">Last Name</label>
			<form:input path="lastName" class="form-control" placeholder="Last Name"/>
			</div>
				
			<div class="form-group">
			<label for="role">Role</label>
				<form:select path="role"  class="form-control">
				<option value="USER">USER</option>
				<option value="ADMIN">ADMIN</option>
				</form:select>
	
			</div>
			
			<div class="text-center">
			<button type="submit" class="btn btn-primary"><i class="fa fa-user-md"></i>Save</button>
			</div>
			
			</form:form>
	</div>
</div>

<jsp:include page="components/footer.jsp"/>

</body>

</html>
    