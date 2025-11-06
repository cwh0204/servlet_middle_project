package com.groo.DAO;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.groo.error.InternalDataAccessException;
import com.groo.model.BoardDTO;
import com.groo.model.MemberDTO;

/**
 * 게시판에 사용되는 요청의 데이터 처리를 수행하기위한 클래스 구현체로 맴버의 조회,추가,수정,삭제 관련 서비스를 처리함
 */
public class BoardDAOImpl implements BoardDAO {

	/**
	 * 게시판 인서트 메서드
	 *
	 * @param board   게시판에 넣어줄 내용을 가져오기위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 */
	@Override
	public void insertBoard(BoardDTO board, SqlSession session) {
		try {
			session.insert("insertBoard", board);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalDataAccessException("DAO:adminSelectAll 예외발생", e);
		}
	}

	/**
	 * 게시판 목록 검색 메서드
	 *
	 * @param board   게시판 검색을 가져오기위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 * @return 게시판 검색 내용
	 */
	@Override
	public List<BoardDTO> selectBoard(BoardDTO board, SqlSession session) {

		List<BoardDTO> list = new ArrayList<>();
		try {
			list = session.selectList("selectBoard", board);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalDataAccessException("DAO:adminSelectAll 예외발생", e);
		}
		return list;
	}

	/**
	 * 게시판 상세 검색 메서드
	 *
	 * @param board   게시판 상세페이지 정보를 가져오기위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 * @return 게시판상세 데이터
	 */
	@Override
	public BoardDTO selectBoardDetail(BoardDTO board, SqlSession session) {

		BoardDTO boardDetail = new BoardDTO();

		try {
			boardDetail = session.selectOne("selectBoardDetail", board);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalDataAccessException("DAO:adminSelectAll 예외발생", e);
		}

		return boardDetail;
	}

	/**
	 * 조회수 증가 메서드
	 *
	 * @param board   게시판 정보를 가져오기위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 */
	@Override
	public void updateViews(BoardDTO board, SqlSession session) {

		try {
			session.update("updateViews", board);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalDataAccessException("DAO:updateViews 예외발생", e);
		}
	}

	/**
	 * 게시판 좋아요 증가 메서드
	 *
	 * @param board   게시판 정보를 가져오기위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 */
	@Override
	public void insertBoardLike(BoardDTO board, SqlSession session) {
		try {
			session.insert("insertBoardLike", board);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalDataAccessException("DAO:insertBoardLike 예외발생", e);
		}
	}

	/**
	 * 게시판 좋아요 삭제 메서드
	 *
	 * @param board   게시판 정보를 가져오기위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 */
	@Override
	public void deleteBoardLike(BoardDTO board, SqlSession session) {
		try {
			session.delete("deleteBoardLike", board);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalDataAccessException("DAO:insertBoardLike 예외발생", e);
		}

	}

	/**
	 * 게시판 좋아요 삭제,추가 판단 검색 메서드
	 *
	 * @param board   게시판 정보를 가져오기위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 */
	@Override
	public BoardDTO selectBoardLikeSearch(BoardDTO board, SqlSession session) {
		BoardDTO boardLike = new BoardDTO();
		try {
			boardLike = session.selectOne("selectBoardLikeSearch", board);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalDataAccessException("DAO:selectBoardLikeSearch 예외발생", e);
		}
		return boardLike;
	}

	/**
	 * 게시판 수정 메서드
	 *
	 * @param board   게시판 수정 정보를 가져오기위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 */
	@Override
	public void updateBoard(BoardDTO board, SqlSession session) {
		try {
			session.update("updateBoard", board);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalDataAccessException("DAO:updateBoard 예외발생", e);
		}

	}

	/**
	 * 게시판 삭제 메서드
	 *
	 * @param board   게시판 삭제 정보를 가져오기위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 */
	@Override
	public void deleteBoard(BoardDTO board, SqlSession session) {
		// TODO Auto-generated method stub
		try {
			session.update("deleteBoard", board);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalDataAccessException("DAO:deleteBoard 예외발생", e);
		}
	}

	/**
	 * 내가 쓴 게시판 조회 메서드
	 *
	 * @param board   게시판 삭제 정보를 가져오기위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 */

	@Override
	public List<BoardDTO> selectMyBoardList(MemberDTO member, SqlSession session) {
		// TODO Auto-generated method stub
		List<BoardDTO> list = new ArrayList<>();
		try {
			list = session.selectList("selectMyBoardList", member);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalDataAccessException("DAO:deleteBoard 예외발생", e);
		}
		return list;
	}

}
