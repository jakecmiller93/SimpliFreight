<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="canonical" href="https://html5-templates.com/" />
    <title>SimpliFreight Home</title>
	<meta name="description" content="A minimalist Bootstrap theme by StartBootstrap. Contains everything you need to get started building your website. All you have to do is change the text and images.">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/modern-business.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="static/css/custom.css" rel="stylesheet" type="text/css"> 
	<link href="static/css/custom2.css" rel="stylesheet" type="text/css"> 
</head>
 <jsp:include page="components/header.jsp"/>

 
<body style="background-image: url('static/images/back3.jpg')">
<br>

  	<h3 class="text-success">${message} </h3>
  	<h3 class="text-danger">${errors} </h3>
  	<h3 class="text-danger">${msg123}</h3>
  	<h3 class="text-success">${yes}</h3>
   
   
            <!-- 
                
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i> Get Quotes </h4>
                    </div>
                    <div class="panel-body">
                        <p>Get quotes in just seconds by inputting in only necessary details.  Pricing lasts 7 days after quote is requested.  You can request a new quote any time if previous has run out. </p>
                        <a href="quote" class="btn btn-default">Get Quote</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i> Organization </h4>
                    </div>
                    <div class="panel-body">
                        <p>Help keep track of drivers, employees, shipments with our advanced database technology with simple tools to edit/remove/assign</p>
                        <a href="about" class="btn btn-default">Learn More</a>
                    </div>
                </div>
            </div>
         
        </div>
      

        <hr>

        
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p style="color:black;">Copyright &copy; Transportation Management Software, 2020</p>
                </div>
            </div>
        </footer>

    </div>
    -->
    
    
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Script to Activate the Carousel -->
    <script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    })
    </script>

</body>

</html>