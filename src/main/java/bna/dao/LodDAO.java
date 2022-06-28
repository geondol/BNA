package bna.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import bna.vo.LodVO;

public class LodDAO {

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
	
	public ArrayList<LodVO> selectAll(int startRow, int endRow) {
		
		getConnection();
		
		ArrayList<LodVO> arrlist=new ArrayList<>();
		try {
			
			String sql = "select * from (select A.*,rownum rnum from(select * from lodtbl order by lodnum asc)A) where rnum >=? and rnum <=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs=pstmt.executeQuery();
			while (rs.next()) {
				LodVO lvo = new LodVO();
				lvo.setLodnum(rs.getInt(1));
				lvo.setLodname(rs.getString(2));
				lvo.setLodprice(rs.getInt(3));
				lvo.setLodimg1(rs.getString(4));
				lvo.setLodinfo(rs.getString(9));
				lvo.setLodaddr(rs.getString(16));
				
				
				arrlist.add(lvo);
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
	
	public void deleteLod(int lodnum) {
		
		getConnection();
		try {
			String sql = "delete from lodtbl where lodnum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,lodnum);
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
			String sql = "select count(*) from lodtbl";
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
