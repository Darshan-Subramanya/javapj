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

<title>View My Request</title>

<!-- Custom fonts for this template-->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">

<!-- Page level plugin CSS-->
<link href="../vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../css/sb-admin.css" rel="stylesheet">

</head>

<body id="page-top">
	<%@ include file="topnav.html"%>

	<div id="wrapper">

		<!-- Sidebar -->
		<%@ include file="sidenav.html"%>
		<div id="content-wrapper">

			<div class="container-fluid">
				<%!
      String incharge_name,status;
      %>
				<jsp:useBean id="viewmyrequest" class="com.nodue.beans.Certificate"></jsp:useBean>
				<jsp:setProperty property="*" name="viewmyrequest"/>
				<!-- Breadcrumbs-->
				<ol class="breadcrumb">
					<li class="breadcrumb-item active">View My Certificate</li>
				</ol>
		
				<!-- DataTables Example -->
				<!-- DataTables Example -->
				<div class="card mb-3">
				<%
                  if(session.getAttribute("userId")!=null){
                 	 int userId = (Integer) session.getAttribute("userId");
                 	 viewmyrequest.setStudentId(userId);
                   }
						
					%>
				

					<form class="form" method="" action="sendRequest.jsp">

						<button>Send Request+</button>
					</form>
					
					<%
					boolean flag=true;
					
					
					%>

					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th>Incharge Name</th>		
										<th>Status</th>					
										
									</tr>
								</thead>
								<tbody>
									<%
               JSONArray jsonArray=viewmyrequest.getCertificates();
                if(jsonArray.length()>0)
                {
                	for(int i=0;i<jsonArray.length();i++)
                	{
                		JSONObject jsonObject=jsonArray.getJSONObject(i);
                		incharge_name=jsonObject.getString("inchargeName");
                		status=jsonObject.getString("status");
                		if(status.equals("pending")){
                			flag=false;
    					}
                		
                		
                		    		
                %>
									<tr>
										<td><%=incharge_name %></td>
										<td><%=status %></td>

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
					
					<%
					if(flag){
						%>
						<form class="form" method="" action="printpdf.jsp">

						<button>PRINT PDF</button>
					</form>
					<% 
					}
					
					%>

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
					<a class="btn btn-primary" href="../index.jsp">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	
	
	
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Page level plugin JavaScript-->
	<script src="../vendor/datatables/jquery.dataTables.js"></script>
	<script src="../vendor/datatables/dataTables.bootstrap4.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="../js/sb-admin.min.js"></script>

	<!-- Demo scripts for this page-->
	<script src="../js/demo/datatables-demo.js"></script>

</body>

</html>