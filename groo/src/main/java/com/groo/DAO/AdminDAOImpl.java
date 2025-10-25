package com.groo.DAO;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.groo.error.InternalDataAccessException;
import com.groo.model.AdminAvgReportDTO;
import com.groo.model.AdminReportDTO;
import com.groo.model.AdminStatsDTO;
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
	
	/**
	 * 회원정보 수정을 위한 메서드
	 * @param member 유저 정부 수정을 하기위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 * @return 유저 목록 조회 처리 결과
	 */
	@Override
	public void adminUpdateUser(MemberDTO member, SqlSession session) {
		
		try {
			session.update("adminUpdateUser",member);
		}catch (Exception e) {
			e.printStackTrace();
			throw new InternalDataAccessException("DAO:adminSelectAll 예외발생", e);
		}
	}
	
	/**
	 * 회원정보 수정을 위한 메서드
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 * @return 사용자 통계 조회 처리 결과
	 */
	@Override
	public AdminStatsDTO adminStatsUser(SqlSession session) {
		
		AdminStatsDTO member = new AdminStatsDTO();
		
		try {
			member = session.selectOne("adminAvgUser");
		}catch (Exception e) {
			e.printStackTrace();
			throw new InternalDataAccessException("DAO:adminSelectAll 예외발생", e);
		}
		
		return member;
	}
	
	/**
	 * 회원정보 검색을 위한 메서드
	 * @param member 유저 정보를 검색 하기위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 * @return 사용자 통계 조회 처리 결과
	 */
	@Override
	public List<MemberDTO> adminSelectSearchUser(MemberDTO member,SqlSession session) {
		/**
		 * 멤버 데이터 처리를 위한 Data Access Object
		 */
		List<MemberDTO> adminList = new ArrayList<>();

		try {
			adminList = session.selectList("adminSelectSearchUser", member);
		}catch (Exception e) {
			e.printStackTrace();
			throw new InternalDataAccessException("DAO:adminSelectAll 예외발생", e);
		}
		return adminList;
	}
	
	/**
	 * 신고정보 검색을 위한 메서드
	 * @param report 신고 정보를 검색 하기위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 * @return 신고 정보 조회 처리 결과
	 */
	@Override
	public List<AdminReportDTO> adminReportSerch(AdminReportDTO report, SqlSession session) {
		// TODO Auto-generated method stub
		
		List<AdminReportDTO> reportList = new ArrayList<>();
		
		try {
			reportList = session.selectList("adminReportSerch", report);
		}catch (Exception e) {
			e.printStackTrace();
			throw new InternalDataAccessException("DAO:adminReportSerch 예외발생",e);
		}
		return reportList;
	}
	
	/**
	 * 신고정보 통계 검색을 위한 메서드
	 * @param report 신고 정보를 검색 하기위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 * @return 신고 정보 조회 처리 결과
	 */
	@Override
	public AdminAvgReportDTO adminStatsReport(SqlSession session) {
		AdminAvgReportDTO report = new AdminAvgReportDTO();
		
		try {
			report = session.selectOne("adminAvgReport");
		}catch (Exception e) {
			e.printStackTrace();
			throw new InternalDataAccessException("DAO:adminStatsReport 예외발생",e);
		}
		return report;
	}
}
