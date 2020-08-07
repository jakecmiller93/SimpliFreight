<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile Page</title>
</head>
<body>

  <jsp:include page="components/header.jsp"/>
<br>
<br>
  <h1 style="text-align:center">${message}</h1>
  
	<h1 style="text-align:center">${msg} </h1>
	
	
	<h4 style="text-align:center">Logged in as: ${loggedInuser}</h4>
	<h4 style="text-align:center">First Name: ${user_account.firstName}</h4>
	<h4 style="text-align:center">Last Name: ${user_account.lastName}</h4>
	<h4 style="text-align:center">Role:  ${role}</h4>
	<br>	
	
	
	
	<!-- 
	<div class="col-md-9 col-lg-10">
	
	
	
	<br>
	<h4> Update Personal Information: </h4>
	<h5 class="text-success">${success}</h5>
	<br>
			</div>

                <form action="updateprofile" action="post" class="col-md-6">
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="firstname">First Name</label>
                        <input name="firstName" id="firstname" type="text" class="form-control">
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="lastname">Last Name</label>
                        <input name="lastName" id="lastname" type="text" class="form-control">
                      </div>
                    </div>
                  </div>
                  
                	<div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="email">Email</label>
                        <input name="email" id="email" type="email" class="form-control">
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="password">Password</label>
                        <input name="password" id="password" type="text" class="form-control">
                      </div>
                    </div>
                  </div>
                 <button type="submit" class="btn btn-primary">Update Info</button>
                </form>         
                -->    
                
                <jsp:include page="components/footer.jsp"/>
     
</body>

</html>