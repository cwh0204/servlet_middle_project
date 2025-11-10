package com.groo.service;

import org.apache.ibatis.session.SqlSession;

import com.groo.DAO.ReportDAO;
import com.groo.DAO.ReportDAOImpl;
import com.groo.config.SessionFactory;
import com.groo.error.InternalDataAccessException;
import com.groo.error.InternalServiceException;
import com.groo.model.ReportDTO;

public class ReportServiceImpl implements ReportService {

	ReportDAO dao = new ReportDAOImpl();

	/**
	 * 신고 등록 서비스 메서드입니다.
	 *
	 * @param 신고 정보를 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 */
	@Override
	public void insertReport(ReportDTO report) {
		SqlSession session = SessionFactory.getSqlSession();
		try {
			dao.insertReport(report, session);
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
	 * 유저의 정지 현황 체크 서비스 메서드입니다.
	 *
	 * @param 신고 정보를 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 * @return 유저의 벤 정보 조회
	 */
	@Override
	public ReportDTO memberSelectBeenCheck(ReportDTO report) {

		SqlSession session = SessionFactory.getSqlSession();
		ReportDTO reportList = new ReportDTO();

		try {
			reportList = dao.memberSelectBeenCheck(report, session);
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
