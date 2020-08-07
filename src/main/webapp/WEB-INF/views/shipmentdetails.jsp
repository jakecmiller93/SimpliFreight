<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="canonical" href="https://html5-templates.com/" />
    <title>${shipmentId} Details</title>
	<meta name="description" content="A minimalist Bootstrap theme by StartBootstrap. Contains everything you need to get started building your website. All you have to do is change the text and images.">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/modern-business.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="static/css/custom.css" rel="stylesheet" type="text/css"> 
	<link href="static/css/custom2.css" rel="stylesheet" type="text/css">

</head>
<body>
<div class="details">
  <jsp:include page="components/header.jsp"/>
  
   <h3 class="custom_class" >${shipmentdeets}</h3>
 	<h4>Driver Assigned: ${driver}</h4>
  <table class="custom_class2">
  <thead>
  <tr>
  <th>Origin Information</th>
  <th>Destination Information</th>
  <th>Shipment Details</th>
  </tr>
  </thead>
  <tbody>
  <tr>
  <td>Name: ${oName}</td>
  <td>Name: ${dName}</td>
  <td>Pallet Count:  ${palletCount}</td>
 </tr>
 <tr>
  <td>Address: ${oStreetAddress}</td>
  <td>Address: ${dStreetAddress}</td>
  <td>Weight:  ${weight}</td>
  </tr>
  
   <tr>
  <td>City: ${oCity}</td>
  <td>City: ${dCity}</td>
  <td>PU Date:  ${pickupDate}</td>
  </tr>
  
     <tr>
  <td>State: ${oState}</td>
  <td>State: ${dState}</td>
  <td>Del. Date:  ${deliveryDate}</td>
  </tr>
  
       <tr>
  <td>Zip: ${oZipCode}</td>
  <td>Zip: ${dZipCode}</td>
  <td>Rate:  $${rate}</td>
  </tr>
  
  
  </tbody>
  </table>
  
<br>
<br>
<%--   <h3>${shipmentdeets}</h3>
	<h3>Origin:</h3>
	<p>${oName}</p>
	<p>${oStreetAddress}</p>
	<p>${oCity}, ${oState}  ${oZipCode}</p>
	<h3>Destination:</h3>
	<p>${dName}</p>
	<p>${dStreetAddress}</p>
	<p>${dCity}, ${dState}  ${dZipCode}</p>
	<h3>Shipment Details</h3>
	<p>Pallet Count: ${palletCount}</p>
	<p>Weight: ${weight}</p>
	<p>Pickup Date: ${pickupDate}</p>
	<p>Delivery Date: ${deliveryDate}</p>
	<p>Rate: $${rate}</p>
	<p>Driver Assigned: ${driver}</p> --%>
	

</div>

<jsp:include page="components/footer.jsp"/>
</body>

</html>