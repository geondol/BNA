package bna.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import bna.vo.Lod_ReservationVO;

public class Lod_ReservationDAO {

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
	
	public ArrayList<Lod_ReservationVO> selectAll(int startRow, int endRow) {
		
		getConnection();
		
		ArrayList<Lod_ReservationVO> arrlist=new ArrayList<>();
		try {
			
			String sql = "select * from (select A.*,rownum rnum from(SELECT lodresnum,c.lodname,c.lodimg1,a.id,lodchkin,lodchkout,lodpeople,tele FROM lodrestbl a INNER JOIN signtbl b ON a.id = b.id inner join lodtbl c on a.lodnum = c.lodnum order by lodresnum asc)A) where rnum >=? and rnum <=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs=pstmt.executeQuery();
			while (rs.next()) {
				Lod_ReservationVO lrvo = new Lod_ReservationVO();
				lrvo.setLodresnum(rs.getInt(1));
				lrvo.setLodname(rs.getString(2));
				lrvo.setLodimg1(rs.getString(3));
				lrvo.setId(rs.getString(4));
				lrvo.setLodchkin(rs.getString(5));
				lrvo.setLodchkout(rs.getString(6));
				lrvo.setLodpeople(rs.getInt(7));
				lrvo.setTele(rs.getString(8));
				
				arrlist.add(lrvo);
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
	
	public void deletelodres(int lodresnum) {
		
		getConnection();
		try {
			String sql = "delete from lodrestbl where lodresnum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,lodresnum);
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
			String sql = "select count(*) from lodrestbl";
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
