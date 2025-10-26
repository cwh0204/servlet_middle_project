package com.groo.DAO;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.groo.config.SessionFactory;
import com.groo.error.InternalServiceException;
import com.groo.model.TeamDTO;

public class TeamDAOImpl implements TeamDAO{

	SessionFactory sessionFactory = new SessionFactory();

	@Override
	public void insertTeam(TeamDTO teamDTO, SqlSession session) {
		// TODO Auto-generated method stub
		try {
			session.insert("insertTeam", teamDTO);
		}catch (Exception e) {
			e.printStackTrace();
			throw new InternalServiceException("팀 생성 중 데이터베이스 오류 발생",e);
		}
	}

	@Override
	public List<TeamDTO> selectTeam(TeamDTO teamDTO, SqlSession session) {
		List<TeamDTO> list = new ArrayList<>();
		try {
			list = session.selectList("selectTeam",teamDTO);
		}catch (Exception e) {
			e.printStackTrace();
			throw new InternalServiceException("팀 검색 중 데이터베이스 오류 발생",e);
		}
		return list;
	}

	@Override
	public List<TeamDTO> selectTeamAll(SqlSession session) {

		List<TeamDTO> list = new ArrayList<>();
		try {
			list = session.selectList("selectTeamAll");
		}catch (Exception e) {
			e.printStackTrace();
			throw new InternalServiceException("팀 전체 검색 중 데이터베이스 오류 발생",e);
		}
		return list;
	}
}
