package com.groo.DAO;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.groo.error.InternalDataAccessException;
import com.groo.model.VoteDTO;

public class VoteDAOImpl implements VoteDAO {

	/**
	 * 투표 추가를 위한 메서드
	 * @param vote 투표 생성 하기위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 */
	@Override
	public void insertVote(VoteDTO vote, SqlSession session) {
		try {
			session.insert("insertVote",vote);
		}catch (Exception e) {
			e.printStackTrace();
			throw new InternalDataAccessException("DAO : insertVote 예외발생",e);
		}
	}

	/**
	 * 투표 조회를 위한 메서드
	 * @param vote 투표 생성 하기위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 * @return 투표내용 조회
	 */
	@Override
	public List<VoteDTO> selectVote(VoteDTO vote, SqlSession session) {
		List<VoteDTO> voteList = new ArrayList<>();

		try {
			voteList = session.selectList("selectVote",vote);
		}catch (Exception e) {
			e.printStackTrace();
			throw new InternalDataAccessException("DAO : selectVote 예외발생",e);
		}

		return voteList;
	}
	/**
	 * 투표 누적을 위한 메서드
	 * @param vote 투표수를 누적 하기위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 */
	@Override
	public void updateVoteOk(VoteDTO vote, SqlSession session) {

		try {
			session.update("updateVoteOk",vote);
		}catch (Exception e) {
			e.printStackTrace();
			throw new InternalDataAccessException("DAO : updateVoteOk 예외발생",e);
		}
	}
}
