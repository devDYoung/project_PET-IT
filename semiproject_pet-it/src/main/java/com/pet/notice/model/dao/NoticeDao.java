package com.pet.notice.model.dao;

import static com.pet.common.JDBCTemplate.close;


import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.pet.faq.model.dao.FaqDao;
import com.pet.notice.model.dto.Notice;

public class NoticeDao {

//		private Properties sql = new Properties();
//		
//		{
//	        String path = FaqDao.class.getResource("/sql/notice/notice_sql.properties").getPath();
//	        try (FileReader fr = new FileReader(path)) {
//	            sql.load(fr);
//	        } catch (IOException e) {
//	            e.printStackTrace();
//	        }
//	    }
//				
//		public List<Notice> selectNotice(Connection conn, int cPage, int numPerpage){
//			PreparedStatement pstmt=null;
//			ResultSet rs=null;
//			List<Notice> result=new ArrayList<>();
//			try {
//				pstmt=conn.prepareCall(sql.getProperty("selectNotice"));
//				pstmt.setInt(1, (cPage-1)*numPerpage+1);
//				pstmt.setInt(2, cPage*numPerpage);
//				rs=pstmt.executeQuery();
//				while(rs.next()) {
//					result.add(getNotice(rs));
//				}
//			}catch(SQLException e) {
//				e.printStackTrace();
//			}finally {
//				close(rs);
//				close(pstmt);
//			}return result;
//		}		
//				
//		public int insertNotice(Connection conn, Notice n) {
//			PreparedStatement pstmt=null;
//			int result=0;
//			try {
//				pstmt=conn.prepareStatement(sql.getProperty("insertNotice"));
//				pstmt.setString(1, n.getNoticeCategory());
//				pstmt.setString(2, n.getNoticeTitle());
//				pstmt.setDate(3, n.getNoticeDate());
//				pstmt.setString(4, n.getNoticeFileOriName());
//				pstmt.setString(5,n.getNoticeFileReName());
//				result = pstmt.executeUpdate();
//			}catch(SQLException e) {
//				e.printStackTrace();
//			}finally {
//				close(pstmt);
//			}return result;
//		}
//		
//		
//		
//		
//		
//		
//		
//		
//		private Notice getNotice (ResultSet rs) throws SQLException{
//			return Notice.builder()
//					.noticeNo(rs.getString("NOTICE_NO"))
//					.noticeCategory(rs.getString("NOTICE_CATEGORY"))
//					.noticeTitle(rs.getString("NOTICE_TITLE"))
//					.noticeDate(rs.getDate("NOTICE_DATE"))
//					.noticeContent(rs.getString("NOTICE_CONTENT"))
//					.noticeHits(rs.getInt("NOTICE_HITS"))
//					.build();
//			
//			
//		}
		
		
		
				
				
}