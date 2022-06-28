package bna.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import bna.vo.SignUpVO;


public class SignUpDAO {
	
	Connection conn = null;	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//DB 연동
	public Connection getConnection() {
		
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String Driver = "oracle.jdbc.driver.OracleDriver";
			String id = "BNA";
			String pass = "1234";	

			try {
				Class.forName(Driver);
				conn = DriverManager.getConnection(url, id, pass);
				System.out.println("데이터베이스 연동에 성공했습니다.");		
		}catch(Exception e) {
			e.printStackTrace();
		}	
			return conn;
	}
	public int insertmember(SignUpVO snp) {
		try {
				getConnection();//DB연결
			
			String sql = "insert into SIGNTBL values(?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, snp.getId());
			pstmt.setString(2, snp.getName());
			pstmt.setString(3, snp.getPasswd1());
			pstmt.setString(4, snp.getMail());
			pstmt.setString(5, snp.getTele());
			pstmt.setString(6, snp.getAddress());
			pstmt.setInt(7, snp.getAge());
			
			return pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return-1;
	}	


public int getMember(String id, String pass){
		
			getConnection();
		
		int result = 0;//처음이면 회원이 존재하지 않음.
		
		try {
			String sql = "select count(*) from SIGNTBL where id = ? and passwd1 = ?"; 
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pass); 
			
			rs = pstmt.executeQuery();//1
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;//1
		
	}
}