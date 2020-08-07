<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Driver Directory</title>
</head>
<body class="bgi">

	<jsp:include page="components/header.jsp" />

	<!-- Page Content -->
	<h2 class="custom_class" >Driver Directory</h2>
	<h3 align="center" class="text-success" >${success}</h3>
	<h4 align="center">${msg23}</h4>
	<div class="table-responsive">
		<table class="custom_class">
			<thead>
				<tr>
					<th>Driver ID</th>
					<th>Name</th>
					<th>Email</th>
					<th>Telephone</th>
					<th>Truck Number</th>
					<th>Edit Delete</th>
	
				</tr>

			</thead>
			<tbody>
				<c:forEach var="item" items="${drivers}">
					<tr>
						<td>${item.driverId}</td>
						<td>${item.firstName}  ${item.lastName}</td>
						<td>${item.email}</td>
						<td>${item.telephone}</td>
						<td>${item.truckNumber}</td>
						<td align="center"><a
							href="deleteDriver?driverId=${item.driverId}"
							onclick="confirmed(); return false;"><i
								class="glyphicon glyphicon-trash"></i></a> <a
							href="editDriver?driverId=${item.driverId}"><i
								class="glyphicon glyphicon-pencil"></i></a></td>


					</tr>
				</c:forEach>

			</tbody>

		</table>
	</div>
<script>

function confirmed() {
	if (confirm('You are about to delete, Do you wish to proceed?')) {
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