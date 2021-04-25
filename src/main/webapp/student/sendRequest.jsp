<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="reportSave" class="com.nodue.beans.Certificate"></jsp:useBean>
				<jsp:setProperty property="*" name="repotSave"/>
				
				<%
                  if(session.getAttribute("userId")!=null){
                 	 int userId = (Integer) session.getAttribute("userId");
                 	reportSave.setStudentId(userId);
                   }
						
					%>

	<%
					%>
					<jsp:setProperty property="*" name="reportSave" />
					<%
						int save = reportSave.saveCertificates();
								if (save > 0) {
									%>
									alert("Request sent");
									<% 
									response.sendRedirect("viewMyRequest.jsp");
								} else {
									%>
									alert("Request not sent");
									<% 
									response.sendRedirect("viewMyRequest.jsp");
								}
								
					
								%>
							
					%>


</body>
</html>