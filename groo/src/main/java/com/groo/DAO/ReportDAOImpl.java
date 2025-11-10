package com.groo.DAO;

import org.apache.ibatis.session.SqlSession;

import com.groo.error.InternalDataAccessException;
import com.groo.model.ReportDTO;
/**
 *	신고에 대한 요청의 데이터 처리를 수행하기위한 클래스 구현체로 신고의 조회,추가,수정,삭제 관련 서비스를 처리함
 */
public class ReportDAOImpl implements ReportDAO {

	/**
	 * 유저의 신고를 저장하는 메서드
	 * @param 신고에 대한 정보를 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 */
	@Override
	public void insertReport(ReportDTO report, SqlSession session) {
		try {
			session.insert("insertReport", report);
		}catch (Exception e) {
			e.printStackTrace();
			throw new InternalDataAccessException();
		}
	}

	/**
	 * 로그인시에 유저의 정지현황을 확인하는 메서드
	 * @param 신고에 대한 정보를 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 * @return 정지 현황 확인
	 */
	@Override
	public ReportDTO memberSelectBeenCheck(ReportDTO report, SqlSession session) {
		ReportDTO reportList = new ReportDTO();
		try {
			reportList = session.selectOne("memberSelectBeenCheck", report);
		}catch (Exception e) {
			e.printStackTrace();
			throw new InternalDataAccessException();
		}
		return reportList;
	}
}
