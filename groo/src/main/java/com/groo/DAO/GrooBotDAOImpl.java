package com.groo.DAO;

import org.apache.ibatis.session.SqlSession;

import com.groo.error.InternalDataAccessException;
import com.groo.model.GrooBotDTO;
/**
 * 그루 AI에 사용하는 요청의 데이터를 처리하는 클래스 구현체로 댓글의 추가,수정,삭제,조회 관련 서비스를 처리함
 */
public class GrooBotDAOImpl implements GrooBotDAO {
	
	/**
	 * ai 리뷰 생성 메서드
	 * @param groobot 정보를 가져오기 위한 Date Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 */
	@Override
	public void insertGrooBot(GrooBotDTO bot, SqlSession session) {

		try {
			session.insert("insertGrooBot",bot);
		}catch (Exception e) {
			e.printStackTrace();
			throw new InternalDataAccessException("DAO:insertGrooBot 예외발생", e);
		}
	}
	
	/**
	 * ai 리뷰 조회 메서드
	 * @param groobot 정보를 가져오기 위한 Date Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 */
	@Override
	public GrooBotDTO selectGrooBot(GrooBotDTO bot, SqlSession session) {
		GrooBotDTO botDTO = new GrooBotDTO();
		try {
			botDTO = session.selectOne("selectGrooBot",bot);
		}catch (Exception e) {
			e.printStackTrace();
			throw new InternalDataAccessException("DAO:insertGrooBot 예외발생", e);
		}
		return botDTO;
	}

}
