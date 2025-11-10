package com.groo.service;

import com.groo.model.ReportDTO;

public interface ReportService {
	public void insertReport(ReportDTO report);
	public ReportDTO memberSelectBeenCheck(ReportDTO report);
}
