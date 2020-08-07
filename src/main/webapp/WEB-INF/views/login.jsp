<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="static/css/custom2.css" rel="stylesheet" type="text/css">
<meta charset="ISO-8859-1">
<title>Login Page</title>
</head>
<body style="background-image: url('static/images/back.jpg');">
 <jsp:include page="components/header.jsp"/>
 <h3 class="text-danger">${error}</h3>
<h2>${msg}</h2>
<h2>${msg22}</h2>
<div class="limiter">
<div class="container-login100">
<div class="wrap-login100 p-t-30 p-b-50">
<span class="login100-form-title p-b-41">

</span>

  		<div class="login-form">
				<h2 style="color: white;" > Please Login</h2>
					
					
				<ul class="form">
				<form action="login" method="post">
					<li>
					<input type="text" name="email" class="email" placeholder="Email" required=""/><a href="#" class=" icon user"></a>
					</li>
					<li>
						<input type="password" name="password" class="password" placeholder="Password" required=""/><a href="#" class=" icon lock"></a>
					</li>
						
								<div class="w3_log">
								<input type="submit" value="LOGIN">
								</div>
							<div class="clear"> </div>
					
					</form>
				</ul>
				
	
					<div class="clear"> </div>
				</div>
 <!--/SIGN UP-->

</div>
</div>
</div>
<div id="dropDownSelect1"></div>

</html>