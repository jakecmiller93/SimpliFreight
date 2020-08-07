
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en" class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="canonical" href="https://html5-templates.com/" />
<title>TMS</title>
<meta name="description"
	content="A minimalist Bootstrap theme by StartBootstrap. Contains everything you need to get started building your website. All you have to do is change the text and images.">
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/modern-business.css" rel="stylesheet">
<link href="static/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="static/css/custom.css" rel="stylesheet" type="text/css">
<link href="static/css/tablesort.css" rel="stylesheet" type="text/css">

</head>


<!--  class="navbar navbar-inverse navbar-fixed-top" -->

<!-- Navigation -->
<nav class="custom_class" role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="home"><img height="28px"
				width="285px" src="static/images/Logo3.png"></a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<c:choose>
					<c:when test="${empty loggedInuser}">

						<li><a class="custom_class"  href="login">Login</a></li>

						<li><a class="custom_class" href="contact">Contact</a></li>
						<!-- <li><a href="about">About Us</a></li> -->

					</c:when>
					<c:otherwise>

						<li><a class="custom_class" href="logout">Logout</a></li>

						<li><a class="custom_class" href="profile">Profile </a></li>
						<li><a class="custom_class" href="adddriver">Add Driver</a></li>

						<li><a class="custom_class" href="driverdirectory">Driver Directory</a></li>
						
						<li class="dropdown"><a class="custom_class" href="#" class="dropdown-toggle"
								data-toggle="dropdown"> Shipments <b class="caret"></b></a>
								<ul class="dropdown-menu">
									<li><a class="custom_class" href="newshipment">Create a New Shipment</a></li>
									<li><a class="custom_class" href="openshipmentdirectory">Open Shipments</a></li>
									<li><a class="custom_class" href="delivereddirectory">Delivered Shipments</a></li>

								</ul></li>

						<c:if test="${role eq 'ADMIN' }">



							<li><a class="custom_class" href="userdirectory">User Directory</a></li>


							<li><a class="custom_class" href="register">Add User</a></li>

							



						</c:if>


					</c:otherwise>

				</c:choose>



				<li><a class="custom_class" href="quote">Get Quote</a></li>



			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- jQuery -->
	<script src="static/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="static/js/bootstrap.min.js"></script>
</nav>