<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Directory</title>

</head>
<body>

  <jsp:include page="components/header.jsp"/>

  <!-- Page Content -->
<h2 class="custom_class" >User Directory</h2>
<h4 class="text-success text-center" >${msg2}   ${success}</h4>
<input class="searchBar" name="fname" type="text" name="keyword" id="searchnow" placeholder="Search Table" class="form-control">
<div class="table-responsive">
<table class="table">

<thead>
<tr>
<th>ID</th>
<th>Name</th>
<th>Email</th>
<th>Role</th>
<th>Remove/Edit</th>

</tr>

</thead>
<tbody>
<c:forEach var="item" items="${users}">
<tr>
<td>${item.id}</td>
<td>${item.firstName}  ${item.lastName}</td>
<td>${item.email}</td>
<td>
<form action="editrole" method="post">
	<input type="hidden" name="id" value="${item.id}">
	<select name="role" class="form-control" onchange="this.form.submit()">
	<option value="${item.role}"> ${item.role}</option>
	<option value="USER">USER</option>
	<option value="ADMIN">ADMIN</option>
	</select>
</form>
</td>
<td>
<c:if test="${item.email ne loggedInuser}">
<a href="deleteUser?id=${item.id}" onclick="confirmed(); return false;"><i class="fa fa-trash"></i></a>
</c:if>
	<a href="editeUsers?id=${item.id}"><i class="fa fa-edit"></i></a>
</td>

</tr>
</c:forEach>

</tbody>

</table>
</div>


    <!-- JavaScript files-->
    <script src="static/vendor/jquery/jquery.min.js"></script>
    <script src="static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="static/vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="static/vendor/owl.carousel/owl.carousel.min.js"></script>
    <script src="static/vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.js"></script>
    <script src="static/js/bootstrap.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <script src="static/js/contact_me.js"></script>
    <script src="static/js/jqBootstrapValidation.js"></script>
    <script src="static/js/jquery.js"></script>
    <script src="static/js/front.js"></script>


<script>

function confirmed(){
    if (confirm('You are about to delete, Do you want to proceed?')) {
          document.getElementById("del").submit();
          return true;
    } else {
       return false;
    }
 }
    
$("#searchnow").keyup(function () {
var value = this.value.toLowerCase().trim();

$("table tr").each(function (index) {
    if (!index) return;
    $(this).find("td").each(function () {
        var id = $(this).text().toLowerCase().trim();
        var not_found = (id.indexOf(value) == -1);
        $(this).closest('tr').toggle(!not_found);
        return not_found;
    });
});
});

</script>
<jsp:include page="components/footer.jsp"/>

</body>

</html>