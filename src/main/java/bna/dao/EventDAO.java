package bna.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import bna.vo.EventVO;
import bna.vo.NoticeVO;

public class EventDAO {
	
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
	
	public void insert(EventVO evo) {
		
		getConnection();
		try {
			String sql = "insert into event values(event_seq.nextval,?,?,?,sysdate,0)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,evo.getTitle());
			pstmt.setString(2,evo.getContent());
			pstmt.setString(3,evo.getWriter());
			pstmt.executeUpdate();
		}catch (Exception e) {
			
		}finally{
			if(pstmt!=null){try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}}
			if(conn!=null){try {conn.close();} catch (SQLException e) {e.printStackTrace();}}
		}
	}
	
	public ArrayList<EventVO> selectAll(int startRow, int endRow) {
		
		getConnection();
		
		ArrayList<EventVO> arrlist=new ArrayList<>();
		try {
			
			String sql = "select * from (select A.*,rownum rnum from(select * from event order by eventdate desc)A) where rnum >=? and rnum <=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs=pstmt.executeQuery();
			while (rs.next()) {
				EventVO evo = new EventVO();
				evo.setEventnum(rs.getInt(1));
				evo.setTitle(rs.getString(2));
				evo.setContent(rs.getString(3));
				evo.setWriter(rs.getString(4));
				evo.setEventdate(rs.getString(5));
				evo.setReadcount(rs.getInt(6));
				
				arrlist.add(evo);
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
	
	public void deleteEvent(int eventnum) {
		
		getConnection();
		try {
			String sql = "delete from event where eventnum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,eventnum);
			pstmt.executeUpdate();
		}catch (Exception e) {
			
		}finally{
			if(pstmt!=null){try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}}
			if(conn!=null){try {conn.close();} catch (SQLException e) {e.printStackTrace();}}
		}
	}
	
	public EventVO oneSelectEvent(int eventnum) {
		
		getConnection();
		EventVO evo = new EventVO();
		try {
			//조회수 카운트 증가
			String readsql = "update event set readcount=readcount + 1 where eventnum=?";
			pstmt=conn.prepareStatement(readsql);
			pstmt.setInt(1, eventnum);
			pstmt.executeUpdate();
			
			//번호에 따른 데이터 추출하여 반환 루틴
			String sql = "select * from event where eventnum=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, eventnum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				evo.setEventnum(rs.getInt(1));
				evo.setTitle(rs.getString(2));
				evo.setContent(rs.getString(3));
				evo.setWriter(rs.getString(4));
				evo.setEventdate(rs.getString(5));
				evo.setReadcount(rs.getInt(6));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(conn!=null)try {conn.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return evo;
	}
	
	public void eventUpdate(EventVO evo) {
		getConnection();
		
		try {
			String sql = "update event set title=?, content=? where eventnum=?";
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, evo.getTitle());
			pstmt.setString(2, evo.getContent());
			pstmt.setInt(3, evo.getEventnum());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(conn!=null)try {conn.close();} catch (SQLException e) {e.printStackTrace();}
		}
	}
	
	public int getAllCount(){
		getConnection();
		int count = 0;
		
		try {
			String sql = "select count(*) from event";
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
