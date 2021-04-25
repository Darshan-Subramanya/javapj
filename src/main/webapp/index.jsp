<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>NO DUE</title>
<!-- Favicons (created with http://realfavicongenerator.net/)-->
<link rel="apple-touch-icon" sizes="57x57"
	href="img/favicons/apple-touch-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60"
	href="img/favicons/apple-touch-icon-60x60.png">
<link rel="icon" type="image/png" href="img/ksrt.png"
	sizes="32x32">
<link rel="icon" type="image/png" href="img/ksrt.png"
	sizes="16x16">
<link rel="manifest" href="img/favicons/manifest.json">

<meta name="msapplication-TileColor" content="#00a8ff">
<meta name="msapplication-config"
	content="img/favicons/browserconfig.xml">
<meta name="theme-color" content="#ffffff">
<!-- Normalize -->
<link rel="stylesheet" type="text/css" href="css/normalize.css">
<!-- Bootstrap -->
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<!-- Owl -->
<link rel="stylesheet" type="text/css" href="css/owl.css">
<!-- Animate.css -->
<link rel="stylesheet" type="text/css" href="css/animate.css">
<!-- Font Awesome -->
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.1.0/css/font-awesome.min.css">
<!-- Elegant Icons -->
<link rel="stylesheet" type="text/css"
	href="fonts/eleganticons/et-icons.css">
<!-- Main style -->
<link rel="stylesheet" type="text/css" href="css/cardio.css">
</head>
<body>
	<div class="preloader">
		<img src="img/loader.gif" alt="Preloader image">
	</div>
	<nav class="navbar">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><img src="img/ksrt.png" data-active-url="img/ksrt.png" alt=""></a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right main-nav">
				
					<li><a href="#" data-toggle="modal" data-target="#modal1" class="btn btn-blue">Sign In</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<header id="intro">
		<div class="container">
			<div class="table">
				<div class="header-text">
					<div class="row">
						<div class="col-md-12 text-center">
							<h3 class="light white">NO DUE CERTIFICATE MANAGEMENT SYSTEM.</h3>
							<h1 class="white typed">Software for no due certificate management.</h1>
							<span class="typed-cursor">|</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	
	<div class="modal fade" id="modal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content modal-popup">
				<a href="#" class="close-link"><i class="icon_close_alt2"></i></a>
				<h3 class="white">Sign In</h3>
				<form action="" class="popup-form" onsubmit="return isValidAdmin();">
				<div id="loginResp" style="width: 200px; height: 20px; color: red; font-size: 13px;"></div>
					<input type="email" class="form-control form-white" placeholder="Email Id" id="adminId" name="mailId">
					<div id="adminIdResp" style="width: 200px; height: 20px; color: red; font-size: 13px;"></div>
					<input type="password" class="form-control form-white" placeholder="Password" id="password" name="password">
					<div id="passwordResp" style="width: 200px; height: 20px; color: red; font-size: 13px;"></div>
					<input type="submit" class="btn btn-submit" name="login" value="Sign In">
				    <a href="forgotpassword.jsp" >Forgot Password</a>
				</form>
			</div>
		</div>
	</div>
	<jsp:useBean id="admin" class="com.nodue.beans.Login"></jsp:useBean>
<jsp:setProperty property="*" name="admin"/>
<%
if(request.getParameter("login")!=null){
		JSONObject jsonObject = admin.isValidAdmin();
		if(jsonObject.getInt("error")==0){
			response.sendRedirect(jsonObject.getString("target"));
			session.setAttribute("userId", jsonObject.get("userId"));
		}
}
%>
	<!-- Holder for mobile navigation -->
	<div class="mobile-nav">
		<ul>
		</ul>
		<a href="#" class="close-link"><i class="arrow_up"></i></a>
	</div>
	<!-- Scripts -->
	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/wow.min.js"></script>
	<script src="js/typewriter.js"></script>
	<script src="js/jquery.onepagenav.js"></script>
	<script src="js/main.js"></script>
</body>
</html>