package com.groo.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.groo.DAO.BoardDAO;
import com.groo.DAO.BoardDAOImpl;
import com.groo.config.SessionFactory;
import com.groo.error.InternalDataAccessException;
import com.groo.error.InternalServiceException;
import com.groo.model.BoardDTO;

public class BoardServiceImpl implements BoardService {

	BoardDAO dao = new BoardDAOImpl();
	/**
	 * 게시판 등록 서비스 메서드입니다.
	 *
	 * @param board 게시판 입력 정보를 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 */
	@Override
	public void insertBoard(BoardDTO board) {

		SqlSession session = SessionFactory.getSqlSession();
		try {
			dao.insertBoard(board, session);
			session.commit();
		} catch (InternalDataAccessException ide) {
			ide.printStackTrace();
			throw new InternalServiceException("DB 접근 오류로 인한 서비스 예외", ide);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalServiceException("예상치 못한 서비스 내부 오류", e);
		} finally {
			session.close();
		}
	}
	/**
	 * 게시판목록 검색 서비스 메서드입니다.
	 *
	 * @param board 검색 정보를 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 */
	@Override
	public List<BoardDTO> selectBoard(BoardDTO board) {
		SqlSession session = SessionFactory.getSqlSession();
		List<BoardDTO> list = new ArrayList<>();
		try {
			list = dao.selectBoard(board, session);
		} catch (InternalDataAccessException ide) {
			ide.printStackTrace();
			throw new InternalServiceException("DB 접근 오류로 인한 서비스 예외", ide);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalServiceException("예상치 못한 서비스 내부 오류", e);
		} finally {
			session.close();
		}
		return list;
	}
	
	/**
	 * 게시판목록 검색 서비스 메서드입니다.
	 *
	 * @param board 상세페이지 정보를 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * @return 상세페이지 정보를 리턴
	 * 예외
	 */
	@Override
	public BoardDTO selectBoardDetail(BoardDTO board) {
		// TODO Auto-generated method stub
		BoardDTO boardDetail = new BoardDTO();
		SqlSession session = SessionFactory.getSqlSession();
		try {
			boardDetail = dao.selectBoardDetail(board, session);
		} catch (InternalDataAccessException ide) {
			ide.printStackTrace();
			throw new InternalServiceException("DB 접근 오류로 인한 서비스 예외", ide);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalServiceException("예상치 못한 서비스 내부 오류", e);
		} finally {
			session.close();
		}
		return boardDetail;
	}
	
	/**
	 * 게시판조회수 증가 서비스 메서드입니다.
	 *
	 * @param board 상세페이지 정보를 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 */
	@Override
	public void updateViews(BoardDTO board) {
		// TODO Auto-generated method stub
		SqlSession session = SessionFactory.getSqlSession();
		try {
			dao.updateViews(board, session);
			session.commit();
		} catch (InternalDataAccessException ide) {
			ide.printStackTrace();
			throw new InternalServiceException("DB 접근 오류로 인한 서비스 예외", ide);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalServiceException("예상치 못한 서비스 내부 오류", e);
		} finally {
			session.close();
		}
	}

}
