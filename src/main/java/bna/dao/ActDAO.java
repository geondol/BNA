package bna.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import bna.vo.ActVO;

public class ActDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public void getConnection() {
		try {
			Context initctx= new InitialContext(); 
			DataSource ds = (DataSource)initctx.lookup("java:comp/env/jdbc/OracleDB");
			
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<ActVO> selectAll(int startRow, int endRow) {
		
		getConnection();
		
		ArrayList<ActVO> arrlist=new ArrayList<>();
		try {
			
			String sql = "select * from (select A.*,rownum rnum from(select * from acttbl order by actnum asc)A) where rnum >=? and rnum <=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs=pstmt.executeQuery();
			while (rs.next()) {
				ActVO avo = new ActVO();
				avo.setActnum(rs.getInt(1));
				avo.setActname(rs.getString(2));
				avo.setActprice(rs.getInt(3));
				avo.setActimg1(rs.getString(4));
				avo.setActinfo(rs.getString(9));
				avo.setActaddr(rs.getString(13));
				
				arrlist.add(avo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
		if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
		if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
		if(conn!=null)try {conn.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return arrlist;
	}
	
	public void deleteAct(int actnum) {
		
		getConnection();
		try {
			String sql = "delete from acttbl where actnum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,actnum);
			pstmt.executeUpdate();
		}catch (Exception e) {
			
		}finally{
			if(pstmt!=null){try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}}
			if(conn!=null){try {conn.close();} catch (SQLException e) {e.printStackTrace();}}
		}
	}
	
	public int getAllCount(){
		getConnection();
		int count = 0;
		
		try {
			String sql = "select count(*) from acttbl";
			pstmt =conn.prepareStatement(sql);
			rs =pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(conn!=null)try {conn.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return count;
	}
}
