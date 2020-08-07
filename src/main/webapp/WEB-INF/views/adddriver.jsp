<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Driver</title>

</head>

<body>
 <jsp:include page="components/header.jsp"/>
<div class="box">
	<div class="box">
		<h2 class="custom_class" >Add New Driver</h2>
		<p class="lead">${msg} </p>
		
		<h4 class="text-danger">${error}</h4>
		<hr>
		<a  href="driverdirectory">  <h4>View All Drivers  </h4>  </a>
		<form:form action="adddriver" modelAttribute="driver" method="post">
		
			<div class="form-group">
			<label for="firstName">First Name</label>
			<form:input path="firstName" class="form-control" placeholder="First Name"/>
			</div>
			
			<div class="form-group">
			<label for="lastName">Last Name</label>
			<form:input path="lastName" class="form-control" placeholder="Last Name"/>
			</div>
			
			<div class="form-group">
			<label for="telephone">Phone Number (xxx)xxx-xxxx</label>
			<form:errors path="telephone" class="text-danger text-center"/>
			<form:input path="telephone" class="form-control" placeholder="Telephone"/>
			</div>
			
				
			<div class="form-group">
			<label for="email">Email </label>
			<form:input path="email"  type="email" class="form-control" placeholder="Email Address"/>
			</div>
			
			<div class="form-group">
			<label for="truckNumber">Truck Number </label>
			<form:input path="truckNumber" type="text" class="form-control" placeholder="Truck Number"/>
			</div>
			
			
			<div class="text-center">
			<button type="submit" class="btn btn-primary"><i class="fa fa-user-md"></i>Add Driver to Database</button>
			</div>
			
			</form:form>
	</div>
</div>

<jsp:include page="components/footer.jsp"/>

</body>

</html>