package com.groo.DAO;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.groo.error.InternalDataAccessException;
import com.groo.model.MemberDTO;

/**
 * 관리자가 사용하는 요청의 데이터 처리를 수행하기위한 클래스 구현체로 맴버의 조회,추가,수정,삭제 관련 서비스를 처리함
 */
public class AdminDAOImpl implements AdminDAO {


	/**
	 * 회원 목록을 조회 메서드
	 * @param member 유저의 검색정보를 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 * @return 유저 목록 조회 처리 결과
	 */
	@Override
	public List<MemberDTO> adminSelectAll(MemberDTO member, SqlSession session) {
		/**
		 * 맴버 데이터 처리를 위한 Data Access Object
		 */
		List<MemberDTO> adminList = new ArrayList<>();
		try {
			adminList = session.selectList("adminSelectUserAll", member);
		}catch (Exception e) {
			e.printStackTrace();
			throw new InternalDataAccessException("DAO:adminSelectAll 예외발생", e);
		}
		return adminList;
	}

	/**
	 * 회원가입전 Unique확인용 조회 메서드
	 * @param member 유저의 검색 정보를 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 * @return 유저 목록 조회 처리 결과
	 */
	@Override
	public List<MemberDTO> adminSelectUserInsertCheck(MemberDTO member, SqlSession session) {
		/**
		 * 멤버 데이터 처리를 위한 Data Access Object
		 */
		List<MemberDTO> adminList = new ArrayList<>();

		try {
			adminList = session.selectList("adminSelectUserInsertCheck", member);

		}catch (Exception e) {
			e.printStackTrace();
			throw new InternalDataAccessException("DAO:adminSelectAll 예외발생", e);
		}
		return adminList;
	}
	/**
	 * 회원가입을 위한 메서드
	 * @param member 유저를 회원등록 하기위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 * @return 유저 목록 조회 처리 결과
	 */
	@Override
	public void adminInsertUser(MemberDTO member, SqlSession session) {
		
		try {
			session.insert("adminInsertUser",member);
		}catch (Exception e) {
			e.printStackTrace();
			throw new InternalDataAccessException("DAO:adminSelectAll 예외발생", e);
		}
	}

}
