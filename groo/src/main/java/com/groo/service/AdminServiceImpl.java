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
import com.groo.model.AdminDashBoardDTO;
import com.groo.model.AdminRankDTO;
import com.groo.model.AdminReportDTO;
import com.groo.model.AdminStatsDTO;
import com.groo.model.AdminTeamMemberDTO;
import com.groo.model.BoardDTO;
import com.groo.model.ComentDTO;
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
	/**
	 * 팀원을 조회하는 서비스 메서드입니다.
	 * @param 팀원의 조회 목록을 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @return 팀원 조회를 목록 처리 결과
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 */
	@Override
	public List<AdminTeamMemberDTO> adminSelectStudyMember(AdminTeamMemberDTO member) {
		SqlSession session = SessionFactory.getSqlSession();
		List<AdminTeamMemberDTO> memberList = new ArrayList<>();

		try {
			memberList = dao.adminSelectStudyMember(member,session);
		} catch (InternalDataAccessException ide) {
			ide.printStackTrace();
			throw new InternalServiceException("DB 접근 오류로 인한 서비스 예외", ide);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalServiceException("예상치 못한 서비스 내부 오류", e);
		} finally {
			session.close();
		}
		return memberList;
	}
	/**
	 * 팀원을 비활성화하는 서비스 메서드입니다.
	 * @param 팀원의 비활성화를 하기위한 Data Transfer Object 데이터 클래스
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 */
	@Override
	public void adminStudyMemberDelete(AdminTeamMemberDTO member) {
		SqlSession session = SessionFactory.getSqlSession();
		try {
			dao.adminStudyMemberDelete(member,session);
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
	 * 신고내역에 대한 조치를 하는 서비스 메서드입니다.
	 * @param 신고내역에 대한 조치를 하기위한 Data Transfer Object 데이터 클래스
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 */
	@Override
	public void adminUpdateReport(AdminReportDTO report) {
		SqlSession session = SessionFactory.getSqlSession();
		try {
			dao.adminUpdateReport(report, session);
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
	 * 스터디의 팀원의 역활을 변경하는 서비스 메서드입니다.
	 * @param 스터디의 팀원의 역활을 변경 하기위한 Data Transfer Object 데이터 클래스
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 */
	@Override
	public void adminUpdateStudyRoll(AdminTeamMemberDTO member) {
		SqlSession session = SessionFactory.getSqlSession();
		try {
			dao.adminUpdateStudyRoll(member, session);
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
	 * 비활성화 스터디 목록을 조회하는 서비스 메서드입니다.
	 * @param 스터디의 팀원의 역활을 변경 하기위한 Data Transfer Object 데이터 클래스
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 * @return 비활성화 스터디 목록을 리턴
	 */
	@Override
	public List<AdminTeamMemberDTO> adminSelectDisableStudyMember(AdminTeamMemberDTO member) {
		SqlSession session = SessionFactory.getSqlSession();
		List<AdminTeamMemberDTO> memberList = new ArrayList<>();
		try {
			memberList = dao.adminSelectDisableStudyMember(member, session);
		} catch (InternalDataAccessException ide) {
			ide.printStackTrace();
			throw new InternalServiceException("DB 접근 오류로 인한 서비스 예외", ide);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalServiceException("예상치 못한 서비스 내부 오류", e);
		} finally {
			session.close();
		}
		return memberList;
	}
	
	/**
	 * 스터디 비활성화된 팀원을 활성화 시키는 서비스 메서드입니다.
	 * @param 스터디의 팀원을 활성화 하기위한 Data Transfer Object 데이터 클래스
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 */
	@Override
	public void adminUpdateStudyMemberActivate(AdminTeamMemberDTO member) {
		SqlSession session = SessionFactory.getSqlSession();
		try {
			dao.adminUpdateStudyMemberActivate(member, session);
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
	 * 게시글을 조회하는 서비스 메서드입니다.
	 * @param 게시글을 조회하기 위한 Data Transfer Object 데이터 클래스
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 * @return 게시글 정보를 리턴
	 */
	@Override
	public List<BoardDTO> adminSelectBoard(BoardDTO board) {
		
		SqlSession session = SessionFactory.getSqlSession();
		List<BoardDTO> boardList = new ArrayList<>();
		try {
			boardList = dao.adminSelectBoard(board, session);
		} catch (InternalDataAccessException ide) {
			ide.printStackTrace();
			throw new InternalServiceException("DB 접근 오류로 인한 서비스 예외", ide);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalServiceException("예상치 못한 서비스 내부 오류", e);
		} finally {
			session.close();
		}
		return boardList;
	}
	
	/**
	 * 게시글 활성화 or 비활성화 서비스 메서드입니다.
	 *
	 * @param board 페이지 정보를 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 */
	@Override
	public void adminDeleteBoard(BoardDTO board) {
		SqlSession session = SessionFactory.getSqlSession();
		try {
			dao.adminDeleteBoard(board, session);
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
	 * 게시글 통계 조회 서비스 메서드입니다.
	 *
	 * @param board 페이지 정보를 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 * @return 게시글 통계를 리턴
	 */
	@Override
	public AdminStatsDTO adminAvgBoard() {
		SqlSession session = SessionFactory.getSqlSession();
		AdminStatsDTO statsBoard = new AdminStatsDTO();
		try {
			statsBoard = dao.adminAvgBoard(session);
		} catch (InternalDataAccessException ide) {
			ide.printStackTrace();
			throw new InternalServiceException("DB 접근 오류로 인한 서비스 예외", ide);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalServiceException("예상치 못한 서비스 내부 오류", e);
		} finally {
			session.close();
		}
		return statsBoard;
	}
	/**
	 * 댓글 통계 조회 서비스 메서드입니다.
	 *
	 * @param board 페이지 정보를 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 * @return 댓글 조회 목록을 리턴
	 */
	@Override
	public List<ComentDTO> adminSelectComment(ComentDTO comment) {
		SqlSession session = SessionFactory.getSqlSession();
		List<ComentDTO> comentList = new ArrayList<>();
		try {
			comentList = dao.adminSelectComment(comment,session);
		} catch (InternalDataAccessException ide) {
			ide.printStackTrace();
			throw new InternalServiceException("DB 접근 오류로 인한 서비스 예외", ide);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalServiceException("예상치 못한 서비스 내부 오류", e);
		} finally {
			session.close();
		}
		return comentList;
	}
	
	/**
	 * 댓글 삭제 & 활성화 서비스 메서드입니다.
	 *
	 * @param coment 댓글 정보를 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 */
	@Override
	public void adminDeleteComment(ComentDTO coment) {
		SqlSession session = SessionFactory.getSqlSession();
		try {
			dao.adminDeleteComment(coment,session);
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
	 * 베스트 게시글 조회 서비스 메서드입니다.
	 *
	 * @param coment 댓글 정보를 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 * @return 베스트 게시글 목록 리턴
	 */
	@Override
	public List<AdminRankDTO> adminSelectRank(AdminRankDTO rank) {
		List<AdminRankDTO> rankList = new ArrayList<>();
		SqlSession session = SessionFactory.getSqlSession();
		try {
			rankList = dao.adminSelectRank(rank ,session);
		} catch (InternalDataAccessException ide) {
			ide.printStackTrace();
			throw new InternalServiceException("DB 접근 오류로 인한 서비스 예외", ide);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalServiceException("예상치 못한 서비스 내부 오류", e);
		} finally {
			session.close();
		}
		return rankList;
	}
	
	/**
	 * 스터디의 메달을 추가하는 서비스 메서드입니다.
	 * @param rank 스터디 정보를 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 */
	@Override
	public void adminUpdateStudyRank(AdminRankDTO rank) {
		SqlSession session = SessionFactory.getSqlSession();
		try {
			dao.adminUpdateStudyRank(rank ,session);
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
	 * 대시보드 통계를 조회 하는 서비스 메서드입니다.
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 * @return 대시보드 통계 리턴
	 */
	@Override
	public AdminDashBoardDTO adminSelectStatsDay() {
		SqlSession session = SessionFactory.getSqlSession();
		AdminDashBoardDTO board = new AdminDashBoardDTO();
		try {
			board = dao.adminSelectStatsDay(session);
		} catch (InternalDataAccessException ide) {
			ide.printStackTrace();
			throw new InternalServiceException("DB 접근 오류로 인한 서비스 예외", ide);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalServiceException("예상치 못한 서비스 내부 오류", e);
		} finally {
			session.close();
		}
		return board;
	}
	
	/**
	 * 대시보드 일별 게시글 등록 통계를 조회 하는 서비스 메서드입니다.
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 * @return 대시보드 통계 리턴
	 */
	@Override
	public List<AdminDashBoardDTO> adminSelectStatsPostDay() {
		SqlSession session = SessionFactory.getSqlSession();
		List<AdminDashBoardDTO> board = new ArrayList<>();
		try {
			board = dao.adminSelectStatsPostDay(session);
		} catch (InternalDataAccessException ide) {
			ide.printStackTrace();
			throw new InternalServiceException("DB 접근 오류로 인한 서비스 예외", ide);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalServiceException("예상치 못한 서비스 내부 오류", e);
		} finally {
			session.close();
		}
		return board;
	}
	
	/**
	 * 대시보드 팀별 카테고리통계를 조회 하는 서비스 메서드입니다.
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 * @return 대시보드 통계 리턴
	 */
	@Override
	public List<AdminDashBoardDTO> adminSelectStatsCategory() {
		SqlSession session = SessionFactory.getSqlSession();
		List<AdminDashBoardDTO> board = new ArrayList<>();
		try {
			board = dao.adminSelectStatsCategory(session);
		} catch (InternalDataAccessException ide) {
			ide.printStackTrace();
			throw new InternalServiceException("DB 접근 오류로 인한 서비스 예외", ide);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalServiceException("예상치 못한 서비스 내부 오류", e);
		} finally {
			session.close();
		}
		return board;
	}
	
	/**
	 * 대시보드 월별 가입자수 통계를 조회 하는 서비스 메서드입니다.
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 * @return 대시보드 통계 리턴
	 */
	@Override
	public List<AdminDashBoardDTO> adminSelectStatsSignUpMonth() {
		SqlSession session = SessionFactory.getSqlSession();
		List<AdminDashBoardDTO> board = new ArrayList<>();
		try {
			board = dao.adminSelectStatsSignUpMonth(session);
		} catch (InternalDataAccessException ide) {
			ide.printStackTrace();
			throw new InternalServiceException("DB 접근 오류로 인한 서비스 예외", ide);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalServiceException("예상치 못한 서비스 내부 오류", e);
		} finally {
			session.close();
		}
		return board;
	}
}
