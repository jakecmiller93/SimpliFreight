<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="ISO-8859-1">
<title>Open Shipments</title>
</head>
<body class="custom_class">/


	<jsp:include page="components/header.jsp" />

	<!-- Page Content -->
	<h2 class="custom_class" >Open Shipments</h2>
	<h5 class="text-success">${msg23}</h5>
	<h4 class="text-success">${done}</h4>
	<h4 class="text-success">${success}</h4>
	<input class="searchBar custom_class" name="openShip" type="text"
		name="keyword" id="searchship" placeholder="Search"
		class="form-control">
	<div class="table-responsive">
		<table class="table-sortable custom_class" id="results">

			<thead>
				<tr>
					<th>Tracking Number</th>
					<th>PU City</th>
					<th>PU State</th>
					<th>PU Zip Code</th>
					<th>Delivery City</th>
					<th>Delivery State</th>
					<th>Delivery Zip Code</th>
					<th>Req PU Date</th>
					<th>Req Delivery Date</th>
					<th>Delivered?</th>
					<th>Delete/Edit</th>
					<th>Assign a Driver</th>

				</tr>

			</thead>
			<tbody>

				<c:forEach var="item" items="${shipment}">
					<c:if test="${item.delivered=='1'}">
						<tr>
							<td><a href="shipmentdetails?shipmentId=${item.shipmentId}">
									${item.shipmentId} </a></td>
							<td>${item.oCity}</td>
							<td>${item.oState}</td>
							<td>${item.oZipCode}</td>
							<td>${item.dCity}</td>
							<td>${item.dState}</td>
							<td>${item.dZipCode}</td>
							<td>${item.pickupDate}</td>
							<td>${item.deliveryDate}</td>



							<td align="center"><a
								href="setdelivered?shipmentId=${item.shipmentId}"><i
									class="glyphicon glyphicon-saved"></i></a></td>
							<td align="center"><a
								href="deleteShipment?shipmentId=${item.shipmentId}"
								onclick="confirmed(); return false;"><i
									class="glyphicon glyphicon-trash"></i></a> <a
								href="editShipment?shipmentId=${item.shipmentId}"><i
									class="glyphicon glyphicon-pencil"></i></a></td>

							<td>

								<form action="assigndriver" method="post">


									<input type="hidden" name="shipmentId"
										value="${item.shipmentId}"> <select name="driverId"
										class="form-control" onchange="this.form.submit()">
										<!-- try to only show as blank if a driver has not been assigned.  -->
										<option value="${item.driver}">${item.driver}</option>
										<c:forEach var="item" items="${drivers}">
											<option value="${item.driverId}">${item.driverId}-
												${item.firstName} ${item.lastName}</option>
										</c:forEach>
									</select>

								</form>


							</td>


							<!-- for assign driver data column, make it a drop down of drivers not currently assigned to a shipment.  -->

						</tr>
					</c:if>
				</c:forEach>

			</tbody>

		</table>
	</div>

	<!-- <script  src="static/js/tablesort.js"> -->

	<script>
		function confirmed() {
			if (confirm('You are about to delete, Do you wish to proceed?')) {
				document.getElementById("del").submit();
				return true;
			} else {
				return false;
			}
		}

		$("#searchship").keyup(function() {
			var value = this.value.toLowerCase().trim();

			$("table tr").each(function(index) {
				if (!index)
					return;
				$(this).find("td").each(function() {
					var id = $(this).text().toLowerCase().trim();
					var not_found = (id.indexOf(value) == -1);
					$(this).closest('tr').toggle(!not_found);
					return not_found;
				});
			});
		});
		//////////////
		function convertDate(d) {
			var p = d.split("-");
			return +(p[2] + p[1] + p[0]);
		}

		function sortByDate() {
			var tbody = document.querySelector("#results tbody");
			// get trs as array for ease of use
			var rows = [].slice.call(tbody.querySelectorAll("tr"));

			rows.sort(function(a, b) {
				return convertDate(a.cells[7].innerHTML)
						- convertDate(b.cells[7].innerHTML);
			});

			rows.forEach(function(v) {
				tbody.appendChild(v); // note that .appendChild() *moves* elements
			});
		}

		document.querySelector("button").addEventListener("click", sortByDate);
	</script>
	<jsp:include page="components/footer.jsp" />

</body>

</html>