package com.nodue.beans;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;

import org.json.JSONArray;
import org.json.JSONObject;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

public class PdfDemo {
	
	public static void main(String[] args) {
		
//		String project = request.getContextPath();
//		String uploadFolder = getServletContext().getRealPath(project);
//		uploadFolder = uploadFolder.split("\\\\.meta")[0] + project + "/src/main/webapp/uploadedImages";
//		System.out.println(uploadFolder);
//		File file = new File(uploadFolder);
//		if (!file.exists()) {
//			file.mkdir();
//		}
		
		String collegeName = "SJCE";
		Document document = new Document();
		try {
			PdfWriter pdfWriter = PdfWriter.getInstance(document,
					new FileOutputStream("D://a.pdf"));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		document.open();

		Paragraph paragraph = new Paragraph();
		paragraph.add(collegeName);
		paragraph.setAlignment(Element.ALIGN_CENTER);
		try {
			document.add(paragraph);
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//String content = "This is to certify that Mr/Ms " + certificate.getStudentById() ;
		Paragraph otherParagraph = new Paragraph();
		//otherParagraph.add(content);
		otherParagraph.setAlignment(Element.ALIGN_CENTER);

		//JSONArray notesarray = certificate.getCertificates();
	//	for (int i = 0; i < notesarray.length(); i++) {
			//JSONObject jsonObject = notesarray.getJSONObject(i);
			
			///String inchargeName = jsonObject.getString("inchargeName");
			//String status = jsonObject.getString("status");
		    
			Paragraph otheParagraph = new Paragraph();
			//otherParagraph.add(inchargeName +" "+ status);
			otherParagraph.setAlignment(Element.ALIGN_CENTER);
			try {
				document.add(otherParagraph);
			} catch (DocumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			document.close();
		}
		
	}


