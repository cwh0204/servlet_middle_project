package com.groo.DAO;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.groo.error.InternalDataAccessException;
import com.groo.model.ComentDTO;

/**
 * 댓글에 사용하는 요청의 데이터를 처리하는 클래스 구현체로 댓글의 추가,수정,삭제,조회 관련 서비스를 처리함
 */
public class ComentDAOImpl implements ComentDAO {


	/**
	 * 댓글 저장 메서드
	 * @param coment 정보를 가져오기 위한 Date Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 */
	@Override
	public void comentInsert(ComentDTO coment, SqlSession session) {

		try {
			session.insert("comentInsert",coment);
		}catch (Exception e) {
			e.printStackTrace();
			throw new InternalDataAccessException("DAO:adminSelectAll 예외발생", e);
		}
	}
	
	/**
	 * 댓글 조회 메서드
	 * @param coment 정보를 가져오기 위한 Date Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 * @return 댓글 정보 조회 리스트
	 */
	@Override
	public List<ComentDTO> comentSelect(ComentDTO coment, SqlSession session) {
		List<ComentDTO> comentList = new ArrayList<>();
		try {
			comentList = session.selectList("comentSelect",coment);
		}catch (Exception e) {
			e.printStackTrace();
			throw new InternalDataAccessException("DAO:adminSelectAll 예외발생", e);
		}
		return comentList;
	}
}
