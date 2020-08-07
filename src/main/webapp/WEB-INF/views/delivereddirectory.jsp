<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delivered Shipments</title>
</head>
<body>

  <jsp:include page="components/header.jsp"/>

  <!-- Page Content -->
<h2 class="custom_class" >Completed Shipment History</h2>
<h5 class="text-success">${msg23}</h5>
<h4 class="text-success">${done}</h4>
<h4 class="text-success">${undelivered}</h4>
<div class="table-responsive">
<table class="custom_class">
<thead >
<tr >
<th >Tracking Number</th>
<th >PU City</th>
<th >PU State</th>
<th >PU Zip Code</th>
<th >Delivery City</th>
<th >Delivery State</th>
<th >Delivery Zip Code</th>
<th >Req PU Date</th>
<th >Req Delivery Date</th>
<th> Driver</th>
<th> Undeliver</th>
</tr>

</thead>
<tbody>
<c:forEach var="item" items="${shipment}">
<c:if test="${item.delivered=='2'}">
<tr >
<td > <a href="shipmentdetails?shipmentId=${item.shipmentId}"> ${item.shipmentId} </a></td>
<td >${item.oCity}</td>
<td >${item.oState}</td>
<td >${item.oZipCode}</td>
<td >${item.dCity}</td>
<td >${item.dState}</td>
<td >${item.dZipCode}</td>
<td >${item.pickupDate}</td>
<td >${item.deliveryDate}</td>
<td> ${item.driver}</td>
<td align="center"><a
								href="undeliver?shipmentId=${item.shipmentId}"><i
									class="glyphicon glyphicon-repeat"></i></a></td>


<!-- for assign driver data column, make it a drop down of drivers not currently assigned to a shipment.  -->

</tr>
</c:if>
</c:forEach>

</tbody>

</table>
</div>

<script>

function confirmed(){
    if (confirm('You are about to delete, Do you want to proceed?')) {
          document.getElementById("del").submit();
          return true;
    } else {
       return false;
    }
 }
 

 
 </script>

<jsp:include page="components/footer.jsp"/>

</body>

</html>