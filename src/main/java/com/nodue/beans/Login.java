package com.nodue.beans;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.json.JSONException;
import org.json.JSONObject;

import com.nodue.dao.DAO;
import com.nodue.dao.DBImplementation;


public class Login {
	private String mailId;
	private String password;
	private String userType;
	private String target;
	private int error;
	private Object userId;
	
	public Login() {
		mailId = "";
		password = "";
		userType = "";
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

	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public int getError() {
		return error;
	}

	public void setError(int error) {
		this.error = error;
	}

	public Object getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public JSONObject isValidAdmin() {
		error = -1;
		JSONObject jsonObject = new JSONObject();
		DAO dao = new DBImplementation();
		String query = "select * from admin where adminId='"+getMailId()+"'";
		System.out.println(query);
		ResultSet resultSet = dao.getData(query);
		try {
			if (resultSet.next()) {
				if(resultSet.getString("password").equals(getPassword())) {
					error = 0;
					userId = mailId;
					target="incharge.jsp";
				}
				else {
					error=2;
				}
			}
			else {
				error = isValidIncharge();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			jsonObject.put("error", error);
			jsonObject.put("target", target);
			jsonObject.put("userId", userId);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dao.closeConnection();
		System.out.println(jsonObject);
		return jsonObject;
	}
	
	public int isValidIncharge() {
		error = -1;
		DAO dao = new DBImplementation();
		String query = "select * from incharges where mailId='"+getMailId()+"'";
		System.out.println(query);
		ResultSet resultSet = dao.getData(query);
		try {
			if (resultSet.next()) {
				if(resultSet.getString("password").equals(getPassword())) {
					userId = resultSet.getInt("inchargeId");
					error = 0;
					target="incharge/viewrequest.jsp";
				}
				else {
					error=2;
				}
			}
			else {
				error = isValidStudent();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dao.closeConnection();
		return error;
	}
	
	public int isValidStudent() {
		error = -1;
		DAO dao = new DBImplementation();
		String query = "select * from students where mailId='"+getMailId()+"'";
		ResultSet resultSet = dao.getData(query);
		try {
			if (resultSet.next()) {
				if(resultSet.getString("password").equals(getPassword())) {
					userId = resultSet.getInt("studentId");
					error = 0;
					target="student/viewMyRequest.jsp";
				}
				else {
					error=2;
				}
			}
			else {
				error = 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dao.closeConnection();
		return error;
	}
}
