<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Manage students</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">

<!-- Page level plugin CSS-->
<link href="vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin.css" rel="stylesheet">
<script type="text/javascript">
	function validateForm() {
		var letters = /^[A-Za-z]+$/;
		var name = document.getElementById("name").value;
		if (name.match(letters)) {
			return true;
		} else {
			alert("Enter only alphabets");
			return false;
		}
		var mob = /^[1-9]{1}[0-9]{9}$/;
		var txtMobile = document.getElementById("mobile");
		if (mob.test(txtMobile.value) == false) {
			alert("Please enter valid mobile number.");
			txtMobile.focus();
			return false;
		}
		var passw = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$/;
		var pwd = document.getElementById("spPwd").value;
		// alert("password="+pwd);
		if (pwd.match(passw)) {
			return true;
		} else {
			alert('Wrong...! Password');
			return false;
		}	
	}
</script>
</head>


<body id="page-top">

	<%@ include file="topnav.html"%>

	<div id="wrapper">

		<!-- Sidebar -->

		<%@ include file="sidenav.html"%>

		<div id="content-wrapper">

			<div class="container-fluid">

				<jsp:useBean id="managestudents" class="com.nodue.beans.Student"></jsp:useBean>
				<%
					if (request.getParameter("studentId") != null) {
						managestudents.setStudentId(Integer.parseInt(request.getParameter("studentId")));
						managestudents.getStudentById();
					}
				%>

				<!-- Breadcrumbs-->
				<ol class="breadcrumb">
					<li class="breadcrumb-item active">MANAGE STUDENTS</li>
				</ol>

				<!-- DataTables Example -->
				<div class="card mb-3">

					<form class="form" method="post" action="managestudent.jsp"
						onsubmit="return validateForm();">
						<input type="hidden" name="studentId" id="studentId"
							class="form-control"
							value='<jsp:getProperty property="studentId" name="managestudents"/>'>

						<input class="text" type="text" placeholder="Student name"
							name="studentName" id="studentName" required
							
							value='<jsp:getProperty property="studentName" name="managestudents"/>'>
				 		
				   <br>	<input class="text" type="text" placeholder="Student Usn"
							name="studentUsn" id="studentUsn" required
							value='<jsp:getProperty property="studentUsn" name="managestudents"/>'>
						
							
							<br> <input class="text" type="text" placeholder="Mail-Id"
							name="mailId" required
							value='<jsp:getProperty property="mailId" name="managestudents"/>'><br>
							
							<input class="text" type="password" placeholder="Password"
							name="password" id="password" required
							value='<jsp:getProperty property="password" name="managestudents"/>'><br>
							
						<br>

						<input class="submit-btn" type="submit" name="cmd"
							value='<jsp:getProperty property="cmd" name="managestudents"/>'>
					</form>

					<%
						if (request.getParameter("cmd") != null) {
							String cmd = request.getParameter("cmd");
							//System.out.println(cmd);
							if (cmd.equalsIgnoreCase("save")) {
					%>
					<jsp:setProperty property="*" name="managestudents" />
					<%
						int save = managestudents.saveStudents();
								if (save > 0) {
									response.sendRedirect("student.jsp");
								} else {
					%>
					<script type="text/javascript">
						alert("Fail to add...");
					</script>
					<%
						}
							} else if (cmd.equals("Update")) {
					%>
					<jsp:setProperty property="*" name="managestudents" />
					<%
						int update = managestudents.updateStudents();
								if (update > 0) {
									response.sendRedirect("student.jsp");
								} else {
					%>
					<script type="text/javascript">
						alert("Fail to Update...");
					</script>
					<%
						}
							}
						}
					%>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
								</thead>
								<tbody>


								</tbody>
							</table>
						</div>
					</div>
					<div class="card-footer small text-muted"></div>

				</div>

				<p class="small text-center text-muted my-5">

					<em>More table examples coming soon...</em>
				</p>

			</div>

		</div>
	</div>


	<!-- /#wrapper -->


	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">�</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="index.jsp">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Page level plugin JavaScript-->
	<script src="vendor/datatables/jquery.dataTables.js"></script>
	<script src="vendor/datatables/dataTables.bootstrap4.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin.min.js"></script>

	<!-- Demo scripts for this page-->
	<script src="js/demo/datatables-demo.js"></script>

</body>
</html>