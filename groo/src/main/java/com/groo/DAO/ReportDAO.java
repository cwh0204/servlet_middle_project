package com.groo.DAO;

import org.apache.ibatis.session.SqlSession;

import com.groo.model.ReportDTO;

public interface ReportDAO {
	public void insertReport(ReportDTO report, SqlSession session);
	public ReportDTO memberSelectBeenCheck(ReportDTO report, SqlSession session);
}
