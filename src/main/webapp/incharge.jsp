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

<title>Incharge</title>

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
      String inchargeName,type,mailId,password;
      int incharge_id;
      %>
				<jsp:useBean id="incharges" class="com.nodue.beans.Incharge"></jsp:useBean>
				<!-- Breadcrumbs-->
				<ol class="breadcrumb">
					<li class="breadcrumb-item active"> Incharge</li>
				</ol>
				
				<%
 if(request.getParameter("inchargeId")!=null)
              {
	 incharges.setInchargeId(Integer.parseInt(request.getParameter("inchargeId")));
	 incharges.deleteIncharge();
            	 
              }%>
				<!-- DataTables Example -->
				<div class="card mb-3">

					<form class="form" method="post" action="manageincharge.jsp">

						<button>Add INCHARGE+</button>

					</form>

					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>

									<tr>
										<th>Incharge Name</th>
										<th>Type<th>
										<th>Mail Id</th>
										<th>Password</th>
										
									</tr>
								</thead>
								<tbody>
									<%
               JSONArray jsonArray=incharges.getIncharge();
                if(jsonArray.length()>0)
                {
                	for(int i=0;i<jsonArray.length();i++)
                	{
                		JSONObject jsonObject=jsonArray.getJSONObject(i);
                		
                		incharge_id=jsonObject.getInt("inchargeId");
                		inchargeName=jsonObject.getString("inchargeName");
                		type=jsonObject.getString("type");
                		mailId=jsonObject.getString("mailId");
                		password=jsonObject.getString("password");	
                %>
									<tr>
										<td><%=inchargeName %></td>
										<td><%=type %></td>
										<td><%=mailId %></td>
										<td><%=password %></td>
	
										<td><a
											href="manageincharge.jsp?inchargeId=<%= jsonObject.getInt("inchargeId")%>"><button>Edit</button></a>
											<a
											href="incharge.jsp?inchargeId=<%= jsonObject.getInt("inchargeId")%>&cmd=Delete"><button>Delete</button></a>
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
						<span aria-hidden="true">?</span>
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
