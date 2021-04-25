package com.nodue.beans;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.nodue.dao.DAO;
import com.nodue.dao.DBImplementation;

public class Certificate {

	private int certificateId;
	private String status;
	private String fileName;
	private int studentId;
	private int inchargeId;
	private String cmd;

	public Certificate() {
		certificateId = 0;
		status = "";
		fileName = "";
		studentId = 0;
		inchargeId = 0;
		cmd = "save";
	}

	public int getCertificateId() {
		return certificateId;
	}

	public void setCertificateId(int certificateId) {
		this.certificateId = certificateId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

	public int getInchargeId() {
		return inchargeId;
	}

	public void setInchargeId(int inchargeId) {
		this.inchargeId = inchargeId;
	}

	public String getCmd() {
		return cmd;
	}

	public void setCmd(String cmd) {
		this.cmd = cmd;
	}

	public int saveCertificates() {
		int rows = -1;
		DAO dao = new DBImplementation();

		JSONArray obj = getIncharge();
		
		String query = "select certificateId from certificates where studentId='" + getStudentId() + "'";
		boolean status=true;
		
		
		if (!dao.isExists(query)) {
		for (int i = 0; i < obj.length(); i++) {
			JSONObject jsonObject = obj.getJSONObject(i);
			query = "insert into certificates(studentId,inchargeId)" + "values(" + getStudentId() + ","
					+ jsonObject.getInt("inchargeId") + ")";
			System.out.println("Save Query " + query);
			rows = dao.putData(query);
		} }else {
			rows = -2;
		}
		dao.closeConnection();
		return rows;
	}

	public int updateCertificates() {
		int rows = -1;
		DAO dao = new DBImplementation();
		String query = "update certificates set status= 'approved' where certificateId=" + getCertificateId();
		rows = dao.putData(query);
		dao.closeConnection();
		return rows;
	}

	public int deleteCertificates() {
		int rows = -1;
		DAO dao = new DBImplementation();
		String query = "delete from certificates where certificateId=" + getCertificateId();
		rows = dao.putData(query);
		dao.closeConnection();
		return rows;
	}

	public JSONArray getIncharge() {
		JSONArray array = new JSONArray();
		DAO dao = new DBImplementation();
		String query = "select * from incharges";
		ResultSet resultSet = dao.getData(query);
		try {
			while (resultSet.next()) {
				JSONObject jsonObject = new JSONObject();
				try {
					jsonObject.put("inchargeId", resultSet.getInt("inchargeId"));
					jsonObject.put("inchargeName", resultSet.getString("inchargeName"));
					jsonObject.put("type", resultSet.getString("type"));
					jsonObject.put("mailId", resultSet.getString("mailId"));
					jsonObject.put("password", resultSet.getString("password"));
				} catch (JSONException e) {

					e.printStackTrace();
				}
				array.put(jsonObject);
			}
		} catch (SQLException e) {
		}
		dao.closeConnection();
		return array;
	}

	public String getStudentById() {
		JSONObject jsonObject = new JSONObject();
		DAO dao = new DBImplementation();
		String query = "select * from students where studentId = " + getStudentId();
		ResultSet resultSet = dao.getData(query);
		try {
			if (resultSet.next()) {
				return resultSet.getString("studentName");

			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		dao.closeConnection();
		return null;
	}

//	public JSONArray getCertificates() {
//		JSONArray array = new JSONArray();
//		DAO dao = new DBImplementation();
//		String query = "select * from  certificates inner join component on "
//				+ "component.componentId = report.componentId order by reportId desc";
//		System.out.println(query);
//		ResultSet resultSet = dao.getData(query);
//		try {
//			while (resultSet.next()) {
//				JSONObject jsonObject = new JSONObject();
//				try {
//					jsonObject.put("certificateId", resultSet.getInt("certificateId"));
//					jsonObject.put("status", resultSet.getString("status"));
//					jsonObject.put("fileName", resultSet.getString("fileName"));
//					jsonObject.put("studentId", resultSet.getInt("studentId"));
//					jsonObject.put("inchargeId", resultSet.getInt("inchargeId"));
//				} catch (JSONException e) {
//
//					e.printStackTrace();
//				}
//				array.put(jsonObject);
//			}
//		} catch (SQLException e) {
//		}
//		dao.closeConnection();
//		System.out.println(array);
//		return array;
//	}

//	public JSONArray getMyReports() {
//		JSONArray array = new JSONArray();
//		DAO dao = new DBImplementation();
//		String query = "select * from report inner join component on "
//				+ "component.componentId = report.componentId"
//				+ " where studentId="+getStudentId();
//		ResultSet resultSet = dao.getData(query);
//		try {
//			while (resultSet.next()) {
//				JSONObject jsonObject = new JSONObject();
//				try {
//					jsonObject.put("reportId", resultSet.getInt("reportId"));
//					jsonObject.put("componentName", resultSet.getString("componentName"));
//					jsonObject.put("reportDate", resultSet.getString("reportDate"));
//					jsonObject.put("status", resultSet.getString("status"));
//					
//				} catch (JSONException e) {
//
//					e.printStackTrace();
//				}
//				array.put(jsonObject);
//			}
//		} catch (SQLException e) {
//		}
//		dao.closeConnection();
//		return array;
//	}

	public JSONObject getCertificateById() {
		JSONObject jsonObject = new JSONObject();
		DAO dao = new DBImplementation();
		String query = "select * from certificates where certificateId = " + getCertificateId();
		ResultSet resultSet = dao.getData(query);
		try {
			if (resultSet.next()) {
				setCertificateId(resultSet.getInt("certificateId"));
				setStudentId(resultSet.getInt("studentId"));
				setInchargeId(resultSet.getInt("inchargeId"));
				setStatus(resultSet.getString("status"));
				setCmd("Update");
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		dao.closeConnection();
		return jsonObject;
	}

	public JSONArray getCertificates() {
		JSONArray array = new JSONArray();
		DAO dao = new DBImplementation();
		String query = "select * from certificates inner join incharges on"
				+ " incharges.inchargeId= certificates.inchargeId where studentId =" + getStudentId();
		System.out.println(query);
		ResultSet resultSet = dao.getData(query);
		try {
			while (resultSet.next()) {
				JSONObject jsonObject = new JSONObject();
				try {
					jsonObject.put("certificateId", resultSet.getInt("certificateId"));

					jsonObject.put("inchargeName", resultSet.getString("inchargeName"));
					jsonObject.put("status", resultSet.getString("status"));
				} catch (JSONException e) {

					e.printStackTrace();
				}
				array.put(jsonObject);
			}
		} catch (SQLException e) {
		}
		dao.closeConnection();
		System.out.println(array);
		return array;
	}

	public JSONArray getCertificateRequests() {
		JSONArray array = new JSONArray();
		DAO dao = new DBImplementation();
		String query = "select * from certificates inner join students on"
				+ " students.studentId= certificates.studentId "
				+ "where inchargeId =" + getInchargeId()+" and status='pending'";
		System.out.println(query);
		ResultSet resultSet = dao.getData(query);
		try {
			while (resultSet.next()) {
				JSONObject jsonObject = new JSONObject();
				try {
					jsonObject.put("certificateId", resultSet.getInt("certificateId"));

					jsonObject.put("studentName", resultSet.getString("studentName"));
					jsonObject.put("status", resultSet.getString("status"));
				} catch (JSONException e) {

					e.printStackTrace();
				}
				array.put(jsonObject);
			}
		} catch (SQLException e) {
		}
		dao.closeConnection();
		System.out.println(array);
		return array;
	}
	
	public JSONArray printPdf() {
		JSONArray array = new JSONArray();
		DAO dao = new DBImplementation();
		String query = "select * from certificates inner join incharges on"
				+ " incharges.inchargeId= certificates.inchargeId where studentId =" + getStudentId();
		System.out.println(query);
		ResultSet resultSet = dao.getData(query);
		try {
			while (resultSet.next()) {
				JSONObject jsonObject = new JSONObject();
				try {
					jsonObject.put("certificateId", resultSet.getInt("certificateId"));
					jsonObject.put("inchargeName", resultSet.getString("inchargeName"));
					jsonObject.put("status", resultSet.getString("status"));
				} catch (JSONException e) {

					e.printStackTrace();
				}
				array.put(jsonObject);
			}
		} catch (SQLException e) {
		}
		dao.closeConnection();
		System.out.println(array);
		return array;
	}

//	public JSONArray getStudents() {
//		JSONArray array = new JSONArray();
//		DAO dao = new DBImplementation();
//		String query = "select * from student";
//		ResultSet resultSet = dao.getData(query);
//		try {
//			while (resultSet.next()) {
//				JSONObject jsonObject = new JSONObject();
//				try {
//					jsonObject.put("studentId", resultSet.getInt("studentId"));
//					jsonObject.put("studentName", resultSet.getString("studentName"));
//				} catch (JSONException e) {
//
//					e.printStackTrace();
//				}
//				array.put(jsonObject);
//			}
//		} catch (SQLException e) {
//		}
//		dao.closeConnection();
//		System.out.println(array);
//		return array;
//	}
//}

}
