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

<title>Students</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">

<!-- Page level plugin CSS-->
<link href="vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin.css" rel="stylesheet">

</head>

<body id="page-top">
	<%@ include file="topnav.html"%>

	<div id="wrapper">

		<!-- Sidebar -->
		<%@ include file="sidenav.html"%>
		<div id="content-wrapper">

			<div class="container-fluid">
				<%!
      String student_name,student_usn,mail_id,password;
      int student_id;
      %>
				<jsp:useBean id="students" class="com.nodue.beans.Student"></jsp:useBean>
				<jsp:setProperty property="*" name="students"/>
				<!-- Breadcrumbs-->
				<ol class="breadcrumb">
					<li class="breadcrumb-item active">STUDENTS</li>
				</ol>
				
				<%
 if(request.getParameter("studentId")!=null)
              {
	 students.setStudentId(Integer.parseInt(request.getParameter("studentId")));
	 students.deleteStudent();
            	 
              }%>
				<!-- DataTables Example -->
				<!-- DataTables Example -->
				<div class="card mb-3">

					<form class="form" method="" action="managestudent.jsp">

						<button>Add Students+</button>
					</form>

					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th>Student Name</th>		
										<th>Student Usn</th>						
										<th>MailId</th>
										<th>Password</th>
										<th>Edit/Delete</th>
										
									</tr>
								</thead>
								<tbody>
									<%
               JSONArray jsonArray=students.getStudents();
                if(jsonArray.length()>0)
                {
                	for(int i=0;i<jsonArray.length();i++)
                	{
                		JSONObject jsonObject=jsonArray.getJSONObject(i);
                		
                		student_id=jsonObject.getInt("studentId");
                		student_name=jsonObject.getString("studentName");
                		student_usn=jsonObject.getString("studentUsn");
                		mail_id=jsonObject.getString("mailId");
                		password=jsonObject.getString("password");
                		
                %>
									<tr>
										<td><%=student_name %></td>
										
										<td><%=student_usn %></td>

										<td><%=mail_id %></td>
										
										<td><%=password %></td>
										
										<td><a
											href="managestudent.jsp?studentId=<%= jsonObject.getInt("studentId")%>"><button>Edit</button></a>
											<a
											href="student.jsp?studentId=<%= jsonObject.getInt("studentId")%>&cmd=Delete"><button>Delete</button></a>
										</td>
									</tr>
									<%
                    }
                }
               %>
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
						<span aria-hidden="true">×</span>
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
	
	<script type="text/javascript">
	function onCategoryChange(){
		var target="apps.jsp";
		var categoryId=document.getElementById("categoryId").value;
		if(categoryId!="")
			{
			target+="?categoryId="+categoryId;
			}
		window.location.href=target;
	}
	</script>
	
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
