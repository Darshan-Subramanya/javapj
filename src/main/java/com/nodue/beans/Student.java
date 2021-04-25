package com.nodue.beans;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.nodue.dao.DAO;
import com.nodue.dao.DBImplementation;


public class Student {
	
	private int studentId;
	private String studentName;
	private String studentUsn;
	private String mailId;
	private String password;
	private String cmd;
	
	public Student() {
		studentId=0;
		studentName="";
	    studentUsn="";
		mailId="";
		password="";
		cmd="save";
	}

	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getStudentUsn() {
		return studentUsn;
	}

	public void setStudentUsn(String studentUsn) {
		this.studentUsn = studentUsn;
	}

	public String getMailId() {
		return mailId;
	}

	public void setMailId(String mailId) {
		this.mailId = mailId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCmd() {
		return cmd;
	}

	public void setCmd(String cmd) {
		this.cmd = cmd;
	}
	
	public int saveStudents() {
		int rows = -1;
		DAO dao = new DBImplementation();
		String query = "select studentId from students where studentName='" + getStudentName() + "'";
		if (!dao.isExists(query)) {
			query = "insert into students(studentName,studentUsn,mailId,password)" + "values('" + getStudentName() + "','"
					+ getStudentUsn() + "','" + getMailId() + "','" + getPassword() + "')";
			System.out.println("Save Query " + query);
			rows = dao.putData(query);
		} else {
			rows = -2;
		}
		dao.closeConnection();
		return rows;
	}

	public int updateStudents() {
		int rows = -1;
		DAO dao = new DBImplementation();
		String query = "update students set studentName= '" + getStudentName() 
				       + "', mailId='" + getMailId() 
				       + "', studentUsn='" + getStudentUsn()
				       + "', password='" + getPassword() 
				       + "' where studentId=" + getStudentId();
		rows = dao.putData(query);
		dao.closeConnection();
		return rows;
	}
	

	public int deleteStudent() {
		int rows = -1;
		DAO dao = new DBImplementation();
		String query = "delete from students where studentId=" + getStudentId();
		rows = dao.putData(query);
		dao.closeConnection();
		return rows;
	}
	
//	public int updatePassword() {
//		int rows = -1;
//		DAO dao = new DBImplementation();
//		String query = "update "+getUsertype()+" set " + "password='" + getPassword() + "' where mailId = '" + getMailId()
//				+ "'";
//		rows = dao.putData(query);
//		dao.closeConnection();
//		return rows;
//	}

	public JSONArray getStudents() {
		JSONArray array = new JSONArray();
		DAO dao = new DBImplementation();
		String query = "select * from students";
		ResultSet resultSet = dao.getData(query);
		try {
			while (resultSet.next()) {
				JSONObject jsonObject = new JSONObject();
				try {
					jsonObject.put("studentId", resultSet.getInt("studentId"));
					jsonObject.put("studentName", resultSet.getString("studentName"));
					jsonObject.put("studentUsn", resultSet.getString("studentUsn"));
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

	public JSONObject getStudentById() {
		JSONObject jsonObject = new JSONObject();
		DAO dao = new DBImplementation();
		String query = "select * from students where studentId = " + getStudentId();
		ResultSet resultSet = dao.getData(query);
		try {
			if (resultSet.next()) {
				setStudentId(resultSet.getInt("studentId"));
				setStudentName(resultSet.getString("studentName"));
				setStudentUsn(resultSet.getString("studentUsn"));
				setMailId(resultSet.getString("mailId"));
				setPassword(resultSet.getString("password"));
				setCmd("Update");
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		dao.closeConnection();
		return jsonObject;
	}
}

		