package com.nodue.beans;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.nodue.dao.DAO;
import com.nodue.dao.DBImplementation;


public class Admin implements Serializable {
	private String adminId;
	private String password;
	private String target;
	private String sessionKey;
	private Object sessionValue;
	private String cmd;

	public Admin() {

		adminId = "";
		password = "";
		target = "";
		cmd = "Save";
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public String getCmd() {
		return cmd;
	}

	public void setCmd(String cmd) {
		this.cmd = cmd;
	}

	public String getSessionKey() {
		return sessionKey;
	}

	public void setSessionKey(String sessionKey) {
		this.sessionKey = sessionKey;
	}

	public Object getSessionValue() {
		return sessionValue;
	}

	public void setSessionValue(Object sessionValue) {
		this.sessionValue = sessionValue;
	}

	public boolean isAdmin() {
		// System.out.println("Inside Admin");
		boolean flag = false;
		DAO dao = new DBImplementation();
		String query = "select * from admin where adminId='" + getAdminId() + "'";
		System.out.println(query);
		ResultSet resultSet = dao.getData(query);
		try {
			if (resultSet.next()) {
				String dbpassword = resultSet.getString("password");
				if (dbpassword.equals(getPassword())) {
					flag = true;
					setSessionKey("adminId");
					setSessionValue(getAdminId());
					target = "incharge.jsp";
				}
			}
			else {
				query = "select * from hospitals where mailId='" + getAdminId() + "'";
				resultSet = dao.getData(query);
				if (resultSet.next()) {
					String dbpassword = resultSet.getString("password");
					if (dbpassword.equals(getPassword())) {
						flag = true;
						setSessionKey("hospitalId");
						setSessionValue(resultSet.getInt("hospitalId"));
						target = "hospital/patients.jsp";
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dao.closeConnection();
		return flag;
	}
}
