package com.groo.DAO;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.groo.error.InternalDataAccessException;
import com.groo.model.TeamAvgDTO;
import com.groo.model.TeamDTO;

public class TeamDAOImpl implements TeamDAO{

	/**
	 * 팀 생성을 위한 메서드
	 * @param team 팀을 생성 하기위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 */
	@Override
	public void insertTeam(TeamDTO team, SqlSession session) {
		// TODO Auto-generated method stub
		try {
			session.insert("insertTeam", team);
		}catch (Exception e) {
			e.printStackTrace();
			throw new InternalDataAccessException("DAO:insertTeam 예외발생",e);
		}
	}

	/**
	 * 팀 검색을 위한 메서드
	 * @param team 팀을 검색 하기위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 * @return 팀 목록 조회 처리 결과
	 */
	@Override
	public List<TeamDTO> selectTeam(TeamDTO team, SqlSession session) {
		List<TeamDTO> list = new ArrayList<>();

		try {
			list = session.selectList("selectTeam",team);
		}catch (Exception e) {
			throw new InternalDataAccessException("DAO:selectTeam 예외발생", e);
		}
		return list;
	}

	/**
	 * 비활성 팀 검색을 위한 메서드
	 * @param team 팀을 검색 하기위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 * @return 비활성 팀 목록 조회 처리 결과
	 */
	@Override
	public List<TeamDTO> selectDisableTeam(TeamDTO team, SqlSession session) {
		List<TeamDTO> list = new ArrayList<>();
		try {
			list = session.selectList("selectDisableTeam",team);
		}catch (Exception e) {
			throw new InternalDataAccessException("DAO:selectTeam 예외발생", e);
		}
		return list;
	}

	/**
	 * 팀 통계를 불러오기 위한 메서드
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 * @return 비활성 팀 목록 조회 처리 결과
	 */
	@Override
	public TeamAvgDTO teamStats(SqlSession session) {
		TeamAvgDTO team = new TeamAvgDTO();
		try {
			team = session.selectOne("selectStateTeam");
		}catch (Exception e) {
			throw new InternalDataAccessException("DAO:selectTeam 예외발생", e);
		}
		return team;
	}

	/**
	 * 팀 비활성화를 하기 위한 메서드
	 * @param team 팀을 비활성 하기위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 */
	@Override
	public void deleteTeam(TeamDTO team,SqlSession session) {

		try {
			session.update("deleteTeam",team);
		}catch (Exception e) {
			throw new InternalDataAccessException("DAO:selectTeam 예외발생", e);
		}
	}

	/**
	 * 팀 활성화를 하기 위한 메서드
	 * @param team 팀을 활성 하기위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 */
	@Override
	public void activateTeam(TeamDTO team, SqlSession session) {

		try {
			session.update("activateTeam",team);
		}catch (Exception e) {
			throw new InternalDataAccessException("DAO:selectTeam 예외발생", e);
		}
	}

	/**
	 * 현재 소속 팀을 조회 하기 위한 메서드
	 * @param team 팀을 활성 하기위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 * @return 회원의 팀 목록을 반환
	 */
	@Override
	public List<TeamDTO> selectMyTeam(TeamDTO team, SqlSession session) {
		List<TeamDTO> teamList = new ArrayList<>();
		try {
			teamList = session.selectList("selectMyTeam",team);
		}catch (Exception e) {
			throw new InternalDataAccessException("DAO:selectMyTeam 예외발생", e);
		}

		return teamList;
	}

	@Override
	public List<TeamDTO> teamselectAll(TeamDTO team, SqlSession session) {
		List<TeamDTO> teamList = new ArrayList<>();
		try {
			teamList = session.selectList("teamselectAll",team);
		}catch (Exception e) {
			throw new InternalDataAccessException("DAO:selectMyTeam 예외발생", e);
		}
		return teamList;
	}
}
