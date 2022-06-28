package bna.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import bna.vo.NoticeVO;

public class NoticeDAO {
	
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
	
	public void insert(NoticeVO nvo) {
		
		getConnection();
		try {
			String sql = "insert into notice values(notice_seq.nextval,?,?,?,sysdate,0)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,nvo.getTitle());
			pstmt.setString(2,nvo.getContent());
			pstmt.setString(3,nvo.getWriter());
			pstmt.executeUpdate();
		}catch (Exception e) {
			
		}finally{
			if(pstmt!=null){try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}}
			if(conn!=null){try {conn.close();} catch (SQLException e) {e.printStackTrace();}}
		}
	}
	
	public ArrayList<NoticeVO> selectAll(int startRow, int endRow) {
		
		getConnection();
		
		ArrayList<NoticeVO> arrlist=new ArrayList<>();
		try {
			
			String sql = "select * from (select A.*,rownum rnum from(select * from notice order by noticedate desc)A) where rnum >=? and rnum <=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs=pstmt.executeQuery();
			while (rs.next()) {
				NoticeVO nvo = new NoticeVO();
				nvo.setNoticenum(rs.getInt(1));
				nvo.setTitle(rs.getString(2));
				nvo.setContent(rs.getString(3));
				nvo.setWriter(rs.getString(4));
				nvo.setNoticedate(rs.getString(5));
				nvo.setReadcount(rs.getInt(6));
				
				arrlist.add(nvo);
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
	
	public void deleteNotice(int noticenum) {
		
		getConnection();
		try {
			String sql = "delete from notice where noticenum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,noticenum);
			pstmt.executeUpdate();
		}catch (Exception e) {
			
		}finally{
			if(pstmt!=null){try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}}
			if(conn!=null){try {conn.close();} catch (SQLException e) {e.printStackTrace();}}
		}
	}
	
	public NoticeVO oneSelectNotice(int noticenum) {
		
		getConnection();
		NoticeVO nvo = new NoticeVO();
		try {
			//조회수 카운트 증가
			String readsql = "update notice set readcount=readcount + 1 where noticenum=?";
			pstmt=conn.prepareStatement(readsql);
			pstmt.setInt(1, noticenum);
			pstmt.executeUpdate();
			
			//번호에 따른 데이터 추출하여 반환 루틴
			String sql = "select * from notice where noticenum=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, noticenum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				nvo.setNoticenum(rs.getInt(1));
				nvo.setTitle(rs.getString(2));
				nvo.setContent(rs.getString(3));
				nvo.setWriter(rs.getString(4));
				nvo.setNoticedate(rs.getString(5));
				nvo.setReadcount(rs.getInt(6));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(conn!=null)try {conn.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return nvo;
	}
	
	public void noticeUpdate(NoticeVO nvo) {
		getConnection();
		
		try {
			String sql = "update notice set title=?, content=? where noticenum=?";
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, nvo.getTitle());
			pstmt.setString(2, nvo.getContent());
			pstmt.setInt(3, nvo.getNoticenum());
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
			String sql = "select count(*) from notice";
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
