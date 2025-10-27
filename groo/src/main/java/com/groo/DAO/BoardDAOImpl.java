package com.groo.DAO;

import org.apache.ibatis.session.SqlSession;

import com.groo.error.InternalDataAccessException;
import com.groo.model.BoardDTO;


/**
 * 게시판에 사용되는 요청의 데이터 처리를 수행하기위한 클래스 구현체로 맴버의 조회,추가,수정,삭제 관련 서비스를 처리함
 */
public class BoardDAOImpl implements BoardDAO {
	
	/**
	 * 게시판 인서트 메서드
	 * @param board 게시판에 넣어줄 내용을 가져오기위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 */
	@Override
	public void insertBoard(BoardDTO board, SqlSession session) {
		try {
			session.selectList("adminSelectUserAll", board);
		}catch (Exception e) {
			e.printStackTrace();
			throw new InternalDataAccessException("DAO:adminSelectAll 예외발생", e);
		}
	}

}
