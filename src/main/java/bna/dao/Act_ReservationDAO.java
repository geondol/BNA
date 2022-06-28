package bna.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import bna.vo.Act_ReservationVO;

public class Act_ReservationDAO {

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
	
	public ArrayList<Act_ReservationVO> selectAll(int startRow, int endRow) {
		
		getConnection();
		
		ArrayList<Act_ReservationVO> arrlist=new ArrayList<>();
		try {
			
			String sql = "select * from (select A.*,rownum rnum from(SELECT actresnum,c.actname,c.actimg1,a.id,actchkin,actchkout,actpeople,tele FROM actrestbl a INNER JOIN signtbl b ON a.id = b.id inner join acttbl c on a.actnum = c.actnum order by actresnum asc)A) where rnum >=? and rnum <=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs=pstmt.executeQuery();
			while (rs.next()) {
				Act_ReservationVO arvo = new Act_ReservationVO();
				arvo.setActresnum(rs.getInt(1));
				arvo.setActname(rs.getString(2));
				arvo.setActimg1(rs.getString(3));
				arvo.setId(rs.getString(4));
				arvo.setActchkin(rs.getString(5));
				arvo.setActchkout(rs.getString(6));
				arvo.setActpeople(rs.getInt(7));
				arvo.setTele(rs.getString(8));
				
				arrlist.add(arvo);
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
	
	public void deleteactres(int actresnum) {
		
		getConnection();
		try {
			String sql = "delete from actrestbl where actresnum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,actresnum);
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
			String sql = "select count(*) from actrestbl";
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
