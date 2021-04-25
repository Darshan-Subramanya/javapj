<%@page import="com.sun.org.apache.bcel.internal.generic.GETSTATIC"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.io.File"%>
<%@page import="com.itextpdf.text.Element"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="certificate" class="com.nodue.beans.Certificate"></jsp:useBean>
	<jsp:setProperty property="*" name="certificate" />
	<%
	
    if(session.getAttribute("userId")!=null){
   	 int userId = (Integer) session.getAttribute("userId");
   	certificate.setStudentId(userId);
     }
			
	
	String project = request.getContextPath();
		String uploadFolder = getServletContext().getRealPath(project);
		uploadFolder = uploadFolder.split("\\\\.meta")[0] + project + "/src/main/webapp/uploadedImages";
		System.out.println(uploadFolder);
		File file = new File(uploadFolder);
		if (!file.exists()) {
			file.mkdir();
		}
		String collegeName = "SJCE";
		Document document = new Document();
		PdfWriter pdfWriter = PdfWriter.getInstance(document,
				new FileOutputStream(uploadFolder + File.separator + certificate.getStudentById()+".pdf"));
		document.open();

		Paragraph paragraph = new Paragraph();
		paragraph.add(collegeName);
		paragraph.setAlignment(Element.ALIGN_CENTER);
		document.add(paragraph);
		
		
		
		String content = "This is to certify that Mr/Ms " + certificate.getStudentById() +" have been approved with no due's in the college " ;
		Paragraph otherParagraph = new Paragraph();
		otherParagraph.add(content);
		otherParagraph.setAlignment(Element.ALIGN_CENTER);
		document.add(otherParagraph);
		
		
		JSONArray notesarray = certificate.getCertificates();
		
		for (int i = 0; i < notesarray.length(); i++) {
			JSONObject jsonObject = notesarray.getJSONObject(i);
			
			String inchargeName = jsonObject.getString("inchargeName");
			String status = jsonObject.getString("status");
		    
			Paragraph otheParagraph = new Paragraph();
			otheParagraph.add(inchargeName +" "+ status);
			otheParagraph.setAlignment(Element.ALIGN_CENTER);
			document.add(otheParagraph);
		}
		
		document.close();
	%>
	<script type="text/javascript">
		alert("Certificate Issued");
		window.location.href = "viewMyRequest.jsp";
	</script>
</body>
</html>