package com.groo.model;

import lombok.Data;

@Data
public class AdminReportDTO {
	private String reportId;
	private String memReporter;
	private String memSuspect;
	private String reportBoard;
	private String reportContent;
	private String reportDate;
	private String actionContent;
	private String actionDate;
	private String endActionDate;
}
