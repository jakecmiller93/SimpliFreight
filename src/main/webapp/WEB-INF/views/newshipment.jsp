<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>New Shipment</title>


</head>

<body>

 <jsp:include page="components/header.jsp"/>
<h2>${tracking}</h2>

<div class="form-group mb-2">
	<div class="form-group mb-2">
	
		
		
	  <form:form action="shipTo" modelAttribute="shipment" method="post" class="form-inline">  
			<div class="form-group column24 middle24">
			<h3>Origin Information</h3>
			
			<div class="form-group">
			<label for="oName">Shipper Name </label>
			<form:input path="oName" type="text" class="form-control" placeholder="Company Name"/>
			</div>
			
			<div class="form-group">
			<label for="oStreetAddress">Street Address </label>
			<form:input path="oStreetAddress" type="text" class="form-control" placeholder="Street Address"/>
			</div>
	
			<div class="form-group">
			<label for="oCity">City</label>
			<form:input path="oCity" type="text" class="form-control" placeholder="City"/>
			</div>
	
		<!--  Change to dropdown menu of states -->
			<div class="form-group">
			<label for="oState">State</label>
			<select class="form-control" name="oState">
				<option value="AL">Alabama</option>
				<option value="AK">Alaska</option>
				<option value="AZ">Arizona</option>
				<option value="AR">Arkansas</option>
				<option value="CA">California</option>
				<option value="CO">Colorado</option>
				<option value="CT">Connecticut</option>
				<option value="DE">Delaware</option>
				<option value="DC">District Of Columbia</option>
				<option value="FL">Florida</option>
				<option value="GA">Georgia</option>
				<option value="HI">Hawaii</option>
				<option value="ID">Idaho</option>
				<option value="IL">Illinois</option>
				<option value="IN">Indiana</option>
				<option value="IA">Iowa</option>
				<option value="KS">Kansas</option>
				<option value="KY">Kentucky</option>
				<option value="LA">Louisiana</option>
				<option value="ME">Maine</option>
				<option value="MD">Maryland</option>
				<option value="MA">Massachusetts</option>
				<option value="MI">Michigan</option>
				<option value="MN">Minnesota</option>
				<option value="MS">Mississippi</option>
				<option value="MO">Missouri</option>
				<option value="MT">Montana</option>
				<option value="NE">Nebraska</option>
				<option value="NV">Nevada</option>
				<option value="NH">New Hampshire</option>
				<option value="NJ">New Jersey</option>
				<option value="NM">New Mexico</option>
				<option value="NY">New York</option>
				<option value="NC">North Carolina</option>
				<option value="ND">North Dakota</option>
				<option value="OH">Ohio</option>
				<option value="OK">Oklahoma</option>
				<option value="OR">Oregon</option>
				<option value="PA">Pennsylvania</option>
				<option value="RI">Rhode Island</option>
				<option value="SC">South Carolina</option>
				<option value="SD">South Dakota</option>
				<option value="TN">Tennessee</option>
				<option value="TX">Texas</option>
				<option value="UT">Utah</option>
				<option value="VT">Vermont</option>
				<option value="VA">Virginia</option>
				<option value="WA">Washington</option>
				<option value="WV">West Virginia</option>
				<option value="WI">Wisconsin</option>
				<option value="WY">Wyoming</option>
			</select>				
			</div>
			
			<div class="form-group">
			<label for="oZipCode">Zip Code </label>
			<form:errors path="oZipCode" class="text-danger text-center"/>
			<form:input path="oZipCode" type="text" class="form-control" placeholder="Zip Code"/>
			</div>
			</div>
				<div class="form-group column24 middle24">
				<h3>Destination Information</h3>
				<div class="form-group">
			<label for="dName">Receiver Name </label>
			<form:input path="dName" type="text" class="form-control" placeholder="Company Name"/>
			</div>
				
				
			<div class="form-group">
			<label for="dStreetAddress">Street Address </label>
			<form:input path="dStreetAddress" type="text" class="form-control" placeholder="Street Address"/>
			</div>
	
			<div class="form-group">
			<label for="dCity">City</label>
			<form:input path="dCity" type="text" class="form-control" placeholder="City"/>
			</div>
	
		<!--  Change to dropdown menu of states -->
			<div class="form-group">
			<label for="dState">State</label>
			<select class="form-control" name="dState">
				<option value="AL">Alabama</option>
				<option value="AK">Alaska</option>
				<option value="AZ">Arizona</option>
				<option value="AR">Arkansas</option>
				<option value="CA">California</option>
				<option value="CO">Colorado</option>
				<option value="CT">Connecticut</option>
				<option value="DE">Delaware</option>
				<option value="DC">District Of Columbia</option>
				<option value="FL">Florida</option>
				<option value="GA">Georgia</option>
				<option value="HI">Hawaii</option>
				<option value="ID">Idaho</option>
				<option value="IL">Illinois</option>
				<option value="IN">Indiana</option>
				<option value="IA">Iowa</option>
				<option value="KS">Kansas</option>
				<option value="KY">Kentucky</option>
				<option value="LA">Louisiana</option>
				<option value="ME">Maine</option>
				<option value="MD">Maryland</option>
				<option value="MA">Massachusetts</option>
				<option value="MI">Michigan</option>
				<option value="MN">Minnesota</option>
				<option value="MS">Mississippi</option>
				<option value="MO">Missouri</option>
				<option value="MT">Montana</option>
				<option value="NE">Nebraska</option>
				<option value="NV">Nevada</option>
				<option value="NH">New Hampshire</option>
				<option value="NJ">New Jersey</option>
				<option value="NM">New Mexico</option>
				<option value="NY">New York</option>
				<option value="NC">North Carolina</option>
				<option value="ND">North Dakota</option>
				<option value="OH">Ohio</option>
				<option value="OK">Oklahoma</option>
				<option value="OR">Oregon</option>
				<option value="PA">Pennsylvania</option>
				<option value="RI">Rhode Island</option>
				<option value="SC">South Carolina</option>
				<option value="SD">South Dakota</option>
				<option value="TN">Tennessee</option>
				<option value="TX">Texas</option>
				<option value="UT">Utah</option>
				<option value="VT">Vermont</option>
				<option value="VA">Virginia</option>
				<option value="WA">Washington</option>
				<option value="WV">West Virginia</option>
				<option value="WI">Wisconsin</option>
				<option value="WY">Wyoming</option>
			</select>				
			</div>
			
			<div class="form-group">
			<label for="dZipCode"> Zip Code </label>
			<form:errors path="dZipCode" class="text-danger text-center"/>
			<form:input path="dZipCode" type="text" class="form-control" placeholder="Zip Code"/>
			</div>
			</div>
			
			<div class="form-group column24 right24">
			<h3>Shipment Details</h3>
			
			<div class="form-group">
			<label for="palletCount"> Pallet       Count      </label>
			<form:input path="palletCount" type="text" class="form-control" placeholder="# of Pallets"/>
			</div>
			
			<div class="form-group">
			<label for="weight">   Weight      (lbs)    </label>
			<form:input path="weight" type="text" class="form-control" placeholder="Total Weight"/>
			</div>
			
			<div class="form-group">
			<label for="pickupDate"> Requested PU Date</label>
			<form:input path="pickupDate" type="date" class="form-control" placeholder=""/>
			</div>
			
			<div class="form-group">
			<label for="deliveryDate"> Requested Delivery Date </label>
			<form:input path="deliveryDate" type="date" class="form-control" placeholder=""/>
			</div>
			
			<br>
			<br>
			
			
			<div class="text-center">
			<button type="submit" class="btn btn-primary">Create Shipment</button>
			</div>
			</div>
			</form:form>  
	</div>
</div>

<jsp:include page="components/footer.jsp"/>

</body>

</html>