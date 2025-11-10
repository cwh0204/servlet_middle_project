package com.groo.model;

import lombok.Data;

@Data
public class ReportDTO {

	private String reportId;
	private String memReporter;
	private String memSuspect;

	private String reportContent;
	private String reportDate;
	private String actionContent;
	private String actionDate;
	private String endActionDate;
	private String boardId;
	private String comentId;
	//검색
	private String reportBoard;
	//벤 검색
	private String beenCount;
	private String memLoginId;
}
