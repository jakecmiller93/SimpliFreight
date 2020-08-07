<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Get Quote</title>

</head>

<body>
<p>${msgq}</p>
 <jsp:include page="components/header.jsp"/>
 

<div class="form-row align-items-center">
	<h2 class="custom_class">Get Quote</h2>
	<h4 class="custom_class"> ${amount} <span class="custom_class">${amount2}  </span> </h4>
	<h4 class="custom_class">${quoteID1} <span class="custom_class">${quoteID2}</span>${quoteID3}</h4>
	<div class="box" class="form-row">
	
	
	
		
		<p class="lead">${contactinfo} </p>
		<h4 class="text-danger">${error}</h4>
		<form:form action="getQuote2" modelAttribute="quote" method="post">
		
	
			
			<div class="form-group">
			<label for="oZipCode">Origin Zip Code </label>
			<form:input path="oZipCode" type="text" class="form-control" placeholder="origin zip"/>
			</div>
			

			
			<div class="form-group">
			<label for="dZipCode">Destination Zip Code </label>
			<form:input path="dZipCode" type="text" class="form-control" placeholder="destination zip"/>
			</div>
			
			
			
			<div class="form-group">
			<label for="palletCount">Pallet Count</label>
			<form:input path="palletCount" type="text" class="form-control" placeholder="# of Pallets"/>
			</div>
			
			<div class="form-group">
			<label for="weight">Total Weight (lbs) </label>
			<form:input path="weight" type="text" class="form-control" placeholder="Total Weight"/>
			</div>
			
			
			<div class="text-center">
			<button type="submit" class="btn btn-primary">Get Quote</button>
			</div>

			</form:form>
			

	</div>

</div>



<jsp:include page="components/footer.jsp"/>
</body>

</html>