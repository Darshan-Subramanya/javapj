package com.nodue.beans;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.nodue.dao.DAO;
import com.nodue.dao.DBImplementation;

public class Incharge {
	
	private int inchargeId;
	private String inchargeName;
	private String type;
	private String mailId;
	private String password;
	private String cmd;
	
	public Incharge() {
		inchargeId=0;
		inchargeName="";
		type="";
		mailId="";
		password="";
		cmd="save";
	}

	public int getInchargeId() {
		return inchargeId;
	}

	public void setInchargeId(int inchargeId) {
		this.inchargeId = inchargeId;
	}

	public String getInchargeName() {
		return inchargeName;
	}

	public void setInchargeName(String inchargeName) {
		this.inchargeName = inchargeName;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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
	
	public int saveIncharge() {
		int rows = -1;
		DAO dao = new DBImplementation();
		String query = "select inchargeId from incharges where inchargeName='" + getInchargeId() + "'";
		if (!dao.isExists(query)) {
			query = "insert into incharges(inchargeName,type,mailId,password)" + "values('" + getInchargeName() + "','"
					+ getType() + "','" + getMailId() + "','" + getPassword() + "')";
			System.out.println("Save Query " + query);
			rows = dao.putData(query);
		} else {
			rows = -2;
		}
		dao.closeConnection();
		return rows;
	}

	public int updateIncharge() {
		int rows = -1;
		DAO dao = new DBImplementation();
		String query = "update incharges set inchargeName= '" + getInchargeName() 
		               + "', type='" + getType()
				       + "', mailId='" + getMailId() 
				       + "', password='" + getPassword() 
				       + "' where inchargeId=" + getInchargeId();
		rows = dao.putData(query);
		dao.closeConnection();
		return rows;
	}

	public int deleteIncharge() {
		int rows = -1;
		DAO dao = new DBImplementation();
		String query = "delete from incharges where inchargeId=" + getInchargeId();
		rows = dao.putData(query);
		dao.closeConnection();
		return rows;
	}
	
//	public int updateInchargePassword() {
//		int rows = -1;
//		DAO dao = new DBImplementation();
//		String query = "update incharge set " + "password='" + getPassword() + "' where mailId = '" + getMailId()
//				+ "'";
//		rows = dao.putData(query);
//		dao.closeConnection();
//		return rows;
//	}

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

	public JSONObject getInchargeById() {
		JSONObject jsonObject = new JSONObject();
		DAO dao = new DBImplementation();
		String query = "select * from incharges where inchargeId = " + getInchargeId();
		ResultSet resultSet = dao.getData(query);
		try {
			if (resultSet.next()) {
				setInchargeId(resultSet.getInt("inchargeId"));
				setInchargeName(resultSet.getString("inchargeName"));
				setType(resultSet.getString("type"));
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
