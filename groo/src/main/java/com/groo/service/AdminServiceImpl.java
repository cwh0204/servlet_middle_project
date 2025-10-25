package com.groo.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.groo.DAO.AdminDAO;
import com.groo.DAO.AdminDAOImpl;
import com.groo.config.SessionFactory;
import com.groo.error.InternalDataAccessException;
import com.groo.error.InternalServiceException;
import com.groo.model.AdminAvgReportDTO;
import com.groo.model.AdminReportDTO;
import com.groo.model.AdminStatsDTO;
import com.groo.model.MemberDTO;

public class AdminServiceImpl implements AdminService {

	AdminDAO dao = new AdminDAOImpl();
	List<MemberDTO> memberlist = new ArrayList<>();

	/**
	 * 회원 목록을 조회하는 서비스 메서드입니다.
	 *
	 * @param member 유저의 검색정보를 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @return 유저목록 조회 처리 결과
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 */
	@Override
	public List<MemberDTO> adminSelectAll(MemberDTO member) {
		// MyBatis 세션 열기
		SqlSession session = SessionFactory.getSqlSession();
		try {
			memberlist = dao.adminSelectAll(member, session);
		} catch (InternalDataAccessException ide) {
			ide.printStackTrace();
			throw new InternalServiceException("DB 접근 오류로 인한 서비스 예외", ide);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalServiceException("예상치 못한 서비스 내부 오류", e);
		} finally {
			session.close();
		}
		return memberlist;
	}

	/**
	 * 회원가입을 하기전 Unique중복 식별 조회 서비스 메서드
	 *
	 * @param member 유저의 검색정보를 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @return 유저목록 조회 처리 결과
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 */
	@Override
	public List<MemberDTO> adminSelectUserInsertCheck(MemberDTO member) {

		SqlSession session = SessionFactory.getSqlSession();
		try {
			memberlist = dao.adminSelectUserInsertCheck(member, session);
		} catch (InternalDataAccessException ide) {
			ide.printStackTrace();
			throw new InternalServiceException("DB 접근 오류로 인한 서비스 예외", ide);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalServiceException("예상치 못한 서비스 내부 오류", e);
		} finally {
			session.close();
		}
		return memberlist;
	}
	/**
	 * 회원가입 서비스 메서드
	 *
	 * @param member 유저의 회원가입을 하기위한 Data Transfer Object 데이터 클래스
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 */
	@Override
	public void adminInsertUser(MemberDTO member) {
		// TODO Auto-generated method stub
		SqlSession session = SessionFactory.getSqlSession();
		try {
			dao.adminInsertUser(member, session);
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
	 * 회원정보수정 서비스 메서드
	 *
	 * @param member 유저의 회원가입을 하기위한 Data Transfer Object 데이터 클래스
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 */
	@Override
	public void adminUpdateUser(MemberDTO member) {
		// TODO Auto-generated method stub
		SqlSession session = SessionFactory.getSqlSession();
		try {
			dao.adminUpdateUser(member, session);
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
	 * 유저통계 서비스 메서드
	 *
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 * @return 유저통계 조회 처리 결과
	 */

	@Override
	public AdminStatsDTO adminStatsUser() {
		// TODO Auto-generated method stub
		SqlSession session = SessionFactory.getSqlSession();
		AdminStatsDTO member = new AdminStatsDTO();
		try {
			member = dao.adminStatsUser(session);
		} catch (InternalDataAccessException ide) {
			ide.printStackTrace();
			throw new InternalServiceException("DB 접근 오류로 인한 서비스 예외", ide);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalServiceException("예상치 못한 서비스 내부 오류", e);
		} finally {
			session.close();
		}
		return member;
	}
	/**
	 * 회원 목록을 조회(검색)하는 서비스 메서드입니다.
	 *
	 * @param member 유저의 검색정보를 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @return 유저목록 조회 처리 결과
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 */
	@Override
	public List<MemberDTO> adminSelectSearchUser(MemberDTO member) {
		// MyBatis 세션 열기
		SqlSession session = SessionFactory.getSqlSession();
		try {
			memberlist = dao.adminSelectSearchUser(member, session);
		} catch (InternalDataAccessException ide) {
			ide.printStackTrace();
			throw new InternalServiceException("DB 접근 오류로 인한 서비스 예외", ide);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalServiceException("예상치 못한 서비스 내부 오류", e);
		} finally {
			session.close();
		}
		return memberlist;
	}
	/**
	 * 신고 정보를 조회(검색)하는 서비스 메서드입니다.
	 *
	 * @param 신고 검색정보를 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @return 신고목록 조회 처리 결과
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 */
	@Override
	public List<AdminReportDTO> adminReportSerch(AdminReportDTO report) {
		
		SqlSession session = SessionFactory.getSqlSession();
		List<AdminReportDTO> reportList = new ArrayList<>();
		try {
			reportList = dao.adminReportSerch(report, session);
		} catch (InternalDataAccessException ide) {
			ide.printStackTrace();
			throw new InternalServiceException("DB 접근 오류로 인한 서비스 예외", ide);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalServiceException("예상치 못한 서비스 내부 오류", e);
		} finally {
			session.close();
		}
		return reportList;
	}
	/**
	 * 신고 정보 통계 조회하는 서비스 메서드입니다.
	 *
	 * @param 신고 통계정보를 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @return 신고통계 목록 처리 결과
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 */
	@Override
	public AdminAvgReportDTO adminStatsReport() {
		
		SqlSession session = SessionFactory.getSqlSession();
		AdminAvgReportDTO report = new AdminAvgReportDTO();
		
		try {
			report = dao.adminStatsReport(session);
		} catch (InternalDataAccessException ide) {
			ide.printStackTrace();
			throw new InternalServiceException("DB 접근 오류로 인한 서비스 예외", ide);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalServiceException("예상치 못한 서비스 내부 오류", e);
		} finally {
			session.close();
		}
		return report;
	}
	/**
	 * 신고 정보 통계 조회하는 서비스 메서드입니다.
	 *
	 * @param 신고완료 조회 목록을 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @return 신고완료 조회를 목록 처리 결과
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 */
	@Override
	public List<AdminReportDTO> adminReportProcessUserSerch(AdminReportDTO report) {
		SqlSession session = SessionFactory.getSqlSession();
		List<AdminReportDTO> reportList = new ArrayList<>();
		
		try {
			reportList = dao.adminReportProcessUserSerch(report,session);
		} catch (InternalDataAccessException ide) {
			ide.printStackTrace();
			throw new InternalServiceException("DB 접근 오류로 인한 서비스 예외", ide);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalServiceException("예상치 못한 서비스 내부 오류", e);
		} finally {
			session.close();
		}
		return reportList;
	}
}
