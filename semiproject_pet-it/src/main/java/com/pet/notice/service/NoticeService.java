package com.pet.notice.service;

import static com.pet.common.JDBCTemplate.close;

import static com.pet.common.JDBCTemplate.getConnection;

import static com.pet.common.JDBCTemplate.commit;
import static com.pet.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.pet.notice.model.dao.NoticeDao;
import com.pet.notice.model.dto.Notice;

public class NoticeService {

	private NoticeDao dao = new NoticeDao();
	
	public List<Notice> selectNotice(int cPage,int numPerpage){
		Connection conn=getConnection();
		List<Notice> result=dao.selectNotice(conn,cPage,numPerpage);
		close(conn);
		return result;
	}
	public int selectNoticeCount() {
		Connection conn=getConnection();
		int result=dao.selectNoticeCount(conn);
		close(conn);
		return result;
	}
	
	public Notice selectNoticeByNo(String noticeNo) {
		Connection conn=getConnection();
		Notice n = dao.selectNoticeByNo(conn,noticeNo);
		close(conn);
		return n;
	}
	
	public int insertNotice (Notice n) {
		Connection conn = getConnection();
		int result=dao.insertNotice(conn, n);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	
	
	
	
	

}
