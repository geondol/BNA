package bna.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import bna.vo.CustVO;

public class CustDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	public Connection getConnection() {
		
		try {
			
			Context initctx = new InitialContext();
			DataSource ds = (DataSource)initctx.lookup("java:comp/env/jdbc/OracleDB");
			
			conn = ds.getConnection();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public CustVO getOneSelectmember(String id) {
		getConnection();
		
		CustVO svo = new CustVO();
		try {
			String sql = "select * from signtbl where id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				svo.setId(rs.getString(1));
				svo.setName(rs.getString(2));
				svo.setPasswd1(rs.getString(3));
				svo.setMail(rs.getString(4));
				svo.setTele(rs.getString(5));
				svo.setAddress(rs.getString(6));
				svo.setAge(rs.getInt(7));
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return svo;
	}
	
	public CustVO getOneUpdatemember(String id) {
		getConnection();
		
		CustVO svo = new CustVO();
		try {
			String sql = "select * from signtbl where id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				svo.setId(rs.getString(1));
				svo.setName(rs.getString(2));
				svo.setPasswd1(rs.getString(3));
				svo.setMail(rs.getString(4));
				svo.setTele(rs.getString(5));
				svo.setAddress(rs.getString(6));
				svo.setAge(rs.getInt(7));
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return svo;
	}
	public void updatemember(CustVO svo) {
		
		getConnection();
		
		try {
			String sql = "update signtbl set passwd1=?, mail=?, tele=?, address=?, age=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, svo.getPasswd1());
			pstmt.setString(2, svo.getMail());
			pstmt.setString(3, svo.getTele());
			pstmt.setString(4, svo.getAddress());
			pstmt.setInt(5, svo.getAge());
			pstmt.setString(6, svo.getId());
			
			pstmt.executeUpdate();
			
			if(conn != null) {
				conn.close();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void Deletemember(String id) {
		try {
		getConnection();
		String sql = "delete from signtbl where id = ?";
		pstmt=conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		pstmt.executeUpdate();
		
		if(conn != null) {
			conn.close();
		}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public int getMember(String id, String pass) throws Exception{
		getConnection();
		
		int result = 0;
		try {
			String sql = "select count(*) from signtbl where id = ? and passwd1 = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
			if(conn != null) {
				conn.close();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
